Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3819A887DB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950714.1346980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MB3-0000uJ-2o; Mon, 14 Apr 2025 15:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950714.1346980; Mon, 14 Apr 2025 15:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MB2-0000qx-VT; Mon, 14 Apr 2025 15:56:52 +0000
Received: by outflank-mailman (input) for mailman id 950714;
 Mon, 14 Apr 2025 15:56:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdIb=XA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4MB1-0008LI-II
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:56:51 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13899891-1949-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 17:56:50 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-abbd96bef64so931326766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 08:56:50 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4288sm951760866b.96.2025.04.14.08.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 08:56:48 -0700 (PDT)
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
X-Inumbo-ID: 13899891-1949-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744646209; x=1745251009; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biW/0L6vulzOGgUZkJVlWvo9rwiN4vFTilKp0PPEU6k=;
        b=fV2YKndCMGdv8s2r2VAVgGvK9UNFr2M4eeH4xuYTBPE88Ul+sdX/scrtgngt0ka+Vy
         A6AMzX9j8+VsbjiTXkK7OQdFIvgwMzLzaEOgIOuUDI4xQAEBtps6XjzmMMCztWrjAhQY
         sToMSqComRYi8aziJgeQlCScTgnvaLG7gR8iUAZ0iriD8RATBVSJuTDlGUb4eV/df0C9
         kSpFBJjbCID2GS+aXrYVZQ4wSurSW+rBPlEv/unTQ6cS/x+mMVlRcL6HqSuTYK8IQXej
         62rN/KEsVrEsk8UkANn+SSfB5/HpcSAYWXZrkKhj/98cVBrfb2CvqTdTvxwlsvzYbgIP
         3pOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744646209; x=1745251009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biW/0L6vulzOGgUZkJVlWvo9rwiN4vFTilKp0PPEU6k=;
        b=ey//pClvkm7sqB/DRc+Bq95/OccRNLSkxcUdjnIFGi0K5oGDk1f3Xx9PmdbFMqemVh
         WMkljyDwdHtmXfgShxSeEp8Ws4oFOu5bffpPj3ybpTtOWrs9NTzxnBQ5mXR79g5ewptk
         VRcqhQ5de40ds/8Qfn6YoW5JzphdFCCwEMDg22SbsIreZYjvP7UJsvrWMAqPNSGBAy56
         b249GXQZ9jKS0/Ofy3GNfI0J0JdEunQhlV6ZklficlQ9exPnXIm072Csrf4LI9j2SPDM
         UN8HwCePifRaqpBQTU34ut3Rlj45v8iT/MV9DMIMGG2gSr6Dx4D01lsFSRoRe7uoaDe/
         8Jgg==
X-Gm-Message-State: AOJu0YxezawntTNdmGyIVKCKSQx6niYyj1NXVJrSt3TGT2cNmmZrgHPD
	4VHOddk1Uagl0IjU9h3VEAXDVkmT0LMCXyGvdcyf082r5/UqZHPesScEzw==
X-Gm-Gg: ASbGncv5tUxJZQErzSNRPIpC86mc3YAAzYu5ttOkpt2zo972ZtNpLJd/5z9fCszvbuk
	ryPWG4vPbsryF2BtgdmfKpB0sVNgQL3Fb7GwJdOwDw/bCbD/OM+kLnmXQv6BSIba7pbWjIZUaF2
	5WweUbXS/jrMsQBpvT8sqdQZj+cmjWomyBa+ZSxUSvPVr7cxJxeSR9bAELG+NHGu2IOzxsOGUvl
	1ddIqKojoFelGOrAb2rya4iUB+E7DHso/oxVV5Y3vYzTBk2gXVGW4lhYTRa1QJaMVfw5BR/eHeF
	++iMtDdgDCPNH6B0nwEoo0NBgZ7rM9/meEtecEUaES4qWfBHA3cGsvM1qVNsVpAYQxt370/qhZZ
	VFu/xTyshkw==
X-Google-Smtp-Source: AGHT+IG4/0yxABSmXWjkum4i1iaahql5lRZoMC/3qZoz0LCLoqDSmONznruxyWC97BQZbKdCT+n5IA==
X-Received: by 2002:a17:907:3ea7:b0:aca:a1c9:d155 with SMTP id a640c23a62f3a-acad3430e5dmr1038809366b.11.1744646208500;
        Mon, 14 Apr 2025 08:56:48 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 4/8] arm/static-shmem.h: drop inclusion of asm/setup.h
Date: Mon, 14 Apr 2025 17:56:37 +0200
Message-ID: <96e1f798ff19bcee73e613ae9b74056cc37eb5c3.1744626032.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744626032.git.oleksii.kurochko@gmail.com>
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing is dependent from asm/setup.h in asm/static-shmem.h so inclusion of
asm/setup.h is droped.

After this drop the following compilation error related to impicit declaration
of the following functions device_tree_get_reg and map_device_irqs_to_domain,
device_tree_get_u32 occur during compilation of dom0less-build.c ( as they are
declared in asm/setup.h ).

Add inclusion of <asm/setup.h> in dt-overlay.c as it is using handle_device()
declared in <asm/setup.h>.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/arm/dom0less-build.c       | 1 +
 xen/common/device-tree/dt-overlay.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 5810083951..122739061c 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -18,6 +18,7 @@
 #include <asm/arm64/sve.h>
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
+#include <asm/setup.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
index 81107cb48d..d184186c01 100644
--- a/xen/common/device-tree/dt-overlay.c
+++ b/xen/common/device-tree/dt-overlay.c
@@ -13,6 +13,8 @@
 #include <xen/libfdt/libfdt.h>
 #include <xen/xmalloc.h>
 
+#include <asm/setup.h>
+
 #define DT_OVERLAY_MAX_SIZE KB(500)
 
 static LIST_HEAD(overlay_tracker);
-- 
2.49.0


