Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2913F53AB31
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 18:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340557.565615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRRe-0005aL-Ao; Wed, 01 Jun 2022 16:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340557.565615; Wed, 01 Jun 2022 16:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRRe-0005Wu-7m; Wed, 01 Jun 2022 16:43:42 +0000
Received: by outflank-mailman (input) for mailman id 340557;
 Wed, 01 Jun 2022 16:43:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwRRc-0005Wo-Tx
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 16:43:41 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcbf564f-e1c9-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 18:43:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D190CB81B73;
 Wed,  1 Jun 2022 16:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D1BC385A5;
 Wed,  1 Jun 2022 16:43:32 +0000 (UTC)
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
X-Inumbo-ID: fcbf564f-e1c9-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654101816;
	bh=mx+qXncMxZL9JnjxIZL2AAlRK7lGwqN0UNQ3EUO+JoM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kJts6fHqYZZN9Dtjjh0rFPTXFX4mluKKKhg+g1an849pE5IqzsH/ioDLtsP2T1Vym
	 I+D0Q0+3bcghY60tV8VT9/l/siaM28Em36eklVCC3kb4P3rUwbao9vGwwSFBrg/zLR
	 c6D/Kp76hOKNGPbxRz0HsJ1J+IHtpZFGbhoyGxf3UdwlsHiaSAuxq8wzEQNv6YQvLF
	 /oSeM2G0nycErBzug9yRCpmuP5Smvp0WDR90MfhkZOxhICw/5mImHpQvlM/45JO2Bs
	 DUysjf3O9itWJLpjLhXVyvErIg0mydaM8XnAaPqzkQ5NhV9ulqC1AVel1Z9syRSB8d
	 gghNuXBZzm0Cg==
Date: Wed, 1 Jun 2022 09:43:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <George.Dunlap@citrix.com>
cc: xen-devel <xen-devel@lists.xenproject.org>, 
    Tamas K Lengyel <tamas.k.lengyel@gmail.com>, 
    "intel-xen@intel.com" <intel-xen@intel.com>, 
    "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, 
    Roger Pau Monne <roger.pau@citrix.com>, 
    Sergey Dyasli <sergey.dyasli@citrix.com>, 
    Christopher Clark <christopher.w.clark@gmail.com>, 
    Rich Persaud <persaur@gmail.com>, 
    Kevin Pearson <kevin.pearson@ortmanconsulting.com>, 
    Juergen Gross <jgross@suse.com>, 
    =?UTF-8?Q?Paul_Durrant=C2=A0?= <pdurrant@amazon.com>, 
    "Ji, John" <john.ji@intel.com>, 
    "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, 
    "robin.randhawa@arm.com" <robin.randhawa@arm.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, 
    Matt Spencer <Matt.Spencer@arm.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Rian Quinn <rianquinn@gmail.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    "=?UTF-8?Q?=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B?=
 =?UTF-8?Q?Doug_Goldstein?=" <cardoe@cardoe.com>, 
    David Woodhouse <dwmw@amazon.co.uk>, 
    =?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>, 
    "=?UTF-8?Q?=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B?=
 =?UTF-8?Q?Varad_Gautam?=" <varadgautam@gmail.com>, 
    Brian Woods <brian.woods@xilinx.com>, 
    Robert Townley <rob.townley@gmail.com>, 
    Bobby Eshleman <bobby.eshleman@gmail.com>, 
    "=?UTF-8?Q?=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B?=
 =?UTF-8?Q?Corey_Minyard?=" <cminyard@mvista.com>, 
    Olivier Lambert <olivier.lambert@vates.fr>, 
    Andrew Cooper <Andrew.Cooper3@citrix.com>, 
    Ash Wilding <ash.j.wilding@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>, 
    =?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>, 
    Brendan Kerrigan <brendank310@gmail.com>, 
    "Thierry Laurion (Insurgo)" <insurgo@riseup.net>, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Deepthi <deepthi.m@ltts.com>, Scott Davis <scottwd@gmail.com>, 
    Ben Boyd <ben@exotanium.io>, Anthony Perard <anthony.perard@citrix.com>, 
    Michal Orzel <michal.orzel@arm.com>
Subject: Re: MOVING COMMUNITY CALL Call for agenda items for 9 June Community
 Call @ 1500 UTC
In-Reply-To: <CC75A251-2695-4E9E-95A7-043874B22F32@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2206010942010.1905099@ubuntu-linux-20-04-desktop>
References: <CC75A251-2695-4E9E-95A7-043874B22F32@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

I would like to suggest to have the MISRA C meeting just before the
community call (7AM California time). If it is difficult for any of the
must-have attendees, then I would like to ask to reserve 30 minutes of
the community call to make progress on MISRA.

Cheers,

Stefano


On Wed, 1 Jun 2022, George Dunlap wrote:
> Hi all,
> 
> Sorry for sending this out so late; my calendar was screwed up.  Due to it being a public holiday in the UK, I propose moving the monthly community call to NEXT THURSDAY, 9 June, same time.
> 
> The proposed agenda is in https://cryptpad.fr/pad/#/2/pad/edit/URCDNNBOVKsEK2grXf2l954a/ and you can edit to add items.  Alternatively, you can reply to this mail directly.
> 
> Agenda items appreciated a few days before the call: please put your name besides items if you edit the document.
> 
> Note the following administrative conventions for the call:
> * Unless, agreed in the pervious meeting otherwise, the call is on the 1st Thursday of each month at 1600 British Time (either GMT or BST)
> * I usually send out a meeting reminder a few days before with a provisional agenda
> 
> * To allow time to switch between meetings, we'll plan on starting the agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate time to sort out technical difficulties &c
> 
> * If you want to be CC'ed please add or remove yourself from the sign-up-sheet at https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/
> 
> Best Regards
> George
> 
> 
> 
> == Dial-in Information ==
> ## Meeting time
> 15:00 - 16:00 UTC
> Further International meeting times: https://www.timeanddate.com/worldclock/meetingdetails.html?year=2022&month=06&day=9&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179
> 
> 
> ## Dial in details
> Web: https://meet.jit.si/XenProjectCommunityCall
> 
> Dial-in info and pin can be found here:
> 
> https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall
> 

