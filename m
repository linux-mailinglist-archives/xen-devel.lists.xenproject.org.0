Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C85491463F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 11:23:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746437.1153493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfui-0006Om-TH; Mon, 24 Jun 2024 09:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746437.1153493; Mon, 24 Jun 2024 09:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfui-0006Ln-PM; Mon, 24 Jun 2024 09:23:04 +0000
Received: by outflank-mailman (input) for mailman id 746437;
 Mon, 24 Jun 2024 09:23:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dlsF=N2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sLfug-00067F-Of
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 09:23:02 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59959d95-320b-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 11:23:00 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-79baa4e8531so408761785a.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 02:23:00 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce8b366esm295674585a.32.2024.06.24.02.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 02:22:59 -0700 (PDT)
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
X-Inumbo-ID: 59959d95-320b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719220979; x=1719825779; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qaxPYdpB2KlsuDyrkCqRVkZTlJTJ1gBe5YPrFDEJb6g=;
        b=KhJ9SmjjYiQvxGvvETJ7oVfB/8DxuhZQ05VOGEAFER8UYtSwW+NTOwcA7OS4asaWWM
         r/soQHJ8yyY9I8+fInSgwKvfvWi3VAIX7HzZTxqA8uL0bRJ0R+5l8mmxXA4H5rFAHIUL
         IyBuggAVfbqc9B6uINMKdZ/75ACqx3pSWwbuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719220979; x=1719825779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qaxPYdpB2KlsuDyrkCqRVkZTlJTJ1gBe5YPrFDEJb6g=;
        b=P7dKZ2925vjJ+IZBqbKZqF/fjppa/XxV4dILBa5RMj+m6EzPvUiSvb10QEyJxSehDi
         3gCFW/vbLpjn+lJrtlcl9hS6iudQ44R8eNVWKRdW+Qf+0bgP/aF++ybmIkEB3/HmAOWS
         6DwwzfoaBmAE52C0XaRAXOp6LAKTd8o43a1rfYwql2t7tgCPkWELapbvW5UZCuZ5FcyY
         sqAtmZwldWEk9uvh71gbCV+2KImsp3XnSZxTTluk5hvCNQiHfIfWqCugYAcgx5ZASUtd
         RbltOX39ft4+MU0iHopqH8IeBtflFP4W58ZAYBx4mOyclPTkiXVN+NsqlpJoB4aSUXIl
         /1vg==
X-Gm-Message-State: AOJu0Yytz+s35HrJZpIngDOfaspqhO43fco3jrGvo2TwmwPAVVlTNX1P
	YECFLiK2fRivVPiJTA20eOC+w1Kf0/QxwOO7O4uoZ7jI/YyDukm4nXTQt1gdiwhddbbC4qZ3k5W
	v
X-Google-Smtp-Source: AGHT+IGUfeHEkQula0SkYff68VVcs4bR7JTER9swn2noVcGbRAK1BPVKQQzI7JUAZ02j8HqjHdve+w==
X-Received: by 2002:a05:620a:4556:b0:799:2d50:14a3 with SMTP id af79cd13be357-79be4492050mr644350585a.0.1719220979314;
        Mon, 24 Jun 2024 02:22:59 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH for-4.19 1/2] CHANGELOG.md: Fix indentation of "Removed" section
Date: Mon, 24 Jun 2024 10:04:10 +0100
Message-Id: <20240624090411.1867850-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Community Manager <community.manager@xenproject.org>
---
 CHANGELOG.md | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1778419cae..f3c6c7954f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -31,12 +31,12 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - libxl support for backendtype=tap with tapback.
 
 ### Removed
-- caml-stubdom.  It hasn't built since 2014, was pinned to Ocaml 4.02, and has
-  been superseded by the MirageOS/SOLO5 projects.
-- /usr/bin/pygrub symlink.  This was deprecated in Xen 4.2 (2012) but left for
-  compatibility reasons.  VMs configured with bootloader="/usr/bin/pygrub"
-  should be updated to just bootloader="pygrub".
-- The Xen gdbstub on x86.
+ - caml-stubdom.  It hasn't built since 2014, was pinned to Ocaml 4.02, and has
+   been superseded by the MirageOS/SOLO5 projects.
+ - /usr/bin/pygrub symlink.  This was deprecated in Xen 4.2 (2012) but left for
+   compatibility reasons.  VMs configured with bootloader="/usr/bin/pygrub"
+   should be updated to just bootloader="pygrub".
+ - The Xen gdbstub on x86.
 
 ## [4.18.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-11-16
 
-- 
2.25.1


