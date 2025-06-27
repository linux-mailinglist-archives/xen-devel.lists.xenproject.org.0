Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01738AEB56A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 12:52:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027505.1402115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV6gR-0002mI-BT; Fri, 27 Jun 2025 10:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027505.1402115; Fri, 27 Jun 2025 10:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV6gR-0002kI-7I; Fri, 27 Jun 2025 10:51:51 +0000
Received: by outflank-mailman (input) for mailman id 1027505;
 Fri, 27 Jun 2025 10:51:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61Re=ZK=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uV6gP-0002k0-Sa
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 10:51:49 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9d87d8a-5344-11f0-a30f-13f23c93f187;
 Fri, 27 Jun 2025 12:51:49 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-553b6a349ccso2267871e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jun 2025 03:51:49 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32cd2dea1c0sm5235831fa.3.2025.06.27.03.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 03:51:47 -0700 (PDT)
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
X-Inumbo-ID: b9d87d8a-5344-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751021508; x=1751626308; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvxUHn81TzPOxrckXPxoHks4QhxS4ztnhXtdUUKJDg8=;
        b=GmA/6pSD+HhDckBRoZH094U0J2Aa8PNJj7bi0J6mvP4WfHuKf14gHjsKxuCIJKD8SZ
         ebE+3tpLQuuSAnmn2w4b51r9THFYXdDil1hD28gIZAGbJjhhB1SPdto36qj0CzkFOeMy
         ep7uwlG/IlSmTKPpEZW3ekTiR75cMrzsU6ohs3VZsK8HKQ3TtqWkDUpfy/3ynCny6jow
         iS8D2eEmfyCiXizz2lVNB81PonXkReecz5+ZKwDo/mjhkesgHyus/jdehxXxBBCrJoz1
         XsKnAg5DCqe+jLJsTTAgdbdISHQlfNRnW1SJWhdrRFu78M+vgZs6CNYkP1ZUX5jI+sPu
         GtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751021508; x=1751626308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvxUHn81TzPOxrckXPxoHks4QhxS4ztnhXtdUUKJDg8=;
        b=WHbEr+aQni4aY2EheqHbeNuZltehMmvNU0GiP++ufluo6ZE0gPxkC8TC7z8OGDKgq3
         kFVHNBtWBm204YRfmLV6CIHj+kgj5iITCpvdECbvNnPFyV3d8ZxEnzLi7ImWed6ZYmSz
         nw8xt1Xu6RVXpn7KxNIiOiUbS1tMC4DWjwPIL7pVB7Bsbeuob/+HuKvjqoIhOCqolX3e
         pDhUnGz3rjgbF1KJzCMtQXRTi7Bsso4llISvJ2wkuXGhMk3eZc0hlNVlKyG4jcTI+vEN
         F0XeR+sQOitwrXc0ZThT+LO9F8JAB9YSCi3+EgelOAhc60h5hPR8mKgYvUExM5AuLEPV
         3RKA==
X-Gm-Message-State: AOJu0Yx0Te6me/ZLhPECQm0HsDtUPMFXXQ5NdpDhjBL1IysQQ7nKZUID
	ewPO8+XO+fOx2MTmpb8+XP3Zuil/kVi3dv2wmbP+gSaY0haVkwAgB8yzDPyG2TGd
X-Gm-Gg: ASbGncvkRWJLM4h9Jf3a44nMWmo2D1L/OInY9QXKaRbXZQTeWAUOarbAY7E3CH5zG3f
	mARftQntsumuStPwCvyh1UMHq1lVigzAbHuJ8iLekcQ+h6ZckQazgERnRPx23AUP4M4+ePtnwtR
	oV0q4qPEY1ZJHIfWGoNaN7BDd3Svkgj5EdBYllCYWG86v/klkMHWpCqmsVQBt+KnMemlbkDrkFq
	lAD1ftJX1uC52RqsVrV11ImIdfgLkHLgyxyYjCZDGUIYC0+8P+EEYj43iWDVEjliCmkUQkcjCtg
	X8DCY1w10ZnTO3Zy8DhZVGxBnWtlTEHi6A54cvmNpZIQ8kkMBU/Fwebe7EAQnv0afX6zyP5toJy
	WfTRRoro/g5s1DMRhnNPMTe5Gbw==
X-Google-Smtp-Source: AGHT+IHTTZvhZxX4sgrLSTAzgt1vLxbnS78lDzcGMMd1uy2hTeYFtwgODAbp9VVAPNSP/UmMmWP0Rw==
X-Received: by 2002:a05:6512:32d4:b0:553:341f:12a3 with SMTP id 2adb3069b0e04-5550b8b053emr782425e87.39.1751021508126;
        Fri, 27 Jun 2025 03:51:48 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 3/4] SUPPORT.md: Add entry for guest PSCI SYSTEM_SUSPEND support
Date: Fri, 27 Jun 2025 13:51:32 +0300
Message-ID: <401d3745a295812fef14a22b0c2a3c6017d588c1.1751020456.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1751020456.git.mykola_kvach@epam.com>
References: <cover.1751020456.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Document support for the optional PSCI SYSTEM_SUSPEND function, exposed
via the virtual PSCI (vPSCI) interface to guests.

This allows non-hardware domain guests (domUs) to initiate system suspend
operations via PSCI calls. The feature is currently marked as Experimental.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v5:
- Dropped ARM/PSCI entry: this refers to internal use of PSCI SMC calls,
  which is not relevant for SUPPORT.md
- Added a dedicated entry for PSCI SYSTEM_SUSPEND instead of generic guest
  PSCI info; guest PSCI support was documented in a separate patch
---
 SUPPORT.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index f0b5718e84..659b9c3052 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -956,6 +956,13 @@ by hwdom. Some platforms use SCMI for access to system-level resources.
 
     Status: Supported
 
+### ARM: Guest PSCI SYSTEM_SUSPEND support
+
+Support for the optional PSCI SYSTEM_SUSPEND function exposed via vPSCI.
+Allows non-hardware domain guests to initiate a system suspend.
+
+    Status: Experimental
+
 ## Virtual Hardware, QEMU
 
 This section describes supported devices available in HVM mode using a
-- 
2.48.1


