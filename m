Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20F6B49DE0
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 02:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115784.1462271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvlwV-0001hP-Cd; Tue, 09 Sep 2025 00:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115784.1462271; Tue, 09 Sep 2025 00:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvlwV-0001eS-9L; Tue, 09 Sep 2025 00:10:39 +0000
Received: by outflank-mailman (input) for mailman id 1115784;
 Tue, 09 Sep 2025 00:10:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aO0K=3U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uvlwT-0001eM-HR
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 00:10:37 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67dabca3-8d11-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 02:10:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AF06A40770;
 Tue,  9 Sep 2025 00:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24987C4CEF1;
 Tue,  9 Sep 2025 00:10:32 +0000 (UTC)
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
X-Inumbo-ID: 67dabca3-8d11-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757376633;
	bh=YgoZWQQJmWUo7bCUBFqAZOOGn9GzTDDXpPCzKCZ+oio=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=teL9MhdykjWH9HhMeI/9Hc3mQINBrskNXRU+9iHOthI9AYm73iNyuGJYCVuDzME9l
	 +YBtCEwb86+T3EKLu6SUKQFxBASCgTFdAUEqcogJUmskjIU0YLDLrXUPFQib6WDByr
	 psncamMOKM0gvhIccFCLG+07fTfex6S/Br0eCgHwP1xIQCatffb1gai01XjJO2YMAv
	 nlF7xEhr6s8iIpOBTPtpCR23LIp2awCipqhlbYd60FFgz5aBhXXN0N9nbQ1kVW7snv
	 mxCFfECT/IOWB6gX/gpg2jxmkL/vqVWnXRaUGE48SHN+f5a9oQ8q/6awSmS77K0ROa
	 p2BSt7WhupkxA==
Date: Mon, 8 Sep 2025 17:10:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "olekstysh@gmail.com" <olekstysh@gmail.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v7 00/12] Introduce eSPI support
In-Reply-To: <374b7296-bfc0-4a4d-8f2c-b148c29c0517@epam.com>
Message-ID: <alpine.DEB.2.22.394.2509081706580.1405870@ubuntu-linux-20-04-desktop>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com> <alpine.DEB.2.22.394.2509051717530.1405870@ubuntu-linux-20-04-desktop> <374b7296-bfc0-4a4d-8f2c-b148c29c0517@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 7 Sep 2025, Leonid Komarianskyi wrote:
> Hello Stefano,
> 
> Thank you for your comments and for providing the Eclair reports.
> 
> On 06.09.25 03:17, Stefano Stabellini wrote:
> > Hi Leonid,
> >
> > I was about to commit this but unfortunately it is introducing MISRA
> > regressions. See:
> > https://gitlab.com/xen-project/people/sstabellini/xen/-/tree/ppp6?ref_type=heads
> >
> > https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/11265005118
> >
> > Compared this result:
> > https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp6/ARM64/11265005118/PROJECT.ecd;/by_service.html#service&kind
> >
> > Against upstream staging:
> > https://eclair-analysis-logs.xenproject.org/fs/space/XEN.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/ARM64/11264772605/PROJECT.ecd;/by_service.html#service&kind
> >
> > It is introducing a couple of easy-to-fix 16.3 issues and also a couple
> > of new 16.4 issues. They should be all easy to fix. It is also
> > introducing three new 13.2 issues and one 18.1 but I haven't looked
> > closely into those. Please address them.
> >
> 
> Regarding the MISRA 16.3/16.4 violations and 13.2 cautions - there are
> no questions from my side. I have fixed them and will send the updated
> V8 (with typo fixes, added acked/reviewed-by tags, etc.).

Thanks!


> However, I
> would like to clarify regarding the MISRA 18.1 caution regression and
> review process rules:
> 
> MISRA 18.1 caution:
> 
> xen/arch/arm/irq.c:105.13-105.39: [8] access of 'irq_desc' at an
> overflowing index, while it holds only 992 'struct irq_desc' elements
> 
> Actually, there is no new real issue here, because the mainline
> irq_desc() currently does not have upper limit checks for IRQs:
> 
> struct irq_desc *__irq_to_desc(unsigned int irq)
> {
>      if ( irq < NR_LOCAL_IRQS )
>          return &this_cpu(local_irq_desc)[irq];
> 
>      return &irq_desc[irq-NR_LOCAL_IRQS];
> }
> 
> ... as a result Eclair does not spot any issues in this code according
> to the staging report. As I understand, it triggers on patches with eSPI
> because I introduced new checks for the eSPI INTID range, which should
> not be used without CONFIG_GICV3_ESPI=y.
> 
> Also, a similar issue with invalid INTIDs was discussed in the thread:
> 
> https://lists.xenproject.org/archives/html/xen-devel/2025-09/msg00401.html
> 
> Long story short: the mainline Xen currently allows defining invalid
> INTIDs in the Xen DTS and crashes in __irq_to_desc() when attempting to
> operate on an invalid interrupt number.
> 
> I have prepared a fix for the 18.1 caution, but I am not sure whether it
> is worth applying just to address the Eclair report (if it is not critical):
> https://github.com/LKomaryanskiy/xen/commit/af5d9a483302f7bcfaadbefb85f5e4ee35f6cb3b
> 
> So, could you please clarify which option would be better:
> 1) Leave the code as it is for now, accepting the MISRA caution from
> Eclair and fix the issue later in the context of addressing Xen crashing
> with invalid INTIDs and implementing dynamic allocation of irq_desc_t array;
> 2) Apply the fix now (while also planning to address the invalid INTID
> issue in the future)

I am happy to apply the fix now as part of the series


> Regarding the review process:
> Should I remove the 'reviewed-by' tags from the patches where I added
> missing breaks (with the corresponding code updates) or introduced
> variables to fix MISRA issues? I am asking because these are code
> changes, and I am not sure if I should leave the RB tags in this case.

Please keep them

> >
> > Oleksii,
> >
> > Technically, the series is fully acked and ready to be committed. From a
> > risk perspective, I would be comfortable committing it now with the
> > outstanding MISRA regressions, leaving Leonid to fix them over the next
> > few days. However, I have not done so because it would make it harder to
> > spot the MISRA regressions due to the way the scanner works (it
> > compares against the previous version).
> >
> > I suggest we allow this series to be committed in the next couple of
> > days, once Leonid addresses the regressions, even though it would
> > technically be past the feature freeze.
> >
> > Cheers,
> >
> > Stefano
> >
> > P.S.
> >
> > Leonid, you might want to check my commits because I fixed a couple of
> > things on commit, in addition to adding the various acked-by tags.
> >
> >
> > On Thu, 4 Sep 2025, Leonid Komarianskyi wrote:
> >> Hello everyone!
> >>
> >> V6 contains an issue for debug builds with CONFIG_GICV3_ESPI=n due to a
> >> mistake in the ASSERT() condition in the is_espi() function. This patch
> >> series fixes the issue and also includes minor fixes according to the
> >> review of V6.
> >>
> >> Summarized description:
> >> This patch series adds support for the extended shared peripheral
> >> interrupt (eSPI) range (INTIDs 4096-5119 [2](ranges of INTIDs)) for Xen
> >> and guest domains. The implementation uses a generic approach to handle
> >> eSPIs, similar to regular SPIs, while maintaining compatibility with the
> >> existing SPI range. Functionality remains unchanged for setups that do
> >> not require eSPIs.
> >>
> >> The series includes:
> >> 1) General refactoring of common IRQ operations with GIC registers to
> >> improve code readability, simplify further maintenance and prepare the
> >> key functions for eSPI implementation.
> >> 2) Introducing a new Kconfig option (default n) to enable or disable
> >> eSPI support. Disabling this option prevents unnecessary resource
> >> allocation for setups that do not require eSPIs.
> >> 3) Adding additional resources to store required information and operate
> >> with up to 1024 interrupts from eSPI range.
> >> 4) Adjusting assertions and checks to pass verification for INTIDs in
> >> the eSPI range.
> >> 5) Configuration of eSPI-specific registers during GIC initialization
> >> for systems with GICv3.1+ hardware.
> >> 6) Enables eSPI MMIO emulation for vGIC, allowing guest domains to
> >> access and operate within the eSPI's INTIDs.
> >> 7) Updating documentation and CHANGELOG to reflect the changes made for eSPI
> >> support.
> >>
> >> Also, to simplify reviewing, please find below link to unsquashed patches, that
> >> are on top of every patch, that is changed in the series, compared to V6:
> >> https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v7-unsquashed/
> >>
> >> Github branch with patch series:
> >> https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v7/
> >>
> >> Changes in V7:
> >> - individual changes in patches
> >>
> >> Link on V6:
> >> - https://lists.xenproject.org/archives/html/xen-devel/2025-09/msg00296.html
> >>
> >> Changes in V6:
> >> - individual changes in patches
> >>
> >> Link on V5:
> >> - https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg02086.html
> >>
> >> Changes in V5:
> >> - individual changes in patches
> >>
> >> Link on V4:
> >> - https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01767.html
> >>
> >> Changes in V4:
> >> - added a patch for documentation
> >> - individual changes in patches
> >>
> >> Link on V3:
> >> - https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01628.html
> >>
> >> Changes in V3:
> >> - added a patch to update CHANGELOG.md
> >> - individual changes in patches
> >>
> >> Link on V2:
> >> - https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg00372.html
> >>
> >> Changes in V2:
> >> - added 2 more patches to implement helper
> >>    functions for gic/vgic:
> >>    xen/arm: gic: implement helper functions for INTID checks
> >>    xen/arm: vgic: implement helper functions for virq checks
> >> - removed 2 patches:
> >>    xen/arm/irq: allow assignment/releasing of eSPI interrupts
> >>    xen/arm: gic/irq: permit routing of eSPI interrupts to Xen and domains
> >>    since their functionality can be moved to appropriate patches after
> >>    introducing patches with helper functions
> >> - individual changes in patches
> >>
> >> Link on V1:
> >> - https://lists.xenproject.org/archives/html/xen-devel/2025-07/msg01809.html
> >>
> >> Leonid Komarianskyi (12):
> >>    xen/arm: gicv3: refactor obtaining GIC addresses for common operations
> >>    xen/arm: gic: implement helper functions for INTID checks
> >>    xen/arm: vgic: implement helper functions for virq checks
> >>    xen/arm/irq: add handling for IRQs in the eSPI range
> >>    xen/arm: gicv3: implement handling of GICv3.1 eSPI
> >>    xen/arm/irq: allow eSPI processing in the gic_interrupt function
> >>    xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow eSPI processing
> >>    xen/arm: vgic: add resource management for extended SPIs
> >>    xen/arm: domain_build/dom0less-build: adjust domains config to support
> >>      eSPIs
> >>    xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers
> >>    doc/man: update description for nr_spis with eSPI
> >>    CHANGELOG.md: add mention of GICv3.1 eSPI support
> >>
> >>   CHANGELOG.md                           |   2 +
> >>   docs/man/xl.cfg.5.pod.in               |  13 +-
> >>   xen/arch/arm/Kconfig                   |   8 +
> >>   xen/arch/arm/dom0less-build.c          |   2 +-
> >>   xen/arch/arm/domain_build.c            |   2 +-
> >>   xen/arch/arm/gic-v3.c                  | 195 +++++++++++++++++++----
> >>   xen/arch/arm/gic.c                     |   8 +-
> >>   xen/arch/arm/include/asm/gic.h         |  28 ++++
> >>   xen/arch/arm/include/asm/gic_v3_defs.h |  40 ++++-
> >>   xen/arch/arm/include/asm/irq.h         |  38 +++++
> >>   xen/arch/arm/include/asm/vgic.h        |  56 ++++++-
> >>   xen/arch/arm/irq.c                     |  62 +++++++-
> >>   xen/arch/arm/vgic-v3.c                 | 203 ++++++++++++++++++-----
> >>   xen/arch/arm/vgic.c                    | 212 +++++++++++++++++++++++--
> >>   xen/arch/arm/vgic/vgic.c               |   5 +
> >>   15 files changed, 762 insertions(+), 112 deletions(-)
> >>
> >> --
> >> 2.34.1
> >>
> 
> Best regards,
> Leonid
> 

