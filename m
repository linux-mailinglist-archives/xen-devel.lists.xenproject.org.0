Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A512F63D1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:10:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67133.119569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Gc-0007Uw-C3; Thu, 14 Jan 2021 15:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67133.119569; Thu, 14 Jan 2021 15:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Gc-0007UV-8n; Thu, 14 Jan 2021 15:10:30 +0000
Received: by outflank-mailman (input) for mailman id 67133;
 Thu, 14 Jan 2021 15:10:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04Gb-0007UH-4A
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:10:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa11867b-a07b-45be-919c-0dec0ee1ddea;
 Thu, 14 Jan 2021 15:10:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0AEA1AE39;
 Thu, 14 Jan 2021 15:10:27 +0000 (UTC)
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
X-Inumbo-ID: fa11867b-a07b-45be-919c-0dec0ee1ddea
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610637027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTxUOjHkjgqt9u2tWnxjHnXhsv3BTAe8JS0YJA5Wtcs=;
	b=cnNtHwt760tXntaLkKVNtQ9AxYog5jRtajimjc3rlH9x3Ewky+yTQwFMNlA6fC5AZFpFrU
	8GW2ME0AVB7fPqCsYJe965ausks+1iVc35ltbJ4V8HoaAGVCdot/ZCFUST5awwc6zFpwoO
	hOsoYwEr/2tU+4bzq04++kPVy9YPDkU=
Subject: [PATCH 15/17] x86/shadow: drop SH_type_l2h_pae_shadow
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Message-ID: <c412bbe4-d555-7d36-997c-92274679d9ae@suse.com>
Date: Thu, 14 Jan 2021 16:10:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is a remnant from 32-bit days, having no place anymore where a
shadow of this type would be created.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
hash_{domain,vcpu}_foreach() have a use each of literal 15. It's not
clear to me what the proper replacement constant would be, as it
doesn't look as if SH_type_monitor_table was meant.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -792,9 +792,6 @@ sh_validate_guest_entry(struct vcpu *v,
     if ( page->shadow_flags & SHF_L2_PAE )
         result |= SHADOW_INTERNAL_NAME(sh_map_and_validate_gl2e, 3)
             (v, gmfn, entry, size);
-    if ( page->shadow_flags & SHF_L2H_PAE )
-        result |= SHADOW_INTERNAL_NAME(sh_map_and_validate_gl2he, 3)
-            (v, gmfn, entry, size);
 
     if ( page->shadow_flags & SHF_L1_64 )
         result |= SHADOW_INTERNAL_NAME(sh_map_and_validate_gl1e, 4)
@@ -859,7 +856,6 @@ const u8 sh_type_to_size[] = {
     1, /* SH_type_l1_pae_shadow  */
     1, /* SH_type_fl1_pae_shadow */
     1, /* SH_type_l2_pae_shadow  */
-    1, /* SH_type_l2h_pae_shadow */
     1, /* SH_type_l1_64_shadow   */
     1, /* SH_type_fl1_64_shadow  */
     1, /* SH_type_l2_64_shadow   */
@@ -900,7 +896,6 @@ void shadow_unhook_mappings(struct domai
         SHADOW_INTERNAL_NAME(sh_unhook_32b_mappings, 2)(d, smfn, user_only);
         break;
     case SH_type_l2_pae_shadow:
-    case SH_type_l2h_pae_shadow:
         SHADOW_INTERNAL_NAME(sh_unhook_pae_mappings, 3)(d, smfn, user_only);
         break;
     case SH_type_l4_64_shadow:
@@ -1757,7 +1752,6 @@ void sh_destroy_shadow(struct domain *d,
         SHADOW_INTERNAL_NAME(sh_destroy_l1_shadow, 3)(d, smfn);
         break;
     case SH_type_l2_pae_shadow:
-    case SH_type_l2h_pae_shadow:
         SHADOW_INTERNAL_NAME(sh_destroy_l2_shadow, 3)(d, smfn);
         break;
 
@@ -1816,7 +1810,6 @@ int sh_remove_write_access(struct domain
         SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 3), /* l1_pae  */
         SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 3), /* fl1_pae */
         NULL, /* l2_pae  */
-        NULL, /* l2h_pae */
         SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 4), /* l1_64   */
         SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 4), /* fl1_64  */
         NULL, /* l2_64   */
@@ -2039,7 +2032,6 @@ int sh_remove_all_mappings(struct domain
         SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 3), /* l1_pae  */
         SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 3), /* fl1_pae */
         NULL, /* l2_pae  */
-        NULL, /* l2h_pae */
         SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 4), /* l1_64   */
         SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 4), /* fl1_64  */
         NULL, /* l2_64   */
@@ -2136,7 +2128,6 @@ static int sh_remove_shadow_via_pointer(
         break;
     case SH_type_l1_pae_shadow:
     case SH_type_l2_pae_shadow:
-    case SH_type_l2h_pae_shadow:
         SHADOW_INTERNAL_NAME(sh_clear_shadow_entry, 3)(d, vaddr, pmfn);
         break;
     case SH_type_l1_64_shadow:
@@ -2181,7 +2172,6 @@ void sh_remove_shadows(struct domain *d,
         NULL, /* l1_pae  */
         NULL, /* fl1_pae */
         SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 3), /* l2_pae  */
-        SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 3), /* l2h_pae */
         NULL, /* l1_64   */
         NULL, /* fl1_64  */
         SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 4), /* l2_64   */
@@ -2198,10 +2188,9 @@ void sh_remove_shadows(struct domain *d,
         SHF_L2_32, /* l1_32   */
         0, /* fl1_32  */
         0, /* l2_32   */
-        SHF_L2H_PAE | SHF_L2_PAE, /* l1_pae  */
+        SHF_L2_PAE, /* l1_pae  */
         0, /* fl1_pae */
         0, /* l2_pae  */
-        0, /* l2h_pae  */
         SHF_L2H_64 | SHF_L2_64, /* l1_64   */
         0, /* fl1_64  */
         SHF_L3_64, /* l2_64   */
@@ -2261,7 +2250,6 @@ void sh_remove_shadows(struct domain *d,
 
     DO_UNSHADOW(SH_type_l2_32_shadow);
     DO_UNSHADOW(SH_type_l1_32_shadow);
-    DO_UNSHADOW(SH_type_l2h_pae_shadow);
     DO_UNSHADOW(SH_type_l2_pae_shadow);
     DO_UNSHADOW(SH_type_l1_pae_shadow);
     DO_UNSHADOW(SH_type_l4_64_shadow);
@@ -2344,7 +2332,6 @@ void sh_reset_l3_up_pointers(struct vcpu
         NULL, /* l1_pae  */
         NULL, /* fl1_pae */
         NULL, /* l2_pae  */
-        NULL, /* l2h_pae */
         NULL, /* l1_64   */
         NULL, /* fl1_64  */
         NULL, /* l2_64   */
@@ -3368,7 +3355,6 @@ void shadow_audit_tables(struct vcpu *v)
         SHADOW_INTERNAL_NAME(sh_audit_l1_table, 3),  /* l1_pae  */
         SHADOW_INTERNAL_NAME(sh_audit_fl1_table, 3), /* fl1_pae */
         SHADOW_INTERNAL_NAME(sh_audit_l2_table, 3),  /* l2_pae  */
-        SHADOW_INTERNAL_NAME(sh_audit_l2_table, 3),  /* l2h_pae */
         SHADOW_INTERNAL_NAME(sh_audit_l1_table, 4),  /* l1_64   */
         SHADOW_INTERNAL_NAME(sh_audit_fl1_table, 4), /* fl1_64  */
         SHADOW_INTERNAL_NAME(sh_audit_l2_table, 4),  /* l2_64   */
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -568,7 +568,7 @@ static inline void check_for_early_unsha
          && sh_mfn_is_a_page_table(gmfn)
          && (!d->arch.paging.shadow.pagetable_dying_op ||
              !(mfn_to_page(gmfn)->shadow_flags
-               & (SHF_L2_32|SHF_L2_PAE|SHF_L2H_PAE|SHF_L4_64))) )
+               & (SHF_L2_32|SHF_L2_PAE|SHF_L4_64))) )
     {
         perfc_incr(shadow_early_unshadow);
         sh_remove_shadows(d, gmfn, 1, 0 /* Fast, can fail to unshadow */ );
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -837,8 +837,7 @@ do {
     int _i;                                                                \
     shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                        \
     ASSERT(shadow_mode_external(_dom));                                    \
-    ASSERT(mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_pae_shadow        \
-           || mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2h_pae_shadow);  \
+    ASSERT(mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_pae_shadow);      \
     for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i++ )                 \
     {                                                                      \
         (_sl2e) = _sp + _i;                                                \
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -177,18 +177,17 @@ extern void shadow_audit_tables(struct v
 #define SH_type_l1_pae_shadow  (4U) /* shadowing a pae L1 page */
 #define SH_type_fl1_pae_shadow (5U) /* L1 shadow for pae 2M superpg */
 #define SH_type_l2_pae_shadow  (6U) /* shadowing a pae L2-low page */
-#define SH_type_l2h_pae_shadow (7U) /* shadowing a pae L2-high page */
-#define SH_type_l1_64_shadow   (8U) /* shadowing a 64-bit L1 page */
-#define SH_type_fl1_64_shadow  (9U) /* L1 shadow for 64-bit 2M superpg */
-#define SH_type_l2_64_shadow  (10U) /* shadowing a 64-bit L2 page */
-#define SH_type_l2h_64_shadow (11U) /* shadowing a compat PAE L2 high page */
-#define SH_type_l3_64_shadow  (12U) /* shadowing a 64-bit L3 page */
-#define SH_type_l4_64_shadow  (13U) /* shadowing a 64-bit L4 page */
-#define SH_type_max_shadow    (13U)
-#define SH_type_p2m_table     (14U) /* in use as the p2m table */
-#define SH_type_monitor_table (15U) /* in use as a monitor table */
-#define SH_type_oos_snapshot  (16U) /* in use as OOS snapshot */
-#define SH_type_unused        (17U)
+#define SH_type_l1_64_shadow   (7U) /* shadowing a 64-bit L1 page */
+#define SH_type_fl1_64_shadow  (8U) /* L1 shadow for 64-bit 2M superpg */
+#define SH_type_l2_64_shadow   (9U) /* shadowing a 64-bit L2 page */
+#define SH_type_l2h_64_shadow (10U) /* shadowing a compat PAE L2 high page */
+#define SH_type_l3_64_shadow  (11U) /* shadowing a 64-bit L3 page */
+#define SH_type_l4_64_shadow  (12U) /* shadowing a 64-bit L4 page */
+#define SH_type_max_shadow    (12U)
+#define SH_type_p2m_table     (13U) /* in use as the p2m table */
+#define SH_type_monitor_table (14U) /* in use as a monitor table */
+#define SH_type_oos_snapshot  (15U) /* in use as OOS snapshot */
+#define SH_type_unused        (16U)
 
 /*
  * What counts as a pinnable shadow?
@@ -200,7 +199,6 @@ static inline int sh_type_is_pinnable(st
      * persist even when not currently in use in a guest CR3 */
     if ( t == SH_type_l2_32_shadow
          || t == SH_type_l2_pae_shadow
-         || t == SH_type_l2h_pae_shadow
          || t == SH_type_l4_64_shadow )
         return 1;
 
@@ -256,7 +254,6 @@ static inline void sh_terminate_list(str
 #define SHF_L1_PAE  (1u << SH_type_l1_pae_shadow)
 #define SHF_FL1_PAE (1u << SH_type_fl1_pae_shadow)
 #define SHF_L2_PAE  (1u << SH_type_l2_pae_shadow)
-#define SHF_L2H_PAE (1u << SH_type_l2h_pae_shadow)
 #define SHF_L1_64   (1u << SH_type_l1_64_shadow)
 #define SHF_FL1_64  (1u << SH_type_fl1_64_shadow)
 #define SHF_L2_64   (1u << SH_type_l2_64_shadow)
@@ -265,7 +262,7 @@ static inline void sh_terminate_list(str
 #define SHF_L4_64   (1u << SH_type_l4_64_shadow)
 
 #define SHF_32  (SHF_L1_32|SHF_FL1_32|SHF_L2_32)
-#define SHF_PAE (SHF_L1_PAE|SHF_FL1_PAE|SHF_L2_PAE|SHF_L2H_PAE)
+#define SHF_PAE (SHF_L1_PAE|SHF_FL1_PAE|SHF_L2_PAE)
 #define SHF_64  (SHF_L1_64|SHF_FL1_64|SHF_L2_64|SHF_L2H_64|SHF_L3_64|SHF_L4_64)
 
 #define SHF_L1_ANY  (SHF_L1_32|SHF_L1_PAE|SHF_L1_64)


