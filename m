Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B0386C72C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 11:43:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686945.1069589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfdsd-0002Ak-SG; Thu, 29 Feb 2024 10:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686945.1069589; Thu, 29 Feb 2024 10:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfdsd-00028s-PR; Thu, 29 Feb 2024 10:43:11 +0000
Received: by outflank-mailman (input) for mailman id 686945;
 Thu, 29 Feb 2024 10:43:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPQN=KG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfdsc-00028m-FQ
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 10:43:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5392571d-d6ef-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 11:43:08 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a444205f764so62699466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 02:43:08 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 i8-20020a170906698800b00a43e8e76825sm551417ejr.149.2024.02.29.02.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 02:43:05 -0800 (PST)
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
X-Inumbo-ID: 5392571d-d6ef-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709203387; x=1709808187; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e+97K3Va0wILi/TEk43C6BEvjMMCdN17c8jlE9FRLRQ=;
        b=bNGXjVvYKTT1dEoRg+I1jILw8OXjZ/ay6mbMwfk4oAZnLBOgmHlcD+HEAcies2KeO6
         +AVhbsPdCTb980khCBNan51ZHzlsOejKJdjEpqnAq641v3QZQLFzXUKYnUC8MlIQnq0Q
         iEyi/B77YuqxdDrHNXFz5h39OW2KbI58tVSEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709203387; x=1709808187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+97K3Va0wILi/TEk43C6BEvjMMCdN17c8jlE9FRLRQ=;
        b=ap35cE5dMwgPLNZq+UkDd1U+RA5gdIL4TOsJhRX3pvqJHDJMJr90RlwWFuckl2+JLr
         24tuuYOpnnibaPMU42Q9kcWbN9BzaaDFnvE3GcRM6GXk/kLe5+LsQi2iUv6UGXkvFeIe
         SV2PECRGCAFo7MsoEMam0EvmXVpQ65GQDYLpaCA34Tv9EDaBrPFPheY3psthG0HrMg+r
         hIMZs5FYzebEBvMByOuCoyCD6q2tzDxRdboB/AcuDv4VYHJg/ogh2/GA7RzrBCnnImxE
         yPF+TpFROOqXN2Qj5s40Qe4/LroD1BQ/4MbsMcbDh675crn1JCsy1ADNIQeOddWpWQcE
         wDgA==
X-Gm-Message-State: AOJu0YzGai7f25vBhIZdW5Bre1ZYdAnoOeW5nbSnSdYkth7Pww+mDEpC
	VSXGHUtERxbkPwEuLWaUUH2E8QSbj1tEWJouIlhueFLbImPrVUtBzouaKYsWxzq9X9eA0/IydIs
	H
X-Google-Smtp-Source: AGHT+IHkUWf2Dj6ASdr/bVBK9V8FQhh8mjfGb7b58yDSpuaHu6tR9Oe3f9op0BTW12MJNBN/oPwXbA==
X-Received: by 2002:a17:906:d146:b0:a44:1e32:a503 with SMTP id br6-20020a170906d14600b00a441e32a503mr1162316ejb.22.1709203386741;
        Thu, 29 Feb 2024 02:43:06 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/cpu-policy: Fix x2APIC visibility for PV guests
Date: Thu, 29 Feb 2024 10:43:04 +0000
Message-Id: <20240229104304.2478614-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, the host x2APIC setting filters into the PV max and default
policies, yet PV guests cannot set MSR_APIC_BASE.EXTD or access any of the
x2APIC MSR range.  Therefore they absolutely shouldn't see the x2APIC bit.

Linux has workarounds for the collateral damage caused by this leakage; it
unconditionally filters out the x2APIC CPUID bit, and EXTD when reading
MSR_APIC_BASE.

Hide the x2APIC bit in the PV default policy, but for compatibility, tolerate
incoming VMs which already saw the bit.  This is logic from before the
default/max split in Xen 4.14 which wasn't correctly adjusted at the time.

Update the annotation from !A to !S which slightly better describes that it
doesn't really exist in PV guests.  HVM guests, for which x2APIC can be
emulated completely, already has it unconditionally set in the max policy.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This wants backporting as far as people can tollerate, but it's really not
obvious which commit in 4.14 should be referenced in a Fixes: tag.
---
 xen/arch/x86/cpu-policy.c                   | 19 +++++++++++++++++--
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 10079c26ae24..a0205672428d 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -534,6 +534,14 @@ static void __init calculate_pv_max_policy(void)
     *p = host_cpu_policy;
     x86_cpu_policy_to_featureset(p, fs);
 
+    /*
+     * Xen at the time of writing (Feb 2024, 4.19 dev cycle) used to leak the
+     * host x2APIC capability into PV guests, but never supported the guest
+     * trying to turn x2APIC mode on.  Tolerate an incoming VM which saw the
+     * x2APIC CPUID bit.
+     */
+    __set_bit(X86_FEATURE_X2APIC, fs);
+
     for ( i = 0; i < ARRAY_SIZE(fs); ++i )
         fs[i] &= pv_max_featuremask[i];
 
@@ -566,6 +574,14 @@ static void __init calculate_pv_def_policy(void)
     *p = pv_max_cpu_policy;
     x86_cpu_policy_to_featureset(p, fs);
 
+    /*
+     * PV guests have never been able to use x2APIC mode, but at the time of
+     * writing (Feb 2024, 4.19 dev cycle), the host value used to leak into
+     * guests.  Hide it by default so new guests don't get mislead into
+     * thinking that they can use x2APIC.
+     */
+    __clear_bit(X86_FEATURE_X2APIC, fs);
+
     for ( i = 0; i < ARRAY_SIZE(fs); ++i )
         fs[i] &= pv_def_featuremask[i];
 
@@ -830,11 +846,10 @@ void recalculate_cpuid_policy(struct domain *d)
     }
 
     /*
-     * Allow the toolstack to set HTT, X2APIC and CMP_LEGACY.  These bits
+     * Allow the toolstack to set HTT and CMP_LEGACY.  These bits
      * affect how to interpret topology information in other cpuid leaves.
      */
     __set_bit(X86_FEATURE_HTT, max_fs);
-    __set_bit(X86_FEATURE_X2APIC, max_fs);
     __set_bit(X86_FEATURE_CMP_LEGACY, max_fs);
 
     /*
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index be5c1b748e27..b230d3a6907d 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -123,7 +123,7 @@ XEN_CPUFEATURE(PCID,          1*32+17) /*H  Process Context ID */
 XEN_CPUFEATURE(DCA,           1*32+18) /*   Direct Cache Access */
 XEN_CPUFEATURE(SSE4_1,        1*32+19) /*A  Streaming SIMD Extensions 4.1 */
 XEN_CPUFEATURE(SSE4_2,        1*32+20) /*A  Streaming SIMD Extensions 4.2 */
-XEN_CPUFEATURE(X2APIC,        1*32+21) /*!A Extended xAPIC */
+XEN_CPUFEATURE(X2APIC,        1*32+21) /*!S Extended xAPIC */
 XEN_CPUFEATURE(MOVBE,         1*32+22) /*A  movbe instruction */
 XEN_CPUFEATURE(POPCNT,        1*32+23) /*A  POPCNT instruction */
 XEN_CPUFEATURE(TSC_DEADLINE,  1*32+24) /*S  TSC Deadline Timer */
-- 
2.30.2


