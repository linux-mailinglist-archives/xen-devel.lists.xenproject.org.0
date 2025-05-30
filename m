Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 921FFAC9083
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001148.1381388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL05O-0004lP-Vr; Fri, 30 May 2025 13:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001148.1381388; Fri, 30 May 2025 13:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL05O-0004hr-S6; Fri, 30 May 2025 13:47:50 +0000
Received: by outflank-mailman (input) for mailman id 1001148;
 Fri, 30 May 2025 13:47:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LO9=YO=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uL05N-0003C4-7O
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:47:49 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abb7e610-3d5c-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 15:47:47 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-55329bd977aso3135453e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 06:47:47 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553379377f4sm704030e87.229.2025.05.30.06.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 06:47:45 -0700 (PDT)
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
X-Inumbo-ID: abb7e610-3d5c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748612867; x=1749217667; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTn2B6C64BsBJ/wVOSgKG1LWM5jCpfJNwTLjcuvqmOQ=;
        b=ScM8O9K8T/ci+/XcGO/l2gm7WNk3B+LNbM1GVSCk21wn12x5W+1VZ2x+jFN/5eTkd9
         WMkakPrf5/IhP6I4dbmIaLQwiD5y0JMvV0+8796VAaVVdyudUANuH7x6f3c60npWPxkv
         GDjlx7PtHWYzVUZJqHBJTCexH3fHpRQ/LQ4mK3vk7+h7wW7coi0aARpL8K/XCmrUyUqu
         rH4Sw7xqWysGy9U7RPR3T8kvrkf5FqBA8xSpw/h6IgPXSvZ/I2Z/h+/HJrzY1sXITEAd
         0dLkgNj8e6cyHAAqSPpBgv6kS2OxgZ38YP+yxAd+3eJfP7wvB9ZKbq/Zn4PnxSfPlC9a
         ApDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748612867; x=1749217667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTn2B6C64BsBJ/wVOSgKG1LWM5jCpfJNwTLjcuvqmOQ=;
        b=QQRO3KkK+KRT+lyUsyAZ+5ha5ugfQxz7IdAz7hhFpoIMJ0+skSmke8ea183uvpDxIw
         UtpeveEU4xIR2dlpRBXx44JZm2Al3+Jrrz4iZ4v+PFM1LYdUi2Dz/bO97/xySjWqXRxs
         78bCnVZtO1rV2lJc1IZYJJUtNz0dxoVIc5vY0AsfBX3p0Y8vX4MdlvHyCtpyN+LvE4QT
         94J3pdhoEMJgSPJufQgXjx5ipOYbieun5RoetUe8NWCUk8k/qSUqeTX0rvGhBtkwnKQz
         p338tU+psVx43V+io92D9zdCTlAA2bZJX12GFeFejpwJhbuiJ5QGXPs2f4OOrKcNxGNI
         WnFA==
X-Gm-Message-State: AOJu0YxYSRnH/65eddsK4y1MuaLz56j3ltACCMcpgEcK/W7B8ULCTcad
	p3g5O7rnRgyASraX2qq6MjLlIywy3cTTPH5cR6G8+5e6Y1mDtO7zYmXleos0vB16JYE=
X-Gm-Gg: ASbGnctQvhBn5POZu2GnV5rVtF3+2lV8+9mMCrHTnodCjfRa47mt5qdebb6kWmPpjcB
	7Uj2E3oGbmz5f55wSuS9oiqaRvvutV7c6yeXn0JLXjOEUvFG3uzcusbHTuUc/h2ggOv+rFa7yNu
	gRsqy5Ljjc/cnt2dYY7ZV26TAW+jSolZ4o8PKLLD9MKueFT+ZudvqpDpNfa3Ffz9iXT9e+Cfk6A
	/+UWUEufiM4RDQa+nwkDOWNtcQ2e0QAZUAXfL7XKvJTI3rPpa9h0owtWKR876IwwbH+2hmy/xgx
	uLmH/cxR1hGlCctikYbsQs1USNgcUld8/Ynh4icskpssiaPVQLI/ZHVZ2uKPHDHm80wfJJ/To+L
	khSm9VgEzLR3vf/WlwjtssJ8=
X-Google-Smtp-Source: AGHT+IGUw3jW13S4FcruO1tndtUR81rZvgF2eSy5dew8CqP2bKabLRGvtqDzU42K8uYU8DePLFyswA==
X-Received: by 2002:a05:6512:2208:b0:553:243c:c1d3 with SMTP id 2adb3069b0e04-55335b3bfafmr2570125e87.18.1748612866446;
        Fri, 30 May 2025 06:47:46 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 4/5] tools/ocaml: Update bindings for CDF_TRAP_UNMAPPED_ACCESSES
Date: Fri, 30 May 2025 15:45:58 +0200
Message-ID: <20250530134559.1434255-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 tools/ocaml/libs/xc/xenctrl.ml  | 1 +
 tools/ocaml/libs/xc/xenctrl.mli | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 2690f9a923..7e1aabad6c 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -70,6 +70,7 @@ type domain_create_flag =
   | CDF_IOMMU
   | CDF_NESTED_VIRT
   | CDF_VPMU
+  | CDF_TRAP_UNMAPPED_ACCESSES
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index febbe1f6ae..f44dba61ae 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -63,6 +63,7 @@ type domain_create_flag =
   | CDF_IOMMU
   | CDF_NESTED_VIRT
   | CDF_VPMU
+  | CDF_TRAP_UNMAPPED_ACCESSES
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
-- 
2.43.0


