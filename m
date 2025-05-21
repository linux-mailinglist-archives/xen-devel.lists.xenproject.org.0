Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85117ABFA9C
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:04:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992137.1375921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvG-0004aM-Rl; Wed, 21 May 2025 16:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992137.1375921; Wed, 21 May 2025 16:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvG-0004Wx-Np; Wed, 21 May 2025 16:04:02 +0000
Received: by outflank-mailman (input) for mailman id 992137;
 Wed, 21 May 2025 16:04:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHlvF-0004Wm-Vq
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:04:02 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3518b82e-365d-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 18:04:00 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-60179d8e65fso3005936a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:04:00 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502736sm9152513a12.25.2025.05.21.09.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:03:58 -0700 (PDT)
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
X-Inumbo-ID: 3518b82e-365d-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843439; x=1748448239; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=esmqiTpleEhtSL1o478nEONFk3pNRpgcw9ytAzP+Zko=;
        b=JPsse5QT0kTB3ii4DTYTy/2AkR7z4TCkTJbaBLaSYsXuacjYgPc0sIqmFSiP8MR2Ox
         n5setVIasEaOjOG+k67yAFewpanVO0qr26JQhiboTEyigex22o0jrxmprsQ/tcaZE/0O
         N+CoF5PGGuQ02LcIrN4ty9EtAgi87IENHCaTTiiEpRJYeVXkfLvRlTt4ar9vl4rnAT0d
         Sa+rzjRP08HxOYw109ju2Vb+fTJclD9gM6N24S0J//anjjqp4nInSsvplMo7W+ubyzKt
         NwhzDda4mnTd9Kac0iVjDmE7dDd9wPUeqPkYxIsAn/wX6A1B8kmYu5Pg/UDrmOsOthRw
         tlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843439; x=1748448239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esmqiTpleEhtSL1o478nEONFk3pNRpgcw9ytAzP+Zko=;
        b=W3qCqVChClMmsLcgVObbw+1l7Eq/e8VO9T2s7IL9Dyhms0qpfDadFI7eORpDcUgQRs
         lyTsivDuftbSbHwv8HvUbKjaOr+VdKWTij/YYTxMKl0F1wWGwyCszzgYgOI80+jT05JI
         xKSMhILRCTBOadFkKG/93gmaI7uoK5MKQWRnb6/vVtBmWC+O4V26GDVQPVs/9f7fzqDd
         xJl8t/PIFxIbauyFWNem2Z2V72l/24jShrqwtUHKGuRUBHUy/TmvctMcHpd/ifinUhoT
         xm42vtAQLxmMOzCVSOlvyWRNeZOt6jPBtVf/QwRSHNnd7csqdUj5O/DO1RCDx6ijL8Rq
         t1cA==
X-Gm-Message-State: AOJu0Yw9SPUeBmWiOiPN8aHspdShglmfCPHxuHonkb6K3/C8+Z41XNpn
	4ib81B8o7+3m0Fbv70RyizxnCmvqK7RMXqDFlVcEM7mvG6g1EH9y5ZudzeFVgQ==
X-Gm-Gg: ASbGncspfTkhzzQsxmzQuU9pFSMKTdIkpmQZqe21CyvzZoLJy5L0QCd8GCsNmYQqv6F
	aQ5AyI6848lzbb7RqCnZ/sGe7+WG1coanFQ9zwiHGxfun/9nmvvxsbDgfVcdLmmzALNYYKQm7kD
	S/UqmfehBHl3mdmWB8mXweoiUqve5pTWAzg7Qs3AuYeeHxOAZ+Niur4CsS95HdzlXohMTPLwco/
	b1xB5umoiXjcEOAOyNHkD0MZp9omhSPrmETPmxqWXEW1fI7jtAq7VFyTBwmTzl60qh6tnYZeaS/
	N+VwH90j1nquhq444Q8BnP16Z4agoCdpxz1KKMxv4jhtdcTJGFZ7tctbeVpWHoqvkE+jWJ3GWzR
	SPuXcWVdwdx5Sol5/yBTDnXvYD7jL
X-Google-Smtp-Source: AGHT+IESSSVPWiASZ+Y9GLyuYwdM3CLR8aCAhv91SouE2vDzW4qcX0H0rZ49E8IrRb0vYJWkqtSWbg==
X-Received: by 2002:a05:6402:51c7:b0:601:9531:68b8 with SMTP id 4fb4d7f45d1cf-60195316a37mr18213015a12.18.1747843438828;
        Wed, 21 May 2025 09:03:58 -0700 (PDT)
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v3 00/14] riscv: introduce basic UART support and interrupts for hypervisor mode
Date: Wed, 21 May 2025 18:03:40 +0200
Message-ID: <cover.1747843009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patch series introduces basic UART support (in interrupt mode) and support of
interrupts for hypervisor mode.

To implement this the following has been added:
- APLIC and IMISC initialization.
- Introduce of intc_hw_operations abstraction.
- Introduce some APLIC and IMSIC operations.
- Introduce init_IRQ(), platform_get_irq() and setup_irq() functions.
- Update do_trap() handler to handle IRQ_S_EXT.
- Introduce some other functions such as: get_s_time(), smp_clear_cpu_maps(),
  ioremap().
- Enable UART. 

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1829069921
---
Changes in V2:
 - Merged to staging:
    xen/riscv: initialize bitmap to zero in riscv_fill_hwcap_from_isa_string()
    xen/asm-generic: introduce asm-generic/irq-dt.h
 - All other changes are patch-specific. Please check each patch separately.
---

Oleksii Kurochko (14):
  xen/riscv: introduce smp_prepare_boot_cpu()
  xen/riscv: introduce support of Svpbmt extension and make it mandatory
  xen/riscv: add ioremap_*() variants using ioremap_attr()
  xen/riscv: introduce init_IRQ()
  xen/riscv: introduce platform_get_irq()
  xen/riscv: dt_processor_hartid() implementation
  xen/riscv: introduce register_intc_ops() and intc_hw_ops.
  xen/riscv: imsic_init() implementation
  xen/riscv: aplic_init() implementation
  xen/riscv: introduce intc_init() and helpers
  xen/riscv: implementation of aplic and imsic operations
  xen/riscv: add external interrupt handling for hypervisor mode
  xen/riscv: implement setup_irq()
  xen/riscv: add basic UART support

 automation/scripts/qemu-smoke-riscv64.sh |   1 +
 docs/misc/riscv/booting.txt              |   4 +
 xen/arch/riscv/Kconfig                   |   5 +
 xen/arch/riscv/Makefile                  |   3 +
 xen/arch/riscv/aplic-priv.h              |  38 ++
 xen/arch/riscv/aplic.c                   | 300 ++++++++++++++
 xen/arch/riscv/cpufeature.c              |   2 +
 xen/arch/riscv/imsic.c                   | 474 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/Makefile      |   1 +
 xen/arch/riscv/include/asm/aplic.h       |  73 ++++
 xen/arch/riscv/include/asm/cpufeature.h  |   1 +
 xen/arch/riscv/include/asm/fixmap.h      |   2 +-
 xen/arch/riscv/include/asm/imsic.h       |  84 ++++
 xen/arch/riscv/include/asm/intc.h        |  32 ++
 xen/arch/riscv/include/asm/io.h          |  10 +-
 xen/arch/riscv/include/asm/irq.h         |  24 ++
 xen/arch/riscv/include/asm/mm-types.h    |   8 +
 xen/arch/riscv/include/asm/page.h        |  23 +-
 xen/arch/riscv/include/asm/smp.h         |  17 +
 xen/arch/riscv/intc.c                    |  55 +++
 xen/arch/riscv/irq.c                     | 223 +++++++++++
 xen/arch/riscv/mm.c                      |  30 ++
 xen/arch/riscv/pt.c                      |  20 +-
 xen/arch/riscv/setup.c                   |  21 +-
 xen/arch/riscv/smpboot.c                 |  85 ++++
 xen/arch/riscv/stubs.c                   |  11 -
 xen/arch/riscv/traps.c                   |  19 +
 xen/arch/riscv/xen.lds.S                 |   2 +
 xen/drivers/char/Kconfig                 |   3 +-
 29 files changed, 1537 insertions(+), 34 deletions(-)
 create mode 100644 xen/arch/riscv/aplic-priv.h
 create mode 100644 xen/arch/riscv/imsic.c
 create mode 100644 xen/arch/riscv/include/asm/aplic.h
 create mode 100644 xen/arch/riscv/include/asm/imsic.h
 create mode 100644 xen/arch/riscv/include/asm/mm-types.h
 create mode 100644 xen/arch/riscv/irq.c
 create mode 100644 xen/arch/riscv/smpboot.c

-- 
2.49.0


