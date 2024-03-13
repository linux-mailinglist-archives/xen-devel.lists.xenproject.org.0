Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE3187A78C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 13:28:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692404.1079513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkNin-0006FQ-W0; Wed, 13 Mar 2024 12:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692404.1079513; Wed, 13 Mar 2024 12:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkNin-0006BE-SW; Wed, 13 Mar 2024 12:28:37 +0000
Received: by outflank-mailman (input) for mailman id 692404;
 Wed, 13 Mar 2024 12:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5AcA=KT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rkNim-0005zY-34
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 12:28:36 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3509b218-e135-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 13:28:34 +0100 (CET)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-690d75c73f4so5508506d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 05:28:34 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 ne7-20020a056214424700b00690dbc390dcsm2283874qvb.89.2024.03.13.05.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 05:28:32 -0700 (PDT)
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
X-Inumbo-ID: 3509b218-e135-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710332912; x=1710937712; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNtvCvVKyRw4GXggSPhElrHebwhUc61/SMy+94lsSrg=;
        b=dHIjsfKcg8niSCouyr/rIMw2kLu9EY3SgnNfAI/8UJZ4Y9eAtHeCXtDv8Jg5CkyaJD
         Qk5VszEuBpCJunEd0ZPDrkihiLlY+q/Ya+zi9udgDIV41kS8mL97FzyhDmWV4sIShWOd
         YZXZeTsf9lFiYhHwLNOO9FPtYUP4NUrKKzarg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710332912; x=1710937712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNtvCvVKyRw4GXggSPhElrHebwhUc61/SMy+94lsSrg=;
        b=Qtz9EieZypo4Z5XiV9lOfAP3yuqwOypZ9deQHHtD+mnzoPCqmw3U0ISA7jFL6Jmqda
         Q7cTi1OsyyovJAwZ3BHorpNcI7o5RfGwG2BCGpZOyvgv4B5pJoCLHRZGQIQ/yNwDt3e2
         /3r/I+qcFr0ceHC9kN58JQLsslNc/gPdQ4gQ2eaMZHc+otlgET33uevh6tyEkJnvVbts
         qK++jcAZMm1Z614lSaz1xXdFZ83Dw0QRCnrfvDMa7pE/iZ4tSbZ7xGIIDZg8DFz93IW8
         puhFeXmfGBSrznsjlx0T8djz3H4oDdHJ1Fte77mEwGUVbxliLfjIzBweagPYlw2P/NiB
         CZgg==
X-Gm-Message-State: AOJu0YytvrMmfqVhkFNDgxIl0TrXnjDpSWrKYfjdXAVDehme4P+jwPyr
	AxKeIZ96etva1HdiNy83db0U8xP8/PJr1lluhseZ8oTgDOOlgKkKmwRVDCRl9hN8+O3Li13CV2H
	3
X-Google-Smtp-Source: AGHT+IF/KdWvuyDqVymLJAycdU5FsQxKLPPFfWzpL/H+tkCtimySwSD88mtlTNd7GStPiVdACuS6kQ==
X-Received: by 2002:a0c:c304:0:b0:691:1ca9:7e56 with SMTP id f4-20020a0cc304000000b006911ca97e56mr1344540qvi.0.1710332912693;
        Wed, 13 Mar 2024 05:28:32 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] nestedsvm: Disable TscRateMSR
Date: Wed, 13 Mar 2024 12:24:53 +0000
Message-Id: <20240313122454.965566-3-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240313122454.965566-1-george.dunlap@cloud.com>
References: <20240313122454.965566-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The primary purpose of TSC scaling, from our perspective, is to
maintain the fiction of an "invariant TSC" across migrates between
platforms with different clock speeds.

On AMD, the TscRateMSR CPUID bit is unconditionally enabled in the
"host cpuid", even if the hardware doesn't actually support it.
According to c/s fd14a1943c4 ("nestedsvm: Support TSC Rate MSR"),
testing showed that emulating TSC scaling in an L1 was more expensive
than emulating TSC scaling on an L0 (due to extra sets of vmexit /
vmenter).

However, the current implementation seems to be broken.

First of all, the final L2 scaling ratio should be a composition of
the L0 scaling ratio and the L1 scaling ratio; there's no indication
this is being done anywhere.

Secondly, it's not clear that the L1 tsc scaling ratio actually
affects the L0 tsc scaling ratio.  The stored value (ns_tscratio) is
used to affect the tsc *offset*, but doesn't seem to actually be
factored into d->hvm.tsc_scaling_ratio.  (Which shouldn't be
per-domain anyway, but per-vcpu.)  Having the *offset* scaled
according to the nested scaling without the actual RDTSC itself also
being scaled has got to produce inconsistent results.

For now, just disable the functionality entirely until we can
implement it properly:

- Don't set TSCRATEMSR in the host CPUID policy

- Remove MSR_AMD64_TSC_RATIO emulation handling, so that the guest
  guests a #GP if it tries to access them (as it should when
  TSCRATEMSR is clear)

- Remove ns_tscratio from struct nestedhvm, and all code that touches
  it

Unfortunately this means ripping out the scaling calculation stuff as
well, since it's only used in the nested case; it's there in the git
tree if we need it for reference when we re-introduce it.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
v2:
- Port over move to hvm_max_cpu_policy

CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu-policy.c                    |  3 +-
 xen/arch/x86/hvm/svm/nestedsvm.c             |  2 -
 xen/arch/x86/hvm/svm/svm.c                   | 57 --------------------
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h |  5 --
 4 files changed, 1 insertion(+), 66 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index bd047456eb..5952ff20e6 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -741,8 +741,7 @@ static void __init calculate_hvm_max_policy(void)
                                (1u << SVM_FEATURE_PAUSEFILTER) |
                                (1u << SVM_FEATURE_DECODEASSISTS));
         /* Enable features which are always emulated. */
-        p->extd.raw[0xa].d |= ((1u << SVM_FEATURE_VMCBCLEAN) |
-                               (1u << SVM_FEATURE_TSCRATEMSR));
+        p->extd.raw[0xa].d |= (1u << SVM_FEATURE_VMCBCLEAN);
     }
     
     guest_common_max_feature_adjustments(fs);
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index e4e01add8c..a5319ab729 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -146,8 +146,6 @@ int cf_check nsvm_vcpu_reset(struct vcpu *v)
     svm->ns_msr_hsavepa = INVALID_PADDR;
     svm->ns_ovvmcb_pa = INVALID_PADDR;
 
-    svm->ns_tscratio = DEFAULT_TSC_RATIO;
-
     svm->ns_cr_intercepts = 0;
     svm->ns_dr_intercepts = 0;
     svm->ns_exception_intercepts = 0;
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b551eac807..34b9f603bc 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -777,43 +777,6 @@ static int cf_check svm_get_guest_pat(struct vcpu *v, u64 *gpat)
     return 1;
 }
 
-static uint64_t scale_tsc(uint64_t host_tsc, uint64_t ratio)
-{
-    uint64_t mult, frac, scaled_host_tsc;
-
-    if ( ratio == DEFAULT_TSC_RATIO )
-        return host_tsc;
-
-    /*
-     * Suppose the most significant 32 bits of host_tsc and ratio are
-     * tsc_h and mult, and the least 32 bits of them are tsc_l and frac,
-     * then
-     *     host_tsc * ratio * 2^-32
-     *     = host_tsc * (mult * 2^32 + frac) * 2^-32
-     *     = host_tsc * mult + (tsc_h * 2^32 + tsc_l) * frac * 2^-32
-     *     = host_tsc * mult + tsc_h * frac + ((tsc_l * frac) >> 32)
-     *
-     * Multiplications in the last two terms are between 32-bit integers,
-     * so both of them can fit in 64-bit integers.
-     *
-     * Because mult is usually less than 10 in practice, it's very rare
-     * that host_tsc * mult can overflow a 64-bit integer.
-     */
-    mult = ratio >> 32;
-    frac = ratio & ((1ULL << 32) - 1);
-    scaled_host_tsc  = host_tsc * mult;
-    scaled_host_tsc += (host_tsc >> 32) * frac;
-    scaled_host_tsc += ((host_tsc & ((1ULL << 32) - 1)) * frac) >> 32;
-
-    return scaled_host_tsc;
-}
-
-static uint64_t svm_get_tsc_offset(uint64_t host_tsc, uint64_t guest_tsc,
-    uint64_t ratio)
-{
-    return guest_tsc - scale_tsc(host_tsc, ratio);
-}
-
 static void cf_check svm_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
@@ -832,18 +795,8 @@ static void cf_check svm_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
 
     if ( nestedhvm_vcpu_in_guestmode(v) )
     {
-        struct nestedsvm *svm = &vcpu_nestedsvm(v);
-
         n2_tsc_offset = vmcb_get_tsc_offset(n2vmcb) -
                         vmcb_get_tsc_offset(n1vmcb);
-        if ( svm->ns_tscratio != DEFAULT_TSC_RATIO )
-        {
-            uint64_t guest_tsc = hvm_get_guest_tsc_fixed(v, at_tsc);
-
-            n2_tsc_offset = svm_get_tsc_offset(guest_tsc,
-                                               guest_tsc + n2_tsc_offset,
-                                               svm->ns_tscratio);
-        }
         vmcb_set_tsc_offset(n1vmcb, offset);
     }
 
@@ -1921,10 +1874,6 @@ static int cf_check svm_msr_read_intercept(
         *msr_content = nsvm->ns_msr_hsavepa;
         break;
 
-    case MSR_AMD64_TSC_RATIO:
-        *msr_content = nsvm->ns_tscratio;
-        break;
-
     case MSR_AMD_OSVW_ID_LENGTH:
     case MSR_AMD_OSVW_STATUS:
         if ( !d->arch.cpuid->extd.osvw )
@@ -2103,12 +2052,6 @@ static int cf_check svm_msr_write_intercept(
             goto gpf;
         break;
 
-    case MSR_AMD64_TSC_RATIO:
-        if ( msr_content & TSC_RATIO_RSVD_BITS )
-            goto gpf;
-        nsvm->ns_tscratio = msr_content;
-        break;
-
     case MSR_IA32_MCx_MISC(4): /* Threshold register */
     case MSR_F10_MC4_MISC1 ... MSR_F10_MC4_MISC3:
         /*
diff --git a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
index 406fc082b1..45d658ad01 100644
--- a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
@@ -18,11 +18,6 @@ struct nestedsvm {
      */
     uint64_t ns_ovvmcb_pa;
 
-    /* virtual tscratio holding the value l1 guest writes to the
-     * MSR_AMD64_TSC_RATIO MSR.
-     */
-    uint64_t ns_tscratio;
-
     /* Cached real intercepts of the l2 guest */
     uint32_t ns_cr_intercepts;
     uint32_t ns_dr_intercepts;
-- 
2.25.1


