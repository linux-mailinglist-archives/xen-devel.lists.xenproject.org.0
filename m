Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A2C1DAC9D
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 09:54:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbJYO-0004Go-Ju; Wed, 20 May 2020 07:54:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbJYN-0004Gf-CS
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 07:54:15 +0000
X-Inumbo-ID: 193cb860-9a6f-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 193cb860-9a6f-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 07:54:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A9D38AC37;
 Wed, 20 May 2020 07:54:16 +0000 (UTC)
Subject: [PATCH v3 2/3] x86: relax LDT check in arch_set_info_guest()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cbed3c45-3685-4bce-9719-93b1e8a2599a@suse.com>
Message-ID: <802123c8-026d-ba84-5f0d-0faecd5a46a9@suse.com>
Date: Wed, 20 May 2020 09:54:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <cbed3c45-3685-4bce-9719-93b1e8a2599a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

It is wrong for us to check the base address when there's no LDT in the
first place. Once we don't do this check anymore we can also set the
base address to a non-canonical value when the LDT is empty.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v3: Re-base over changes to earlier patch.
v2: Set v->arch.pv.ldt_base to non-canonical for an empty LDT, plus
    related necessary adjustments.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -967,8 +967,10 @@ int arch_set_info_guest(
         if ( !compat && !(flags & VGCF_in_kernel) && !c.nat->ctrlreg[1] )
             return -EINVAL;
 
-        v->arch.pv.ldt_base = c(ldt_base);
         v->arch.pv.ldt_ents = c(ldt_ents);
+        v->arch.pv.ldt_base = v->arch.pv.ldt_ents
+                              ? c(ldt_base)
+                              : (unsigned long)ZERO_BLOCK_PTR;
     }
     else
     {
@@ -997,8 +999,9 @@ int arch_set_info_guest(
         for ( i = 0; !fail && i < nr_gdt_frames; ++i )
             fail = v->arch.pv.gdt_frames[i] != c(gdt_frames[i]);
 
-        fail |= v->arch.pv.ldt_base != c(ldt_base);
         fail |= v->arch.pv.ldt_ents != c(ldt_ents);
+        if ( v->arch.pv.ldt_ents )
+            fail |= v->arch.pv.ldt_base != c(ldt_base);
 
         if ( fail )
            return -EOPNOTSUPP;
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1583,7 +1583,7 @@ void arch_get_info_guest(struct vcpu *v,
     }
     else
     {
-        c(ldt_base = v->arch.pv.ldt_base);
+        c(ldt_base = v->arch.pv.ldt_ents ? v->arch.pv.ldt_base : 0);
         c(ldt_ents = v->arch.pv.ldt_ents);
         for ( i = 0; i < ARRAY_SIZE(v->arch.pv.gdt_frames); ++i )
             c(gdt_frames[i] = v->arch.pv.gdt_frames[i]);
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3669,14 +3669,15 @@ long do_mmuext_op(
         case MMUEXT_SET_LDT:
         {
             unsigned int ents = op.arg2.nr_ents;
-            unsigned long ptr = ents ? op.arg1.linear_addr : 0;
+            unsigned long ptr = ents ? op.arg1.linear_addr
+                                     : (unsigned long)ZERO_BLOCK_PTR;
 
             if ( unlikely(currd != pg_owner) )
                 rc = -EPERM;
             else if ( paging_mode_external(currd) )
                 rc = -EINVAL;
-            else if ( ((ptr & (PAGE_SIZE - 1)) != 0) || !__addr_ok(ptr) ||
-                      (ents > 8192) )
+            else if ( (ents > 8192) ||
+                      (ents && ((ptr & (PAGE_SIZE - 1)) || !__addr_ok(ptr))) )
             {
                 gdprintk(XENLOG_WARNING,
                          "Bad args to SET_LDT: ptr=%lx, ents=%x\n", ptr, ents);


