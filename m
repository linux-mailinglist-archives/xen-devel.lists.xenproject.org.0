Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ECA40CE63
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 22:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187905.336925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQbmk-0004mE-8u; Wed, 15 Sep 2021 20:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187905.336925; Wed, 15 Sep 2021 20:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQbmk-0004kG-58; Wed, 15 Sep 2021 20:45:38 +0000
Received: by outflank-mailman (input) for mailman id 187905;
 Wed, 15 Sep 2021 20:45:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+tO=OF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQbmi-0004kA-AL
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 20:45:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da10bb1a-5a90-4c3e-ad00-e784d3879975;
 Wed, 15 Sep 2021 20:45:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61A3D6112E;
 Wed, 15 Sep 2021 20:45:34 +0000 (UTC)
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
X-Inumbo-ID: da10bb1a-5a90-4c3e-ad00-e784d3879975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631738734;
	bh=HtJZPtHOZ0+0iv37c96zwKO2Gj2UEfo585JjsV72U4A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oT0jmbnn0SQ3cSQYFvRiGDtczD3vBSG6tjbyGuaV6c6QpoYckJzQwd9CUV8i5efOX
	 hLWfGugdyKQIZmQKpFifSXNLexvLLpxvI6rWwQ4Kb5+/hpiEqAEkJ5gN8P4QY6zaua
	 nvsXbHmiiFOKAkMKo646AgcO7g+DgBYWvNqqryO74cqrH/pwtsEwtK6aTQoc+fzYXk
	 8MvlAgQXHVbK3uLYTVpzhPezsKgk9zp0lQ96Xylfh7EcUU2tSc4FNwkhI8wCcD1lTY
	 jzR49Vq9SMNaOEE4nmnYyndTsqT6d3dkw3hEHxA4cHFxWu6CpN/YSsQi49DeDAAAHj
	 SOHRQPeX4AbeQ==
Date: Wed, 15 Sep 2021 13:45:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 06/14] xen/arm: Add support for PCI ecam operations
In-Reply-To: <8B84E0D6-70A7-4C8F-ACBE-D1773F6C8FAD@arm.com>
Message-ID: <alpine.DEB.2.21.2109151340390.21985@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <1dc8286db35ced8281587135cfa582ea44b0185f.1629366665.git.rahul.singh@arm.com> <alpine.DEB.2.21.2109091607070.10523@sstabellini-ThinkPad-T480s> <B0EBC722-A74A-4742-9D93-904398FDDF1B@arm.com>
 <alpine.DEB.2.21.2109141543090.21985@sstabellini-ThinkPad-T480s> <8B84E0D6-70A7-4C8F-ACBE-D1773F6C8FAD@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-35407010-1631738734=:21985"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-35407010-1631738734=:21985
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 15 Sep 2021, Rahul Singh wrote:
> > On 15 Sep 2021, at 12:06 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > On Tue, 14 Sep 2021, Rahul Singh wrote:
> >>>> +        return NULL;
> >>>> +
> >>>> +    busn -= cfg->busn_start;
> >>>> +    base = cfg->win + (busn << cfg->ops->bus_shift);
> >>>> +
> >>>> +    return base + (PCI_DEVFN(sbdf_t.dev, sbdf_t.fn) << devfn_shift) + where;
> >>>> +}
> >>> 
> >>> I understand that the arm32 part is not implemented and not part of this
> >>> series, that's fine. However if the plan is that arm32 will dynamically
> >>> map each bus individually, then I imagine this function will have an
> >>> ioremap in the arm32 version. Which means that we also need an
> >>> unmap_bus call in struct pci_ops. I understand that pci_ecam_unmap_bus
> >>> would be a NOP today for arm64, but I think it makes sense to have it if
> >>> we want the API to be generic.
> >> 
> >> As per my understanding we don’t need pci_ecam_unmap_bus(..) as I don’t see any use case to unmap the 
> >> bus dynamically. We can add the support for per_bus_mapping for ARM32 once we implement arm32 part.
> >> Let me know your view on this.
> > 
> > In the patch titled "xen/arm: PCI host bridge discovery within XEN on
> > ARM" there is the following in-code comment:
> > 
> > * On 64-bit systems, we do a single ioremap for the whole config space
> > * since we have enough virtual address range available.  On 32-bit, we
> > * ioremap the config space for each bus individually.
> > *
> > * As of now only 64-bit is supported 32-bit is not supported.
> > 
> > 
> > So I take it that on arm32 we don't have enough virtual address range
> > available, therefore we cannot ioremap the whole range. Instead, we'll
> > have to ioremap the config space of each bus individually.
> 
> Yes you are right my understand is also same.
> > 
> > I assumed that the idea was to call ioremap and iounmap dynamically,
> > otherwise the total amount of virtual address range required would still
> > be the same.
> 
> As per my understanding for 32-bit we need per_bus mapping as we don’t have enough virtual address space in one chunk
> but we can have virtual address space in different chunk.

Interesting. I would have assumed that the sum of all the individual
smaller ioremaps would still be equal to one big ioremap. Maybe for
Linux is different, but I don't think that many smaller ioremaps would
buy us very much in Xen because it is the total ioremap virtual space
that is too small. Or am I missing something?


> I am not sure if we need to map/unmap the virtual address space for each read/write call. 
> I just checked the Linux code[1]  and there also mapping is done once not for each read/write call.

So my guess is that for arm32 we would have to resort to dynamic
map/unmap for each read/write call, unless there is a trick with the
individual smaller ioremaps that I haven't spotted (e.g. maybe something
doesn't get mapped that way?)

That said, given that we are uncertain about this and the arm32
implementation is nowhere close, I think that we are OK to continue like
this for this series. Maybe you could add a couple of sentences to the
in-code comment so that if somebody wants to jump in and implement
arm32 support they would know where to start.
--8323329-35407010-1631738734=:21985--

