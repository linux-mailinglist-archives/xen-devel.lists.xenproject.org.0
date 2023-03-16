Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C5D6BC377
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 02:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510286.787685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcck1-00044v-V4; Thu, 16 Mar 2023 01:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510286.787685; Thu, 16 Mar 2023 01:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcck1-00042W-Pr; Thu, 16 Mar 2023 01:49:17 +0000
Received: by outflank-mailman (input) for mailman id 510286;
 Thu, 16 Mar 2023 01:49:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCnM=7I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pccjz-00041P-IY
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 01:49:15 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf9cae91-c39c-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 02:49:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 267A2B81F7B;
 Thu, 16 Mar 2023 01:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5A4C433EF;
 Thu, 16 Mar 2023 01:49:08 +0000 (UTC)
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
X-Inumbo-ID: bf9cae91-c39c-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678931349;
	bh=6WZ2+Jx6ApZL93kB/9ORUNeO2n+00wuQmvZMq/TQzNc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g276YkEjIv3hU7AU+jGsLWqkU4Bij38OJZCv4gwGAHWviKQlT+fTYWMoZhmAJhOyH
	 l+GG9JRJBFUEbmFLMN5tmE1BNclZhpJlRPJt+uW1k80kIXLTcfIOv697Z0tvMi0iGQ
	 fYgoV7IThxZ38/m+q+3ALKv7mJYoyHRE3vPC1bhrsTuGtxicW2H/N/KDIsxYSxutkw
	 SsNccGzW3mPp+LJVTSoFA9ItW0rGYmuwk/1pRhgTGsw3cnDe6LkWcI/ekZqpCNFTsE
	 6UVX0tErfq2AXJayDa6avxRfN4X/xoXlRjOyo2Yh8oiw1tYZdMv5orsceeU9MzILo3
	 hm1V0C27z8UhQ==
Date: Wed, 15 Mar 2023 18:49:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: Handle true dom0less case when switching
 serial input
In-Reply-To: <d67aeb95-1631-74c0-cefa-a0cc88512b84@amd.com>
Message-ID: <alpine.DEB.2.22.394.2303151844530.3462@ubuntu-linux-20-04-desktop>
References: <20230314142749.8845-1-michal.orzel@amd.com> <da7db77f-3ab8-edd1-bc69-460ca3e2ce25@suse.com> <7676cba9-6f92-0c97-dac3-372ca47be34b@amd.com> <737fec84-42da-3b9b-6cb5-d18406925403@suse.com> <d67aeb95-1631-74c0-cefa-a0cc88512b84@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Mar 2023, Michal Orzel wrote:
> On 15/03/2023 14:11, Jan Beulich wrote:
> > On 15.03.2023 13:34, Michal Orzel wrote:
> >> On 14/03/2023 16:17, Jan Beulich wrote:
> >>> On 14.03.2023 15:27, Michal Orzel wrote:
> >>>> --- a/xen/drivers/char/console.c
> >>>> +++ b/xen/drivers/char/console.c
> >>>> @@ -491,6 +491,14 @@ static void switch_serial_input(void)
> >>>>      else
> >>>>      {
> >>>>          console_rx++;
> >>>> +
> >>>> +        /*
> >>>> +         * Skip switching serial input to hardware domain if it does not exist
> >>>> +         * (i.e. true dom0less mode).
> >>>> +         */
> >>>> +        if ( !hardware_domain && (console_rx == 1) )
> >>>> +            console_rx++;
> >>>
> >>> The consumers of this variable aren't really serialized with this
> >>> updating. That's probably okay-ish prior to your change, but now
> >>> there can be two updates in rapid succession. I think it would be
> >>> better if the variable was written only once here.
> >> ok, makes sense.
> >>
> >>>
> >>>>          printk("*** Serial input to DOM%d", console_rx - 1);
> >>>
> >>> When invoked from console_endboot() this will now switch to Dom1,
> >>> i.e. that domain becomes kind of "preferred", which I think is
> >>> wrong. Instead I think in such a case we should direct input to
> >>> Xen by default.
> >> Switching serial input to the first usable domain is the major motivation behind this patch.
> >> The number of times I got pinged by users with *apparent* Xen issue on true dom0less
> >> just because input was directed to dom0 which was not there (not everyone seems to read the
> >> boot logs) forced me to create this patch and manifests that this is not the behavior user wants.
> >> Switching to Xen console would not help at all. Also, we already have a way to set switch code to 'x'
> >> to default serial input to Xen.
> >> So I think what I did (switching to the first existing domain) should be the default behavior (just like it was done for dom0).
> > 
> > Well, I'm not going to stand in the way, but if one of several supposedly
> > equal domains is to be "preferred" in some way, then I for one would
> > expect justification for doing so. If that's the route to go, then the
> > patch snippet you provided looks good to me.
> Well, the explanation is that we are directing input to the first existing domain
> which also is the first domain created (this is what users expect at least by default).
> This for now creates simplest/cleanest solution that matches the current behavior
> with dom0 and solves the users inconveniences I mentioned earlier.
> There is no other real preference apart from being first domain created and to help keep the order simple.

My two cents. Given the feedback we are getting from users, I think it
is important that the input goes to a real valid domain (not Xen, not
Dom0 that doesn't exist). "Which dom0less domain?" is a valid question,
and I don't know what would be the best answer. But any of those domains
would be better than what we have today.

