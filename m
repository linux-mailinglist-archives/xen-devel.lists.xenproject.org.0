Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DFFAFBD5F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 23:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035789.1408152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtHa-0005Hq-R1; Mon, 07 Jul 2025 21:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035789.1408152; Mon, 07 Jul 2025 21:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtHa-0005GP-OH; Mon, 07 Jul 2025 21:21:50 +0000
Received: by outflank-mailman (input) for mailman id 1035789;
 Mon, 07 Jul 2025 21:21:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uYtHZ-0005GI-W8
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 21:21:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61238831-5b78-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 23:21:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CB1965C5D4D;
 Mon,  7 Jul 2025 21:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F94C4CEE3;
 Mon,  7 Jul 2025 21:21:41 +0000 (UTC)
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
X-Inumbo-ID: 61238831-5b78-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751923302;
	bh=bUoJK4NPWFszw8+dQoPzIZOEeVBRBq930g3zScfBlR4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BACUlxK18IBuQuesqdvInuXIsh/0XASmrR+RhbNeDQa8DnC7HMQo8kwsMkMRwPX1n
	 onfRxqftEwmJWQADUru4SNJ1cmtAKNeO/6AVMV6B0zeVNLdumrQj/LUVYGWBst2+l6
	 BjtXmXubeiWiGWf9rsosx9ndSTlWV27vLAxcyur+NSn0tRS8Y5Cf4FuuTaETEkvdf2
	 UY3WcvDc6KGT6ZM5b9RevApzuTXGSIce/vs8j3MJHFROXmX2S2MKLpFAISnhtdBj9K
	 /9agqQlH2Y7GE9bsUFZPEXlK6gWOFYf3+iWiqX9vy2XwhUqj1dWbcyMNjU4llmz7vR
	 HRF1cbMrW5lAg==
Date: Mon, 7 Jul 2025 14:21:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 2/5] iommu: address violation of MISRA C Rule 5.5
In-Reply-To: <12566d37-cd33-4350-bdb5-aa1359c1b176@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507071416480.605088@ubuntu-linux-20-04-desktop>
References: <cover.1751659393.git.dmytro_prokopchuk1@epam.com> <29ba418db4a7a193fe07fa9927b4ab75e0355fcb.1751659393.git.dmytro_prokopchuk1@epam.com> <12566d37-cd33-4350-bdb5-aa1359c1b176@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Jul 2025, Jan Beulich wrote:
> On 04.07.2025 22:39, Dmytro Prokopchuk1 wrote:
> > Address a violation of MISRA C:2012 Rule 5.5:
> > "Identifiers shall be distinct from macro names".
> > 
> > Reports for service MC3A2.R5.5:
> > xen/include/xen/iommu.h: non-compliant struct 'page_list_head'
> > xen/include/xen/mm.h: non-compliant macro 'page_list_head'
> 
> What is this about? There's no code change that I could see which would
> alter the situation here.
> 
> > xen/drivers/passthrough/iommu.c: non-compliant macro 'iommu_quarantine'
> > xen/include/xen/iommu.h: non-compliant variable 'iommu_quarantine'
> > 
> > These external variables ('iommu_pt_cleanup_lock'
> > and 'iommu_pt_cleanup_list') are no longer used
> > in the codebase. Removing them eliminates dead
> > code and ensures compliance with coding standards.
> > Fixes: b5622eb627 (iommu: remove unused iommu_ops method and tasklet, 2020-09-22)
> 
> That's a different Misra rule, so may better be put in a separate patch?
> Otherwise please at least mention the rule number as well.
> 
> > The variable 'iommu_quarantine' makes sence to use
> > only if 'CONFIG_HAS_PCI=y', so place it inside '#ifdef'.
> 
> Hmm, yes - not nice, but what do you do. I question "makes sense" though:
> Quarantining is possible also without PCI, aiui. Just we don't that right
> now.

Hi Jan,

As far as I can tell the change to #ifdef iommu_quarantine is necessary
to resolve a R5.5 violation here:

#ifdef CONFIG_HAS_PCI
uint8_t __read_mostly iommu_quarantine =
# if defined(CONFIG_IOMMU_QUARANTINE_NONE)
    IOMMU_quarantine_none;
# elif defined(CONFIG_IOMMU_QUARANTINE_BASIC)
    IOMMU_quarantine_basic;
# elif defined(CONFIG_IOMMU_QUARANTINE_SCRATCH_PAGE)
    IOMMU_quarantine_scratch_page;
# endif
#else
# define iommu_quarantine IOMMU_quarantine_none       <<< violation
#endif /* CONFIG_HAS_PCI */

As you can see from the patch series, often it is not nice to find a
resoltution for these R5.5 violations. This is the reason why I
originally suggested to deviate R5.5 entirely.

https://lore.kernel.org/xen-devel/139aa595-8b41-44e7-b205-415443c8c357@suse.com/](https://lore.kernel.org/xen-devel/139aa595-8b41-44e7-b205-415443c8c357@suse.com/

That said, this patch is one of the nicer changes in this series, I
think it is OK.

