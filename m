Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A07B386C8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 17:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096433.1451140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urIDs-0001Zt-2M; Wed, 27 Aug 2025 15:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096433.1451140; Wed, 27 Aug 2025 15:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urIDr-0001Xo-VU; Wed, 27 Aug 2025 15:38:03 +0000
Received: by outflank-mailman (input) for mailman id 1096433;
 Wed, 27 Aug 2025 15:38:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=73cR=3H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1urIDq-0001Xi-NN
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 15:38:02 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf4a0f0c-835b-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 17:37:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5174560269;
 Wed, 27 Aug 2025 15:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BF3C4CEEB;
 Wed, 27 Aug 2025 15:37:55 +0000 (UTC)
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
X-Inumbo-ID: cf4a0f0c-835b-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756309078;
	bh=VsgLqKKal36rQ5zNj1i0WNfTR9a1aspIQ2u+sy01tp4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MUlaiQfxgn2FC2Kp0mmI8ZmRE/EtV1Ma1ZRhXwa5MMrdX2aLkOfcF0BHbfbArbIwW
	 euRk9M6b9MThiHNlSY7Nj7L9YzZbyZc8BqbatqO0Gn55d63hOfeWCNap7WA8cMQmfT
	 Fia4X+FL5/P5W5vwR8qx9NVBLzfn28IKpZ9h2L+ADNkoaYAS9Bk/UZuDB1hH9tJDFK
	 Edjw+rpE6JA/kew/ewrmbj3vEcGJ4blRYxeMIwtFFoLRz6xvpOLvm6PIo4x+JdF7+3
	 GbceZrFYXQS+j0AzmsT5VGHrmNz+sTuYQv7HCKCIJGKY3rKdPMS4iVyabE59siLQzM
	 Vg8WJj1FvggFQ==
Date: Wed, 27 Aug 2025 08:37:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v5 00/10] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent support
In-Reply-To: <2eb538a8-aaf6-4d71-9379-40ae0351f0c6@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508270808050.3391208@ubuntu-linux-20-04-desktop>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2508221733410.2743087@ubuntu-linux-20-04-desktop> <2eb538a8-aaf6-4d71-9379-40ae0351f0c6@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I completed the review of the patch series but as you could see from the
comments, the first few patches are far better along than the last two.

The current deadline is on Friday this week. I am happy to review this
series as promptly as I can but I am not sure we'll be able to complete
the last two patches.

Cheers,

Stefano


On Wed, 27 Aug 2025, Oleksii Moisieiev wrote:
> Hi Stefano,
> 
> Our use-case imply using scmi-smc-multiagent to be able to split scmi
> between the domains,
> so we would like to apply all patch series in the release.
> 
> On 23/08/2025 03:34, Stefano Stabellini wrote:
> > I think it should be feasible to commit at least patches 1-4 in time for
> > the release
> >
> > On Tue, 22 Jul 2025, Oleksii Moisieiev wrote:
> >> Inroducing V4 RFC patch series  on top of the Xen version 4.20-rc2
> >> which includes implementation of the SCI SCMI SMC multi-agent support.
> >>
> >> Patch 1 "xen/arm: add generic SCI subsystem"
> >> - rebased and refactored
> >> - introduced DEVICE_ARM_SCI DT device class and used for SCI drivers probing
> >> instead of custom,
> >>    linker sections based implementation.
> >> - added SCI API for Dom0 DT handling, instead of manipulating with ARM arch
> >> dom0 code directly.
> >> - RFC changes in XEN_DOMCTL_assign_device OP processing
> >> - Introduce arch_handle_passthrough_prop call to handle arm specific
> >> nodes
> >>
> >> Patch 2 "xen/arm: scmi-smc: update to be used under sci subsystem"
> >> - update driver introduced by commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI
> >> over SMC calls
> >> handling layer") be used under sci subsystem.
> >> - no functional changes in general
> >>
> >> Patch 3 "xen/arm: scmi-smc: passthrough SCMI SMC to guest domain
> >> This is new change which allows passthrough SCMI SMC, single agent interface to
> >> guest domain
> >> cover use case "thin Dom0 with guest domain, which serves as Driver domain".
> >> See patch commit message for full description.
> >>
> >> Patch 4 - docs: arm: add docs for SCMI over SMC calls forwarding
> >> driver
> >> - add documentation section for Simple Arm SCMI over SMC/HVC calls
> >> forwarding driver.
> >>
> >> Patch 6 - xen/domctl: extend XEN_DOMCTL_assign_device to handle not
> >> only iommu
> >> - add chainged handling of assigned DT devices to support
> >> access-controller functionality through SCI framework.
> >> Change was done in two parts:
> >>   - update iommu_do_dt_domctl() to check for dt_device_is_protected()
> >>   and not fail if DT device is not protected by IOMMU
> >>   -add chained call to sci_do_domctl() to do_domctl()
> >>
> >> Patch 9 - xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
> >> - added "scmi-secondary-agents" and "#scmi-secondary-agent-cells"
> >>    property to "xen,config" node in "chosen" to inform SCI SCMI
> >>    multi-agent driver about available agents and their
> >>    configuration. It defines <agent_id> to <smc-id,scmi_shm> map.
> >>    This option is Xen specific as Xen is the only one entry in the
> >>    system which need to know about SCMI multi-agent support and configuration.
> >> - each guest using SCMI should be configured with SCMI agent_id, so SCMI
> >>    FW can implement Agent-specific permission policy.
> >>    -- dom0: dom0_scmi_agent_id=<agent_id> in Xen command line option
> >>    -- toolstack: arm_sci = "type=scmi_smc_multiagent,agent_id=<agent_id>"
> >>    -- dom0less: "xen,sci_type", "xen,sci_agent_id" properties in
> >> "xen,domain" nodes.
> >> - factored out SCMI generic definitions (re-usable)
> >> - factored out SCMI shmem code (re-usable)
> >> - the SCMI passthrough configuration for guest domains is similar to any other
> >> HW passthrough cfg.
> >>
> >> Patch 10 - docs: arm: add SCI SCMI SMC multi-agent driver docs
> >> - add SCI SCMI SMC multi-agent driver documentation.
> >>
> >> Add separate SCMI DT node for Xen management agent under "xen,config"
> >> node under chosen.
> >>
> >> All Xen-specific configuration provided under "/chosen" node. This
> >> approach allows to isolate modifications to Host DT only under
> >> "/chosen" node.
> >>
> >> This approach provides the following device tree (DT)
> >> parameters (placed under xen,config node):
> >>
> >> - "scmi-secondary-agents": A Xen-specific parameter under the
> >>    "/chosen" node, which describes the SCMI agent configuration for
> >>    the domains.
> >> - the SCMI configuration for Xen (privileged agent) and the shared
> >>    memory configuration for all agents are provided under the "/chosen"
> >>    node and are used strictly by Xen for its initial configuration.
> >> - the scmi_shm and SCMI configuration for Dom0 are placed in the
> >>    "/firmware/scmi" node so that they can be moved to Dom0 without
> >>    any changes.
> >>
> >> This configuration allows the use of Xen-specific nodes to provide
> >> information strictly needed by Xen while using the default SCMI
> >> configuration for Dom0 and other domains. As a result, no additional
> >> bindings need to be introduced to the device tree.
> >> This simplifies the Xen SCMI multi-agent configuration and utilizes
> >> generic device tree bindings for the domains.
> >>
> >> NOTE: Haven't added RB tags for patch 1 and 2 because rebase and some
> >> minor changes were done.
> >>
> >> Code can be found at:
> >> https://github.com/oleksiimoisieiev/xen/tree/scmi_upstrv5
> >>
> >> [1] RFC v2:
> >> http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.oleksii_moisieiev@epam.com/
> >> [2] RFC v3:
> >> https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927-1-grygorii_strashko@epam.com
> >> SCMI spec:
> >> https://developer.arm.com/documentation/den0056/e/?lang=en
> >>
> >> SCMI bindings:
> >> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> >> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
> >>
> >> Reference EL3 FW:
> >> RPI5: https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
> >> Renesas v4h:
> >> https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4x-scmi_upd/
> >>
> >> base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)
> >>
> >> Changes in v5:
> >> - update Maintainers file. Set role as a Reviewer
> >> - rebased on the latest master branch
> >> - Introduce arch_handle_passthrough_prop call to handle arm specific nodes
> >> - rename dom0_scmi_smc_passthrough to scmi_smc_passthrough
> >> - rename dom0_scmi_smc_passthrough in documentation
> >> - set error code to -ENXIO when iommu is disabled
> >> - return -EINVAL if mediator without assign_dt_device was provided
> >> - invert return code check for iommu_do_domctl in
> >> XEN_DOMCTL_assign_device domctl processing to make cleaner code
> >> - change -ENOTSUPP error code to -ENXIO in sci_do_domctl
> >> - handle -ENXIO return comde of iommu_do_domctl
> >> - leave !dt_device_is_protected check in iommu_do_dt_domctl to make
> >> code work the same way it's done in "handle_device" call while
> >> creating hwdom(dom0) and "handle_passthrough_prop" call for dom0less
> >> creation
> >> - drop return check from sci_assign_dt_device call as not needed
> >> - do not return EINVAL when addign_dt_device is not set. That is
> >> because this callback is optional and not implemented in single-agent driver
> >> - move memcpy_toio/fromio to the generic place
> >> - fix device-tree example format in booting.txt, added ";" after "}".
> >> - update define in scmi-proto.h
> >> - update define in scmi-shmem.h file
> >> - scmi_assign_device - do not ignore -EOPNOTSUPP return
> >> code of the do_smc_xfer
> >> - remove overwriting agent_channel->agent_id after
> >> SCMI_BASE_DISCOVER_AGENT call
> >> - add multi-agent files to the MAINTAINERS
> >> - add SCMI multi-agent description to the SUPPORT.md
> >> - handle ARM_SMCCC_INVALID_PARAMETER return code and return -EINVAL
> >> for smc call
> >> - updated collect_agents function. Set agent_id parameter as optional
> >> in scmi-secondary-agents device-tree property
> >> - introduce "#scmi-secondary-agents-cells" parameter to set if
> >> agent_id was provided
> >> - reanme xen,scmi-secondary-agents property to scmi-secondary-agents
> >> - move memcpu_toio/fromio for the generic place
> >> - update Xen to get management channel from /chosen/xen,config node
> >> - get hypervisor channnel from node instead of using hardcoded
> >> - update handling scmi and shmem nodes for the domain
> >> - Set multi-agent driver to support only Arm64
> >> - rework multi-agent driver to leave Host Device-tree unmodified
> >>
> >> Changes in v4:
> >> - fix SPDX-License
> >> - rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
> >> - move XEN_DOMCTL_assign_device code in separate patch
> >> - Add documentation for SCI SCMI drivers
> >> - xl.cfg doc
> >> - fix comments from Stefano Stabellini
> >> - fix toolstack code as sugested by Anthony PERARD
> >>    - use MATCH_OPTION()
> >>    - move arm_sci struct and cfg params in "arch_arm"
> >> - add SCMI passthrough for dom0less case
> >> - toolstack comments from Anthony PERARD
> >> - added dom0less support
> >> - added doc for "xen,scmi-secondary-agents"
> >>
> >> Grygorii Strashko (5):
> >>    xen/arm: scmi-smc: update to be used under sci subsystem
> >>    xen/arm: scmi-smc: passthrough SCMI SMC to domain, single agent
> >>    docs: arm: add docs for SCMI over SMC calls forwarding driver
> >>    xen/domctl: extend XEN_DOMCTL_assign_device to handle not only iommu
> >>    docs: arm: add SCI SCMI SMC multi-agent driver docs
> >>
> >> Oleksii Moisieiev (5):
> >>    xen/arm: add generic SCI subsystem
> >>    drivers: iommu: change error code when iommu is disabled
> >>    xen: arm: smccc: add INVALID_PARAMETER error code
> >>    lib/arm: Add I/O memory copy helpers
> >>    xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
> >>
> >>   MAINTAINERS                                   |  10 +
> >>   SUPPORT.md                                    |  11 +
> >>   .../arm/firmware/arm-scmi.rst                 | 516 +++++++++++
> >>   docs/hypervisor-guide/arm/index.rst           |   9 +
> >>   docs/hypervisor-guide/index.rst               |   1 +
> >>   docs/man/xl.cfg.5.pod.in                      |  47 +
> >>   docs/misc/arm/device-tree/booting.txt         | 103 +++
> >>   docs/misc/xen-command-line.pandoc             |  18 +
> >>   tools/include/libxl.h                         |   5 +
> >>   tools/libs/light/libxl_arm.c                  |  18 +
> >>   tools/libs/light/libxl_types.idl              |  12 +
> >>   tools/xl/xl_parse.c                           |  48 ++
> >>   xen/arch/arm/device.c                         |   5 +
> >>   xen/arch/arm/dom0less-build.c                 |  51 ++
> >>   xen/arch/arm/domain.c                         |  12 +-
> >>   xen/arch/arm/domain_build.c                   |  11 +-
> >>   xen/arch/arm/firmware/Kconfig                 |  37 +-
> >>   xen/arch/arm/firmware/Makefile                |   2 +
> >>   xen/arch/arm/firmware/sci.c                   | 189 +++++
> >>   xen/arch/arm/firmware/scmi-proto.h            | 164 ++++
> >>   xen/arch/arm/firmware/scmi-shmem.c            | 112 +++
> >>   xen/arch/arm/firmware/scmi-shmem.h            |  45 +
> >>   xen/arch/arm/firmware/scmi-smc-multiagent.c   | 803 ++++++++++++++++++
> >>   xen/arch/arm/firmware/scmi-smc.c              | 191 ++++-
> >>   xen/arch/arm/include/asm/domain.h             |   5 +
> >>   xen/arch/arm/include/asm/firmware/sci.h       | 214 +++++
> >>   xen/arch/arm/include/asm/firmware/scmi-smc.h  |  41 -
> >>   xen/arch/arm/include/asm/smccc.h              |   1 +
> >>   xen/arch/arm/vsmc.c                           |   4 +-
> >>   xen/common/device-tree/dom0less-build.c       |   4 +
> >>   xen/common/domctl.c                           |  19 +
> >>   xen/drivers/passthrough/device_tree.c         |   6 +
> >>   xen/drivers/passthrough/iommu.c               |   2 +-
> >>   xen/include/asm-generic/device.h              |   1 +
> >>   xen/include/asm-generic/dom0less-build.h      |   9 +
> >>   xen/include/public/arch-arm.h                 |   8 +
> >>   xen/include/xen/lib/arm/io.h                  |  15 +
> >>   xen/lib/Makefile                              |   1 +
> >>   xen/lib/arm/Makefile                          |   1 +
> >>   xen/lib/arm/io.c                              |  80 ++
> >>   40 files changed, 2744 insertions(+), 87 deletions(-)
> >>   create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
> >>   create mode 100644 docs/hypervisor-guide/arm/index.rst
> >>   create mode 100644 xen/arch/arm/firmware/sci.c
> >>   create mode 100644 xen/arch/arm/firmware/scmi-proto.h
> >>   create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
> >>   create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
> >>   create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c
> >>   create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
> >>   delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
> >>   create mode 100644 xen/include/xen/lib/arm/io.h
> >>   create mode 100644 xen/lib/arm/Makefile
> >>   create mode 100644 xen/lib/arm/io.c
> >>
> >> --
> >> 2.34.1
> >>
> 

