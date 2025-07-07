Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B0AAFAF20
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 11:02:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035342.1407581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhjd-0002Xz-2i; Mon, 07 Jul 2025 09:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035342.1407581; Mon, 07 Jul 2025 09:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhjc-0002V2-VI; Mon, 07 Jul 2025 09:02:00 +0000
Received: by outflank-mailman (input) for mailman id 1035342;
 Mon, 07 Jul 2025 09:01:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItPy=ZU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uYhja-0002Us-Pa
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 09:01:58 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 091d15db-5b11-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 11:01:57 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6088d856c6eso5550484a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 02:01:57 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b04d30sm662892766b.133.2025.07.07.02.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 02:01:55 -0700 (PDT)
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
X-Inumbo-ID: 091d15db-5b11-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751878917; x=1752483717; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KnPuKbJiL3NA+G7/2XxNkZAAM4ZPjznldDQk+VyxUjs=;
        b=Ne+Jr92Wobrn1OPPByjIQuUFDJLpoz9m53ZDZkQhMc5UGangYLsom/vL5oDVPlLmDB
         lwisuKPbj5S7XyRH/JjPcFSkg4Tpm3N6rg/FLm7GNw25CC5VH7z/E7iFaBUEQ6fcxi2C
         3Lr01J1HVQn4DzDseM5CxPR4R1Sq/lo8GN1TvjuwHBd4A1j9CsVfcYyEwra9a0f+SIN/
         C2zO0BXswdVXuMHLmgS22q8ceiemO9RDsFcYRiFeCr/254W4JxvQHFpqJSFGHKUazJn1
         3kkRYhxEr7PpRSwkCPP4ojvEKBPbpfF2hMzKQZTJCkTjAr8PBC+NikAH+LsPIS3l64n8
         J8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751878917; x=1752483717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnPuKbJiL3NA+G7/2XxNkZAAM4ZPjznldDQk+VyxUjs=;
        b=B5xfiQFi2pQJr6B0FOAnOsEJXONqgpkC0zykS+kvl/gxYSa/aVTG45+XWiNQrO//vB
         W5l6T81J5YTaV75p6mwM8VpYI043R8JVq0z9DoF3QD5uk0mMhwu1IhKdirHevr9TKkXp
         K6bnAqwzUwattECM26L2e53T352rjihMJuxJmZzYpzDwjeheP9f5uTvW7pt3+KCb1o0u
         qf+D/c3lud8WF9K6cbdy3iL9c+QtPQZ8Tp8O4BA/QPFpS0TQ7VCYd7rv0FA0SVl7OWF/
         VOlGcg3RlvK62uUt4g+dT9qjy21rwreExZunF7PRbVH1uxMx62GqjMIu+fCO0MRAEwqg
         4i0g==
X-Gm-Message-State: AOJu0Yx8Ixay8L3KDePXI4T0UmqaPPQycQ45o9tEbwnlPgMhrHc2Aamu
	/uTGFfsqe7qTklCou3XCScBvsv+rXCcvE+QNonNGTR45/WinaM1o1NWXtTB1JA==
X-Gm-Gg: ASbGncun0VCWVFLZBJPuW34/ZVwhhMpephDEF4yOrvhECVXR663Mh6iuJCA3+JGsd+d
	MztcUuVaEX036G5Rmc4ShMaibMs0NdzKy99q3yORkw+DvwYAzGp5uPnZPp49OomUUcXnE5K+6us
	4k9ABI7GmEkvXhDV2IjkwY/+aC/gNapCIedn71lrWlaM3zcpf7WLnQE4jqsE3Mpmr00i55XiZm5
	e7K5dvNp0Z3kD2Lytocm88u1KYdLJ7Dei5FsSJEym9AOJgjz/9L2instzfFJ/M0oasCA8mextWP
	Gh35oqRcfJJ+Q0HjTrZ9A+igs09sD8NfxZfdhFji76D4tCSgweC2SKhYDYWaSwia4FeXULrzZkv
	u2G7a56PDVlnnYhy66CXpMttAnQ==
X-Google-Smtp-Source: AGHT+IGbXdDaUjuwM9MHj8o3Fu52kRN9ZIyhGjMM/DEMPgPHTpy7SQm1p8U4x+LecgG0R3khhEHpPQ==
X-Received: by 2002:a17:907:3cc8:b0:ade:198c:4b6f with SMTP id a640c23a62f3a-ae4107862b0mr680960666b.1.1751878916341;
        Mon, 07 Jul 2025 02:01:56 -0700 (PDT)
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
Subject: [PATCH v6 0/7] riscv: introduce basic UART support and interrupts for hypervisor mode
Date: Mon,  7 Jul 2025 11:01:36 +0200
Message-ID: <cover.1751876912.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.0
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

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1910703345
---
Changes in V6:
 - Have been merged to staging:
   [PATCH v5 2/9] xen/riscv: introduce register_intc_ops() and intc_hw_ops.
   [PATCH v4 1/9] xen/riscv: dt_processor_hartid()
 - All other changes are patch-specific. Please check each patch separately.
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

Oleksii Kurochko (7):
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
 xen/arch/riscv/aplic.c             | 297 ++++++++++++++++++
 xen/arch/riscv/imsic.c             | 489 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aplic.h |  73 +++++
 xen/arch/riscv/include/asm/imsic.h |  74 +++++
 xen/arch/riscv/include/asm/intc.h  |  13 +
 xen/arch/riscv/include/asm/irq.h   |   8 +-
 xen/arch/riscv/include/asm/smp.h   |  13 +
 xen/arch/riscv/intc.c              |  46 +++
 xen/arch/riscv/irq.c               | 131 ++++++++
 xen/arch/riscv/setup.c             |  14 +
 xen/arch/riscv/traps.c             |  19 ++
 xen/drivers/char/Kconfig           |   3 +-
 15 files changed, 1217 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/riscv/aplic-priv.h
 create mode 100644 xen/arch/riscv/imsic.c
 create mode 100644 xen/arch/riscv/include/asm/aplic.h
 create mode 100644 xen/arch/riscv/include/asm/imsic.h

-- 
2.50.0


