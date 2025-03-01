Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40019A4AAB4
	for <lists+xen-devel@lfdr.de>; Sat,  1 Mar 2025 12:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899371.1307695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1toLF8-0008PN-0I; Sat, 01 Mar 2025 11:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899371.1307695; Sat, 01 Mar 2025 11:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1toLF7-0008Nl-Pg; Sat, 01 Mar 2025 11:42:53 +0000
Received: by outflank-mailman (input) for mailman id 899371;
 Sat, 01 Mar 2025 11:42:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tn84=VU=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1toLF5-0008Nf-Q9
 for xen-devel@lists.xenproject.org; Sat, 01 Mar 2025 11:42:51 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4be08d6a-f692-11ef-9898-31a8f345e629;
 Sat, 01 Mar 2025 12:42:47 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-547bcef2f96so3201890e87.1
 for <xen-devel@lists.xenproject.org>; Sat, 01 Mar 2025 03:42:47 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494d7ac5aasm529435e87.120.2025.03.01.03.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 03:42:44 -0800 (PST)
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
X-Inumbo-ID: 4be08d6a-f692-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740829366; x=1741434166; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o7rdHeuTiLHsNiFBTjiGacTB6Tl3gcIRWl5yc+vYoC4=;
        b=DdCNkDiWmgjo0mpQ04WaH5Cg8UyEsRNmom5rQs+USJHU0AIoSQbbRpraNxE3VYsbkh
         F7w/zKiVK6t6R+fB/QGJg8F8bju7Ts2Zyyt59t24bakk57Zq8yfs6+RbXy8KrmkOuvdF
         R1PrLdkpLTUnrZWByVs644rW19tf6lH6GLjiEHFO6IxcQUokF88x8L1s3TBoC4z2sMVq
         nKrXJaz2F5//wGejqgYCSdh1J/6EJkN/Y02XvjZEUrixdC9NhSADlk6x9U9h7hGQJcpD
         mPdhbRMO1yTYk6qFHwxMc242UT6rsrf4Tf5TFLIwEM40wOWS4xQVNMNfu6jSVqFLanDe
         0ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740829366; x=1741434166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7rdHeuTiLHsNiFBTjiGacTB6Tl3gcIRWl5yc+vYoC4=;
        b=XsPaOVvmmCd7hH/wQejMtYWpvdcXOIerV5TYAK8QRSZ2c9ORekxPJIrPnLoPMLhzuc
         3ZUPqho5x9BOfelkqFTh+3jFbqkxE03abgzWtP6DhZjWV7k2oQ/P2v/DNYMFJSH5sb1W
         vrO/ydrvMdopre/UgPW9RFaqbGwUgEBnukHxUN0cdsIBNzbGSjPr7OsSxOX7v6U7IAio
         xBkpgVLGRbPNjhEGLLklqDzhhqdnXi3K8h8VzkDUNHN1OdVWSRWACQUcSrt74Cnbxhd5
         36bDZT4Okgv69CbYGBGp1OKzOSSnyEzl3pDy40VZcIQzXSWWUNqqICSkeGl7VHcJTSen
         uG4Q==
X-Gm-Message-State: AOJu0YyTyZVl2fYhAvlFIhiqrpPzVELJAj5YgNsrFqkA9XLgv6aduT1p
	MWIFNOb74x4QQII8ObYmQMZ7srEUheDNsxmXPEcIZbcpfq5TpFoHIc2PufnR
X-Gm-Gg: ASbGncsxxIXxCJrrA4vTwC6u3R2Fq4E3YbvpH6voC9iJxmIf0f4W89FzRZyClH8k7d/
	6UZ0XVR6at3dz+S8vABIlukA8H2p4ySHXwSBIgZwz387erXo0guHbc6M7Krt7uF3PImEPgY2iAN
	vwQKCio9MVbEnvVFUvjYpwxmr7rof662TmX+K5Vc0xjjqvLEdDdE8xb5+DeNHTWAVNICPBWIa2W
	8m0NfaPKL64Rw6hADd90uZX15FqnqhIR1YqLnIfV4Iq+VYz+kE/dAalmyZsVXaipGkrd2PjeQER
	w3FU+Yxz6YMleUIZMlfS46vk78chJd9H4VlwKKnk7NVl8+S90lHKXw==
X-Google-Smtp-Source: AGHT+IFKevPsZgSTAToH1G7zC3BCyInq6RkNb24XBkXrQFQHygG9rz9fab1NrsJXEkFueM4hxKDJng==
X-Received: by 2002:a19:385a:0:b0:545:3031:b4d7 with SMTP id 2adb3069b0e04-5494c11195dmr2010711e87.6.1740829366076;
        Sat, 01 Mar 2025 03:42:46 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andr2000@gmail.com,
	sstabellini@kernel.org,
	Artem_Mygaiev@epam.com,
	jbeulich@suse.com,
	Luca.Fancellu@arm.com,
	roger.pau@citrix.com,
	marmarek@invisiblethingslab.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech
Subject: [PATCH 0/4] clang-format with examples
Date: Sat,  1 Mar 2025 13:42:38 +0200
Message-Id: <20250301114242.93650-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hello, everybody!

In order to continue activity started at [1] I am sending this series
which allows to manually run coding style checks and does not provide
any automation yet.

Only the first patch is the goal of this series and patches 2-4 are for
example only.

This proposal disables coding style checks for the project, but xen/
folder: this is done by providing a global .clang-format at the project
top level which disables clang-format and only providing .clang-format
for xen/ folder.

clang-format version expected to be >15 and the latest tool can be
installed with:
python3 -m pip install clang-format
This allows having the tool without the need to compile or install
anything else.

As no automatic code style checks are performed, so all those can be
run manually:

- to see changes proposed to the patch being worked on (not committed yet):
git-clang-format --diff --style=file --verbose

- to run code formatting on the HEAD patch:
git-clang-format --style=file --verbose HEAD~1

Provided xen/.clang-format still has a lot of comments gathered from the
previous discussions. This is for purpose of better seeing why some of
the options have their values. Once option values are accepted all those
comments can be removed.

Stay safe,
Oleksandr Andrushchenko

[1] https://lists.xen.org/archives/html/xen-devel/2025-02/msg00800.html

Oleksandr Andrushchenko (4):
  Add .clang-format files to enable manual coding style checks
  [EXAMPLE] Provide an example of a malformed patch
  [EXAMPLE] Changes done by clang-format to the previous commit
  [EXAMPLE] Whole file code style formatting

 .clang-format              |    5 +
 tools/xl/xl_info.c         |    6 +-
 xen/.clang-format          | 1380 ++++++++++++++++++++++++++++++++++++
 xen/drivers/char/ns16550.c |   13 +-
 xen/drivers/pci/pci.c      |    8 +-
 5 files changed, 1397 insertions(+), 15 deletions(-)
 create mode 100644 .clang-format
 create mode 100644 xen/.clang-format

-- 
2.25.1


