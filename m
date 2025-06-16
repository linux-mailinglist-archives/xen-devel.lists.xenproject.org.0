Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF996ADBDE2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 01:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017584.1394560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRJh4-0001rz-3n; Mon, 16 Jun 2025 23:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017584.1394560; Mon, 16 Jun 2025 23:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRJh4-0001pz-11; Mon, 16 Jun 2025 23:56:50 +0000
Received: by outflank-mailman (input) for mailman id 1017584;
 Mon, 16 Jun 2025 23:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w0jr=Y7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRJh1-0001pt-PS
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 23:56:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8efbd319-4b0d-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 01:56:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 33DD35C5B13;
 Mon, 16 Jun 2025 23:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B856FC4CEEA;
 Mon, 16 Jun 2025 23:56:42 +0000 (UTC)
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
X-Inumbo-ID: 8efbd319-4b0d-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750118204;
	bh=WNc/y16cQBeEyfR17QwFLGF9C5XEiwh1M9yAt5oivAg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Uo6MZ/w9Nc8YpiS6NxGElMnUHKcOy476U6R3qpJZNJcjD9ALG6xDnQW5tTyBZqjbh
	 5zbkoKz24yiM+wgVBAExYX1VIpq282lTl46QMFR9dWIHI48sVLL/QbKhUjzb78eqRJ
	 DVGikApUyhzj78zccs9GOt+tJicZCUfszVe2Z9+WwoIdVCLugy7ZaySBNGbPj38xsN
	 5RoBvOQ8oHlO8/AqMNc7KhLWZLqUetDLIsGD3Tts38laSuIsV1DuqRSSQDilwoiBBr
	 chquD7hPWf9FK3emsdUaG/KplDHyPeI2QxJJrp9B+MGfD1CMvQGeVgRfu+U8txkdTw
	 IIp9UTQGeqHqg==
Date: Mon, 16 Jun 2025 16:56:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    Rahul Singh <rahul.singh@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v8] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig
 option
In-Reply-To: <bf161fea-5b89-40a5-b3da-b5096ea3e09b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506161650370.1384757@ubuntu-linux-20-04-desktop>
References: <20250613154847.317979-1-stewart.hildebrand@amd.com> <3ecf10e5-5df7-4348-85a1-b8eecb940bf8@suse.com> <2e0627fa-35b8-4d3d-a3bc-338f9f7ed61b@amd.com> <bf161fea-5b89-40a5-b3da-b5096ea3e09b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Jun 2025, Jan Beulich wrote:
> On 16.06.2025 12:37, Stewart Hildebrand wrote:
> > On 6/16/25 02:42, Jan Beulich wrote:
> >> On 13.06.2025 17:17, Stewart Hildebrand wrote:
> >>> --- a/xen/arch/arm/Kconfig
> >>> +++ b/xen/arch/arm/Kconfig
> >>> @@ -8,6 +8,8 @@ config ARM_64
> >>>  	depends on !ARM_32
> >>>  	select 64BIT
> >>>  	select HAS_FAST_MULTIPLY
> >>> +	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
> >>> +	select HAS_PASSTHROUGH if PCI_PASSTHROUGH
> >>
> >> Seeing this, I like this as little as I liked ...
> >>
> >>> @@ -258,6 +260,12 @@ config PARTIAL_EMULATION
> >>>  
> >>>  source "arch/arm/firmware/Kconfig"
> >>>  
> >>> +config PCI_PASSTHROUGH
> >>> +	bool "PCI passthrough" if EXPERT
> >>> +	depends on ARM_64
> >>
> >> ... the form with the select-s put here. I'll (obviously) leave it to the
> >> Arm maintainers to judge, but my recommendation would be to simply drop
> >> this patch. As per the description it's merely "make it easier ...",
> >> which imo doesn't warrant such an abuse of HAS_*.
> > 
> > "easier" was a poor choice of word. "possible" is more accurate. This
> > patch addresses a real issue: currently the PCI and vPCI bits can't be
> > built for Arm, allowing build issues to go unnoticed. E.g. see
> > 4ce671963eb1 ("xen/arm: fix build with HAS_PCI").
> 
> Which gets us back to the question of whether to use "depends on
> HAS_PASSTHROUGH" (I think yes then) and where to put the remaining select
> (might then better move back to the new option).

In my opinion, HAS_ options should not be user-configurable but rather
properties of the architecture. Therefore, I would add HAS_PASSTHROUGH
to ARM_64 unconditionally. Then I would make PASSTHROUGH
user-configurable, but dependent on HAS_PASSTHROUGH.

In the rest of the code, we would update the checks to be based on
PASSTHROUGH instead of HAS_PASSTHROUGH.

That said, this patch is simpler while my suggestion is more invasive.
Also this patch is at v8 and we shouldn't keep increasing the scope of
the work for contributors. Finally, I am not certain all maintainers
would agree with my view I just outlined.

So based on the above, and based on the fact that we certainly need this
patch or something like it:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


