Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC8E43E69A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 18:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218196.378529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg8bk-000615-KH; Thu, 28 Oct 2021 16:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218196.378529; Thu, 28 Oct 2021 16:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg8bk-0005ym-GV; Thu, 28 Oct 2021 16:50:28 +0000
Received: by outflank-mailman (input) for mailman id 218196;
 Thu, 28 Oct 2021 16:50:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TkaK=PQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mg8bi-0005yg-TA
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 16:50:26 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25df5a0c-380f-11ec-84ae-12813bfff9fa;
 Thu, 28 Oct 2021 16:50:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2ADE61073;
 Thu, 28 Oct 2021 16:50:24 +0000 (UTC)
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
X-Inumbo-ID: 25df5a0c-380f-11ec-84ae-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635439825;
	bh=zatCatZprUl/+qGSal03LHrneW7AeXcu4SleAI2SVPI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EhgoNUaa8j+TNJc99dc+K5pg+l/+ynk8bl88Hnwv87BULKgiVlazyZwMMhCBC7sDh
	 4MFsphySenmGvWN/Fyb3bMVAzbJ2hHZD3tgCIwcrVGGdDXtcFkqDqbqgNNtUiC27m7
	 hD4J3MTAlsEK5zE78vAmz/f/9DEHt86ZymUVXPYv5ewgcrFNfqGNfhEf9+bqnqrODC
	 7wq5gCj5BQ3VjwOxkiTrD0VtWblXr03nme+HODWUGHBceoKeTamlD5M2sGSKHJyeEc
	 W7OK3neKaHJl8FIDh6DQF2NuIae0uNs1kUvrDI1vBJwukRsuEzMEMjK0h12lFsmDXr
	 jSZFdFMR0oXEQ==
Date: Thu, 28 Oct 2021 09:50:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Andrushchenko <andr2000@gmail.com>, 
    xen-devel@lists.xenproject.org, iwj@xenproject.org, 
    bertrand.marquis@arm.com, rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH] xen/arm: do not try to add pci-domain for disabled
 devices
In-Reply-To: <c3602294-0ab4-10df-77cc-2a9e13ddc73f@xen.org>
Message-ID: <alpine.DEB.2.21.2110280948190.20134@sstabellini-ThinkPad-T480s>
References: <20211027083730.1406947-1-andr2000@gmail.com> <7a97bbef-68a9-8f52-0c93-88d4e84a07fc@xen.org> <alpine.DEB.2.21.2110271649240.20134@sstabellini-ThinkPad-T480s> <c3602294-0ab4-10df-77cc-2a9e13ddc73f@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Oct 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 28/10/2021 00:57, Stefano Stabellini wrote:
> > On Wed, 27 Oct 2021, Julien Grall wrote:
> > > Hi Oleksandr,
> > > 
> > > On 27/10/2021 09:37, Oleksandr Andrushchenko wrote:
> > > > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > > > 
> > > > If a PCI host bridge device is present in the device tree, but is
> > > > disabled, then its PCI host bridge driver was not instantiated.
> > > > This results in the following panic during Xen start:
> > > > 
> > > > (XEN) Device tree generation failed (-22).
> > > 
> > > It would good to clarify in the commit message where the error is coming
> > > from.
> > > I think this is from pci_get_host_bridge_segment().
> > > 
> > > > (XEN)
> > > > (XEN) ****************************************
> > > > (XEN) Panic on CPU 0:
> > > > (XEN) Could not set up DOM0 guest OS
> > > > (XEN) ****************************************
> > > > 
> > > > Fix this by not adding linux,pci-domain property for hwdom if it is
> > > > neither available nor device enabled.
> > >  From my reading of the binding [1], the property should be present in all
> > > the
> > > hostbridges if one specify it. IOW, I think the property should also be
> > > added
> > > for hostbridges that are not available.
> > 
> > Just wanted to say that I think you are right:
> > 
> > """
> > It is required to either not set this property at all or set it for all
> > host bridges in the system, otherwise potentially conflicting domain numbers
> > may be assigned to root buses behind different host bridges.  The domain
> > number for each host bridge in the system must be unique.
> > """
> > 
> > and I am ready to believe device trees with disabled bridges might have
> > (incorrectly) ignored the rule.
> 
> Looking at linux/arch/arm64/boot/dts/, there are a few Device-Tree that
> contain the property "linux,pci-domain". All of them seems to also add it for
> disabled hostbridges.
> 
> However, I am under the impression that it is more common to have a
> Devide-Tree without any property "linux,pci-domain". When PCI support is
> enabled, Xen will generate the domain ID for the hostbridge and write it to
> the DT.
> 
> This doesn't work for disabled hostbridge and I think this is Oleksandr's
> problem. @Oleksandr can you confirm it?
> 
> > 
> > 
> > > AFAICT, Linux will ignore hostbridge that are not available. But it feels
> > > to
> > > me we are twisting the rule. So, could we consider to allocate an unused
> > > number?
> > 
> > I think that would be fine but it doesn't look easy from the current Xen
> > code point of view because the allocation depends on the Xen driver,
> > which we don't have. But I'll let others comment on it.
> So what matters is Xen doesn't make things worse. We have two cases to care:
>   1) Xen only has drivers for a part of the hostbriges
>   2) Some hostbriges are disabled
> 
> Case 1) will definitely generate a DT that will make Linux unhappy if we have
> don't add the property consistently.

Good point!

