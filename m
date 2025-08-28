Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86359B3A2C4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 16:54:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099031.1452951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ure1A-00076z-Pe; Thu, 28 Aug 2025 14:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099031.1452951; Thu, 28 Aug 2025 14:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ure1A-00075P-K1; Thu, 28 Aug 2025 14:54:24 +0000
Received: by outflank-mailman (input) for mailman id 1099031;
 Thu, 28 Aug 2025 14:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mimg=3I=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ure18-0006qt-SH
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 14:54:22 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1fc3c3f-841e-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 16:54:22 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-55f39c0a22dso1183868e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 07:54:22 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f42101509sm2635661e87.106.2025.08.28.07.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 07:54:20 -0700 (PDT)
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
X-Inumbo-ID: e1fc3c3f-841e-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756392862; x=1756997662; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xe9xi3DaBptNnLW1VEAJiUhAp27nm19FtXNKIdaX+1M=;
        b=anHfLvhzUkFp3Cyr9/EWhwPzi65yWCNhY/jcHNq8MRsY9Ae5kaD0L4oUaOBa3jX7vU
         IQTqbF/80Pu632oirdHBje2301NF9cxipf5MV/pZFWjnb6RRPL5QVvdg/Vn5BupiU1HG
         zEznJjw5HyVC5OSZm1gzgiLo1XdfTMiJWs7V1Sw0LDaHE5NIBhiofE5k2zs4d0jWKJ8X
         +/g2PcUFrTbnKkpbj3pU1VeKtrLD4pW9SeoCpnsQXNF8hkLTEBxJP7gUrBb6B2MBcOsB
         kis/e6IRK2R7/Hg4B4JDaZ5w/QG/WqZkDyasgQhg9La2PBWUAKBSiEZR8a72vmmmmDq4
         wf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756392862; x=1756997662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xe9xi3DaBptNnLW1VEAJiUhAp27nm19FtXNKIdaX+1M=;
        b=W1zU+C1rtP8W4h3cO+D1vYNsmMeh0uyFnaV55aVWn2SOiuyYcnx0MnbbicExaTQ34z
         rlPD+WwN6X9fwLtYzotsOsFO9ZeMZhhRJYc8ygfjn/fe2EQT42YQ9/tR8cox3lZknuwt
         uJMzoOZBPakVx/AzsuooOttHbcAeYlbuBWn41ouyydiR2+i/qMosauF66coHumzNzoSZ
         avpWWBxAnsUEU6YnBfsGIqVEEqVoIBgOLd25c93Jqgg40ml6Y3g0dpyxwIdD3djk5au/
         XEJGQ9CG3D3IiDAMeBpW2GMqswwc0Bb0RXauFEhH6dzGogyfHM1GTUtCJrnK+AETxohc
         SNww==
X-Gm-Message-State: AOJu0Yzqa+CKhIDiextRmfKRB1OegZAAMiiDNP7TSCCvzMs2yiZmeGYe
	sckLDhEanqHnCZLZISlqrEFPOVZVW5yg5IWA1p/j4FUEoiEgCJzWDw3MNiAc1w==
X-Gm-Gg: ASbGnctbXsS9V+P4qM5nVkIaHTSMkMoiFV53KuLCuFWbG4jM5yFTdKsTOTsfaaacgzL
	RPNNihcKPCAwHuPosEANWnbo0zvhUmr9EwFfFsGKm8JTEt4s8pTitHNC9yE4iLrWecwRM1wLRAK
	tsPpwtpnlosXnUQ9vau0cHrfF6RqtQrm9UgRL1gDfysnVC1T7UA7hJ/XOp2mQ/PUKdHHA8Xj5SA
	6je3ivx9DjTHW9UDC1xlUR1aCYgm8jkYglD228JU8t7Wo4oZXy1nheMUcXymSs9HIomYUu6vLJv
	NKo9cwwLqvnuvn233fvgRWDBimsnQ22zqHuVC2jAcFU++pfSPRBnyCXKqEqpo2QaEMTEmaT3RDU
	PhOOkqmzOpg0BHKP0mU0c1S31RntLD4C96mysNvE68a9z8N5wqlB/aKOLe4ZX0Q==
X-Google-Smtp-Source: AGHT+IGVn3t8FI8KDXGmDy918ObNgpZToIWSeInq3sskv+8OmyDF6huIydUyHV112csuE+SHQHdo6w==
X-Received: by 2002:ac2:4c53:0:b0:55f:595f:9a37 with SMTP id 2adb3069b0e04-55f595f9c84mr1409346e87.27.1756392861379;
        Thu, 28 Aug 2025 07:54:21 -0700 (PDT)
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
Subject: [PATCH v11 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
Date: Thu, 28 Aug 2025 17:54:06 +0300
Message-ID: <9173ec351b88ad04e6ea13053dd785eb7f0e9b53.1756392094.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756392094.git.mykola_kvach@epam.com>
References: <cover.1756392094.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add a new entry under the "Virtual Hardware, QEMU" section documenting
support for the optional PSCI SYSTEM_SUSPEND function exposed to guests.

This function is available via the virtual PSCI (vPSCI) interface and
allows guest domains (domUs) to initiate system suspend operations.

The feature is currently marked as "Tech Preview".

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V10:
- Status of vPSCI SYSTEM_SUSPEND changed from "Experimental" to
  "Tech Preview"

Changes in v6:
- Dropped the generic guest PSCI support entry (merged in a separate patch)
- This patch now documents only the SYSTEM_SUSPEND optional function
- Reworded commit message to match the final form after rebase

Changes in v5:
- Dropped ARM/PSCI entry: this refers to internal use of PSCI SMC calls,
  which is not relevant for SUPPORT.md
- Added a dedicated entry for PSCI SYSTEM_SUSPEND instead of generic guest
  PSCI info; guest PSCI support was documented in a separate patch
---
 SUPPORT.md | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 6a82a92189..0ce0903cb1 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -962,8 +962,9 @@ Emulated PSCI interface exposed to guests. We support all mandatory
 functions of PSCI 1.1. See below for the list of optional PSCI call
 implemented and their status.
 
-   Status, Mandatory: Supported
-   Status, MIGRATE_INFO_TYPE: Supported
+    Status, Mandatory: Supported
+    Status, MIGRATE_INFO_TYPE: Supported
+    Status, SYSTEM_SUSPEND: Tech Preview
 
 ## Virtual Hardware, QEMU
 
-- 
2.48.1


