Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6211D2F63D3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:11:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67137.119581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04H7-0007dA-OI; Thu, 14 Jan 2021 15:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67137.119581; Thu, 14 Jan 2021 15:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04H7-0007cj-Ic; Thu, 14 Jan 2021 15:11:01 +0000
Received: by outflank-mailman (input) for mailman id 67137;
 Thu, 14 Jan 2021 15:11:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04H5-0007cO-Vo
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:11:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66e3cf29-7020-4e7f-bf55-8d31443ebe62;
 Thu, 14 Jan 2021 15:10:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA827AF32;
 Thu, 14 Jan 2021 15:10:57 +0000 (UTC)
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
X-Inumbo-ID: 66e3cf29-7020-4e7f-bf55-8d31443ebe62
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610637057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rpTHSP4+GtRKv4FD5nIq3ofhoqo1PuXI0zWp5W7JJ4A=;
	b=nH5VRD8RxCscsHdd/a3VnWRI1FdPd2bdx/3pgkUD/TUUDfk54w7E7fdf6PqUCq+Ylxa91V
	yKE9oB7UHdmnKnVl0tBcLanEEhhDaoiUAuhZQ8hjlf6zz0WYaLjt6A+jtfEUwg0X4wUfk4
	LE7oAVeyG0VLtCVk8jss0DRWmYoGN4w=
Subject: [PATCH 16/17] x86/shadow: only 4-level guest code needs building when
 !HVM
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Message-ID: <29ca8b9d-2f87-7c9c-4144-07bd8fd457da@suse.com>
Date: Thu, 14 Jan 2021 16:10:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In order to limit #ifdef-ary, provide "stub" #define-s for
SH_type_{l1,fl1,l2}_{32,pae}_shadow and SHF_{L1,FL1,L2}_{32,PAE}.

The change in shadow_vcpu_init() is necessary to cover for "x86: correct
is_pv_domain() when !CONFIG_PV" (or any other change along those lines)
- we should only rely on is_hvm_*() to become a build time constant.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -3,7 +3,7 @@ obj-$(CONFIG_HVM) += hap/
 
 obj-$(CONFIG_HVM) += altp2m.o
 obj-$(CONFIG_HVM) += guest_walk_2.o guest_walk_3.o guest_walk_4.o
-obj-$(CONFIG_SHADOW_PAGING) += guest_walk_2.o guest_walk_3.o guest_walk_4.o
+obj-$(CONFIG_SHADOW_PAGING) += guest_walk_4.o
 obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-y += mem_paging.o
 obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
--- a/xen/arch/x86/mm/shadow/Makefile
+++ b/xen/arch/x86/mm/shadow/Makefile
@@ -1,7 +1,7 @@
 ifeq ($(CONFIG_SHADOW_PAGING),y)
-obj-y += common.o guest_2.o guest_3.o guest_4.o set.o
-obj-$(CONFIG_HVM) += hvm.o
-obj-$(CONFIG_PV) += pv.o
+obj-y += common.o set.o
+obj-$(CONFIG_HVM) += hvm.o guest_2.o guest_3.o guest_4.o
+obj-$(CONFIG_PV) += pv.o guest_4.o
 else
 obj-y += none.o
 endif
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -90,9 +90,9 @@ void shadow_vcpu_init(struct vcpu *v)
     }
 #endif
 
-    v->arch.paging.mode = is_pv_vcpu(v) ?
-                          &SHADOW_INTERNAL_NAME(sh_paging_mode, 4) :
-                          &SHADOW_INTERNAL_NAME(sh_paging_mode, 3);
+    v->arch.paging.mode = is_hvm_vcpu(v) ?
+                          &SHADOW_INTERNAL_NAME(sh_paging_mode, 3) :
+                          &SHADOW_INTERNAL_NAME(sh_paging_mode, 4);
 }
 
 #if SHADOW_AUDIT
@@ -257,6 +257,7 @@ static int sh_remove_write_access_from_s
 
     switch ( mfn_to_page(smfn)->u.sh.type )
     {
+#ifdef CONFIG_HVM
     case SH_type_l1_32_shadow:
     case SH_type_fl1_32_shadow:
         return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 2)
@@ -266,6 +267,7 @@ static int sh_remove_write_access_from_s
     case SH_type_fl1_pae_shadow:
         return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 3)
             (d, gmfn, smfn, off);
+#endif
 
     case SH_type_l1_64_shadow:
     case SH_type_fl1_64_shadow:
@@ -848,6 +850,7 @@ sh_validate_guest_entry(struct vcpu *v,
  * the free pool.
  */
 
+#ifdef CONFIG_HVM
 const u8 sh_type_to_size[] = {
     1, /* SH_type_none           */
     2, /* SH_type_l1_32_shadow   */
@@ -866,6 +869,7 @@ const u8 sh_type_to_size[] = {
     1, /* SH_type_monitor_table  */
     1  /* SH_type_oos_snapshot   */
 };
+#endif
 
 /*
  * Figure out the least acceptable quantity of shadow memory.
@@ -892,12 +896,14 @@ void shadow_unhook_mappings(struct domai
     struct page_info *sp = mfn_to_page(smfn);
     switch ( sp->u.sh.type )
     {
+#ifdef CONFIG_HVM
     case SH_type_l2_32_shadow:
         SHADOW_INTERNAL_NAME(sh_unhook_32b_mappings, 2)(d, smfn, user_only);
         break;
     case SH_type_l2_pae_shadow:
         SHADOW_INTERNAL_NAME(sh_unhook_pae_mappings, 3)(d, smfn, user_only);
         break;
+#endif
     case SH_type_l4_64_shadow:
         SHADOW_INTERNAL_NAME(sh_unhook_64b_mappings, 4)(d, smfn, user_only);
         break;
@@ -1104,8 +1110,10 @@ mfn_t shadow_alloc(struct domain *d,
     /* Backpointers that are MFNs need to be packed into PDXs (PFNs don't) */
     switch (shadow_type)
     {
+#ifdef CONFIG_HVM
     case SH_type_fl1_32_shadow:
     case SH_type_fl1_pae_shadow:
+#endif
     case SH_type_fl1_64_shadow:
         break;
     default:
@@ -1739,6 +1747,7 @@ void sh_destroy_shadow(struct domain *d,
      * small numbers that the compiler will enjoy */
     switch ( t )
     {
+#ifdef CONFIG_HVM
     case SH_type_l1_32_shadow:
     case SH_type_fl1_32_shadow:
         SHADOW_INTERNAL_NAME(sh_destroy_l1_shadow, 2)(d, smfn);
@@ -1754,6 +1763,7 @@ void sh_destroy_shadow(struct domain *d,
     case SH_type_l2_pae_shadow:
         SHADOW_INTERNAL_NAME(sh_destroy_l2_shadow, 3)(d, smfn);
         break;
+#endif
 
     case SH_type_l1_64_shadow:
     case SH_type_fl1_64_shadow:
@@ -1804,12 +1814,14 @@ int sh_remove_write_access(struct domain
     /* Dispatch table for getting per-type functions */
     static const hash_domain_callback_t callbacks[SH_type_unused] = {
         NULL, /* none    */
+#ifdef CONFIG_HVM
         SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 2), /* l1_32   */
         SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 2), /* fl1_32  */
         NULL, /* l2_32   */
         SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 3), /* l1_pae  */
         SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 3), /* fl1_pae */
         NULL, /* l2_pae  */
+#endif
         SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 4), /* l1_64   */
         SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 4), /* fl1_64  */
         NULL, /* l2_64   */
@@ -2026,12 +2038,14 @@ int sh_remove_all_mappings(struct domain
     /* Dispatch table for getting per-type functions */
     static const hash_domain_callback_t callbacks[SH_type_unused] = {
         NULL, /* none    */
+#ifdef CONFIG_HVM
         SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 2), /* l1_32   */
         SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 2), /* fl1_32  */
         NULL, /* l2_32   */
         SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 3), /* l1_pae  */
         SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 3), /* fl1_pae */
         NULL, /* l2_pae  */
+#endif
         SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 4), /* l1_64   */
         SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 4), /* fl1_64  */
         NULL, /* l2_64   */
@@ -2122,6 +2136,7 @@ static int sh_remove_shadow_via_pointer(
     /* Blank the offending entry */
     switch (sp->u.sh.type)
     {
+#ifdef CONFIG_HVM
     case SH_type_l1_32_shadow:
     case SH_type_l2_32_shadow:
         SHADOW_INTERNAL_NAME(sh_clear_shadow_entry, 2)(d, vaddr, pmfn);
@@ -2130,6 +2145,7 @@ static int sh_remove_shadow_via_pointer(
     case SH_type_l2_pae_shadow:
         SHADOW_INTERNAL_NAME(sh_clear_shadow_entry, 3)(d, vaddr, pmfn);
         break;
+#endif
     case SH_type_l1_64_shadow:
     case SH_type_l2_64_shadow:
     case SH_type_l2h_64_shadow:
@@ -2166,12 +2182,14 @@ void sh_remove_shadows(struct domain *d,
      * be called with the function to remove a lower-level shadow. */
     static const hash_domain_callback_t callbacks[SH_type_unused] = {
         NULL, /* none    */
+#ifdef CONFIG_HVM
         NULL, /* l1_32   */
         NULL, /* fl1_32  */
         SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 2), /* l2_32   */
         NULL, /* l1_pae  */
         NULL, /* fl1_pae */
         SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 3), /* l2_pae  */
+#endif
         NULL, /* l1_64   */
         NULL, /* fl1_64  */
         SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 4), /* l2_64   */
@@ -2185,12 +2203,14 @@ void sh_remove_shadows(struct domain *d,
     /* Another lookup table, for choosing which mask to use */
     static const unsigned int masks[SH_type_unused] = {
         0, /* none    */
+#ifdef CONFIG_HVM
         SHF_L2_32, /* l1_32   */
         0, /* fl1_32  */
         0, /* l2_32   */
         SHF_L2_PAE, /* l1_pae  */
         0, /* fl1_pae */
         0, /* l2_pae  */
+#endif
         SHF_L2H_64 | SHF_L2_64, /* l1_64   */
         0, /* fl1_64  */
         SHF_L3_64, /* l2_64   */
@@ -2326,12 +2346,14 @@ void sh_reset_l3_up_pointers(struct vcpu
 {
     static const hash_vcpu_callback_t callbacks[SH_type_unused] = {
         NULL, /* none    */
+#ifdef CONFIG_HVM
         NULL, /* l1_32   */
         NULL, /* fl1_32  */
         NULL, /* l2_32   */
         NULL, /* l1_pae  */
         NULL, /* fl1_pae */
         NULL, /* l2_pae  */
+#endif
         NULL, /* l1_64   */
         NULL, /* fl1_64  */
         NULL, /* l2_64   */
@@ -3349,12 +3371,14 @@ void shadow_audit_tables(struct vcpu *v)
     static const hash_vcpu_callback_t callbacks[SH_type_unused] = {
         NULL, /* none    */
 #if SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES | SHADOW_AUDIT_ENTRIES_FULL)
+# ifdef CONFIG_HVM
         SHADOW_INTERNAL_NAME(sh_audit_l1_table, 2),  /* l1_32   */
         SHADOW_INTERNAL_NAME(sh_audit_fl1_table, 2), /* fl1_32  */
         SHADOW_INTERNAL_NAME(sh_audit_l2_table, 2),  /* l2_32   */
         SHADOW_INTERNAL_NAME(sh_audit_l1_table, 3),  /* l1_pae  */
         SHADOW_INTERNAL_NAME(sh_audit_fl1_table, 3), /* fl1_pae */
         SHADOW_INTERNAL_NAME(sh_audit_l2_table, 3),  /* l2_pae  */
+# endif
         SHADOW_INTERNAL_NAME(sh_audit_l1_table, 4),  /* l1_64   */
         SHADOW_INTERNAL_NAME(sh_audit_fl1_table, 4), /* fl1_64  */
         SHADOW_INTERNAL_NAME(sh_audit_l2_table, 4),  /* l2_64   */
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -171,6 +171,7 @@ extern void shadow_audit_tables(struct v
 /* Shadow type codes */
 #define SH_type_none           (0U) /* on the shadow free list */
 #define SH_type_min_shadow     (1U)
+#ifdef CONFIG_HVM
 #define SH_type_l1_32_shadow   (1U) /* shadowing a 32-bit L1 guest page */
 #define SH_type_fl1_32_shadow  (2U) /* L1 shadow for a 32b 4M superpage */
 #define SH_type_l2_32_shadow   (3U) /* shadowing a 32-bit L2 guest page */
@@ -188,6 +189,25 @@ extern void shadow_audit_tables(struct v
 #define SH_type_monitor_table (14U) /* in use as a monitor table */
 #define SH_type_oos_snapshot  (15U) /* in use as OOS snapshot */
 #define SH_type_unused        (16U)
+#else
+#define SH_type_l1_32_shadow   SH_type_unused
+#define SH_type_fl1_32_shadow  SH_type_unused
+#define SH_type_l2_32_shadow   SH_type_unused
+#define SH_type_l1_pae_shadow  SH_type_unused
+#define SH_type_fl1_pae_shadow SH_type_unused
+#define SH_type_l2_pae_shadow  SH_type_unused
+#define SH_type_l1_64_shadow   1U /* shadowing a 64-bit L1 page */
+#define SH_type_fl1_64_shadow  2U /* L1 shadow for 64-bit 2M superpg */
+#define SH_type_l2_64_shadow   3U /* shadowing a 64-bit L2 page */
+#define SH_type_l2h_64_shadow  4U /* shadowing a compat PAE L2 high page */
+#define SH_type_l3_64_shadow   5U /* shadowing a 64-bit L3 page */
+#define SH_type_l4_64_shadow   6U /* shadowing a 64-bit L4 page */
+#define SH_type_max_shadow     6U
+#define SH_type_p2m_table      7U /* in use as the p2m table */
+#define SH_type_monitor_table  8U /* in use as a monitor table */
+#define SH_type_oos_snapshot   9U /* in use as OOS snapshot */
+#define SH_type_unused        10U
+#endif
 
 /*
  * What counts as a pinnable shadow?
@@ -248,12 +268,21 @@ static inline void sh_terminate_list(str
     (((1u << (SH_type_max_shadow + 1u)) - 1u) - \
      ((1u << SH_type_min_shadow) - 1u))
 
+#ifdef CONFIG_HVM
 #define SHF_L1_32   (1u << SH_type_l1_32_shadow)
 #define SHF_FL1_32  (1u << SH_type_fl1_32_shadow)
 #define SHF_L2_32   (1u << SH_type_l2_32_shadow)
 #define SHF_L1_PAE  (1u << SH_type_l1_pae_shadow)
 #define SHF_FL1_PAE (1u << SH_type_fl1_pae_shadow)
 #define SHF_L2_PAE  (1u << SH_type_l2_pae_shadow)
+#else
+#define SHF_L1_32   0
+#define SHF_FL1_32  0
+#define SHF_L2_32   0
+#define SHF_L1_PAE  0
+#define SHF_FL1_PAE 0
+#define SHF_L2_PAE  0
+#endif
 #define SHF_L1_64   (1u << SH_type_l1_64_shadow)
 #define SHF_FL1_64  (1u << SH_type_fl1_64_shadow)
 #define SHF_L2_64   (1u << SH_type_l2_64_shadow)
@@ -329,8 +358,13 @@ extern const u8 sh_type_to_size[SH_type_
 static inline unsigned int
 shadow_size(unsigned int shadow_type)
 {
+#ifdef CONFIG_HVM
     ASSERT(shadow_type < ARRAY_SIZE(sh_type_to_size));
     return sh_type_to_size[shadow_type];
+#else
+    ASSERT(shadow_type < SH_type_unused);
+    return 1;
+#endif
 }
 
 /******************************************************************************
@@ -488,8 +522,10 @@ static inline unsigned long __backpointe
 {
     switch (sp->u.sh.type)
     {
+#ifdef CONFIG_HVM
     case SH_type_fl1_32_shadow:
     case SH_type_fl1_pae_shadow:
+#endif
     case SH_type_fl1_64_shadow:
         return sp->v.sh.back;
     }


