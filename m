Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 689AB28F072
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 12:57:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7266.18949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT0x8-0008Ed-5W; Thu, 15 Oct 2020 10:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7266.18949; Thu, 15 Oct 2020 10:57:46 +0000
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
	id 1kT0x8-0008EE-2Z; Thu, 15 Oct 2020 10:57:46 +0000
Received: by outflank-mailman (input) for mailman id 7266;
 Thu, 15 Oct 2020 10:57:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kT0x6-0008E9-PO
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 10:57:44 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b44f7df0-ee64-47fc-a650-dc65cf9c00ca;
 Thu, 15 Oct 2020 10:57:43 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kT0x6-0008E9-PO
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 10:57:44 +0000
X-Inumbo-ID: b44f7df0-ee64-47fc-a650-dc65cf9c00ca
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b44f7df0-ee64-47fc-a650-dc65cf9c00ca;
	Thu, 15 Oct 2020 10:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602759463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LTw4HxuM2Hd9gC5Eofd+gOjQV+QnRt0hWS4gjM7xh+8=;
  b=fUV5EKo11EwSfk+SHHGHnoTHT9GU4/cL4BAOpKtrp0Nu/Lywk791HmgG
   oA6P/c5gTnxKW4wygZBT2Pv62uSTgoLb1AMi/49UUYPpwuxahrMt1yoxI
   37VNfSZj6dPBq+R+QpHqjvnnLD/zkKlkOgUnq6/kO5vgH7w6U2gkFKJqk
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: X6Ks6eBeFu7jQlD+vRQ225PMgZ7g1mUtc+3TOLAD5U9SgTGYDsNus9G2Zu6DfOthWL2HgHUH0Z
 pIizAmSJ6ZebloRm4hcpdl3qKE3Tg6BBhoAyhM7qnrHYEROVsnk7xxVsIi8Wck8L5yHfMm0g09
 w5ZABeSZfoZr4jlspLPkCEP5SQp1U/U5aRRoEljxdHVgkczWFxWqlWcPva4pWAAOLXbLdUAbuS
 uZQ+TtusKIW/k6y22MHpQ3lfTCEOvEr9E7zYt8vlrEdj9oGGnGZ4jD3GEbc4n+C9U2ED9Nq4Ps
 VJA=
X-SBRS: 2.5
X-MesageID: 29393780
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,378,1596513600"; 
   d="scan'208";a="29393780"
Date: Thu, 15 Oct 2020 12:57:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "J. Roeleveld" <joost@antarean.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: xen-blkback: Scheduled work from previous purge is still busy,
 cannot purge list
Message-ID: <20201015105735.GB67506@Air-de-Roger>
References: <15146361.Z0tdQxPx3m@eve>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <15146361.Z0tdQxPx3m@eve>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Tue, Oct 13, 2020 at 07:26:47AM +0200, J. Roeleveld wrote:
> Hi All,
> 
> I am seeing the following message in the "dmesg" output of a driver domain.
> 
> [Thu Oct  8 20:57:04 2020] xen-blkback: Scheduled work from previous purge is 
> still busy, cannot purge list
> [Thu Oct  8 20:57:11 2020] xen-blkback: Scheduled work from previous purge is 
> still busy, cannot purge list
> [Thu Oct  8 20:57:44 2020] xen-blkback: Scheduled work from previous purge is 
> still busy, cannot purge list
> [Thu Oct  8 20:57:44 2020] xen-blkback: Scheduled work from previous purge is 
> still busy, cannot purge list
> 
> 
> Is this something to worry about? Or can I safely ignore this?

What version of the Linux kernel are you running in that driver
domain?

Is the domain very busy? That might explain the delay in purging
grants.

Also is this an sporadic message, or it's constantly repeating?

Roger.

