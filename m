Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F32918760
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749277.1157387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVt-0008F3-7I; Wed, 26 Jun 2024 16:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749277.1157387; Wed, 26 Jun 2024 16:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVVt-00087q-0c; Wed, 26 Jun 2024 16:28:53 +0000
Received: by outflank-mailman (input) for mailman id 749277;
 Wed, 26 Jun 2024 16:28:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m54e=N4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sMVVq-0005pK-Iz
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:28:50 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ab9b7b4-33d9-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 18:28:49 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a727d9dd367so242573966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 09:28:49 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7291af7912sm42791866b.128.2024.06.26.09.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:28:47 -0700 (PDT)
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
X-Inumbo-ID: 2ab9b7b4-33d9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719419328; x=1720024128; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mOpjR7SSQuHGedpTmNTfhfxLjqgXd8qu6qzKi4f14A=;
        b=HdvfMN91FrBV6e5vYd4uDdyJztAfUvRkjt+yORg27afdWOwe1iNHeVYO11LFylImEv
         jV3xDTuf/ULppt2Xn96ROy8825ifEfMb2whcARFRc5JcEybk7eBGxIAUVWBoH7rFHW3o
         LJ83Ayb3gfsvjfkqdomYtKzlPDKSw7b2NETt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719419328; x=1720024128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mOpjR7SSQuHGedpTmNTfhfxLjqgXd8qu6qzKi4f14A=;
        b=s2n7bSOmRpfgiHYF30zqHl1+Dxb2A8KKyGiTQ3rk4PvET8hu3lmR4Qsr9VgP23te4/
         BrcQSk8E7zGMsf2exyHQmt1gzG2al+5MafkQ1x+ITjip7ZgWkyQiAyPQpDUvj3rpB+lv
         +1ArcXlCIOh2n/c1mcG+DqgZOwxRVmQJM0KfQT9qEx2NlJSaT/vnnx/AaI5qCrWsMzhc
         q6CQkAAU9s2oKVK/ES2B09BBBZy/wDqvX6Jwh7oNseyfv5dRXf3TbkeJEMOu5NKSYFtv
         jUVanrB/obYxj/ywijDOQyhMWftJjaOPQL7cmFULozyEzbXnTL2/J0s4cHGfylGm7Pg9
         h/dw==
X-Gm-Message-State: AOJu0YzbHqP1G7osr1mgH0B6KeU1+Lweq22tqivQOoIFN62SJyBiRG/h
	KqfvRT388FeOGp7SMIfSeC4Vggd66A5IZGO08+mPkmt2Q1iZcDp6wnkUWQq4mDOo4Xg1ZmsjVY5
	JvQ8=
X-Google-Smtp-Source: AGHT+IH94sPg3I7PP/MnzrejaBHaa0UZyvLZuA9p7IfIniwFctzAD8RaBLO7yuYZqAkfLY2FSC4lLA==
X-Received: by 2002:a17:907:a649:b0:a72:8135:2d4f with SMTP id a640c23a62f3a-a7281352e3cmr347847466b.48.1719419328384;
        Wed, 26 Jun 2024 09:28:48 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 09/10] xen/x86: Synthesise domain topologies
Date: Wed, 26 Jun 2024 17:28:36 +0100
Message-Id: <acfa4847e8f09a3206b7f88d37cfcc85cb143f17.1719416329.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719416329.git.alejandro.vallejo@cloud.com>
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose sensible topologies in leaf 0xb. At the moment it synthesises non-HT
systems, in line with the previous code intent.

Leaf 0xb in the host policy is no longer zapped and the guest {max,def} policies
have their topology leaves zapped instead. The intent is for toolstack to
populate them. There's no current use for the topology information in the host
policy, but it makes no harm.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
This patch MUST NOT go in without the following intimately related one
  "Set topologically correct x2APIC IDs for each vCPU"

Otherwise we expose one topology and then create APIC IDs that don't reflect it

v2->v4 (v3 was not reviewed):
  * Adjustments to the commit message
  * Various newline/linewrap fixes
  * Also print error code in new ERROR() message
  * Preserve old logic to recreate old CPUID policy to enable migrations from
    versions of Xen without policy information in the migration stream.
---
 tools/libs/guest/xg_cpuid_x86.c | 24 +++++++++++++++++++++++-
 xen/arch/x86/cpu-policy.c       |  9 ++++++---
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 4453178100ad..6062dcab01ce 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -725,8 +725,16 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         p->policy.basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
         p->policy.extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
     }
-    else
+    else if ( restore )
     {
+        /*
+         * Reconstruct the topology exposed on Xen <= 4.13. It makes very little
+         * sense, but it's what those guests saw so it's set in stone now.
+         *
+         * Guests from Xen 4.14 onwards carry their own CPUID leaves in the
+         * migration stream so they don't need special treatment.
+         */
+
         /*
          * Topology for HVM guests is entirely controlled by Xen.  For now, we
          * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
@@ -782,6 +790,20 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
             break;
         }
     }
+    else
+    {
+        /* TODO: Expose the ability to choose a custom topology for HVM/PVH */
+        unsigned int threads_per_core = 1;
+        unsigned int cores_per_pkg = di.max_vcpu_id + 1;
+
+        rc = x86_topo_from_parts(&p->policy, threads_per_core, cores_per_pkg);
+        if ( rc )
+        {
+            ERROR("Failed to generate topology: rc=%d t/c=%u c/p=%u",
+                  rc, threads_per_core, cores_per_pkg);
+            goto out;
+        }
+    }
 
     nr_leaves = ARRAY_SIZE(p->leaves);
     rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &nr_leaves);
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 304dc20cfab8..55a95f6e164c 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -263,9 +263,6 @@ static void recalculate_misc(struct cpu_policy *p)
 
     p->basic.raw[0x8] = EMPTY_LEAF;
 
-    /* TODO: Rework topology logic. */
-    memset(p->topo.raw, 0, sizeof(p->topo.raw));
-
     p->basic.raw[0xc] = EMPTY_LEAF;
 
     p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
@@ -613,6 +610,9 @@ static void __init calculate_pv_max_policy(void)
     recalculate_xstate(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
+
+    /* Wipe host topology. Populated by toolstack */
+    memset(p->topo.raw, 0, sizeof(p->topo.raw));
 }
 
 static void __init calculate_pv_def_policy(void)
@@ -776,6 +776,9 @@ static void __init calculate_hvm_max_policy(void)
 
     /* It's always possible to emulate CPUID faulting for HVM guests */
     p->platform_info.cpuid_faulting = true;
+
+    /* Wipe host topology. Populated by toolstack */
+    memset(p->topo.raw, 0, sizeof(p->topo.raw));
 }
 
 static void __init calculate_hvm_def_policy(void)
-- 
2.34.1


