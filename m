Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7B32C8238
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:32:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40802.73745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgTS-0000VO-E2; Mon, 30 Nov 2020 10:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40802.73745; Mon, 30 Nov 2020 10:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgTS-0000Uz-B6; Mon, 30 Nov 2020 10:32:02 +0000
Received: by outflank-mailman (input) for mailman id 40802;
 Mon, 30 Nov 2020 10:32:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgTQ-0000Uu-Do
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:32:00 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8eb8bb7c-7248-47fe-aa3c-5ad1b0218f7e;
 Mon, 30 Nov 2020 10:31:58 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id a9so20591042lfh.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:31:58 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.31.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:31:56 -0800 (PST)
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
X-Inumbo-ID: 8eb8bb7c-7248-47fe-aa3c-5ad1b0218f7e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=EsdzKrQa0ehB+EwQob7OH3FDoo9cYhWibeUDikgbgko=;
        b=FEPh0iyMo1kjvjPBbU7xdrCHrvpvbO55NOVrDHlcGphNIIczLJuF2cDKwZyC1wSEmk
         SzqSm96S5zD5CGoglTUTE7m+efpnVunuI82PgJa6PJqFnLQx0KsT+g4tq+CbxV2xxXyL
         Va1Gqv6QLPbPhynOsWakyFjhmgnWCKsNFoDiYYJbtrwb6mexbS3xBv2Mt4nThDvpkWj9
         omoC6Id91PlhlW/5G+4hb2Nngxi85OR8EP78WuLJXvKxealjknql4GTnWZY/Kcgc45fm
         MHFXMtRXayGNl49GaWLIUNyrJRC2RmBDJhTL3XMRGE+iepnX25mOFeT6gfIRQ6uzgT0D
         mM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EsdzKrQa0ehB+EwQob7OH3FDoo9cYhWibeUDikgbgko=;
        b=J1615h7ApfZTH/pxy7z8qdn3KPaNjaSzQn3kbBHD04i0+ep3xYM3NurmjwHqCEp5+M
         VwT7h5vF/RtKkq1/4zeZsf9jItOEeQTL2ZjByRkX5AJnLAewU5AdOPg0gkzVprcpnFVJ
         RiXwGRQT6p3K53A3RvUt0eYoQa+4crYHAZMC6beQBhDRTs5FWJl7GteLbRL0pQy6KW65
         /P+eUiOiv8wKY2l9rnRNaM9Z2Tf2E7JzxxNnzhs8KzMhYEd6Ezzi8SjZIe6jIX2iZLAE
         l9KJ2fKQIHQODlKr8R6At1H+E864zFebEeaEZNBLMa7nTYmNtFxksIif7Tz8W3LUPKXr
         84Xg==
X-Gm-Message-State: AOAM531e9i09UQKZFLxDDSeLTiDSuVD9/AV0hnLGbd73+x0L9ZcF3JWh
	/fajwbIbNRaaPOZrHcowB37+f6qZ7AckDw==
X-Google-Smtp-Source: ABdhPJzFhvHxnTSaxIRlYPUxVmZEOzDUffJiWLRFAOcYzEcptXl/e7gt5zTt28SDpmuMo7Z8XJPtwQ==
X-Received: by 2002:a19:e059:: with SMTP id g25mr9327867lfj.584.1606732317136;
        Mon, 30 Nov 2020 02:31:57 -0800 (PST)
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
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>,
	Artem Mygaiev <joculator@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: 
Date: Mon, 30 Nov 2020 12:31:15 +0200
Message-Id: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


Date: Sat, 28 Nov 2020 22:33:51 +0200
Subject: [PATCH V3 00/23] IOREQ feature (+ virtio-mmio) on Arm
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello all.

The purpose of this patch series is to add IOREQ/DM support to Xen on Arm.
You can find an initial discussion at [1] and RFC/V1/V2 series at [2]/[3]/[4].
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
(without HVM-ism), the "legacy" mechanism of mapping magic pages for the IOREQ servers
was left x86 specific, etc. But one TODO still remains which is "PIO handling" on Arm.
The "PIO handling" TODO is expected to left unaddressed for the current series.
It is not an big issue for now while Xen doesn't have support for vPCI on Arm.
On Arm64 they are only used for PCI IO Bar and we would probably want to expose
them to emulator as PIO access to make a DM completely arch-agnostic. So "PIO handling"
should be implemented when we add support for vPCI.

I left interface untouched in the following patch
"xen/dm: Introduce xendevicemodel_set_irq_level DM op"
since there is still an open discussion what interface to use/what
information to pass to the hypervisor.

There is a patch on review this series depends on:
https://patchwork.kernel.org/patch/11816689

Please note, that IOREQ feature is disabled by default on Arm within current series.

***

Patch series [5] was rebased on recent "staging branch"
(181f2c2 evtchn: double per-channel locking can't hit identical channels) and tested on
Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk backend [6]
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
[5] https://github.com/otyshchenko1/xen/commits/ioreq_4.14_ml4
[6] https://github.com/xen-troops/virtio-disk/commits/ioreq_ml1

Julien Grall (5):
  xen/dm: Make x86's DM feature common
  xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
  arm/ioreq: Introduce arch specific bits for IOREQ/DM features
  xen/dm: Introduce xendevicemodel_set_irq_level DM op
  libxl: Introduce basic virtio-mmio support on Arm

Oleksandr Tyshchenko (18):
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
  xen/arm: Stick around in leave_hypervisor_to_guest until I/O has
    completed
  xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
  xen/ioreq: Introduce domain_has_ioreq_server()
  xen/arm: io: Abstract sign-extension
  xen/ioreq: Make x86's send_invalidate_req() common
  xen/arm: Add mapcache invalidation handling
  [RFC] libxl: Add support for virtio-disk configuration

 MAINTAINERS                                  |    8 +-
 tools/include/xendevicemodel.h               |    4 +
 tools/libs/devicemodel/core.c                |   18 +
 tools/libs/devicemodel/libxendevicemodel.map |    1 +
 tools/libs/light/Makefile                    |    1 +
 tools/libs/light/libxl_arm.c                 |   94 +-
 tools/libs/light/libxl_create.c              |    1 +
 tools/libs/light/libxl_internal.h            |    1 +
 tools/libs/light/libxl_types.idl             |   16 +
 tools/libs/light/libxl_types_internal.idl    |    1 +
 tools/libs/light/libxl_virtio_disk.c         |  109 +++
 tools/xl/Makefile                            |    2 +-
 tools/xl/xl.h                                |    3 +
 tools/xl/xl_cmdtable.c                       |   15 +
 tools/xl/xl_parse.c                          |  116 +++
 tools/xl/xl_virtio_disk.c                    |   46 +
 xen/arch/arm/Makefile                        |    2 +
 xen/arch/arm/dm.c                            |   89 ++
 xen/arch/arm/domain.c                        |    9 +
 xen/arch/arm/hvm.c                           |    4 +
 xen/arch/arm/io.c                            |   29 +-
 xen/arch/arm/ioreq.c                         |  126 +++
 xen/arch/arm/p2m.c                           |   48 +-
 xen/arch/arm/traps.c                         |   58 +-
 xen/arch/x86/Kconfig                         |    1 +
 xen/arch/x86/hvm/dm.c                        |  295 +-----
 xen/arch/x86/hvm/emulate.c                   |   80 +-
 xen/arch/x86/hvm/hvm.c                       |   12 +-
 xen/arch/x86/hvm/hypercall.c                 |    9 +-
 xen/arch/x86/hvm/intercept.c                 |    5 +-
 xen/arch/x86/hvm/io.c                        |   26 +-
 xen/arch/x86/hvm/ioreq.c                     | 1357 ++------------------------
 xen/arch/x86/hvm/stdvga.c                    |   10 +-
 xen/arch/x86/hvm/svm/nestedsvm.c             |    2 +-
 xen/arch/x86/hvm/vmx/realmode.c              |    6 +-
 xen/arch/x86/hvm/vmx/vvmx.c                  |    2 +-
 xen/arch/x86/mm.c                            |   46 +-
 xen/arch/x86/mm/p2m.c                        |   13 +-
 xen/arch/x86/mm/shadow/common.c              |    2 +-
 xen/common/Kconfig                           |    3 +
 xen/common/Makefile                          |    2 +
 xen/common/dm.c                              |  292 ++++++
 xen/common/ioreq.c                           | 1307 +++++++++++++++++++++++++
 xen/common/memory.c                          |   73 +-
 xen/include/asm-arm/domain.h                 |    3 +
 xen/include/asm-arm/hvm/ioreq.h              |  139 +++
 xen/include/asm-arm/mm.h                     |    8 -
 xen/include/asm-arm/mmio.h                   |    1 +
 xen/include/asm-arm/p2m.h                    |   19 +-
 xen/include/asm-arm/traps.h                  |   24 +
 xen/include/asm-x86/hvm/domain.h             |   43 -
 xen/include/asm-x86/hvm/emulate.h            |    2 +-
 xen/include/asm-x86/hvm/io.h                 |   17 -
 xen/include/asm-x86/hvm/ioreq.h              |   58 +-
 xen/include/asm-x86/hvm/vcpu.h               |   18 -
 xen/include/asm-x86/mm.h                     |    4 -
 xen/include/asm-x86/p2m.h                    |   24 +-
 xen/include/public/arch-arm.h                |    5 +
 xen/include/public/hvm/dm_op.h               |   16 +
 xen/include/xen/dm.h                         |   44 +
 xen/include/xen/ioreq.h                      |  146 +++
 xen/include/xen/p2m-common.h                 |    4 +
 xen/include/xen/sched.h                      |   32 +
 xen/include/xsm/dummy.h                      |    4 +-
 xen/include/xsm/xsm.h                        |    6 +-
 xen/xsm/dummy.c                              |    2 +-
 xen/xsm/flask/hooks.c                        |    5 +-
 67 files changed, 3084 insertions(+), 1884 deletions(-)
 create mode 100644 tools/libs/light/libxl_virtio_disk.c
 create mode 100644 tools/xl/xl_virtio_disk.c
 create mode 100644 xen/arch/arm/dm.c
 create mode 100644 xen/arch/arm/ioreq.c
 create mode 100644 xen/common/dm.c
 create mode 100644 xen/common/ioreq.c
 create mode 100644 xen/include/asm-arm/hvm/ioreq.h
 create mode 100644 xen/include/xen/dm.h
 create mode 100644 xen/include/xen/ioreq.h

-- 
2.7.4


