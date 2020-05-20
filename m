Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E1F1DAC9C
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 09:54:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbJY0-0004Ei-B0; Wed, 20 May 2020 07:53:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbJXy-0004Ed-Pz
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 07:53:50 +0000
X-Inumbo-ID: 0a86d896-9a6f-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a86d896-9a6f-11ea-9887-bc764e2007e4;
 Wed, 20 May 2020 07:53:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E3BC7ACED;
 Wed, 20 May 2020 07:53:51 +0000 (UTC)
Subject: [PATCH v3 1/3] x86: relax GDT check in arch_set_info_guest()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cbed3c45-3685-4bce-9719-93b1e8a2599a@suse.com>
Message-ID: <acbaead9-0f6c-3606-e809-57dafe9b3f01@suse.com>
Date: Wed, 20 May 2020 09:53:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <cbed3c45-3685-4bce-9719-93b1e8a2599a@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

It is wrong for us to check frames beyond the guest specified limit
(in the compat case another loop bound is already correct).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Move nr_gdt_frames range check earlier. Avoid |= where not really
    needed.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -840,6 +840,7 @@ int arch_set_info_guest(
 #ifdef CONFIG_PV
     mfn_t cr3_mfn;
     struct page_info *cr3_page = NULL;
+    unsigned int nr_gdt_frames;
     int rc = 0;
 #endif
 
@@ -957,6 +958,10 @@ int arch_set_info_guest(
     /* Ensure real hardware interrupts are enabled. */
     v->arch.user_regs.eflags |= X86_EFLAGS_IF;
 
+    nr_gdt_frames = DIV_ROUND_UP(c(gdt_ents), 512);
+    if ( nr_gdt_frames > ARRAY_SIZE(v->arch.pv.gdt_frames) )
+        return -EINVAL;
+
     if ( !v->is_initialised )
     {
         if ( !compat && !(flags & VGCF_in_kernel) && !c.nat->ctrlreg[1] )
@@ -988,9 +993,9 @@ int arch_set_info_guest(
             fail = compat_pfn_to_cr3(pfn) != c.cmp->ctrlreg[3];
         }
 
-        for ( i = 0; i < ARRAY_SIZE(v->arch.pv.gdt_frames); ++i )
-            fail |= v->arch.pv.gdt_frames[i] != c(gdt_frames[i]);
         fail |= v->arch.pv.gdt_ents != c(gdt_ents);
+        for ( i = 0; !fail && i < nr_gdt_frames; ++i )
+            fail = v->arch.pv.gdt_frames[i] != c(gdt_frames[i]);
 
         fail |= v->arch.pv.ldt_base != c(ldt_base);
         fail |= v->arch.pv.ldt_ents != c(ldt_ents);
@@ -1095,12 +1100,8 @@ int arch_set_info_guest(
     else
     {
         unsigned long gdt_frames[ARRAY_SIZE(v->arch.pv.gdt_frames)];
-        unsigned int nr_frames = DIV_ROUND_UP(c.cmp->gdt_ents, 512);
-
-        if ( nr_frames > ARRAY_SIZE(v->arch.pv.gdt_frames) )
-            return -EINVAL;
 
-        for ( i = 0; i < nr_frames; ++i )
+        for ( i = 0; i < nr_gdt_frames; ++i )
             gdt_frames[i] = c.cmp->gdt_frames[i];
 
         rc = (int)pv_set_gdt(v, gdt_frames, c.cmp->gdt_ents);


