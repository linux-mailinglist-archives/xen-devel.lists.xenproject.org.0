Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F64A05FB6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867470.1278998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXis-0007Zv-Ic; Wed, 08 Jan 2025 15:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867470.1278998; Wed, 08 Jan 2025 15:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXis-0007XJ-EJ; Wed, 08 Jan 2025 15:11:54 +0000
Received: by outflank-mailman (input) for mailman id 867470;
 Wed, 08 Jan 2025 15:11:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVXiq-0007XB-TJ
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:11:52 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e394623a-cdd2-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 16:11:51 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso1472880766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:11:51 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2bb7e58f3sm42149466b.174.2025.01.08.07.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:11:50 -0800 (PST)
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
X-Inumbo-ID: e394623a-cdd2-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736349111; x=1736953911; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lURVxWW3sxjmXuCopSuRZQjY5IW3fE/Yrwa2ilZxWk8=;
        b=ZySm0s2amtbN6Ff4MFbDEtIAK2h2JXkacGMBJS2l4Qh5OnCSjeKKbzsp/eHq3/zZAY
         DQWavzCXsh+9aVrfsl2GgVW2cDEWJ8yQsc2YuZ+2h6ju6oRzyH0fG8y4FQCY7Jdr9LTy
         YopzcdWjxV5XIk3lWFFj9xFry7xnRgHWLhN/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349111; x=1736953911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lURVxWW3sxjmXuCopSuRZQjY5IW3fE/Yrwa2ilZxWk8=;
        b=kcLKMH/6ZoRumBZupkQbTRJ09mZQ9G/vrWkKWAFvxodtQcWiJ2aollzV9G8iqNENLH
         ApJETIJkJ1JhXhT6/kZYiPQCcOxi8Lc2xbHJJmvYTXiabGTpLtwKTXF06wViTf5WMFte
         owoKYerZxb/7rf5lAxpczWTt3fGiwOTOgEq2TLLd4RRpQR2x/Wyplrw7QgRNnvvwjOQI
         3ESTX9dzIwvYC5+vT3IfP6Tl66CgaSZK3eCcoPfkWZRewl1AfzYSv8GKJ1/H9nb3K7US
         G+eMb74FI4ze8xktizEccnLVt4LZN/1UDgPWwt9NLogXDY6AfsKPo5+dzsD2J7YAfOT/
         k7Pg==
X-Gm-Message-State: AOJu0YzwGuMVIQyjDeHdASaIrYd1SRMYIlknySgkQo/66H7EGyQU+7rw
	D/+uxZ4CjsLvJIOlxYALsLX6JhIRW2f8zJYb/cy47BXnhJtU7wjKQO8bjR9m3BlYa8Iptaoz6kS
	r
X-Gm-Gg: ASbGncv81dG0UMxdB5/YbQ17drsBchxthSke8R0vUFze23TXbqUDyD5N7599bLk1Sba
	Hyc6D4xuDtpOjOqSrub0q2SudhljYJjZncKCVM5PvXNibEliz1HMcve6RIA6nQ835JAKxGqAyUz
	wC3QU8z9J1D69PBPTRIPIYma56X+yytDlFuI0EUgbkSwaW8GghCmujs9XcatD/MEDXa3kqwThSn
	MFj8AS5sgXdqx9+Bdp9MGrLAAJ1jUj2iNP3OoQZ272PkigbgNgGbKNa+s3hlxjM9gM=
X-Google-Smtp-Source: AGHT+IH/QH6tQP0+01ilYuQx000TH6lj3g1C26Rsy/yv4jSJDh8Z7oqgomwsA5hllUw7ykLGYSk8NQ==
X-Received: by 2002:a17:907:3da3:b0:aa6:33cf:b389 with SMTP id a640c23a62f3a-ab2ab748baamr209199266b.34.1736349110971;
        Wed, 08 Jan 2025 07:11:50 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2.1 06/18] x86/pv: set/clear guest GDT mappings using {populate,destroy}_perdomain_mapping()
Date: Wed,  8 Jan 2025 16:11:33 +0100
Message-ID: <20250108151133.858-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-7-roger.pau@citrix.com>
References: <20250108142659.99490-7-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The pv_{set,destroy}_gdt() functions rely on the L1 table(s) that contain such
mappings being stashed in the domain structure, and thus such mappings being
modified by merely updating the L1 entries.

Switch both pv_{set,destroy}_gdt() to instead use
{populate,destory}_perdomain_mapping().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Do not change ordering setup of arch_set_info_guest().
---
 xen/arch/x86/pv/descriptor-tables.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index 02647a2c5047..5a79f022ce13 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -49,23 +49,20 @@ bool pv_destroy_ldt(struct vcpu *v)
 
 void pv_destroy_gdt(struct vcpu *v)
 {
-    l1_pgentry_t *pl1e = pv_gdt_ptes(v);
-    mfn_t zero_mfn = _mfn(virt_to_mfn(zero_page));
-    l1_pgentry_t zero_l1e = l1e_from_mfn(zero_mfn, __PAGE_HYPERVISOR_RO);
     unsigned int i;
 
     ASSERT(v == current || !vcpu_cpu_dirty(v));
 
-    v->arch.pv.gdt_ents = 0;
-    for ( i = 0; i < FIRST_RESERVED_GDT_PAGE; i++ )
-    {
-        mfn_t mfn = l1e_get_mfn(pl1e[i]);
+    if ( v->arch.cr3 )
+        destroy_perdomain_mapping(v, GDT_VIRT_START(v),
+                                  ARRAY_SIZE(v->arch.pv.gdt_frames));
 
-        if ( (l1e_get_flags(pl1e[i]) & _PAGE_PRESENT) &&
-             !mfn_eq(mfn, zero_mfn) )
-            put_page_and_type(mfn_to_page(mfn));
+    for ( i = 0; i < ARRAY_SIZE(v->arch.pv.gdt_frames); i++)
+    {
+        if ( !v->arch.pv.gdt_frames[i] )
+            break;
 
-        l1e_write(&pl1e[i], zero_l1e);
+        put_page_and_type(mfn_to_page(_mfn(v->arch.pv.gdt_frames[i])));
         v->arch.pv.gdt_frames[i] = 0;
     }
 }
@@ -74,8 +71,8 @@ int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
                unsigned int entries)
 {
     struct domain *d = v->domain;
-    l1_pgentry_t *pl1e;
     unsigned int i, nr_frames = DIV_ROUND_UP(entries, 512);
+    mfn_t mfns[ARRAY_SIZE(v->arch.pv.gdt_frames)];
 
     ASSERT(v == current || !vcpu_cpu_dirty(v));
 
@@ -90,6 +87,8 @@ int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
         if ( !mfn_valid(mfn) ||
              !get_page_and_type(mfn_to_page(mfn), d, PGT_seg_desc_page) )
             goto fail;
+
+        mfns[i] = mfn;
     }
 
     /* Tear down the old GDT. */
@@ -97,12 +96,9 @@ int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
 
     /* Install the new GDT. */
     v->arch.pv.gdt_ents = entries;
-    pl1e = pv_gdt_ptes(v);
     for ( i = 0; i < nr_frames; i++ )
-    {
         v->arch.pv.gdt_frames[i] = frames[i];
-        l1e_write(&pl1e[i], l1e_from_pfn(frames[i], __PAGE_HYPERVISOR_RW));
-    }
+    populate_perdomain_mapping(v, GDT_VIRT_START(v), mfns, nr_frames);
 
     return 0;
 
-- 
2.46.0


