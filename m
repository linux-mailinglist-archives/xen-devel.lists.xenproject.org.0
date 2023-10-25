Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0027D7448
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623195.970846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZw-00035f-QL; Wed, 25 Oct 2023 19:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623195.970846; Wed, 25 Oct 2023 19:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZw-0002z1-Ki; Wed, 25 Oct 2023 19:30:08 +0000
Received: by outflank-mailman (input) for mailman id 623195;
 Wed, 25 Oct 2023 19:30:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZu-0001Lv-QN
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:06 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e57b829b-736c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 21:30:04 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53de8fc1ad8so125739a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:04 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:02 -0700 (PDT)
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
X-Inumbo-ID: e57b829b-736c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262203; x=1698867003; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1Lv8Yw58F48q3eNmw9Dda+FIyTyujQenPm38dLzmoQ=;
        b=MkFuINpOjD9EHnFuWeMLtREmTFjECrSY2XYdQLQOLF/rOSd4Kr+XwGMV3r5yCT1x+I
         xX3ms3OYzskEh12AEmdtcUj0rMR+PoqPcr2A1G06VSlw7xxVZY4KD39hP/0RzI/q0AIa
         pTxi0d+qSDC/peGzxcy7Aav9aZrG6RFwaoHBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262203; x=1698867003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1Lv8Yw58F48q3eNmw9Dda+FIyTyujQenPm38dLzmoQ=;
        b=rJD1y9OgP8O2DySqaCPxIANydo20s1HO0PmxwvLXB3jfHHKV4RQwfxlgIz77V/7FTb
         Ep7/O4wcclvoHKFZhoSKz1QPssxLBwaYew2A1Aje90gDF1c0VTFH49INMoIi6wL/AnSv
         tebODh0wjPCwOnyoTCsnZXWfonOD8C4QBBAZuvsKppTN8wM3Fs2bzAQyMdoaqk/RH/Dj
         A1Iw764XDj5hBBiiCiQTBAalNuH+9PMMG//l1EdrqUe3vAn+JDBuL42tNJvrOEH6g9Ez
         UYs8lP8ZFtz58zziBE9euZnGlXNFH/evvQvjqhKu0C/pTU2oFiYWya6i/yG27eM9ZBG9
         kUuw==
X-Gm-Message-State: AOJu0Yx2DVvqo17nQQZxylMEP0XpoXRTAzikLTVsD927BW+gfHrWvsq5
	gjuK3vDHvk7TeTsDlh0KLx8AKeRdJK0u1Hqmy7iLC01N
X-Google-Smtp-Source: AGHT+IHGzEYx9KPrJpe2wgirs12rAMrDEJsknJkIY+KW74IJxwwDN+8ayvuqYOxxJS/ybW9i/gXI5Q==
X-Received: by 2002:a17:907:6e8c:b0:9b2:765b:273b with SMTP id sh12-20020a1709076e8c00b009b2765b273bmr16344389ejc.70.1698262203374;
        Wed, 25 Oct 2023 12:30:03 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 07/22] x86/PMUv1: allow topdown slots arch perf event
Date: Wed, 25 Oct 2023 20:29:37 +0100
Message-Id: <f1fef9da51b4964a04a634d65797099a5e4efd47.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

This is part of 'Architectural Performance Monitoring Version 1'
and implemented on Icelake.

Backport: 4.13+

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/cpu/vpmu_intel.c | 1 +
 xen/arch/x86/cpuid.c          | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index ec9ab01fde..44a1ed5b10 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -645,6 +645,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
                 case 0x412e:	/* Last Level Cache Misses */
                 case 0x00c4:	/* Branch Instructions Retired */
                 case 0x00c5:	/* All Branch Mispredict Retired */
+                case 0x01a4:	/* Topdown Slots */
                     blocked = 0;
                     break;
                }
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index dfbcd1b3a4..51ee89afc4 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -328,7 +328,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
 
             if ( vpmu_features & (XENPMU_FEATURE_IPC_ONLY |
                                   XENPMU_FEATURE_ARCH_ONLY) ) {
-                unsigned limit = ( vpmu_features & XENPMU_FEATURE_ARCH_ONLY ) ? 7 : 3;
+                unsigned limit = ( vpmu_features & XENPMU_FEATURE_ARCH_ONLY ) ? 8 : 3;
                 if (limit < u.arch_nr) {
                     gdprintk(XENLOG_WARNING, "Limiting architectural PMU events to %d (actual %d)", limit, u.arch_nr);
                     u.arch_nr = limit;
-- 
2.41.0


