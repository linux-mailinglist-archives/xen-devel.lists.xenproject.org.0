Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F3DB49D0C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 00:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115741.1462246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvkXH-0006bv-U6; Mon, 08 Sep 2025 22:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115741.1462246; Mon, 08 Sep 2025 22:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvkXH-0006ZM-Rb; Mon, 08 Sep 2025 22:40:31 +0000
Received: by outflank-mailman (input) for mailman id 1115741;
 Mon, 08 Sep 2025 22:40:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OpAN=3T=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uvkXG-0006ZG-Sg
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 22:40:30 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf1d8bf2-8d04-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 00:40:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 59F4C60051;
 Mon,  8 Sep 2025 22:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EDB6C4CEF1;
 Mon,  8 Sep 2025 22:40:21 +0000 (UTC)
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
X-Inumbo-ID: cf1d8bf2-8d04-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757371223;
	bh=AOM+t17SXxNjyLepjNXD/zpSs8Cpqp5i+7KamT7weIk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aquZhuA7fmM4jd93gSfZtEawARmFxQBxvUG6dMZOFAeVQFuYXgIwATS2Daoqp6g55
	 A/Cb1YxMbdvkBaHogY9yjb4NomlEhWzZpCJcQnoNolZYtsK7DTHl+gXC5zakXwsw3g
	 +Cdn60aWuJdT3nblSbVFv2/xwL02TkcqISA+sHFKKde+DPVcgFOm+bzR4aTtkxcmdf
	 GQBar19ZpDH6gtW2ZYGSVDEVGKCmhc4J+AnReAVgBU3bf9P0pSyF1qr+8DcowVsQSX
	 Kd5Cx1TP1LnFEaCmOVaCUWP8jBv8/yoYWuECYE7y+vdNj+edCavE6hDPnSJeW1WOjy
	 k7rNnftCSmkjw==
Date: Mon, 8 Sep 2025 15:40:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v9 0/4] xen/arm: scmi: introduce SCI SCMI SMC single-agent
 support
In-Reply-To: <062bd466-012a-454a-85ab-1b597c40e4ab@epam.com>
Message-ID: <alpine.DEB.2.22.394.2509081539370.1405870@ubuntu-linux-20-04-desktop>
References: <cover.1756995595.git.oleksii_moisieiev@epam.com> <e60397da-41fd-441d-a3b1-d1d22b322b1a@gmail.com> <c19592f6-2ee5-4faf-8f88-000e07b652f9@epam.com> <5bc8844d-fcde-48a0-9992-0f1a105a563e@gmail.com> <062bd466-012a-454a-85ab-1b597c40e4ab@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

Just a quick note to say that this series is committed.

Oleksii M you might want to check that everything is in order.

Cheers,

Stefano


On Mon, 8 Sep 2025, Oleksii Moisieiev wrote:
> On 08/09/2025 17:31, Oleksii Kurochko wrote:
> > Hello Oleksii,
> > On 9/8/25 4:21 PM, Oleksii Moisieiev wrote:
> >> On 08/09/2025 17:11, Oleksii Kurochko wrote:
> >>> Hello everyone,
> >>> Based on the message from the previous version, the MISRA issues have been fixed,
> >>> and aside from one remaining documentation patch ("docs: arm: add docs for SCMI
> >>> over SMC calls forwarding driver"), the patch series appears to be ready.
> >> It seems to me that I have fixed all comments for the documentation
> >> patch. Did I miss something? Why do you think it's not ready for merge?
> > I don't see any proper/Reviewed-by/ or/Acked-by/ tags, only/Signed-off-by/:
> >    Signed-off-by: Grygorii Strashko<grygorii_strashko@epam.com>
> >    Signed-off-by: Oleksii Moisieiev<oleksii_moisieiev@epam.com>
> >
> > Am I missing something?
> Stefano added his R-B in v6:
> https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2508281436010.8757@ubuntu-linux-20-04-desktop/
> 
> Haven't added this R-B tag manually because of the following comment to 
> the first patch:
> https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2508281431180.8757@ubuntu-linux-20-04-desktop/
> >>> I believe we can consider including it in 4.21. We should have sufficient time
> >>> to address any bugs that may arise.
> >>> By the way, it would also be good to prepare a CHANGELOG patch.
> >> Is it going to be changed during release process or it requires separate
> >> patch to be sent?
> > I'm not entirely sure I understand the first part of the sentence correctly,
> > but both options could work (IIUC).
> > I can send an update to the CHANGELOG as part of the release process,
> > but I'm also fine if you prefer to send a separate patch or apply a new patch
> > to this series using the Message-ID.
> >
> > Please let me know which option you prefer.
> >
> > ~ Oleksii
> I would be grateful if you could include an update to the
> CHANGELOG as part of the release process.
> >>> Does anyone have any objections?
> >>> Best regards,
> >>>    Oleksii
> >>> On 9/4/25 4:21 PM, Oleksii Moisieiev wrote:
> >>>> Inroducing V9 patch series  on top of the Xen version 4.20-rc2
> >>>> which includes implementation of the SCI SCMI SMC single-agent support.
> >>>>
> >>>> This patch series is the first chunk of the
> >>>> "xen/arm: scmi: introduce SCI SCMI SMC multi-agent support" which can
> >>>> be found at [0]
> >>>>
> >>>> SCMI-multiagent support will be provided as the followup patch series.
> >>>>
> >>>> [0]https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/
> >>>>
> >>>> Patch 1 "xen/arm: add generic SCI subsystem"
> >>>> - rebased and refactored
> >>>> - introduced DEVICE_ARM_SCI DT device class and used for SCI drivers probing
> >>>> instead of custom,
> >>>>     linker sections based implementation.
> >>>> - added SCI API for Dom0 DT handling, instead of manipulating with ARM arch
> >>>> dom0 code directly.
> >>>> - RFC changes in XEN_DOMCTL_assign_device OP processing
> >>>> - Introduce arch_handle_passthrough_prop call to handle arm specific
> >>>> nodes
> >>>>
> >>>> Patch 2 "xen/arm: scmi-smc: update to be used under sci subsystem"
> >>>> - update driver introduced by commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI
> >>>> over SMC calls
> >>>> handling layer") be used under sci subsystem.
> >>>> - no functional changes in general
> >>>>
> >>>> Patch 3 "xen/arm: scmi-smc: passthrough SCMI SMC to guest domain
> >>>> This is new change which allows passthrough SCMI SMC, single agent interface to
> >>>> guest domain
> >>>> cover use case "thin Dom0 with guest domain, which serves as Driver domain".
> >>>> See patch commit message for full description.
> >>>>
> >>>> Patch 4 - docs: arm: add docs for SCMI over SMC calls forwarding
> >>>> driver
> >>>> - add documentation section for Simple Arm SCMI over SMC calls
> >>>> forwarding driver.
> >>>>
> >>>> Code can be found at:
> >>>> https://github.com/oleksiimoisieiev/xen/tree/scmi_upstrv5
> >>>>
> >>>> [1] RFC v2:
> >>>> http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.oleksii_moisieiev@epam.com/
> >>>> [2] RFC v3:
> >>>> https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927-1-grygorii_strashko@epam.com
> >>>> SCMI spec:
> >>>> https://developer.arm.com/documentation/den0056/e/?lang=en
> >>>>
> >>>> SCMI bindings:
> >>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> >>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
> >>>>
> >>>> Reference EL3 FW:
> >>>> RPI5:https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
> >>>> Renesas v4h:
> >>>> https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4x-scmi_upd/
> >>>>
> >>>> base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)
> >>>>
> >>>> Changes in v9:
> >>>> - change input param name for sci_handle_call function to match MISRA rules
> >>>> - update domu_dt_sci_parse declaration to match MC3A2.R8.4 MISRA rule
> >>>>
> >>>> Changes in v8:
> >>>> - reneregated {helpers/types}.gen.go, dropped unneeded parameters
> >>>>
> >>>> Changes in v7:
> >>>> - fix sci_handl_call to make changes more readable
> >>>> - fix build error when DOM0LESS_BUILD is disabled (removed
> >>>>    arch_handle_passthrough_prop from the header)
> >>>> - sort headers in alphabetical order in sci.h
> >>>> - sort headers in scmi-smc.c file
> >>>> - Fix commit description.
> >>>> - Move scmi-smc-passthrough definition to match alphaberical order
> >>>> - remove unneeded initialization with NULL
> >>>> - changed u64 to uint64_t
> >>>> - Send warning if iomem permit access was failed
> >>>> - fixed typos
> >>>>
> >>>> Changes in v6:
> >>>> - rebase on top of the latest master
> >>>> - fix return value of sci_dt_finalize() call
> >>>> - add R-b tag
> >>>> - added generated helpers and types go files
> >>>> - rename cmdline parameter to scmi-smc-passthrough
> >>>> - fix goto tag in parse_arm_sci_config
> >>>> - add link to the scmi bindings used in the doc
> >>>> - remove mentions about HVC calls from doc
> >>>> - rename cmdline parameter to scmi-smc-passthrough
> >>>>
> >>>> Changes in v5:
> >>>> - update Maintainers file. Set role as a Reviewer
> >>>> - rebased on the latest master branch
> >>>> - Introduce arch_handle_passthrough_prop call to handle arm specific nodes
> >>>> - rename dom0_scmi_smc_passthrough to scmi_smc_passthrough
> >>>> - rename dom0_scmi_smc_passthrough in documentation
> >>>>
> >>>> Changes in v4:
> >>>> - fix SPDX-License
> >>>> - rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
> >>>> - move XEN_DOMCTL_assign_device code in separate patch
> >>>> - Add documentation for SCI SCMI drivers
> >>>> - xl.cfg doc
> >>>> - fix comments from Stefano Stabellini
> >>>> - fix toolstack code as sugested by Anthony PERARD
> >>>>     - use MATCH_OPTION()
> >>>>     - move arm_sci struct and cfg params in "arch_arm"
> >>>> - add SCMI passthrough for dom0less case
> >>>>
> >>>> Grygorii Strashko (3):
> >>>>     xen/arm: scmi-smc: update to be used under sci subsystem
> >>>>     xen/arm: scmi-smc: passthrough SCMI SMC to domain, single agent
> >>>>     docs: arm: add docs for SCMI over SMC calls forwarding driver
> >>>>
> >>>> Oleksii Moisieiev (1):
> >>>>     xen/arm: add generic SCI subsystem
> >>>>
> >>>>    MAINTAINERS                                   |   6 +
> >>>>    .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++
> >>>>    docs/hypervisor-guide/arm/index.rst           |   9 +
> >>>>    docs/hypervisor-guide/index.rst               |   1 +
> >>>>    docs/man/xl.cfg.5.pod.in                      |  34 +++
> >>>>    docs/misc/arm/device-tree/booting.txt         |  15 ++
> >>>>    docs/misc/xen-command-line.pandoc             |   9 +
> >>>>    tools/golang/xenlight/helpers.gen.go          |  35 +++
> >>>>    tools/golang/xenlight/types.gen.go            |  11 +
> >>>>    tools/include/libxl.h                         |   5 +
> >>>>    tools/libs/light/libxl_arm.c                  |  14 ++
> >>>>    tools/libs/light/libxl_types.idl              |  10 +
> >>>>    tools/xl/xl_parse.c                           |  36 ++++
> >>>>    xen/arch/arm/device.c                         |   5 +
> >>>>    xen/arch/arm/dom0less-build.c                 |  40 ++++
> >>>>    xen/arch/arm/domain.c                         |  12 +-
> >>>>    xen/arch/arm/domain_build.c                   |   8 +
> >>>>    xen/arch/arm/firmware/Kconfig                 |  25 ++-
> >>>>    xen/arch/arm/firmware/Makefile                |   1 +
> >>>>    xen/arch/arm/firmware/sci.c                   | 154 ++++++++++++++
> >>>>    xen/arch/arm/firmware/scmi-smc.c              | 194 +++++++++++++----
> >>>>    xen/arch/arm/include/asm/domain.h             |   5 +
> >>>>    xen/arch/arm/include/asm/firmware/sci.h       | 200 ++++++++++++++++++
> >>>>    xen/arch/arm/include/asm/firmware/scmi-smc.h  |  41 ----
> >>>>    xen/arch/arm/vsmc.c                           |   4 +-
> >>>>    xen/common/device-tree/dom0less-build.c       |   4 +
> >>>>    xen/include/asm-generic/device.h              |   1 +
> >>>>    xen/include/public/arch-arm.h                 |   5 +
> >>>>    xen/include/xen/dom0less-build.h              |   3 +
> >>>>    29 files changed, 982 insertions(+), 85 deletions(-)
> >>>>    create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> >>>>    create mode 100644 docs/hypervisor-guide/arm/index.rst
> >>>>    create mode 100644 xen/arch/arm/firmware/sci.c
> >>>>    create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
> >>>>    delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
> >>>>
> 

