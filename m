Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC58025DA72
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 15:51:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEC7L-00070J-Dd; Fri, 04 Sep 2020 13:51:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+qm=CN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kEC7J-000707-7m
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 13:51:01 +0000
X-Inumbo-ID: ece0b5ea-589b-47b8-a326-7947f1b31726
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ece0b5ea-589b-47b8-a326-7947f1b31726;
 Fri, 04 Sep 2020 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599227459;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=A0psGaDOUE1gOmuz3jont0l69wuFD8Clgx8uhWCccRI=;
 b=bfkjH23SG0rFzmNoXtS1CNj8TmLY3iStc8UwwcTD6l7M0TmQa+UTvUz/
 +orKplUalcAAdOJv7s719qwCXrAexcM0mpVLnhpI8eoB2fJIfVW3fh3k8
 oy6zYOYM58UY2abygmjClu8sDjFJE1km5p7R+ukkhRFdnl+691QWfcyz0 Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: r6Uola6oErg432gpxJlYBQ+GtxNhiUzmGwhRcvC3Id8chlfZRucP1kJnmDtwaS7nYZAcrCstiv
 3R5xwUrDzlgtnXtRykqLlczqso2Cf2Ff+uLJeZVyVz7+ILif1ER//+UIcktUKYzLcS9X0J6oEL
 c75hbIIZONDbP4GChhfDekLgcao9egTo/RFwoZnq3hALxUdE61Lc3CSoU3Z2p8qChXRdPZ0a1q
 PIFPg4NR6z4qDxfzzF0bDy8C0IsLuvojrafA9swBki+lj2HpIEFlivn1HUE6lULN4A+T6KjGdk
 5MQ=
X-SBRS: 2.7
X-MesageID: 26972643
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26972643"
Date: Fri, 4 Sep 2020 15:50:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>, 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Wei Liu' <wl@xen.org>, 'Anthony PERARD'
 <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] libxl: do not automatically force detach of block
 devices
Message-ID: <20200904135051.GR753@Air-de-Roger>
References: <20200903100537.1337-1-paul@xen.org>
 <20200903100537.1337-3-paul@xen.org>
 <20200904085244.GO753@Air-de-Roger>
 <002501d682a0$6c930140$45b903c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <002501d682a0$6c930140$45b903c0$@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On Fri, Sep 04, 2020 at 10:47:37AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Roger Pau Monné <roger.pau@citrix.com>
> > Sent: 04 September 2020 09:53
> > To: Paul Durrant <paul@xen.org>
> > Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Ian Jackson
> > <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Anthony PERARD <anthony.perard@citrix.com>
> > Subject: Re: [PATCH 2/2] libxl: do not automatically force detach of block devices
> > 
> > On Thu, Sep 03, 2020 at 11:05:37AM +0100, Paul Durrant wrote:
> > > From: Paul Durrant <pdurrant@amazon.com>
> > >
> > > The manpage for 'xl' documents that guest co-operation is required for a (non-
> > > forced) block-detach operation and that it may consequently fail. Currently,
> > > however, the implementation of generic device removal means that a time-out
> > > of a block-detach is being automatically re-tried with the force flag set
> > > rather than failing. This patch stops such behaviour.
> > 
> > Won't this break cleanup on domain shutdown if the guest doesn't close
> > the devices itself?
> > 
> 
> I don't think so... AFAIK that's a destroy i.e. it's always forced (since there's no way the guest can co-operate at the point).

Urgh, yes, sorry.

> > I think we need some special-casing on shutdown that keeps the current
> > behavior on that case.
> > 
> > >
> > > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > > ---
> > > Cc: Ian Jackson <iwj@xenproject.org>
> > > Cc: Wei Liu <wl@xen.org>
> > > Cc: Anthony PERARD <anthony.perard@citrix.com>
> > > ---
> > >  tools/libxl/libxl_device.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/tools/libxl/libxl_device.c b/tools/libxl/libxl_device.c
> > > index 0381c5d509..d17ca78848 100644
> > > --- a/tools/libxl/libxl_device.c
> > > +++ b/tools/libxl/libxl_device.c
> > > @@ -1092,7 +1092,8 @@ static void device_backend_callback(libxl__egc *egc, libxl__ev_devstate *ds,
> > >
> > >      if (rc == ERROR_TIMEDOUT &&
> > >          aodev->action == LIBXL__DEVICE_ACTION_REMOVE &&
> > > -        !aodev->force) {
> > > +        !aodev->force &&
> > > +        aodev->dev->kind != LIBXL__DEVICE_KIND_VBD) {
> > 
> > Doing this differentiation for block only seems weird, we should treat
> > all devices equally.
> > 
> 
> That is not how things are documented in the xl manpage though; block-detach is the only one to have a force option. I assume that was deliberate.

Oh right, that's weird. I guess removing a block device without guest
cooperation will likely result in a guest crash, while the same it's
not true for other devices.

Thanks, Roger.

