Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B1E26A873
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 17:11:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kICbo-0003fS-Ep; Tue, 15 Sep 2020 15:11:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+xL=CY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kICbm-0003fN-Cl
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 15:11:02 +0000
X-Inumbo-ID: 0c081171-fe0a-4eec-ad5b-21a6fa9336a2
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c081171-fe0a-4eec-ad5b-21a6fa9336a2;
 Tue, 15 Sep 2020 15:11:00 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x14so3689998wrl.12
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2020 08:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=1QlTiueXYpFTRJC6zgfMwLXYU5A3Q+gP6o3vqJh+cIE=;
 b=pLWaeupuVT3sJN4Bf0kpduugDzSZcIjPz1XYY5vK8GP7pn+pmDIdR/loqSNI5vv7JJ
 m2VsG/Hzt4EzCxcuuKE8jn1roa2SHorBoMYFHDunVdktgw+PSNyhgafhq6RrepkqNe9F
 Mjl0fDhT6FV8SKxHhgg5nvXnaxMMqbZjzG7yz4jAhKoEceTS4CHms806Gfk1YzIuHa3z
 GckVeZI2AjbHACO4tySQtD5MdqUEUpexofCis7+5o1wWEEQdupmI/WTxx2qyGbpoM04T
 Rd5Nk/Yoow7BUOqbzESWYZzj1neUgyjl1ntUo+UYQ7vE9QJfPdpvDMxQXusFVVASHjj1
 MJDg==
X-Gm-Message-State: AOAM533DPK52AXRzR8ipw9GSsm1mndF7NDisjYX2llOTsNnYXUOnyUda
 DhtAspVtlCOXs5jrccgPooA=
X-Google-Smtp-Source: ABdhPJxb9aXtW09yEHZHI/ADI7N5WrKNi//8/eD0OsvGDZ4ZLNfImsF4k3RJmJXcy0v2EuzOsvGkGw==
X-Received: by 2002:a5d:4a49:: with SMTP id v9mr24013714wrs.153.1600182660127; 
 Tue, 15 Sep 2020 08:11:00 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w21sm27059331wmk.34.2020.09.15.08.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:10:59 -0700 (PDT)
Date: Tue, 15 Sep 2020 15:10:58 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: "Durrant, Paul" <pdurrant@amazon.co.uk>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 1/2] libxl: provide a mechanism to define a device
 'safe remove' function...
Message-ID: <20200915151057.634pbgys5lsdqh4j@liuwe-devbox-debian-v2>
References: <20200915141007.25965-1-paul@xen.org>
 <20200915141007.25965-2-paul@xen.org>
 <20200915143156.GN753@Air-de-Roger>
 <0e7f999a7611436fbdc99e0329a98c0c@EX13D32EUC003.ant.amazon.com>
 <20200915144814.GO753@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200915144814.GO753@Air-de-Roger>
User-Agent: NeoMutt/20180716
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

On Tue, Sep 15, 2020 at 04:48:14PM +0200, Roger Pau Monné wrote:
> On Tue, Sep 15, 2020 at 02:40:09PM +0000, Durrant, Paul wrote:
> > > -----Original Message-----
> > > From: Roger Pau Monné <roger.pau@citrix.com>
> > > Sent: 15 September 2020 15:32
> > > To: Paul Durrant <paul@xen.org>
> > > Cc: xen-devel@lists.xenproject.org; Durrant, Paul <pdurrant@amazon.co.uk>; Ian Jackson
> > > <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Anthony PERARD <anthony.perard@citrix.com>
> > > Subject: RE: [EXTERNAL] [PATCH v2 1/2] libxl: provide a mechanism to define a device 'safe remove'
> > > function...
> > > 
> > > CAUTION: This email originated from outside of the organization. Do not click links or open
> > > attachments unless you can confirm the sender and know the content is safe.
> > > 
> > > 
> > > 
> > > On Tue, Sep 15, 2020 at 03:10:06PM +0100, Paul Durrant wrote:
> > > > From: Paul Durrant <pdurrant@amazon.com>
> > > >
> > > > ... and use it to define libxl_device_disk_safe_remove().
> > > >
> > > > This patch builds on the existent macro magic by using a new value of the
> > > > 'force' field in in libxl__ao_device.
> > > > It is currently defined as an int but is used in a boolean manner where
> > > > 1 means the operation is forced and 0 means it is not (but is actually forced
> > > > after a 10s time-out). In adding a third value, this patch re-defines 'force'
> > > > as a struct type (libxl__force) with a single 'flag' field taking an
> > > > enumerated value:
> > > >
> > > > LIBXL__FORCE_AUTO - corresponding to the old 0 value
> > > > LIBXL__FORCE_ON   - corresponding to the old 1 value
> > > > LIBXL__FORCE_OFF  - the new value
> > > >
> > > > The LIBXL_DEFINE_DEVICE_REMOVE() macro is then modified to define the
> > > > libxl_device_<type>_remove() and libxl_device_<type>_destroy() functions,
> > > > setting LIBXL__FORCE_AUTO and LIBXL__FORCE_ON (respectively) in the
> > > > libxl__ao_device passed to libxl__initiate_device_generic_remove() and a
> > > > new macro, LIBXL_DEFINE_DEVICE_SAFE_REMOVE(), is defined that sets
> > > > LIBXL__FORCE_OFF instead. This macro is used to define the new
> > > > libxl_device_disk_safe_remove() function.
> > > >
> > > > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > > 
> > > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > > 
> > 
> > Thanks.
> > 
> > > Just one nit.
> > > 
> > > > diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
> > > > index e16ae9630b..1fcf85c3e2 100644
> > > > --- a/tools/libxl/libxl_internal.h
> > > > +++ b/tools/libxl/libxl_internal.h
> > > > @@ -2730,12 +2730,20 @@ _hidden void libxl__prepare_ao_device(libxl__ao *ao, libxl__ao_device
> > > *aodev);
> > > >  /* generic callback for devices that only need to set ao_complete */
> > > >  _hidden void device_addrm_aocomplete(libxl__egc *egc, libxl__ao_device *aodev);
> > > >
> > > > +typedef struct {
> > > > +    enum {
> > > > +        LIBXL__FORCE_AUTO, /* Re-execute with FORCE_ON if op times out */
> > > > +        LIBXL__FORCE_ON,
> > > > +        LIBXL__FORCE_OFF,
> > > > +    } flag;
> > > > +} libxl__force;
> > > 
> > > Couldn't you just use the typedef against the union directly instead
> > > of wrapping it around a struct?
> > 
> > You mean s/union/enum?
> 
> Yes :) sorry for that.
> 
> > I could have done that, but it helped find all the places where aodev->force is used and I liked the abstraction. I don't mind changing if there are strong opinions against it.
> 
> While it's indeed helpful to find the users to fixup, it just makes
> the lines longer in the final patch IMO. Let's see what opinions
> others have however.

I don't feel strongly about this either way.

Wei.

> 
> Thanks, Roger.

