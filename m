Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED20206A9A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 05:29:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnw5x-0005m5-UM; Wed, 24 Jun 2020 03:29:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbuU=AF=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jnw5w-0005m0-JG
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 03:29:04 +0000
X-Inumbo-ID: d9f944b2-b5ca-11ea-bb8b-bc764e2007e4
Received: from mail-lj1-x235.google.com (unknown [2a00:1450:4864:20::235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9f944b2-b5ca-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 03:29:04 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id e4so965271ljn.4
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2020 20:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jI17LQTN3+z4SiRVh3azK7/wsTn408ncZ2KjazB86gg=;
 b=PNrg8PWQ+ZG3a4BhsUtOd4Sq7oWFs3cxNHl0dA62wM+U8y4vm8wPgPzUH+gB5sH6h5
 nX63MvzOgmV1Dm+eTjbFUVpLAnSkKc/c9kk4alc0Xe6e3FCjE5nNOXfMWZqKp2ebRil0
 b3GuBQXYLsrEBy+7CsroblcxwHiSXzYD0hoUToAGL8eovfH3majYR7b6D0pk1+q+u8z0
 NHfShoouJRtLTPNex1QYKFsEHIJHTwNkFiYtzfwfCkYKvsYkRgiP8oXVImlO0mgNw1JT
 h7kF6ZctSSLpcPE5YvDOx+7pbENUP0ySTZtA+qn+5POIinXib6Km0V5qtgh8kpRYr4LH
 lj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jI17LQTN3+z4SiRVh3azK7/wsTn408ncZ2KjazB86gg=;
 b=ha2Hdn7QbpRHE/vrWK9s5WLTpChte+yZi4/K7RQlnT7VBZam9iV4rNRagjrrvbnF/1
 WOXR4JdqlTIAzzZMhH07eyxN9BUEfOdcZVSChCd+Jj2PyBQfKUp5Bk8wsp/DTSq/WuPC
 OsmrlyZQUUuX/lgm4S8h/nbG4rUmkuYi1fPSNzzxhWOyeOAaxb76j/HtLJirfCAwGnDR
 klD8YlB4N98hV0mCDgsbCm/d3si5PHwqkOMt+mO2dNAG3wBWpTQ6apg5wITGxnFtF7Vv
 l17Pht4SgFyCvGT+sNIH5rMPQ2uHlc6YyXELlRW54LCYBhFNKXHSE2JyahV3kk9o68kR
 7dww==
X-Gm-Message-State: AOAM532nW0M6ZCed+vRI34zfPKx6apwkZqwE6uQ4rT+wHBWaAAMbExSS
 xkN4PZT9NQHIt6CzSbQQzXycVIs7StbY4NmOMgk=
X-Google-Smtp-Source: ABdhPJyu1IksiHVFvTZLBipIeEqb+aQHEsVhvlrZa7kDEIWUxIvXB4tVHZ7iiQxaNvxnksFjwjNt5Jn4fyup9CPF4RM=
X-Received: by 2002:a2e:9a59:: with SMTP id k25mr13583203ljj.114.1592969342938; 
 Tue, 23 Jun 2020 20:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpuSD3NC2bLPQN75e2pR8asu9Ey1xTGxTNeCR_1MGsnPOg@mail.gmail.com>
 <ac4dfe3b-7981-49bb-25a2-08578da150d5@ilande.co.uk>
 <CAKf6xpvs6mNowsiAzbfQGLGp0aY0zKgUD=DVpSorWHycm--J8g@mail.gmail.com>
 <87k0zykwdl.fsf@dusky.pond.sub.org>
 <CAKf6xpuWfw7HEyfaH4jk02LUkt5b6eqdOdXhddqEX=iuPTbCTA@mail.gmail.com>
 <000101d64961$681c0350$385409f0$@xen.org>
In-Reply-To: <000101d64961$681c0350$385409f0$@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 23 Jun 2020 23:28:51 -0400
Message-ID: <CAKf6xpuZAjDvSxUjRfgy9KAmHHpEKq5OTYNTO1iJnvmSyKXX6Q@mail.gmail.com>
Subject: Re: sysbus failed assert for xen_sysdev
To: Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 23, 2020 at 9:22 AM Paul Durrant <xadimgnik@gmail.com> wrote:
>
> > -----Original Message-----
> > From: Jason Andryuk <jandryuk@gmail.com>
> > Sent: 23 June 2020 13:57
> > To: Markus Armbruster <armbru@redhat.com>
> > Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>; Anthony PERARD <anthony.perard@citrix.com>; xen-
> > devel <xen-devel@lists.xenproject.org>; Paul Durrant <paul@xen.org>; QEMU <qemu-devel@nongnu.org>
> > Subject: Re: sysbus failed assert for xen_sysdev

> >
> > Thanks for your response, Markus.
> >
> > I didn't write it, but my understanding is as follows.  TYPE_XENSYSDEV
> > is a device on the system bus that provides the TYPE_XENSYSBUS bus.
> > TYPE_XENBACKEND devices can then attach to TYPE_XENSYSBUS.
> >
> > That would make the qom-tree something like:
> >   /TYPE_XENSYSDEV
> >     /TYPE_XENSYSBUX
> >       /TYPE_XENBACKEND
> >
> > (I think today the TYPE_XENBACKEND devices ends up attached to the System bus.)
> >
> > I think TYPE_XENSYSDEV is correct - it is a device on the system bus.
> > static const TypeInfo xensysdev_info = {
> > .name = TYPE_XENSYSDEV,
> > .parent = TYPE_SYS_BUS_DEVICE,
> > ...
> > }
> >
> > TYPE_XENSYSBUS is the xen-specific bus - provided by TYPE_XENSYSDEV -
> > for attaching xendev.
> > static const TypeInfo xensysbus_info = {
> > .name = TYPE_XENSYSBUS,
> > .parent = TYPE_BUS,
> > ...
> > }
> >
> > TYPE_XENBACKEND is a generic Xen device and it plugs into
> > TYPE_XENSYSBUS.  Maybe the .parent here is wrong and it should just be
> > TYPE_DEVICE?
>
> Yes, I think that is the problem leading to the assert. See the equivalent (non-legacy) code in xen-bus.c.

Yes, xen-bus.c looks correct, but the important change seems to be
removing `dc->bus_type = TYPE_XENSYSBUS;` from xen_sysdev_class_init()
and adding it to xendev_class_init().  That let QEMU get to the
cfi.pflash01 assertion failure.

Regards,
Jason

>   Paul
>
> > static const TypeInfo xendev_type_info = {
> > .name = TYPE_XENBACKEND,
> > .parent = TYPE_XENSYSDEV,
> > ...
> > }
> >
> > So removing `bus_type = TYPE_XENSYSBUS` from TYPE_XENSYSDEV class_init
> > and adding it to TYPE_XENBACKEND seems correct to me.

