Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F03292D53
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 20:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8802.23659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUZZj-0006WU-3W; Mon, 19 Oct 2020 18:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8802.23659; Mon, 19 Oct 2020 18:08:03 +0000
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
	id 1kUZZi-0006W2-Uo; Mon, 19 Oct 2020 18:08:02 +0000
Received: by outflank-mailman (input) for mailman id 8802;
 Mon, 19 Oct 2020 18:08:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kUZZh-0006Vx-BN
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 18:08:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb2e32d7-0909-4613-b0fb-644524ccc002;
 Mon, 19 Oct 2020 18:08:00 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34FB62225F;
 Mon, 19 Oct 2020 18:07:59 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JRC9=D2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kUZZh-0006Vx-BN
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 18:08:01 +0000
X-Inumbo-ID: eb2e32d7-0909-4613-b0fb-644524ccc002
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eb2e32d7-0909-4613-b0fb-644524ccc002;
	Mon, 19 Oct 2020 18:08:00 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 34FB62225F;
	Mon, 19 Oct 2020 18:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603130879;
	bh=szW4QMEKptLRzsjukhcSstsKndsQNBu+FwXo2aGT3yw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bcllUHHWhF30+zcpO3aScHmBmlfHyB90la0fdxkI1lRLJjWsPig/FTkXaC3jxvvQb
	 QufqyJwSmKDJfkylWbhppgE5BrqqhPaACjawDCZuf79v4wJk+5IXSL11bBWzq+Rpp2
	 pBUPunZZE8Ozhw5GOpXGoEuyAsijF4tK6O30FLJM=
Date: Mon, 19 Oct 2020 11:07:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Artem Mygaiev <Artem_Mygaiev@epam.com>
cc: Julien Grall <julien@xen.org>, 
    Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, 
    "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>, 
    "vicooodin@gmail.com" <vicooodin@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "committers@xenproject.org" <committers@xenproject.org>, 
    "viktor.mitin.19@gmail.com" <viktor.mitin.19@gmail.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: Xen Coding style and clang-format
In-Reply-To: <AM6PR03MB3687A99424FA9FD062F5FE4BF4030@AM6PR03MB3687.eurprd03.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2010191101250.12247@sstabellini-ThinkPad-T480s>
References: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com> <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com> <E068C671-8009-4976-87B8-0709F6A5C3BF@citrix.com> <b16dfb26e0916166180d5cbbe95278dc99277330.camel@epam.com> <B64C5E67-7BEA-4C31-9089-AB8CC1F1E80F@citrix.com>
 <3ff3f7d16cdab692178ce638da1a6b880817fb7e.camel@epam.com> <64FE5ADB-2359-4A31-B1A1-925750515D98@citrix.com> <b4d7e9a7-6c25-1f7f-86ce-867083beb81a@suse.com> <4d4f351b152df2c50e18676ccd6ab6b4dc667801.camel@epam.com> <5bd7cc00-c4c9-0737-897d-e76f22e2fd5b@xen.org>
 <AM6PR03MB3687A99424FA9FD062F5FE4BF4030@AM6PR03MB3687.eurprd03.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-844236279-1603130502=:12247"
Content-ID: <alpine.DEB.2.21.2010191102390.12247@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-844236279-1603130502=:12247
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2010191102391.12247@sstabellini-ThinkPad-T480s>

On Fri, 16 Oct 2020, Artem Mygaiev wrote:
> -----Original Message-----
> From: Julien Grall <julien@xen.org> 
> Sent: пятница, 16 октября 2020 г. 13:24
> To: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>; jbeulich@suse.com; George.Dunlap@citrix.com
> Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>; vicooodin@gmail.com; xen-devel@lists.xenproject.org; committers@xenproject.org; viktor.mitin.19@gmail.com; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Subject: Re: Xen Coding style and clang-format
> 
> > Hi,
> >
> > On 16/10/2020 10:42, Anastasiia Lukianenko wrote:
> > > Thanks for your advices, which helped me improve the checker. I
> > > understand that there are still some disagreements about the
> > > formatting, but as I said before, the checker cannot be very flexible
> > > and take into account all the author's ideas.
> >
> > I am not sure what you refer by "author's ideas" here. The checker 
> > should follow a coding style (Xen or a modified version):
> >     - Anything not following the coding style should be considered as 
> > invalid.
> >     - Anything not written in the coding style should be left 
> > untouched/uncommented by the checker.
> >
> 
> Agree
> 
> > > I suggest using the
> > > checker not as a mandatory check, but as an indication to the author of
> > > possible formatting errors that he can correct or ignore.
> >
> > I can understand that short term we would want to make it optional so 
> > either the coding style or the checker can be tuned. But I don't think 
> > this is an ideal situation to be in long term.
> >
> > The goal of the checker is to automatically verify the coding style and 
> > get it consistent across Xen. If we make it optional or it is 
> > "unreliable", then we lose the two benefits and possibly increase the 
> > contributor frustration as the checker would say A but we need B.
> >
> > Therefore, we need to make sure the checker and the coding style match. 
> > I don't have any opinions on the approach to achieve that.
> 
> Of the list of remaining issues from Anastasiia, looks like only items 5
> and 6 are conform to official Xen coding style. As for remainning ones,
> I would like to suggest disabling those that are controversial (items 1,
> 2, 4, 8, 9, 10). Maybe we want to have further discussion on refining 
> coding style, we can use these as starting point. If we are open to
> extending style now, I would suggest to add rules that seem to be
> meaningful (items 3, 7) and keep them in checker.

Good approach. Yes, I would like to keep 3, 7 in the checker.

I would also keep 8 and add a small note to the coding style to say that
comments should be aligned where possible.
--8323329-844236279-1603130502=:12247--

