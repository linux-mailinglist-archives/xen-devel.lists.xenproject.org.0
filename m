Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 184237D7454
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623205.970924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja8-0005Ry-7o; Wed, 25 Oct 2023 19:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623205.970924; Wed, 25 Oct 2023 19:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvja7-0005Ei-2w; Wed, 25 Oct 2023 19:30:19 +0000
Received: by outflank-mailman (input) for mailman id 623205;
 Wed, 25 Oct 2023 19:30:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvja1-0001Lv-5R
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:13 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea0aa2ec-736c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 21:30:11 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9c75ceea588so19150266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:11 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:10 -0700 (PDT)
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
X-Inumbo-ID: ea0aa2ec-736c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262211; x=1698867011; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNVXTwATT/U7ZeWv6JLd9rx3MTxnLYLpL+s2D1g+Bxc=;
        b=ft9ZC6bJvD2onqxSZOO1t3iW5F57NHY9BEOk1EopiiMIlksqk51HgbrMwUu4AlwQPp
         fp6eEtVttWkbhufCBQFZBGJqpveCx3pEmntf+XgN7611htdw/2KBBwREWX6p3ZnHWaBO
         MRHCLb8KZJt8OwnMtl4tUznTHFLDFCOtJOL2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262211; x=1698867011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNVXTwATT/U7ZeWv6JLd9rx3MTxnLYLpL+s2D1g+Bxc=;
        b=Hk9Vr/bjeZi/5v/pvbKwfYjbglskIyY3NHxFE6r+56eLYBl+8aDQPMlEH9djzG2wDl
         Q4L0e8vMQuzWdGE9qBk7aWbrt2jW1K1XOFdOkV2j3vFu7vRlaX/x0oah2UKhgVYQjlB9
         EfGEPRck6UTGz5E/Jld7NO4du6Ivu2o3tNRCrsPFACbr1YXSPkPvXhkD06s1Cr+hn6pM
         95copJ24dbXVjlMzVHkvoqfY9l+QCsh8Ktrwqpjw77HmdhT/gR/rsRijsngSUQ2/QrrK
         Oc0GKqlI85HBunjNZJRdeAlBUKDh011rk4BZUhptjyZKr0pxD0NEVzBGbYJXW7a68iQo
         pDNA==
X-Gm-Message-State: AOJu0YyxSZIgJcjiRxozGx2X06OTg86AJVIxM70u52huR7sBZKyG/RNC
	3vwfYAQpxIpX9zYSbJySGVLLf37SoC24Qaa4svcUAQ==
X-Google-Smtp-Source: AGHT+IHZPaAqI5dIYhGEutHuI0UKgf8zTmT3qls1UH0sZReCZbarM7SWYWihEiRZ2iSymWXGSACL4A==
X-Received: by 2002:a17:906:da88:b0:9be:7de2:927c with SMTP id xh8-20020a170906da8800b009be7de2927cmr11982723ejb.70.1698262210978;
        Wed, 25 Oct 2023 12:30:10 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 16/22] x86/PMUv4: support LBR_Frz and CTR_Frz
Date: Wed, 25 Oct 2023 20:29:46 +0100
Message-Id: <b0d40a19feee66f509ebabfc84d9166affae8fd4.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

The behaviour is changed from Legacy to Streamlined for the LBR and
PERFMON freeze bits.
See "17.4.7 Freezing LBR and Performance Counters on PMI".

Instead of clearing the freeze bits through DEBUGCTL they are now
cleared through MSR 0x390 like everything else.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/cpu/vpmu_intel.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 82cd2656ea..923fe42a0b 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -952,6 +952,13 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
          */
         global_ovf_ctrl_mask &= ~(1ULL << 61);
 
+    if ( version >= 4)
+        /* On PMU version 4 bits 58 and 59 are defined in
+         * IA32_PERF_GLOBAL_STATUS_RESET (same MSR as IA32_PERF_GLOBAL_STATUS).
+         * Also allow clearing overflow for processor trace, even if we don't support it yet.
+         * */
+        global_ovf_ctrl_mask &= ~((3ULL << 58) | (1ULL << 55));
+
     regs_sz = (sizeof(struct xen_pmu_intel_ctxt) - regs_off) +
               sizeof(uint64_t) * fixed_pmc_cnt +
               sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt;
-- 
2.41.0


