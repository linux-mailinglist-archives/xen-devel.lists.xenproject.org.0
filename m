Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6B9431B0F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 15:28:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212288.370108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSgo-0005vC-C2; Mon, 18 Oct 2021 13:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212288.370108; Mon, 18 Oct 2021 13:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSgo-0005sx-8z; Mon, 18 Oct 2021 13:28:30 +0000
Received: by outflank-mailman (input) for mailman id 212288;
 Mon, 18 Oct 2021 13:28:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcSgm-0005sp-VU
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:28:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcSgm-0005oM-UQ
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:28:28 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcSgm-0005f6-TM
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:28:28 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mcSgj-0005y7-DJ; Mon, 18 Oct 2021 14:28:25 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=QDSsGB2ZzXBnBQwu3bnaniFd7ileFmPeuhH7RFjCycM=; b=JrdtvK+CNm4O2ZxBffK08ILk3U
	IfpLcVVtFYoBGw7kNW2gyWAH+TVVBBR/Q9dPdM10oEykc4C180AWo1kCQyMqzc1tD2PBf9iCfuOXu
	iu6jsXePTmNNYA4ebK9CHSyUMeuFelfNjtMOi8qDwfMPcFaMkKqJnd5mWkxah1HeZwuI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24941.30329.51635.566269@mariner.uk.xensource.com>
Date: Mon, 18 Oct 2021 14:28:25 +0100
To: Juergen Gross <jgross@suse.com>,
    xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Samuel Thibault <samuel.thibault@ens-lyon.org>,
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v3 0/3] disable building of pv-grub and qemu-trad per
 default
In-Reply-To: <24913.55427.402592.660538@mariner.uk.xensource.com>
References: <20210910055518.562-1-jgross@suse.com>
	<24891.31480.165445.521062@mariner.uk.xensource.com>
	<d894799e-27c6-bbbd-8d65-3e32c1aff843@suse.com>
	<24913.55427.402592.660538@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

I wrote (27th September):
> Juergen Gross writes ("Re: [PATCH v3 0/3] disable building of pv-grub and qemu-trad per default"):
> > On 10.09.21 17:34, Ian Jackson wrote:
> > > Juergen Gross writes ("[PATCH v3 0/3] disable building of pv-grub and qemu-trad per default"):
> > >> This is a first step of deprecating pv-grub and qemu-trad including
> > >> ioemu-stubdom. Switch the default to not building it.
> > > 
> > > This is now fully acked.  But can we wait with committing it until we
> > > have a decision about whether to (a) have osstest explicitly enable
> > > the pv-grub and qemu-trad builds (b) have osstest stop testing these
> > > configurations ?
> > 
> > Any decisions made?
> 
> No-one seems to have had any opinions.   I'll take ...
> 
> > FWIW I'd be fine dropping pv-grub builds and tests in OSStets, but I'd
> > rather keep testing qemu-trad stubdom tests.
> 
> ... that as a proposal :-).  think that is probably the right tradeoff.
> 
> I think that means that means we need osstest patches to edit
> make-flight and ts-xen-build which
> 
>  * Explictly enables stubdom qemu build
>  * Drops the pv-grub tests
> 
> and those need to go in first.
> 
> With my RM hat on, I think those changes to osstest may need a release
> ack since they have missed the LPD, but I will grant such an ack.
> 
> As for the patches themselves, I may get to that tomorrow, but
> contributions would be very welcome.

Evidently I didn't get to that "tomorrow".  But while checking up on
this with git-log -G I found osstest commit:

  8dee6e333622d830b7a9373989f63b526a85cd94
  make-flight: Drop pvgrub (pvgrub1) tests

I think this means
  [PATCH v3 2/3] stubdom: disable building pv-grub
from this series can go in immediately.

With my RM hat on: I think this reduces risk, overall.  There is some
risk of immediately build breakage but the patch could be readily
reverted.

Accordingly, patch 2/3 disabling pv-grub is
  Release-Acked-by: Ian Jackson <iwj@xenproject.org>

It also has my tools ack so I will commit it in a moment.

I think 3/3 is waiting for the osstest patch.  In principle with my RM
hat on I think these could go in but it would have to be very soon,
and the osstest change has to go in first.

Ian.

