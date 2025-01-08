Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74215A05EA5
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867323.1278859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4r-0007am-Is; Wed, 08 Jan 2025 14:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867323.1278859; Wed, 08 Jan 2025 14:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4r-0007VK-D7; Wed, 08 Jan 2025 14:30:33 +0000
Received: by outflank-mailman (input) for mailman id 867323;
 Wed, 08 Jan 2025 14:30:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4p-0005q4-S4
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:31 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c7f0dc5-cdcd-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 15:30:30 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa6c0d1833eso3513387966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:30 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e5029f8sm2482634666b.0.2025.01.08.06.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:28 -0800 (PST)
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
X-Inumbo-ID: 1c7f0dc5-cdcd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346629; x=1736951429; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/WczJNf+EXdjpOAIA1z4tpLjcOOHU7wqiQHBrWlxLM=;
        b=b8otjL9TKGUYeRmsnAQd5u3W+9BRpyFEUqLa9m1hc/9nH51zmmEUhoGoQ37KDePh1u
         ssplNPUJToEgOwtnOXLA/U7CIrnkMUniYXeldA5bjUOpX57Blr7SyMr1ZbEmzqDgh9dF
         QzJDLuJG04WR+/Ug1sxZ3kKvwt3LNg+yPkpyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346629; x=1736951429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/WczJNf+EXdjpOAIA1z4tpLjcOOHU7wqiQHBrWlxLM=;
        b=mo6M14iTz/4QmGxGKcha6t7d60s51QV18Un1A23vA0pV4Me+cqvnEVlVEPhZoO9Npk
         MlVxxvt2TE5YgA+BqLT7WtCTpyK3q9LhkrPIerety55qxA3Cd83gIllsSO6XuP4eN8za
         TWTgUOtv2ADAzvdCIHhR9jEFi82a+2LwaqwIvSMYZF6JuSNSvOnlaDpLFAhU0rcV1EMt
         8FrfMkxytoB+FTatnCvwy4PG4ptWpVxQeuqKdHzBcPPWNTHWZPomqogoxdReGEuxiEGo
         Sg57AuSHZgkr3WFJys4Ye9R0Il91gfVWAhOqwGDPSHkWzCcvrt5hkrDJLQEkW9caAkUx
         yjTQ==
X-Gm-Message-State: AOJu0Ywd2+CRs5GGxJd8KO0AM+msGvvOiWYU+4jaMYSY/lTr45WDdS8d
	FgMJBsutpZ0MocJ3uvfAJXyWaOUH084dE2VIfXO1TyunoHnQ81gEXhIhmROqNicuJ6t09NgOTHP
	d
X-Gm-Gg: ASbGncuD1xyLM6VS6wXzQgXhKsYx0n8otpxn5Ne1xZeDN/t1GSHnV/ZWXmwqLXyteUI
	26OwVJ9913ss7Gf4aohC1NjYtBLR7Gt/c+EZ+3kHg1NZW2IWH3r6UamkWCLqLlHnpXoqXSGT7vf
	OpIlLDxySJ3Kt4+ji3eP/+NsPsWViBJSxsyAGsOTahPkzyqNG1z5/+/LQqOV57Lip4tiMfRGLQp
	McX5hw5injCGRXMHtqPNAMnRAyu7sqkVdU0HNwI74/q5jGzvbNFNboBO17bdTd8UQc=
X-Google-Smtp-Source: AGHT+IGIvn0q5at3p77p8XfXsyt0e4XfVPi2p4jLiXnmckHaXVyXuT6UUXjW15nwisukNHSfjVnvrA==
X-Received: by 2002:a17:906:478f:b0:aab:dc3e:1c84 with SMTP id a640c23a62f3a-ab2ab703f93mr311889766b.17.1736346629032;
        Wed, 08 Jan 2025 06:30:29 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 07/18] x86/pv: update guest LDT mappings using the linear entries
Date: Wed,  8 Jan 2025 15:26:47 +0100
Message-ID: <20250108142659.99490-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The pv_map_ldt_shadow_page() and pv_destroy_ldt() functions rely on the L1
table(s) that contain such mappings being stashed in the domain structure, and
thus such mappings being modified by merely updating the require L1 entries.

Switch pv_map_ldt_shadow_page() to unconditionally use the linear recursive, as
that logic is always called while the vCPU is running on the current pCPU.

For pv_destroy_ldt() use the linear mappings if the vCPU is the one currently
running on the pCPU, otherwise use destroy_mappings().

Note this requires keeping an array with the pages currently mapped at the LDT
area, as that allows dropping the extra taken page reference when removing the
mappings.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/domain.h   |  2 ++
 xen/arch/x86/pv/descriptor-tables.c | 19 ++++++++++---------
 xen/arch/x86/pv/domain.c            |  4 ++++
 xen/arch/x86/pv/mm.c                |  3 ++-
 4 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b79d6badd71c..b659cffc7f81 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -523,6 +523,8 @@ struct pv_vcpu
     struct trap_info *trap_ctxt;
 
     unsigned long gdt_frames[FIRST_RESERVED_GDT_PAGE];
+    /* Max LDT entries is 8192, so 8192 * 8 = 64KiB (16 pages). */
+    mfn_t ldt_frames[16];
     unsigned long ldt_base;
     unsigned int gdt_ents, ldt_ents;
 
diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index 5a79f022ce13..95b598a4c0cf 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -20,28 +20,29 @@
  */
 bool pv_destroy_ldt(struct vcpu *v)
 {
-    l1_pgentry_t *pl1e;
+    const unsigned int nr_frames = ARRAY_SIZE(v->arch.pv.ldt_frames);
     unsigned int i, mappings_dropped = 0;
-    struct page_info *page;
 
     ASSERT(!in_irq());
 
     ASSERT(v == current || !vcpu_cpu_dirty(v));
 
-    pl1e = pv_ldt_ptes(v);
+    destroy_perdomain_mapping(v, LDT_VIRT_START(v), nr_frames);
 
-    for ( i = 0; i < 16; i++ )
+    for ( i = 0; i < nr_frames; i++ )
     {
-        if ( !(l1e_get_flags(pl1e[i]) & _PAGE_PRESENT) )
-            continue;
+        mfn_t mfn = v->arch.pv.ldt_frames[i];
+        struct page_info *page;
 
-        page = l1e_get_page(pl1e[i]);
-        l1e_write(&pl1e[i], l1e_empty());
-        mappings_dropped++;
+        if ( mfn_eq(mfn, INVALID_MFN) )
+            continue;
 
+        v->arch.pv.ldt_frames[i] = INVALID_MFN;
+        page = mfn_to_page(mfn);
         ASSERT_PAGE_IS_TYPE(page, PGT_seg_desc_page);
         ASSERT_PAGE_IS_DOMAIN(page, v->domain);
         put_page_and_type(page);
+        mappings_dropped++;
     }
 
     return mappings_dropped;
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 7e8bffaae9a0..32d7488cc186 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -303,6 +303,7 @@ void pv_vcpu_destroy(struct vcpu *v)
 int pv_vcpu_initialise(struct vcpu *v)
 {
     struct domain *d = v->domain;
+    unsigned int i;
     int rc;
 
     ASSERT(!is_idle_domain(d));
@@ -311,6 +312,9 @@ int pv_vcpu_initialise(struct vcpu *v)
     if ( rc )
         return rc;
 
+    for ( i = 0; i < ARRAY_SIZE(v->arch.pv.ldt_frames); i++ )
+        v->arch.pv.ldt_frames[i] = INVALID_MFN;
+
     BUILD_BUG_ON(X86_NR_VECTORS * sizeof(*v->arch.pv.trap_ctxt) >
                  PAGE_SIZE);
     v->arch.pv.trap_ctxt = xzalloc_array(struct trap_info, X86_NR_VECTORS);
diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
index 187f5f6a3e8c..4853e619f2a7 100644
--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -86,7 +86,8 @@ bool pv_map_ldt_shadow_page(unsigned int offset)
         return false;
     }
 
-    pl1e = &pv_ldt_ptes(curr)[offset >> PAGE_SHIFT];
+    curr->arch.pv.ldt_frames[offset >> PAGE_SHIFT] = page_to_mfn(page);
+    pl1e = &__linear_l1_table[l1_linear_offset(LDT_VIRT_START(curr) + offset)];
     l1e_add_flags(gl1e, _PAGE_RW);
 
     l1e_write(pl1e, gl1e);
-- 
2.46.0


