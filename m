Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 862041F8DFB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 08:40:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkilm-0001VE-JD; Mon, 15 Jun 2020 06:38:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cxX1=74=kaod.org=groug@srs-us1.protection.inumbo.net>)
 id 1jkill-0001V8-1S
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 06:38:57 +0000
X-Inumbo-ID: e26584ac-aed2-11ea-bb8b-bc764e2007e4
Received: from 6.mo179.mail-out.ovh.net (unknown [46.105.56.76])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e26584ac-aed2-11ea-bb8b-bc764e2007e4;
 Mon, 15 Jun 2020 06:38:55 +0000 (UTC)
Received: from player789.ha.ovh.net (unknown [10.110.103.168])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id AED6B16F830
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 08:38:54 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id 4707A136379BC;
 Mon, 15 Jun 2020 06:38:36 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0023cd0aa35-8cad-4a04-9371-86d222787d89,F1BB0E26B38E3581C3F8E07DA172D6E56B46BED4)
 smtp.auth=groug@kaod.org
Date: Mon, 15 Jun 2020 08:38:35 +0200
From: Greg Kurz <groug@kaod.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v10 1/9] error: auto propagated local_err
Message-ID: <20200615083835.54e3fcb1@bahia.lan>
In-Reply-To: <877dw8dhvk.fsf@dusky.pond.sub.org>
References: <20200317151625.20797-1-vsementsov@virtuozzo.com>
 <20200317151625.20797-2-vsementsov@virtuozzo.com>
 <20200610163921.28d824aa@bahia.lan>
 <877dw8dhvk.fsf@dusky.pond.sub.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1692509037167942030
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudeijedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehkefhtdehgeehheejledufeekhfdvleefvdeihefhkefhudffhfeuuedvffdthfenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 15 Jun 2020 07:21:03 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Greg Kurz <groug@kaod.org> writes:
> 
> > On Tue, 17 Mar 2020 18:16:17 +0300
> > Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> >
> >> Introduce a new ERRP_AUTO_PROPAGATE macro, to be used at start of
> >> functions with an errp OUT parameter.
> >> 
> >> It has three goals:
> >> 
> >> 1. Fix issue with error_fatal and error_prepend/error_append_hint: user
> >> can't see this additional information, because exit() happens in
> >> error_setg earlier than information is added. [Reported by Greg Kurz]
> >> 
> >
> > I have more of these coming and I'd really like to use ERRP_AUTO_PROPAGATE.
> >
> > It seems we have a consensus on the macro itself but this series is gated
> > by the conversion of the existing code base.
> >
> > What about merging this patch separately so that people can start using
> > it at least ?
> 
> Please give me a few more days to finish the work I feel should go in
> before the conversion.  With any luck, Vladimir can then rebase /
> recreate the conversion easily, and you can finally use the macro for
> your own work.
> 

Sure. Thanks.

