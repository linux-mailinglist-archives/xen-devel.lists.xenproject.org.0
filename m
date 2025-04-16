Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0BA8B803
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955715.1349318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q4-0006CW-97; Wed, 16 Apr 2025 11:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955715.1349318; Wed, 16 Apr 2025 11:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q4-0006BE-6U; Wed, 16 Apr 2025 11:59:08 +0000
Received: by outflank-mailman (input) for mailman id 955715;
 Wed, 16 Apr 2025 11:59:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51Q2-0006At-Qi
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:06 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 310a1abf-1aba-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 13:59:03 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so55457525e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:03 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:02 -0700 (PDT)
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
X-Inumbo-ID: 310a1abf-1aba-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804743; x=1745409543; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ze6Va0aBH5HoMlqfrsEst6cogJA6Tgb9i7zHpY6q5vQ=;
        b=Zxtpa7C4Wn8sKnToI95nVAAwFr6NYvnej2Vb7vP05r2GArijaa/6VmJwRqe7TL6kE2
         bMPZgyH5FLxjEsz0yXo7aZfEnwlTzg5C65mZcKAf96KNqxWfgi03RutFgfRBZS9k3X/Y
         TTcS9OAfccos9nsZSjcJUtRUJd4ikcLDBnzME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804743; x=1745409543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ze6Va0aBH5HoMlqfrsEst6cogJA6Tgb9i7zHpY6q5vQ=;
        b=KbpHOVvuKagQRMOda+btOD5pdF+Z+vMRRONkk6Wp2BwOe9z8CFfFbf74WTyt20S8+b
         8m6vgkyjUpfsQGB8opByuuXoKFgqyI4nl1zo5ogZCw8qV+W5qVcUBPLxPH+TR6MZ5xwx
         Db9UyiUuIn0mM55R7sX9Ejw61s/afqzmTSp8ytCk9VgkykOQ+2W9DVFZXsKs5xQl8eep
         GWTNNGHYlxqrY5IBYPP4u4tFOHBvdtEr7B+VuV6tACr+Pz9H/GleE7Ia21dnv6ba0KVG
         /C8BAbWeZ2Gqe1YSgmuNL3s+UxfrIuvEOwhoMdFMDb8L7oH60B1l/u4wrpXz89IfMuhR
         4N5w==
X-Gm-Message-State: AOJu0YzVpoxoZuZ0k4sPbg7iqP7+fwNrrbcKhaEX9xlUyKungsriNZCD
	u791cds0vtnxsCckwXSM1YxTyoEmhXgGFSCUS4neMoDEwJFlWEniQatw8Rx+AXgHjjy43vFStov
	VFoo=
X-Gm-Gg: ASbGnctyn+n2IIQ9HBa/SKfe8SRzkLnaPgkjYYscdTjtuun1yqhA4v0VZs3H32/gfCZ
	caWzAEeCpA3/JdJmz/wh5uzryY1OaxYfgZGfiuGbu1huRLTTjcHTbfKbM80MmLOZZBbKpAyE28h
	4h2x+ND4MDTCZZTBcPhwyYvTltWGEqOIKBRL3q3Z64Fny+PBOVtP8ATVR84p6WMoKAkWj7neWcM
	IYj5EgO5621Jxi8wjkU/OuGsvzq3CWWF6nqpiI/ZMzbVkqlMmrU+OhuEAWr4/mEGSf6sOf5RT3V
	79CGPJckusPUVoAXDNTzUjwgwqPaTYuVJ/xV4TwKsZ6FjwwdeGPhxzlFRI/nhRDCDXPq7jfvHhV
	KujXXDHOmDXr9fA==
X-Google-Smtp-Source: AGHT+IHiog8kUug/T26HhfFpczODNr0oJkkCy4zZHO8+pcizOpf9sPgYXX0iuy4RoC/MiUHt/DW4pg==
X-Received: by 2002:a05:600c:502b:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-4405d616b65mr19542145e9.10.1744804743063;
        Wed, 16 Apr 2025 04:59:03 -0700 (PDT)
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
Subject: [PATCH v6 00/15] xen: Centralise byteswap infrastructure
Date: Wed, 16 Apr 2025 12:58:45 +0100
Message-Id: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The diffstat speaks for itself.

Compared to v6, one patch (TMEM) committed, one new patch (drivers/smmu-v3) to
fix a MISRA regression, and the __{BIG,LITTLE}_ENDIAN_BITFIELD logic is
retained.  See individual patches for details.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1771377732

Andrew Cooper (7):
  drivers/smmu-v3: Fix impending MISRA R20.6 violation
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

 tools/libs/guest/xg_dom_decompress_lz4.c      |  10 +-
 .../guest/xg_dom_decompress_unsafe_lzo1x.c    |  14 +-
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
 xen/common/libelf/libelf-private.h            |   9 +-
 xen/common/lz4/defs.h                         |   7 +-
 xen/common/lzo.c                              |   1 -
 xen/common/unlzo.c                            |  13 +-
 xen/common/xz/private.h                       |  13 +-
 xen/crypto/vmac.c                             |  76 +-------
 xen/drivers/char/ehci-dbgp.c                  |   4 +-
 xen/drivers/passthrough/arm/smmu-v3.c         |   8 +-
 xen/include/xen/bitmap.h                      |   2 +-
 xen/include/xen/byteorder.h                   |  44 +++++
 xen/include/xen/byteorder/big_endian.h        | 102 ----------
 xen/include/xen/byteorder/generic.h           |  68 -------
 xen/include/xen/byteorder/little_endian.h     | 102 ----------
 xen/include/xen/byteorder/swab.h              | 179 ------------------
 xen/include/xen/byteswap.h                    |  15 ++
 xen/include/xen/config.h                      |   8 +
 xen/include/xen/device_tree.h                 |   3 +-
 xen/include/xen/libfdt/libfdt_env.h           |   3 +-
 xen/include/xen/unaligned.h                   |   3 +-
 xen/lib/divmod.c                              |   5 +-
 xen/lib/find-next-bit.c                       |  39 +---
 xen/xsm/flask/ss/avtab.c                      |   4 +-
 xen/xsm/flask/ss/conditional.c                |   9 +-
 xen/xsm/flask/ss/ebitmap.c                    |   9 +-
 xen/xsm/flask/ss/policydb.c                   |   7 +-
 45 files changed, 193 insertions(+), 731 deletions(-)
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


base-commit: 7f8c2dd829358406dc9e50d5e386e4d2b20b4303
-- 
2.39.5


