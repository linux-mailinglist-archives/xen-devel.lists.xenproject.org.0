Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF48207C5F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 21:48:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joBO0-0000yH-1n; Wed, 24 Jun 2020 19:48:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uo6N=AF=kaod.org=groug@srs-us1.protection.inumbo.net>)
 id 1joBNy-0000yA-Pd
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 19:48:42 +0000
X-Inumbo-ID: b46648e2-b653-11ea-8135-12813bfff9fa
Received: from 4.mo177.mail-out.ovh.net (unknown [46.105.37.72])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b46648e2-b653-11ea-8135-12813bfff9fa;
 Wed, 24 Jun 2020 19:48:41 +0000 (UTC)
Received: from player694.ha.ovh.net (unknown [10.110.208.202])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id EE1C3138AB8
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 21:48:40 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player694.ha.ovh.net (Postfix) with ESMTPSA id 930B213A32DC1;
 Wed, 24 Jun 2020 19:48:20 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0038a5f312c-448d-4468-8c63-ccc9116a4c59,C444FAC41FF2550221413609A00B1E8A3B07177F)
 smtp.auth=groug@kaod.org
Date: Wed, 24 Jun 2020 21:48:18 +0200
From: Greg Kurz <groug@kaod.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v10 1/9] error: auto propagated local_err
Message-ID: <20200624214818.2f7d7eda@bahia.lan>
In-Reply-To: <87k0zw8ky6.fsf@dusky.pond.sub.org>
References: <20200317151625.20797-1-vsementsov@virtuozzo.com>
 <20200317151625.20797-2-vsementsov@virtuozzo.com>
 <20200610163921.28d824aa@bahia.lan>
 <877dw8dhvk.fsf@dusky.pond.sub.org>
 <20200615083835.54e3fcb1@bahia.lan>
 <87k0zw8ky6.fsf@dusky.pond.sub.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12544776764479609230
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekjedgudefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehkefhtdehgeehheejledufeekhfdvleefvdeihefhkefhudffhfeuuedvffdthfenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 24 Jun 2020 18:53:05 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Greg Kurz <groug@kaod.org> writes:
> 
> > On Mon, 15 Jun 2020 07:21:03 +0200
> > Markus Armbruster <armbru@redhat.com> wrote:
> >
> >> Greg Kurz <groug@kaod.org> writes:
> >> 
> >> > On Tue, 17 Mar 2020 18:16:17 +0300
> >> > Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> >> >
> >> >> Introduce a new ERRP_AUTO_PROPAGATE macro, to be used at start of
> >> >> functions with an errp OUT parameter.
> >> >> 
> >> >> It has three goals:
> >> >> 
> >> >> 1. Fix issue with error_fatal and error_prepend/error_append_hint: user
> >> >> can't see this additional information, because exit() happens in
> >> >> error_setg earlier than information is added. [Reported by Greg Kurz]
> >> >> 
> >> >
> >> > I have more of these coming and I'd really like to use ERRP_AUTO_PROPAGATE.
> >> >
> >> > It seems we have a consensus on the macro itself but this series is gated
> >> > by the conversion of the existing code base.
> >> >
> >> > What about merging this patch separately so that people can start using
> >> > it at least ?
> >> 
> >> Please give me a few more days to finish the work I feel should go in
> >> before the conversion.  With any luck, Vladimir can then rebase /
> >> recreate the conversion easily, and you can finally use the macro for
> >> your own work.
> >> 
> >
> > Sure. Thanks.
> 
> Just posted "[PATCH 00/46] Less clumsy error checking".  The sheer size
> of the thing and the length of its dependency chain explains why it took
> me so long.  I feel bad about delaying you all the same.  Apologies!
> 

No problem. This series of yours is impressive. Putting an end to the
highjacking of the Error ** argument is really a beneficial move.

> I hope we can converge quickly enough to get Vladimir's work on top
> ready in time for the soft freeze.
> 

I'll find some cycles for reviewing.

Cheers,

--
Greg

