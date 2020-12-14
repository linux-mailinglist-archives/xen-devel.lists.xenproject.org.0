Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC562D9D89
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 18:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52476.91513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koraN-0003nD-FO; Mon, 14 Dec 2020 17:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52476.91513; Mon, 14 Dec 2020 17:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koraN-0003mo-CM; Mon, 14 Dec 2020 17:24:35 +0000
Received: by outflank-mailman (input) for mailman id 52476;
 Mon, 14 Dec 2020 17:24:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hKoR=FS=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1koraM-0003mj-2G
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 17:24:34 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id cb2bce35-7541-4f67-9b90-134b5b10151c;
 Mon, 14 Dec 2020 17:24:33 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-5mqhwgx1OAqCYa9M4ykgwA-1; Mon, 14 Dec 2020 12:24:31 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E043E107ACF5;
 Mon, 14 Dec 2020 17:24:28 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BE2410021AA;
 Mon, 14 Dec 2020 17:24:19 +0000 (UTC)
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
X-Inumbo-ID: cb2bce35-7541-4f67-9b90-134b5b10151c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607966672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tVrw542DX2KLO2TPzENouPrv7sTLbHUO9KuI1dV/ApQ=;
	b=YjZVnEhMg8/zcRnSWqPQqai/Fmz+TJeCXp2n0b44Wp4AwGn3giDjSfNdCzElgPc8bDHHXz
	M9q3H4tJsByuKozGDnxwQV7dPOCNOVp3s4Sp0iVHyWhR5HCYLAAjDvoRy53PQKqO87x3cG
	P+xx5BDLRyy7O1/e/a7QbHfEf7f/VVM=
X-MC-Unique: 5mqhwgx1OAqCYa9M4ykgwA-1
Date: Mon, 14 Dec 2020 12:24:18 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Max Reitz <mreitz@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Richard Henderson <rth@twiddle.net>,
	David Hildenbrand <david@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	qemu-s390x@nongnu.org
Subject: Re: [PATCH v4 23/32] qdev: Move dev->realized check to
 qdev_property_set()
Message-ID: <20201214172418.GK1289986@habkost.net>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
 <20201211220529.2290218-24-ehabkost@redhat.com>
 <20201214155530.55f80cd6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214155530.55f80cd6@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Dec 14, 2020 at 03:55:30PM +0100, Igor Mammedov wrote:
> On Fri, 11 Dec 2020 17:05:20 -0500
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > Every single qdev property setter function manually checks
> > dev->realized.  We can just check dev->realized inside
> > qdev_property_set() instead.
> > 
> > The check is being added as a separate function
> > (qdev_prop_allow_set()) because it will become a callback later.
> 
> is callback added within this series?
> and I'd add here what's the purpose of it.

It will be added in part 2 of the series.  See v3:
https://lore.kernel.org/qemu-devel/20201112214350.872250-35-ehabkost@redhat.com/

I don't know what else I could say about its purpose, in addition
to what I wrote above, and the comment below[1].

If you are just curious about the callback and confused because
it is not anywhere in this series, I can just remove the
paragraph above from the commit message.  Would that be enough?

> 
[...]
> > +/* returns: true if property is allowed to be set, false otherwise */

[1] ^^^

> > +static bool qdev_prop_allow_set(Object *obj, const char *name,
> > +                                Error **errp)
> > +{
> > +    DeviceState *dev = DEVICE(obj);
> > +
> > +    if (dev->realized) {
> > +        qdev_prop_set_after_realize(dev, name, errp);
> > +        return false;
> > +    }
> > +    return true;
> > +}
> > +

-- 
Eduardo


