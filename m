Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E837B42BD4
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 23:24:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109044.1458914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utuxm-0000YC-Fk; Wed, 03 Sep 2025 21:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109044.1458914; Wed, 03 Sep 2025 21:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utuxm-0000WL-Cc; Wed, 03 Sep 2025 21:24:18 +0000
Received: by outflank-mailman (input) for mailman id 1109044;
 Wed, 03 Sep 2025 21:24:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h/6B=3O=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1utuxk-0000WA-OQ
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 21:24:16 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56f19c80-890c-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 23:24:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2432443BB0;
 Wed,  3 Sep 2025 21:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5A8C4CEE7;
 Wed,  3 Sep 2025 21:24:11 +0000 (UTC)
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
X-Inumbo-ID: 56f19c80-890c-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756934653;
	bh=4ydoQzsD8lA4FQhV7XYcqKPlZVew2J4b25z3LTMEbVk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JqgT8NPjd5nhFDt+Cja8QI4wpCVoE111028UHw6U+rKX+lh+4MRak38x1nl/0Tj3N
	 mN8YnBQWA+VjEFa078CO3AiiYO/1RQNcyXoU6bWDM3/2gyc0SkyBp4cFmNWmM6Qxl7
	 n3yoMzd0pG5kSYLJb98JDJjl9rAHBs4uNtFhOvolKJO/vadFkyxwtyQzMHvr5oPuiZ
	 xYzZipop0ph1uWSetrAUzNGi4RYW8yJsnfKtdSFS64DzKMNXQAH1pf430ljFCADWqS
	 OJANKrJLzNEvYDrzjSZ2aKu1ZQTfu78Jn91R1qGbheqN1Yjx1omHezvVthxdTFfqPX
	 BoJwDWe7Y/1nw==
Date: Wed, 3 Sep 2025 14:24:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v8 0/4] xen/arm: scmi: introduce SCI SCMI SMC single-agent
 support
In-Reply-To: <cover.1756905487.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2509031421210.1405870@ubuntu-linux-20-04-desktop>
References: <cover.1756905487.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Oleksii,

It is still not passing the ci-loop, this time due to MISRA. See the two
new 8.3 and 8.4 violations (previously zero) and also new additional
12.2, 13.1 violations:

https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2020545544

https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp2/ARM64/11238076156/PROJECT.ecd;/by_service.html#service&kind

per comparison, this is the baseline:
https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/ARM64/11232061644/PROJECT.ecd;/by_service.html#service&kind

These are the new 8.3 and 8.4 violations:

https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp2/ARM64/11238076156/PROJECT.ecd;/by_service/MC3A2.R8.3.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}

https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp2/ARM64/11238076156/PROJECT.ecd;/by_service/MC3A2.R8.4.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}

Cheers,

Stefano

On Wed, 3 Sep 2025, Oleksii Moisieiev wrote:
> 
> Inroducing V8 patch series  on top of the Xen version 4.20-rc2
> which includes implementation of the SCI SCMI SMC single-agent support.
> 
> This patch series is the first chunk of the
> "xen/arm: scmi: introduce SCI SCMI SMC multi-agent support" which can
> be found at [0]
> 
> SCMI-multiagent support will be provided as the followup patch series.
> 
> [0] https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/
> 
> Patch 1 "xen/arm: add generic SCI subsystem"
> - rebased and refactored
> - introduced DEVICE_ARM_SCI DT device class and used for SCI drivers probing
> instead of custom,
>   linker sections based implementation.
> - added SCI API for Dom0 DT handling, instead of manipulating with ARM arch
> dom0 code directly.
> - RFC changes in XEN_DOMCTL_assign_device OP processing
> - Introduce arch_handle_passthrough_prop call to handle arm specific
> nodes
> 
> Patch 2 "xen/arm: scmi-smc: update to be used under sci subsystem"
> - update driver introduced by commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI
> over SMC calls
> handling layer") be used under sci subsystem.
> - no functional changes in general
> 
> Patch 3 "xen/arm: scmi-smc: passthrough SCMI SMC to guest domain
> This is new change which allows passthrough SCMI SMC, single agent interface to
> guest domain
> cover use case "thin Dom0 with guest domain, which serves as Driver domain".
> See patch commit message for full description.
> 
> Patch 4 - docs: arm: add docs for SCMI over SMC calls forwarding
> driver
> - add documentation section for Simple Arm SCMI over SMC calls
> forwarding driver.
> 
> Code can be found at:
> https://github.com/oleksiimoisieiev/xen/tree/scmi_upstrv5
> 
> [1] RFC v2:
> http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.oleksii_moisieiev@epam.com/
> [2] RFC v3:
> https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927-1-grygorii_strashko@epam.com
> SCMI spec:
> https://developer.arm.com/documentation/den0056/e/?lang=en
> 
> SCMI bindings:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/access-controllers/access-controllers.yaml
> 
> Reference EL3 FW:
> RPI5: https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
> Renesas v4h:
> https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4x-scmi_upd/
> 
> base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)
> 
> Changes in v8:
> - reneregated {helpers/types}.gen.go, dropped unneeded parameters
> 
> Changes in v7:
> - fix sci_handl_call to make changes more readable
> - fix build error when DOM0LESS_BUILD is disabled (removed
>  arch_handle_passthrough_prop from the header)
> - sort headers in alphabetical order in sci.h
> - sort headers in scmi-smc.c file
> - Fix commit description.
> - Move scmi-smc-passthrough definition to match alphaberical order
> - remove unneeded initialization with NULL
> - changed u64 to uint64_t
> - Send warning if iomem permit access was failed
> - fixed typos
> 
> Changes in v6:
> - rebase on top of the latest master
> - fix return value of sci_dt_finalize() call
> - add R-b tag
> - added generated helpers and types go files
> - rename cmdline parameter to scmi-smc-passthrough
> - fix goto tag in parse_arm_sci_config
> - add link to the scmi bindings used in the doc
> - remove mentions about HVC calls from doc
> - rename cmdline parameter to scmi-smc-passthrough
> 
> Changes in v5:
> - update Maintainers file. Set role as a Reviewer
> - rebased on the latest master branch
> - Introduce arch_handle_passthrough_prop call to handle arm specific nodes
> - rename dom0_scmi_smc_passthrough to scmi_smc_passthrough
> - rename dom0_scmi_smc_passthrough in documentation
> 
> Changes in v4:
> - fix SPDX-License
> - rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
> - move XEN_DOMCTL_assign_device code in separate patch
> - Add documentation for SCI SCMI drivers
> - xl.cfg doc
> - fix comments from Stefano Stabellini
> - fix toolstack code as sugested by Anthony PERARD
>   - use MATCH_OPTION()
>   - move arm_sci struct and cfg params in "arch_arm"
> - add SCMI passthrough for dom0less case
> 
> Grygorii Strashko (3):
>   xen/arm: scmi-smc: update to be used under sci subsystem
>   xen/arm: scmi-smc: passthrough SCMI SMC to domain, single agent
>   docs: arm: add docs for SCMI over SMC calls forwarding driver
> 
> Oleksii Moisieiev (1):
>   xen/arm: add generic SCI subsystem
> 
>  MAINTAINERS                                   |   6 +
>  .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++
>  docs/hypervisor-guide/arm/index.rst           |   9 +
>  docs/hypervisor-guide/index.rst               |   1 +
>  docs/man/xl.cfg.5.pod.in                      |  34 +++
>  docs/misc/arm/device-tree/booting.txt         |  15 ++
>  docs/misc/xen-command-line.pandoc             |   9 +
>  tools/golang/xenlight/helpers.gen.go          |  35 +++
>  tools/golang/xenlight/types.gen.go            |  11 +
>  tools/include/libxl.h                         |   5 +
>  tools/libs/light/libxl_arm.c                  |  14 ++
>  tools/libs/light/libxl_types.idl              |  10 +
>  tools/xl/xl_parse.c                           |  36 ++++
>  xen/arch/arm/device.c                         |   5 +
>  xen/arch/arm/dom0less-build.c                 |  40 ++++
>  xen/arch/arm/domain.c                         |  12 +-
>  xen/arch/arm/domain_build.c                   |   8 +
>  xen/arch/arm/firmware/Kconfig                 |  25 ++-
>  xen/arch/arm/firmware/Makefile                |   1 +
>  xen/arch/arm/firmware/sci.c                   | 154 ++++++++++++++
>  xen/arch/arm/firmware/scmi-smc.c              | 194 +++++++++++++----
>  xen/arch/arm/include/asm/domain.h             |   5 +
>  xen/arch/arm/include/asm/firmware/sci.h       | 200 ++++++++++++++++++
>  xen/arch/arm/include/asm/firmware/scmi-smc.h  |  41 ----
>  xen/arch/arm/vsmc.c                           |   4 +-
>  xen/common/device-tree/dom0less-build.c       |   4 +
>  xen/include/asm-generic/device.h              |   1 +
>  xen/include/public/arch-arm.h                 |   5 +
>  xen/include/xen/dom0less-build.h              |   3 +
>  29 files changed, 982 insertions(+), 85 deletions(-)
>  create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
>  create mode 100644 docs/hypervisor-guide/arm/index.rst
>  create mode 100644 xen/arch/arm/firmware/sci.c
>  create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
>  delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
> 
> -- 
> 2.34.1
> 

