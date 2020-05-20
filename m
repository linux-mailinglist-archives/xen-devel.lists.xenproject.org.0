Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF09A1DAC9E
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 09:54:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbJYo-0004Ke-Sx; Wed, 20 May 2020 07:54:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbJYm-0004KP-S6
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 07:54:40 +0000
X-Inumbo-ID: 2822b28a-9a6f-11ea-a9cc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2822b28a-9a6f-11ea-a9cc-12813bfff9fa;
 Wed, 20 May 2020 07:54:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7345DAC37;
 Wed, 20 May 2020 07:54:41 +0000 (UTC)
Subject: [PATCH v3 3/3] x86/PV: polish pv_set_gdt()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cbed3c45-3685-4bce-9719-93b1e8a2599a@suse.com>
Message-ID: <ceae9c78-d0be-c1eb-88fc-c036b050f668@suse.com>
Date: Wed, 20 May 2020 09:54:39 +0200
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

There's no need to invoke get_page_from_gfn(), and there's also no need
to update the passed in frames[]. Invoke get_page_and_type() directly.

Also make the function's frames[] parameter const, change its return
type to int, and drop the bogus casts from two of its invocations.

Finally a little bit of cosmetics.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1099,7 +1099,7 @@ int arch_set_info_guest(
         return rc;
 
     if ( !compat )
-        rc = (int)pv_set_gdt(v, c.nat->gdt_frames, c.nat->gdt_ents);
+        rc = pv_set_gdt(v, c.nat->gdt_frames, c.nat->gdt_ents);
     else
     {
         unsigned long gdt_frames[ARRAY_SIZE(v->arch.pv.gdt_frames)];
@@ -1107,7 +1107,7 @@ int arch_set_info_guest(
         for ( i = 0; i < nr_gdt_frames; ++i )
             gdt_frames[i] = c.cmp->gdt_frames[i];
 
-        rc = (int)pv_set_gdt(v, gdt_frames, c.cmp->gdt_ents);
+        rc = pv_set_gdt(v, gdt_frames, c.cmp->gdt_ents);
     }
     if ( rc != 0 )
         return rc;
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -81,7 +81,8 @@ void pv_destroy_gdt(struct vcpu *v)
     }
 }
 
-long pv_set_gdt(struct vcpu *v, unsigned long *frames, unsigned int entries)
+int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
+               unsigned int entries)
 {
     struct domain *d = v->domain;
     l1_pgentry_t *pl1e;
@@ -95,17 +96,11 @@ long pv_set_gdt(struct vcpu *v, unsigned
     /* Check the pages in the new GDT. */
     for ( i = 0; i < nr_frames; i++ )
     {
-        struct page_info *page;
+        mfn_t mfn = _mfn(frames[i]);
 
-        page = get_page_from_gfn(d, frames[i], NULL, P2M_ALLOC);
-        if ( !page )
+        if ( !mfn_valid(mfn) ||
+             !get_page_and_type(mfn_to_page(mfn), d, PGT_seg_desc_page) )
             goto fail;
-        if ( !get_page_type(page, PGT_seg_desc_page) )
-        {
-            put_page(page);
-            goto fail;
-        }
-        frames[i] = mfn_x(page_to_mfn(page));
     }
 
     /* Tear down the old GDT. */
@@ -124,9 +119,8 @@ long pv_set_gdt(struct vcpu *v, unsigned
 
  fail:
     while ( i-- > 0 )
-    {
         put_page_and_type(mfn_to_page(_mfn(frames[i])));
-    }
+
     return -EINVAL;
 }
 
--- a/xen/include/asm-x86/pv/mm.h
+++ b/xen/include/asm-x86/pv/mm.h
@@ -25,7 +25,8 @@
 
 int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs);
 
-long pv_set_gdt(struct vcpu *v, unsigned long *frames, unsigned int entries);
+int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
+               unsigned int entries);
 void pv_destroy_gdt(struct vcpu *v);
 
 bool pv_map_ldt_shadow_page(unsigned int off);
@@ -43,8 +44,8 @@ static inline int pv_ro_page_fault(unsig
     return 0;
 }
 
-static inline long pv_set_gdt(struct vcpu *v, unsigned long *frames,
-                              unsigned int entries)
+static inline int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
+                             unsigned int entries)
 { ASSERT_UNREACHABLE(); return -EINVAL; }
 static inline void pv_destroy_gdt(struct vcpu *v) { ASSERT_UNREACHABLE(); }
 


