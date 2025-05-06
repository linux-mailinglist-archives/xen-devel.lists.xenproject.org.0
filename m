Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B11AACB81
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:52:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977617.1364575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWR-0005AY-1D; Tue, 06 May 2025 16:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977617.1364575; Tue, 06 May 2025 16:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWQ-00058K-Ur; Tue, 06 May 2025 16:51:58 +0000
Received: by outflank-mailman (input) for mailman id 977617;
 Tue, 06 May 2025 16:51:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWP-00058E-Fy
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:51:57 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b5ab168-2a9a-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:51:56 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac2963dc379so858793266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:51:56 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:51:54 -0700 (PDT)
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
X-Inumbo-ID: 6b5ab168-2a9a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550315; x=1747155115; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/RLhiHCsiN1AHTlwEL0kP9rTdEVLgajlHgh0IyFuAo=;
        b=AupZZSeNRKWmo91Fh48hCCyuUJQbsxjbPWx60qlx4y5HnOpKjegJIYjvOqKiyYlMVs
         T5IvMFAo1VJMwympA9TgecH3c7Mh8iW+IejjDKwAWGjgz/+P+x3OJNwxhARmySCkLD4z
         gRujVabPyPwCChfyDSWAA7fMSFPRoaI2+YaRDx7k07mil6BQyhE0IspxL6TKD3+TQ2O/
         SNGcghs7jl49V2KIHmM2CTg9m1zbs+qYhelW/EG0WPQXPFqilVbb+ezpC7rXPaswDL1g
         MbkkflO/lxOtmqdOUwezCyZ1ARVdermqDMpJeXlQnaaxgNWm+s7P3B6wh60ake0fd0Wl
         f7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550315; x=1747155115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/RLhiHCsiN1AHTlwEL0kP9rTdEVLgajlHgh0IyFuAo=;
        b=qsfKgf87FPdL/pVK9rGgPNyUaFet+CCgo9k+T/e9SR5K1eXEEMzNJ+Bb9B2sa9Z5d9
         HGeHB7xHqJtJR5qtEDlvfUviKrQDn0ONQXdNDS7g0SObgxdl9gwQbeD02JkmqZV5eAqR
         dFtUAKwi4XkgayAtLEFesat4I2oAoXg3lZJE7chm3qlxHX/BbWQiEtsbLh14BCM92J2O
         x8pJE7JD+ImUkfDuHu9OBw7q/4IlN9f2jL3fNvU22jFAEaPy89bWWIdV0M+XxJnDji3h
         C7ssTZDgoWRMq2Xzj+HtIhJcqd2KeMZ2ElC0HV0pOynVkUPFHK7EGf9htZdmB2drgCHZ
         kQGQ==
X-Gm-Message-State: AOJu0YwzQya1TcHaYGuNG7yqyLXPheiMCIIRbS0ZcsistsBSWLRhvzQp
	b/GLAi0S12IAMK8jbkGL35nw8y/GGrSaG/BoG9KwHuchB3Q8i4W4bpu3Qg==
X-Gm-Gg: ASbGncv3WhRUtB80uSFSLNPY8lwqvsTgCXAOEII6JKDW9aZvy30N6jLFSxjLIbMRVLq
	IGfGG0khyZPagzYShu5mVR3FQ0Suz3biJWnXYdkxswnyRh7NkXlbIsqXO3omPpZFF//3IhF8sQZ
	imHSzqBWg4Ffm6GT2FWyG4Kb+CSapnXf6t8crB5z9y6zEWsl249yehxH5tZfRoncPjow7QQdn1j
	haQsc9nOSPE6ekpggKEBU7KDn518y72zWwqo1+sbLOWVWnxEDUy2aG0QAMHVB30dqpfxn2f4lxT
	lWkGdejay0wEyeQ4ZzodUiMHjDG/KZpLIERME82Jzg0b+lMo46dlLTPuyVA42zUouUHWc6WLzka
	4A+TxCmQWKw==
X-Google-Smtp-Source: AGHT+IHiXwKwTWVak5d5rizsrbufwwxhei23r2nUtb12UZhI0brzCDQ3SRr8xWA5EfqmoUcZsUY5eg==
X-Received: by 2002:a17:907:7fa7:b0:ac2:88d5:770b with SMTP id a640c23a62f3a-ad1e8c91ed4mr22334466b.25.1746550314962;
        Tue, 06 May 2025 09:51:54 -0700 (PDT)
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
	Doug Goldstein <cardoe@cardoe.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 00/16] riscv: introduce basic UART support and interrupts for hypervisor mode
Date: Tue,  6 May 2025 18:51:30 +0200
Message-ID: <cover.1746530883.git.oleksii.kurochko@gmail.com>
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

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1802596163

---
Changes in v2:
- Split patch [PATCH v1 07/14] xen/riscv: Introduce intc_hw_operations abstraction
  into two:
  - xen/riscv: introduce register_intc_ops() and intc_hw_ops
  - xen/riscv: introduce intc_init() and helpers
  It was needed to be able to merge [PATCH v1 13/14] xen/riscv: initialize interrupt controller
  into the patch where intc_init() is introduced.
- Merge  [PATCH v1 13/14] xen/riscv: initialize interrupt controller to
  xen/riscv: introduce intc_init() and helpers.
- xen/riscv: implement get_s_time() has been merged to staging.
- All other changes please look in specific patch.
---

Oleksii Kurochko (16):
  xen/riscv: initialize bitmap to zero in
    riscv_fill_hwcap_from_isa_string()
  xen/riscv: introduce smp_prepare_boot_cpu()
  xen/riscv: introduce support of Svpbmt extension
  xen/riscv: add ioremap_*() variants using ioremap_attr()
  xen/asm-generic: introduce asm-generic/irq-dt.h
  xen/riscv: introduce init_IRQ()
  xen/riscv: introduce platform_get_irq()
  xen/riscv: dt_processor_cpuid() implementation
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
 xen/arch/arm/include/asm/Makefile        |   1 +
 xen/arch/arm/include/asm/irq.h           |  15 +-
 xen/arch/riscv/Kconfig                   |  15 +
 xen/arch/riscv/Makefile                  |   3 +
 xen/arch/riscv/aplic-priv.h              |  38 +++
 xen/arch/riscv/aplic.c                   | 309 ++++++++++++++++++
 xen/arch/riscv/cpufeature.c              |   4 +
 xen/arch/riscv/imsic.c                   | 390 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/Makefile      |   1 +
 xen/arch/riscv/include/asm/aplic.h       |  73 +++++
 xen/arch/riscv/include/asm/cpufeature.h  |   1 +
 xen/arch/riscv/include/asm/fixmap.h      |   2 +-
 xen/arch/riscv/include/asm/imsic.h       |  84 +++++
 xen/arch/riscv/include/asm/intc.h        |  34 ++
 xen/arch/riscv/include/asm/io.h          |  11 +-
 xen/arch/riscv/include/asm/irq.h         |  16 +
 xen/arch/riscv/include/asm/mm-types.h    |   8 +
 xen/arch/riscv/include/asm/page.h        |  17 +-
 xen/arch/riscv/include/asm/smp.h         |   3 +
 xen/arch/riscv/intc.c                    |  59 ++++
 xen/arch/riscv/irq.c                     | 218 +++++++++++++
 xen/arch/riscv/mm.c                      |  34 ++
 xen/arch/riscv/pt.c                      |  20 +-
 xen/arch/riscv/setup.c                   |  22 +-
 xen/arch/riscv/smpboot.c                 |  78 +++++
 xen/arch/riscv/stubs.c                   |  11 -
 xen/arch/riscv/traps.c                   |  19 ++
 xen/arch/riscv/xen.lds.S                 |   2 +
 xen/drivers/char/Kconfig                 |   3 +-
 xen/include/asm-generic/irq-dt.h         |  21 ++
 32 files changed, 1470 insertions(+), 47 deletions(-)
 create mode 100644 xen/arch/riscv/aplic-priv.h
 create mode 100644 xen/arch/riscv/imsic.c
 create mode 100644 xen/arch/riscv/include/asm/aplic.h
 create mode 100644 xen/arch/riscv/include/asm/imsic.h
 create mode 100644 xen/arch/riscv/include/asm/mm-types.h
 create mode 100644 xen/arch/riscv/irq.c
 create mode 100644 xen/arch/riscv/smpboot.c
 create mode 100644 xen/include/asm-generic/irq-dt.h

-- 
2.49.0


