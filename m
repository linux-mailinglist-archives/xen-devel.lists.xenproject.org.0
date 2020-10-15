Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3251828F2E4
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 15:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7347.19196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT2wm-0004gU-ND; Thu, 15 Oct 2020 13:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7347.19196; Thu, 15 Oct 2020 13:05:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT2wm-0004g8-Je; Thu, 15 Oct 2020 13:05:32 +0000
Received: by outflank-mailman (input) for mailman id 7347;
 Thu, 15 Oct 2020 13:05:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kT2wl-0004g3-0Z
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:05:31 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d378b68-77aa-4a92-9132-2d1aa62a97d0;
 Thu, 15 Oct 2020 13:05:28 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kT2wl-0004g3-0Z
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 13:05:31 +0000
X-Inumbo-ID: 7d378b68-77aa-4a92-9132-2d1aa62a97d0
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7d378b68-77aa-4a92-9132-2d1aa62a97d0;
	Thu, 15 Oct 2020 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602767128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tHYOldh+zzg4BAoHPlXXGno3aTMtmkswwhlSrgFQYqg=;
  b=anHAGe6dMzgtEim11a7DOt9xPdD8iRY5rMj9A6H4Vh//CpPNe/wwtY+q
   t4USCESU6Kq7ZOFLz6/KwmzSDaAvm3IU+6tYYFXYqeG9UUXHaSjCKNRz2
   i0rwDOeltVBURKuGjJwKUbsMlTa2e8P07vhxI9n+9Og72X5DRXCaHZBhj
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: C4m0tNJT9YMeau3EFBnetO+MT6a3OwtKzEXVG3Tyiw8hblwqZmgd6ZmPFsn+czUdALU0uBZuaC
 1/jeXe6kOr4NNx1jfddA/NfbnJv3kP5MnUwIU89z/GdTigcs0SkMafxYJoCP/yYbcYtstBdnS2
 +P0TR41c/Gwu3QXEKUkwNdvD95GajXddUd6fYmTvBe6IMcBUhAHesdReeIm8zm3zwPh7MFiQLx
 CvWqU6XP+hCZmHzYpgRTDOCg8gh4uiCnTXWGEavfeDmtAOR7QGqM4urGVrWcqGFqTloRWFQ9WY
 aKk=
X-SBRS: 2.5
X-MesageID: 30116032
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,379,1596513600"; 
   d="scan'208";a="30116032"
Date: Thu, 15 Oct 2020 15:05:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "J. Roeleveld" <joost@antarean.org>
CC: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: xen-blkback: Scheduled work from previous purge is still busy,
 cannot purge list
Message-ID: <20201015130520.GB68032@Air-de-Roger>
References: <15146361.Z0tdQxPx3m@eve>
 <1855015.FeAb16qnYt@eve>
 <20201015120046.GE19243@Air-de-Roger>
 <11618501.OP9n9qO8XQ@eve>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11618501.OP9n9qO8XQ@eve>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Thu, Oct 15, 2020 at 02:53:34PM +0200, J. Roeleveld wrote:
> On Thursday, October 15, 2020 2:00:46 PM CEST Roger Pau Monné wrote:
> > Please don't drop xen-devel mailing list when replying.
> 
> My apologies, most mailing lists I am active on have a working "reply" button. 
> Here I need to use "reply-all".
> 
> 
> > On Thu, Oct 15, 2020 at 01:28:49PM +0200, J. Roeleveld wrote:
> > > On Thursday, October 15, 2020 12:57:35 PM CEST you wrote:
> > > > On Tue, Oct 13, 2020 at 07:26:47AM +0200, J. Roeleveld wrote:
> > > > > Hi All,
> > > > > 
> > > > > I am seeing the following message in the "dmesg" output of a driver
> > > > > domain.
> > > > > 
> > > > > [Thu Oct  8 20:57:04 2020] xen-blkback: Scheduled work from previous
> > > > > purge
> > > > > is still busy, cannot purge list
> > > > > [Thu Oct  8 20:57:11 2020] xen-blkback: Scheduled work from previous
> > > > > purge
> > > > > is still busy, cannot purge list
> > > > > [Thu Oct  8 20:57:44 2020] xen-blkback: Scheduled work from previous
> > > > > purge
> > > > > is still busy, cannot purge list
> > > > > [Thu Oct  8 20:57:44 2020] xen-blkback: Scheduled work from previous
> > > > > purge
> > > > > is still busy, cannot purge list
> > > > > 
> > > > > 
> > > > > Is this something to worry about? Or can I safely ignore this?
> > > > 
> > > > What version of the Linux kernel are you running in that driver
> > > > domain?
> > > 
> > > Host:
> > > Kernel: 5.4.66
> > > Xen: 4.12.3
> > > 
> > > Driver domain:
> > > Kernel: 5.4.66
> > > Xen: 4.12.3
> > > 
> > > > Is the domain very busy? That might explain the delay in purging
> > > > grants.
> > > 
> > > No, it's generally asleep, been going through the munin-records and can't
> > > find any spikes the correlate with the messages either.
> > > 
> > > > Also is this an sporadic message, or it's constantly repeating?
> > > 
> > > It's sporadic, but occasionally, I get it several times in a row.
> > > 
> > > My understanding of the code where this message comes from is far from
> > > sufficient. Which means I have no clue what it is actually trying to do.
> > 
> > There's a recurrent worker thread in blkback that will go and purge
> > unused cache entries after they have expired. This is done to prevent
> > the cache from growing unbounded.
> > 
> > AFAICT this just means the worker is likely running faster than what
> > you can proceed, and hence you get another worker run before the old
> > entries have been removed. Should be safe to ignore, but makes me
> > wonder if I should add a parameter to tune the periodicity of the
> > purge work.
> 
> In other words, when it "fails" in this manner, the queue will simply be left 
> and processed the next time?

Yes, exactly.

> How often does this currently run?

The purge worked will run every 100ms, and the queued work should be
terminated before the next run.

> A parameter to tune the periodicity might be an option, for now I feel 
> confident I can safely ignore these messages.

Sure, I'm testing a patch series to that effect now.

Thanks, Roger.

