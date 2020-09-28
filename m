Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FAD27AC29
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 12:44:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMqdi-0003AO-2l; Mon, 28 Sep 2020 10:44:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMqdg-0003AJ-Ug
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 10:44:12 +0000
X-Inumbo-ID: 53b49b73-b04c-48d0-9730-689be1898ccc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53b49b73-b04c-48d0-9730-689be1898ccc;
 Mon, 28 Sep 2020 10:44:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601289851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6o0DLxPL2zFTfmZExqlpwhWQ7/gvc4fAB1mduDmKKJI=;
 b=ZBktpqpiiqVX4OzOQHg4CTqZCF/XkFQFmDyDjpEePTpmp0Gt/1MeIzJenub930pHuy79Tk
 Cgkz4BBTu07Z1eLDcyI7c2IesWbs6dD7lr1iViKj00D/GREVt8Nza2ljCDtSnPm5NfUVuk
 Tc6xVlQGM42V4CU+xZOPyloh73vjogM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F22FAC54;
 Mon, 28 Sep 2020 10:44:11 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, "olekstysh@gmail.com" <olekstysh@gmail.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: refine when to send mapcache invalidation request to
 qemu
Message-ID: <f92f62bf-2f8d-34db-4be5-d3e6a4b9d580@suse.com>
Date: Mon, 28 Sep 2020 12:44:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

For one it was wrong to send the request only upon a completed
hypercall: Even if only part of it completed before getting preempted,
invalidation ought to occur. Therefore fold the two return statements.

And then XENMEM_decrease_reservation isn't the only means by which pages
can get removed from a guest, yet all removals ought to be signaled to
qemu. Put setting of the flag into the central p2m_remove_page()
underlying all respective hypercalls.

Plus finally there's no point sending the request for the local domain
when the domain acted upon is a different one. If anything that domain's
qemu's mapcache may need invalidating, but it's unclear how useful this
would be: That remote domain may not execute hypercalls at all, and
hence may never make it to the point where the request actually gets
issued. I guess the assumption is that such manipulation is not supposed
to happen anymore once the guest has been started?

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Putting the check in guest_physmap_remove_page() might also suffice,
but then a separate is_hvm_domain() would need adding again.

--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -31,7 +31,6 @@
 
 static long hvm_memory_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    const struct vcpu *curr = current;
     long rc;
 
     switch ( cmd & MEMOP_CMD_MASK )
@@ -41,14 +40,11 @@ static long hvm_memory_op(int cmd, XEN_G
         return -ENOSYS;
     }
 
-    if ( !curr->hcall_compat )
+    if ( !current->hcall_compat )
         rc = do_memory_op(cmd, arg);
     else
         rc = compat_memory_op(cmd, arg);
 
-    if ( (cmd & MEMOP_CMD_MASK) == XENMEM_decrease_reservation )
-        curr->domain->arch.hvm.qemu_mapcache_invalidate = true;
-
     return rc;
 }
 
@@ -326,14 +322,11 @@ int hvm_hypercall(struct cpu_user_regs *
 
     HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu -> %lx", eax, regs->rax);
 
-    if ( curr->hcall_preempted )
-        return HVM_HCALL_preempted;
-
     if ( unlikely(currd->arch.hvm.qemu_mapcache_invalidate) &&
          test_and_clear_bool(currd->arch.hvm.qemu_mapcache_invalidate) )
         send_invalidate_req();
 
-    return HVM_HCALL_completed;
+    return curr->hcall_preempted ? HVM_HCALL_preempted : HVM_HCALL_completed;
 }
 
 /*
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -812,6 +812,9 @@ p2m_remove_page(struct p2m_domain *p2m,
         }
     }
 
+    if ( p2m->domain == current->domain )
+        p2m->domain->arch.hvm.qemu_mapcache_invalidate = true;
+
     return p2m_set_entry(p2m, gfn, INVALID_MFN, page_order, p2m_invalid,
                          p2m->default_access);
 }

