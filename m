Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D97302B1F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:09:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74296.133505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47EP-0008Nx-JE; Mon, 25 Jan 2021 19:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74296.133505; Mon, 25 Jan 2021 19:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47EP-0008NX-FF; Mon, 25 Jan 2021 19:08:57 +0000
Received: by outflank-mailman (input) for mailman id 74296;
 Mon, 25 Jan 2021 19:08:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTVL=G4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l47EN-0008N7-KN
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:08:55 +0000
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38fb6f59-b5ec-4529-9820-807726b17df2;
 Mon, 25 Jan 2021 19:08:53 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id y187so533295wmd.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 11:08:53 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k6sm12991031wro.27.2021.01.25.11.08.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 11:08:51 -0800 (PST)
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
X-Inumbo-ID: 38fb6f59-b5ec-4529-9820-807726b17df2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tp4rEA1li7Sg8Zyywme0Zc3k34NznQfaU7y5B3HtAEY=;
        b=uBRXRl+Q8W0YCptmnQg3qhzfntPQ7BBk0bsyvrdy1dOWH0su0c0YhWcmsER/M79+pt
         mAJA02Kuy66isdXbXQyOaCLAWsJ4w0q0fxX4l0ZwuyxXK/O1SZU09CXRuIbkw71PiYjU
         91+uGMTSFmkWdBv4A3ahNRK5/ED/6IfFjzTn7gobML5lSScpoqAzCVYEb9cwCBIj1fTB
         eROszPgDDXD70kr4Y/QVTdgkBVzIDljU93CNLYczQmOmowwqUKMf6BOSUG0kDp4DG43r
         XTrjEb9RPq5dCKzYQ4GetYfp2vA1jMC1ke/LbLnlks5EwHFZJm7jGNRXuT/XGAxDg7gZ
         8Qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tp4rEA1li7Sg8Zyywme0Zc3k34NznQfaU7y5B3HtAEY=;
        b=UiCHzSULTa8B9+rVO6+mf4dcA8pMli4oJgcRfBUygVmktJLZL+jdb9KxMnWYTvD7de
         BsqQYOdX4jbQgteGHwFa1+YZE3sgwrOTAec+heYVASvV7tESiJLMnClinXZsgeeWmvXP
         qUJvzyX1mJqpxLf6HsNgdDLHajpGUQwYf8MotBKWtdDNYoNOROjpTYlNfqnqgPe5t2sF
         XVuq3u74BcED1hnBHFl2ebBqTuO5vjFhMvue2X+Gem+Ily1qG5FWMeVi/qLFJNsTBkos
         5uEfrrYemQUSuIPw0dwwOhv7CWqbLwwxKIhJNImHrbx9vL5Bd3BtIwhFye7QigaFOzKv
         ILtQ==
X-Gm-Message-State: AOAM533iX82IY17Ga6IHEBQoXcz73fYQmxQlJ0SI88r6WYsjgttByV0V
	fPuDELSRlSMqkHGOCTWGa9laolJ2uksT2w==
X-Google-Smtp-Source: ABdhPJzrwg8LtFAe7yM6PkHZzGvvNlxPs1/BAFQbKnPtXvUP6jvOO/tEowDCRgzx1W6WadG7czZ7CA==
X-Received: by 2002:a1c:1f86:: with SMTP id f128mr1442218wmf.174.1611601732438;
        Mon, 25 Jan 2021 11:08:52 -0800 (PST)
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
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Tim Deegan <tim@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>,
	Artem Mygaiev <joculator@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
Date: Mon, 25 Jan 2021 21:08:07 +0200
Message-Id: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

The purpose of this patch series is to add IOREQ/DM support to Xen on Arm.
You can find an initial discussion at [1] and RFC-V4 series at [2]-[6].
Xen on Arm requires some implementation to forward guest MMIO access to a device
model in order to implement virtio-mmio backend or even mediator outside of hypervisor.
As Xen on x86 already contains required support this series tries to make it common
and introduce Arm specific bits plus some new functionality. Patch series is based on
Julien's PoC "xen/arm: Add support for Guest IO forwarding to a device emulator".

***

IMPORTANT NOTE:

Current patch series doesn't contain VirtIO related changes for the toolstack
(but they are still available at the GitHub repo [8]):
- libxl: Introduce basic virtio-mmio support on Arm
- [RFC] libxl: Add support for virtio-disk configuration
I decided to skip these patches for now since they require some rework (not Xen 4.15 materials),
I will resume pushing them once we get *common* IOREQ in.  

***

According to the initial/subsequent discussions there are a few open
questions/concerns regarding security, performance in VirtIO solution:
1. virtio-mmio vs virtio-pci, SPI vs MSI, or even a composition of virtio-mmio + MSI, 
   different use-cases require different transport...
2. virtio backend is able to access all guest memory, some kind of protection
   is needed: 'virtio-iommu in Xen' vs 'pre-shared-memory & memcpys in guest', etc
   (for these Alex have provided some input at [7])
3. interface between toolstack and 'out-of-qemu' virtio backend, avoid using
   Xenstore in virtio backend if possible. Also, there is a desire to make VirtIO
   backend hypervisor-agnostic.
4. a lot of 'foreing mapping' could lead to the memory exhaustion at the host side,
   as we are stealing the page from host memory in order to map the guest page.
   Julien has some idea regarding that.
5. Julien also has some ideas how to optimize the IOREQ code:
   5.1 vcpu_ioreq_handle_completion (former handle_hvm_io_completion) which is called in
       an hotpath on Arm (everytime we are re-entering to the guest):
       Ideally, vcpu_ioreq_handle_completion should be a NOP (at max a few instructions)
       if there is nothing to do (if we don't have I/O forwarded to an IOREQ server).
       Maybe we want to introduce a per-vCPU flag indicating if an I/O has been
       forwarded to an IOREQ server. This would allow us to bypass most of the function
       if there is nothing to do.
   5.2 The current way to handle MMIO is the following:
       - Pause the vCPU
       - Forward the access to the backend domain
       - Schedule the backend domain
       - Wait for the access to be handled
       - Unpause the vCPU
       The sequence is going to be fairly expensive on Xen.
       It might be possible to optimize the ACK and avoid to wait for the backend
       to handle the access.

Looks like all of them are valid and worth considering, but the first thing
which we need on Arm is a mechanism to forward guest IO to a device emulator,
so let's focus on it in the first place.

There are a lot of changes since RFC series, almost all TODOs were resolved on Arm,
Arm code was improved and hardened, common IOREQ/DM code became really arch-agnostic
(without HVM-ism), the "legacy" mechanism of mapping magic pages for the IOREQ servers
was left x86 specific, etc. But one TODO still remains which is "PIO handling" on Arm.
The "PIO handling" TODO is expected to left unaddressed for the current series.
It is not an big issue for now while Xen doesn't have support for vPCI on Arm.
On Arm64 they are only used for PCI IO Bar and we would probably want to expose
them to emulator as PIO access to make a DM completely arch-agnostic. So "PIO handling"
should be implemented when we add support for vPCI.

There are patches on review this series depends on:
https://patchwork.kernel.org/patch/11816689
https://patchwork.kernel.org/patch/11803383

Please note, that IOREQ feature is disabled by default on Arm within current series.

***

Patch series [8] was rebased on recent "staging branch"
(5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is unmapped) and tested on
Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk backend [9]
running in driver domain and unmodified Linux Guest running on existing
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
[4] https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01077.html
[5] https://lists.xenproject.org/archives/html/xen-devel/2020-11/msg02188.html
[6] https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg00749.html
[7] https://lists.xenproject.org/archives/html/xen-devel/2020-11/msg02212.html
[8] https://github.com/otyshchenko1/xen/commits/ioreq_4.14_ml6
[9] https://github.com/xen-troops/virtio-disk/commits/ioreq_ml1

Julien Grall (3):
  xen/ioreq: Make x86's IOREQ related dm-op handling common
  xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
  arm/ioreq: Introduce arch specific bits for IOREQ/DM features

Oleksandr Tyshchenko (19):
  x86/ioreq: Prepare IOREQ feature for making it common
  x86/ioreq: Add IOREQ_STATUS_* #define-s and update code for moving
  x86/ioreq: Provide out-of-line wrapper for the handle_mmio()
  xen/ioreq: Make x86's IOREQ feature common
  xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
  xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
  xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs common
  xen/ioreq: Move x86's ioreq_server to struct domain
  xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
  xen/ioreq: Remove "hvm" prefixes from involved function names
  xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
  xen/arm: Call vcpu_ioreq_handle_completion() in check_for_vcpu_work()
  xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
  xen/ioreq: Introduce domain_has_ioreq_server()
  xen/dm: Introduce xendevicemodel_set_irq_level DM op
  xen/arm: io: Abstract sign-extension
  xen/arm: io: Harden sign extension check
  xen/ioreq: Make x86's send_invalidate_req() common
  xen/arm: Add mapcache invalidation handling

 MAINTAINERS                                  |    9 +-
 tools/include/xendevicemodel.h               |    4 +
 tools/libs/devicemodel/core.c                |   18 +
 tools/libs/devicemodel/libxendevicemodel.map |    1 +
 xen/arch/arm/Makefile                        |    2 +
 xen/arch/arm/dm.c                            |  149 +++
 xen/arch/arm/domain.c                        |    9 +
 xen/arch/arm/io.c                            |   30 +-
 xen/arch/arm/ioreq.c                         |  200 ++++
 xen/arch/arm/p2m.c                           |   51 +-
 xen/arch/arm/traps.c                         |   55 +-
 xen/arch/x86/Kconfig                         |    2 +-
 xen/arch/x86/hvm/dm.c                        |  134 +--
 xen/arch/x86/hvm/emulate.c                   |  220 ++--
 xen/arch/x86/hvm/hvm.c                       |   14 +-
 xen/arch/x86/hvm/hypercall.c                 |    9 +-
 xen/arch/x86/hvm/intercept.c                 |    5 +-
 xen/arch/x86/hvm/io.c                        |   52 +-
 xen/arch/x86/hvm/ioreq.c                     | 1368 ++----------------------
 xen/arch/x86/hvm/stdvga.c                    |   12 +-
 xen/arch/x86/hvm/svm/nestedsvm.c             |    2 +-
 xen/arch/x86/hvm/vmx/realmode.c              |    8 +-
 xen/arch/x86/hvm/vmx/vvmx.c                  |    5 +-
 xen/arch/x86/mm.c                            |   46 +-
 xen/arch/x86/mm/p2m.c                        |   17 +-
 xen/arch/x86/mm/shadow/common.c              |    2 +-
 xen/common/Kconfig                           |    6 +-
 xen/common/Makefile                          |    2 +
 xen/common/dm.c                              |   55 +
 xen/common/ioreq.c                           | 1426 ++++++++++++++++++++++++++
 xen/common/memory.c                          |   72 +-
 xen/include/asm-arm/domain.h                 |    2 +
 xen/include/asm-arm/ioreq.h                  |   70 ++
 xen/include/asm-arm/mmio.h                   |    1 +
 xen/include/asm-arm/p2m.h                    |   19 +-
 xen/include/asm-arm/traps.h                  |   25 +
 xen/include/asm-x86/hvm/domain.h             |   43 -
 xen/include/asm-x86/hvm/emulate.h            |    2 +-
 xen/include/asm-x86/hvm/io.h                 |   17 -
 xen/include/asm-x86/hvm/ioreq.h              |   39 +-
 xen/include/asm-x86/hvm/vcpu.h               |   18 -
 xen/include/asm-x86/ioreq.h                  |   37 +
 xen/include/asm-x86/mm.h                     |    4 -
 xen/include/asm-x86/p2m.h                    |   22 +-
 xen/include/public/hvm/dm_op.h               |   16 +
 xen/include/xen/dm.h                         |   43 +
 xen/include/xen/ioreq.h                      |  140 +++
 xen/include/xen/mm.h                         |    9 -
 xen/include/xen/p2m-common.h                 |    4 +
 xen/include/xen/sched.h                      |   34 +
 xen/include/xsm/dummy.h                      |    4 +-
 xen/include/xsm/xsm.h                        |    6 +-
 xen/xsm/dummy.c                              |    2 +-
 xen/xsm/flask/hooks.c                        |    5 +-
 54 files changed, 2712 insertions(+), 1835 deletions(-)
 create mode 100644 xen/arch/arm/dm.c
 create mode 100644 xen/arch/arm/ioreq.c
 create mode 100644 xen/common/dm.c
 create mode 100644 xen/common/ioreq.c
 create mode 100644 xen/include/asm-arm/ioreq.h
 create mode 100644 xen/include/asm-x86/ioreq.h
 create mode 100644 xen/include/xen/dm.h
 create mode 100644 xen/include/xen/ioreq.h

-- 
2.7.4


