Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C744C2F2453
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 01:50:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65434.115936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz7sn-0005Rm-As; Tue, 12 Jan 2021 00:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65434.115936; Tue, 12 Jan 2021 00:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz7sn-0005QL-6j; Tue, 12 Jan 2021 00:50:01 +0000
Received: by outflank-mailman (input) for mailman id 65434;
 Tue, 12 Jan 2021 00:49:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmZ/=GP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kz7sl-0005Q0-M5
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 00:49:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c2ee469-7be8-432d-bdda-175a43e90628;
 Tue, 12 Jan 2021 00:49:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D19592253A;
 Tue, 12 Jan 2021 00:49:57 +0000 (UTC)
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
X-Inumbo-ID: 6c2ee469-7be8-432d-bdda-175a43e90628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610412598;
	bh=B/dKS+sRgUG8YixH6AsJaKRxfKjvHj0qa83FEBMv7bs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iVdmfWs8XTipYmqcK8DTtGXZSpuoeh+yroWgy2EbfEwOL/KHGA+BUQm5P49+Ph7yY
	 x8PXlwoPpKoEbc9Zid/kLs6av9xGjwRefSvtDn8fyCUQgKRsa5p55jM74XEWkZpU8K
	 vcBupgXgkMoXvWtVxnlzFYEd1wYykVcDzhLwj2qsA6WYZe5DPgy0Fv6dNVuf8NUyIC
	 vMKn28ZEDO34eV7wJp1yilkTYBnfbE4Ur2D+0b0XdYhXKjncM9kBgjIr08qP8LmKv9
	 8c9qSruuHOC2wuJsH7zRsSEdWR6Gr69ol7JdILjRAOprhl4+sCB93ZcBB48kmaRXOg
	 bpv+gF7vDmalw==
Date: Mon, 11 Jan 2021 16:49:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Elliott Mitchell <ehem+xen@m5p.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [RESEND] [RFC PATCH] xen/arm: domain_build: Ignore empty memory
 bank
In-Reply-To: <X/OacwfT8/M3P30O@mattapan.m5p.com>
Message-ID: <alpine.DEB.2.21.2101111649050.2495@sstabellini-ThinkPad-T480s>
References: <X+DbupqYE3rrFaIM@mattapan.m5p.com> <102a361a-a070-185f-c564-8e4c30f96ab6@xen.org> <X/OacwfT8/M3P30O@mattapan.m5p.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Jan 2021, Elliott Mitchell wrote:
> On Mon, Dec 21, 2020 at 06:28:35PM +0000, Julien Grall wrote:
> > On 21/12/2020 17:30, Elliott Mitchell wrote:
> > > I doubt this is the only bug exposed by
> > > 5a37207df52066efefe419c677b089a654d37afc.
> > 
> > Are you saying that with my patch dropped, Xen will boot but with it 
> > will not?
> 
> I thought that was the cause.  Yet after a bunch of builds trying to
> ensure I can cause it to reproduce or not, I wasn't able to.  As such I
> now think this is a misattribution.  :-(
> 
> Other candidate on my radar is this showed up near the time I started
> trying other kernel sources.  I now wonder if this is due to the
> device-trees being produced with recent RPF kernels versus those being
> produced with pure mainline.  Presently I'm using a 5.10 RPF kernel and
> device-tree.
> 
> 
> > So I think we first need to figure out what is the offending node and 
> > why it is dt_device_get_address() is returning an error for it.
> > 
> > That said, I agree that we possibly want a check size == 0 (action TBD) 
> > in map_range_to_domain() as the code would do the wrong thing for 0.
> 
> Already stated "/scb/pcie@7d500000/pci@1,0/usb@1,0".

Can you please post the full node for usb@1,0? I would like to check the
corresponding device tree binding to see the expected format.


> Perhaps the code should be ignoring nodes for which
> which dt_device_get_address() fails, or perhaps this should only be done
> for Domain 0 (where it results in panic).

That seems reasonable

