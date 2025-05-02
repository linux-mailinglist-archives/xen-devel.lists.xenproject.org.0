Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAA8AA7728
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 18:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974784.1362558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAt9z-00067S-J6; Fri, 02 May 2025 16:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974784.1362558; Fri, 02 May 2025 16:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAt9z-00065S-Ch; Fri, 02 May 2025 16:22:47 +0000
Received: by outflank-mailman (input) for mailman id 974784;
 Fri, 02 May 2025 16:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EvHp=XS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uAt9y-0005rY-2a
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 16:22:46 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac2a5baf-2771-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 18:22:42 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso410898466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 09:22:42 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c01f2sm68158766b.119.2025.05.02.09.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 09:22:40 -0700 (PDT)
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
X-Inumbo-ID: ac2a5baf-2771-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746202961; x=1746807761; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cBkqvfa83/w8FH/oYkNwhPdcb80eMsIuC1GvNe/PNEQ=;
        b=lgDnUksk5AnC/CtkyfcKVQDrvC9+2m+waqOUN1s5NTLJ3r6MaaviO4cTk96X0rmWF5
         noJSP5JkXtjzqLXu2Pk94ug6+utWczvNhvktp3aCm2Yegy/d4bFt/LknwKPtEnMevpaU
         fwTtcTgKMsz4uqbD4kVmSnmZ21Dx4GFmG6q80SMQhqwHpe1GeYrkITu/VLdxJJl9MpTE
         KQtDMBSyq3JAi8Kk3WC1hXQplsok04aoPFEN0EWVFedMIKTDgnXiwz+MtrSVMtVPdS9c
         /5EMHRFFytuJvKBAr6LXSRv2a8/pSwuvqevRdnTQEz1lCOQCh3l1PtfxmXBSUyAJOE1K
         7PTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202961; x=1746807761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBkqvfa83/w8FH/oYkNwhPdcb80eMsIuC1GvNe/PNEQ=;
        b=tX2ANk1qEqStzzt49SuYBGGHLru0PPgAhPYlZKg4QsrNAulf+KHab0M0zseGMJDgji
         JszfR8iTNg+7mJADM9swiFwr+KsFWeAUzUqKdsRJMAAvKCvTOIdTnypJPjKxsiZPODI8
         OqFfWyyOPoqLuWp+nWRC0+3GaTIsvz2T+yScWPwECk8PgfVX3ZFl3sRy4BAtcnbWK8XY
         CB1zJ3ppQzbyPrp41/ynqCj2ETk064iT8saIhMJZvthCecu7Nu5Tl47OWs755hR/GYkt
         1HcVKNBlT9Uk9zVj+5ZagztjOB0yd4S+ibdlLLJQQd71rkl2+y1PG8EV2FrgEYsfIk6g
         J1Kw==
X-Gm-Message-State: AOJu0Yw9zKigBavVphf6mrLVtbB26QuZlWv3pjP+Bm1nE6jR6f1Dt0kj
	vi7LkTsAtoyQTUJ+9Tsm1CZRN8loL2PMjbnfooWN1ov9wzBSUoVVkaM9Zw==
X-Gm-Gg: ASbGncvDAZxxpzu3qQdfue+kRmxz0KItB60AWMAqkdLdQ6j0gtzHPNs7Wu3vnoLWw90
	MoVvDkuURRnvRtBo2kp6flNpxEjMeeLmIYg2w9JRR8n9pwmxJAVU4Jv8eJ/WXUrsG9xFAmu5WZs
	zk0TMM3QsMUBYLgQ4kt95cA/E5WVi/n04W04LIk+RJG+ykVnlu21MrftDkLPvYTpfDra5jpuQR8
	jQnGJyfkvOV31AHkpwt6+fjEi9ElCiXWlh14FKscn/RkPpLcwULxong9CPIhZr1VtEylgvZpXjj
	FufZQdVw5Jo0SHSPdiUldll3rxRfT+xUK487h0gIISa9jUHva92ldX3zSzmX29dvL/teiJe8k1A
	sDOOge8rbALTnbq+jCYx0
X-Google-Smtp-Source: AGHT+IFMnuxtxTtdpt9uQVt9/t3i9XRV8naC2tluiSjJp/uyxLs8qEl4wiZEeXqCP1uUQfIm26YpGw==
X-Received: by 2002:a17:907:2ce4:b0:ac6:e33e:9ef8 with SMTP id a640c23a62f3a-ad17b471928mr341697566b.2.1746202961169;
        Fri, 02 May 2025 09:22:41 -0700 (PDT)
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
Subject: [PATCH v3 0/8] Move parts of Arm's Dom0less to common code
Date: Fri,  2 May 2025 18:22:30 +0200
Message-ID: <cover.1746199009.git.oleksii.kurochko@gmail.com>
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
3. Should I rename everything connected to dom0less to predefined domains now?
   Or could it be a separate patch series?

CI's test for the current patch series:
  https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1797667269

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
 xen/arch/arm/include/asm/domain_build.h   |   34 +-
 xen/arch/arm/include/asm/kernel.h         |  126 +--
 xen/arch/arm/include/asm/static-memory.h  |    2 +-
 xen/arch/arm/include/asm/static-shmem.h   |    2 +-
 xen/arch/arm/kernel.c                     |  234 +----
 xen/arch/arm/static-memory.c              |    1 +
 xen/arch/arm/static-shmem.c               |    2 +
 xen/common/Kconfig                        |   20 +
 xen/common/device-tree/Makefile           |    3 +
 xen/common/device-tree/dom0less-build.c   |  982 +++++++++++++++++++
 xen/common/device-tree/domain-build.c     |  404 ++++++++
 xen/common/device-tree/dt-overlay.c       |    4 +-
 xen/common/device-tree/kernel.c           |  242 +++++
 xen/include/asm-generic/dom0less-build.h  |   83 ++
 xen/include/asm-generic/kernel.h          |  141 +++
 xen/include/xen/fdt-domain-build.h        |   74 ++
 xen/include/xen/fdt-kernel.h              |  146 +++
 23 files changed, 2231 insertions(+), 1805 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/dom0less-build.h
 create mode 100644 xen/common/device-tree/dom0less-build.c
 create mode 100644 xen/common/device-tree/domain-build.c
 create mode 100644 xen/common/device-tree/kernel.c
 create mode 100644 xen/include/asm-generic/dom0less-build.h
 create mode 100644 xen/include/asm-generic/kernel.h
 create mode 100644 xen/include/xen/fdt-domain-build.h
 create mode 100644 xen/include/xen/fdt-kernel.h

-- 
2.49.0


