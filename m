Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2188A887D8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950710.1346940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MAy-0008NV-PB; Mon, 14 Apr 2025 15:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950710.1346940; Mon, 14 Apr 2025 15:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MAy-0008LJ-Lh; Mon, 14 Apr 2025 15:56:48 +0000
Received: by outflank-mailman (input) for mailman id 950710;
 Mon, 14 Apr 2025 15:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdIb=XA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4MAx-0008KQ-7D
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:56:47 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 111d7fc9-1949-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 17:56:46 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e673822f76so8014363a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 08:56:46 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4288sm951760866b.96.2025.04.14.08.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 08:56:44 -0700 (PDT)
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
X-Inumbo-ID: 111d7fc9-1949-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744646205; x=1745251005; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ETiBESeGTm9MUdoy0xDORs08NZ0Zq11I/D1ugx1sF7I=;
        b=WhEktMqOZ+08kHy6I2V7/vOOtaswUKIH8ogrF2v1uRZWd5b9MJFD1P49sJw5akaJyT
         nku9+6spqxNqjKvbD1QdhCjibfSCuvX7LFtmj3vzVHyvcidIFRTAoKh955tPYRNGGWKe
         zf0k7TSPGAevucCump5SVux3cmHseerF/6xqkxofUGqT7N44QLnbkB+QzZj+b+cRUFSc
         1tmeKD3E+j8PVsJzjyvnMwxd+gj/7PEI7JmbGwRAoaDNf3i2KbOI8jBuLrrIJuGQ3ofu
         2ZCGZUQygKnnLaxu6HRg39FYrI3/fUjGTOGYYk0M8yEJgUh0vqJ+nmvHbfrbIQ9oyT1B
         txFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744646205; x=1745251005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETiBESeGTm9MUdoy0xDORs08NZ0Zq11I/D1ugx1sF7I=;
        b=LJ3ov+aZ25DTAodLCBIef8WdN5ZTLp1h02Iip+PU+ATI4VCbiGcUqbruFf74Fb2DYS
         hgWt9IojVrCwT+1NzFAUzFZ7DvPK5aBfeBmbxpdPi8Tq9RAbeLF2YN/TQhy1B5ocRxa5
         KfojIvdEyP0Iv5kTUr+dZS8Z27BADgXk3ioWFA/VX7gHQD0pm2WgMFHccuHaGC08qfZX
         cQL6h/Zf6Cs9mTGxNdHJRhhhthqHmXFaTdlv6s01NnV9X3yIYI8+vbI5i8aGpQGGJ392
         HwvkftrH2pazzphAzpQUyAJ+m5uW+pBi2ae3IKvc2TTyueW9f8CXXkEVAjvFDhwQ+Jak
         W1VQ==
X-Gm-Message-State: AOJu0YxnCV3MoLxAEik8ztMNwyg0NFmZIjOR+hUFnTZugDWwG/U0zrCM
	a+vjX595Z7WzBZFW9t3Y2wIZwueHsMrCOOXu84JuyvUs5Skwe2iWRiFFeA==
X-Gm-Gg: ASbGncsXTa/CckuRJfX6/b9vqLuckLEiaRySZdfXDy4eKjGR7eg3j7lbd/Zd3ahPJbf
	Hhxm/GmuwfuS3REuzSc14ZZsvwHOnfi4MzXAB2ast59pQWb+m5uFYUBz8Gf06FHgfXk4JWhJCjQ
	AG4gYJ8IPVZ3500+WhJ4w/7h7NEL4CCFirWPeiviYh8LnVhs2Zt/uzddTwYYMIyvgxUK7EJn6BW
	5iPDAZDw8l9yQwGhINjGLpQpHqRCdh980arH6DGbR9067CJKLs5dKCEoWkD86QrFwt40uX/xPdU
	zyi3mbyBCqDFnMVa1RlnIiDIAWLKrDL5QM62U7ohqYoUJHGz+G5SqgnB3smKngRR91qZEJ9Q7G+
	8TPGjdCD65A==
X-Google-Smtp-Source: AGHT+IF0Yt+nkgx1DVu+uyWPjoIuk+yCuVg7IQ6FA/R9Q0gOPVz98OXPdpRBseNZ2ewszrQZyw4vDQ==
X-Received: by 2002:a17:907:944e:b0:ac7:efee:d256 with SMTP id a640c23a62f3a-acad36d08a5mr1066659566b.59.1744646204825;
        Mon, 14 Apr 2025 08:56:44 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/8] Move parts of Arm's Dom0less to common code
Date: Mon, 14 Apr 2025 17:56:33 +0200
Message-ID: <cover.1744626032.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some parts of Arm's Dom0less solution could be moved to common code as they are
not truly Arm-specific.

Most of the code is moved as is, with only minor changes introduced to provide
abstractions that hide Arm-specific details, while maintaining functional
equivalence with original Arm's code.

There are several open questions:
1. Probably, the introduced headers currently placed in asm-generic should
   instead reside in the xen/include folder.
2. Perhaps the introduced *.c files should always be placed elsewhere. They
   have been put in device-tree common as they somewhat depend on device tree
   functionality.
3. The u64 and u32 types are widely used in the code where device tree
   functionality is implemented because these types are used in device tree
   function arguments.
   Should this be reworked to use uint32_t and uint64_t instead? If so, will it
   also be necessary to change the type of variables passed to dt-related
   functions, or should the argument types of device tree functions be updated
   too? For example:
   ```
    u64 mem;
    ...
    rc = dt_property_read_u64(node, "memory", &mem);
   ```
   where dt_property_read_u64 is declared as:
     bool dt_property_read_u64(... , u64 *out_value);
4. Instead of providing init_intc_phandle() (see the patch: [1]), perhaps it
   would be better to add a for loop in domain_handle_dtb_bootmodule()?
   Something like:
   ```
    bool is_intc_phandle_inited = false;
    for ( unsigned int i = 0; i < ARRAY_SIZE(intc_names_array); i++ )
    {
        if ( dt_node_cmp(name, intc_names_array[i]) == 0 )
        {
            uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);

            if ( phandle_intc != 0 )
                kinfo->phandle_intc = phandle_intc;

            is_intc_phandle_inited = true;
            break;
        }
    }

    if ( is_intc_phandle_inited ) continue;
  ```

[1]] [PATCH v1 9/9] xen/common: dom0less: introduce common dom0less-build.c

---
Changes in v2:
- Update cover letter message.
- Rebase on top of the current staging.
- Drop patches:
   - asm-generic: move Arm's static-memory.h to asm-generic
   - asm-generic: move Arm's static-shmem.h to asm-generic
  as in the nearest future there is no real users of STATIC_MEMORY and
  STATIC_SHMEM.
- Add new cleanup patch:
  [PATCH v2 1/8] xen/arm: drop declaration of handle_device_interrupts()
- All other changes are patch specific. Please check them seprately for each
  patch
---

Oleksii Kurochko (8):
  xen/arm: drop declaration of handle_device_interrupts()
  xen/common: dom0less: make some parts of Arm's CONFIG_DOM0LESS common
  asm-generic: move parts of Arm's asm/kernel.h to common code
  arm/static-shmem.h: drop inclusion of asm/setup.h
  asm-generic: move some parts of Arm's domain_build.h to common
  xen/common: dom0less: introduce common kernel.c
  xen/common: dom0less: introduce common domain-build.c
  xen/common: dom0less: introduce common dom0less-build.c

 xen/arch/arm/Kconfig                      |  10 +-
 xen/arch/arm/acpi/domain_build.c          |   4 +-
 xen/arch/arm/dom0less-build.c             | 997 +++-------------------
 xen/arch/arm/domain_build.c               | 411 +--------
 xen/arch/arm/include/asm/Makefile         |   1 +
 xen/arch/arm/include/asm/dom0less-build.h |  32 -
 xen/arch/arm/include/asm/domain_build.h   |  31 +-
 xen/arch/arm/include/asm/kernel.h         | 126 +--
 xen/arch/arm/include/asm/static-memory.h  |   2 +-
 xen/arch/arm/include/asm/static-shmem.h   |   2 +-
 xen/arch/arm/kernel.c                     | 234 +----
 xen/arch/arm/static-memory.c              |   1 +
 xen/arch/arm/static-shmem.c               |   3 +-
 xen/common/Kconfig                        |  19 +
 xen/common/device-tree/Makefile           |   3 +
 xen/common/device-tree/dom0less-build.c   | 891 +++++++++++++++++++
 xen/common/device-tree/domain-build.c     | 404 +++++++++
 xen/common/device-tree/dt-overlay.c       |   4 +-
 xen/common/device-tree/kernel.c           | 242 ++++++
 xen/include/asm-generic/dom0less-build.h  |  82 ++
 xen/include/xen/fdt-domain-build.h        |  77 ++
 xen/include/xen/fdt-kernel.h              | 146 ++++
 22 files changed, 2013 insertions(+), 1709 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/dom0less-build.h
 create mode 100644 xen/common/device-tree/dom0less-build.c
 create mode 100644 xen/common/device-tree/domain-build.c
 create mode 100644 xen/common/device-tree/kernel.c
 create mode 100644 xen/include/asm-generic/dom0less-build.h
 create mode 100644 xen/include/xen/fdt-domain-build.h
 create mode 100644 xen/include/xen/fdt-kernel.h

-- 
2.49.0


