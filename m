Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F36B14A76
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062244.1427914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugg4Z-0006wT-0h; Tue, 29 Jul 2025 08:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062244.1427914; Tue, 29 Jul 2025 08:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugg4Y-0006tw-T6; Tue, 29 Jul 2025 08:52:34 +0000
Received: by outflank-mailman (input) for mailman id 1062244;
 Tue, 29 Jul 2025 08:52:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R+Pi=2K=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ugg4X-0006C0-7l
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:52:33 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d854c66-6c59-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 10:52:32 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-553d52cb80dso753938e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 01:52:32 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b63375ca4sm1584998e87.124.2025.07.29.01.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 01:52:31 -0700 (PDT)
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
X-Inumbo-ID: 5d854c66-6c59-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753779152; x=1754383952; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDyBEr2C8bHK7ao0mUQj4cm53R0gNtsq0NOW3g9oj/Q=;
        b=db156OoRdO7FLd0Qparg/NbLUPz/jB1wrZBPGAs5B/QPOeHVj7r1uAZIcSQpH0ZQKX
         HjPavgFll/IgwpYUuI0xFVNJnoT/rEFy0pVOBxGsUAC5Gv4c8JfzR/MT4MltJVIhArlB
         o/qkP/im+HDYtNb7iUd+2ROCNUmvdiG133ydTkbt8oKfrCW87ClDeOjaFYkwaR35UGKZ
         L+zAcBVvEsFJjR2zGzmB/ys5vCr/MiY801lUEcV6WE4bab2ZjY4Q6/Q3OAZF5gaJBbpq
         Hwl/KESTrttWgjBLei8pnXhs2O66IXBaDtMqtwgbcHDsPfhseMyILEedtPReO0HGrwz3
         +b+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753779152; x=1754383952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDyBEr2C8bHK7ao0mUQj4cm53R0gNtsq0NOW3g9oj/Q=;
        b=uEPTFBhR7toO/LLDhwJ0ayP6nJtmGvfIO3lRVo/0WNJe2y8OGCAkARqt/K0TCvF0qA
         xGx6qaEi2xOdWMkWY/NerH+EIZf+izO12dVWFFU+eTuVMKTEAhsWZXSfC3ZojU0FnphR
         KdLa3rr25O1C0kTk4LIz4kwEml4vVjbC0u5LQgzalB44GLKdR80SvIvxWwdwkQkjBinO
         ulwSRMkTnLU41xLnjMrAqkG92D0nm+3mEW3tO/cYd/Bu6C934uMk27WqtWUREIG+DRCu
         FRq6BexjlObOqJtmQygHd/MY1YdH+OohOkSi9Zfp+l2EcQS4Wnu1W0BMAnOoYKqa4avo
         FA2A==
X-Gm-Message-State: AOJu0YwbJ5esrGpEfMYzYHQBMspMElb5+ZJuyrJX9KT2X+0o4rmN/d0m
	nJYSgwxWJaK1ScziTFub/LKY7zXGP8u19ABIhADjGl7B6PGSHMgeolsoL7KhyQ==
X-Gm-Gg: ASbGncu0sf9AhvXwblVw+BAOw++StA0W56lVdESVVn7aIxTNhDHHwdyB8pxUTGVV+Uv
	MJWapMA/x5M5p+8U66ghu2ZMTthgnF0Y7AJJFv6Hlh2zLXFn2Fft4x5VvjqLCjPltiUWA400q/E
	ewTKecUnqA01/+1Bda1Ii/tzupUJZrkrmplV5XWPkY73/35WMRNY6M8nQfVDWh1iVfLYXKYC6GM
	WQxe94KS6DaFBCNZOiPZVlEE+5vpKJQ/HGnPW/D7YFUhCZ+xuA3bFdro2hFVh8npD+tr1bJOr5G
	WhTVWAjBmOmg3C9CafqyRlZQPFcibNoaQgcQO6cov1lmiFqkmtkQtuXbi7fLclS1JGeAWVRJ+f6
	s4DMY+m6SJS85Fyyz7NAZ8FexLDLXA/YSmAM7myM0gYdeziJ1oMQCHTxX39HFkw==
X-Google-Smtp-Source: AGHT+IG00e5CNOhPm9nLcQAujxigG0NIrDKy/rNQ+T8MbM+PLgKf+X7db2inhj3Dd/YEfcDWdGqfMQ==
X-Received: by 2002:a05:6512:68e:b0:554:e7ce:97f8 with SMTP id 2adb3069b0e04-55b744c4993mr699034e87.15.1753779151767;
        Tue, 29 Jul 2025 01:52:31 -0700 (PDT)
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
Subject: [PATCH v7 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
Date: Tue, 29 Jul 2025 11:52:13 +0300
Message-ID: <bf884274a318f9c4a965887d87189737542ca2c0.1753778926.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1753778926.git.mykola_kvach@epam.com>
References: <cover.1753778926.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add a new entry under the "Virtual Hardware, QEMU" section documenting
support for the optional PSCI SYSTEM_SUSPEND function exposed to guests.

This function is available via the virtual PSCI (vPSCI) interface and
allows guest domains (domUs) to initiate system suspend operations.

The feature is currently marked as Experimental.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
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
index 6a82a92189..b5ab049b52 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -962,8 +962,9 @@ Emulated PSCI interface exposed to guests. We support all mandatory
 functions of PSCI 1.1. See below for the list of optional PSCI call
 implemented and their status.
 
-   Status, Mandatory: Supported
-   Status, MIGRATE_INFO_TYPE: Supported
+    Status, Mandatory: Supported
+    Status, MIGRATE_INFO_TYPE: Supported
+    Status, SYSTEM_SUSPEND: Experimental
 
 ## Virtual Hardware, QEMU
 
-- 
2.48.1


