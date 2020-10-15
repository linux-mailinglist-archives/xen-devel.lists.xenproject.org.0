Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EB528F70B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:45:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7570.19905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6N6-0004zL-VX; Thu, 15 Oct 2020 16:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7570.19905; Thu, 15 Oct 2020 16:44:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6N6-0004yw-RV; Thu, 15 Oct 2020 16:44:56 +0000
Received: by outflank-mailman (input) for mailman id 7570;
 Thu, 15 Oct 2020 16:44:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6N5-0004yr-8I
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:44:55 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c650a53-509c-4fba-863a-1b9e903cd03a;
 Thu, 15 Oct 2020 16:44:53 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d24so3809761ljg.10
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:44:53 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:44:51 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6N5-0004yr-8I
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:44:55 +0000
X-Inumbo-ID: 3c650a53-509c-4fba-863a-1b9e903cd03a
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3c650a53-509c-4fba-863a-1b9e903cd03a;
	Thu, 15 Oct 2020 16:44:53 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d24so3809761ljg.10
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KPI4Q1F7W5euLLBiaZYUV/bLE6fHSu+9i7ATgosHWs0=;
        b=ZmAVGxzbwEoBMGgi8j7FP2RrG6tIPbX2Huq/rFX1zIZFLXpdmTafy1J+uhh3N6e9TR
         nX897+CrDSd94nh9gRD8jibfIQ31jRYelf8AfrbslVukWGkClOLz8u3OtBW/y4RkWonq
         ZwThx54weShSBO7vRopgGQiIyskkkG4ZfabD7dqCGyj+l/VB0BG6WuTzfBTtWHwpihmW
         WrcSb2e8cuF7c8azMDXZoNgMoERbvywuZBJm5i2InSE0cLXhfmRRezUh5dN+WJNsPjKD
         WV3Sye55PieAdH2zfplyHIPq8gqF8pLIEizr8IdUAMz8tE1UGEwVC+qX7ege8L1G2tw3
         vAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KPI4Q1F7W5euLLBiaZYUV/bLE6fHSu+9i7ATgosHWs0=;
        b=AXp6DMOYu9ly+AxxvK432MAvLtn4TAP617b909s137igpxL3F25EG4u5Fub5oFnzxb
         fn6PD/aAq6OaWsAuD715X/eG1Y66taiAoPm2BGDMGMrrEnnFkNKWKwr5fAQ0LHWcJzvk
         2Nq3085zX1hhj9IgWLIpMQ/O3TAt4dih8t59ODHMy0HOfbpT4WlQv3tXCG7t/hhV+pHq
         PRFuQz7w9mw0uiIkbmhdeMBOfg8xhgiGDZhBXV5tY1++Vfu6z+KYzY5c3ef1YfVzQMAL
         9XzC51arei8OYKs9WdwFq4B1mM0+Cb7GkNb7rjbJ+gLgdpOQqgnMleNSWHZvN4Qy5CL3
         garQ==
X-Gm-Message-State: AOAM5316jzu9LxIf+5z+e3YekfAP2j8biTLlehERI5y7DRRsdvIeHce8
	YLu6+hYHpnCmu4sN+6ybnXscWenyBpmbfA==
X-Google-Smtp-Source: ABdhPJyHbARbsSk7+f4wCyQ14OdMzOa7bj11yTGi7KR01ogF5R7x2S+z53imcYHFt2NCZ2gaJ+l48Q==
X-Received: by 2002:a2e:8815:: with SMTP id x21mr1777507ljh.312.1602780291717;
        Thu, 15 Oct 2020 09:44:51 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.44.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:44:51 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien.grall@arm.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tim Deegan <tim@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
Date: Thu, 15 Oct 2020 19:44:11 +0300
Message-Id: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

The purpose of this patch series is to add IOREQ/DM support to Xen on Arm.
You can find an initial discussion at [1] and RFC/V1 series at [2]/[3].
Xen on Arm requires some implementation to forward guest MMIO access to a device
model in order to implement virtio-mmio backend or even mediator outside of hypervisor.
As Xen on x86 already contains required support this series tries to make it common
and introduce Arm specific bits plus some new functionality. Patch series is based on
Julien's PoC "xen/arm: Add support for Guest IO forwarding to a device emulator".
Besides splitting existing IOREQ/DM support and introducing Arm side, the series
also includes virtio-mmio related changes (last 2 patches for toolstack)
for the reviewers to be able to see how the whole picture could look like.

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

There are a lot of changes since RFC series, almost all TODOs were resolved on Arm,
Arm code was improved and hardened, common IOREQ/DM code became really arch-agnostic
(without HVM-ism), but one TODO still remains which is "PIO handling" on Arm.
The "PIO handling" TODO is expected to left unaddressed for the current series.
It is not an big issue for now while Xen doesn't have support for vPCI on Arm.
On Arm64 they are only used for PCI IO Bar and we would probably want to expose
them to emulator as PIO access to make a DM completely arch-agnostic. So "PIO handling"
should be implemented when we add support for vPCI.

I left interface untouched in the following patch
"xen/dm: Introduce xendevicemodel_set_irq_level DM op"
since there is still an open discussion what interface to use/what
information to pass to the hypervisor.

Also I decided to drop the following patch:
"[RFC PATCH V1 07/12] A collection of tweaks to be able to run emulator in driver domain"
as I got an advise to write our own policy using FLASK which would cover our use
case (with emulator in driver domain) rather than tweak Xen.

There are two patches on review this series depends on (each involved patch in this series
contains this note as well):
1. https://patchwork.kernel.org/patch/11816689
2. https://patchwork.kernel.org/patch/11803383

Please note, that IOREQ feature is disabled by default within this series.

***

Patch series [4] was rebased on recent "staging branch"
(8a62dee x86/vLAPIC: don't leak regs page from vlapic_init() upon error) and tested on
Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk backend (we will
share it later) running in driver domain and unmodified Linux Guest running on existing
virtio-blk driver (frontend). No issues were observed. Guest domain 'reboot/destroy'
use-cases work properly. Patch series was only build-tested on x86.

Please note, build-test passed for the following modes:
1. x86: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
3. Arm64: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
4. Arm64: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set  (default)
5. Arm32: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
6. Arm32: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set  (default)

***

Any feedback/help would be highly appreciated.

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg00825.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00071.html
[3] https://lists.xenproject.org/archives/html/xen-devel/2020-09/msg00732.html
[4] https://github.com/otyshchenko1/xen/commits/ioreq_4.14_ml3

Julien Grall (5):
  xen/dm: Make x86's DM feature common
  xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
  arm/ioreq: Introduce arch specific bits for IOREQ/DM features
  xen/dm: Introduce xendevicemodel_set_irq_level DM op
  libxl: Introduce basic virtio-mmio support on Arm

Oleksandr Tyshchenko (18):
  x86/ioreq: Prepare IOREQ feature for making it common
  xen/ioreq: Make x86's IOREQ feature common
  xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
  xen/ioreq: Provide alias for the handle_mmio()
  xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
  xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs common
  xen/ioreq: Move x86's ioreq_gfn(server) to struct domain
  xen/ioreq: Introduce ioreq_params to abstract accesses to
    arch.hvm.params
  xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
  xen/ioreq: Remove "hvm" prefixes from involved function names
  xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
  xen/arm: Stick around in leave_hypervisor_to_guest until I/O has
    completed
  xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
  xen/ioreq: Introduce domain_has_ioreq_server()
  xen/arm: io: Abstract sign-extension
  xen/ioreq: Make x86's send_invalidate_req() common
  xen/arm: Add mapcache invalidation handling
  [RFC] libxl: Add support for virtio-disk configuration

 MAINTAINERS                                     |    8 +-
 tools/libs/devicemodel/core.c                   |   18 +
 tools/libs/devicemodel/include/xendevicemodel.h |    4 +
 tools/libs/devicemodel/libxendevicemodel.map    |    1 +
 tools/libs/light/Makefile                       |    1 +
 tools/libs/light/libxl_arm.c                    |   94 +-
 tools/libs/light/libxl_create.c                 |    1 +
 tools/libs/light/libxl_internal.h               |    1 +
 tools/libs/light/libxl_types.idl                |   16 +
 tools/libs/light/libxl_types_internal.idl       |    1 +
 tools/libs/light/libxl_virtio_disk.c            |  109 ++
 tools/xl/Makefile                               |    2 +-
 tools/xl/xl.h                                   |    3 +
 tools/xl/xl_cmdtable.c                          |   15 +
 tools/xl/xl_parse.c                             |  116 ++
 tools/xl/xl_virtio_disk.c                       |   46 +
 xen/arch/arm/Makefile                           |    2 +
 xen/arch/arm/dm.c                               |   89 ++
 xen/arch/arm/domain.c                           |    9 +
 xen/arch/arm/hvm.c                              |    4 +
 xen/arch/arm/io.c                               |   29 +-
 xen/arch/arm/ioreq.c                            |  126 ++
 xen/arch/arm/p2m.c                              |   29 +
 xen/arch/arm/traps.c                            |   58 +-
 xen/arch/x86/Kconfig                            |    1 +
 xen/arch/x86/hvm/Makefile                       |    1 -
 xen/arch/x86/hvm/dm.c                           |  291 +----
 xen/arch/x86/hvm/emulate.c                      |   60 +-
 xen/arch/x86/hvm/hvm.c                          |   24 +-
 xen/arch/x86/hvm/hypercall.c                    |    9 +-
 xen/arch/x86/hvm/intercept.c                    |    5 +-
 xen/arch/x86/hvm/io.c                           |   26 +-
 xen/arch/x86/hvm/ioreq.c                        | 1533 -----------------------
 xen/arch/x86/hvm/stdvga.c                       |   10 +-
 xen/arch/x86/hvm/svm/nestedsvm.c                |    2 +-
 xen/arch/x86/hvm/vmx/realmode.c                 |    6 +-
 xen/arch/x86/hvm/vmx/vvmx.c                     |    2 +-
 xen/arch/x86/mm.c                               |   46 +-
 xen/arch/x86/mm/p2m.c                           |   13 +-
 xen/arch/x86/mm/shadow/common.c                 |    2 +-
 xen/common/Kconfig                              |    3 +
 xen/common/Makefile                             |    2 +
 xen/common/dm.c                                 |  292 +++++
 xen/common/ioreq.c                              | 1443 +++++++++++++++++++++
 xen/common/memory.c                             |   50 +-
 xen/include/asm-arm/domain.h                    |    5 +
 xen/include/asm-arm/hvm/ioreq.h                 |  109 ++
 xen/include/asm-arm/mm.h                        |    8 -
 xen/include/asm-arm/mmio.h                      |    1 +
 xen/include/asm-arm/p2m.h                       |   19 +-
 xen/include/asm-arm/paging.h                    |    4 +
 xen/include/asm-arm/traps.h                     |   24 +
 xen/include/asm-x86/hvm/domain.h                |   50 +-
 xen/include/asm-x86/hvm/emulate.h               |    2 +-
 xen/include/asm-x86/hvm/io.h                    |   17 -
 xen/include/asm-x86/hvm/ioreq.h                 |  198 ++-
 xen/include/asm-x86/hvm/vcpu.h                  |   18 -
 xen/include/asm-x86/mm.h                        |    4 -
 xen/include/asm-x86/p2m.h                       |   20 +-
 xen/include/public/arch-arm.h                   |    5 +
 xen/include/public/hvm/dm_op.h                  |   16 +
 xen/include/xen/dm.h                            |   44 +
 xen/include/xen/ioreq.h                         |  143 +++
 xen/include/xen/p2m-common.h                    |    4 +
 xen/include/xen/sched.h                         |   37 +
 xen/include/xsm/dummy.h                         |    4 +-
 xen/include/xsm/xsm.h                           |    6 +-
 xen/xsm/dummy.c                                 |    2 +-
 xen/xsm/flask/hooks.c                           |    5 +-
 69 files changed, 3223 insertions(+), 2125 deletions(-)
 create mode 100644 tools/libs/light/libxl_virtio_disk.c
 create mode 100644 tools/xl/xl_virtio_disk.c
 create mode 100644 xen/arch/arm/dm.c
 create mode 100644 xen/arch/arm/ioreq.c
 delete mode 100644 xen/arch/x86/hvm/ioreq.c
 create mode 100644 xen/common/dm.c
 create mode 100644 xen/common/ioreq.c
 create mode 100644 xen/include/asm-arm/hvm/ioreq.h
 create mode 100644 xen/include/xen/dm.h
 create mode 100644 xen/include/xen/ioreq.h

-- 
2.7.4


