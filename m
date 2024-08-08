Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9AF94BEBB
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774200.1184717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3TB-00070R-Gq; Thu, 08 Aug 2024 13:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774200.1184717; Thu, 08 Aug 2024 13:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3TB-0006yo-Dz; Thu, 08 Aug 2024 13:46:21 +0000
Received: by outflank-mailman (input) for mailman id 774200;
 Thu, 08 Aug 2024 13:46:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc3Q3-0003nA-UJ
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:43:07 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24240415-558c-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 15:43:06 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5ba43b433beso1093387a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:43:06 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ecb551sm741537166b.223.2024.08.08.06.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 06:43:04 -0700 (PDT)
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
X-Inumbo-ID: 24240415-558c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723124585; x=1723729385; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLkjP1FzLasHJVmlNeLL5p62QH+uyeVmk8FwAqn+lRU=;
        b=IJhVdLVvKe0bLChglDPxRqZQiBCzxbLemY7fTxnfeYKuy8EM//MKflXDDkDOxfIZO6
         ASQ5c4nV3z+FFfUzlacmCOGeaV8tCbmUDVZBnGmJdt4CV4O2NtOASYT9x8+fAAjMyrou
         O7EDrzy8kQJYPwTXqSKVqdwp6XlG9OmLDdQaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124585; x=1723729385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLkjP1FzLasHJVmlNeLL5p62QH+uyeVmk8FwAqn+lRU=;
        b=UB74Fdp/mhbqKUlU5WgImGj67FsYJOHBhtviSnhonJ9y25o/ZhXESIamvv9dO9SZf+
         ISSkVcaZx77pAfb4iNJUX5hFD2F2GjjZjW2GEgYIPqNZT3JcG7o+voWnfq7D5uREWTIe
         2awBpdFSbagdTAGtHuLUNOHTV5HJxQ70V1kcniQDTtiP/jraaz7r0kOy+TRGWd6qbNo1
         uKdUHVSCi0NKQXlNNsUIrB1mEaDqo1ke17Nx+wW7GNGPAKmSw60tlp4nhDZmSBTp5R3B
         S8JNSJeX5M2vbH4VqBU681+E6Yl6+eo0aVJKHoJbsYLssym78nLkI1cZ2LDfRdaaRCay
         FrOQ==
X-Gm-Message-State: AOJu0YxXViY0gvfb8QIvEHFqJOkUy7bwLumT73Hl5Wpfew8jtPgJTJyb
	t0eX1GIZ4FKzrbGD9Jbd130jBmjK6lvd5MVFnwfgPdaMU7XRKKnFSogHfNgEwmRpyM3Q3a6fF+d
	z
X-Google-Smtp-Source: AGHT+IHJUmiffDhfpHY9GjAApf/PSjdJgigIHdEPZmUx93ym1jXMqIXrgzxNN+ImNmAYej/N95EpBw==
X-Received: by 2002:a17:907:3f24:b0:a7a:a4be:2f95 with SMTP id a640c23a62f3a-a8090c25b3bmr164379266b.5.1723124585508;
        Thu, 08 Aug 2024 06:43:05 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 10/10] xen/x86: Synthesise domain topologies
Date: Thu,  8 Aug 2024 14:42:50 +0100
Message-ID: <20240808134251.29995-11-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
References: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose sensible topologies in leaf 0xb. At the moment it synthesises
non-HT systems, in line with the previous code intent.

Leaf 0xb in the host policy is no longer zapped and the guest {max,def}
policies have their topology leaves zapped instead. The intent is for
toolstack to populate them. There's no current use for the topology
information in the host policy, but it makes no harm.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v5:
  * No change
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
2.45.2


