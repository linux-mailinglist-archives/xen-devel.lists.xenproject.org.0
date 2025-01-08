Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D9AA05963
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 12:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867132.1278558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVTzy-0001Df-G5; Wed, 08 Jan 2025 11:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867132.1278558; Wed, 08 Jan 2025 11:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVTzy-0001Bp-CR; Wed, 08 Jan 2025 11:13:18 +0000
Received: by outflank-mailman (input) for mailman id 867132;
 Wed, 08 Jan 2025 11:13:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoWX=UA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVTzw-0001BZ-RO
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 11:13:16 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e3ef810-cdb1-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 12:13:15 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso823273e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 03:13:15 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad99d11sm67292171fa.33.2025.01.08.03.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 03:13:13 -0800 (PST)
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
X-Inumbo-ID: 8e3ef810-cdb1-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736334794; x=1736939594; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IOZRW2Zgzg/+jR+GpKJJKd2ekyGU1NKlwVnXrW58R3M=;
        b=E5QFXiJQ0KXZNZ2os7TPbvXqROP7KVSd90iYMTUmYAXh+jwulEqdSNNG5/53KcNCkR
         I/MN5gMgwC5+ySnDHnnv7HsMX/V4RwjSNwEvdVihCEgqci71KI0YplNFT0F4rzQKRm7I
         elJK09Gieu9RXkYQGSVuZWZzeudD0RhPgsJTGPvJjZDzLozOMHsOpWsnnF9YQOTVAO+6
         VPnHGvnyaetyQGHtcfctSUzZnoQd82UIMzr4i3lAWcQ8ekJuPF4Rq3YYqbL9K9Y7rvsy
         jJ8ZWOZejAkIyaX7T1FepxsuFIk5ooPN8hcksgkF4W+GJpKsg66UKf7uN138ZRBxJW/n
         XzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736334794; x=1736939594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOZRW2Zgzg/+jR+GpKJJKd2ekyGU1NKlwVnXrW58R3M=;
        b=N7znc5OtyyG8h6VYTtYCoNH01L8eazT5URyzs5IJC1M7lx1qRRnF5cENOTcr3afEDi
         yvsZ/Ab+5wxsFkZ2SWLYYWOMY0NaiI4iTF9Z1fVyj+B+wbCE6a79bxByzsBDJ4ILZ7xm
         UX89qPqBInb9KsIse/pwyFPJ6UntY1L7Yh0cis6oeLCsFHyk50P1KbYeoYVLlR34Drmj
         K7rb9xTM/OC5w3Ku1XMKoYEhA0jSqJi/1zXrKmOph7cUZdgzvHN21Ds9rGMQ0NrBgma5
         /nHmM5pAo9jgN1TGwhZScXzU3QQmA6gum0/mPHlbiVBAaCwCwkkmbCAlww0R9UX0wCIF
         +xjQ==
X-Gm-Message-State: AOJu0YxXVVhwdBORCuAG4++wQVlyyv7nvAcWgOb4FuSUZcs454My/sqT
	X4DNjKBglB4HgxlsNnT3Ofx3z55jgo7PegoSYmwCOh2WWy4oLIyqEyr42iu6
X-Gm-Gg: ASbGncuY+ZZYHk05NAokpqbWKo/MXd8UWGLopATtlqn8Tgbz5pk24o5IcwmLKiwi2JC
	H+VKegu95dBzpO0lfGLjeAt1AJPMBlHEuDq0Hlsq09+t9jIAhwO3+0EUy/0FbFBB/3+3LamZmz5
	9asEHMOvOU8CCbe3hoQsoU5WUL9DhhXr2sSvpktjXMxBOm8f6r5nhQRYC+zgXHpuXhXqpkVzYvF
	QHpFDtWs9czYfyZFy3gVu/X34syxBqAiHsUNIZKJGm4mu9i600md9Vb/w==
X-Google-Smtp-Source: AGHT+IHUcYNbBfLm9+kG2OUudFDWwXStLl3O6nt3KtAU5JVFVUiPiUn5VwVNnFPIYmo4V44e7C1o9w==
X-Received: by 2002:a19:6b07:0:b0:542:7f20:a110 with SMTP id 2adb3069b0e04-5427f20a157mr1214715e87.4.1736334793586;
        Wed, 08 Jan 2025 03:13:13 -0800 (PST)
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
Subject: [PATCH for 4.21 v1 0/9] Move parts of Arm's Dom0less to common code
Date: Wed,  8 Jan 2025 12:13:02 +0100
Message-ID: <cover.1736334615.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
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
5. If some function prototypes are moved from asm/* headers, the inclusion of
   arch-specific headers (asm/*.h) could potentially be dropped. For example,
   if we examine common/device-tree/kernel.c, the following inclusions exist:
   - <asm/setup.h>: Included because of the use of copy_from_paddr(). The name
     copy_from_paddr() seems generic enough, so it might make sense to move it
     to a common header.
   - <asm/page.h>: Included because of clean_dcache_va_range(). This function
     is already used in common code in grant_table.c, so its prototype should
     be placed in a common header.
   - asm/kernel.h: Included because of struct kernel_info, which could also be
     a candidate to be moved to a common header.

[1] [PATCH v1 9/9] xen/common: dom0less: introduce common dom0less-build.c

Oleksii Kurochko (9):
  xen/common: dom0less: make some parts of Arm's CONFIG_DOM0LESS common
  asm-generic: move parts of Arm's asm/kernel.h to asm-generic
  arm/static-shmem.h: drop inclusion of asm/setup.h
  asm-generic: move Arm's static-memory.h to asm-generic
  asm-generic: move Arm's static-shmem.h to asm-generic
  asm-generic: move some parts of Arm's domain_build.h to asm-generic
    header
  xen/common: dom0less: introduce common kernel.c
  xen/common: dom0less: introduce common domain-build.c
  xen/common: dom0less: introduce common dom0less-build.c

 xen/arch/arm/Kconfig                      |   9 +-
 xen/arch/arm/dom0less-build.c             | 842 +++-------------------
 xen/arch/arm/domain_build.c               | 410 +----------
 xen/arch/arm/include/asm/Makefile         |   4 +
 xen/arch/arm/include/asm/dom0less-build.h |  32 -
 xen/arch/arm/include/asm/domain_build.h   |  19 +-
 xen/arch/arm/include/asm/kernel.h         | 115 +--
 xen/arch/arm/include/asm/static-memory.h  |  58 --
 xen/arch/arm/include/asm/static-shmem.h   | 118 ---
 xen/arch/arm/kernel.c                     | 231 +-----
 xen/arch/arm/static-memory.c              |   1 +
 xen/arch/arm/static-shmem.c               |   1 +
 xen/common/Kconfig                        |  16 +
 xen/common/device-tree/Makefile           |   3 +
 xen/common/device-tree/dom0less-build.c   | 720 ++++++++++++++++++
 xen/common/device-tree/domain-build.c     | 405 +++++++++++
 xen/common/device-tree/dt-overlay.c       |   2 +
 xen/common/device-tree/kernel.c           | 242 +++++++
 xen/include/asm-generic/dom0less-build.h  |  54 ++
 xen/include/asm-generic/domain-build.h    |  72 ++
 xen/include/asm-generic/kernel.h          | 159 ++++
 xen/include/asm-generic/static-memory.h   |  58 ++
 xen/include/asm-generic/static-shmem.h    | 117 +++
 23 files changed, 1986 insertions(+), 1702 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/dom0less-build.h
 delete mode 100644 xen/arch/arm/include/asm/static-memory.h
 delete mode 100644 xen/arch/arm/include/asm/static-shmem.h
 create mode 100644 xen/common/device-tree/dom0less-build.c
 create mode 100644 xen/common/device-tree/domain-build.c
 create mode 100644 xen/common/device-tree/kernel.c
 create mode 100644 xen/include/asm-generic/dom0less-build.h
 create mode 100644 xen/include/asm-generic/domain-build.h
 create mode 100644 xen/include/asm-generic/kernel.h
 create mode 100644 xen/include/asm-generic/static-memory.h
 create mode 100644 xen/include/asm-generic/static-shmem.h

-- 
2.47.1


