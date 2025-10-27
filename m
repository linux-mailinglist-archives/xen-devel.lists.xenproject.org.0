Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC53C11A80
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 23:17:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151819.1482354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVWZ-0000ti-Aa; Mon, 27 Oct 2025 22:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151819.1482354; Mon, 27 Oct 2025 22:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVWZ-0000r1-77; Mon, 27 Oct 2025 22:17:11 +0000
Received: by outflank-mailman (input) for mailman id 1151819;
 Mon, 27 Oct 2025 22:17:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kuhB=5E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vDVWY-0000qq-7s
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 22:17:10 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad906cf4-b382-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 23:17:09 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47719ad0c7dso439225e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 15:17:08 -0700 (PDT)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475de57b156sm148785595e9.13.2025.10.27.15.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 15:17:06 -0700 (PDT)
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
X-Inumbo-ID: ad906cf4-b382-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1761603428; x=1762208228; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Sb5SD3pBvQ5uxtHopREOmW0xwkP7MusILvgCF1UZSo=;
        b=cugG+I2tiPOMm1O6nzV9nIV5x8e59YHs+3qVBpaqoYrwGXF8OL6N2JVciz0iCD//he
         gtrbQ0n//Hmo4nWf8POo5pXVVaQjUycL4yc1+ry6BJ34dQiJc/VGAOoUJKCZKHZh/ZlC
         F8oWJe8OLXuWAi7wX5hAhIMvMVD7pd2VloDL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603428; x=1762208228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Sb5SD3pBvQ5uxtHopREOmW0xwkP7MusILvgCF1UZSo=;
        b=WY3BtxDwI9Ozgt5uC3Xdn09kAWKVfx3+urjNeAygC8WmF/rp/EEWVI9TSz2x3oL60k
         CajK1PQQjiryqlggMy8lChlU/TZd+mS+z89vcrPtwdXhDQxWJ7CEQWrD/0ASU6+3ppjr
         yV3ci0Tn3LzrnqmYVETPVp0PN5Nsrkr4SEdjW0I4wcbxmk9DplN+yieZbteu9z8z48UM
         0+AhCjFF1el/fYUC++P4cOZKXQP1QGFrxhOFHoMpkH+Ph9jC5scymWO4pfy3W8575C1J
         4F8XMNnz1l4YMN43OWcREVHnRpyPkwh6Tg74n7bUZYjRzxpyNSSAMNAYuoQc4jtvP05N
         uV1w==
X-Gm-Message-State: AOJu0YzClGPbFKhJYdpGftPHCcx1fu9N0PVznihwohIjnr4WISTr0Dsx
	KHORV9Mj7aZx2qpgq/njEiw5o17DVxDpNGrzjSuziQxh+/lUcuuCLdT3sHM6nS2l92pWsoFhq6V
	YFYIEwG+WHQ==
X-Gm-Gg: ASbGncvKxc5mkfPH5ZtHVomkjLuWWwbf5BnKCAgWYX0sBYrxIpaIi9rx/6YEaKncMJC
	KMokTzyqSZPizzpMZQ4NezXwSOkSpaLjVBvbx/uU4WJeXNgzrWOLQyUm5g0x7+Q3dZeH7HEhxPB
	ZUZVNoEKkkAM8nmWEDg7/xeCnkajuGb7PvUqF+n4j+D7OnxifUhKZttWHeWZM0bLcnowMHofauK
	aYhQiiPhs0S9r8epMg3uKhmJ3goTcmAZHzY7whU2cE+HUnUo3r3DBIu5RsVsu17UrdIGev+dGBG
	MzoyHAOGU5weexWILAm4bk/fXRSmtMXs919nwxqHZf9Mcj6svg69lTsncZ83hpScyWFIBl3V2oZ
	HOeEezqDCMwlPRTTTOxCmbLcFYh3phsiFnuTJ2hTQuZV+21kP11zpa++0/SmH6tsMfwZPal693i
	ubPZl8ck4kZPayAw8++8wvW+ZGSLgFRzc3vTQr7geem/TKJJ1QFC/4cFtPRuTvAA==
X-Google-Smtp-Source: AGHT+IHDhGN5b8Bk0dhm4lv/ONNhf+W2/lKwrcMYTU0P1Zshe6tYaTY9L/tHq1UsVTrmZZFUqqKiBw==
X-Received: by 2002:a05:600c:6303:b0:477:fad:acd9 with SMTP id 5b1f17b1804b1-47717e40960mr12895195e9.34.1761603427991;
        Mon, 27 Oct 2025 15:17:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.21 0/5] x86/ucode: Support loading latest ucode from linux-firwmare
Date: Mon, 27 Oct 2025 22:16:57 +0000
Message-Id: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

linux-firmware now contains microcode signed with the new signature scheme.
Xen currently refuses to load these as we've not updated the digest list.

The plan was always to stop using the digest list in due course, which is what
this series does.  A fix for the RDSEED vulnerability is imminent, and it's
critical that Xen can load this microcode.

As such, this is intended for backport to all trees including security trees,
and therefore really does need to get into Xen 4.21

Andrew Cooper (5):
  x86/ucode: Abort parallel load early on any control thread error
  x86/ucode: Refine TLB flush fix for AMD Fam17h CPUs
  x86/ucode: Cross check the minimum revision
  x86/ucode: Refine the boundary checks for Entrysign
  x86/ucode: Relax digest check when Entrysign is fixed in firmware

 docs/misc/xen-command-line.pandoc    |   7 +-
 xen/arch/x86/cpu/microcode/amd.c     | 158 +++++++++++++++++++++++++--
 xen/arch/x86/cpu/microcode/core.c    |   6 +-
 xen/arch/x86/cpu/microcode/private.h |   2 +
 xen/arch/x86/flushtlb.c              |   3 +-
 xen/arch/x86/include/asm/flushtlb.h  |   5 +
 6 files changed, 165 insertions(+), 16 deletions(-)

-- 
2.39.5


