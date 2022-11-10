Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884A0624D9F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 23:26:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442237.696294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otFzS-0008Ll-0e; Thu, 10 Nov 2022 22:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442237.696294; Thu, 10 Nov 2022 22:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otFzR-0008JQ-Tc; Thu, 10 Nov 2022 22:25:41 +0000
Received: by outflank-mailman (input) for mailman id 442237;
 Thu, 10 Nov 2022 22:25:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+5rg=3K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1otFzQ-0008JK-Kv
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 22:25:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a19ac1b-6146-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 23:25:38 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E80461E72;
 Thu, 10 Nov 2022 22:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDD7C433D6;
 Thu, 10 Nov 2022 22:25:35 +0000 (UTC)
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
X-Inumbo-ID: 9a19ac1b-6146-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668119136;
	bh=OGXpqZOsihHBOHJJuEZehP/mdsP7AIgnzmZBombuNoo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=utz3zyNTDi/CrMVlbfwbTQb01cGtaJMbfSc8LZ+RT1YDldIqcXggd0NXG0k5THw7D
	 3eOXuyNdrILItvyZEz1CSr2ttxE0dpMpc2/ogaOCaL5oR7J1wK96+qUnPF+AaJJ5/F
	 IWFU3VMkprm/m+eHW7ukIYw71dha0pzqOOVXD139n0mkfu3hmGC/ckudPMUDnMQ4Ym
	 5iPPbk7OfMInmR1FUosdnZn5Qez3tDxJFrc2Inx+mIvL1pjNdRd2fXsejN3o4+aTci
	 iheZkMr1oCygj2VP9WUC0GxKyxttKaC9z/4n8/8SBoASw/AqkSScft48QDfvux6jQD
	 4szqh2JDG0w3g==
Date: Thu, 10 Nov 2022 14:25:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <Wei.Chen@arm.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 00/11] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
In-Reply-To: <PAXPR08MB7420AA9428230246BF21D0409E3C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2211101420320.50442@ubuntu-linux-20-04-desktop>
References: <20221104100741.2176307-1-wei.chen@arm.com> <9c3bfa0c-2c8f-2160-46d1-3be234b5bcaf@xen.org> <PAXPR08MB742097DFF1BD4E9BF19B41459E3C9@PAXPR08MB7420.eurprd08.prod.outlook.com> <88c909b5-4cad-aab0-2acd-fb3519963128@xen.org>
 <PAXPR08MB7420AA9428230246BF21D0409E3C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-523053921-1668119039=:50442"
Content-ID: <alpine.DEB.2.22.394.2211101424170.50442@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-523053921-1668119039=:50442
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2211101424171.50442@ubuntu-linux-20-04-desktop>

On Mon, 7 Nov 2022, Wei Chen wrote:
> Hi Julien,
> 
> > -----Original Message-----
> > From: Julien Grall <julien@xen.org>
> > Sent: 2022年11月7日 18:16
> > To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org
> > Cc: nd <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>; Bertrand
> > Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> > <Volodymyr_Babchuk@epam.com>
> > Subject: Re: [PATCH v6 00/11] xen/arm: Add Armv8-R64 MPU support to Xen -
> > Part#1
> > 
> > 
> > 
> > On 07/11/2022 09:52, Wei Chen wrote:
> > > Hi Julien,
> > 
> > Hi,
> > 
> > >
> > >>>    - Supports only a single Security state - Secure.
> > >>>    - MPU in EL1 & EL2 is configurable, MMU in EL1 is configurable.
> > >>>
> > >>> These patch series are implementing the Armv8-R64 MPU support
> > >>> for Xen, which are based on the discussion of
> > >>> "Proposal for Porting Xen to Armv8-R64 - DraftC" [1].
> > >>>
> > >>> We will implement the Armv8-R64 and MPU support in three stages:
> > >>> 1. Boot Xen itself to idle thread, do not create any guests on it.
> > >>
> > >> I read this as I can build Xen and see it boots (not creating domain).
> > >> However... HAS_MPU is not defined and I was expecting mm.c to be
> > >> modified to cater the MPU support. So I am a bit ensure what the series
> > >> is actually doing.
> > >>
> > >
> > > These 11 patches are part#1 of stage#1, the full stage#1 has about 30
> > > patches. We have some concerns if we send so many patches at once, the
> > > review pressure of maintainers may be very high, so we only choose about
> > > 10 to send as part of it. But this also means that we can't do a
> > relatively
> > > complete thing in this part#1 series.
> > >
> > > We want to hear some suggestions from you to make so many patches can be
> > > Reviewed efficiently. Can we send the patches by stages, even the
> > stage#1
> > > will have about 30 patches?
> > 
> > 30 patches in a go is no too bad. I would personally prefer that because
> > at least I have better idea of the shape of the code after stage#1 and
> > also possibly test it (I need to check if I have access for the ARMv8-R
> > model).
> > 
> 
> I also prefer to this way. After we have addressed the comments in
> this series, we will send the full stage#1 patches together in v2.


One suggestion to make things easier to review and to commit is to
organize the series in a way so that the first 10 patches can still be
committed first independently, even if all 30 patches are sent together.

Or alternatively only send 10 patches but also add a link to a
github/gitlab tree with all the 30+ patches so that maintainers can have
a look how the whole work fit together.

I think we are all on the same page -- I just wanted to highlight that
we don't have to finish the review of all 30 patches before we can start
committing some of the initial patches in the series.

Cheers,

Stefano
--8323329-523053921-1668119039=:50442--

