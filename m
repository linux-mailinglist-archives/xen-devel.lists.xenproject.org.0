Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25076841F05
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 10:14:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673243.1047555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkC5-0005bG-TF; Tue, 30 Jan 2024 09:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673243.1047555; Tue, 30 Jan 2024 09:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkC5-0005W9-Py; Tue, 30 Jan 2024 09:14:13 +0000
Received: by outflank-mailman (input) for mailman id 673243;
 Tue, 30 Jan 2024 09:14:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUgQ=JI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rUkC4-0004AP-5S
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 09:14:12 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee38650d-bf4f-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 10:14:11 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33ae74e5394so1190368f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 01:14:11 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 ay12-20020a5d6f0c000000b0033ad47d7b86sm10256583wrb.27.2024.01.30.01.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 01:14:10 -0800 (PST)
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
X-Inumbo-ID: ee38650d-bf4f-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706606050; x=1707210850; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzWDOBti4Ac7c4/U3wTwSVGQoEFDbLGV4XyQW2tHCJY=;
        b=s5g196EDsmWYTyun2KaVvb65UCW0yhhjAWM61aGtH35j5pEJX0J8p3rtSAak4o4sIR
         wsDCNSdIPNiSBZqKfn0/UxP0oAU7iWW/d95lxUnZjTiGS5KzQ7bU0G4NMXmfGzHayPCt
         k4kxKH7XKvc9eCT7+oi7h0gQofDw5z8nyBves=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706606050; x=1707210850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzWDOBti4Ac7c4/U3wTwSVGQoEFDbLGV4XyQW2tHCJY=;
        b=aTw4VW3gCAMjpQZ7F2SAT3tMr7J3uo6vqIt4EOBCZXS23s42T057tZGvm5e8V9eLM8
         AY0TI8zrHJhEbOoHNg8BPn0MFPtGY1oFkVFGn4LVnrtgNkB88ei/5Uf/DMTFZs4At1X4
         CTOEchByQE7kFdRIlOn7EYKPuTerQmYJDx0t7mZra1OUp05OebFgxQvTezVlRr0loWXz
         Oh6rh0optZ5DQEBq6QiSmosPt3XUxBFhZGCNjWMcjzA+mpEkng475wyc7I6vNK+EGLMd
         hztyxGbG3PZkMNWk1xeGw1/BTkWBd69tRBywqD2DF8jcSKaBaiAAdkkS2UxLgGbxB4nP
         jwRQ==
X-Gm-Message-State: AOJu0YzqJ5w0IIB9RyNubUyk0VoyU+ZxRWGL0YOBsWeJrIuKB/G9Rl6F
	uofcN3yBsKr+gS2UizWsfuIqtywTYHvqOwFawTaLMSZLmWpHEN0ldIg0btFvYep2fyiLtE5DGL3
	y
X-Google-Smtp-Source: AGHT+IHqpPjbhO0DJaXjbOw4/qEYb5MD4uiG72JSNkJ9c0XXJa7NWreeS6rJiCDS9mZtjHVMKM3//w==
X-Received: by 2002:a05:6000:2c3:b0:33a:f5ea:bd7d with SMTP id o3-20020a05600002c300b0033af5eabd7dmr2416882wry.69.1706606050557;
        Tue, 30 Jan 2024 01:14:10 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] x86/intel: expose BHI_CTRL to guests
Date: Tue, 30 Jan 2024 10:14:00 +0100
Message-ID: <20240130091400.50622-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130091400.50622-1-roger.pau@citrix.com>
References: <20240130091400.50622-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CPUID feature bit signals the presence of the BHI_DIS_S control in
SPEC_CTRL MSR.

Note that those controls are not used by the hypervisor.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/msr.c                          | 1 +
 xen/include/public/arch-x86/cpufeatureset.h | 2 +-
 xen/tools/gen-cpuid.py                      | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index b3b4f75c021a..e0d57bce40ec 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -330,6 +330,7 @@ uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp)
             (cp->feat.rrsba_ctrl ? (SPEC_CTRL_RRSBA_DIS_U |
                                     SPEC_CTRL_RRSBA_DIS_S)
                                  : 0) |
+            (cp->feat.bhi_ctrl   ? SPEC_CTRL_BHI_DIS_S : 0) |
             0);
 }
 
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index bade4edab30c..be5c1b748e27 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -305,7 +305,7 @@ XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
 XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*A  MSR_SPEC_CTRL.IPRED_DIS_* */
 XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*A  MSR_SPEC_CTRL.RRSBA_DIS_* */
 XEN_CPUFEATURE(DDP_CTRL,           13*32+ 3) /*   MSR_SPEC_CTRL.DDP_DIS_U */
-XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*   MSR_SPEC_CTRL.BHI_DIS_S */
+XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*A  MSR_SPEC_CTRL.BHI_DIS_S */
 XEN_CPUFEATURE(MCDT_NO,            13*32+ 5) /*A  MCDT_NO */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 1c6d76244177..25d329ce486f 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -320,7 +320,7 @@ def crunch_numbers(state):
         # as dependent features simplifies Xen's logic, and prevents the guest
         # from seeing implausible configurations.
         IBRSB: [STIBP, SSBD, INTEL_PSFD, EIBRS,
-                IPRED_CTRL, RRSBA_CTRL],
+                IPRED_CTRL, RRSBA_CTRL, BHI_CTRL],
         IBRS: [AMD_STIBP, AMD_SSBD, PSFD, AUTO_IBRS,
                IBRS_ALWAYS, IBRS_FAST, IBRS_SAME_MODE],
         IBPB: [IBPB_RET, SBPB, IBPB_BRTYPE],
-- 
2.43.0


