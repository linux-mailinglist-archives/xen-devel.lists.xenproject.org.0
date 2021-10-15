Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2700D42F6EE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 17:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210823.367831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbP0D-0006ip-In; Fri, 15 Oct 2021 15:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210823.367831; Fri, 15 Oct 2021 15:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbP0D-0006gh-Fa; Fri, 15 Oct 2021 15:20:09 +0000
Received: by outflank-mailman (input) for mailman id 210823;
 Fri, 15 Oct 2021 15:20:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OB3O=PD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mbP0C-0006gC-4M
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 15:20:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc1c6b65-99b2-41fa-817f-d02f6a178f7f;
 Fri, 15 Oct 2021 15:20:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B475A60E0C;
 Fri, 15 Oct 2021 15:20:05 +0000 (UTC)
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
X-Inumbo-ID: bc1c6b65-99b2-41fa-817f-d02f6a178f7f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634311206;
	bh=x556hhFOILWFWTemgkti16JuunmtqWe1AxY0NQTosXk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MeSNyAMVDn37zUjJ/HJu37xoIe2XFKOZtXlzQ2Xfs9oouzQuG6vjGyFKGre6j428p
	 dPmTtCSzU+LE7dvykAfiGPyrP9cVwoUbJ7ZZgeObfZb2s3DQjZMFvnkVxQV0xYfCAF
	 9OCk37DT5vNNlX2sbol1Cw0K+QFUVMkXYu8lpeAfg6RWrtAxZ42yufXZNSi6V+ZwD+
	 CbTcmlAd8NZA/4HRHpUS57MpOplpQhvj6NII+moe9j+MYEIvDjXj9v5ePnM8T+7Sdi
	 dfpfwYRvZAa6izyS70j44IP4BLwuCKmfWyfBnylHZz9IZck1CV43lCarvt4bPTlhx8
	 YzS4/i440Aj2Q==
Date: Fri, 15 Oct 2021 08:20:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
    Ian Jackson <iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v7 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
In-Reply-To: <D471145B-813F-457C-BB81-23BE1FFACB93@arm.com>
Message-ID: <alpine.DEB.2.21.2110150817230.9408@sstabellini-ThinkPad-T480s>
References: <cover.1634305870.git.bertrand.marquis@arm.com> <847d430fdeb19e695176ddea71eeb11dcef8b23e.1634305870.git.bertrand.marquis@arm.com> <ec52b9e9-5908-7fd0-dfbf-31906eb8398d@xen.org> <D471145B-813F-457C-BB81-23BE1FFACB93@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Oct 2021, Bertrand Marquis wrote:
> Hi,
> 
> > On 15 Oct 2021, at 16:10, Julien Grall <julien@xen.org> wrote:
> > 
> > Hi Bertrand,
> > 
> > On 15/10/2021 14:59, Bertrand Marquis wrote:
> >> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> >> index 3aa8c3175f..082892c8a2 100644
> >> --- a/xen/drivers/passthrough/pci.c
> >> +++ b/xen/drivers/passthrough/pci.c
> >> @@ -766,7 +766,21 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> >>          list_add(&pdev->domain_list, &hardware_domain->pdev_list);
> >>      }
> >>      else
> >> +    {
> >> +#ifdef CONFIG_ARM
> >> +        /*
> >> +         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
> >> +         * when Dom0 inform XEN to add the PCI devices in XEN.
> >> +         */
> >> +        ret = vpci_add_handlers(pdev);
> > 
> > Sorry for only noticing it now. Looking at the last staging
> > vpci_add_handlers() is annotated with __hwdom_init. On Arm, __hwdom_init means the function will disappear after boot.
> > 
> > However, pci_add_device() can be called from a physdev op. So I think we would need to drop __hwdom_init. I can't seem to find this change in this series. Did I miss anything?
> 
> Good catch and not this is not in the serie.
> 
> Can we consider that a bug so that I can send a new patch or should I send a v8 ?
 
We don't typically do that, but I could make the change on commit, or
merge a second patch from you with this one on commit, after I run all
the gitlab-ci tests.

(I still have to read the series but FYI)

