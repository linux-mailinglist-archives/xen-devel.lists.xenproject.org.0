Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 990313087DF
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:38:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77934.141529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RAl-0007JV-TL; Fri, 29 Jan 2021 10:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77934.141529; Fri, 29 Jan 2021 10:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RAl-0007J6-PX; Fri, 29 Jan 2021 10:38:39 +0000
Received: by outflank-mailman (input) for mailman id 77934;
 Fri, 29 Jan 2021 10:38:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5RAl-0007J0-5F
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:38:39 +0000
Received: from mail-lj1-x234.google.com (unknown [2a00:1450:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 497892b2-6766-406c-bb02-ebddaec8f227;
 Fri, 29 Jan 2021 10:38:36 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id f19so9897099ljn.5
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 02:38:36 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id s19sm706212ljg.43.2021.01.29.02.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 02:38:34 -0800 (PST)
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
X-Inumbo-ID: 497892b2-6766-406c-bb02-ebddaec8f227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+R/4N7yS6PKzoXFU33Mn+KTT6rfPvl4oUgXxq1t0hi8=;
        b=GUMeZDL0GIb/UW+V6LB8DCk2YQCO5w64UcQXLfuBP4GuBhPpJp3zS9idusm+whh+zW
         WjhCPTZ1GsyCaLp4LaVOQwYbjxbSblj86PuNGC2wSnR9C8TMpk/ILnNEDub/tQSGp6Z2
         JO10JY6vR99hkDYyT88+F3ZST8A3igQQqav1m0DojZgREmyXxnlBO2YgWVsL2ah7owuS
         ErOz57hbbGBjFW6BaiRmZJbDkWSeWjDcUkzJY7EKkmMRILYPGCGUGd4NGrvNdhNOySs0
         WkGL7DApTrN7siOSjotBDStxk9mfZR1L4UiKniUqArBtg6k+heUx4CUqXJQyH02MHsHb
         8/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+R/4N7yS6PKzoXFU33Mn+KTT6rfPvl4oUgXxq1t0hi8=;
        b=M2rjRRyztnAeczxtNn77inwHxBRhO/8u3Pz2Jaik84fdlORJCLeHbLq8yakije1qns
         9cbGF4FQTbTaZJng1m2DC47McB5QPVsbJKJ8o62epLK1QK0ByFNKLZMzFnT3RkzKtqxy
         maIUIzfs7p3HzZFZM8EkYOczfsqiYL0oGQyaWDOPfuuyMtcg+IL2Zu6aTBrADf4lyxJ9
         6MQiOoOs1mlT3nVuLlzNYpMnRMVk9z4I5QUAaPUBEqdbA9u8K5q3B4ukUfEiXWDy07Gl
         gWJRoB5/39dlrHHK/BuWBUQFg8WEEj8QX5ESSd46Ev6gKdmX0sZon1rK4KlVlYf9Unsp
         OE8g==
X-Gm-Message-State: AOAM530y8L2+Pl3e+MajD5HxNwV8NG3bPQwaqM0KUJVXxxzpY66MnK2J
	c+WveWwcFj7e6K8Uri8j9xs=
X-Google-Smtp-Source: ABdhPJzuUUeBD74KmEKkM1aQr0w/fos+fJ8OZ2oJqnydAT7aJ6/XFqHisSVcqwBG6NeEU5bNDQlYDw==
X-Received: by 2002:a05:651c:3c1:: with SMTP id f1mr2025872ljp.407.1611916715494;
        Fri, 29 Jan 2021 02:38:35 -0800 (PST)
Subject: Re: [PATCH V6 00/24] IOREQ feature (+ virtio-mmio) on Arm
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
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 Artem Mygaiev <joculator@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <DB7PR08MB3753D1F61623C538FCEF77059EB99@DB7PR08MB3753.eurprd08.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0cd6754d-00d6-8f81-63f3-0f260f1b7180@gmail.com>
Date: Fri, 29 Jan 2021 12:38:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DB7PR08MB3753D1F61623C538FCEF77059EB99@DB7PR08MB3753.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 29.01.21 10:13, Wei Chen wrote:
> Hi Oleksandr,


Hi Wei


>
> I just tested the v6 and the latest backend service with the latest staging branch.
> They work well.
>
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Thank you, I appreciate your help!



>
> Cheers,
> Wei Chen
>
>> -----Original Message-----
>> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
>> Sent: 2021年1月29日 9:48
>> To: xen-devel@lists.xenproject.org
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant
>> <paul@xen.org>; Jan Beulich <jbeulich@suse.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> Wei Liu <wl@xen.org>; Julien Grall <Julien.Grall@arm.com>; George Dunlap
>> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Julien Grall
>> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Jun Nakajima
>> <jun.nakajima@intel.com>; Kevin Tian <kevin.tian@intel.com>; Tim Deegan
>> <tim@xen.org>; Daniel De Graaf <dgdegra@tycho.nsa.gov>; Volodymyr
>> Babchuk <Volodymyr_Babchuk@epam.com>; Bertrand Marquis
>> <Bertrand.Marquis@arm.com>; Wei Chen <Wei.Chen@arm.com>; Kaly Xin
>> <Kaly.Xin@arm.com>; Artem Mygaiev <joculator@gmail.com>; Alex Bennée
>> <alex.bennee@linaro.org>
>> Subject: [PATCH V6 00/24] IOREQ feature (+ virtio-mmio) on Arm
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Hello all.
>>
>> The purpose of this patch series is to add IOREQ/DM support to Xen on Arm.
>> You can find an initial discussion at [1] and RFC-V5 series at [2]-[7].
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
>>     (for these Alex have provided some input at [8])
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
>> IMPORTANT NOTES:
>>
>> 1. Current patch series doesn't contain VirtIO related changes for the toolstack
>> (but they are still available at the GitHub repo [9]):
>> - libxl: Introduce basic virtio-mmio support on Arm
>> - [RFC] libxl: Add support for virtio-disk configuration
>> I decided to skip these patches for now since they require some rework (not Xen
>> 4.15 materials),
>> I will resume pushing them once we get *common* IOREQ in.
>>
>> 2. There are two new patches (according to the recent discussion) which likely
>> want Release-Ack:
>> - xen/ioreq: Do not let bufioreq to be used on other than x86 arches
>> - xen/ioreq: Make the IOREQ feature selectable on Arm
>> Also it feels to me that
>> - xen/dm: Introduce xendevicemodel_set_irq_level DM op
>> doesn't have all required Acks (at least for toolstack part).
>>
>> 3. I didn't manage to test patch-by-patch (in all possible modes for x86 and Arm)
>> for this version how I did for all previous versions (due to the limited time),
>> but I performed selective build-testing for patches touched and with the whole
>> series
>> applied.
>>
>> ***
>>
>> There are a lot of changes since RFC series, almost all TODOs were resolved on
>> Arm,
>> Arm code was improved and hardened, common IOREQ/DM code became really
>> arch-agnostic
>> (without HVM-ism), the "legacy" mechanism of mapping magic pages for the
>> IOREQ servers
>> was left x86 specific, etc. But one TODO still remains which is "PIO handling" on
>> Arm.
>> The "PIO handling" TODO is expected to left unaddressed for the current series.
>> It is not an big issue for now while Xen doesn't have support for vPCI on Arm.
>> On Arm64 they are only used for PCI IO Bar and we would probably want to
>> expose
>> them to emulator as PIO access to make a DM completely arch-agnostic. So
>> "PIO handling"
>> should be implemented when we add support for vPCI.
>>
>> There are patches on review this series depends on (but it was agreed that this
>> series
>> could go in without them):
>> https://patchwork.kernel.org/patch/11816689
>> https://patchwork.kernel.org/patch/11803383
>>
>> Please note, that IOREQ feature is disabled by default on Arm within current
>> series,
>> but there is a possibility to enable it via menuconfig.
>>
>> ***
>>
>> Patch series [9] was rebased on recent "staging branch"
>> (6ca5101 x86/boot: Drop 'noapic' suggestion from check_timer()) and tested on
>> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk backend
>> [10]
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
>> [6] https://lists.xenproject.org/archives/html/xen-devel/2021-
>> 01/msg00749.html
>> [7] https://lists.xenproject.org/archives/html/xen-devel/2021-
>> 01/msg01899.html
>> [8] https://lists.xenproject.org/archives/html/xen-devel/2020-
>> 11/msg02212.html
>> [9] https://github.com/otyshchenko1/xen/commits/ioreq_4.14_ml7
>> [10] https://github.com/otyshchenko1/virtio-disk/commits/ioreq_ml2
>>
>> Julien Grall (3):
>>    xen/ioreq: Make x86's IOREQ related dm-op handling common
>>    xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
>>    arm/ioreq: Introduce arch specific bits for IOREQ/DM features
>>
>> Oleksandr Tyshchenko (21):
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
>>    xen/arm: Call vcpu_ioreq_handle_completion() in check_for_vcpu_work()
>>    xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
>>    xen/ioreq: Introduce domain_has_ioreq_server()
>>    xen/dm: Introduce xendevicemodel_set_irq_level DM op
>>    xen/arm: io: Abstract sign-extension
>>    xen/arm: io: Harden sign extension check
>>    xen/ioreq: Make x86's send_invalidate_req() common
>>    xen/arm: Add mapcache invalidation handling
>>    xen/ioreq: Do not let bufioreq to be used on other than x86 arches
>>    xen/ioreq: Make the IOREQ feature selectable on Arm
>>
>>   MAINTAINERS                                  |    9 +-
>>   tools/include/xendevicemodel.h               |    4 +
>>   tools/libs/devicemodel/core.c                |   18 +
>>   tools/libs/devicemodel/libxendevicemodel.map |    1 +
>>   xen/arch/arm/Makefile                        |    2 +
>>   xen/arch/arm/dm.c                            |  149 +++
>>   xen/arch/arm/domain.c                        |    9 +
>>   xen/arch/arm/io.c                            |   30 +-
>>   xen/arch/arm/ioreq.c                         |  196 ++++
>>   xen/arch/arm/p2m.c                           |   51 +-
>>   xen/arch/arm/traps.c                         |   55 +-
>>   xen/arch/x86/Kconfig                         |    2 +-
>>   xen/arch/x86/hvm/dm.c                        |  134 +--
>>   xen/arch/x86/hvm/emulate.c                   |  220 ++--
>>   xen/arch/x86/hvm/hvm.c                       |   14 +-
>>   xen/arch/x86/hvm/hypercall.c                 |    9 +-
>>   xen/arch/x86/hvm/intercept.c                 |    5 +-
>>   xen/arch/x86/hvm/io.c                        |   52 +-
>>   xen/arch/x86/hvm/ioreq.c                     | 1368 ++----------------------
>>   xen/arch/x86/hvm/stdvga.c                    |   12 +-
>>   xen/arch/x86/hvm/svm/nestedsvm.c             |    2 +-
>>   xen/arch/x86/hvm/vmx/realmode.c              |    8 +-
>>   xen/arch/x86/hvm/vmx/vvmx.c                  |    5 +-
>>   xen/arch/x86/mm.c                            |   46 +-
>>   xen/arch/x86/mm/p2m-ept.c                    |    1 +
>>   xen/arch/x86/mm/p2m-pt.c                     |    1 +
>>   xen/arch/x86/mm/p2m.c                        |   17 +-
>>   xen/arch/x86/mm/shadow/common.c              |    2 +-
>>   xen/common/Kconfig                           |   12 +-
>>   xen/common/Makefile                          |    2 +
>>   xen/common/dm.c                              |   55 +
>>   xen/common/ioreq.c                           | 1429 ++++++++++++++++++++++++++
>>   xen/common/memory.c                          |   72 +-
>>   xen/include/asm-arm/domain.h                 |    2 +
>>   xen/include/asm-arm/ioreq.h                  |   70 ++
>>   xen/include/asm-arm/mmio.h                   |    1 +
>>   xen/include/asm-arm/p2m.h                    |   19 +-
>>   xen/include/asm-arm/traps.h                  |   25 +
>>   xen/include/asm-x86/hvm/domain.h             |   45 -
>>   xen/include/asm-x86/hvm/emulate.h            |    2 +-
>>   xen/include/asm-x86/hvm/io.h                 |   17 -
>>   xen/include/asm-x86/hvm/ioreq.h              |   39 +-
>>   xen/include/asm-x86/hvm/vcpu.h               |   18 -
>>   xen/include/asm-x86/ioreq.h                  |   39 +
>>   xen/include/asm-x86/mm.h                     |    4 -
>>   xen/include/asm-x86/p2m.h                    |   22 +-
>>   xen/include/public/hvm/dm_op.h               |   16 +
>>   xen/include/xen/dm.h                         |   44 +
>>   xen/include/xen/ioreq.h                      |  140 +++
>>   xen/include/xen/mm.h                         |    9 -
>>   xen/include/xen/p2m-common.h                 |    4 +
>>   xen/include/xen/sched.h                      |   34 +
>>   xen/include/xsm/dummy.h                      |    4 +-
>>   xen/include/xsm/xsm.h                        |    6 +-
>>   xen/xsm/dummy.c                              |    2 +-
>>   xen/xsm/flask/hooks.c                        |    5 +-
>>   56 files changed, 2722 insertions(+), 1837 deletions(-)
>>   create mode 100644 xen/arch/arm/dm.c
>>   create mode 100644 xen/arch/arm/ioreq.c
>>   create mode 100644 xen/common/dm.c
>>   create mode 100644 xen/common/ioreq.c
>>   create mode 100644 xen/include/asm-arm/ioreq.h
>>   create mode 100644 xen/include/asm-x86/ioreq.h
>>   create mode 100644 xen/include/xen/dm.h
>>   create mode 100644 xen/include/xen/ioreq.h
>>
>> --
>> 2.7.4

-- 
Regards,

Oleksandr Tyshchenko


