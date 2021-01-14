Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8482F6440
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:24:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67164.119641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04TZ-0000fU-0h; Thu, 14 Jan 2021 15:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67164.119641; Thu, 14 Jan 2021 15:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04TY-0000ej-Rh; Thu, 14 Jan 2021 15:23:52 +0000
Received: by outflank-mailman (input) for mailman id 67164;
 Thu, 14 Jan 2021 15:23:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0pGa=GR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l04TW-0000dK-Q3
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:23:50 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30b1802d-1a6a-4240-b6d4-9ca581aa363b;
 Thu, 14 Jan 2021 15:23:49 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a9so2714273wrt.5
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jan 2021 07:23:49 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q15sm10603945wrw.75.2021.01.14.07.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 07:23:47 -0800 (PST)
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
X-Inumbo-ID: 30b1802d-1a6a-4240-b6d4-9ca581aa363b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DKBWKwlUCCxRWxTkDhDyP4hc+gKyr8/Wq53I+5kr5h0=;
        b=gHkG8B6x3n6ObYVXPaK5NDsmYHxyO+frRd+DBjfw42i1+8kxJb7REJuU+dPKHGLo7V
         SMN4OclkQQtOSrD0BQXzIq5trhVlgp+o33cHiPsRcLimcG9/tKDPPfUEKL2/VKJNM2ZY
         ghHbwoO77fH+nTr5k7z/kIlE3rsypc55Y3KUtmijrsBZXizOrB6kOtahxKbGAaW6zpLr
         7M5IIzhjFZfG02sDKm52MTztI/VFsXhhNyWf6v6zP15LQ+wDLycyi4Xepk/fk2CEVfk+
         Wyc0UNnKtiJNegHt6SOyt2/6tyqKEoW0LsWT6Bz4zD9GApemoJRwGyO2s/BccXxBl+HN
         nvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DKBWKwlUCCxRWxTkDhDyP4hc+gKyr8/Wq53I+5kr5h0=;
        b=RecPyQVVU7osL3clrlX2F9ClMwMRwJKbDt5f31NVIprlXZ6B7xBpRtqlDwIaghSHSJ
         QJVdbuH5zrXzX4wt8H3VJKIWFWaMIYHk8CuRifd7gcEEVGQoWUM1/lldFLe2pp/wBR1p
         KPF3C9h9H/PhI9I+Sex3w1Fw+FLAXkgEDi5HrrD5Uy7AkmSZ6ngFxFppiuWYza0d093l
         uay/iD1yRtOmCHXB512Q/fE0TfaKA5eszMhObEFFxJLax5F6KUY2ucjgY9lGWjLFyH26
         Usm8HxytTYpSjNJk01NjcCtZ0/9JXbP3XODRmXwAJC+ySLNVeOnLlsbzXG08ZP3U0TS3
         5OlA==
X-Gm-Message-State: AOAM533J9nABQifePnciQTAL1nHspcJjaHBjU7kAbjY2NjgkBM2VgTqY
	IZ1lQj1zw8AuruBGsAF8rzs=
X-Google-Smtp-Source: ABdhPJzqoeNG3Js7m/nJIw9iUVjGag2e8rZhzKFqktxOlhqQm2uO0zn2NE2tGOvRZYpLbEAlDWoZPA==
X-Received: by 2002:adf:f60b:: with SMTP id t11mr8555621wrp.401.1610637828186;
        Thu, 14 Jan 2021 07:23:48 -0800 (PST)
Subject: Re: [PATCH V4 00/24] IOREQ feature (+ virtio-mmio) on Arm
To: Wei Chen <Wei.Chen@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <Julien.Grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 Artem Mygaiev <joculator@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <AM0PR08MB37471AF1CDF1B930A919C3449EA80@AM0PR08MB3747.eurprd08.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d88f8dc5-da96-0efa-09f2-fb7884f2f703@gmail.com>
Date: Thu, 14 Jan 2021 17:23:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB37471AF1CDF1B930A919C3449EA80@AM0PR08MB3747.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 14.01.21 05:55, Wei Chen wrote:
> Hi Oleksandr,

Hi Wei.


>
> I have tested this series with latest master and staging branches.
> The virtio function works well for Arm as v3.

Thank you! This is good news.


>
> For latest staging branch, it needs a tiny rebase for:
> 0011 xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
> As staging branch changes rapidly, I had done it manually and done the test.
> It should not affect review.

Yes, very rapidly I would say) Yes, I will need to rebase due to the 
recent "xen/memory: Introduce CONFIG_ARCH_ACQUIRE_RESOURCE" patch


>
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Thanks.


>
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Oleksandr Tyshchenko
>> Sent: 2021年1月13日 5:52
>> To: xen-devel@lists.xenproject.org
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant
>> <paul@xen.org>; Jan Beulich <jbeulich@suse.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> Wei Liu <wl@xen.org>; Julien Grall <Julien.Grall@arm.com>; George Dunlap
>> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Julien Grall
>> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Jun Nakajima
>> <jun.nakajima@intel.com>; Kevin Tian <kevin.tian@intel.com>; Tim Deegan
>> <tim@xen.org>; Daniel De Graaf <dgdegra@tycho.nsa.gov>; Volodymyr
>> Babchuk <Volodymyr_Babchuk@epam.com>; Anthony PERARD
>> <anthony.perard@citrix.com>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Wei Chen <Wei.Chen@arm.com>; Kaly Xin <Kaly.Xin@arm.com>; Artem
>> Mygaiev <joculator@gmail.com>; Alex Bennée <alex.bennee@linaro.org>
>> Subject: [PATCH V4 00/24] IOREQ feature (+ virtio-mmio) on Arm
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Hello all.
>>
>> The purpose of this patch series is to add IOREQ/DM support to Xen on Arm.
>> You can find an initial discussion at [1] and RFC-V3 series at [2]-[5].
>> Xen on Arm requires some implementation to forward guest MMIO access to a
>> device
>> model in order to implement virtio-mmio backend or even mediator outside of
>> hypervisor.
>> As Xen on x86 already contains required support this series tries to make it
>> common
>> and introduce Arm specific bits plus some new functionality. Patch series is
>> based on
>> Julien's PoC "xen/arm: Add support for Guest IO forwarding to a device
>> emulator".
>> Besides splitting existing IOREQ/DM support and introducing Arm side, the series
>> also includes virtio-mmio related changes (last 2 patches for toolstack)
>> for the reviewers to be able to see how the whole picture could look like
>> and give it a try.
>>
>> According to the initial/subsequent discussions there are a few open
>> questions/concerns regarding security, performance in VirtIO solution:
>> 1. virtio-mmio vs virtio-pci, SPI vs MSI, or even a composition of virtio-mmio +
>> MSI,
>>     different use-cases require different transport...
>> 2. virtio backend is able to access all guest memory, some kind of protection
>>     is needed: 'virtio-iommu in Xen' vs 'pre-shared-memory & memcpys in guest',
>> etc
>>     (for the first two Alex have provided valuable input at [6])
>> 3. interface between toolstack and 'out-of-qemu' virtio backend, avoid using
>>     Xenstore in virtio backend if possible. Also, there is a desire to make VirtIO
>>     backend hypervisor-agnostic.
>> 4. a lot of 'foreing mapping' could lead to the memory exhaustion at the host
>> side,
>>     as we are stealing the page from host memory in order to map the guest page.
>>     Julien has some idea regarding that.
>> 5. Julien also has some ideas how to optimize the IOREQ code:
>>     5.1 vcpu_ioreq_handle_completion (former handle_hvm_io_completion)
>> which is called in
>>         an hotpath on Arm (everytime we are re-entering to the guest):
>>         Ideally, vcpu_ioreq_handle_completion should be a NOP (at max a few
>> instructions)
>>         if there is nothing to do (if we don't have I/O forwarded to an IOREQ server).
>>         Maybe we want to introduce a per-vCPU flag indicating if an I/O has been
>>         forwarded to an IOREQ server. This would allow us to bypass most of the
>> function
>>         if there is nothing to do.
>>     5.2 The current way to handle MMIO is the following:
>>         - Pause the vCPU
>>         - Forward the access to the backend domain
>>         - Schedule the backend domain
>>         - Wait for the access to be handled
>>         - Unpause the vCPU
>>         The sequence is going to be fairly expensive on Xen.
>>         It might be possible to optimize the ACK and avoid to wait for the backend
>>         to handle the access.
>>
>> Looks like all of them are valid and worth considering, but the first thing
>> which we need on Arm is a mechanism to forward guest IO to a device emulator,
>> so let's focus on it in the first place.
>>
>> ***
>>
>> There are a lot of changes since RFC series, almost all TODOs were resolved on
>> Arm,
>> Arm code was improved and hardened, common IOREQ/DM code became really
>> arch-agnostic
>> (without HVM-ism), the "legacy" mechanism of mapping magic pages for the
>> IOREQ servers
>> was left x86 specific, etc. Also patch that makes DM code public was reworked
>> to have
>> the top level dm-op handling arch-specific and call into ioreq_server_dm_op()
>> for otherwise unhandled ops.
>> But one TODO still remains which is "PIO handling" on Arm.
>> The "PIO handling" TODO is expected to left unaddressed for the current series.
>> It is not an big issue for now while Xen doesn't have support for vPCI on Arm.
>> On Arm64 they are only used for PCI IO Bar and we would probably want to
>> expose
>> them to emulator as PIO access to make a DM completely arch-agnostic. So
>> "PIO handling"
>> should be implemented when we add support for vPCI.
>>
>> I left interface untouched in the following patch
>> "xen/dm: Introduce xendevicemodel_set_irq_level DM op"
>> since there is still an open discussion what interface to use/what
>> information to pass to the hypervisor.
>>
>> There are patches on review this series depends on:
>> https://patchwork.kernel.org/patch/11816689
>> https://patchwork.kernel.org/patch/11803383
>>
>> Please note, that IOREQ feature is disabled by default on Arm within current
>> series.
>>
>> ***
>>
>> Patch series [7] was rebased on recent "staging branch"
>> (7ba2ab4 x86/p2m: Fix paging_gva_to_gfn() for nested virt) and tested on
>> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk backend
>> [8]
>> running in driver domain and unmodified Linux Guest running on existing
>> virtio-blk driver (frontend). No issues were observed. Guest domain
>> 'reboot/destroy'
>> use-cases work properly. Patch series was only build-tested on x86.
>>
>> Please note, build-test passed for the following modes:
>> 1. x86: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
>> 2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
>> 3. Arm64: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
>> 4. Arm64: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set  (default)
>> 5. Arm32: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
>> 6. Arm32: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set  (default)
>>
>> ***
>>
>> Any feedback/help would be highly appreciated.
>>
>> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-
>> 07/msg00825.html
>> [2] https://lists.xenproject.org/archives/html/xen-devel/2020-
>> 08/msg00071.html
>> [3] https://lists.xenproject.org/archives/html/xen-devel/2020-
>> 09/msg00732.html
>> [4] https://lists.xenproject.org/archives/html/xen-devel/2020-
>> 10/msg01077.html
>> [5] https://lists.xenproject.org/archives/html/xen-devel/2020-
>> 11/msg02188.html
>> [6] https://lists.xenproject.org/archives/html/xen-devel/2020-
>> 11/msg02212.html
>> [7] https://github.com/otyshchenko1/xen/commits/ioreq_4.14_ml5
>> [8] https://github.com/xen-troops/virtio-disk/commits/ioreq_ml1
>>
>> Julien Grall (5):
>>    xen/ioreq: Make x86's IOREQ related dm-op handling common
>>    xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
>>    arm/ioreq: Introduce arch specific bits for IOREQ/DM features
>>    xen/dm: Introduce xendevicemodel_set_irq_level DM op
>>    libxl: Introduce basic virtio-mmio support on Arm
>>
>> Oleksandr Tyshchenko (19):
>>    x86/ioreq: Prepare IOREQ feature for making it common
>>    x86/ioreq: Add IOREQ_STATUS_* #define-s and update code for moving
>>    x86/ioreq: Provide out-of-line wrapper for the handle_mmio()
>>    xen/ioreq: Make x86's IOREQ feature common
>>    xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
>>    xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
>>    xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs common
>>    xen/ioreq: Move x86's ioreq_server to struct domain
>>    xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
>>    xen/ioreq: Remove "hvm" prefixes from involved function names
>>    xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
>>    xen/arm: Stick around in leave_hypervisor_to_guest until I/O has
>>      completed
>>    xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
>>    xen/ioreq: Introduce domain_has_ioreq_server()
>>    xen/arm: io: Abstract sign-extension
>>    xen/arm: io: Harden sign extension check
>>    xen/ioreq: Make x86's send_invalidate_req() common
>>    xen/arm: Add mapcache invalidation handling
>>    [RFC] libxl: Add support for virtio-disk configuration
>>
>>   MAINTAINERS                                  |    8 +-
>>   tools/include/xendevicemodel.h               |    4 +
>>   tools/libs/devicemodel/core.c                |   18 +
>>   tools/libs/devicemodel/libxendevicemodel.map |    1 +
>>   tools/libs/light/Makefile                    |    1 +
>>   tools/libs/light/libxl_arm.c                 |   94 +-
>>   tools/libs/light/libxl_create.c              |    1 +
>>   tools/libs/light/libxl_internal.h            |    1 +
>>   tools/libs/light/libxl_types.idl             |   16 +
>>   tools/libs/light/libxl_types_internal.idl    |    1 +
>>   tools/libs/light/libxl_virtio_disk.c         |  109 ++
>>   tools/xl/Makefile                            |    2 +-
>>   tools/xl/xl.h                                |    3 +
>>   tools/xl/xl_cmdtable.c                       |   15 +
>>   tools/xl/xl_parse.c                          |  116 +++
>>   tools/xl/xl_virtio_disk.c                    |   46 +
>>   xen/arch/arm/Makefile                        |    2 +
>>   xen/arch/arm/dm.c                            |  174 ++++
>>   xen/arch/arm/domain.c                        |    9 +
>>   xen/arch/arm/io.c                            |   30 +-
>>   xen/arch/arm/ioreq.c                         |  198 ++++
>>   xen/arch/arm/p2m.c                           |   51 +-
>>   xen/arch/arm/traps.c                         |   72 +-
>>   xen/arch/x86/Kconfig                         |    1 +
>>   xen/arch/x86/hvm/dm.c                        |  107 +-
>>   xen/arch/x86/hvm/emulate.c                   |  220 ++--
>>   xen/arch/x86/hvm/hvm.c                       |   14 +-
>>   xen/arch/x86/hvm/hypercall.c                 |    9 +-
>>   xen/arch/x86/hvm/intercept.c                 |    5 +-
>>   xen/arch/x86/hvm/io.c                        |   52 +-
>>   xen/arch/x86/hvm/ioreq.c                     | 1375 ++-----------------------
>>   xen/arch/x86/hvm/stdvga.c                    |   12 +-
>>   xen/arch/x86/hvm/svm/nestedsvm.c             |    2 +-
>>   xen/arch/x86/hvm/vmx/realmode.c              |    8 +-
>>   xen/arch/x86/hvm/vmx/vvmx.c                  |    5 +-
>>   xen/arch/x86/mm.c                            |   46 +-
>>   xen/arch/x86/mm/p2m.c                        |   17 +-
>>   xen/arch/x86/mm/shadow/common.c              |    2 +-
>>   xen/common/Kconfig                           |    3 +
>>   xen/common/Makefile                          |    1 +
>>   xen/common/ioreq.c                           | 1426 ++++++++++++++++++++++++++
>>   xen/common/memory.c                          |   72 +-
>>   xen/include/asm-arm/domain.h                 |    3 +
>>   xen/include/asm-arm/hvm/ioreq.h              |   72 ++
>>   xen/include/asm-arm/mm.h                     |    8 -
>>   xen/include/asm-arm/mmio.h                   |    1 +
>>   xen/include/asm-arm/p2m.h                    |   19 +-
>>   xen/include/asm-arm/traps.h                  |   25 +
>>   xen/include/asm-x86/hvm/domain.h             |   43 -
>>   xen/include/asm-x86/hvm/emulate.h            |    2 +-
>>   xen/include/asm-x86/hvm/io.h                 |   17 -
>>   xen/include/asm-x86/hvm/ioreq.h              |   39 +-
>>   xen/include/asm-x86/hvm/vcpu.h               |   18 -
>>   xen/include/asm-x86/mm.h                     |    4 -
>>   xen/include/asm-x86/p2m.h                    |   27 +-
>>   xen/include/public/arch-arm.h                |    5 +
>>   xen/include/public/hvm/dm_op.h               |   16 +
>>   xen/include/xen/dm.h                         |   39 +
>>   xen/include/xen/ioreq.h                      |  140 +++
>>   xen/include/xen/p2m-common.h                 |    4 +
>>   xen/include/xen/sched.h                      |   34 +
>>   xen/include/xsm/dummy.h                      |    4 +-
>>   xen/include/xsm/xsm.h                        |    6 +-
>>   xen/xsm/dummy.c                              |    2 +-
>>   xen/xsm/flask/hooks.c                        |    5 +-
>>   65 files changed, 3073 insertions(+), 1809 deletions(-)
>>   create mode 100644 tools/libs/light/libxl_virtio_disk.c
>>   create mode 100644 tools/xl/xl_virtio_disk.c
>>   create mode 100644 xen/arch/arm/dm.c
>>   create mode 100644 xen/arch/arm/ioreq.c
>>   create mode 100644 xen/common/ioreq.c
>>   create mode 100644 xen/include/asm-arm/hvm/ioreq.h
>>   create mode 100644 xen/include/xen/dm.h
>>   create mode 100644 xen/include/xen/ioreq.h
>>
>> --
>> 2.7.4
>>
-- 
Regards,

Oleksandr Tyshchenko


