Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0104BB46777
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 02:18:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112877.1461026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uugd5-0004I3-II; Sat, 06 Sep 2025 00:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112877.1461026; Sat, 06 Sep 2025 00:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uugd5-0004FY-FR; Sat, 06 Sep 2025 00:18:07 +0000
Received: by outflank-mailman (input) for mailman id 1112877;
 Sat, 06 Sep 2025 00:18:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uugd4-0004F5-49
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 00:18:06 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f321782c-8ab6-11f0-9809-7dc792cee155;
 Sat, 06 Sep 2025 02:18:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CAEFC4484B;
 Sat,  6 Sep 2025 00:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 451EDC4CEF5;
 Sat,  6 Sep 2025 00:17:59 +0000 (UTC)
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
X-Inumbo-ID: f321782c-8ab6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757117880;
	bh=wbwKxHFqpiEhDUFV1KXEKYeNC+13Ffjf3eWfwXwwTCA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FCDNdgHfjsYckpWvXJz2BGhihyiQEV4mleja+OQMsNNNL05h4/MF5RSI6BhnHVLJG
	 b5jGXJsJToGMWlbrWRKMhfSMR6VI8cTmV7g2U9KrF/ACBgOdfnNiQ2rUnrLak8d+po
	 BpTuFlFUovmujnx1BR0XwBWMBd20TzpQeN6UuH3RlKodzUOuwDC3PXHzAMq6IKTg4Q
	 j1LYDQOpX9UUqZhkqz3PmuturXmynIRXW4L7rOS9doN5XCfTcAXwMFeJ6WpbLO108u
	 0FLJ+El93VAvYEycp8MkSO3RrkE4Lus/B1ZoRB6jRNuW40ryC4vLHypZDlhbYA0HGA
	 YzjY3UyYZNw3w==
Date: Fri, 5 Sep 2025 17:17:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "olekstysh@gmail.com" <olekstysh@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v7 00/12] Introduce eSPI support
In-Reply-To: <cover.1757015865.git.leonid_komarianskyi@epam.com>
Message-ID: <alpine.DEB.2.22.394.2509051717530.1405870@ubuntu-linux-20-04-desktop>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Leonid,

I was about to commit this but unfortunately it is introducing MISRA
regressions. See:
https://gitlab.com/xen-project/people/sstabellini/xen/-/tree/ppp6?ref_type=heads

https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/11265005118

Compared this result:
https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp6/ARM64/11265005118/PROJECT.ecd;/by_service.html#service&kind

Against upstream staging:
https://eclair-analysis-logs.xenproject.org/fs/space/XEN.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/ARM64/11264772605/PROJECT.ecd;/by_service.html#service&kind

It is introducing a couple of easy-to-fix 16.3 issues and also a couple
of new 16.4 issues. They should be all easy to fix. It is also
introducing three new 13.2 issues and one 18.1 but I haven't looked
closely into those. Please address them.


Oleksii,

Technically, the series is fully acked and ready to be committed. From a
risk perspective, I would be comfortable committing it now with the
outstanding MISRA regressions, leaving Leonid to fix them over the next
few days. However, I have not done so because it would make it harder to
spot the MISRA regressions due to the way the scanner works (it
compares against the previous version).

I suggest we allow this series to be committed in the next couple of
days, once Leonid addresses the regressions, even though it would
technically be past the feature freeze.

Cheers,

Stefano

P.S.

Leonid, you might want to check my commits because I fixed a couple of
things on commit, in addition to adding the various acked-by tags.


On Thu, 4 Sep 2025, Leonid Komarianskyi wrote:
> Hello everyone!
> 
> V6 contains an issue for debug builds with CONFIG_GICV3_ESPI=n due to a
> mistake in the ASSERT() condition in the is_espi() function. This patch
> series fixes the issue and also includes minor fixes according to the
> review of V6.
> 
> Summarized description:
> This patch series adds support for the extended shared peripheral
> interrupt (eSPI) range (INTIDs 4096-5119 [2](ranges of INTIDs)) for Xen
> and guest domains. The implementation uses a generic approach to handle
> eSPIs, similar to regular SPIs, while maintaining compatibility with the
> existing SPI range. Functionality remains unchanged for setups that do
> not require eSPIs.
> 
> The series includes:
> 1) General refactoring of common IRQ operations with GIC registers to
> improve code readability, simplify further maintenance and prepare the
> key functions for eSPI implementation.
> 2) Introducing a new Kconfig option (default n) to enable or disable
> eSPI support. Disabling this option prevents unnecessary resource
> allocation for setups that do not require eSPIs.
> 3) Adding additional resources to store required information and operate
> with up to 1024 interrupts from eSPI range.
> 4) Adjusting assertions and checks to pass verification for INTIDs in
> the eSPI range.
> 5) Configuration of eSPI-specific registers during GIC initialization
> for systems with GICv3.1+ hardware.
> 6) Enables eSPI MMIO emulation for vGIC, allowing guest domains to
> access and operate within the eSPI's INTIDs.
> 7) Updating documentation and CHANGELOG to reflect the changes made for eSPI
> support.
> 
> Also, to simplify reviewing, please find below link to unsquashed patches, that
> are on top of every patch, that is changed in the series, compared to V6:
> https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v7-unsquashed/
> 
> Github branch with patch series:
> https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v7/
> 
> Changes in V7:
> - individual changes in patches
> 
> Link on V6:
> - https://lists.xenproject.org/archives/html/xen-devel/2025-09/msg00296.html
> 
> Changes in V6:
> - individual changes in patches
> 
> Link on V5:
> - https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg02086.html
> 
> Changes in V5:
> - individual changes in patches
> 
> Link on V4:
> - https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01767.html
> 
> Changes in V4:
> - added a patch for documentation
> - individual changes in patches
> 
> Link on V3:
> - https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01628.html
> 
> Changes in V3:
> - added a patch to update CHANGELOG.md
> - individual changes in patches
> 
> Link on V2:
> - https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg00372.html
> 
> Changes in V2:
> - added 2 more patches to implement helper
>   functions for gic/vgic:
>   xen/arm: gic: implement helper functions for INTID checks
>   xen/arm: vgic: implement helper functions for virq checks
> - removed 2 patches:
>   xen/arm/irq: allow assignment/releasing of eSPI interrupts
>   xen/arm: gic/irq: permit routing of eSPI interrupts to Xen and domains
>   since their functionality can be moved to appropriate patches after
>   introducing patches with helper functions
> - individual changes in patches
> 
> Link on V1:
> - https://lists.xenproject.org/archives/html/xen-devel/2025-07/msg01809.html
> 
> Leonid Komarianskyi (12):
>   xen/arm: gicv3: refactor obtaining GIC addresses for common operations
>   xen/arm: gic: implement helper functions for INTID checks
>   xen/arm: vgic: implement helper functions for virq checks
>   xen/arm/irq: add handling for IRQs in the eSPI range
>   xen/arm: gicv3: implement handling of GICv3.1 eSPI
>   xen/arm/irq: allow eSPI processing in the gic_interrupt function
>   xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow eSPI processing
>   xen/arm: vgic: add resource management for extended SPIs
>   xen/arm: domain_build/dom0less-build: adjust domains config to support
>     eSPIs
>   xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers
>   doc/man: update description for nr_spis with eSPI
>   CHANGELOG.md: add mention of GICv3.1 eSPI support
> 
>  CHANGELOG.md                           |   2 +
>  docs/man/xl.cfg.5.pod.in               |  13 +-
>  xen/arch/arm/Kconfig                   |   8 +
>  xen/arch/arm/dom0less-build.c          |   2 +-
>  xen/arch/arm/domain_build.c            |   2 +-
>  xen/arch/arm/gic-v3.c                  | 195 +++++++++++++++++++----
>  xen/arch/arm/gic.c                     |   8 +-
>  xen/arch/arm/include/asm/gic.h         |  28 ++++
>  xen/arch/arm/include/asm/gic_v3_defs.h |  40 ++++-
>  xen/arch/arm/include/asm/irq.h         |  38 +++++
>  xen/arch/arm/include/asm/vgic.h        |  56 ++++++-
>  xen/arch/arm/irq.c                     |  62 +++++++-
>  xen/arch/arm/vgic-v3.c                 | 203 ++++++++++++++++++-----
>  xen/arch/arm/vgic.c                    | 212 +++++++++++++++++++++++--
>  xen/arch/arm/vgic/vgic.c               |   5 +
>  15 files changed, 762 insertions(+), 112 deletions(-)
> 
> -- 
> 2.34.1
> 

