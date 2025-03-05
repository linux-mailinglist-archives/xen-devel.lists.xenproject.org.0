Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C20A4F996
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901872.1309850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknP-0008EJ-EF; Wed, 05 Mar 2025 09:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901872.1309850; Wed, 05 Mar 2025 09:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknP-0008Ag-8z; Wed, 05 Mar 2025 09:12:07 +0000
Received: by outflank-mailman (input) for mailman id 901872;
 Wed, 05 Mar 2025 09:12:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknN-0006ew-7d
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:12:05 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e740e5c3-f9a1-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:12:03 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-54298ec925bso9809906e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:12:03 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:12:01 -0800 (PST)
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
X-Inumbo-ID: e740e5c3-f9a1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165922; x=1741770722; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlmWvs068DR9gr1c4VC9H2ZHK0FU95Y+mqhPj+voaTw=;
        b=EXwQTDhQHZpL71VsIS0o1NNdYQwKrrFb2S6WUAQEMp9P7vonkV0E3ZIVaUPbglvQGW
         3YK9z8XKC9yjtjGUmtEUz613frhT62nZjwX6l7mNNcH/wSxcmpqB7JkklnJFahJ/d5U9
         bIFBhw18MZyZ7uY7I2ytDAIDiOkLR+3FkgXWQVxP3ZzJsNbsZBMdFF3AQh8CD6qw7PF8
         MLKN2tTxJbgpKg9IRZ58V1LEfcJMfCgs1Rhf/990As9331VqQSdXnSLqJbD6Sdk/K/tb
         oOLy0RYhEavuxkVCBGWdZ50YKL0wYMwQJtZwfsWOfX5g8afcyBrkkVcCl4CeBTOMChTX
         gkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165922; x=1741770722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlmWvs068DR9gr1c4VC9H2ZHK0FU95Y+mqhPj+voaTw=;
        b=n6vycXXrSOqS5eBB6v3u3RdrsrOvnNvvNWsY3hoRuHqXQ92xK/viX+tsI3EaZstDfT
         jmnLSMMobH4qg8qA3EgybH9E5+QGbgZ9+kOh7QYMDkc3Rh++cb+d1DwX+TjYrR5UAbDt
         beGsAp9842JxRmMHrqPBrJgg98Awdqt2pjDMbEbkBm/+BANt8QB2IIT6gS7uCMpUwDRq
         +WBLWdWh9KdXWkq0SJwHI3S8OjlsTr9rFgff8UwyyYM/riDrp/Puo/2OEg+sX4ZSeMTo
         cogFXVGeUog6kV0K+wuuZ2rraU9KCdFYeOeuasvsJh1gwvATIyLW5mF/gcXijTCAGzuI
         oqRA==
X-Gm-Message-State: AOJu0Yzvi/4wR8U/9hqLYhpEyvp+q+DY+9RvzRXbfSnzAgdv631Nu2kv
	WZItM4E8zqKTiazFNg7Rh+bTn0w49lVA8SkxAN40UUZw4Yv6VNmKDBXMTbp9
X-Gm-Gg: ASbGncvUSsmMdoRKk9xLNmcv7+vWFOan6Tl7Gyf6E9dXm1ByQSqH9MSuB4qLt1A3vVZ
	J3lFu1qL/8GkJLdXatck1eujDDZytLGCtUk053k6dLdfpkqKfwoY6fLdvGp2FpBV9drjCXmGso+
	ASfumNUYJdLdDMEAsWI/czUkkSQJ6+BXSaooFIVPE1VWUbAJ8puqP/kGMQzvbyLOqcirqVRICqZ
	VIDNxzPJAFlrF1gwJgcfgUUcfT+BoCC+oKMxE0GM09RjNAD4kHPChmNp5FuIrEUS9X33kJTYgoR
	g/Raa68f0hBtWpGDXIShFaUCD4vedYxhk/OGvkOdPyv5lg1Fjg==
X-Google-Smtp-Source: AGHT+IFGQjD0nLcMig8xjCScahU4JtmgGc/wo+bPny8YpKreUoEaLv+Q7fgItxamnLGhjdgBLPivWg==
X-Received: by 2002:a05:6512:b11:b0:549:4e80:6dc0 with SMTP id 2adb3069b0e04-5497d18de0dmr968133e87.0.1741165922301;
        Wed, 05 Mar 2025 01:12:02 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH 06/16] xen/arm: Introduce system suspend config option
Date: Wed,  5 Mar 2025 11:11:14 +0200
Message-ID: <28da91c2859e0226585951ea3d6e7017b402ec0b.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This option enables the system suspend support. This is the
mechanism that allows the system to be suspended to RAM and
later resumed.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a26d3e1182..5834af16ab 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -475,6 +475,17 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
 config ARM32_HARDEN_BRANCH_PREDICTOR
     def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
 
+config SYSTEM_SUSPEND
+	bool "System suspend support"
+	default y
+	depends on ARM_64
+	help
+	  This option enables the system suspend support. This is the
+	  mechanism that allows the system to be suspended to RAM and
+	  later resumed.
+
+	  If unsure, say Y.
+
 source "arch/arm/platforms/Kconfig"
 
 source "common/Kconfig"
-- 
2.43.0


