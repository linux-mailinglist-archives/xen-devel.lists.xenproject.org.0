Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CCB2CCDD0
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 05:15:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43094.77528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkg1K-0004Fc-5M; Thu, 03 Dec 2020 04:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43094.77528; Thu, 03 Dec 2020 04:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkg1K-0004FD-2A; Thu, 03 Dec 2020 04:15:06 +0000
Received: by outflank-mailman (input) for mailman id 43094;
 Thu, 03 Dec 2020 04:15:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Inx=FH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kkg1J-0004F8-7q
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 04:15:05 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c26f19a-211d-4100-af01-046564eb50a3;
 Thu, 03 Dec 2020 04:15:04 +0000 (UTC)
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
X-Inumbo-ID: 1c26f19a-211d-4100-af01-046564eb50a3
Date: Wed, 2 Dec 2020 20:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1606968903;
	bh=gSvh4WPDu46VitPbr/c3ps4QYUgcgZCVWP8di2342no=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=VsBE3nogPVuFPtaAKebL4wxwuXVWwh41J4T0iRzhMNQKbt4RugSvj27vX1D4VfY0b
	 r5icQH52RD4MV1W3a0Ye5fvfnC8t/ttPq1REiFBkQ5KCeKaqgHanL+P5ck6GUqFt+j
	 r6bQdNa9zdwuXKOPuX+5ypql3WhWzIeUC01wi+RMl4mf+M+WhH/VxT4bDiGr84W8Ec
	 jkL1sSAlEvNkKXJSUKaKDLI0H/k1O1iy+1qtRlZYkmn6sUFuiFbUGNlg2QfFOmTP5E
	 m5J8Ofl/PpJ0pCV327iceXGGHhgIsd0JNy863J7M5xVwWq5Ez1Uuce5vRIzBE0KLfp
	 T5t7VJ5uv3AYQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <Wei.Chen@arm.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Penny Zheng <Penny.Zheng@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andre Przywara <Andre.Przywara@arm.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, 
    nd <nd@arm.com>
Subject: RE: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
In-Reply-To: <DB7PR08MB3753C88E41582E76E3C9049F9EF20@DB7PR08MB3753.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2012022014270.30425@sstabellini-ThinkPad-T480s>
References: <20201109082110.1133996-1-penny.zheng@arm.com> <cfa63398-8182-b79f-1602-ed068e2319ad@xen.org> <AM0PR08MB3747B42FC856B9BDF24646629EE60@AM0PR08MB3747.eurprd08.prod.outlook.com> <alpine.DEB.2.21.2011251554070.7979@sstabellini-ThinkPad-T480s>
 <AM0PR08MB3747912905438DA6D7FF969C9EF90@AM0PR08MB3747.eurprd08.prod.outlook.com> <8f47313a-f47a-520d-3845-3f2198fce5b4@xen.org> <AM0PR08MB37478D884057C8720ED1023D9EF90@AM0PR08MB3747.eurprd08.prod.outlook.com> <0a272ffd-24de-2db4-5751-9161cc57cec3@xen.org>
 <DB7PR08MB3753C88E41582E76E3C9049F9EF20@DB7PR08MB3753.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1698463917-1606968903=:30425"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1698463917-1606968903=:30425
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 3 Dec 2020, Wei Chen wrote:
> Hi Julien,
> 
> > -----Original Message-----
> > From: Julien Grall <julien@xen.org>
> > Sent: 2020年12月3日 2:11
> > To: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
> > Andre Przywara <Andre.Przywara@arm.com>; Bertrand Marquis
> > <Bertrand.Marquis@arm.com>; Kaly Xin <Kaly.Xin@arm.com>; nd
> > <nd@arm.com>
> > Subject: Re: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
> > 
> > 
> > 
> > On 26/11/2020 11:27, Wei Chen wrote:
> > > Hi Julien,
> > 
> > Hi Wei,
> > 
> > >> -----Original Message-----
> > >> From: Julien Grall <julien@xen.org>
> > >> Sent: 2020年11月26日 18:55
> > >> To: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
> > <sstabellini@kernel.org>
> > >> Cc: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
> > >> Andre Przywara <Andre.Przywara@arm.com>; Bertrand Marquis
> > >> <Bertrand.Marquis@arm.com>; Kaly Xin <Kaly.Xin@arm.com>; nd
> > >> <nd@arm.com>
> > >> Subject: Re: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
> > >>
> > >> Hi Wei,
> > >>
> > >> Your e-mail font seems to be different to the usual plain text one. Are
> > >> you sending the e-mail using HTML by any chance?
> > >>
> > >
> > > It's strange, I always use the plain text.
> > 
> > Maybe exchange decided to mangle the e-mail :). Anyway, this new message
> > looks fine.
> > 
> > >
> > >> On 26/11/2020 02:07, Wei Chen wrote:
> > >>> Hi Stefano,
> > >>>
> > >>>> -----Original Message-----
> > >>>> From: Stefano Stabellini <sstabellini@kernel.org>
> > >>>> Sent: 2020??????11??????26?????? 8:00
> > >>>> To: Wei Chen <Wei.Chen@arm.com>
> > >>>> Cc: Julien Grall <julien@xen.org>; Penny Zheng <Penny.Zheng@arm.com>;
> > >> xen-
> > >>>> devel@lists.xenproject.org; sstabellini@kernel.org; Andre Przywara
> > >>>> <Andre.Przywara@arm.com>; Bertrand Marquis
> > >> <Bertrand.Marquis@arm.com>;
> > >>>> Kaly Xin <Kaly.Xin@arm.com>; nd <nd@arm.com>
> > >>>> Subject: RE: [PATCH] xen/arm: Add Cortex-A73 erratum 858921
> > workaround
> > >>>>
> > >>>> Resuming this old thread.
> > >>>>
> > >>>> On Fri, 13 Nov 2020, Wei Chen wrote:
> > >>>>>> Hi,
> > >>>>>>
> > >>>>>> On 09/11/2020 08:21, Penny Zheng wrote:
> > >>>>>>> CNTVCT_EL0 or CNTPCT_EL0 counter read in Cortex-A73 (all versions)
> > >>>>>>> might return a wrong value when the counter crosses a 32bit boundary.
> > >>>>>>>
> > >>>>>>> Until now, there is no case for Xen itself to access CNTVCT_EL0,
> > >>>>>>> and it also should be the Guest OS's responsibility to deal with
> > >>>>>>> this part.
> > >>>>>>>
> > >>>>>>> But for CNTPCT, there exists several cases in Xen involving reading
> > >>>>>>> CNTPCT, so a possible workaround is that performing the read twice,
> > >>>>>>> and to return one or the other depending on whether a transition has
> > >>>>>>> taken place.
> > >>>>>>>
> > >>>>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > >>>>>>
> > >>>>>> Acked-by: Julien Grall <jgrall@amazon.com>
> > >>>>>>
> > >>>>>> On a related topic, do we need a fix similar to Linux commit
> > >>>>>> 75a19a0202db "arm64: arch_timer: Ensure counter register reads occur
> > >>>>>> with seqlock held"?
> > >>>>>>
> > >>>>>
> > >>>>> I take a look at this Linux commit, it seems to prevent the seq-lock to be
> > >>>>> speculated.  Using an enforce ordering instead of ISB after the read
> > counter
> > >>>>> operation seems to be for performance reasons.
> > >>>>>
> > >>>>> I have found that you had placed an ISB before read counter in get_cycles
> > >>>>> to prevent counter value to be speculated. But you haven't placed the
> > >> second
> > >>>>> ISB after reading. Is it because we haven't used the get_cycles in seq lock
> > >>>>> critical context (Maybe I didn't find the right place)? So should we need to
> > >> fix it
> > >>>>> now, or you prefer to fix it now for future usage?
> > >>>>
> > >>>> Looking at the call sites, it doesn't look like we need any ISB after
> > >>>> get_cycles as it is not used in any critical context. There is also a
> > >>>> data dependency with the value returned by it.
> > >>
> > >> I am assuming you looked at all the users of NOW(). Is that right?
> > >>
> > >>>>
> > >>>> So I am thinking we don't need any fix. At most we need an in-code
> > comment?
> > >>>
> > >>> I agree with you to add an in-code comment. It will remind us in future
> > when
> > >> we
> > >>> use the get_cycles in critical context. Adding it now will probably only lead
> > to
> > >>> meaningless performance degradation.
> > >>
> > >> I read this as there would be no perfomance impact if we add the
> > >> ordering it now. Did you intend to say?
> > >
> > > Sorry about my English. I intended to say "Adding it now may introduce some
> > > performance cost. And this performance cost may be not worth. Because Xen
> > > may never use it in a similar scenario "
> > 
> > Don't worry! I think the performance should not be noticeable if we use
> > the same trick as Linux.
> > 
> > >> In addition, AFAICT, the x86 version of get_cycles() is already able to
> > >> provide that ordering. So there are chances that code may rely on it.
> > >>
> > >> While I don't necessarily agree to add barriers everywhere by default
> > >> (this may have big impact on the platform). I think it is better to have
> > >> an accurate number of cycles.
> > >>
> > >
> > > As x86 had done it, I think it’s ok to do it for Arm. This will keep a function
> > > behaves the same on different architectures.
> > 
> > Just to be clear, I am not 100% sure this is what Intel is doing.
> > Although this is my understanding of the comment in the code.
> > 
> > @Stefano, what do you think?
> > 
> > @Wei, assuming Stefano is happy with the proposal, would you be happy to
> > send a patch for that?
> > 
> 
> Of  course, I am willing to do that. It seems the enforce_ordering patch has been
> merged. And Vincenzo reported the enforce_ordering method will have ~4.5
> performance improvement[1] (Compare to ISB). So I will use enforce_ordering
> method directly instead of using ISB.
> 
> [1]https://lkml.org/lkml/2020/3/13/645

If we can enforce ordering without adding an ISB, I am all for it.
--8323329-1698463917-1606968903=:30425--

