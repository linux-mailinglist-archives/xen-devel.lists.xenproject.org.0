Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E503AA9B37
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 20:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976213.1363479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC0HE-0007dT-UR; Mon, 05 May 2025 18:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976213.1363479; Mon, 05 May 2025 18:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC0HE-0007XL-OX; Mon, 05 May 2025 18:10:52 +0000
Received: by outflank-mailman (input) for mailman id 976213;
 Mon, 05 May 2025 18:10:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdRb=XV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uC0HC-0005wU-72
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 18:10:50 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4141960f-29dc-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 20:10:41 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5f5bef591d6so9552963a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 11:10:41 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189146fcbsm530372366b.34.2025.05.05.11.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 11:10:40 -0700 (PDT)
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
X-Inumbo-ID: 4141960f-29dc-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746468641; x=1747073441; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KE1jKxotKKMDmhRdw2Lt1lYv08YopenK59ESAW9TYl0=;
        b=LjVM9A3e8nUUgcsSGnLvoEzPVSRbYP6wcloXa8EqQKce74rNMWw31VEhbosDJUUGh8
         cCCPHyIEgNQqtBvIomUnoIvYtgJ++AL2mV2W/osMATRoWaK+nfrfkhLUOqbf893gwxGk
         ncx9ZmdRJ3r6o0cOvC64iUxnV+nL8ac+V0TkkW06T8ZGSUZqGNM9Q+7GO9FvFUQFJ8+u
         p+lXy4mzLjlriOPek82br16sws0GRmJzTIm9rvFgv2YxV9vX/c6rWjR8sXY9Ewf9Q/2B
         2Wr98eP9a4Q5bvOwLlZGGT5uL2Un1Gbdk7WflJkz1x+DWcVu6emKuK8IJY4m6T9ntjDK
         DcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746468641; x=1747073441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KE1jKxotKKMDmhRdw2Lt1lYv08YopenK59ESAW9TYl0=;
        b=XQ4kD4YYZw7+7seg+MRi9ryZVKXjXfSadaCMFawHHHwwmOvIIHD79nwpjF520hC1UM
         IBtgm324ets3G85jmoDdkSMmJeXz3nehVHDVezqJVeY7mDB2oEAKiqX8BQIrMOOsbmrR
         mWt/lGJoHVHSLuL6P13EBbWKFb3kwE8k0cOxthcvCklr+z5X08Oz8w1zscGXskmuUpQa
         trpsVybD7nE497tJbgr3y/isX1LYk/LhIHYKkRXB7UAhy0N9tjdHiApCz0aqAPqIPH2j
         MFxfYQwGnAxtgnlx2u6nt5/m0CdiYCyoWGkVIkyrNGWUIfqsVKriM6kdyNFVf5ShKFCX
         GwxA==
X-Gm-Message-State: AOJu0YyD4Z/6zmiBaYueh1VSUxng6xo9Ky7mlQ0VbtekPx+Cew82Vk9R
	vdR6ykDwgnqwmFHAihkNtsuEMewDK9Ts/W72vzDlw7SFijS8Jk/BkWKU1A==
X-Gm-Gg: ASbGncu8IgC6vAaJ6Casb6oUE4tjR8SLx4FmSSr88jNEStYgjWcaEUOATYN0q0xHhh2
	0fMLnbqQKWqq6rRfe8oadC+S44M4wmqrYG+f3uFW3Zo7x2eLCm57ox1x3JR0Suz2frVRJivxlJG
	W6wgPgsdgPvB6osWFeIW2it6zDJVeJoWkM/ZrqAQtMeVfLX2ppRuGV0CuP6DSQgpq4n2iWMPa63
	ykc3aU/SfVXc2/ku2mMjkeyFG3/9SN/06aPU4Vv2txbNJtQCdToJnqT2cw/ag9dFEwtGRkEGiny
	mqBgFbIwvZqqdZba64vvfl6Z1sEkJ4DU/bc5X6r45CacdNywYP/qd09i72+EhUCyEz0jPj5hDxA
	vDOMSzrRInw==
X-Google-Smtp-Source: AGHT+IGSKAvfanif6qheU3nuI1TNGHrqhgGfeaqR/oM1blP2rJpwQQWxcZh7wVPCC0fxPdovSncb7g==
X-Received: by 2002:a17:907:3d8c:b0:acb:4f4a:cbd0 with SMTP id a640c23a62f3a-ad17b5ad337mr1255527866b.14.1746468640401;
        Mon, 05 May 2025 11:10:40 -0700 (PDT)
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
Subject: [PATCH v4 0/8] Move parts of Arm's Dom0less to common code
Date: Mon,  5 May 2025 20:10:30 +0200
Message-ID: <cover.1746468003.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some parts of Arm's Dom0less solution could be moved to common code as they are
not truly Arm-specific.

Most of the code is moved as is, with only minor changes introduced to provide
abstractions that hide Arm-specific details, while maintaining functional
equivalence with original Arm's code.

There are several open questions:
1. The u64 and u32 types are widely used in the code where device tree
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
2. Instead of providing init_intc_phandle() (see the patch: [1]), perhaps it
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

CI's test for the current patch series:
  https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1801183107

---
Changes in v4:
 - Drop item 3 from the cover letter message as it was decided to rename
   dom0less to predefined domains separately.
 - Update the link with results of CI testing.
 - All other changes please look in the specific patch.
---
Changes in v3:
- Rebase on top of current staging and fixing merge conflicts.
- Ingrate changes done in the commit:
    "xen/arm: dom0less delay xenstore initialization"
- All other changes please look in the specific patch.
- Update cover letter message.
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

 xen/arch/arm/Kconfig                      |   10 +-
 xen/arch/arm/acpi/domain_build.c          |    3 +-
 xen/arch/arm/dom0less-build.c             | 1078 ++-------------------
 xen/arch/arm/domain_build.c               |  410 +-------
 xen/arch/arm/include/asm/Makefile         |    1 +
 xen/arch/arm/include/asm/dom0less-build.h |   34 -
 xen/arch/arm/include/asm/domain_build.h   |   32 +-
 xen/arch/arm/include/asm/kernel.h         |  123 +--
 xen/arch/arm/include/asm/static-memory.h  |    2 +-
 xen/arch/arm/include/asm/static-shmem.h   |    3 +-
 xen/arch/arm/kernel.c                     |  235 +----
 xen/arch/arm/static-memory.c              |    1 +
 xen/arch/arm/static-shmem.c               |    2 +
 xen/common/Kconfig                        |   15 +
 xen/common/device-tree/Makefile           |    3 +
 xen/common/device-tree/dom0less-build.c   | 1002 +++++++++++++++++++
 xen/common/device-tree/domain-build.c     |  395 ++++++++
 xen/common/device-tree/dt-overlay.c       |    4 +-
 xen/common/device-tree/kernel.c           |  242 +++++
 xen/include/asm-generic/dom0less-build.h  |   84 ++
 xen/include/xen/fdt-domain-build.h        |   75 ++
 xen/include/xen/fdt-kernel.h              |  145 +++
 22 files changed, 2094 insertions(+), 1805 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/dom0less-build.h
 create mode 100644 xen/common/device-tree/dom0less-build.c
 create mode 100644 xen/common/device-tree/domain-build.c
 create mode 100644 xen/common/device-tree/kernel.c
 create mode 100644 xen/include/asm-generic/dom0less-build.h
 create mode 100644 xen/include/xen/fdt-domain-build.h
 create mode 100644 xen/include/xen/fdt-kernel.h

-- 
2.49.0


