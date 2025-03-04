Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD745A4DBDE
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 12:08:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900941.1308928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQ8i-0001cN-21; Tue, 04 Mar 2025 11:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900941.1308928; Tue, 04 Mar 2025 11:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQ8h-0001b7-U3; Tue, 04 Mar 2025 11:08:43 +0000
Received: by outflank-mailman (input) for mailman id 900941;
 Tue, 04 Mar 2025 11:08:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFsD=VX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tpQ8g-0001b1-DV
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 11:08:42 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 072b9971-f8e9-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 12:08:41 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2235908a30aso88010605ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 03:08:41 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-223504c5cd2sm93198645ad.143.2025.03.04.03.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 03:08:39 -0800 (PST)
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
X-Inumbo-ID: 072b9971-f8e9-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741086520; x=1741691320; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=llnRtB9KWyU8pg+EOOMGOsLUpC1v932ouPOIWP7nLNc=;
        b=GkeKZWpEXAKRcxbyD0djgcYzRje3wx/40aLybqrXgLTEFgsG0SJhwF8lb5uU3YcqxC
         bybJwb+sbwt5gZ2gr5Xu5meAsna0tpGYMC8TnqUYWTIrdSmxou7yLu7jVxta8JD+LXu0
         ffUlXh/FqeV1r3xHIYoujE+xnzl9K+cHxvyrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741086520; x=1741691320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llnRtB9KWyU8pg+EOOMGOsLUpC1v932ouPOIWP7nLNc=;
        b=pE6QNGgdBp5J7ppvjDmO94KyZVpCMmTne3GRme4CjtfxmjNa8+OW269eOQXt6eQjIi
         N0O5FBQ7pcWK0MBMVTB0l2THzdcT1rNg2Wn85cea6QD5gkQk4sfX3s6a8l6lzkz/bnsY
         gUhIbU8V583DThwf8xntNpZyRPotESNR9sTT9Bp8JwiQ9v/dcJcH2mT6EcI7Fm11U4IM
         Ko+oCUR1XHX6hOXFxCmrKsjxo70ubZXfVYwcOHvbRK40dt4CfRSXsWVFLICyLbCocH5T
         PNUKlGrEZK1FxCnKraubqIgx554V5dMRqVHGn3l4w1jkUxA9vMSePDb8KtGp8kMz1tLW
         VA3w==
X-Forwarded-Encrypted: i=1; AJvYcCXm0H+MdROoC8NGcHb4xF5vFwS9kGYcsmOd64KxJzNoWEfNAM1E45hjNg+BaKDptgIitI5/qocGEDE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZbio73Dzb9SQJeRK8zZ8RMuc0ieQ5tXcfMaMI1zouMa9qLYFt
	616taId7lj1lIw3DvOy8ChjmBzGMbkAi6Zb7y+0+wV5CUt9a5F0VumEjxgUGBVE=
X-Gm-Gg: ASbGncswqmRApvgjg1JJqUVbG6m8GCZqc655UMMqyYe5Pc8UZ9MAnBVfi1Vq0TpZGyf
	GNK0DJ/uh7RUBLzZeSq7acHOIJk/inx0EzFWg4fVQcTZQzoWNPSP8bZXtlIZmjjxhoZc1qbrJhP
	A59+RRQJeIrpm9KX+RyW/tPiFpj3DDGUJaYhYAEsRHV+5xqQ540+MbgMfwk++P8L8vZBbgYEFPu
	5Ujr3xg5kxlGebT6LWHu1abRUY5gej0bkMkZakhYbULm6MTdWqGEmLKrpFBA2R9XdTSvMkACkwy
	4mGdK2p21EaiVkpxLr7npUzmywGjrFgZZex0f/mOYOl2zBIaugF/OK8=
X-Google-Smtp-Source: AGHT+IFlNplYVaTd/1CTNzVWJ3nh8QOPYYTffCWv1JaO/fzncQRPdnrMOYk2VqYu3JLvaQ1Eh3A88A==
X-Received: by 2002:a17:903:2302:b0:21d:dfae:300c with SMTP id d9443c01a7336-22368f60a53mr235084995ad.3.1741086519696;
        Tue, 04 Mar 2025 03:08:39 -0800 (PST)
Date: Tue, 4 Mar 2025 12:08:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] docs: Add some details on XenServer PCI devices
Message-ID: <Z8bfMmM5CJ5PQdhm@macbook.local>
References: <20250228152100.23105-1-frediano.ziglio@cloud.com>
 <D87ENZNEBN2Z.1E8WKX6K8EUE1@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D87ENZNEBN2Z.1E8WKX6K8EUE1@cloud.com>

On Tue, Mar 04, 2025 at 10:21:52AM +0000, Alejandro Vallejo wrote:
> Hi,
> 
> On Fri Feb 28, 2025 at 3:21 PM GMT, Frediano Ziglio wrote:
> > Describe the usage of devices 5853:0002 and 5853:C000.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> >  docs/man/xen-pci-device-reservations.7.pod | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/docs/man/xen-pci-device-reservations.7.pod b/docs/man/xen-pci-device-reservations.7.pod
> > index 9ddf3a18ad..62f3bd2105 100644
> > --- a/docs/man/xen-pci-device-reservations.7.pod
> > +++ b/docs/man/xen-pci-device-reservations.7.pod
> > @@ -10,6 +10,8 @@ use of this is with device ID 0x0001 to advertise the Xen Platform PCI
> >  device - the presence of this virtual device enables a guest Operating
> >  System (subject to the availability of suitable drivers) to make use of
> >  paravirtualisation features such as disk and network devices etc.
> > +XenServer, for Windows machines, presents Xen Platform device with device
> > +ID 0x0002 instead of 0x0001.
> 
> nit: in the interest of future-proofing the doc 's/presents/may present/'?
> 
> >  
> >  Some Xen vendors wish to provide alternative and/or additional guest drivers
> >  that can bind to virtual devices[1]. This may be done using the Xen PCI
> > @@ -86,4 +88,11 @@ and unplug protocol.
> >  libxl provides support for creation of a single additional xen-pvdevice.
> >  See the vendor_device parameter in xl.cfg(5).
> >  
> > +=item 2.
> > +
> > +XenServer, for Windows machines, presents a device with ID 0xC000.
> > +This device is a placeholders for Windows update.
> > +Device 0xC000 is presented with a Xen Platform PCI device, usually with ID
> > +0x0002.
> > +
> >  =back
> 
> Wouldn't this be better covered under "=item 1"? Device 0xc000 is a
> xen-pvdevice, so it could be simplified to a single line of "XenServer uses
> device-id=0xc000 for its pvdevice on Windows guests", or something like that.

I think it's important to note that c000 always appears in conjunction
with 0001 or 0002, and it's not a replacement for either of those
devices.

Likewise it's important to note that 0001 and 0002 are to my
understanding mutually exclusive, and only one of those must be
exposed.

Thanks, Roger.

