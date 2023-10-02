Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 415847B5BE0
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 22:15:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611776.951333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnPJZ-0000iT-3M; Mon, 02 Oct 2023 20:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611776.951333; Mon, 02 Oct 2023 20:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnPJY-0000gP-WA; Mon, 02 Oct 2023 20:14:48 +0000
Received: by outflank-mailman (input) for mailman id 611776;
 Mon, 02 Oct 2023 20:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oggk=FQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnPJW-0000gJ-PK
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 20:14:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 521abaa3-6160-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 22:14:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BCD5460FC0;
 Mon,  2 Oct 2023 20:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B51AC433C7;
 Mon,  2 Oct 2023 20:14:33 +0000 (UTC)
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
X-Inumbo-ID: 521abaa3-6160-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696277680;
	bh=EFUP4AUZRbPJ/yXKF9p2686Y/gW+J0Kf2ruEn/wm7iE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RBmn6ADeHCs0ER6kmJ711Ak7ZUEE3h0UTBepl89aZiPpBTOLYYiX2IWy3dAr1kk/j
	 O4QbTGGiNHJz6p/NVRQ7bugWWKZS5Irj1951KUh12yXh2Dv2CGcS5jkVC1DQVzxhWY
	 SXp17krTAJD8sPb+WsJrUYL8lvbFFWHvPQh+HvFoZEjfdqO5mfe0gpd8KUlpUahFBo
	 j30hCECqd+S5U9Ipeo5AC5+/bBofoR3OSGdRUyMQeM8jY4WRn/CuQsQcwCSKQSvg+5
	 pcAMfVE939RAVmAR4nRvQuAMvsGPQgaw0jrFZMcNmT5VZdgBi+CaGANQkoH8YQSQyB
	 XdPhfwbQxRh4g==
Date: Mon, 2 Oct 2023 13:14:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <george.dunlap@cloud.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Tamas K Lengyel <tamas.k.lengyel@gmail.com>, 
    "intel-xen@intel.com" <intel-xen@intel.com>, 
    "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, 
    Roger Pau Monne <roger.pau@citrix.com>, 
    Sergey Dyasli <sergey.dyasli@citrix.com>, 
    Christopher Clark <christopher.w.clark@gmail.com>, 
    Rich Persaud <persaur@gmail.com>, 
    Kevin Pearson <kevin.pearson@ortmanconsulting.com>, 
    Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>, 
    "Ji, John" <john.ji@intel.com>, 
    "robin.randhawa@arm.com" <robin.randhawa@arm.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, 
    Matt Spencer <Matt.Spencer@arm.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@amd.com>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Rian Quinn <rianquinn@gmail.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    "=?UTF-8?Q?=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B?=
 =?UTF-8?Q?Doug_Goldstein?=" <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
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
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Ash Wilding <ash.j.wilding@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>, 
    =?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>, 
    Brendan Kerrigan <brendank310@gmail.com>, 
    Thierry Laurion <insurgo@riseup.net>, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Scott Davis <scottwd@gmail.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Marc Ungeschikts <marc.ungeschikts@vates.fr>, 
    Zhiming Shen <zshen@exotanium.io>, 
    Xenia Ragiadakou <burzalodowa@gmail.com>, 
    =?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLSGVucnkgV2FuZw==?= <Henry.Wang@arm.com>, 
    Per Bilse <per.bilse@citrix.com>, Samuel Verschelde <stormi-xcp@ylix.fr>, 
    Andrei Semenov <andrei.semenov@vates.fr>, 
    Yann Dirson <yann.dirson@vates.fr>, 
    Bernhard Kaindl <bernhard.kaindl@cloud.com>, 
    "=?UTF-8?Q?=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B?=
 =?UTF-8?Q?Luca_Fancellu?=" <luca.fancellu@arm.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Vikram Garhwal <vikram.garhwal@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    Kelly Choi <kelly.choi@cloud.com>, 
    Vaishali Thakkar <me.vaishalithakkar@gmail.com>, 
    Sebastien.Regimbal@microchip.com
Subject: Re: [ANNOUNCE] Call for agenda items for 5 October Community Call
 @ 1500 UTC
In-Reply-To: <CA+zSX=bSmA+NMgZTdgeDshy2p91br3RgS0j6+2973Z22u+7Ngw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2310021314250.2348112@ubuntu-linux-20-04-desktop>
References: <CA+zSX=bSmA+NMgZTdgeDshy2p91br3RgS0j6+2973Z22u+7Ngw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi George,

Sebastien and others at Microchip would like to give an update about
their progress with Xen on RISC-V.

Cheers,

Stefano


On Mon, 2 Oct 2023, George Dunlap wrote:
> Hi all,
> 
> The proposed agenda is in
> https://cryptpad.fr/pad/#/2/pad/edit/cQBSSCUBQj9es3-wcs7I+8Em/ and you
> can edit to add items.  Alternatively, you can reply to this mail
> directly.  I'll be running the meeting while Kelly is on PTO.
> 
> Agenda items appreciated a few days before the call: please put your
> name besides items if you edit the document.
> 
> Note the following administrative conventions for the call:
> * Unless, agreed in the previous meeting otherwise, the call is on the
> 1st Thursday of each month at 1600 British Time (either GMT or BST)
> * I usually send out a meeting reminder a few days before with a
> provisional agenda
> 
> * To allow time to switch between meetings, we'll plan on starting the
> agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate
> time to sort out technical difficulties &c
> 
> * If you want to be CC'ed please add or remove yourself from the
> sign-up-sheet at
> https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/
> 
> Best Regards
> George
> 
> 
> == Dial-in Information ==
> ## Meeting time
> 16:00 - 17:00 British time
> Further International meeting times:
> https://www.timeanddate.com/worldclock/meetingdetails.html?year=2023&month=10&day=5&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179
> 
> 
> ## Dial in details
> Web: https://meet.jit.si/XenProjectCommunityCall
> 
> Dial-in info and pin can be found here:
> 
> https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall
> 

