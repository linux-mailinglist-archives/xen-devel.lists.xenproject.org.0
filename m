Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A22220799F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 18:54:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo8eK-00019z-Va; Wed, 24 Jun 2020 16:53:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SMP2=AF=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jo8eJ-00019t-2f
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 16:53:23 +0000
X-Inumbo-ID: 36007e40-b63b-11ea-b7bb-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 36007e40-b63b-11ea-b7bb-bc764e2007e4;
 Wed, 24 Jun 2020 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593017601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WvZEfGLkbje2PmwPmlxywRP8vofYtAWH0NIC79T30BQ=;
 b=T5u8+bJK7xVfhUp6hnp3J648p9aPi81ToJQuwMR6b1Y9KikBdmb6EJ9UqvLnVJDtMg4481
 aZC71YfLPLQbGDUhDK4mmC8PqHahtvdQZKgaVI81+f/RbeKJBs59lcSU+9bIKo9fYY9eUZ
 d+pIqQ2QsVkoszLakIPL5G42dYF0y04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-fhQgBarZM0CRByrgSGD7Rg-1; Wed, 24 Jun 2020 12:53:17 -0400
X-MC-Unique: fhQgBarZM0CRByrgSGD7Rg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E474107ACCD;
 Wed, 24 Jun 2020 16:53:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 375B65C66E;
 Wed, 24 Jun 2020 16:53:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B781A11384D4; Wed, 24 Jun 2020 18:53:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v10 1/9] error: auto propagated local_err
References: <20200317151625.20797-1-vsementsov@virtuozzo.com>
 <20200317151625.20797-2-vsementsov@virtuozzo.com>
 <20200610163921.28d824aa@bahia.lan>
 <877dw8dhvk.fsf@dusky.pond.sub.org>
 <20200615083835.54e3fcb1@bahia.lan>
Date: Wed, 24 Jun 2020 18:53:05 +0200
In-Reply-To: <20200615083835.54e3fcb1@bahia.lan> (Greg Kurz's message of "Mon, 
 15 Jun 2020 08:38:35 +0200")
Message-ID: <87k0zw8ky6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Greg Kurz <groug@kaod.org> writes:

> On Mon, 15 Jun 2020 07:21:03 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Greg Kurz <groug@kaod.org> writes:
>> 
>> > On Tue, 17 Mar 2020 18:16:17 +0300
>> > Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>> >
>> >> Introduce a new ERRP_AUTO_PROPAGATE macro, to be used at start of
>> >> functions with an errp OUT parameter.
>> >> 
>> >> It has three goals:
>> >> 
>> >> 1. Fix issue with error_fatal and error_prepend/error_append_hint: user
>> >> can't see this additional information, because exit() happens in
>> >> error_setg earlier than information is added. [Reported by Greg Kurz]
>> >> 
>> >
>> > I have more of these coming and I'd really like to use ERRP_AUTO_PROPAGATE.
>> >
>> > It seems we have a consensus on the macro itself but this series is gated
>> > by the conversion of the existing code base.
>> >
>> > What about merging this patch separately so that people can start using
>> > it at least ?
>> 
>> Please give me a few more days to finish the work I feel should go in
>> before the conversion.  With any luck, Vladimir can then rebase /
>> recreate the conversion easily, and you can finally use the macro for
>> your own work.
>> 
>
> Sure. Thanks.

Just posted "[PATCH 00/46] Less clumsy error checking".  The sheer size
of the thing and the length of its dependency chain explains why it took
me so long.  I feel bad about delaying you all the same.  Apologies!

I hope we can converge quickly enough to get Vladimir's work on top
ready in time for the soft freeze.


