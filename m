Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF0A29E48D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 08:42:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14014.34925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY2ZT-0005lc-6V; Thu, 29 Oct 2020 07:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14014.34925; Thu, 29 Oct 2020 07:42:07 +0000
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
	id 1kY2ZT-0005lD-2v; Thu, 29 Oct 2020 07:42:07 +0000
Received: by outflank-mailman (input) for mailman id 14014;
 Thu, 29 Oct 2020 07:42:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPBj=EE=linaro.org=masami.hiramatsu@srs-us1.protection.inumbo.net>)
 id 1kY2ZR-0005l8-6k
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 07:42:05 +0000
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93e04e1b-0b63-4c69-a9eb-9430104ac375;
 Thu, 29 Oct 2020 07:42:03 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id f140so1404668ybg.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 00:42:03 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PPBj=EE=linaro.org=masami.hiramatsu@srs-us1.protection.inumbo.net>)
	id 1kY2ZR-0005l8-6k
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 07:42:05 +0000
X-Inumbo-ID: 93e04e1b-0b63-4c69-a9eb-9430104ac375
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 93e04e1b-0b63-4c69-a9eb-9430104ac375;
	Thu, 29 Oct 2020 07:42:03 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id f140so1404668ybg.3
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 00:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bK3hEiwetQ245+GAznGI+zFTudBFUfkyUZ3Y5dKuhEI=;
        b=tl8jXvvz9fPM1ATkFASLjlG46nW+pgP3ROKZMskFlakZitAYoBaRxFSEzmSe5lBvEK
         jlUhKMETB5OKySm/f3tODwzj6oZbeuk8wZQCTdSiOmFaIoNB7pCpB1NwSCvrIRpuzbUw
         LpgCr1GZO/VSHGPpszLvtrBOTya2FA8fk5r1kpE5jmrnw5VfUcBinkfJ+jG+K42W4jn8
         W0mblOYRFw6fI1/Hfv66TSQyRYcHyniAP2nqsY9DR+fWSjdCKG43NVsKItE7q0khKGF+
         hJRrAVL4sogoRI1iYLts+hwyewdpqDuJvkCVnDwjDSRKTaZEd5gpJTIYgBmg0wfpO/sl
         cs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bK3hEiwetQ245+GAznGI+zFTudBFUfkyUZ3Y5dKuhEI=;
        b=JldLtWLMP0LceRSIOCAfRmSgsdaGlLfsGbIW+8n25EAQGrjCRr3cq6+Zd9yKJ+/bLV
         PCWTx4JLctIZHLWpERWi3SqCLtXtxE/B07hmjjxWJC+c0W9KNAeWiUEZEYrSO68Zur04
         6pSjpG74MhMaTTA7ti152fy6IQHxoD6uiBGmmL6m86f/HltFnHrmqcYzg9Pcqys3uzdJ
         SbmRdKUlzYM/wld2zrCMzBrjoGGbzr2kaBkp45c4nDPcSeqErDwQCSjiRBNZrZDz4+xG
         Rr9QaZj56DhzJe+90iZv3JtjhLXqWfcQ6TGegIquWm2iOlspL5h+JEvwdNRCdl97Lqo9
         t96w==
X-Gm-Message-State: AOAM531q9Fefpmq3Bqi6pgpes/KwM7dzI/F6jH10u/+s53J60XweqNb6
	s28Y8U/K8FuYORQhQ8551kx2bTJRVf0YkwD5TgqMew==
X-Google-Smtp-Source: ABdhPJyzVwFwPQeYhR6uYzQEflpMYRJ1HZ9uj5gOSoO8sIwuPV9u2qOSpjnz22iyIXnXDiW64DrHSrYEcEvRs4uRWuo=
X-Received: by 2002:a25:4216:: with SMTP id p22mr4451294yba.234.1603957323237;
 Thu, 29 Oct 2020 00:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
From: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date: Thu, 29 Oct 2020 16:41:52 +0900
Message-ID: <CAA93ih0o3XmD9neBu1fAkP1iBETu1-4qaQaEsZfEWRfYo7VCZA@mail.gmail.com>
Subject: Re: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant <paul@xen.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Julien Grall <julien.grall@arm.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr,

I would like to try this on my arm64 board.

According to your comments in the patch, I made this config file.
# cat debian.conf
name =3D "debian"
type =3D "pvh"
vcpus =3D 8
memory =3D 512
kernel =3D "/opt/agl/vmlinuz-5.9.0-1-arm64"
ramdisk =3D "/opt/agl/initrd.img-5.9.0-1-arm64"
cmdline=3D "console=3Dhvc0 earlyprintk=3Dxen root=3D/dev/xvda1 rw"
disk =3D [ '/opt/agl/debian.qcow2,qcow2,hda' ]
vif =3D [ 'mac=3D00:16:3E:74:3d:76,bridge=3Dxenbr0' ]
virtio =3D 1
vdisk =3D [ 'backend=3DDom0, disks=3Dro:/dev/sda1' ]

And tried to boot a DomU, but I got below error.

# xl create -c debian.conf
Parsing config from debian.conf
libxl: error: libxl_create.c:1863:domcreate_attach_devices: Domain
1:unable to add virtio_disk devices
libxl: error: libxl_domain.c:1218:destroy_domid_pci_done: Domain
1:xc_domain_pause failed
libxl: error: libxl_dom.c:39:libxl__domain_type: unable to get domain
type for domid=3D1
libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain
1:Unable to destroy guest
libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain
1:Destruction of domain failed


Could you tell me how can I test it?

Thank you,

2020=E5=B9=B410=E6=9C=8816=E6=97=A5(=E9=87=91) 1:46 Oleksandr Tyshchenko <o=
lekstysh@gmail.com>:
>
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Hello all.
>
> The purpose of this patch series is to add IOREQ/DM support to Xen on Arm=
.
> You can find an initial discussion at [1] and RFC/V1 series at [2]/[3].
> Xen on Arm requires some implementation to forward guest MMIO access to a=
 device
> model in order to implement virtio-mmio backend or even mediator outside =
of hypervisor.
> As Xen on x86 already contains required support this series tries to make=
 it common
> and introduce Arm specific bits plus some new functionality. Patch series=
 is based on
> Julien's PoC "xen/arm: Add support for Guest IO forwarding to a device em=
ulator".
> Besides splitting existing IOREQ/DM support and introducing Arm side, the=
 series
> also includes virtio-mmio related changes (last 2 patches for toolstack)
> for the reviewers to be able to see how the whole picture could look like=
.
>
> According to the initial discussion there are a few open questions/concer=
ns
> regarding security, performance in VirtIO solution:
> 1. virtio-mmio vs virtio-pci, SPI vs MSI, different use-cases require dif=
ferent
>    transport...
> 2. virtio backend is able to access all guest memory, some kind of protec=
tion
>    is needed: 'virtio-iommu in Xen' vs 'pre-shared-memory & memcpys in gu=
est'
> 3. interface between toolstack and 'out-of-qemu' virtio backend, avoid us=
ing
>    Xenstore in virtio backend if possible.
> 4. a lot of 'foreing mapping' could lead to the memory exhaustion, Julien
>    has some idea regarding that.
>
> Looks like all of them are valid and worth considering, but the first thi=
ng
> which we need on Arm is a mechanism to forward guest IO to a device emula=
tor,
> so let's focus on it in the first place.
>
> ***
>
> There are a lot of changes since RFC series, almost all TODOs were resolv=
ed on Arm,
> Arm code was improved and hardened, common IOREQ/DM code became really ar=
ch-agnostic
> (without HVM-ism), but one TODO still remains which is "PIO handling" on =
Arm.
> The "PIO handling" TODO is expected to left unaddressed for the current s=
eries.
> It is not an big issue for now while Xen doesn't have support for vPCI on=
 Arm.
> On Arm64 they are only used for PCI IO Bar and we would probably want to =
expose
> them to emulator as PIO access to make a DM completely arch-agnostic. So =
"PIO handling"
> should be implemented when we add support for vPCI.
>
> I left interface untouched in the following patch
> "xen/dm: Introduce xendevicemodel_set_irq_level DM op"
> since there is still an open discussion what interface to use/what
> information to pass to the hypervisor.
>
> Also I decided to drop the following patch:
> "[RFC PATCH V1 07/12] A collection of tweaks to be able to run emulator i=
n driver domain"
> as I got an advise to write our own policy using FLASK which would cover =
our use
> case (with emulator in driver domain) rather than tweak Xen.
>
> There are two patches on review this series depends on (each involved pat=
ch in this series
> contains this note as well):
> 1. https://patchwork.kernel.org/patch/11816689
> 2. https://patchwork.kernel.org/patch/11803383
>
> Please note, that IOREQ feature is disabled by default within this series=
.
>
> ***
>
> Patch series [4] was rebased on recent "staging branch"
> (8a62dee x86/vLAPIC: don't leak regs page from vlapic_init() upon error) =
and tested on
> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk bac=
kend (we will
> share it later) running in driver domain and unmodified Linux Guest runni=
ng on existing
> virtio-blk driver (frontend). No issues were observed. Guest domain 'rebo=
ot/destroy'
> use-cases work properly. Patch series was only build-tested on x86.
>
> Please note, build-test passed for the following modes:
> 1. x86: CONFIG_HVM=3Dy / CONFIG_IOREQ_SERVER=3Dy (default)
> 2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
> 3. Arm64: CONFIG_HVM=3Dy / CONFIG_IOREQ_SERVER=3Dy
> 4. Arm64: CONFIG_HVM=3Dy / #CONFIG_IOREQ_SERVER is not set  (default)
> 5. Arm32: CONFIG_HVM=3Dy / CONFIG_IOREQ_SERVER=3Dy
> 6. Arm32: CONFIG_HVM=3Dy / #CONFIG_IOREQ_SERVER is not set  (default)
>
> ***
>
> Any feedback/help would be highly appreciated.
>
> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg00825=
.html
> [2] https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00071=
.html
> [3] https://lists.xenproject.org/archives/html/xen-devel/2020-09/msg00732=
.html
> [4] https://github.com/otyshchenko1/xen/commits/ioreq_4.14_ml3
>
> Julien Grall (5):
>   xen/dm: Make x86's DM feature common
>   xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
>   arm/ioreq: Introduce arch specific bits for IOREQ/DM features
>   xen/dm: Introduce xendevicemodel_set_irq_level DM op
>   libxl: Introduce basic virtio-mmio support on Arm
>
> Oleksandr Tyshchenko (18):
>   x86/ioreq: Prepare IOREQ feature for making it common
>   xen/ioreq: Make x86's IOREQ feature common
>   xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
>   xen/ioreq: Provide alias for the handle_mmio()
>   xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
>   xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs common
>   xen/ioreq: Move x86's ioreq_gfn(server) to struct domain
>   xen/ioreq: Introduce ioreq_params to abstract accesses to
>     arch.hvm.params
>   xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
>   xen/ioreq: Remove "hvm" prefixes from involved function names
>   xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
>   xen/arm: Stick around in leave_hypervisor_to_guest until I/O has
>     completed
>   xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
>   xen/ioreq: Introduce domain_has_ioreq_server()
>   xen/arm: io: Abstract sign-extension
>   xen/ioreq: Make x86's send_invalidate_req() common
>   xen/arm: Add mapcache invalidation handling
>   [RFC] libxl: Add support for virtio-disk configuration
>
>  MAINTAINERS                                     |    8 +-
>  tools/libs/devicemodel/core.c                   |   18 +
>  tools/libs/devicemodel/include/xendevicemodel.h |    4 +
>  tools/libs/devicemodel/libxendevicemodel.map    |    1 +
>  tools/libs/light/Makefile                       |    1 +
>  tools/libs/light/libxl_arm.c                    |   94 +-
>  tools/libs/light/libxl_create.c                 |    1 +
>  tools/libs/light/libxl_internal.h               |    1 +
>  tools/libs/light/libxl_types.idl                |   16 +
>  tools/libs/light/libxl_types_internal.idl       |    1 +
>  tools/libs/light/libxl_virtio_disk.c            |  109 ++
>  tools/xl/Makefile                               |    2 +-
>  tools/xl/xl.h                                   |    3 +
>  tools/xl/xl_cmdtable.c                          |   15 +
>  tools/xl/xl_parse.c                             |  116 ++
>  tools/xl/xl_virtio_disk.c                       |   46 +
>  xen/arch/arm/Makefile                           |    2 +
>  xen/arch/arm/dm.c                               |   89 ++
>  xen/arch/arm/domain.c                           |    9 +
>  xen/arch/arm/hvm.c                              |    4 +
>  xen/arch/arm/io.c                               |   29 +-
>  xen/arch/arm/ioreq.c                            |  126 ++
>  xen/arch/arm/p2m.c                              |   29 +
>  xen/arch/arm/traps.c                            |   58 +-
>  xen/arch/x86/Kconfig                            |    1 +
>  xen/arch/x86/hvm/Makefile                       |    1 -
>  xen/arch/x86/hvm/dm.c                           |  291 +----
>  xen/arch/x86/hvm/emulate.c                      |   60 +-
>  xen/arch/x86/hvm/hvm.c                          |   24 +-
>  xen/arch/x86/hvm/hypercall.c                    |    9 +-
>  xen/arch/x86/hvm/intercept.c                    |    5 +-
>  xen/arch/x86/hvm/io.c                           |   26 +-
>  xen/arch/x86/hvm/ioreq.c                        | 1533 -----------------=
------
>  xen/arch/x86/hvm/stdvga.c                       |   10 +-
>  xen/arch/x86/hvm/svm/nestedsvm.c                |    2 +-
>  xen/arch/x86/hvm/vmx/realmode.c                 |    6 +-
>  xen/arch/x86/hvm/vmx/vvmx.c                     |    2 +-
>  xen/arch/x86/mm.c                               |   46 +-
>  xen/arch/x86/mm/p2m.c                           |   13 +-
>  xen/arch/x86/mm/shadow/common.c                 |    2 +-
>  xen/common/Kconfig                              |    3 +
>  xen/common/Makefile                             |    2 +
>  xen/common/dm.c                                 |  292 +++++
>  xen/common/ioreq.c                              | 1443 +++++++++++++++++=
++++
>  xen/common/memory.c                             |   50 +-
>  xen/include/asm-arm/domain.h                    |    5 +
>  xen/include/asm-arm/hvm/ioreq.h                 |  109 ++
>  xen/include/asm-arm/mm.h                        |    8 -
>  xen/include/asm-arm/mmio.h                      |    1 +
>  xen/include/asm-arm/p2m.h                       |   19 +-
>  xen/include/asm-arm/paging.h                    |    4 +
>  xen/include/asm-arm/traps.h                     |   24 +
>  xen/include/asm-x86/hvm/domain.h                |   50 +-
>  xen/include/asm-x86/hvm/emulate.h               |    2 +-
>  xen/include/asm-x86/hvm/io.h                    |   17 -
>  xen/include/asm-x86/hvm/ioreq.h                 |  198 ++-
>  xen/include/asm-x86/hvm/vcpu.h                  |   18 -
>  xen/include/asm-x86/mm.h                        |    4 -
>  xen/include/asm-x86/p2m.h                       |   20 +-
>  xen/include/public/arch-arm.h                   |    5 +
>  xen/include/public/hvm/dm_op.h                  |   16 +
>  xen/include/xen/dm.h                            |   44 +
>  xen/include/xen/ioreq.h                         |  143 +++
>  xen/include/xen/p2m-common.h                    |    4 +
>  xen/include/xen/sched.h                         |   37 +
>  xen/include/xsm/dummy.h                         |    4 +-
>  xen/include/xsm/xsm.h                           |    6 +-
>  xen/xsm/dummy.c                                 |    2 +-
>  xen/xsm/flask/hooks.c                           |    5 +-
>  69 files changed, 3223 insertions(+), 2125 deletions(-)
>  create mode 100644 tools/libs/light/libxl_virtio_disk.c
>  create mode 100644 tools/xl/xl_virtio_disk.c
>  create mode 100644 xen/arch/arm/dm.c
>  create mode 100644 xen/arch/arm/ioreq.c
>  delete mode 100644 xen/arch/x86/hvm/ioreq.c
>  create mode 100644 xen/common/dm.c
>  create mode 100644 xen/common/ioreq.c
>  create mode 100644 xen/include/asm-arm/hvm/ioreq.h
>  create mode 100644 xen/include/xen/dm.h
>  create mode 100644 xen/include/xen/ioreq.h
>
> --
> 2.7.4
>
>


--=20
Masami Hiramatsu

