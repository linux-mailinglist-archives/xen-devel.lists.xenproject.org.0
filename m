Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F50A32C5C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 17:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886608.1296250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiFwB-0007gf-WD; Wed, 12 Feb 2025 16:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886608.1296250; Wed, 12 Feb 2025 16:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiFwB-0007eC-TA; Wed, 12 Feb 2025 16:50:11 +0000
Received: by outflank-mailman (input) for mailman id 886608;
 Wed, 12 Feb 2025 16:50:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeD=VD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tiFwA-0006SU-4f
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 16:50:10 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b7e38f5-e961-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 17:50:09 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30902641fc2so12508871fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 08:50:09 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308fcd86801sm6225931fa.40.2025.02.12.08.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 08:50:08 -0800 (PST)
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
X-Inumbo-ID: 6b7e38f5-e961-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739379009; x=1739983809; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6XQT/fXVYcBYU9pHZ1QH688qxoQ3lXC+DXD9oqsi4E=;
        b=HTcBcBbjOYcwVp/hXDsaG69/ebiqwPY4CRJLt0c5p8fiTWpci6X77BLEc0mlNGxJhz
         I3LnctsQ+I62f60bjavkYj31aAXPBjTwLjkGL2KKXRSVXexYPGkDJLu1LoKzWaRjoWvH
         M5XYWBeJSVGt3QmO/XKFl32OBCVNIgDq7ZQAvLyamRajbKG1RC85DuI3hIGl4JYu0az3
         7qDOJIJBVMdqTIzHmKy+JsikVwl5z9aZDVqoZRk2f7gDti/t3iKkqHQ90s5mMyVHxBM4
         NfC1X9nkEonogeleYZoOOUBfvqfWoac9umgJhnpPmMecRAxzgAYJe5phcT+gB5tIHadd
         S79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739379009; x=1739983809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6XQT/fXVYcBYU9pHZ1QH688qxoQ3lXC+DXD9oqsi4E=;
        b=HlgP3u228M/zGn0bFi22iO+NWgKvlNAfuzBhbEqkE9RsUWbqSqeu+KOHY7jnb6N/nF
         euietx4DOiuVzxgM7GwiLGLuTyk0nY6bcW45A1ffXGLImjxefO+GMbGWJOcyaZFxLMnA
         NOyxgLkTWppbxlbZ0xAYXepxskRlRth3O4C4hI+P+QULtMHqqOBaOHWXnjJaIR+yJLhK
         k5jMDbVG6vOn+K+HhLgD85NESE843Ki3pSUhoF2if6zBH8WHOK2Ljpo5EE6vlWmrcdFp
         eD7zztiZWWhxdR951yMzACK86/kwqAltWyU0D79NXcjxXarCInNFwjROvvGBSGop6XbJ
         4RbA==
X-Gm-Message-State: AOJu0YzuRkxYeJgZ47fz1uwjfJmnhNMxXkQQDmulROtGRKlUyH1fLgSh
	uXL4fAYYQqTeJjTaLnbi34bHfY0Dda1jvE9Bb9WpeTfBATsM9yFPz82rRw==
X-Gm-Gg: ASbGncudF3iWuGNB0ztNyUo/Ps1LgJJMUAjiCZoJ1jK4Alh4/wNkfDbChC3Dlht0m96
	5Nv4T8HXM1C8Sfa4qycFkpyw9xQ8PMnUPWPvNoxukE8XqVXs5hlGnjIHBY9xxuKN+8WoPUPvaAW
	pyqmJD2pu8wPtUHRxTV5Rfi3cOSf1omYrc6e5rjeAgW9cbn4GWmwsjVX1cQTw8g6k1cvuy2Ui1m
	LNzWfUg2Z5WwRu+E8g8MjcCEeAY93BGiAJV5w7+JPONit1DAu3Qv6FTgMvblcH8Sz92LWW/d67e
	C+RwQzuV0U9oz8bs
X-Google-Smtp-Source: AGHT+IHWij+ZD7ZOHZ0FajxmuFnqLKcsDzmXrogqtF2FJS+t2F6ofC0H3GG5ea5sFOMImGwPJQBavw==
X-Received: by 2002:a2e:a9a0:0:b0:308:f479:5684 with SMTP id 38308e7fff4ca-3090dd411b2mr992581fa.17.1739379008421;
        Wed, 12 Feb 2025 08:50:08 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for 4.21 v6 0/2] RISC-V runtime detection of extenstions
Date: Wed, 12 Feb 2025 17:50:01 +0100
Message-ID: <cover.1739355004.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on riscv,isa property of device tree file parse extenstions which are
available in CPU.

As a part of this feature, drop CONFIG_RISCV_ISA_RV64G and explicitly use
extensions 'i', 'm', 'a', 'zicsr', 'zifencei' as they are necessary for a work
if Xen and it should be true not only for RISC-V 64 (but also for 32 and 128).

Oleksii Kurochko (2):
  xen/riscv: drop CONFIG_RISCV_ISA_RV64G
  xen/riscv: identify specific ISA supported by cpu

 xen/arch/riscv/Kconfig                  |  10 -
 xen/arch/riscv/Makefile                 |   1 +
 xen/arch/riscv/arch.mk                  |   9 +-
 xen/arch/riscv/cpufeature.c             | 502 ++++++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h |  59 +++
 xen/arch/riscv/setup.c                  |   3 +
 6 files changed, 572 insertions(+), 12 deletions(-)
 create mode 100644 xen/arch/riscv/cpufeature.c
 create mode 100644 xen/arch/riscv/include/asm/cpufeature.h

-- 
2.48.1


