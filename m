Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC98374459F
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 02:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557665.871211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWg-00081Q-AP; Sat, 01 Jul 2023 00:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557665.871211; Sat, 01 Jul 2023 00:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFOWg-0007yN-6z; Sat, 01 Jul 2023 00:31:46 +0000
Received: by outflank-mailman (input) for mailman id 557665;
 Sat, 01 Jul 2023 00:31:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypVN=CT=gmail.com=christopher.w.clark.io@srs-se1.protection.inumbo.net>)
 id 1qFOWd-0007yB-Vc
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 00:31:44 +0000
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [2607:f8b0:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5e7dadd-17a6-11ee-b237-6b7b168915f2;
 Sat, 01 Jul 2023 02:31:42 +0200 (CEST)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so1609285a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 17:31:41 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83]) by smtp.gmail.com with ESMTPSA id
 s68-20020a632c47000000b0055b61cd99a1sm1824296pgs.81.2023.06.30.17.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 17:31:39 -0700 (PDT)
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
X-Inumbo-ID: a5e7dadd-17a6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688171500; x=1690763500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0KShfPa2MYNDYvy3QcwTC4m5i40zpzbfd6OhegXALTA=;
        b=SYVViW8Kq3XV7ttdG4YkvMDrD04h3WC6+r/LzrevHdjm7LO/JG32gqJcpagAraFkJf
         MAFA0kBDqNk7ySD9J5b6D+8K5Arg4F+ITABIIG9UTx3GK7/3sigm6NSW3Op8pHvMqGL1
         vGG91YEVhXngmP57SYfov06GZn+BeE0C5aJOs1XuRaa6BWDI7ygOg6QFLBPkgWAH6xFe
         JpmTRkZ4ZkdoVjeMHXr8orfmloLFvMgD/UuoDuS+i/Pbw49mjmhIv2mMLFoY6P8XuIwG
         qzJLTHljPmyFsMRJ5l96K5YSVjUvfNTBszd/WAyds5XTOEcp+Y+kcVx7aid7aS7SQt8V
         dVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688171500; x=1690763500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KShfPa2MYNDYvy3QcwTC4m5i40zpzbfd6OhegXALTA=;
        b=XTONTon8ZoQFAoP8iUlvmOmPJMWnvjESbdUoW3kH7FNdXtToU1EBqz8B1p5FSmL7Vk
         +q2GLrCa5A0FuA/IgognpW0lMXyxdHEQFVaY2S8bU6f6xjDAoRFCRkeCPYSCOH4g1xxR
         w867jlB4u0KSjYJm4QoBij6OErbqlJn0WgzVF3lsHttLW1QOecVxODQbSa1Wt4Wdv8AR
         4sjxkw2USByEaeGdjtVbNFs4qivHic6fKq8rl3WEoRBWW9oPgC1Gca26hTjENH+kMGBJ
         M7Y8zD705qjWC9geg63taB7fqa6pyL8CiJwHu8vw1rBq7TavI1G5AoYQIRWoMqEGGAyS
         z34g==
X-Gm-Message-State: AC+VfDzJH1Br7CW1fuh4QFuwDCD7jVfqqBP7FZ7BYPRWmYqKM8BapjDv
	yZHuk+8HZesMfy4lY3Ipg8hKDp61JHg=
X-Google-Smtp-Source: ACHHUZ7Li8ezhJYAShh3/ZzQAdyQzMjFylf+La4WOAedx9NLRQbBjdH20CpyW9vn7ElsAgYNwzV3uA==
X-Received: by 2002:a05:6a20:9719:b0:122:7e90:61c2 with SMTP id hr25-20020a056a20971900b001227e9061c2mr4071641pzc.9.1688171499907;
        Fri, 30 Jun 2023 17:31:39 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
	stefano.stabellini@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rich Persaud <persaur@gmail.com>
Subject: [PATCH 00/11] v2: Boot modules for Hyperlaunch
Date: Fri, 30 Jun 2023 17:31:21 -0700
Message-Id: <20230701003132.2210306-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a v2 series of work for Hyperlaunch for the Xen hypervisor,
implementing a subset of the v1 series and functionality, with changes
made to address the community feedback provided on the patches in v1.

The patches in this series are primarily derived from patches 2-4 of the
v1 full series, in a series of smaller patches for ease of review.

Thanks to AMD for supporting this work.

Documentation on Hyperlaunch:
https://wiki.xenproject.org/wiki/Hyperlaunch

v1 Hyperlaunch patch series:
https://lists.xenproject.org/archives/html/xen-devel/2022-07/msg00345.html

thanks

Christopher

Christopher Clark (11):
  x86 setup: move x86 boot module counting into a new boot_info struct
  x86 setup: per-arch bootmodule structure, headroom field
  x86 setup: change bootstrap map to accept new boot module structures
  x86 setup: porting dom0 construction logic to boot module structures
  xsm: switch XSM init to boot info structures
  x86 setup, microcode: switch to the new bootinfo structures
  x86 boot: define paddr_t and add macros for typedefing struct pointers
  types, x86 boot: define DEFINE_PTR_TYPE and char_ptr_t
  x86, arm, riscv: add per-arch bootinfo headers to allow x86 boot
    include
  arm setup: include <xen/bootinfo> for bootmod defns, replacing enum
  x86 setup: refactor entrypoints to new boot info

 xen/arch/arm/efi/efi-boot.h               |   6 +
 xen/arch/arm/include/asm/bootinfo.h       |  20 ++
 xen/arch/arm/include/asm/setup.h          |  11 +-
 xen/arch/riscv/include/asm/bootinfo.h     |  20 ++
 xen/arch/x86/boot/defs.h                  |  10 +
 xen/arch/x86/boot/reloc.c                 | 192 ++++++++++++------
 xen/arch/x86/bzimage.c                    |  10 +-
 xen/arch/x86/cpu/microcode/core.c         | 149 ++++++++------
 xen/arch/x86/dom0_build.c                 |  10 +-
 xen/arch/x86/efi/efi-boot.h               |  95 +++++----
 xen/arch/x86/guest/xen/pvh-boot.c         |  65 ++++--
 xen/arch/x86/hvm/dom0_build.c             |  44 ++--
 xen/arch/x86/include/asm/boot.h           |  55 +++++
 xen/arch/x86/include/asm/bootinfo.h       |  47 +++++
 xen/arch/x86/include/asm/bzimage.h        |   2 +-
 xen/arch/x86/include/asm/dom0_build.h     |  13 +-
 xen/arch/x86/include/asm/guest/pvh-boot.h |   6 +-
 xen/arch/x86/include/asm/microcode.h      |   7 +-
 xen/arch/x86/include/asm/setup.h          |   7 +-
 xen/arch/x86/pv/dom0_build.c              |  32 +--
 xen/arch/x86/setup.c                      | 232 ++++++++++++----------
 xen/common/efi/boot.c                     |   4 +-
 xen/include/xen/bootinfo.h                |  62 ++++++
 xen/include/xen/types.h                   |  11 +
 xen/include/xsm/xsm.h                     |  28 +--
 xen/xsm/xsm_core.c                        |  47 +++--
 xen/xsm/xsm_policy.c                      |  58 +++---
 27 files changed, 821 insertions(+), 422 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/bootinfo.h
 create mode 100644 xen/arch/riscv/include/asm/bootinfo.h
 create mode 100644 xen/arch/x86/include/asm/boot.h
 create mode 100644 xen/arch/x86/include/asm/bootinfo.h
 create mode 100644 xen/include/xen/bootinfo.h

-- 
2.25.1


