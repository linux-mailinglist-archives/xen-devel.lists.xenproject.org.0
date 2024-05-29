Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B968D3951
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732088.1137959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKMF-0001c9-Fn; Wed, 29 May 2024 14:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732088.1137959; Wed, 29 May 2024 14:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKMF-0001Sk-8f; Wed, 29 May 2024 14:32:51 +0000
Received: by outflank-mailman (input) for mailman id 732088;
 Wed, 29 May 2024 14:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygCr=NA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sCKMD-0000Tu-TP
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:32:49 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5223fbe6-1dc8-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 16:32:48 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a5a89787ea4so230993566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:32:48 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a647b827400sm74614166b.69.2024.05.29.07.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:32:47 -0700 (PDT)
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
X-Inumbo-ID: 5223fbe6-1dc8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716993167; x=1717597967; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5Itkas4jSxEAne1qNgyzUKuJE5iH1oRoQ5V5cxab3I=;
        b=D/p9ABnMHMSmnyXHpGToXGTmtf2KeovJ2ytBtWPyoo2zTjwIEBsq2hWbyWZ8CBAHMR
         dJLX/g4A1sOG2PnOiN8t8t7LC+7/x84sBBGHExzU7gZ0hdJEhR1rRWPpvsH3XeDe2GFa
         ZUAgKp3dVT+iJEKsjszcvCLOyAP8QyqcDiZwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993167; x=1717597967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5Itkas4jSxEAne1qNgyzUKuJE5iH1oRoQ5V5cxab3I=;
        b=Iq/cVy6TrMsAYHZVaWWJfgFX7ojptSDWOQ8xr6R4i0ZLutw+OMOkHTQkDGgM4zX8l+
         4/iZRAJocSFZ88JImsOJugMBxuzUKKd9axgXcBJEyYmfeG8jINAGVf6r6l4uHjMspgSx
         JZB4DERiogv4CnYqVh4Z/4GZY4PIlSkfMcANuVWI8MSO/Rns6aEjmNRUPEXWKsrxO80T
         RgL0kFQjI8d+90j9n5frW9MlOpZT9TA21jktuoJpxiBpsl6zIPPqP0o9FOuy8zrA5yQ4
         a8KnNMnb6NxXahXmBsrnE2EhYuZRkB+U6UPjyq6fpVVEj29MzcURRZUNuE3wbROV/I4I
         8X6w==
X-Gm-Message-State: AOJu0YyIa0375UDFQjWb+DV6GKKOCtjftuDY+lgAZgMBTgnjJhHAmxh3
	WLyDK4nXs3RxGp05lxKXhVc7fEtCim+KOW8BefXdtWjYp6iL7C6EnxJWnUE/Qu6WIpnSZwUfi1w
	c
X-Google-Smtp-Source: AGHT+IHPnuAu70v7eX7J2gWR++BS4a0v2Gol7RrzKimIuNA8uGHadRzfXiOzDpkwtstDZCJyuaoerg==
X-Received: by 2002:a17:906:3c4b:b0:a59:c52b:9933 with SMTP id a640c23a62f3a-a62643e0792mr936602766b.30.1716993167521;
        Wed, 29 May 2024 07:32:47 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 6/6] xen/x86: Synthesise domain topologies
Date: Wed, 29 May 2024 15:32:35 +0100
Message-Id: <b2d6a6e64c0a84ca272deffce952798a33b53097.1716976271.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716976271.git.alejandro.vallejo@cloud.com>
References: <cover.1716976271.git.alejandro.vallejo@cloud.com>
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
v3:
  * Formatting adjustments.
  * Restored previous topology logic and gated it through the "restore" variable
  * Print return code on topo generation failures.
  * Adjusted comment on wiping the topology in the guest policies.
  * Described the changes in topology zero-out in the commit message.
---
 tools/libs/guest/xg_cpuid_x86.c | 24 +++++++++++++++++++++++-
 xen/arch/x86/cpu-policy.c       |  9 ++++++---
 xen/lib/x86/policy.c            |  9 ++++++---
 3 files changed, 35 insertions(+), 7 deletions(-)

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
index b96f4ee55cc4..ecbe98302df2 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -278,9 +278,6 @@ static void recalculate_misc(struct cpu_policy *p)
 
     p->basic.raw[0x8] = EMPTY_LEAF;
 
-    /* TODO: Rework topology logic. */
-    memset(p->topo.raw, 0, sizeof(p->topo.raw));
-
     p->basic.raw[0xc] = EMPTY_LEAF;
 
     p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
@@ -628,6 +625,9 @@ static void __init calculate_pv_max_policy(void)
     recalculate_xstate(p);
 
     p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
+
+    /* Wipe host topology. Populated by toolstack */
+    memset(p->topo.raw, 0, sizeof(p->topo.raw));
 }
 
 static void __init calculate_pv_def_policy(void)
@@ -791,6 +791,9 @@ static void __init calculate_hvm_max_policy(void)
 
     /* It's always possible to emulate CPUID faulting for HVM guests */
     p->platform_info.cpuid_faulting = true;
+
+    /* Wipe host topology. Populated by toolstack */
+    memset(p->topo.raw, 0, sizeof(p->topo.raw));
 }
 
 static void __init calculate_hvm_def_policy(void)
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index 239386b71769..01b9ed39d597 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -2,7 +2,8 @@
 
 #include <xen/lib/x86/cpu-policy.h>
 
-static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p, size_t lvl)
+static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p,
+                                              size_t lvl)
 {
     /*
      * `nr_logical` reported by Intel is the number of THREADS contained in
@@ -17,10 +18,12 @@ static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p, size_t
     if ( p->x86_vendor != X86_VENDOR_INTEL || !lvl )
         return p->topo.subleaf[lvl].nr_logical;
 
-    return p->topo.subleaf[lvl].nr_logical / p->topo.subleaf[lvl - 1].nr_logical;
+    return p->topo.subleaf[lvl].nr_logical /
+           p->topo.subleaf[lvl - 1].nr_logical;
 }
 
-uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
+uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p,
+                                    uint32_t id)
 {
     uint32_t shift = 0, x2apic_id = 0;
 
-- 
2.34.1


