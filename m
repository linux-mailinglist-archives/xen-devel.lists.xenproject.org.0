Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8006926343
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 16:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753085.1161371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP0qD-0004dA-9a; Wed, 03 Jul 2024 14:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753085.1161371; Wed, 03 Jul 2024 14:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP0qD-0004XD-4c; Wed, 03 Jul 2024 14:20:13 +0000
Received: by outflank-mailman (input) for mailman id 753085;
 Wed, 03 Jul 2024 14:20:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9qc=OD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sP0qC-00047s-6p
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 14:20:12 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b1b7683-3947-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 16:20:10 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ee794ec014so18165041fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 07:20:10 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f036sm7114707a12.34.2024.07.03.07.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:20:09 -0700 (PDT)
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
X-Inumbo-ID: 5b1b7683-3947-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720016410; x=1720621210; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lb9zIjpdzbIG9uZJrlfskajIoTEnVCNUYPBFJFnVoHw=;
        b=Eq2I9+5S6b/o8YLmnrpE/mFHaWay0QXxFLOkEZoIj+7mNONp/okVDm8NTCoXhDGsi4
         ESfdLSP1c2CIcjz43/CiKUdVBeBfvsmRT0Lfhu3hdGDb//SIy65xwZ2NL6Ta03troPxS
         F6wcmTcthFZj83g88+lTPZ4za1RS7ccQYdouE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720016410; x=1720621210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lb9zIjpdzbIG9uZJrlfskajIoTEnVCNUYPBFJFnVoHw=;
        b=m+bHlj9U8jm9vNP3nTmhoqBgTYq6oAnph2CAg1MBagZ6QjhLZuTBPJ79dh8QuYTCjb
         HTWfcZdpHUZDkRfe4nzu6yEmO1JBbrkAgzrl8qHENJHP7Gg9YiRH36PysBSuq1O1Nfv3
         qLOoaYJfBRr4mrsDx+OShL90n9KWZy9RRnGQlpi1UQz63spzh1FfrdQXnlMYROIDdNoy
         nQUP4DCS+D749AVVzAviU87ea4W7mY+DdEoU+D57jBOjbSgOrgLl/stH06dHO9Xm8BUM
         X+XrKVKiaC/44EvzjIb2OcTrZMf0B/Yad8menR8RK0tsZzYkI5bhxs/EaoNyXsKndD98
         VWnA==
X-Gm-Message-State: AOJu0YyswT6h+PT/iS6WQN8tN2ax2Vciup662vdz4VX5Sd+wfTGnfP0G
	DdDieFUOUbrEvNdnyZixXei5l98CU9xt2UCswQ15C4M/N7zi4ylaLHEQ9WF/hRZ7fkDsn9X+4xV
	ZF+0=
X-Google-Smtp-Source: AGHT+IGoVb58lDyzwPW1lCAVOWyXOeRtDEU7EFwWe6dpZNqkqMntE/OoIykqSAbrcBDP9D8uDC1Jzw==
X-Received: by 2002:a05:6512:282c:b0:52c:e01f:3665 with SMTP id 2adb3069b0e04-52e8266ef2bmr9209184e87.25.1720016409741;
        Wed, 03 Jul 2024 07:20:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 3/4] CI: Drop bin86/dev86 from archlinux container
Date: Wed,  3 Jul 2024 15:20:01 +0100
Message-Id: <20240703142002.1662874-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These packages have moved out of main to AUR, and are not easily accessable
any more.  Drop them, because they're only needed for RomBIOS which is very
legacy these days.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/build/archlinux/current.dockerfile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
index 8929e9b5f022..657ddd77a85c 100644
--- a/automation/build/archlinux/current.dockerfile
+++ b/automation/build/archlinux/current.dockerfile
@@ -6,10 +6,8 @@ LABEL maintainer.name="The Xen Project" \
 RUN pacman-key --init
 
 RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
-        bin86 \
         bridge-utils \
         bzip2 \
-        dev86 \
         discount \
         dtc \
         e2fsprogs \
-- 
2.39.2


