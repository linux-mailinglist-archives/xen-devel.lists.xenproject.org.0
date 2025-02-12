Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F659A32C62
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 17:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886617.1296280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiFwK-00009s-Ti; Wed, 12 Feb 2025 16:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886617.1296280; Wed, 12 Feb 2025 16:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiFwK-000086-QK; Wed, 12 Feb 2025 16:50:20 +0000
Received: by outflank-mailman (input) for mailman id 886617;
 Wed, 12 Feb 2025 16:50:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeD=VD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tiFwI-0007h7-SN
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 16:50:18 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 700f1a13-e961-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 17:50:17 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-545074b88aaso4345955e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 08:50:17 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54504fc26b3sm1409118e87.44.2025.02.12.08.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 08:50:16 -0800 (PST)
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
X-Inumbo-ID: 700f1a13-e961-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739379017; x=1739983817; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oH0texVkmm3jWhvVk9ubyUsQTjJOc/sBkyDaeYcpo8Q=;
        b=IlwlQGoGcJtY5ARCYHGeMwS4Cj3+xhnPEbctcVilb8jM3C5Swtj8+X6i/YAqw6uAzm
         iAETO8jOHYlTcK5/J+k3EZm0Schjo7CM5RCPCeBqvSicITQ07UDu2LCbh8vQ3jSTZ5ZV
         BvTLpE3aE9wogAfUYaS24LYAkcZxDQYxN6wXKivZ2y0Zbix0AdLztGRVdzv2E9+T0l9O
         TWfD/tnwjDv8yC30IMYCUjnaWAaEea1Mq2Z7/4hH0zaMGrR40NWSi08f5x6wqqQpy9NH
         sPiETkP0zoCAms3WC8m9HRPk8UgajCx7zzLik37ziEUqjGtHezcRZdgUBGewQ9uoEl8e
         knqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739379017; x=1739983817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oH0texVkmm3jWhvVk9ubyUsQTjJOc/sBkyDaeYcpo8Q=;
        b=hn0sFVX3y67pEG+25JOzWF8bw1iIbWcJp7eHsLh3nEkAOkIPnCG/2MNp/di61C2PHN
         du9sZtnsOz6fQ3tcwuJaurbTgpDET/62aRnTZtsAqJUb/X+6Nim/DDnKweB0uggqKqmE
         bumfuhRvX61tETYSyrUfOtiuXrt7nwd0ebNt+gjIUvJnkq5i+bwxKQokZ+CQ51z0QrPb
         X9slDj4YpaOal8Vpwyaaw6u+o0iFKNj1jgtDcUZrw4x3K9vbYcQdytOX07ZHZhQyGNpU
         FkxwQSsnNFRomde5X/9GVVCLgEUcQtb8DdDRq8ZkmHqjGwrLgBi1+Dx2PxMrOeM/Qc3C
         dIsQ==
X-Gm-Message-State: AOJu0YwwAL8jK13GUo8Kz/UJeJK+iG4+UTCbc2rUFlQxI01dmMH2c9+k
	YarmAmImGyKN3eWg4Yx2ItFecabapCH1oM9i0QbqfshaWIJB3lpzypaeRw==
X-Gm-Gg: ASbGncsLKiS1TzpMeyMfO4CJvz+Ei4Dv2yy5Qy3v4TrNKTQtnowRhsqyo/FTBGJFJCU
	BosHOqwCHurtWl6KyrlS4/heKSxSdQnghdHNkvSTFODUcjgViyYdvuCrRHvQyMk1wlc6ijLG2B2
	PJdqvyeq5OERpFYb0uf6+j1Rc8wRDRkInw+ru6r0j4OksrtPYwnPy7xWpDwcE8fbUKUVMqb8SOa
	nS0C5GZFrsFY8aG2ZSCC4/bQxhmow3NogZKNktCz6IepZuAvJy/HDbmsnQI3s6i1tz89Zq/dz9w
	un3/FE4hiIDoTktP
X-Google-Smtp-Source: AGHT+IEqESNRwSlNW/hFvBTd87wt1pYzEOWQD/LrJniY8HD9FCLyp3s15gtyu0UUqBE4dm5lUzqr8w==
X-Received: by 2002:a05:6512:5c6:b0:545:1240:2500 with SMTP id 2adb3069b0e04-545181893bemr1101239e87.35.1739379016439;
        Wed, 12 Feb 2025 08:50:16 -0800 (PST)
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
Subject: [PATCH for 4.20? v4 0/3] Fixes for vmap_to_mfn() and pt_mapping_level
Date: Wed, 12 Feb 2025 17:50:10 +0100
Message-ID: <cover.1739363240.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce pt_walk(), which does software page table walking to resolve the
following issues:
1. vmap_to_mfn() uses virt_to_maddr(), which is designed to work with VA
   from either the direct map region or Xen's linkage region (XEN_VIRT_START),
   thereby an assertion will occur if it is used with other regions, in
   particular for the VMAP region. The solution is usage of pt_walk() for
   vmap_to_mfn().
2. pt_mapping_level() returns incorrect page table level in the case when
   mfn==INVALID_MFN when, for example, VA was mapped to PA using 4k mapping,
   but during destroying/modification pt_mapping_level() could return incorrect
   page table level as when mfn==INVALID_MFN then only VA is taking into account
   for page table level calculation and so if VA is page table level 1 aligned
   then page_mapping_level() will return level 1 ( instead of level 0 as VA was
   mapped to PA using 4k mapping so there is incostinency here ).
   The solution is to set level=CONFIG_PAGING_TABLE to tell pt_update() algo
   that it should use pt_walk() to find proper page table entry instead of
   using for searching of page table entry based on precalculated by
   pt_mapping_level() `level` and `order` values.

It would be nice  to have these fixes in Xen 4.20 but isn't really critical as
there is no any users for RISC-V port at this moment.

---
Changes in v4:
 - please look at a specific patch.
---
Changes in v2-v3:
 - update the commit message.
 - other changes look in specific patch.
---

Oleksii Kurochko (3):
  xen/riscv: implement software page table walking
  xen/riscv: update defintion of vmap_to_mfn()
  xen/riscv: update mfn calculation in pt_mapping_level()

 xen/arch/riscv/include/asm/mm.h   |   2 +-
 xen/arch/riscv/include/asm/page.h |   9 ++
 xen/arch/riscv/pt.c               | 159 +++++++++++++++++++++++-------
 3 files changed, 135 insertions(+), 35 deletions(-)

-- 
2.48.1


