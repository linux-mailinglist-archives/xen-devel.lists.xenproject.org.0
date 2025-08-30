Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E3B3CFC3
	for <lists+xen-devel@lfdr.de>; Sun, 31 Aug 2025 00:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1103292.1455111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usTnh-0004uS-PO; Sat, 30 Aug 2025 22:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1103292.1455111; Sat, 30 Aug 2025 22:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usTnh-0004sm-MC; Sat, 30 Aug 2025 22:11:57 +0000
Received: by outflank-mailman (input) for mailman id 1103292;
 Sat, 30 Aug 2025 22:11:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IC44=3K=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1usTnf-0004DI-Ad
 for xen-devel@lists.xenproject.org; Sat, 30 Aug 2025 22:11:55 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55d9dbbf-85ee-11f0-8dd7-1b34d833f44b;
 Sun, 31 Aug 2025 00:11:53 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-336d84b58edso1729731fa.0
 for <xen-devel@lists.xenproject.org>; Sat, 30 Aug 2025 15:11:53 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-336d0e3f39dsm4662091fa.45.2025.08.30.15.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Aug 2025 15:11:52 -0700 (PDT)
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
X-Inumbo-ID: 55d9dbbf-85ee-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756591913; x=1757196713; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xe9xi3DaBptNnLW1VEAJiUhAp27nm19FtXNKIdaX+1M=;
        b=ZIo4I/IvK3ZimOhLCVvBI60rqQ+HbUOhYsXUBmghHZ/1xuxKtkRB671t192vxmxO5a
         QLIMudOecsuOgijigjSyYqYdla1vEDyTBfm+3iqmDNdY6YrBvWbfGJZeZfJwGXxWn0hj
         2JXQ+AbxRQI12tlOtfCQEt3UhnKxnWYxslH608fKCgiI0GLpGEigpri5UlH7TX39EZaA
         XIdfBdUnmKIGbWDhJAICyImdjRsGI+qM0lqOxbe+cIb7VX/MpwporE7PSonJxrhkGYHm
         1UcJo5eWrbrH6G1i/nX2ECU5KAnfZFF8diXk10QuEcd5RQNe15vvR3AJgONvun/k1FkN
         syFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756591913; x=1757196713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xe9xi3DaBptNnLW1VEAJiUhAp27nm19FtXNKIdaX+1M=;
        b=wZhqLWuy0u5l7xX7E5epMFEFvDJQEcoFIJv2jOkqoBHjJJEAeHmO7FHCOStjF5ZCCq
         1SwnRRfQ3Rk6OXBi5agDvnfMCo4yNVPoA/4vYYi2DL64YN0e4j+VDDkrISJ8LB+HIF7Z
         5tbqxIBOkdd3Q40YQMKptkXcWgFF8E7px1zgDyj21xywsQBRaxK8F3OGFAbV6arJrl3R
         ofBpxIvfVOF/vpgwCpoCJNRXpu0RbxQ26KMhsMnZuxtE9ux8lKeDic6gPTjvPoBb5LuG
         LuCVF5JGlmhZrsTNrAsgudhWzW9MSwNK6FYh9ul/nihuA0AacOCCe9sewGwB88wcwnaY
         A9wg==
X-Gm-Message-State: AOJu0YwbyRQaOm9MmJWUMVFVXUSKHz9SYGoZ+VJ5LWmsoMt86uzut48B
	e8nzn+HIz9YKNhItV+5tn4abdK/8wZSAwKdfniisy2Dc9aMIYblxbDNILUwlnHKa
X-Gm-Gg: ASbGncvkff4b2yqWkCF3LwRhunNVK3TsDTAP9nKJ5/TrFNG4v0EXnPpi9GmkoeLEXzA
	8scyEinNXVmNCEXOaPL2Y+F4c5B3tkgIKZ5narycTOxA0GjHDX0REmCogyEqB/gE7025SojcklN
	eh58UjJGvqQF5SUkOnHYm+CC9F5KZHzHbuqJbYghogdStOWLPT4miz/Ban1nJN4t9NR6KlbKXHT
	DSthZxYnrOXg7WtGPm00xQQ2Lc6lfsppw28cEOGAEFmTRDTxqbwyQdjwvcD4voun45wmgOGw6aJ
	7dRcuqc1mtvI2mnOsVF3+Z7pb6P/YrcfIOSXdfPeUB31qBzgy0IB/7P8P1j5jJGXgcwmmFvA87X
	9S5BGgVrH1GeLf0rDC/5dQLTiLg6q0g324WA8O+AvwpJxDN4+q9lghN8IMfjqkB1zctt2LEMY
X-Google-Smtp-Source: AGHT+IH77ALpy5/qrTHYJ4yKKj7vVfKF4r6EliI7dj8DXNBLy9nrw77p8ZXFnmSHYOBdWpJGAYai5Q==
X-Received: by 2002:a2e:a272:0:b0:336:c6bb:10d6 with SMTP id 38308e7fff4ca-336cad3f15cmr4953441fa.26.1756591912892;
        Sat, 30 Aug 2025 15:11:52 -0700 (PDT)
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
Subject: [PATCH v12 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
Date: Sun, 31 Aug 2025 01:10:30 +0300
Message-ID: <e08eb09918f77c57529427019d4e63170970f6de.1756586648.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756586648.git.mykola_kvach@epam.com>
References: <cover.1756586648.git.mykola_kvach@epam.com>
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


