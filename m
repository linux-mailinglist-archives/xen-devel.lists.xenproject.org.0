Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2609AC85D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 12:58:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824523.1238661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Z43-0000Rs-NE; Wed, 23 Oct 2024 10:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824523.1238661; Wed, 23 Oct 2024 10:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Z43-0000P2-JZ; Wed, 23 Oct 2024 10:58:07 +0000
Received: by outflank-mailman (input) for mailman id 824523;
 Wed, 23 Oct 2024 10:58:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jJ8W=RT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3Z42-0000Oq-04
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 10:58:06 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad5886f6-912d-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 12:58:04 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9abe139088so110184266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 03:58:04 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91571e3asm462067266b.147.2024.10.23.03.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 03:58:01 -0700 (PDT)
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
X-Inumbo-ID: ad5886f6-912d-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729681082; x=1730285882; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQPh81xtFENULW7Sdg6zMAc0S3AL4e1v95IRrppl4HM=;
        b=JkxUAWBxu2hsyvt75MsOiLfWP97KhX1oJdIcKF73gPRjn4DdeYewuBG3ebh3x8uxdq
         VKvSJ6X1qh2yvEwrdPNZA7h9p2bAT3QPVomEyVtsmJAlyU+0yrpRJ8g/JehMBWuK2Pdi
         7faWl/qbECeHDYral2kSlu2hAIe3pcdNUonDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729681082; x=1730285882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQPh81xtFENULW7Sdg6zMAc0S3AL4e1v95IRrppl4HM=;
        b=AXBU48W3sGAmhgabESi2+J0AWiK2XXe0eMRolxbRjBYUx6yKJF2diS4UgF9uKiWEjm
         iU3l4/z6rJP7fqplQmTxziRx/uLofisom+gcTnF000GTHH1UaXaT6LP8sSp52jACNGzI
         7tjE4hrwaX4w8VXbOG+p9UDUzRPMcM/SnAgvPJbpKWCMSeZkPB9lSDxUYwSVKbyldNeQ
         aQa4ElQGbxsFhPMH5dXojbL5k//X5GSidOYlo1ujKJtMhUWW5jAAKFcfQYZIHPyp78AE
         Gj6AHipT/Z66k1HN+Aee1R8UlRx48K2QAbpk33sFK/qvz2VgdzQHCC6L+mJ6AeGduICz
         AVww==
X-Gm-Message-State: AOJu0YwJ5d5+xje4HKb66LbUPDxXnMM9Xu5c6KDxgPKFz3ab2sWX9CtT
	0WFeoZNmtUMSAeAYZlKyzG3G5Ey0AHBESI2fW1L4kvEYi7+ul1CCPG0qnGV3evJQFuN4nq0T5c0
	h
X-Google-Smtp-Source: AGHT+IH9UbSKHDQ9RVjImqa6qbXpoZhnVDX+40rh+9cycN7R/md5b3FIPux7uuJDwtgfj+oMO76KIg==
X-Received: by 2002:a17:907:72cb:b0:a99:f466:a87a with SMTP id a640c23a62f3a-a9abf84b5f2mr218160066b.3.1729681082331;
        Wed, 23 Oct 2024 03:58:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 0/3] x86/boot: Yet more PVH module handling fixes
Date: Wed, 23 Oct 2024 11:57:53 +0100
Message-Id: <20241023105756.641695-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It turns out microcode and XSM module handling has been broken ever since PVH
boot was introduced.  Both appear to have have gone unnoticed because their
functionality isn't typically used in PVH guests.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1508716668

Andrew Cooper (1):
  x86/boot: Add a temporary module_map pointer to boot_image

Daniel P. Smith (2):
  x86/boot: Fix microcode module handling during PVH boot
  x86/boot: Fix XSM module handling during PVH boot

 xen/arch/x86/cpu/microcode/core.c    | 40 +++++++++++-----------------
 xen/arch/x86/include/asm/bootinfo.h  |  1 +
 xen/arch/x86/include/asm/microcode.h |  8 +++---
 xen/arch/x86/setup.c                 | 10 ++++---
 xen/include/xsm/xsm.h                | 12 ++++-----
 xen/xsm/xsm_core.c                   |  7 +++--
 xen/xsm/xsm_policy.c                 | 16 +++++------
 7 files changed, 43 insertions(+), 51 deletions(-)

-- 
2.39.5


