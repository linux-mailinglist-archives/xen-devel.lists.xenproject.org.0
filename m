Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA64E1E6F3A
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 00:36:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeR7W-0008B6-AH; Thu, 28 May 2020 22:35:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=leMz=7K=yandex-team.ru=rvkagan@srs-us1.protection.inumbo.net>)
 id 1jeR7U-0008B1-6M
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 22:35:24 +0000
X-Inumbo-ID: 83794f0c-a133-11ea-81bc-bc764e2007e4
Received: from forwardcorp1j.mail.yandex.net (unknown [5.45.199.163])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83794f0c-a133-11ea-81bc-bc764e2007e4;
 Thu, 28 May 2020 22:35:21 +0000 (UTC)
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id ACCCD2E0E4D;
 Fri, 29 May 2020 01:35:19 +0300 (MSK)
Received: from sas1-9998cec34266.qloud-c.yandex.net
 (sas1-9998cec34266.qloud-c.yandex.net [2a02:6b8:c14:3a0e:0:640:9998:cec3])
 by mxbackcorp1o.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 BuNyaWpDN3-ZFxKo312; Fri, 29 May 2020 01:35:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590705319; bh=8cadgulWOGNTQdBMKpVo058EzTWu105wWXqXNmDyI2Q=;
 h=In-Reply-To:Message-ID:Subject:To:From:References:Date:Cc;
 b=sYf34wspRvEm3uY0kJIMbV/vm1gg+TU5JxAbj4M8vapwXTBr32eWTdNBhLvq6bb6U
 Hod9ijXHn9stbImabjisBTH/JszZKMdPX4/OHYmcMAw6QWFoXs6gk20Vmsq0qf8rhQ
 eHr35kE05eJVjVk9Dj46B1n6R5mibG0sH1ks+Bh0=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1318::1:10])
 by sas1-9998cec34266.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 9jfGj8qT6B-ZFXuqeYQ; Fri, 29 May 2020 01:35:15 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Fri, 29 May 2020 01:35:14 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v7 4/8] qdev-properties: add size32 property type
Message-ID: <20200528223514.GA1255099@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20200528213946.1636444-1-rvkagan@yandex-team.ru>
 <20200528213946.1636444-5-rvkagan@yandex-team.ru>
 <78e3587a-efea-970a-b47e-8d187464d955@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78e3587a-efea-970a-b47e-8d187464d955@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 28, 2020 at 04:45:19PM -0500, Eric Blake wrote:
> On 5/28/20 4:39 PM, Roman Kagan wrote:
> > Introduce size32 property type which handles size suffixes (k, m) just
> > like size property, but is uint32_t rather than uint64_t.
> 
> Does it handle 'g' as well? (even though the set of valid 32-bit sizes with
> a g suffix is rather small ;)
> 
> >  It's going to
> > be useful for properties that are byte sizes but are inherently 32bit,
> > like BlkConf.opt_io_size or .discard_granularity (they are switched to
> > this new property type in a followup commit).
> > 
> > The getter for size32 is left out for a separate patch as its benefit is
> > less obvious, and it affects test output; for now the regular uint32
> > getter is used.
> > 
> > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > ---
> > 
> 
> > +static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
> > +                       Error **errp)
> > +{
> > +    DeviceState *dev = DEVICE(obj);
> > +    Property *prop = opaque;
> > +    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
> > +    uint64_t value;
> > +    Error *local_err = NULL;
> > +
> > +    if (dev->realized) {
> > +        qdev_prop_set_after_realize(dev, name, errp);
> > +        return;
> > +    }
> > +
> > +    visit_type_size(v, name, &value, &local_err);
> 
> Yes, it does.
> 
> Whether or not the commit message is tweaked,
> Reviewed-by: Eric Blake <eblake@redhat.com>

I did this stupid stringify(UINT32_MAX) here too.  It's even uglier
here, with an 'U' appended to the number in the brackets, but somehow it
didn't strike me in the eye while testing.

So I'll fix this too in the respin, and drop the r-b.

Thanks,
Roman.

