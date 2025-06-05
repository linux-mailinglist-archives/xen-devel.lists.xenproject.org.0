Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE7CACF395
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 17:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007083.1386365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCzu-0007Ha-KI; Thu, 05 Jun 2025 15:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007083.1386365; Thu, 05 Jun 2025 15:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCzu-0007FL-Ha; Thu, 05 Jun 2025 15:59:18 +0000
Received: by outflank-mailman (input) for mailman id 1007083;
 Thu, 05 Jun 2025 15:59:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkoY=YU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uNCzt-00071f-QN
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 15:59:17 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 064b0998-4226-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 17:59:13 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-604f5691bceso2104100a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 08:59:13 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c2aba9sm10443034a12.2.2025.06.05.08.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 08:59:12 -0700 (PDT)
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
X-Inumbo-ID: 064b0998-4226-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749139152; x=1749743952; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mZv5gn3dUevmvppm18T2Hm/N5xKI+DzKUnOvVeHLeFg=;
        b=WLI331aS1OoPjUpE+e0bpsmR8NtOJvjOYxG0c4p8iSih/HGDbiVcAndNgBrcO4T3cK
         1s3W4TNCUTL8+eroWcrjsQw+Gr1NIjUcQUukMu91BPzKa62U4KMdo9M0m+0qMxHAVocd
         pxOBJC64QZt9I5x2BuIYEK9ARhFBqZBX84UN8yFDC+C14r23kF16pjePNIf4G4UJiG6t
         5ro0ZCJctwtnrEBCK5BA0Y4HP0Kqm2+UbjC6i96wIvWOqXilNX8lkdkeWlvjeBYOKAm+
         WtmQ6hMzFbzQcbiF10IbClp9SOotG1OJSJrnFhDOpKs85LUGcCp2pssluitUy8YAuNCD
         SCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139152; x=1749743952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZv5gn3dUevmvppm18T2Hm/N5xKI+DzKUnOvVeHLeFg=;
        b=f0S/1Vqja/QLrY3Q9ZkS1VA6NH6PpCNm+JHTgEYUTRkDHRDtwiMcVNRV54w4v/MaNY
         spEcUbUCuTzPRmupTNwLjqjZ8xjyVllC2jVQYqExTTxq6Qbj1hxVJLfBIjtnvUfY7ZBd
         MIZr4ugqDQWF1OOMfTxA5zJ1M4q/jpvIg0lUZqpB2ezhN0eAsR+hN7qb3bVHY4C4c8Lj
         2eIVmO7oaAwOMNUpTcfr00EEWYve4Bu+bRNLU0owb73/wWYkEQiX5BCOiTiCK1yVUMZK
         UwXdnjNWD/JCL5YyjrVi04BZRrTQF0DOPjEZPVXAQaR00qYkNJv53h7vRTWoOk7tkxKA
         Wo2Q==
X-Gm-Message-State: AOJu0YwaR9YBkOpagTMQt43f6yMgbtHW91KdCk5vxpyLuw8B/JioppM/
	34DWS+z2Y0pxgcMGxe2FOjIkQ/RLOTDw3rSp5sSeTebBex8tDOt/jSTw+CSXfg==
X-Gm-Gg: ASbGncvyFlGblLdro8tRp9nUjvpUeBfXzssA/X5dhnifXsz2od9Nn4CfbuhIkkYECW7
	wddly5AtzC35XLguKYg/ufEW6KvagBS1JjOIU/gMYOEPRrN3Rra/m1iwP/AXhjJwOjdT9cs9t3Y
	0dwuuKRxT6fOAbtEd73ZoM/lpQUO40Kf6qJN9yFJr1SKixW4i/iP2DUURqgRZCIDaoOkDZZOCxB
	c6JEnKUm1TxLi8S5XlXcuqf8Ua2d4klaWDq2+cK9eHM6v9YZ0GVw5+TpMoAAbnVOuqiVLhli1Iw
	LpMdWDpZcRPiu26LBi7yxSGEISsEX0UdRZdCdT13GfbnB3uHpms+LbXnU4VD4zTa5zaVGoFes29
	bwwQbaFaKSbPrULqrFYooR2ynjOMn
X-Google-Smtp-Source: AGHT+IEiKCplfGqYkEV0G+mogv/9gCwlyW6tEVebX1rMvvknqDQj3/5aKDPhaEVraorB47xe5kLO5g==
X-Received: by 2002:a05:6402:5241:b0:607:4c8e:514d with SMTP id 4fb4d7f45d1cf-6074c8e5257mr973870a12.6.1749139152290;
        Thu, 05 Jun 2025 08:59:12 -0700 (PDT)
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
Subject: [PATCH v4 0/9] riscv: introduce basic UART support and interrupts for hypervisor mode
Date: Thu,  5 Jun 2025 17:58:56 +0200
Message-ID: <cover.1749121437.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/aplic.c             | 296 ++++++++++++++++++
 xen/arch/riscv/imsic.c             | 478 +++++++++++++++++++++++++++++
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
 16 files changed, 1314 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/riscv/aplic-priv.h
 create mode 100644 xen/arch/riscv/imsic.c
 create mode 100644 xen/arch/riscv/include/asm/aplic.h
 create mode 100644 xen/arch/riscv/include/asm/imsic.h

-- 
2.49.0


