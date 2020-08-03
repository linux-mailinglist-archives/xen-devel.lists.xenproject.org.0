Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B581823AC41
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 20:22:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2f5n-0008F9-Md; Mon, 03 Aug 2020 18:21:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyPB=BN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k2f5m-0008F4-CS
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 18:21:46 +0000
X-Inumbo-ID: 2f45a374-d5b6-11ea-90c4-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f45a374-d5b6-11ea-90c4-bc764e2007e4;
 Mon, 03 Aug 2020 18:21:44 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x9so40752796ljc.5
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2020 11:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kCrCUo6LTSRAdD0eh2bsSbVdTw1kcGXL8Ch5Id3ziSY=;
 b=SwTJHEJhDp0bLp5ZVRTtP9VYdIy+7L7xwlE2fa3ayYM+dBpMnAPAdZb9GxXGBOVU2Z
 id+PaPsNHjT8gUxYWTLXhgHEeJEAt8SugEc2fgzlZxy3AFzLnqlIusM3bPwmKPCpC9yO
 +bDPxA3mICO3xVUoCmWJwdShenm4Uv57/FyQAUB/jQ3TZYOx/j5aclAWCEB+TvUtUdN5
 9VDXX6PWA5YLrCNGXsP3HNH0k+AdN5t/ytfh43m7ywL1I9GS3eurkejGiVrKHEaofszH
 QvhFoO3foddqAs2XE0u1lx09SiNGos1mxbAMbVBLRdSswK4CNBE8qD3WGDnnJXYK5t20
 8sCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kCrCUo6LTSRAdD0eh2bsSbVdTw1kcGXL8Ch5Id3ziSY=;
 b=Xviso8IQB40Su/ymUu11t6qMn/FDg3fR/XVhkRuTdmn+Sf5ot3nMXQfD8nWPAKQq7G
 u91eyUGWaWT9M2gRtQ6I+AkU/VTrz+iRxdcp0UddnK0PkLayJ0CxMLowsdlura8JMDz0
 XUUmUjRFI0LEpJyAUCx4nceVsosoAHHT8azNNViIrUKpfXjPuPlh5YYQy11ANMwMjIS7
 rhXpI6pVTMIbh7RDKDiRPZT3iVop70QC3Ijv5LAl0W1DhOi9bsGd57Ul33pIyW9+TAde
 tYaRHyVD2UbRTre1it5zMTqbowFyMCaJazIFWYVNdwAE5NjaNi1j0yNzjiiygxXc721P
 UMKw==
X-Gm-Message-State: AOAM533Y6eTkyePcOkvS6tGg9jDk0lccCaMex13YzlwqPX4XnWIEhJvr
 YulhXVY1GEyh1Vk3ugLZfZMrrmAaPkY=
X-Google-Smtp-Source: ABdhPJxeoQ9GFnLnWjMRHcBqrwoXNO7vzfxFn61Tgr9+J/8ok1kbDfkEpGBPwCDIxYXSSkTOJX8HhA==
X-Received: by 2002:a05:651c:106e:: with SMTP id
 y14mr8189554ljm.49.1596478903394; 
 Mon, 03 Aug 2020 11:21:43 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h18sm4486730ljk.7.2020.08.03.11.21.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Aug 2020 11:21:42 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH V1 00/12] IOREQ feature (+ virtio-mmio) on Arm
Date: Mon,  3 Aug 2020 21:21:16 +0300
Message-Id: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

The purpose of this patch series is to add IOREQ/DM support to Xen on Arm.
You can find an initial discussion at [1]. Xen on Arm requires some implementation
to forward guest MMIO access to a device model in order to implement virtio-mmio
backend or even mediator outside of hypervisor. As Xen on x86 already contains
required support this patch series tries to make it common and introduce Arm
specific bits plus some new functionality. Patch series is based on Julien's
PoC "xen/arm: Add support for Guest IO forwarding to a device emulator".
Besides splitting existing IOREQ/DM support and introducing Arm side, 
the patch series also includes virtio-mmio related changes (toolstack)
for the reviewers to be able to see how the whole picture could look like.
For a non-RFC, the IOREQ/DM and virtio-mmio support will be sent separately.

According to the initial discussion there are a few open questions/concerns
regarding security, performance in VirtIO solution:
1. virtio-mmio vs virtio-pci, SPI vs MSI, different use-cases require different
   transport...
2. virtio backend is able to access all guest memory, some kind of protection
   is needed: 'virtio-iommu in Xen' vs 'pre-shared-memory & memcpys in guest'
3. interface between toolstack and 'out-of-qemu' virtio backend, avoid using
   Xenstore in virtio backend if possible.
4. a lot of 'foreing mapping' could lead to the memory exhaustion, Julien
   has some idea regarding that.

Looks like all of them are valid and worth considering, but the first thing
which we need on Arm is a mechanism to forward guest IO to a device emulator,
so let's focus on it in the first place.

***

Patch series [2] was rebased on Xen v4.14 release and tested on Renesas Salvator-X
board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk backend (we will share it later)
running in driver domain and unmodified Linux Guest running on existing
virtio-blk driver (frontend). No issues were observed. Guest domain 'reboot/destroy'
use-cases work properly. Patch series was only build-tested on x86.

Please note, build-test passed for the following modes:
1. x86: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
3. Arm64: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
4. Arm64: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set
5. Arm32: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set

Build-test didn't pass for Arm32 mode with 'CONFIG_IOREQ_SERVER=y' due to the lack of
cmpxchg_64 support on Arm32. See cmpxchg usage in hvm_send_buffered_ioreq()).

***

Any feedback/help would be highly appreciated.

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg00825.html
[2] https://github.com/otyshchenko1/xen/commits/ioreq_4.14_ml1

Oleksandr Tyshchenko (12):
  hvm/ioreq: Make x86's IOREQ feature common
  hvm/dm: Make x86's DM feature common
  xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
  xen/arm: Introduce arch specific bits for IOREQ/DM features
  hvm/dm: Introduce xendevicemodel_set_irq_level DM op
  libxl: Introduce basic virtio-mmio support on Arm
  A collection of tweaks to be able to run emulator in driver domain
  xen/arm: Invalidate qemu mapcache on XENMEM_decrease_reservation
  libxl: Handle virtio-mmio irq in more correct way
  libxl: Add support for virtio-disk configuration
  libxl: Insert "dma-coherent" property into virtio-mmio device node
  libxl: Fix duplicate memory node in DT

 tools/libs/devicemodel/core.c                   |   18 +
 tools/libs/devicemodel/include/xendevicemodel.h |    4 +
 tools/libs/devicemodel/libxendevicemodel.map    |    1 +
 tools/libxc/xc_dom_arm.c                        |   25 +-
 tools/libxl/Makefile                            |    4 +-
 tools/libxl/libxl_arm.c                         |   98 +-
 tools/libxl/libxl_create.c                      |    1 +
 tools/libxl/libxl_internal.h                    |    1 +
 tools/libxl/libxl_types.idl                     |   16 +
 tools/libxl/libxl_types_internal.idl            |    1 +
 tools/libxl/libxl_virtio_disk.c                 |  109 ++
 tools/xl/Makefile                               |    2 +-
 tools/xl/xl.h                                   |    3 +
 tools/xl/xl_cmdtable.c                          |   15 +
 tools/xl/xl_parse.c                             |  116 ++
 tools/xl/xl_virtio_disk.c                       |   46 +
 xen/arch/arm/Kconfig                            |    1 +
 xen/arch/arm/Makefile                           |    2 +
 xen/arch/arm/dm.c                               |   54 +
 xen/arch/arm/domain.c                           |    9 +
 xen/arch/arm/hvm.c                              |   46 +-
 xen/arch/arm/io.c                               |   67 +-
 xen/arch/arm/ioreq.c                            |  100 ++
 xen/arch/arm/traps.c                            |   23 +
 xen/arch/x86/Kconfig                            |    1 +
 xen/arch/x86/hvm/dm.c                           |  289 +----
 xen/arch/x86/hvm/emulate.c                      |    2 +-
 xen/arch/x86/hvm/hvm.c                          |    2 +-
 xen/arch/x86/hvm/io.c                           |    2 +-
 xen/arch/x86/hvm/ioreq.c                        | 1431 +----------------------
 xen/arch/x86/hvm/stdvga.c                       |    2 +-
 xen/arch/x86/hvm/vmx/realmode.c                 |    1 +
 xen/arch/x86/hvm/vmx/vvmx.c                     |    2 +-
 xen/arch/x86/mm.c                               |   45 -
 xen/arch/x86/mm/shadow/common.c                 |    2 +-
 xen/common/Kconfig                              |    3 +
 xen/common/Makefile                             |    1 +
 xen/common/domain.c                             |   15 +
 xen/common/domctl.c                             |    8 +-
 xen/common/event_channel.c                      |   14 +-
 xen/common/hvm/Makefile                         |    2 +
 xen/common/hvm/dm.c                             |  288 +++++
 xen/common/hvm/ioreq.c                          | 1430 ++++++++++++++++++++++
 xen/common/memory.c                             |   54 +-
 xen/include/asm-arm/domain.h                    |   82 ++
 xen/include/asm-arm/hvm/ioreq.h                 |  105 ++
 xen/include/asm-arm/mm.h                        |    8 -
 xen/include/asm-arm/mmio.h                      |    1 +
 xen/include/asm-arm/p2m.h                       |    7 +-
 xen/include/asm-x86/hvm/ioreq.h                 |   45 +-
 xen/include/asm-x86/hvm/vcpu.h                  |    7 -
 xen/include/asm-x86/mm.h                        |    4 -
 xen/include/public/hvm/dm_op.h                  |   15 +
 xen/include/xen/hvm/ioreq.h                     |   89 ++
 xen/include/xen/hypercall.h                     |   12 +
 xen/include/xsm/dummy.h                         |   20 +-
 xen/include/xsm/xsm.h                           |    6 +-
 xen/xsm/dummy.c                                 |    2 +-
 xen/xsm/flask/hooks.c                           |    5 +-
 59 files changed, 2958 insertions(+), 1806 deletions(-)
 create mode 100644 tools/libxl/libxl_virtio_disk.c
 create mode 100644 tools/xl/xl_virtio_disk.c
 create mode 100644 xen/arch/arm/dm.c
 create mode 100644 xen/arch/arm/ioreq.c
 create mode 100644 xen/common/hvm/Makefile
 create mode 100644 xen/common/hvm/dm.c
 create mode 100644 xen/common/hvm/ioreq.c
 create mode 100644 xen/include/asm-arm/hvm/ioreq.h
 create mode 100644 xen/include/xen/hvm/ioreq.h

-- 
2.7.4


