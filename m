Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA79B84C18F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 01:53:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677205.1053662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXWBR-0001g9-SD; Wed, 07 Feb 2024 00:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677205.1053662; Wed, 07 Feb 2024 00:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXWBR-0001cq-Og; Wed, 07 Feb 2024 00:53:01 +0000
Received: by outflank-mailman (input) for mailman id 677205;
 Wed, 07 Feb 2024 00:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aVye=JQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rXWBQ-0001cg-LC
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 00:53:00 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ba4dcba-c553-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 01:52:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 46360CE17A3;
 Wed,  7 Feb 2024 00:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9964C433F1;
 Wed,  7 Feb 2024 00:52:49 +0000 (UTC)
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
X-Inumbo-ID: 3ba4dcba-c553-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707267171;
	bh=xAfUPySfxt0Pz2hB+12JwdNp3voxUh0xmb4J46MURxw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OeilyJfle8VsXGQwFkgi5vpEhENounSHbJ2XNqZqQuwhP+Pz76MTkT885zL4je7iG
	 w8/AmpbvWrOkJ2ZQVZ2gxwHo6nIuMuTTlnS5wvA4GgChA+6mR9S4CoJWyENWxtMFBQ
	 0FleC91qGsEilcU6FzscPyNKPVMopkLQKVZLZioyJC5UpYsSzfN61Aj5YJ73DrHJDo
	 OfBak4vrPUkAzDd7hl+ADClN/89IQTVfN38LwazWWnWCaYJBZOQh9Iv+SQPjs2C4bx
	 K26rInZHZb7Ak6hYFmNNt7oqiyqynrjtYqIa6px78Yz93twnk4bxEZvFBiOCniK0tZ
	 p7VA6UoNRG1Gw==
Date: Tue, 6 Feb 2024 16:52:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/2] x86/IOMMU: address violations of MISRA C:2012
 Rule 14.4
In-Reply-To: <2a21b871-8762-43ee-b9f3-bf34869d008f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402061652170.1925432@ubuntu-linux-20-04-desktop>
References: <cover.1702310368.git.maria.celeste.cesario@bugseng.com> <746a33fff1386b2e76657b5f7cfb31f3b117a1fe.1702310368.git.maria.celeste.cesario@bugseng.com> <891a1ab0b772910999f49878ae679634@bugseng.com> <2a21b871-8762-43ee-b9f3-bf34869d008f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Feb 2024, Jan Beulich wrote:
> On 05.02.2024 16:36, Nicola Vetrini wrote:
> > On 2023-12-13 17:10, Simone Ballarin wrote:
> >> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> >>
> >> The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
> >> headline states:
> >> "The controlling expression of an if statement and the controlling
> >> expression of an iteration-statement shall have essentially Boolean 
> >> type".
> >>
> >> Add comparisons to avoid using enum constants as controlling 
> >> expressions
> >> to comply with Rule 14.4.
> >> No functional change.
> >>
> >> Signed-off-by: Maria Celeste Cesario  
> >> <maria.celeste.cesario@bugseng.com>
> >> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> >> ---
> >> Changes in v2
> >> - rename prefix from AMD/IOMMU to x86/IOMMU
> >> - move changes on msi.c and hpet.c in this patch.
> >> ---
> >>  xen/arch/x86/hpet.c                      | 6 +++---
> >>  xen/arch/x86/msi.c                       | 4 ++--
> >>  xen/drivers/passthrough/amd/iommu_init.c | 4 ++--
> >>  xen/drivers/passthrough/vtd/iommu.c      | 4 ++--
> >>  xen/drivers/passthrough/vtd/quirks.c     | 2 +-
> >>  5 files changed, 10 insertions(+), 10 deletions(-)
> >>
> > 
> > +Stefano
> > 
> > Hi all,
> > 
> > this patch seems not to have been committed into staging, unlike the 
> > other patch from this series. Since these are the only remaining 
> > violations for Rule 14.4, then I think these changes could be reviewed.
> 
> It's no surprise the change isn't committed yet, when it hasn't had any
> of the necessary tags. As far as I'm concerned, I seem to recall
> indicating clearly that I'm not happy with this change, and hence acks
> would need to come from elsewhere.

Thanks Jan for not blocking it. I gave my reviewed-by, let's see if one
of the other x86 maintainers is OK to ack it.

