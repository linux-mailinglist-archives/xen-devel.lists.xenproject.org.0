Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD8AA74B6C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:45:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930661.1333255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0m-0005ZX-DQ; Fri, 28 Mar 2025 13:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930661.1333255; Fri, 28 Mar 2025 13:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0m-0005VB-9A; Fri, 28 Mar 2025 13:44:40 +0000
Received: by outflank-mailman (input) for mailman id 930661;
 Fri, 28 Mar 2025 13:44:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0l-0005Dj-0z
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:39 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c83f2e49-0bda-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 14:44:34 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so1734032f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:34 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:32 -0700 (PDT)
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
X-Inumbo-ID: c83f2e49-0bda-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169473; x=1743774273; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE7aGB4f7I5bfWfZWQpxmFTcqusuterONjpBtV/T7YQ=;
        b=Az/smt/Lt+HuktKdyRl4ajj1sMVmebIZgmoJQ74Yj9jHYgdC2z7QYMu6ViLFOkeJXP
         NU95wmE5AyhSZJxjGOjiU4DT9k/osnNh2VEkHFpYw00DGUcF2KfierMwT6rIRbHYGCmh
         3uQAxWk59cWmNq9lm0e+KBcZn5NqKTZYGL9ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169473; x=1743774273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZE7aGB4f7I5bfWfZWQpxmFTcqusuterONjpBtV/T7YQ=;
        b=pjRYgfmBgzJ8Adj6Qgrm7wEpPzDJG76VmZjAiw9DJ/9KwK0IkJEnTFtbA1LwyFBK4V
         dLTxv+Lno7W+Qxi6KbVnj3XKXY/4/sVgN3VGwZguSMumVS7xZaMklRMkkeRAzSxpHR8M
         ofLizId+wsTurOCE3HwA0upeNI/DAdQAqmnzfWp54BFkBnkfNVzWnLhQvFqj2wWm0rX4
         WjnWWoATZk2p7LJSqSIieq0oC80Nfbj450N/U8Kp/HzXNRjQqbJyIHmhbIOamDF1dBM4
         6PsgzwKM1u4FbyW4bJsnPiON+rURJlIXQFnhvuR6JLgnNdLMLkXlZH4C8MeFL4jdsDQi
         UHKA==
X-Gm-Message-State: AOJu0YyAFQeWgcW1x+sMaZMoUwGJxSUgzzw/8vRv6ZkquNMRB4fmegRX
	wqAjIPWKDd/A/X4Zo89p6GymPzdR3Dt/XsDWBMH9Kt+mUBR0eCk3AU+lA6vOBKwTtTPZbc6hE1L
	WHgk=
X-Gm-Gg: ASbGncsd4m0Zc3/9Sgz3O9FpBgg7bORvOtfHGTgrSVHFsCS4nJmbQ2RfuVhv9ojmTA1
	0YVdfKp73g2iDExfcbpZh2+DLjGrUr85w3zJppS9IrzmzVCaj1ne3mc41jCmnQPnbPv4n/4+U1T
	S4gms3WbCAu9F4DYecPLBSZtBhSyLPlXY8MOERCJdU1kQNdqyHOgwTcelecAL+YgKkKXFsNoY37
	HfNWm+6aHRqLMWsK0invEa8VrQn2agvBIYuDPIIQWwZJeOZNX6rqiy3nAPnkiwHuqcWrlLESKez
	GrRl3ReyypjJ7cHlV4mI2GqRr41kTVeKJfHxr4aJNXhXQyWyjqwREza9t8bDafUg2k/mgLmRHoQ
	5ZpXub2QTnNjWyFeU1g==
X-Google-Smtp-Source: AGHT+IGWrkPdWlvBfp+lTsLHE2KKOyAelLxaczA/8U+UJfbALXQj0EuV9LbqPFCVK5qtWmz0DoDZ7g==
X-Received: by 2002:a5d:47ca:0:b0:391:2e0f:efce with SMTP id ffacd0b85a97d-39ad173e843mr6967678f8f.1.1743169472986;
        Fri, 28 Mar 2025 06:44:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Lin Liu <lin.liu@citrix.com>
Subject: [PATCH v5 00/16] xen: Centralise byteswap infrastructure
Date: Fri, 28 Mar 2025 13:44:11 +0000
Message-Id: <20250328134427.874848-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The diffstat speaks for itself.

This is a follow-up to Lin's years-old series, rebased to account for RISC-V
and PPC, and simplified owing to our new compiler baseline.

Andrew Cooper (8):
  xen/lzo: Remove more remanants of TMEM
  xen: Remove __{BIG,LITTLE}_ENDIAN_BITFIELD
  xsm/flask: Switch {asm -> xen}/byteorder.h
  xen/common: Switch {asm -> xen}/byteorder.h
  arm: Remove asm/byteorder.h
  ppc: Drop asm/byteorder.h
  riscv: Remove asm/byteorder.h
  x86: Drop asm/byteorder.h

Lin Liu (8):
  xen: Implement common byte{order,swap}.h
  xen/lib: Switch to xen/byteorder.h
  xen/device-tree: Remove use of *_to_cpup() helpers
  xen/decompressors: Remove use of *_to_cpup() helpers
  xen/arch: Switch to new byteorder infrastructure
  xen/decompressors: Use new byteorder infrastructure
  xen: Remove old byteorder infrastructure
  crypto/vmac: Switch to xen/byteswap.h

 .../libs/guest/xg_dom_decompress_unsafe_xz.c  |  13 +-
 .../guest/xg_dom_decompress_unsafe_zstd.c     |   3 +-
 xen/arch/arm/alternative.c                    |   6 +-
 xen/arch/arm/arm64/livepatch.c                |   2 +-
 xen/arch/arm/include/asm/arm32/io.h           |   3 +-
 xen/arch/arm/include/asm/arm64/io.h           |   3 +-
 xen/arch/arm/include/asm/byteorder.h          |  16 --
 xen/arch/arm/kernel.c                         |   2 +-
 xen/arch/arm/vgic/vgic-mmio.c                 |   3 +-
 xen/arch/ppc/include/asm/byteorder.h          |  12 --
 xen/arch/ppc/include/asm/page.h               |   4 +-
 xen/arch/ppc/mm-radix.c                       |   2 +-
 xen/arch/riscv/include/asm/byteorder.h        |  16 --
 xen/arch/riscv/include/asm/io.h               |   3 +-
 xen/arch/x86/include/asm/byteorder.h          |  29 ---
 xen/arch/x86/include/asm/msi.h                |   1 -
 xen/common/bitmap.c                           |   5 +-
 xen/common/device-tree/device-tree.c          |  44 ++---
 xen/common/grant_table.c                      |   4 +-
 xen/common/libelf/libelf-private.h            |   9 +-
 xen/common/lz4/defs.h                         |   7 +-
 xen/common/lzo.c                              |  22 ---
 xen/common/unlzo.c                            |   1 -
 xen/common/xz/private.h                       |  13 +-
 xen/crypto/vmac.c                             |  76 +-------
 xen/drivers/char/ehci-dbgp.c                  |   4 +-
 xen/include/xen/bitmap.h                      |   2 +-
 xen/include/xen/byteorder.h                   |  44 +++++
 xen/include/xen/byteorder/big_endian.h        | 102 ----------
 xen/include/xen/byteorder/generic.h           |  68 -------
 xen/include/xen/byteorder/little_endian.h     | 102 ----------
 xen/include/xen/byteorder/swab.h              | 179 ------------------
 xen/include/xen/byteswap.h                    |  15 ++
 xen/include/xen/config.h                      |   6 +
 xen/include/xen/device_tree.h                 |   3 +-
 xen/include/xen/libfdt/libfdt_env.h           |   3 +-
 xen/include/xen/unaligned.h                   |   3 +-
 xen/lib/divmod.c                              |   5 +-
 xen/lib/find-next-bit.c                       |  39 +---
 xen/xsm/flask/ss/avtab.c                      |   4 +-
 xen/xsm/flask/ss/conditional.c                |   9 +-
 xen/xsm/flask/ss/ebitmap.c                    |   9 +-
 xen/xsm/flask/ss/policydb.c                   |   7 +-
 43 files changed, 166 insertions(+), 737 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/byteorder.h
 delete mode 100644 xen/arch/ppc/include/asm/byteorder.h
 delete mode 100644 xen/arch/riscv/include/asm/byteorder.h
 delete mode 100644 xen/arch/x86/include/asm/byteorder.h
 create mode 100644 xen/include/xen/byteorder.h
 delete mode 100644 xen/include/xen/byteorder/big_endian.h
 delete mode 100644 xen/include/xen/byteorder/generic.h
 delete mode 100644 xen/include/xen/byteorder/little_endian.h
 delete mode 100644 xen/include/xen/byteorder/swab.h
 create mode 100644 xen/include/xen/byteswap.h


base-commit: eecb9f437b2c3e2d22d0af93dc6b1f4d978313a7
-- 
2.39.5


