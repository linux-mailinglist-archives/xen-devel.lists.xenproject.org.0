Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBC7246AE7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 17:45:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7hJi-0005pS-KU; Mon, 17 Aug 2020 15:44:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gW6M=B3=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1k7hJh-0005pM-Eq
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 15:44:57 +0000
X-Inumbo-ID: 98952f40-0d04-40dd-b119-3c7cd204fa0a
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98952f40-0d04-40dd-b119-3c7cd204fa0a;
 Mon, 17 Aug 2020 15:44:56 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id 2so15310163qkf.10
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2020 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rBmn68SqrWZPVhzXWPZ+lVaqPoKq/ZBs9qLbAMo34M8=;
 b=nWqEpgmNwu1o+n7pONglk+WgLuyoV/b8FBCGM56Q5AEzEdoBqD/arJPxH+/gfuoUUA
 F+tb7HNcrR3zF2TG0ro+9U4kKGLU9jssw4OmcRmpsxxJ8HdjVth2iZUxzSeUR26l3tAu
 NHA4ovuU8A02VIfB7hNPT409ApJH0or3kzD4HBHr80VfUEdEBQc0KwF63c00LsxuUDV+
 z0H8sNRIprK5Sm6XIA/o0/Qr69I0We17Pao089U4ouif7r/bv8O+uvxXVJeJHvvZME/+
 EOy2USrx268wI1/3tlImM0zYdCcAfzqXzlT1Q5Ra+7eG+r8JFNc9yu5Pbv97EtDJ7a7k
 u42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rBmn68SqrWZPVhzXWPZ+lVaqPoKq/ZBs9qLbAMo34M8=;
 b=tVK42sLanmkw7IhqXpBN64Ujli01QBlyNYvRM5RYPTLBP7j5tByHlsHe3+DfGzxesu
 IhYY1tylQdN7gzbvF/SID2WZeWLfc9274XUDIRvdjHKLNbBkrO5yxckkvFCaRO0/v7Ui
 Gg7MR0QiJo8K4/h6YTdvUgPLQ+Ekxes7DWOFwL/osVy4BIa+s8LLo7ULEmKhuchE1HKO
 mOce+NYoWb/gqmc+6JRBYSvK1WaCJ6IKqaUWlu4ombRM/lMlGrLs/Xog12vDsiIIYjxf
 oe8+p3gCkFgVBCckKlI2vHrEWg0+Eo9azsYcIh+NPJC4UxVrcBHGC7fOYJm9n1GR2u25
 u9Fg==
X-Gm-Message-State: AOAM533CtLSaa5gqBDSgkhByeZrk2yE+vKzQOHw2CtWgWkljoBSbgNOC
 3+TkRclaZYPO2Ro3Ams0LLY=
X-Google-Smtp-Source: ABdhPJwW7kHGmGreTVf8gtUjwDY+CVBuLAPM/mEg2vKFv6GUUC/C3fLVPb0zGJAqnBYb/2TgaKql4Q==
X-Received: by 2002:a37:9a46:: with SMTP id c67mr13802107qke.85.1597679096204; 
 Mon, 17 Aug 2020 08:44:56 -0700 (PDT)
Received: from four (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id f14sm16633698qkl.52.2020.08.17.08.44.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Aug 2020 08:44:55 -0700 (PDT)
Date: Mon, 17 Aug 2020 11:44:52 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, george.dunlap@citrix.com,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [RFC PATCH 2/2] libxl: prototype libxl_device_nic_add/remove
 with IDL
Message-ID: <20200817154452.GB6441@four>
References: <cover.1595854292.git.rosbrookn@ainfosec.com>
 <b7313e96b6865bb13b221720a437c6e2ac57140c.1595854292.git.rosbrookn@ainfosec.com>
 <20200814105747.GE2024@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814105747.GE2024@perard.uk.xensource.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Fri, Aug 14, 2020 at 11:57:47AM +0100, Anthony PERARD wrote:
> On Mon, Jul 27, 2020 at 09:26:33AM -0400, Nick Rosbrook wrote:
> > Add a DeviceFunction class and describe prototypes for
> > libxl_device_nic_add/remove in libxl_types.idl.
> > 
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> > --
> > This is mostly to serve as an example of how the first patch would be
> > used for function support in the IDL.
> > ---
> >  tools/libxl/idl.py          | 8 ++++++++
> >  tools/libxl/libxl_types.idl | 6 ++++++
> >  2 files changed, 14 insertions(+)
> > 
> > diff --git a/tools/libxl/idl.py b/tools/libxl/idl.py
> > index 1839871f86..15085af8c7 100644
> > --- a/tools/libxl/idl.py
> > +++ b/tools/libxl/idl.py
> > @@ -386,6 +386,14 @@ class CtxFunction(Function):
> >  
> >          Function.__init__(self, name, params, return_type, return_is_status)
> >  
> > +class DeviceFunction(CtxFunction):
> > +    """ A function that modifies a device. """
> 
> I guess that meant to be used by all function generated with the C macro
> LIBXL_DEFINE_DEVICE_ADD() and LIBXL_DEFINE_DEVICE_REMOVE(), isn't it?
Yes, I think this could be used in place of those macros.
> 
> I wonder if if we could get away with the type of device ("nic") and the
> type of the parameter (`libxl_device_nic`) and have DeviceFunction been
> a generator for both `add` and `remove` functions (and `destroy`).

We could do that, but I think for clarity it might be valuable to
explicitly define each of them. Actually, as I look at this patch again
I wonder if it would be better to define `Device{Add,Remove,Destroy}`
class definitions?

> Also there are functions like libxl_devid_to_device_nic() aren't those
> of type DeviceFunction as well ? But they don't takes any `ao_how`.
> 
> There is also `libxl_device_nic_list{,_free}`, but it is to handle a
> list of libxl_device_*, so it could be kind of related to DeviceFunction, but
> not quite. But maybe I'm going to far :-).

I think this gives another good reason to define more specific `Device*`
classes, rather than a broad `DeviceFunction` class. What do you think?

Thanks,

-NR

