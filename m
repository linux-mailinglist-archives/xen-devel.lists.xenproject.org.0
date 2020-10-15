Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B181428F2B7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 14:54:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7335.19170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT2lI-0003YV-BF; Thu, 15 Oct 2020 12:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7335.19170; Thu, 15 Oct 2020 12:53:40 +0000
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
	id 1kT2lI-0003Y6-7Z; Thu, 15 Oct 2020 12:53:40 +0000
Received: by outflank-mailman (input) for mailman id 7335;
 Thu, 15 Oct 2020 12:53:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XL1Z=DW=antarean.org=joost@srs-us1.protection.inumbo.net>)
 id 1kT2lG-0003Y1-51
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 12:53:38 +0000
Received: from gw2.antarean.org (unknown [141.105.125.208])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id fc9733cf-f725-4f1e-81ee-b3ccdbef88c1;
 Thu, 15 Oct 2020 12:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by gw2.antarean.org (Postfix) with ESMTP id 4CBq1h1nBxz8tkM
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 14:52:24 +0200 (CEST)
Received: from gw2.antarean.org ([127.0.0.1])
 by localhost (gw2.antarean.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eeUkXdmHvTkw for <xen-devel@lists.xenproject.org>;
 Thu, 15 Oct 2020 14:52:23 +0200 (CEST)
Received: from mailstore1.adm.antarean.org (localhost [127.0.0.1])
 by gw2.antarean.org (Postfix) with ESMTP id 4CBq1g6KLRz8tk5
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 14:52:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mailstore1.adm.antarean.org (Postfix) with ESMTP id 4CBq326p4kz15
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 14:53:34 +0200 (CEST)
Received: from mailstore1.adm.antarean.org ([127.0.0.1])
 by localhost (mailstore1.adm.antarean.org [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id NnSy03VyNqjT for <xen-devel@lists.xenproject.org>;
 Thu, 15 Oct 2020 14:53:34 +0200 (CEST)
Received: from eve.localnet (eve.adm.antarean.org [10.55.16.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailstore1.adm.antarean.org (Postfix) with ESMTPSA id 4CBq324zyLz13
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 14:53:34 +0200 (CEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=XL1Z=DW=antarean.org=joost@srs-us1.protection.inumbo.net>)
	id 1kT2lG-0003Y1-51
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 12:53:38 +0000
X-Inumbo-ID: fc9733cf-f725-4f1e-81ee-b3ccdbef88c1
Received: from gw2.antarean.org (unknown [141.105.125.208])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id fc9733cf-f725-4f1e-81ee-b3ccdbef88c1;
	Thu, 15 Oct 2020 12:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by gw2.antarean.org (Postfix) with ESMTP id 4CBq1h1nBxz8tkM
	for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 14:52:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at antarean.org
Received: from gw2.antarean.org ([127.0.0.1])
	by localhost (gw2.antarean.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eeUkXdmHvTkw for <xen-devel@lists.xenproject.org>;
	Thu, 15 Oct 2020 14:52:23 +0200 (CEST)
Received: from mailstore1.adm.antarean.org (localhost [127.0.0.1])
	by gw2.antarean.org (Postfix) with ESMTP id 4CBq1g6KLRz8tk5
	for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 14:52:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailstore1.adm.antarean.org (Postfix) with ESMTP id 4CBq326p4kz15
	for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 14:53:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at antarean.org
Received: from mailstore1.adm.antarean.org ([127.0.0.1])
	by localhost (mailstore1.adm.antarean.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NnSy03VyNqjT for <xen-devel@lists.xenproject.org>;
	Thu, 15 Oct 2020 14:53:34 +0200 (CEST)
Received: from eve.localnet (eve.adm.antarean.org [10.55.16.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailstore1.adm.antarean.org (Postfix) with ESMTPSA id 4CBq324zyLz13
	for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 14:53:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=antarean.org;
	s=default; t=1602766414;
	bh=+hh6XDUEdDVtijGf5bFRgqI40uvDb4OzhbSJygUVZgU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Hl6aQBYzwWuJssLJNCuEpoFdPC+lIVXfH5Z2mLSazkWB5vuuR33rrh/johz1loPSM
	 0MB1PaZ+MFgi4oooG1e/udNk/G2erDNSQmalLXi9NfNidRBTitsVZp/bp8lD4Db07h
	 ci6hoJ15LFXqzvBKHV6FZNqrsJ4Z+AwniPdQw/9s=
From: "J. Roeleveld" <joost@antarean.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: xen-blkback: Scheduled work from previous purge is still busy, cannot purge list
Date: Thu, 15 Oct 2020 14:53:34 +0200
Message-ID: <11618501.OP9n9qO8XQ@eve>
Organization: Antarean
In-Reply-To: <20201015120046.GE19243@Air-de-Roger>
References: <15146361.Z0tdQxPx3m@eve> <1855015.FeAb16qnYt@eve> <20201015120046.GE19243@Air-de-Roger>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday, October 15, 2020 2:00:46 PM CEST Roger Pau Monn=E9 wrote:
> Please don't drop xen-devel mailing list when replying.

My apologies, most mailing lists I am active on have a working "reply" butt=
on.=20
Here I need to use "reply-all".


> On Thu, Oct 15, 2020 at 01:28:49PM +0200, J. Roeleveld wrote:
> > On Thursday, October 15, 2020 12:57:35 PM CEST you wrote:
> > > On Tue, Oct 13, 2020 at 07:26:47AM +0200, J. Roeleveld wrote:
> > > > Hi All,
> > > >=20
> > > > I am seeing the following message in the "dmesg" output of a driver
> > > > domain.
> > > >=20
> > > > [Thu Oct  8 20:57:04 2020] xen-blkback: Scheduled work from previous
> > > > purge
> > > > is still busy, cannot purge list
> > > > [Thu Oct  8 20:57:11 2020] xen-blkback: Scheduled work from previous
> > > > purge
> > > > is still busy, cannot purge list
> > > > [Thu Oct  8 20:57:44 2020] xen-blkback: Scheduled work from previous
> > > > purge
> > > > is still busy, cannot purge list
> > > > [Thu Oct  8 20:57:44 2020] xen-blkback: Scheduled work from previous
> > > > purge
> > > > is still busy, cannot purge list
> > > >=20
> > > >=20
> > > > Is this something to worry about? Or can I safely ignore this?
> > >=20
> > > What version of the Linux kernel are you running in that driver
> > > domain?
> >=20
> > Host:
> > Kernel: 5.4.66
> > Xen: 4.12.3
> >=20
> > Driver domain:
> > Kernel: 5.4.66
> > Xen: 4.12.3
> >=20
> > > Is the domain very busy? That might explain the delay in purging
> > > grants.
> >=20
> > No, it's generally asleep, been going through the munin-records and can=
't
> > find any spikes the correlate with the messages either.
> >=20
> > > Also is this an sporadic message, or it's constantly repeating?
> >=20
> > It's sporadic, but occasionally, I get it several times in a row.
> >=20
> > My understanding of the code where this message comes from is far from
> > sufficient. Which means I have no clue what it is actually trying to do.
>=20
> There's a recurrent worker thread in blkback that will go and purge
> unused cache entries after they have expired. This is done to prevent
> the cache from growing unbounded.
>=20
> AFAICT this just means the worker is likely running faster than what
> you can proceed, and hence you get another worker run before the old
> entries have been removed. Should be safe to ignore, but makes me
> wonder if I should add a parameter to tune the periodicity of the
> purge work.

In other words, when it "fails" in this manner, the queue will simply be le=
ft=20
and processed the next time?

How often does this currently run?

A parameter to tune the periodicity might be an option, for now I feel=20
confident I can safely ignore these messages.

Thanks,

Joost



