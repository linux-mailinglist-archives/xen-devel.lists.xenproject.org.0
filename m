Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DD3A05E99
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867320.1278831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4p-0006uo-73; Wed, 08 Jan 2025 14:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867320.1278831; Wed, 08 Jan 2025 14:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4o-0006qf-Vi; Wed, 08 Jan 2025 14:30:30 +0000
Received: by outflank-mailman (input) for mailman id 867320;
 Wed, 08 Jan 2025 14:30:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4n-0006o2-I1
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:29 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b838d56-cdcd-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 15:30:28 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so176150466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:28 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aaf49604224sm1297411366b.134.2025.01.08.06.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:27 -0800 (PST)
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
X-Inumbo-ID: 1b838d56-cdcd-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346628; x=1736951428; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atcw5DH/r9KNNaekhki+fCZDVGoHuGfx0DZg9mMghBA=;
        b=IzalejZAaPhsimSMOp2DDazRQziWep2vLQs4zI84lVhFZAnXknZEZrhRWOoTF4AXeE
         JULJq5o3LDM21S1PIwhnIdj7n+ry9tVR1BZIeCD+FnaEh0It0m2uh0HG1ZDJYfxl2ksT
         mBIjLuyP8VJ+DQoUYY07gSPDCMaxCg2sTfjps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346628; x=1736951428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atcw5DH/r9KNNaekhki+fCZDVGoHuGfx0DZg9mMghBA=;
        b=Cm0orTCt1wdW7Gi3rLrS+BlkkFWebNiwJjWqnb8KR8Z7fM+8mrxHE/EnCJFklmF2Z9
         BO/w6DLmQjYFxTkIpJQXZE8yOuBLJL2egxHDy9eBuA47P6BIkS0TZhN9gC5kd8wH/2nZ
         nn6vQiHzR6S0oETCiWtymA2W3gpaUUyFpBor48n8dlrvStXIjB0IpF9JRHJqGjU6haFT
         yKMTzNK7NukV3L8+6cdr4S4Q5SunuhAFcz8glNLdJva3vBxtxvhbmgACrkgdud/s2ZaW
         n1u9h3isq9BlyGunUEorEGXjIL3B3duA3C2IXGuogBpe7NbiVmwAmRzNVSdTvmDh5MZb
         ri6Q==
X-Gm-Message-State: AOJu0YypBa6Y3p3/Vx3PyeLQ+sYTtrVggUmggUmFQoFpCkW/6yNffdsc
	8aECmW+0gczQ8BGRVCnFqnO9xamCz1R7uOiipXbonBxNsauL+qFojL8uXtYj/NsveKrEZUjSAU8
	D
X-Gm-Gg: ASbGncunB0xmCFW5bpdT5+y94sLQkmcIqa6x49kvwtUWMPSp4FUd0USLqgSnaeVn0yo
	CsbVUVWTXbOCgonefl2oAHhgBmItvFmCZUm+xUVdkWMidISNPhROd4QVcObW34w89T1wYqZWDrW
	juk280TFN+0sJ+coyn5hGLfGJHT7v7DqGt+88OKKaXvpbBk7AQt1vN9LVPtGNRiITDwem43dvYi
	q/lSRR6dDUPmSVKFojpeu7EKSWUX+LG4q82gsMI0mcHZpo9WiuuE2omZo5Dk8hJlS4=
X-Google-Smtp-Source: AGHT+IFglshV4EJ4T7uTVluXsmbrkqOUMzkPSprRPmGKZ9SFO4vUkYx5xkPgo7GBLYV4MBEdRo6rkA==
X-Received: by 2002:a17:906:6a26:b0:aa6:743e:d621 with SMTP id a640c23a62f3a-ab29192c380mr591833866b.30.1736346627757;
        Wed, 08 Jan 2025 06:30:27 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 06/18] x86/pv: set/clear guest GDT mappings using {populate,destroy}_perdomain_mapping()
Date: Wed,  8 Jan 2025 15:26:46 +0100
Message-ID: <20250108142659.99490-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The pv_{set,destroy}_gdt() functions rely on the L1 table(s) that contain such
mappings being stashed in the domain structure, and thus such mappings being
modified by merely updating the L1 entries.

Switch both pv_{set,destroy}_gdt() to instead use
{populate,destory}_perdomain_mapping().

Note that this requires moving the pv_set_gdt() call in arch_set_info_guest()
strictly after update_cr3(), so v->arch.cr3 is valid when
populate_perdomain_mapping() is called.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c               | 33 ++++++++++++++---------------
 xen/arch/x86/pv/descriptor-tables.c | 28 +++++++++++-------------
 2 files changed, 28 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 0bd0ef7e40f4..0481164f3727 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1376,22 +1376,6 @@ int arch_set_info_guest(
     if ( rc )
         return rc;
 
-    if ( !compat )
-        rc = pv_set_gdt(v, c.nat->gdt_frames, c.nat->gdt_ents);
-#ifdef CONFIG_COMPAT
-    else
-    {
-        unsigned long gdt_frames[ARRAY_SIZE(v->arch.pv.gdt_frames)];
-
-        for ( i = 0; i < nr_gdt_frames; ++i )
-            gdt_frames[i] = c.cmp->gdt_frames[i];
-
-        rc = pv_set_gdt(v, gdt_frames, c.cmp->gdt_ents);
-    }
-#endif
-    if ( rc != 0 )
-        return rc;
-
     set_bit(_VPF_in_reset, &v->pause_flags);
 
 #ifdef CONFIG_COMPAT
@@ -1492,7 +1476,6 @@ int arch_set_info_guest(
     {
         if ( cr3_page )
             put_page(cr3_page);
-        pv_destroy_gdt(v);
         return rc;
     }
 
@@ -1508,6 +1491,22 @@ int arch_set_info_guest(
         paging_update_paging_modes(v);
     else
         update_cr3(v);
+
+    if ( !compat )
+        rc = pv_set_gdt(v, c.nat->gdt_frames, c.nat->gdt_ents);
+#ifdef CONFIG_COMPAT
+    else
+    {
+        unsigned long gdt_frames[ARRAY_SIZE(v->arch.pv.gdt_frames)];
+
+        for ( i = 0; i < nr_gdt_frames; ++i )
+            gdt_frames[i] = c.cmp->gdt_frames[i];
+
+        rc = pv_set_gdt(v, gdt_frames, c.cmp->gdt_ents);
+    }
+#endif
+    if ( rc != 0 )
+        return rc;
 #endif /* CONFIG_PV */
 
  out:
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


