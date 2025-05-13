Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA5AB5722
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 16:29:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982930.1369307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqdV-00049J-1D; Tue, 13 May 2025 14:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982930.1369307; Tue, 13 May 2025 14:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqdU-000473-RO; Tue, 13 May 2025 14:29:36 +0000
Received: by outflank-mailman (input) for mailman id 982930;
 Tue, 13 May 2025 14:29:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sqXq=X5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uEqdS-0003pS-Ef
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 14:29:34 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aff2273f-3006-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 16:29:33 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ad23db02350so568886866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 07:29:32 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197ca2b4sm778952466b.160.2025.05.13.07.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 07:29:31 -0700 (PDT)
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
X-Inumbo-ID: aff2273f-3006-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747146572; x=1747751372; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3KsIxN/HFuAUbvxsLdzJtfMwgSAXD/I7p0jaxNXAMU=;
        b=QR9ErIOIl7SwdHwqt7NCUJPeQsZn372/s+/wOzLly4LrSWRROhms4btoE2BW58gKEE
         DnSIpuN645e7SI3FEyWjAde4Rm04AS8jb9oEjg+YCQldfUt/ZwZiSXQpmUBnmU7CGsjS
         hbvm1OmlHE/2Z+hSpqHtGFojd8w6aDomnN5VAKNIaIHGGwuFfM8AW9MDEmkWf83rqMed
         ocfcVJJpnEFkidrZoqnyZVXoR0aEWc6sQRmJWKU63rVowRHWsbEODY1m9e6Y10Rl7lN+
         hLkyfVac1mTS5P9yAq4GZPFkY87wxai3mK10ko2HmOvrAqq00O+YjmvwHXmbe10CqH2b
         IxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146572; x=1747751372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3KsIxN/HFuAUbvxsLdzJtfMwgSAXD/I7p0jaxNXAMU=;
        b=bjO72xT5PjB4OqHX2Q9DX57QuGFUex+RfwWcgdo4mB1DDPn0Ol3rHpEHCzW+dusTcO
         ECK+XbwaZdLFOv1W//iDz3DL8Tv6wXA5g1hvhkAfU1DFaXzc2YxiA+ClCLSRaiSZl5Dc
         /J8lKQ2DAM21swcZDxFeWGNrgFKinIFWgnAkVdkWbFP9h87SaF4k6MehsWpXE2XRuc/F
         z6IKl2iy2X80Bkt7oSSlCXK7QNpwmJuKSJ9N0H2xdsC2XlinT41rlnPfZHfK+YaiRIp5
         n5Q2y4aqt12EdMzV9XIB+LhwJE6idLskoSatAqfWsOPRAosXsnSfsm+C+ybOvReW7Jbm
         EfWw==
X-Gm-Message-State: AOJu0Yx0tOfbY8Fnr7SB3IzmI0A1eUF15JskMWVNTwxKwBF1wy1LpjMm
	tqnmzfMglLXCKAq8hMXqrRR9T47t28bYEv99kFav36jjn+I1q+XSkNcGRA==
X-Gm-Gg: ASbGncvGCazRnAwLl5zprHURa6iXSpBDJE253TJb5oSpCEncNnDJnBNnZA4yDLDHNps
	l417e0H/8xHjceFHafKo5YuW8JOxVanUa4FpxMtlXmlfknCgAwWziEyPpODdssqpQ4YHbyNcv5f
	25ZNbcgVbhO9fUKbrHUTySYp6dOxdR6ac9HPF2PPI6JiU2NnG/h3iYwbosG/v1aqqzCNnbs4Ubz
	SkoatGIRh58AtnmROy05cnaIKHX85lHSf19nQJQvg1gCFOfzb/UNqvfLparZB9cbt92OecBnpqg
	fK/0Ni1zP/b6knv3c5j1diPLvysw+yvAEIkjMMokVAtzBrNg3pTYrmf/e7gyAOrM9FHwtRLjoKg
	juj7/ttXt8IY9e0PEOw==
X-Google-Smtp-Source: AGHT+IHvDKrcm5EIAfWEwLCJGVdb2MtWTj4Y9h1Wt9ttaSNtX+3LeS3O1szFbN8nYpIojGfETO10dw==
X-Received: by 2002:a17:907:3f11:b0:ace:d710:a8d1 with SMTP id a640c23a62f3a-ad218f1bafcmr1609678266b.24.1747146571959;
        Tue, 13 May 2025 07:29:31 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 1/3] xen: restrict CONFIG_STATIC_MEMORY to ARM
Date: Tue, 13 May 2025 16:29:26 +0200
Message-ID: <7e5ae810c1cf542ea33b2a2e836e8d9d7b1749b2.1747145897.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747145897.git.oleksii.kurochko@gmail.com>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that CONFIG_DOM0LESS_BOOT has been moved to common code and is planned to
be supported by other architectures (e.g., RISC-V), the dependency for
CONFIG_STATIC_MEMORY needs to be updated.
Since CONFIG_STATIC_MEMORY is currently only supported on ARM, its dependency
should explicitly reflect that.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index bf7b081ad0..5f4a16e113 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -148,7 +148,7 @@ config NUMA
 
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
-	depends on DOM0LESS_BOOT
+	depends on DOM0LESS_BOOT && ARM
 	help
 	  Static Allocation refers to system or sub-system(domains) for
 	  which memory areas are pre-defined by configuration using physical
-- 
2.49.0


