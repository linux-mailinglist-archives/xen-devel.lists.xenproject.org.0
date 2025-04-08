Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D36AA810DC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:57:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942499.1341635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKJ-0004aa-7q; Tue, 08 Apr 2025 15:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942499.1341635; Tue, 08 Apr 2025 15:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKJ-0004Z2-4Y; Tue, 08 Apr 2025 15:57:27 +0000
Received: by outflank-mailman (input) for mailman id 942499;
 Tue, 08 Apr 2025 15:57:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKH-0004Yq-Vv
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:26 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2938fcf9-1492-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 17:57:23 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso246226a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:23 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:22 -0700 (PDT)
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
X-Inumbo-ID: 2938fcf9-1492-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127843; x=1744732643; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hGK/pd0Edv8PV4fHOKEHNDaRM88s+8JEHBygT/2/ZnI=;
        b=G6W8fXy3jJXcxMHLw7PicMLqzSpxQ9QPBiSXn0svqqniHX+M5bTJxvVQYjCo3uLGlj
         OoxhrHdEJT3k4JoqlfL9nAgWLupNZ/KeTKzAc4zmeFjOGBe040KP9yWwcSaEystjAQ8X
         6dACL3Ij1sFVIJuLYvR5tTgrZOwVJw6MCNJxzyI7zBiam7d3Yz9B2FdOrPZHJkUkUkuZ
         bagTgO2W7JwqH4rp7/C+mUu632scQO2vW51TIOJkyXWKC1n1BnG/1xPMpEYGT3RmxAj/
         3vxIEZfJobo/LfQT++bT+jDAfcxNHjoCjZ44CgsLxT3qbzAzJbbJzZIjCdh4X1caD/io
         CW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127843; x=1744732643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGK/pd0Edv8PV4fHOKEHNDaRM88s+8JEHBygT/2/ZnI=;
        b=IZR2Ye88UqV2quZFhT/LQyEUbWoodCDM2lbSPMMzYNpIh09ICijQfpq/6tCeupu8f0
         jlotWqZjF8GMeJE29+Juhbhwfhdk+I5RiDUN4blogBc++SDl09qGiMCddZoBWVHkF0lo
         CCWrQQOkU5Il+Wa0KAH1x0caJ1cgNRgADtaHuApvn9O7OIWR2BR5yku9LPYXxh6HVrIg
         2cfHyLVUsx5p2ZtXJ1QhtJI+dtAfAMIb5d5RRXPV8mgkk4Y9gPyarl3ZFX22RCSlPuW9
         EMFSUxcnPou+FfsWMW8KHjwYQf/CqS3dEN+EpwAtXbJoRm9vyTSIqL1jBzs1XQTNc2NG
         StUg==
X-Gm-Message-State: AOJu0YwWUHAdbcz79H56wskVZMu+2arUe9fARfzfP9+cWLOISRExFZXh
	dqawjuj1W9BCJB8kUOk5iZ+35JDSN6dngGnlaI5Is+pYTmleNjs57LCLYQ==
X-Gm-Gg: ASbGncu1A2ad7+zAM19hM8aQhJ7y9HNM9aZOf76o50E2YcrETAdyJ7RvHn0a9u5mJiE
	IG2t60vZxLTLgVT4v5Ee+jXyzX2QuZqmiKhjEMQlf6jK5q2C6Op2xwuUzOxJw8+wR9BB4J9hHKz
	89OPRj0y7TlmwMozY08CElhPQfj8LZa71mSUNEi7Mm3mayHCkayUXfz5Sq4u5UHpwH7ehs0bmrx
	hpJs0/5FcDT0B2uWQBfQEVinvXIgbOAmb49Mhi3y/Qxdgz6fmemxObCSldRIVUgCW1qivfbKvrt
	aS+AOifPHXOjlyC/WAvx0vtVVj9icgkRHmNN5JLwb0JUiGpsSwgggLyJmEFJ5i3gIcOl50gOKDI
	fu1LS57wPjxN8nA==
X-Google-Smtp-Source: AGHT+IG2gp7gehYxCTfOrG7Vsn7O44crfVb0NR9e3btxUtDnUUSFZMbkCnvSa0VwOaGdRlNdPY6MxQ==
X-Received: by 2002:a17:906:6945:b0:ac7:e366:1eab with SMTP id a640c23a62f3a-ac7e36621dfmr1163933266b.48.1744127842847;
        Tue, 08 Apr 2025 08:57:22 -0700 (PDT)
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
Subject: [PATCH v1 00/14] riscv: introduce basic UART support and interrupts for hypervisor mode
Date: Tue,  8 Apr 2025 17:57:04 +0200
Message-ID: <cover.1744126720.git.oleksii.kurochko@gmail.com>
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

Oleksii Kurochko (14):
  xen/riscv: implement get_s_time()
  xen/riscv: introduce smp_clear_cpu_maps()
  xen/riscv: introduce ioremap()
  xen/riscv: introduce init_IRQ()
  xen/riscv: introduce platform_get_irq()
  xen/riscv: riscv_of_processor_hartid() implementation
  xen/riscv: Introduce intc_hw_operations abstraction
  xen/riscv: imsic_init() implementation
  xen/riscv: aplic_init() implementation
  xen/riscv: implementation of aplic and imsic operations
  xen/riscv: add external interrupt handling for hypervisor mode
  xen/riscv: implement setup_irq()
  xen/riscv: initialize interrupt controller
  xen/riscv: add basic UART support

 xen/arch/riscv/Kconfig             |  13 +
 xen/arch/riscv/Makefile            |   3 +
 xen/arch/riscv/aplic.c             | 302 +++++++++++++++++++++++
 xen/arch/riscv/imsic.c             | 374 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aplic.h |  89 +++++++
 xen/arch/riscv/include/asm/imsic.h |  88 +++++++
 xen/arch/riscv/include/asm/intc.h  |  31 +++
 xen/arch/riscv/include/asm/irq.h   |  37 ++-
 xen/arch/riscv/include/asm/smp.h   |   5 +
 xen/arch/riscv/include/asm/time.h  |   6 +
 xen/arch/riscv/intc.c              |  58 +++++
 xen/arch/riscv/irq.c               | 223 +++++++++++++++++
 xen/arch/riscv/pt.c                |  19 ++
 xen/arch/riscv/setup.c             |  23 ++
 xen/arch/riscv/smpboot.c           |  83 +++++++
 xen/arch/riscv/stubs.c             |  16 --
 xen/arch/riscv/time.c              |   7 +
 xen/arch/riscv/traps.c             |  18 ++
 xen/drivers/char/Kconfig           |   1 -
 19 files changed, 1378 insertions(+), 18 deletions(-)
 create mode 100644 xen/arch/riscv/imsic.c
 create mode 100644 xen/arch/riscv/include/asm/aplic.h
 create mode 100644 xen/arch/riscv/include/asm/imsic.h
 create mode 100644 xen/arch/riscv/irq.c
 create mode 100644 xen/arch/riscv/smpboot.c

-- 
2.49.0


