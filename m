Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47896442258
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 22:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219416.380208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mheVt-00025f-2c; Mon, 01 Nov 2021 21:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219416.380208; Mon, 01 Nov 2021 21:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mheVs-00022b-Vg; Mon, 01 Nov 2021 21:06:40 +0000
Received: by outflank-mailman (input) for mailman id 219416;
 Mon, 01 Nov 2021 21:06:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0c/y=PU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mheVr-00022V-IV
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 21:06:39 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a70d652-3b57-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 21:06:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 867AA61183;
 Mon,  1 Nov 2021 21:06:37 +0000 (UTC)
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
X-Inumbo-ID: 9a70d652-3b57-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635800797;
	bh=yDLXOkSZv7jzgUVYq0a5FeXntcFCZAE0gtv8V2te/P8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O/EcfVWM2DlLzgTtVl501t3dGXrhxz+0pUONdRc84lHIOXOFgHaoDar+48DOKeHL4
	 VJ25XHqGUr3BpIA1R0LsShGjZnu9IowjZvo2IwNUYWVInPvDypGVEW78y13Orml9uK
	 9I3+/NDaFVFPzhzfzXjdbIEfeJ0pA9rvEwd5FF3GuE+ZSeucgjKBb2ex2W1zvP+5P/
	 chlY7b4of7qwMQyw9r+9dDMB2iAZRxjmPLWSh56iyVmgdRc4Ku9qYA/Uf1rD77MNA6
	 dqp3DSlFr3jeXmUTtGPuVlmbOsqN4o+DJoP99Eq+AgdJ3kgsqDW6212+F6fXKtTt7H
	 nKvPWrnDnBiCQ==
Date: Mon, 1 Nov 2021 14:06:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <iwj@xenproject.org>
cc: Julien Grall <julien@xen.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Bertrand  Marquis <bertrand.marquis@arm.com>, 
    Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
 [and 2 more messages]
In-Reply-To: <24959.49313.936961.936820@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2111011402320.20134@sstabellini-ThinkPad-T480s>
References: <20211027082533.1406015-1-andr2000@gmail.com> <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org> <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com> <65886734-7333-4469-fcc1-6916db708f13@xen.org> <b6bb02b6-6358-b5e0-1b80-7819aadabe10@epam.com>
 <6d8f1061-7aec-2c1a-aaf4-c30440c2797a@xen.org> <38da2edd-06a2-63d0-51ad-1284272c8da5@epam.com> <a74b52fb-6514-4187-17fe-b63236efa0ce@xen.org> <24954.51153.588540.850154@mariner.uk.xensource.com> <d7e4ae66-f648-e18e-79c8-fae6eb896f00@xen.org>
 <YXkU+DKYmvwo+kak@Air-de-Roger> <0bbe4d1d-421d-e816-42aa-f43581902a02@epam.com> <24953.34635.645112.279110@mariner.uk.xensource.com> <24959.49313.936961.936820@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Nov 2021, Ian Jackson wrote:
> Julien Grall writes ("Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers"):
> > On 28/10/2021 16:54, Ian Jackson wrote:
> > > There are a number of patches that I'm getting CC'd on related to ARM
> > > and vpci (according to the Subject).  Are these targeted for 4.16 ?
> > > Most of them don't have 4.16 Subject tags.
> > 
> > Oleksandr wants this patch to be included for 4.16 but forgot to tag it 
> > properly.
> 
> Oh yes.  However,
> 
> 1. I also wrote this:
> 
> > > I am finding it difficult to see the wood for the trees.
> > > It would be really helpful if these vpci fixes were collected
> > > together into a series.
> 
> Can someone please confirm whether this is the only vpci-related patch
> that ought to be on my radar for 4.16 ?
> 
> 2. I have not had a reply to my question on Wednesday in
> <24953.34635.645112.279110@mariner.uk.xensource.com>:
> 
>   Um, can you explain what the practical impact is of not taking this
>   patch for 4.16 ?  As I understand it vpci for ARM is non-functional in
>   4.16 and this is not expected to change ?  So there would be no
>   benefit to users, and taking the patch would add small but nonzero
>   risk ?
> 
> I need this information to decide whether a release-ack is
> appropriate.
> 
> Note that we are in code freeze so all patches, including bugfixes,
> need my ack.

Hi Ian,

This patch [1] is a straightforward 2 lines fix for vpci on ARM.  There
is no risk for the release as the source file affected only builds when
CONFIG_HAS_VPCI is enabled, and it is currently disabled on ARM.

At the same time, as we know vpci is not complete in 4.16 anyway, so the
counter argument is that we don't need to fix it.

Given how trivial the fix is, and that it cannot break the build or
runtime, I would take it.

Cheers,

Stefano


[1] https://marc.info/?l=xen-devel&m=163532307715435

