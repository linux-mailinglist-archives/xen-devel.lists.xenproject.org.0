Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAA1841F03
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 10:14:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673241.1047537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkC4-00052x-8p; Tue, 30 Jan 2024 09:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673241.1047537; Tue, 30 Jan 2024 09:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkC4-0004zB-11; Tue, 30 Jan 2024 09:14:12 +0000
Received: by outflank-mailman (input) for mailman id 673241;
 Tue, 30 Jan 2024 09:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUgQ=JI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rUkC2-0004AP-DC
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 09:14:10 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed393177-bf4f-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 10:14:09 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51117bfd452so1439764e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 01:14:09 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c190a00b0040ed49605a0sm13822928wmq.47.2024.01.30.01.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 01:14:08 -0800 (PST)
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
X-Inumbo-ID: ed393177-bf4f-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706606049; x=1707210849; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wG3Bmb4l/y398tdhK+NXGZhsbCood6uPoYoVyQV7KmU=;
        b=sQNXVoVUGtuMFgUdsX1rfqdGOouSo7IJhgDcPWf1IpFlxEALUAKGKLNrj1DxO9SihA
         JLbk1LTL8AD2xo4unnBsztBDN/cd1IWM/4GqJ37bwPFtvj3bCE8w1AQAajAFJgZj04pC
         dnNIxaQ26tZYixUmZx711UOvIDQ6pevqRxYFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706606049; x=1707210849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wG3Bmb4l/y398tdhK+NXGZhsbCood6uPoYoVyQV7KmU=;
        b=eTfCxRUC5aZ5FRqzYhUt2ZLh2c8ggIkYjtMtgf/lXUtwVIWEpizoIGb772IQpMN4To
         scgr9VQOkK7S03aWik/gqdf883qDrZPq230yeyUNwzqB/t3LtLL/wGKH+kEMV6moih+Q
         yXnHh6x1zP1+H+UN14ReLh2DzfupYHjzpRwMoUdQWafNyC3S/kyyU7BhsukcVx6BzIs2
         ZVOJAqPUda71bCPk1zwbOg6EqfadLB8zaTkgUJuCFMVYKrpvgoqXx7gsbA8bQG9gqWZg
         WKMQfD7YsUqkpScbY5amUcTZSDV4cx0ALMyZJc4MBsNu9LGsimbVJUjpHIu8bYYuojhL
         hRxQ==
X-Gm-Message-State: AOJu0YxYZ8GmBO70jttkze/OEaHsBhNwo12+C+MKGDFaCHNR78GxdQiq
	y733mlMeo9N9bF2dQzHe65jv8Qhnf5eJom2GTWefD9sor4royrMNXtx582FqzV6Mho1gb1pXsAQ
	X
X-Google-Smtp-Source: AGHT+IE0RvLj4H3KdecPGe9tNdehKzRC7ywegDzvuo8DHBbLGPMneK9XqUf3omz51ctinIxdleV+sg==
X-Received: by 2002:a05:6512:1051:b0:510:146a:a122 with SMTP id c17-20020a056512105100b00510146aa122mr7378107lfb.46.1706606049284;
        Tue, 30 Jan 2024 01:14:09 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] x86/intel: expose RRSBA_CTRL to guests
Date: Tue, 30 Jan 2024 10:13:59 +0100
Message-ID: <20240130091400.50622-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130091400.50622-1-roger.pau@citrix.com>
References: <20240130091400.50622-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CPUID feature bit signals the presence of the RRSBA_DIS_{U,S} controls in
SPEC_CTRL MSR.

Note that those controls are not used by the hypervisor.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/msr.c                          | 3 +++
 xen/include/public/arch-x86/cpufeatureset.h | 2 +-
 xen/tools/gen-cpuid.py                      | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index d500f87a5fd1..b3b4f75c021a 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -327,6 +327,9 @@ uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp)
             (cp->feat.ipred_ctrl ? (SPEC_CTRL_IPRED_DIS_U |
                                     SPEC_CTRL_IPRED_DIS_S)
                                  : 0) |
+            (cp->feat.rrsba_ctrl ? (SPEC_CTRL_RRSBA_DIS_U |
+                                    SPEC_CTRL_RRSBA_DIS_S)
+                                 : 0) |
             0);
 }
 
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index e586e141c329..bade4edab30c 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -303,7 +303,7 @@ XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory
 /* Intel-defined CPU features, CPUID level 0x00000007:2.edx, word 13 */
 XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
 XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*A  MSR_SPEC_CTRL.IPRED_DIS_* */
-XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*   MSR_SPEC_CTRL.RRSBA_DIS_* */
+XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*A  MSR_SPEC_CTRL.RRSBA_DIS_* */
 XEN_CPUFEATURE(DDP_CTRL,           13*32+ 3) /*   MSR_SPEC_CTRL.DDP_DIS_U */
 XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*   MSR_SPEC_CTRL.BHI_DIS_S */
 XEN_CPUFEATURE(MCDT_NO,            13*32+ 5) /*A  MCDT_NO */
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 45fab5e75d1c..1c6d76244177 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -320,7 +320,7 @@ def crunch_numbers(state):
         # as dependent features simplifies Xen's logic, and prevents the guest
         # from seeing implausible configurations.
         IBRSB: [STIBP, SSBD, INTEL_PSFD, EIBRS,
-                IPRED_CTRL],
+                IPRED_CTRL, RRSBA_CTRL],
         IBRS: [AMD_STIBP, AMD_SSBD, PSFD, AUTO_IBRS,
                IBRS_ALWAYS, IBRS_FAST, IBRS_SAME_MODE],
         IBPB: [IBPB_RET, SBPB, IBPB_BRTYPE],
-- 
2.43.0


