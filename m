Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3008B265097
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:22:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT5R-0004JP-IG; Thu, 10 Sep 2020 20:22:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT5Q-0004JK-5r
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:22:28 +0000
X-Inumbo-ID: 4956ad79-8628-4767-af5c-2d96c28a6754
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4956ad79-8628-4767-af5c-2d96c28a6754;
 Thu, 10 Sep 2020 20:22:26 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id u21so9881620ljl.6
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8Srql+3Qvdm+jm45tmfxarmQd4oOdn0Y9n8jU1uLQOw=;
 b=vIUgCJZpRhx89y20QtiZWx/mLgvjPyjHsRhVC9D3ryOTtFJ5pwiHIzIEvuS1kJo+FU
 prJffjivr7PHphtA8Ke4/4U3ePNpuslNOnv1QInU2ROH5xvfNMiP99Nxb8x21o12Frf5
 twiWDW27T5x2cxla0yc18Uj8OxvMGWNjV/u4Tkh1pgFQbbhzXNRl8K9HQGqMSRqZ8PMO
 0zjdz5BGqIJPQ13LDIeJyhpMDJdXzLA2snQB8yOXpJoiuvwE+J1K9WTpScVIF+O0zU93
 k3EtDC1bnH2c48FhkJ/9jYxK+3elEqjgJgwJcckDBQnzR0AnPQMFdScx0EHoZheXZswg
 hWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8Srql+3Qvdm+jm45tmfxarmQd4oOdn0Y9n8jU1uLQOw=;
 b=kBvSO6zXRFlOIGg65YrOoBVLIZM2oFAj2xAwkdG0D/Wbe5FgkxAdSGLah5TcH1YHHp
 4YXqxxK4Qs9RKZrWDAV4ZE8jSfQQZC4tngFEGEt2pOtp6wVo1KS7kmcZvgBczzeYZRY+
 S2fb8L8SHxiJEcZADZYJMIXMF6J5NqQbVOZ+FvkK24v5G+tEZgTy5M/vlHnRJYMk7BhH
 sQJJpFtO/rr7USZPUM19AMgaj/tDRUk7Rx+hZfDEZJMlnFpLDdkn35JEpilYUpq6LVuJ
 wEHrE5it7S9k0gDy4T5y5sCfk0zvSpkBeyom28N7DIcRJU/CPfv9euiwVRgwPPc8zL1N
 Q0uA==
X-Gm-Message-State: AOAM530EvE7PkjLthSIrzy6g0NEYFVTtME8pJ2WrnTGO7ppfTgoChCX1
 PXB7d3+rh+nRjbmEnw9Zr6Bi84oG9otzog==
X-Google-Smtp-Source: ABdhPJxH3BdtiZkElqhNahvwju4YKstHuuRItyI9ANqjyC0MdXjLL66lbO34pZxO2tXlKYn5IjlhpA==
X-Received: by 2002:a2e:b813:: with SMTP id u19mr5069708ljo.396.1599769344782; 
 Thu, 10 Sep 2020 13:22:24 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:23 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH V1 00/16] IOREQ feature (+ virtio-mmio) on Arm
Date: Thu, 10 Sep 2020 23:21:54 +0300
Message-Id: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

The purpose of this patch series is to add IOREQ/DM support to Xen on Arm.
You can find an initial discussion at [1] and RFC patch series at [2].
Xen on Arm requires some implementation to forward guest MMIO access to a device
model in order to implement virtio-mmio backend or even mediator outside of hypervisor.
As Xen on x86 already contains required support this patch series tries to make it common
and introduce Arm specific bits plus some new functionality. Patch series is based on
Julien's PoC "xen/arm: Add support for Guest IO forwarding to a device emulator".
Besides splitting existing IOREQ/DM support and introducing Arm side, the patch series
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

There are a lot of changes since RFC series, several critical TODOs were
resolved on Arm, Arm code were improved and hardened, but one TODO still remains
which is "PIO handling" on Arm. The "PIO handling" TODO is expected to left unaddressed
for the current series. It is not an big issue for now while Xen doesn't have
support for vPCI on Arm. On Arm64 they are only used for PCI IO Bar and we
would probably want to expose them to emulator as PIO access to make a DM
completely arch-agnostic. So "PIO handling" should be implemented when we add
support for vPCI.

I left interface untouched in the following patch 
"xen/dm: Introduce xendevicemodel_set_irq_level DM op"
since there is still an open discussion what interface to use/what
information to pass to the hypervisor.

Also I decided to drop the following patch:
"[RFC PATCH V1 07/12] A collection of tweaks to be able to run emulator in driver domain"
as I got an advise to write our own policy using FLASK which would cover our use
case (with emulator in driver domain) rather than tweak Xen.

***

Patch series [3] was rebased on "1 month old staging branch"
(79c2d51 tools: bump library version numbers) and tested on Renesas Salvator-X
board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk backend (we will share it later)
running in driver domain and unmodified Linux Guest running on existing
virtio-blk driver (frontend). No issues were observed. Guest domain 'reboot/destroy'
use-cases work properly. Patch series was only build-tested on x86.

Please note, build-test passed for the following modes:
1. x86: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
3. Arm64: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
4. Arm64: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set
(!)5. Arm32: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
6. Arm32: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set

(!) Please note, the build on Arm32 was broken for the RFC series (see cmpxchg
usage in hvm_send_buffered_ioreq()) due to the lack of cmpxchg_64 support on Arm32.

But, there is a patch on review to address this issue: https://patchwork.kernel.org/patch/11715559/
Together with the following patch in this series: "xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()"
we are able to fix Arm32 and harden IOREQ code on Arm. 

***

Any feedback/help would be highly appreciated.

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg00825.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00071.html
[3] https://github.com/otyshchenko1/xen/commits/ioreq_4.14_ml2

Oleksandr Tyshchenko (16):
  x86/ioreq: Prepare IOREQ feature for making it common
  xen/ioreq: Make x86's IOREQ feature common
  xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
  xen/ioreq: Provide alias for the handle_mmio()
  xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
  xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs common
  xen/dm: Make x86's DM feature common
  xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
  arm/ioreq: Introduce arch specific bits for IOREQ/DM features
  xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
  xen/ioreq: Introduce hvm_domain_has_ioreq_server()
  xen/dm: Introduce xendevicemodel_set_irq_level DM op
  xen/ioreq: Make x86's invalidate qemu mapcache handling common
  xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
  libxl: Introduce basic virtio-mmio support on Arm
  [RFC] libxl: Add support for virtio-disk configuration

 MAINTAINERS                                     |    8 +-
 tools/libs/devicemodel/core.c                   |   18 +
 tools/libs/devicemodel/include/xendevicemodel.h |    4 +
 tools/libs/devicemodel/libxendevicemodel.map    |    1 +
 tools/libxl/Makefile                            |    4 +-
 tools/libxl/libxl_arm.c                         |   94 +-
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
 xen/arch/arm/dm.c                               |   67 ++
 xen/arch/arm/domain.c                           |    9 +
 xen/arch/arm/io.c                               |   11 +-
 xen/arch/arm/ioreq.c                            |  142 +++
 xen/arch/arm/p2m.c                              |   16 +
 xen/arch/arm/traps.c                            |   41 +-
 xen/arch/x86/Kconfig                            |    1 +
 xen/arch/x86/hvm/dm.c                           |  289 +----
 xen/arch/x86/hvm/emulate.c                      |    2 +-
 xen/arch/x86/hvm/hvm.c                          |    2 +-
 xen/arch/x86/hvm/hypercall.c                    |    9 +-
 xen/arch/x86/hvm/intercept.c                    |    1 +
 xen/arch/x86/hvm/io.c                           |   16 +-
 xen/arch/x86/hvm/ioreq.c                        | 1426 +---------------------
 xen/arch/x86/hvm/stdvga.c                       |    2 +-
 xen/arch/x86/hvm/vmx/realmode.c                 |    1 +
 xen/arch/x86/hvm/vmx/vvmx.c                     |    3 +-
 xen/arch/x86/mm.c                               |   46 +-
 xen/arch/x86/mm/p2m.c                           |    5 +-
 xen/arch/x86/mm/shadow/common.c                 |    2 +-
 xen/common/Kconfig                              |    3 +
 xen/common/Makefile                             |    2 +
 xen/common/dm.c                                 |  288 +++++
 xen/common/ioreq.c                              | 1433 +++++++++++++++++++++++
 xen/common/memory.c                             |   54 +-
 xen/include/asm-arm/domain.h                    |   47 +
 xen/include/asm-arm/hvm/ioreq.h                 |  108 ++
 xen/include/asm-arm/mm.h                        |    8 -
 xen/include/asm-arm/mmio.h                      |    1 +
 xen/include/asm-arm/p2m.h                       |   11 +-
 xen/include/asm-arm/paging.h                    |    4 +
 xen/include/asm-x86/hvm/domain.h                |   36 +-
 xen/include/asm-x86/hvm/io.h                    |   17 -
 xen/include/asm-x86/hvm/ioreq.h                 |   47 +-
 xen/include/asm-x86/hvm/vcpu.h                  |    7 -
 xen/include/asm-x86/mm.h                        |    4 -
 xen/include/asm-x86/p2m.h                       |    3 +-
 xen/include/public/arch-arm.h                   |    5 +
 xen/include/public/hvm/dm_op.h                  |   15 +
 xen/include/xen/hypercall.h                     |   12 +
 xen/include/xen/ioreq.h                         |  146 +++
 xen/include/xen/sched.h                         |    2 +
 xen/include/xsm/dummy.h                         |    4 +-
 xen/include/xsm/xsm.h                           |    6 +-
 xen/xsm/dummy.c                                 |    2 +-
 xen/xsm/flask/hooks.c                           |    5 +-
 64 files changed, 2940 insertions(+), 1863 deletions(-)
 create mode 100644 tools/libxl/libxl_virtio_disk.c
 create mode 100644 tools/xl/xl_virtio_disk.c
 create mode 100644 xen/arch/arm/dm.c
 create mode 100644 xen/arch/arm/ioreq.c
 create mode 100644 xen/common/dm.c
 create mode 100644 xen/common/ioreq.c
 create mode 100644 xen/include/asm-arm/hvm/ioreq.h
 create mode 100644 xen/include/xen/ioreq.h

-- 
2.7.4


