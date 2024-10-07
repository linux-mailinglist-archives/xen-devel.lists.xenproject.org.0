Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FD7992886
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 11:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811822.1224491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxkTt-00062y-08; Mon, 07 Oct 2024 09:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811822.1224491; Mon, 07 Oct 2024 09:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxkTs-00060k-TO; Mon, 07 Oct 2024 09:56:44 +0000
Received: by outflank-mailman (input) for mailman id 811822;
 Mon, 07 Oct 2024 09:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arWC=RD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sxkTr-0005wj-FH
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 09:56:43 +0000
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [2a00:1450:4864:20::542])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73dc32ee-8492-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 11:56:41 +0200 (CEST)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-5c5bca59416so5825697a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 02:56:41 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05951b1sm3035174a12.2.2024.10.07.02.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 02:56:40 -0700 (PDT)
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
X-Inumbo-ID: 73dc32ee-8492-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728295001; x=1728899801; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qHhCBcNpd/KLyJyzncZuqeqe+vPakOjSHrt3vvS/2Jo=;
        b=kuZCC4SintgL7nyYSXtXwPSUkNDgAUEdBHhjp2wr8pCjHmDs8udnhjGi/7Qbdl4Ur6
         XdXw6fv7v2GZ9ZXLDvLgI0BU6udEN0TnFapHkfcIjBOjHI9lZWIbzoag+sc2A3UxVtC3
         qY4GbiK2I68pXCetguapIFAm2cdvdTs45pjlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728295001; x=1728899801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHhCBcNpd/KLyJyzncZuqeqe+vPakOjSHrt3vvS/2Jo=;
        b=XOrMMUfrhkCVwvJErktq2sY5D2j9rZhL7wIjUN7cCprPYiFKTjuRM3DXt+b1Pzm5gj
         IqM4S6ocfw6AQSXTZf3aHD2PvjH2fBGLiHs6RANG8e/sz9t6gQMSEF7wRb7vOnUy2SJ5
         45wwTqmKGic+lQXg8nrpliaHGX1wysb90yZIQT5nlArVlSU1a5Yv8C6rODESa0x9jeip
         uJYP/X8Fb1p+4tBa7zvB1cUl0YUoky8m3lg+442pfuuebCq7P3mOcmybWrwKQGVvXYUd
         +Ww6oMKsHGdCCC9F7pbQJgDpDJ4MT1F3B+IUUOZhi9I8zc5rGTphpyGr6UHvCjbE4aNo
         dknw==
X-Gm-Message-State: AOJu0YzpVN/93N+7HfdOgUwxyG6b3K/W/wBW5PyfPCVW7pYIX1zNZJnE
	PXtB0Iskmdbv0P+x9tm2YrIrcOrtcEKmTEgjnS7ogd7mbO1KklMjLqs4C2QtPLG9AWXW2yCgLjZ
	dILW75Q==
X-Google-Smtp-Source: AGHT+IEsfMlBsnx6myAc9pYHzi5NQg31vWwoVZJKvx8ua+J7kSNa0iRT7Rlm4deS5sO/HmpAq/k+IA==
X-Received: by 2002:a05:6402:42c8:b0:5c2:5f0a:4a3e with SMTP id 4fb4d7f45d1cf-5c8d2e262ebmr9357977a12.12.1728295000713;
        Mon, 07 Oct 2024 02:56:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] CI: Drop bin86/dev86 from archlinux container
Date: Mon,  7 Oct 2024 10:56:37 +0100
Message-Id: <20241007095637.2450599-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These packages have moved out of main to AUR, and are not easily accessible
any more.  Drop them, because they're only needed for RomBIOS which is very
legacy these days.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Repost now that stubdom is fixed with GCC-14
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
2.39.5


