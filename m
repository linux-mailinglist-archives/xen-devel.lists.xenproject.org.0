Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BC7AD91D5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014624.1392720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eJ-0006f9-OL; Fri, 13 Jun 2025 15:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014624.1392720; Fri, 13 Jun 2025 15:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eJ-0006d3-J1; Fri, 13 Jun 2025 15:48:59 +0000
Received: by outflank-mailman (input) for mailman id 1014624;
 Fri, 13 Jun 2025 15:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44KY=Y4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uQ6eH-0006cn-SK
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:48:57 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9aa130b-486d-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:48:55 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad8826c05f2so421707866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 08:48:55 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8979563sm144821766b.158.2025.06.13.08.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:48:54 -0700 (PDT)
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
X-Inumbo-ID: e9aa130b-486d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829735; x=1750434535; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U18FNGQaQ2WOAoPIbpjFmVvamBgLJPNEgZzb8J9otcc=;
        b=H3Bgt2OhVepj2it+rTZTcsPGU75F7RJRiBVH1vuC3wX11byN+rfhz0JbpIoZr1wjV5
         iRY/1MwUmkKOz68tL7ybcJZrlh6rNanA4hHrMkqo6LVm7abfxfJcK2z2iv1D6IsGOvTN
         U94vBkeDtwTw+vZmrhqbQM0S2VJuva/xoPnwDaa21Ko+kV2Yz7YzTzAZhNQyY2WpkQsN
         DzBtTanEf4+pvQCuqIqRWjahrVLjcDKzxaQjtWiRDuK93z6uwN5e4c5HD/K0wuZ6lji0
         2w9/+GkaHTRB+xQYoDU/xtNvqiWvqqPcj0OgLYtZX1hDPLus9DDFYK2win7ikDCE4e8q
         FjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829735; x=1750434535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U18FNGQaQ2WOAoPIbpjFmVvamBgLJPNEgZzb8J9otcc=;
        b=dKUe6CgG+Tpb5y2yjRjg9hQw4w6tKxXJJerjE6sN4/NrcjIfpCQIs7iEpjolTNV4mD
         t5rLW7gwHIO27luT5K8EBolxKm/SZgdCkuPaf9O+3lJmKHcV3E4rK76yl2I2bZpm6fXA
         NB+AjHXlVi448O58sbOhG9acjVBNKRmn0ErKP1+jfSEpIiVhVOlDqDftHbPYrsDA8QCW
         AtEHrhqzLIOvbbjPaTIppCjppgDxMY5Iv5lX8+q0vE+PsBf4mIEYUevk5ZE/7VGOFGuo
         WeFa7VbaDwumuqvr7JuCP1qP3cpHJnc0evv/uZ5A4cdZPO+jHQAuzWX5xFejhvazzlha
         7kkw==
X-Gm-Message-State: AOJu0YxRHKw1IBSsMOFeA7mzPzM3wrPGciIrdBpORZ3XhWxhjTg/4xLZ
	fhD7jGw+W+jzOVvIcXOOGow9BtUIGsyJIVvO3Zn+yytJetwCuFJjr6y7eSaw4A==
X-Gm-Gg: ASbGncs3XDuiHwYhXCetk+wQCRBT25KhxV//Q618Z0K7XwwC9n3+/vSUiYCUidRjpSp
	dTfeLPQ3WouIthAIs+1vYwmqNh8AiGtQ+0XcKaNTGRqeo1wFFTR4EUt4SH+3E9CWE2uSz2D6DF3
	mC3YI9I25l7nZxlRqcKevFhtLcaUJkxh4NSn6B4JQuCeJB5jBiQrlmZrVS6KdXnSEF9XsUpzBmN
	1TKTpkkR1cKjAA5VjTNzcUxPMLV8NCfwboTic6+dKsDCyBURWmOxl/UBDxdDSOTXtTi5BPiLDjp
	VwORV7g1gsqJDykxHcHNBg7t+am9uF49JARTEvxmKkSRb04T7hq2v3+LOriyUl3NXsnuHBEwnMN
	K1URDzM/dlvnLr9/X1A7c9UMV3owY
X-Google-Smtp-Source: AGHT+IGxz5wVTWFnAXzb/dl28GnEFScdeg3yQpCty9yM2B5NLJAZJpX/D93FqldXfK2v/H/epVLvSQ==
X-Received: by 2002:a17:907:706:b0:ad4:d00f:b4ca with SMTP id a640c23a62f3a-adec5d28463mr364608166b.50.1749829734640;
        Fri, 13 Jun 2025 08:48:54 -0700 (PDT)
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
Subject: [PATCH v5 0/9] riscv: introduce basic UART support and interrupts for hypervisor mode
Date: Fri, 13 Jun 2025 17:48:39 +0200
Message-ID: <cover.1749825782.git.oleksii.kurochko@gmail.com>
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

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1868775206
---
Changes in V5:
 - Update CI tests link.
 - Mostly changes are patch-specific. Please check each patch separately.
---
Changes in V4:
 - Merged to staging:
    - xen/riscv: initialize bitmap to zero in riscv_fill_hwcap_from_isa_string()
    - xen/asm-generic: introduce asm-generic/irq-dt.h
    - xen/riscv: introduce smp_prepare_boot_cpu()
    - xen/riscv: introduce support of Svpbmt extension
    - add ioremap_*() variants using ioremap_attr()
    - xen/riscv: introduce init_IRQ()
    - xen/riscv: introduce platform_get_irq()
 - All other changes are patch-specific. Please check each patch separately.
---
Changes in V2:
 - Merged to staging:
    xen/riscv: initialize bitmap to zero in riscv_fill_hwcap_from_isa_string()
    xen/asm-generic: introduce asm-generic/irq-dt.h
 - All other changes are patch-specific. Please check each patch separately.
---

Oleksii Kurochko (9):
  xen/riscv: dt_processor_hartid() implementation
  xen/riscv: introduce register_intc_ops() and intc_hw_ops.
  xen/riscv: imsic_init() implementation
  xen/riscv: aplic_init() implementation
  xen/riscv: introduce intc_init() and helpers
  xen/riscv: implementation of aplic and imsic operations
  xen/riscv: add external interrupt handling for hypervisor mode
  xen/riscv: implement setup_irq()
  xen/riscv: add basic UART support

 xen/arch/riscv/Kconfig             |   1 +
 xen/arch/riscv/Makefile            |   1 +
 xen/arch/riscv/aplic-priv.h        |  38 +++
 xen/arch/riscv/aplic.c             | 295 +++++++++++++++++
 xen/arch/riscv/imsic.c             | 489 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aplic.h |  73 +++++
 xen/arch/riscv/include/asm/imsic.h |  74 +++++
 xen/arch/riscv/include/asm/intc.h  |  32 ++
 xen/arch/riscv/include/asm/irq.h   |   8 +-
 xen/arch/riscv/include/asm/smp.h   |  17 +
 xen/arch/riscv/intc.c              |  55 ++++
 xen/arch/riscv/irq.c               | 131 ++++++++
 xen/arch/riscv/setup.c             |  14 +
 xen/arch/riscv/smpboot.c           |  77 +++++
 xen/arch/riscv/traps.c             |  19 ++
 xen/drivers/char/Kconfig           |   3 +-
 16 files changed, 1324 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/riscv/aplic-priv.h
 create mode 100644 xen/arch/riscv/imsic.c
 create mode 100644 xen/arch/riscv/include/asm/aplic.h
 create mode 100644 xen/arch/riscv/include/asm/imsic.h

-- 
2.49.0


