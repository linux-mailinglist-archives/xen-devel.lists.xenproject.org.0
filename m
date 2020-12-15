Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CBB2DAED8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 15:24:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54282.94246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpBFh-0005iz-8r; Tue, 15 Dec 2020 14:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54282.94246; Tue, 15 Dec 2020 14:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpBFh-0005ia-5C; Tue, 15 Dec 2020 14:24:33 +0000
Received: by outflank-mailman (input) for mailman id 54282;
 Tue, 15 Dec 2020 14:24:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AeOo=FT=redhat.com=imammedo@srs-us1.protection.inumbo.net>)
 id 1kpBFg-0005iV-G8
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 14:24:32 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e633bffd-4d2e-4982-b50c-96d9494dc207;
 Tue, 15 Dec 2020 14:24:30 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-FIzfC_48MYiPhrV1QHKixw-1; Tue, 15 Dec 2020 09:24:28 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D39810054FF;
 Tue, 15 Dec 2020 14:24:26 +0000 (UTC)
Received: from localhost (ovpn-113-127.ams2.redhat.com [10.36.113.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A633A179B3;
 Tue, 15 Dec 2020 14:24:20 +0000 (UTC)
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
X-Inumbo-ID: e633bffd-4d2e-4982-b50c-96d9494dc207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608042270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+cQ0iEhkWfsQjRdH/t6R2th3kreynHohts1awCUh9o=;
	b=LllXFXE7rrTc8cS3G7F6KkdNKMl58YSExNmZTQznDQuVDErKoK8CkArKgggYCDljAhR1eR
	ikdmBAyC5iawQ7KM4wq+3JYLbPsKenNuKClgX7+MgiLe8UssolBQ9PCk+eZbwyhNZQbK1K
	GLvh/7XDFeSl1kF6UEZc2I1zEx6ATyY=
X-MC-Unique: FIzfC_48MYiPhrV1QHKixw-1
Date: Tue, 15 Dec 2020 15:24:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, Stefan
 Berger <stefanb@linux.ibm.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, John Snow
 <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Eric Blake
 <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger
 <stefanb@linux.vnet.ibm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Reitz <mreitz@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Halil
 Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Richard Henderson <rth@twiddle.net>, David
 Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>, Matthew
 Rosato <mjrosato@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v4 23/32] qdev: Move dev->realized check to
 qdev_property_set()
Message-ID: <20201215152418.0e8dff6b@redhat.com>
In-Reply-To: <20201214172418.GK1289986@habkost.net>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
	<20201211220529.2290218-24-ehabkost@redhat.com>
	<20201214155530.55f80cd6@redhat.com>
	<20201214172418.GK1289986@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Dec 2020 12:24:18 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Mon, Dec 14, 2020 at 03:55:30PM +0100, Igor Mammedov wrote:
> > On Fri, 11 Dec 2020 17:05:20 -0500
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> >   
> > > Every single qdev property setter function manually checks
> > > dev->realized.  We can just check dev->realized inside
> > > qdev_property_set() instead.
> > > 
> > > The check is being added as a separate function
> > > (qdev_prop_allow_set()) because it will become a callback later.  
> > 
> > is callback added within this series?
> > and I'd add here what's the purpose of it.  
> 
> It will be added in part 2 of the series.  See v3:
> https://lore.kernel.org/qemu-devel/20201112214350.872250-35-ehabkost@redhat.com/
> 
> I don't know what else I could say about its purpose, in addition
> to what I wrote above, and the comment below[1].
> 
> If you are just curious about the callback and confused because
> it is not anywhere in this series, I can just remove the
> paragraph above from the commit message.  Would that be enough?
lets remove it for now to avoid confusion

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> >   
> [...]
> > > +/* returns: true if property is allowed to be set, false otherwise */  
> 
> [1] ^^^
> 
> > > +static bool qdev_prop_allow_set(Object *obj, const char *name,
> > > +                                Error **errp)
> > > +{
> > > +    DeviceState *dev = DEVICE(obj);
> > > +
> > > +    if (dev->realized) {
> > > +        qdev_prop_set_after_realize(dev, name, errp);
> > > +        return false;
> > > +    }
> > > +    return true;
> > > +}
> > > +  
> 


