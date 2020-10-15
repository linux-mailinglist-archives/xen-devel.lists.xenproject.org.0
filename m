Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1035C28F1C0
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 14:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7283.18998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT1wJ-00063n-3n; Thu, 15 Oct 2020 12:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7283.18998; Thu, 15 Oct 2020 12:00:59 +0000
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
	id 1kT1wI-00063O-W4; Thu, 15 Oct 2020 12:00:58 +0000
Received: by outflank-mailman (input) for mailman id 7283;
 Thu, 15 Oct 2020 12:00:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kT1wG-00063H-Rl
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 12:00:56 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 587ebec1-06ee-4b66-9b1d-1affd46b6df5;
 Thu, 15 Oct 2020 12:00:56 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kT1wG-00063H-Rl
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 12:00:56 +0000
X-Inumbo-ID: 587ebec1-06ee-4b66-9b1d-1affd46b6df5
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 587ebec1-06ee-4b66-9b1d-1affd46b6df5;
	Thu, 15 Oct 2020 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602763255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SD26uCWGPAl9VECFUd5wk6XlizSPMWmbo8zTupJX1QE=;
  b=KsSw3N+ABsDSLuoW4GSSj+uVl1ypsw7yw+aXUgGSpPbNPXAZUoYCudp5
   FmGJRpzAhAMFpZ1mbn8BYJiQW2WRMTvdvH6ZSteEmnd7cmRRdsVJ2owgl
   Rtig5JuOGeqaJbErrtSkqzfMPW6YYyf359rwZNPRx48+W1VBXzN/AlRgf
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zyajt8KycHUOuInisqErIMtjpgYmoikIVRuywWQphTwXdKHfW6tjI39ZGKYzR3njHwTxLr8Rfn
 L9les95bid7p3rvCfiBCf7eW+1T88me0xTZTDACX7okutisfC47UAgk0dYIQAcJThRT2ri9cml
 anfTHJ99sSWbKJD7XFDWpztz6zLTQ1rh+W+Ohxg8cPIywyYjJjDalfe6GEjaAPCmNXn1JZ6MP8
 CP1MT3fwvOWqiZRYKqScEnPT2QezhH0BHTRkwKNOuhuBfzUcfKfUKv0UJrnQY7Ex25WmkLNU3O
 SN8=
X-SBRS: 2.5
X-MesageID: 30108946
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,378,1596513600"; 
   d="scan'208";a="30108946"
Date: Thu, 15 Oct 2020 14:00:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "J. Roeleveld" <joost@antarean.org>
CC: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: xen-blkback: Scheduled work from previous purge is still busy,
 cannot purge list
Message-ID: <20201015120046.GE19243@Air-de-Roger>
References: <15146361.Z0tdQxPx3m@eve>
 <20201015105735.GB67506@Air-de-Roger>
 <1855015.FeAb16qnYt@eve>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1855015.FeAb16qnYt@eve>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

Please don't drop xen-devel mailing list when replying.

On Thu, Oct 15, 2020 at 01:28:49PM +0200, J. Roeleveld wrote:
> On Thursday, October 15, 2020 12:57:35 PM CEST you wrote:
> > On Tue, Oct 13, 2020 at 07:26:47AM +0200, J. Roeleveld wrote:
> > > Hi All,
> > > 
> > > I am seeing the following message in the "dmesg" output of a driver
> > > domain.
> > > 
> > > [Thu Oct  8 20:57:04 2020] xen-blkback: Scheduled work from previous purge
> > > is still busy, cannot purge list
> > > [Thu Oct  8 20:57:11 2020] xen-blkback: Scheduled work from previous purge
> > > is still busy, cannot purge list
> > > [Thu Oct  8 20:57:44 2020] xen-blkback: Scheduled work from previous purge
> > > is still busy, cannot purge list
> > > [Thu Oct  8 20:57:44 2020] xen-blkback: Scheduled work from previous purge
> > > is still busy, cannot purge list
> > > 
> > > 
> > > Is this something to worry about? Or can I safely ignore this?
> > 
> > What version of the Linux kernel are you running in that driver
> > domain?
> 
> Host:
> Kernel: 5.4.66
> Xen: 4.12.3
> 
> Driver domain:
> Kernel: 5.4.66
> Xen: 4.12.3
> 
> 
> > Is the domain very busy? That might explain the delay in purging
> > grants.
> 
> No, it's generally asleep, been going through the munin-records and can't find 
> any spikes the correlate with the messages either.
> 
> > Also is this an sporadic message, or it's constantly repeating?
> 
> It's sporadic, but occasionally, I get it several times in a row.
> 
> My understanding of the code where this message comes from is far from 
> sufficient. Which means I have no clue what it is actually trying to do.

There's a recurrent worker thread in blkback that will go and purge
unused cache entries after they have expired. This is done to prevent
the cache from growing unbounded.

AFAICT this just means the worker is likely running faster than what
you can proceed, and hence you get another worker run before the old
entries have been removed. Should be safe to ignore, but makes me
wonder if I should add a parameter to tune the periodicity of the
purge work.

Roger.

