Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E1D26A784
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 16:49:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kICFu-0007Jr-Rl; Tue, 15 Sep 2020 14:48:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SF/R=CY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kICFt-0007Jm-7t
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 14:48:25 +0000
X-Inumbo-ID: 64615ee5-f7f3-4147-a738-b60df49ed50d
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64615ee5-f7f3-4147-a738-b60df49ed50d;
 Tue, 15 Sep 2020 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600181303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=z2IhdmguihGqHwvPOYUODcJ0Uuxoobnbs0Ws6c/DMaA=;
 b=QShLU9vqd8KM93GDsdW8CWkTEfNu6WNYSAgoXgM9f9aNKWlc40q5CUYC
 UIu2xLsODN677FgXD5cY+cR/VRQNnFm8qc8CFyIJhey6qNBIh+SE4boOZ
 IEAhHE9BTltYZZ4SV3067nj8j5Zz8vt6r8NqUNC/g4j74mvYFOHts6xt7 k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: G07L0U+CiI5SMhn/IIM959eXnZT2tfzGFQnlS9mIBsKqOlsML8yjBRy/4ADh/gao1fBXlhWoo1
 XWb+fpn8O09PWX1mAYjdbOJxkaORkGR+Br1lS+D8KosMk+6z9lnMyAJLX2n7OEhIJ7Ao+ByF7y
 ezf3WCc9RXTejwtIUun1lkBVArhUWvC2vIYe90fuiq2maTeM5Q8zz8dlX+YcSsVVxwn6b9K3UK
 PnTB3lRLg2VJXx8QhbhC1o9zQEclwjjB4FbwHlL9s2BC71jdiY4+8iT91g2on0Er4d7UDGUC8/
 VhA=
X-SBRS: 2.7
X-MesageID: 27714198
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,430,1592884800"; d="scan'208";a="27714198"
Date: Tue, 15 Sep 2020 16:48:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
CC: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 1/2] libxl: provide a mechanism to define a device
 'safe remove' function...
Message-ID: <20200915144814.GO753@Air-de-Roger>
References: <20200915141007.25965-1-paul@xen.org>
 <20200915141007.25965-2-paul@xen.org>
 <20200915143156.GN753@Air-de-Roger>
 <0e7f999a7611436fbdc99e0329a98c0c@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e7f999a7611436fbdc99e0329a98c0c@EX13D32EUC003.ant.amazon.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Sep 15, 2020 at 02:40:09PM +0000, Durrant, Paul wrote:
> > -----Original Message-----
> > From: Roger Pau Monné <roger.pau@citrix.com>
> > Sent: 15 September 2020 15:32
> > To: Paul Durrant <paul@xen.org>
> > Cc: xen-devel@lists.xenproject.org; Durrant, Paul <pdurrant@amazon.co.uk>; Ian Jackson
> > <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Anthony PERARD <anthony.perard@citrix.com>
> > Subject: RE: [EXTERNAL] [PATCH v2 1/2] libxl: provide a mechanism to define a device 'safe remove'
> > function...
> > 
> > CAUTION: This email originated from outside of the organization. Do not click links or open
> > attachments unless you can confirm the sender and know the content is safe.
> > 
> > 
> > 
> > On Tue, Sep 15, 2020 at 03:10:06PM +0100, Paul Durrant wrote:
> > > From: Paul Durrant <pdurrant@amazon.com>
> > >
> > > ... and use it to define libxl_device_disk_safe_remove().
> > >
> > > This patch builds on the existent macro magic by using a new value of the
> > > 'force' field in in libxl__ao_device.
> > > It is currently defined as an int but is used in a boolean manner where
> > > 1 means the operation is forced and 0 means it is not (but is actually forced
> > > after a 10s time-out). In adding a third value, this patch re-defines 'force'
> > > as a struct type (libxl__force) with a single 'flag' field taking an
> > > enumerated value:
> > >
> > > LIBXL__FORCE_AUTO - corresponding to the old 0 value
> > > LIBXL__FORCE_ON   - corresponding to the old 1 value
> > > LIBXL__FORCE_OFF  - the new value
> > >
> > > The LIBXL_DEFINE_DEVICE_REMOVE() macro is then modified to define the
> > > libxl_device_<type>_remove() and libxl_device_<type>_destroy() functions,
> > > setting LIBXL__FORCE_AUTO and LIBXL__FORCE_ON (respectively) in the
> > > libxl__ao_device passed to libxl__initiate_device_generic_remove() and a
> > > new macro, LIBXL_DEFINE_DEVICE_SAFE_REMOVE(), is defined that sets
> > > LIBXL__FORCE_OFF instead. This macro is used to define the new
> > > libxl_device_disk_safe_remove() function.
> > >
> > > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> 
> Thanks.
> 
> > Just one nit.
> > 
> > > diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
> > > index e16ae9630b..1fcf85c3e2 100644
> > > --- a/tools/libxl/libxl_internal.h
> > > +++ b/tools/libxl/libxl_internal.h
> > > @@ -2730,12 +2730,20 @@ _hidden void libxl__prepare_ao_device(libxl__ao *ao, libxl__ao_device
> > *aodev);
> > >  /* generic callback for devices that only need to set ao_complete */
> > >  _hidden void device_addrm_aocomplete(libxl__egc *egc, libxl__ao_device *aodev);
> > >
> > > +typedef struct {
> > > +    enum {
> > > +        LIBXL__FORCE_AUTO, /* Re-execute with FORCE_ON if op times out */
> > > +        LIBXL__FORCE_ON,
> > > +        LIBXL__FORCE_OFF,
> > > +    } flag;
> > > +} libxl__force;
> > 
> > Couldn't you just use the typedef against the union directly instead
> > of wrapping it around a struct?
> 
> You mean s/union/enum?

Yes :) sorry for that.

> I could have done that, but it helped find all the places where aodev->force is used and I liked the abstraction. I don't mind changing if there are strong opinions against it.

While it's indeed helpful to find the users to fixup, it just makes
the lines longer in the final patch IMO. Let's see what opinions
others have however.

Thanks, Roger.

