Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7353D48BB02
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 23:52:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256175.439501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Pzx-0005md-91; Tue, 11 Jan 2022 22:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256175.439501; Tue, 11 Jan 2022 22:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Pzx-0005kC-5y; Tue, 11 Jan 2022 22:52:13 +0000
Received: by outflank-mailman (input) for mailman id 256175;
 Tue, 11 Jan 2022 22:52:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMx1=R3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n7Pzv-0005jI-Lh
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 22:52:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bebab76-7331-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 23:52:10 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BDC4B61351;
 Tue, 11 Jan 2022 22:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10C1C36AE3;
 Tue, 11 Jan 2022 22:52:08 +0000 (UTC)
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
X-Inumbo-ID: 1bebab76-7331-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641941529;
	bh=EW7LVEUPxDyYGzWedxB8FFH2ZaZhIR9fF+MZ94tFwDM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JmAJ6nbzWVvFl/2XFUKqqV+7wrAC8o8VlvHUOcPe1oRd10MRAYRfHqQuHo2i3V5Fe
	 vQI/X4UnCUjxmHvqC2TizkauHIfGOUld8aUwAj8PmI0j7/SMidfcjcgLnig21ty7er
	 UzFjtxUqvT8HDQmLJyNQvMAu2NtSmIJMajzNTFTolJmSLmJvPdzweS8V53Xkzq9BIP
	 kxSJpodv2hCcYPSubSeJjnAqgPJuD2XwrVws6dSzciEtEqK6KjvbRx2Gf257LOSWmG
	 75Ke3rJBjOJLiwR8TwuxfwiKTTRuf5UaNrvwwnAzuUWd8mBK5awug7RLgk0AOPpWim
	 fz8ft1bBjNM+A==
Date: Tue, 11 Jan 2022 14:52:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: David Vrabel <dvrabel@cantab.net>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 1/7] xen: introduce XENFEAT_xenstore_late_init
In-Reply-To: <e54f914d-a683-1855-1eeb-635df86f0d94@cantab.net>
Message-ID: <alpine.DEB.2.22.394.2201111451270.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop> <20220108004912.3820176-1-sstabellini@kernel.org> <580a888e-24c4-5d16-8c70-f3d7b34ac2c9@xen.org> <alpine.DEB.2.22.394.2201101340550.2060010@ubuntu-linux-20-04-desktop>
 <e54f914d-a683-1855-1eeb-635df86f0d94@cantab.net>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Jan 2022, David Vrabel wrote:
> On 10/01/2022 22:55, Stefano Stabellini wrote:
> > 
> > I have a patch for Linux that if XENFEAT_xenstore_late_init is present
> > makes Linux wait for an event notification before initializing xenstore:
> > https://marc.info/?l=xen-devel&m=164160299315589
> > 
> > So with v1 of the Xen and Linux patches series:
> > - Xen allocates the event channel at domain creation
> > - Linux boots, sees XENFEAT_xenstore_late_init and wait for an event
> > - init-dom0less later allocates the xenstore page
> > - init-dom0less triggers the xenstore event channel
> > - Linux receives the event and finishes the initialization, including
> >    mapping the xenstore page
> 
> You can get this behaviour without the new feature.
> 
> - Xen allocates the event channel at domain creation
> - Linux boots, sees HVM_PARAM_STORE_PFN is invalid and there's a xenstore
> event channel and waits for an event
> - init-dom0less later allocates the xenstore page
> - init-dom0less triggers the xenstore event channel
> - Linux receives the event and finishes the initialization, including
>    mapping the xenstore page-

Hey David!

Yes, this is similar to what I had in mind and I managed to make it work
successfully.

