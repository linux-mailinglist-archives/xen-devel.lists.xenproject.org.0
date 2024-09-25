Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D3E9852BD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 08:02:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803447.1214010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stL5U-0002oH-9N; Wed, 25 Sep 2024 06:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803447.1214010; Wed, 25 Sep 2024 06:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stL5U-0002iK-5Y; Wed, 25 Sep 2024 06:01:20 +0000
Received: by outflank-mailman (input) for mailman id 803447;
 Wed, 25 Sep 2024 06:01:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N7N=QX=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1stL5S-0002f5-IN
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 06:01:18 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 937a803f-7b03-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 08:01:16 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so2707235e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 23:01:16 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf49de00sm1498937a12.55.2024.09.24.23.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 23:01:13 -0700 (PDT)
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
X-Inumbo-ID: 937a803f-7b03-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727244074; x=1727848874; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FRP1NgZZChvmIZJaJCWjg7esr/c+9w6d4k/N1pOdR68=;
        b=kTUtDfUDTVzCcuDSRy1NYCwHWC2FP/gazHZC4+c9u6FRUhEifapjoa26WCf2ijF6Ry
         DpJiOy823zs6ZKSKoCBckAKAriWBF4gvpNMZlP5hOyJRcvyVsyRQp8l4sUqhUjdjwtcC
         TafGGEM4TCbMr/6EQU5W3TVDtGJMfmfM/QY0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727244074; x=1727848874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRP1NgZZChvmIZJaJCWjg7esr/c+9w6d4k/N1pOdR68=;
        b=jQQ7GnK0t6Vm4aOY+r4PU3cy7v/bdsMT51JkvI2QQ2N96u+X5oKrsdfpck3ZhFjd3R
         JAYRxAHFSAiVoxiQgbyulphJieBiuWtWJwnaAzq7T9QGeIxA+n3rpHcIelpjcVDYSvkX
         WLfpp1P0EAyj6lr9du2gltObd0FR52YLPMUoJBMUl2n4eON0cwa+cLs0/Qo7xO4gUbrU
         34yDwaF4FuKwl/IXZZjQI3sR0+MBeRPnujGO/dozx8yVEUVkFzV93ecLGrvzMDTDLvj1
         OmPyJcB+pcdbwpM2mHOQa/l38Xn8kkJpT7FIph65g+NZx42uJmRBoj9jwJe+Dvb+r7MA
         ULjQ==
X-Gm-Message-State: AOJu0Ywi+MZrZO+a3ehti4oJR4xtoc2SEtB9IX/UqhYae1x1echUTmzN
	x+HVJWNp22UYB8L4ZId8WpjaN/km2szZhtHKXxh3Wmin2y8bVRlUMizJacsio5N+Pz/BZQFKKgI
	8
X-Google-Smtp-Source: AGHT+IHXccxE135266wqYgS+1pQI94dPYff8pDvT7I+VvJQi/g3AsjfreDGwekzu7XuRnV2XsDoVoA==
X-Received: by 2002:a05:6512:39c7:b0:533:42ae:c985 with SMTP id 2adb3069b0e04-5387753181dmr848137e87.25.1727244074203;
        Tue, 24 Sep 2024 23:01:14 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 0/4] x86/boot: Reduce assembly code
Date: Wed, 25 Sep 2024 07:00:57 +0100
Message-Id: <20240925060101.259244-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series came from part of the work of removing duplications between
boot code and rewriting part of code from assembly to C.
First 2 patches rework BIOS/PVH paths to reuse some code.
Third patch rewrites EFI code in pure C.

Changes since v1, more details in specific commits:
- style updates;
- comments and descriptions improvements;
- other improvements.

Changes since v2:
- rebased on master, resolved conflicts;
- add comment on trampoline section.

Changes since v3:
- changed new function name;
- declare efi_multiboot2 in a separate header;
- distinguish entry point from using magic number;
- other minor changes (see commens in commits).

Frediano Ziglio (4):
  x86/boot: Initialise BSS sooner
  x86/boot: Refactor BIOS/PVH start
  x86/boot: Rewrite EFI/MBI2 code partly in C
  x86/boot: Improve MBI2 structure check

 xen/arch/x86/boot/head.S       | 287 ++++++++++-----------------------
 xen/arch/x86/efi/Makefile      |   1 +
 xen/arch/x86/efi/efi-boot.h    |   6 +-
 xen/arch/x86/efi/parse-mbi2.c  |  59 +++++++
 xen/arch/x86/efi/stub.c        |   3 +-
 xen/arch/x86/include/asm/efi.h |  18 +++
 6 files changed, 170 insertions(+), 204 deletions(-)
 create mode 100644 xen/arch/x86/efi/parse-mbi2.c
 create mode 100644 xen/arch/x86/include/asm/efi.h

-- 
2.34.1


