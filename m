Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F202C0D82
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:31:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34483.65584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCsF-0000DC-Em; Mon, 23 Nov 2020 14:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34483.65584; Mon, 23 Nov 2020 14:31:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCsF-0000Cl-BR; Mon, 23 Nov 2020 14:31:23 +0000
Received: by outflank-mailman (input) for mailman id 34483;
 Mon, 23 Nov 2020 14:31:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCsD-0000Ce-T1
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:31:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24754e3a-a5a6-41cf-8762-b3a6221cee56;
 Mon, 23 Nov 2020 14:31:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EACAACD5;
 Mon, 23 Nov 2020 14:31:20 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCsD-0000Ce-T1
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:31:21 +0000
X-Inumbo-ID: 24754e3a-a5a6-41cf-8762-b3a6221cee56
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 24754e3a-a5a6-41cf-8762-b3a6221cee56;
	Mon, 23 Nov 2020 14:31:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606141880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IsGbx7nHAowOELB1I3S+0clwo01gLUbz8o/IEuZBhpE=;
	b=rwSZO9BPFZHHcFHWKBUzLbQPaBugEUg808iZMW88IY0qavsHxBEnfIvAMiZ2+btxdPkBCF
	RUBcemqpJHiZ3FwEEqKIC65HjJiEdnveeq+X4TLWmkZwURhovAPfdemP7HL0HKN1nfID/0
	W6v/VmD7k9T7/MtMlXdRkCALwfeLldA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2EACAACD5;
	Mon, 23 Nov 2020 14:31:20 +0000 (UTC)
Subject: [PATCH v2 09/17] x86: use xvmalloc() for extended context buffer
 allocations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Message-ID: <1e352dd9-016c-d15e-c1bb-64fb28df8b73@suse.com>
Date: Mon, 23 Nov 2020 15:31:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is in preparation for the buffer sizes exceeding a page's worth of
space, as will happen with AMX as well as Architectural LBR.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -30,6 +30,7 @@
 #include <xsm/xsm.h>
 #include <xen/iommu.h>
 #include <xen/vm_event.h>
+#include <xen/xvmalloc.h>
 #include <public/vm_event.h>
 #include <asm/mem_sharing.h>
 #include <asm/xstate.h>
@@ -331,7 +332,7 @@ long arch_do_domctl(
             goto sethvmcontext_out;
 
         ret = -ENOMEM;
-        if ( (c.data = xmalloc_bytes(c.size)) == NULL )
+        if ( (c.data = xvmalloc_bytes(c.size)) == NULL )
             goto sethvmcontext_out;
 
         ret = -EFAULT;
@@ -343,7 +344,7 @@ long arch_do_domctl(
         domain_unpause(d);
 
     sethvmcontext_out:
-        xfree(c.data);
+        xvfree(c.data);
         break;
     }
 
@@ -373,7 +374,7 @@ long arch_do_domctl(
 
         /* Allocate our own marshalling buffer */
         ret = -ENOMEM;
-        if ( (c.data = xmalloc_bytes(c.size)) == NULL )
+        if ( (c.data = xvmalloc_bytes(c.size)) == NULL )
             goto gethvmcontext_out;
 
         domain_pause(d);
@@ -386,7 +387,7 @@ long arch_do_domctl(
 
     gethvmcontext_out:
         copyback = true;
-        xfree(c.data);
+        xvfree(c.data);
         break;
     }
 
@@ -904,7 +905,7 @@ long arch_do_domctl(
             if ( !ret && size > PV_XSAVE_HDR_SIZE )
             {
                 unsigned int xsave_size = size - PV_XSAVE_HDR_SIZE;
-                void *xsave_area = xmalloc_bytes(xsave_size);
+                void *xsave_area = xvmalloc_bytes(xsave_size);
 
                 if ( !xsave_area )
                 {
@@ -918,7 +919,7 @@ long arch_do_domctl(
                 if ( copy_to_guest_offset(evc->buffer, offset, xsave_area,
                                           xsave_size) )
                      ret = -EFAULT;
-                xfree(xsave_area);
+                xvfree(xsave_area);
            }
 
             vcpu_unpause(v);
@@ -938,7 +939,7 @@ long arch_do_domctl(
                  evc->size > PV_XSAVE_SIZE(xfeature_mask) )
                 goto vcpuextstate_out;
 
-            receive_buf = xmalloc_bytes(evc->size);
+            receive_buf = xvmalloc_bytes(evc->size);
             if ( !receive_buf )
             {
                 ret = -ENOMEM;
@@ -948,7 +949,7 @@ long arch_do_domctl(
                                         offset, evc->size) )
             {
                 ret = -EFAULT;
-                xfree(receive_buf);
+                xvfree(receive_buf);
                 goto vcpuextstate_out;
             }
 
@@ -966,7 +967,7 @@ long arch_do_domctl(
                 ret = 0;
             if ( ret )
             {
-                xfree(receive_buf);
+                xvfree(receive_buf);
                 goto vcpuextstate_out;
             }
 
@@ -994,7 +995,7 @@ long arch_do_domctl(
                 vcpu_unpause(v);
             }
 
-            xfree(receive_buf);
+            xvfree(receive_buf);
         }
 
 #undef PV_XSAVE_HDR_SIZE
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -23,6 +23,7 @@
 #include <xen/guest_access.h>
 #include <xen/softirq.h>
 #include <xen/version.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/hvm/support.h>
 
@@ -154,7 +155,7 @@ int hvm_save_one(struct domain *d, unsig
     else
         v = d->vcpu[instance];
     ctxt.size = hvm_sr_handlers[typecode].size;
-    ctxt.data = xmalloc_bytes(ctxt.size);
+    ctxt.data = xvmalloc_bytes(ctxt.size);
     if ( !ctxt.data )
         return -ENOMEM;
 
@@ -200,7 +201,7 @@ int hvm_save_one(struct domain *d, unsig
     else
         domain_unpause(d);
 
-    xfree(ctxt.data);
+    xvfree(ctxt.data);
     return rv;
 }
 


