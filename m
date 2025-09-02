Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39829B3F986
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 11:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105850.1456692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utMvn-0000jR-1h; Tue, 02 Sep 2025 09:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105850.1456692; Tue, 02 Sep 2025 09:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utMvm-0000hF-TW; Tue, 02 Sep 2025 09:03:58 +0000
Received: by outflank-mailman (input) for mailman id 1105850;
 Tue, 02 Sep 2025 09:03:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/no=3N=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utMvk-0000FD-Pp
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 09:03:56 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0ef90bc-87db-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 11:03:55 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-55f7c0fb972so1927606e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 02:03:55 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827aabf5sm524019e87.137.2025.09.02.02.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:03:53 -0700 (PDT)
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
X-Inumbo-ID: c0ef90bc-87db-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756803834; x=1757408634; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xe9xi3DaBptNnLW1VEAJiUhAp27nm19FtXNKIdaX+1M=;
        b=dUL+aX5qWSZNxFaHkRwM5RoMixoEbY9aAmIg18v57t7A1EVRjEWvnZ4AjSwunaiisp
         JULIoYOv/TGfcFANWe4Blc/sVPv2I6EoJS9LbZdoHcENy1kT4NIukxB3IA6GmO1xRSCn
         Fr6oOQKbq9L3TzMvvXYow0kuLBGfEkEonRvqa+iI7ZRfpwNt8qnW7WygKXxIuK6iCaoi
         y3S64km5zL5+BXF1hmwJ0AonUid6oPTjjltgJzsLfnEFsJSwBszSTfQ7mSWPC4pM/CbI
         zN4MZLikh6JoV2s54/g/F28mj5R3VIN8/prMfkO/jKGmFOJfwRxh0w260cdrC9dcmtH2
         Srmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756803834; x=1757408634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xe9xi3DaBptNnLW1VEAJiUhAp27nm19FtXNKIdaX+1M=;
        b=RXj3rcckjFrWnmfxc/iCA0mFawvAYJPW6UpUMcsdJ5EGLESh4E01sJu5H5JHilELeQ
         rxINy4tToFhHu4mFPg4o4Q1kHAXDtF0CDluLqRyVP6QVKkafOTpVto3S4HRg+LtO/3nJ
         jerY+MRP0UqfjUHjxn243wLy4EAGaq/rp1RcRiLjDiezfpzZmAOConrps9exT28MOcnW
         OIzFehifD7V9lgY4V2QILxYOpqN+F65i9ZLMJFkXbtts+XoBjNVogko7m8tgBdZl/SeS
         JDoX11Udj7Nej0e9cIqfFEXhYWIR6pFaI3VhkU5iTu03Q8iEC5wcaMycQ4h6KevvKife
         N2hw==
X-Gm-Message-State: AOJu0YyzGXM6IIiyP3iivgV8YEK8VJroT/lnRmXCKSYrx9CBnzd7/IC7
	0U/XQRDYCSta1f8FxyHC28bm+37MxpOKEN8QxHw24HI66Y0THVqqqOh6GHx5VLMq
X-Gm-Gg: ASbGncuMmzVY8G4M8JMGFW9dkzugjEfflxUI5efqgAJ1SgFdFWXq9RReUFDRVB4uimc
	5PB7tKd13uEsmgeERURJ+HfYjAxqFYEVE5PPmFwCuWD5bdbVpGIEI1qlpElEBTHPU9waN/MEd+M
	OlB8bhHKlupKb5qhi0plSYxL5i6e0o4Ev56p/gzsHJgAg0tguzFyP4dcJd2KQOuJrU0yCfiegky
	y/rfrdqr4cuDqbQssJq3QQ0vS2sSrQZPthbsL+EydjkC0L1fBdfzp3t54eZYDtHpKW1bZp/swFg
	SRvZVb+Jp70wUk5yiE04mCFuge1AvahHWgAHDo32AQ5LjkIp11dY/eHY+fCzV3TlLsUyxt8NEbM
	BL4NQb9rj0nWS9/6WnrVqhxT0+7R3RWvrWfZSzpt3wuJ/57fSPFN4UlAkpgGRyvukTsPXhaSv
X-Google-Smtp-Source: AGHT+IHNUanPnwKzxrXpPti+ujHJgeQYiDpY8lmWUWwQAx5lCpBYMktXUYgjBdwMwKKiXPGz921lJA==
X-Received: by 2002:a05:6512:12c9:b0:55f:5428:eb72 with SMTP id 2adb3069b0e04-55f708ec77fmr2907330e87.35.1756803834283;
        Tue, 02 Sep 2025 02:03:54 -0700 (PDT)
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
Subject: [PATCH v13 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
Date: Tue,  2 Sep 2025 12:03:47 +0300
Message-ID: <9dffe19e3ba29020a8f35c0fcf12f088de6b9eea.1756803419.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756803419.git.mykola_kvach@epam.com>
References: <cover.1756803419.git.mykola_kvach@epam.com>
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


