Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDB3914640
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 11:23:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746436.1153483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfuh-00068x-LI; Mon, 24 Jun 2024 09:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746436.1153483; Mon, 24 Jun 2024 09:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfuh-00067M-Ht; Mon, 24 Jun 2024 09:23:03 +0000
Received: by outflank-mailman (input) for mailman id 746436;
 Mon, 24 Jun 2024 09:23:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dlsF=N2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sLfug-00065a-AX
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 09:23:02 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a3fe0a0-320b-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 11:23:01 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-796df041d73so281363385a.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 02:23:01 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce8b366esm295674585a.32.2024.06.24.02.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 02:23:00 -0700 (PDT)
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
X-Inumbo-ID: 5a3fe0a0-320b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719220980; x=1719825780; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWPc4P2X6Wre/VYuOXgHh+AbI8DfpW502T/FVt7NFEY=;
        b=ezknJ48FBRP6gmyB9E2Qx4IGRrSM0TC9kNzEk0vCyQZ0SmVSs8sLTvN39sd4f9FQWG
         PB9QecuLuGhJF/Ink9ZEukwuLPCfXA4jHVgU1zZZ+6hOZPfGy0BGrc7wqj61GqPcd5hM
         W7LgnwhkyKVvFSL+tfzYgmmy+ksDj6+SWglRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719220980; x=1719825780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWPc4P2X6Wre/VYuOXgHh+AbI8DfpW502T/FVt7NFEY=;
        b=SEXYUwAdA37ELcheFKo6Hi0wbQrCcY1Caqli1p8f6IY/Q5q0kvCl+ihnjkhchulLn0
         GYtknqh5uw5dq7ldONfERmkuvvtvSPADYCbPz7QrE0sfx1CxIDIkN2tpgTxzhdigRoD/
         iYnX+c6j8QY5Qfp1KCBm3uO4J1CUYlUxAP5TRUvFPwnr7eAmDNYzF8xg+GqfVywTt9sJ
         yScJ90iRym6fYdNn8/zubgxFmANr3xBDxAhoh08U5HE/mZCyr0r/vfub9fkVh6/8eP1/
         im0GYXy4vu6VGhAE7CLPKvjd0Zs01xe5gc4lRnC4likk1BJxHY4Auka+vsITXJs4U17k
         W/5Q==
X-Gm-Message-State: AOJu0YwYU4/y3e8MuadEjtdK0IHKHM47PfEFugG0sV8YOAOD/vIWeV6r
	PR24H20YzKybF+YdCvX+QpoKGUBNzDmBjtpbC3kCHZOr2OXXQ8j+Yn8In0ZfztVsaT/6tqfDQJC
	7
X-Google-Smtp-Source: AGHT+IEPEE5xQIFyub1fgXWxb2cvAUYv9gFUgdnt/nBUg66ogzsydjUO/gOv3ykkJLrNFOmgi9I6qA==
X-Received: by 2002:a05:620a:2613:b0:797:aa9a:de5e with SMTP id af79cd13be357-79be468303amr561656285a.3.1719220980450;
        Mon, 24 Jun 2024 02:23:00 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.19 2/2] CHANGELOG: Add entries related to tracing
Date: Mon, 24 Jun 2024 10:04:11 +0100
Message-Id: <20240624090411.1867850-2-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240624090411.1867850-1-george.dunlap@cloud.com>
References: <20240624090411.1867850-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Community Manager <community.manager@xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index f3c6c7954f..35c3488f4b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -21,6 +21,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - When building with Systemd support (./configure --enable-systemd), remove
    libsystemd as a build dependency.  Systemd Notify support is retained, now
    using a standalone library implementation.
+ - xenalyze no longer requires `--svm-mode` when analyzing traces
+   generated on AMD CPUs
 
 ### Added
  - On x86:
@@ -37,6 +39,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    compatibility reasons.  VMs configured with bootloader="/usr/bin/pygrub"
    should be updated to just bootloader="pygrub".
  - The Xen gdbstub on x86.
+ - xentrace_format has been removed; use xenalyze instead.
 
 ## [4.18.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-11-16
 
-- 
2.25.1


