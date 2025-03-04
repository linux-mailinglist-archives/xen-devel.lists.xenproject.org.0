Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88588A4DDED
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 13:30:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901061.1309038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpRPV-0002eK-AO; Tue, 04 Mar 2025 12:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901061.1309038; Tue, 04 Mar 2025 12:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpRPV-0002cG-7D; Tue, 04 Mar 2025 12:30:09 +0000
Received: by outflank-mailman (input) for mailman id 901061;
 Tue, 04 Mar 2025 12:30:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFsD=VX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tpRPU-0002cA-4a
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 12:30:08 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 675b40af-f8f4-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 13:30:07 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2232aead377so107304015ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 04:30:07 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7362a6d925bsm8108058b3a.66.2025.03.04.04.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 04:30:04 -0800 (PST)
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
X-Inumbo-ID: 675b40af-f8f4-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741091405; x=1741696205; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DAJxgNXKQm8Wo1UpsoHqjGMjZarCYlyUHrAJ6wp430Q=;
        b=h0S1hUBA13jZzf6jcfk0VA+WktU0t5f87wlEm48VRmW8iNTrFxooZ0A2Zr3UUJndWB
         1P+Kj3JHdXMWRX1MKBRRU1TF2TNwRZS1hvgKrRgEJYJk/IyfDbVbSFfphM5ffZwYyI3E
         v5lWkSBD23gQkaZFoqnZXvs3s/bVrepvTb8TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741091405; x=1741696205;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DAJxgNXKQm8Wo1UpsoHqjGMjZarCYlyUHrAJ6wp430Q=;
        b=GqiKu2DZj7+epdPunaZcEqdMvkzZeWwefPV6easw2IOWCVs/sUCi08Aagt3R9sPiBK
         GbKdCKf72zQ4I3u60ke2q33Zz8w31KfgpdNbN5S/lbJkNVKJuu+uqFsJOgl9ESw7LUvs
         gKIf6brVCD5fqL4XSx9g8yeaYptevM6ecesw1aM28bQse6tV3wpil2mJ0YYroOYzpJBM
         IFkA56Px+Fo9MyQyhJJjpKOPuoS9u8jtTmjdriNPC88HVi5qmHafJMJ8XtId5Ah6Kdln
         E7bUG2tuH2VzjN2P7lOK7qZiVGCGoxcSMZX1eQxfoyJrlnRdUuy0f8mWIGseJiMo9o5x
         cabA==
X-Forwarded-Encrypted: i=1; AJvYcCXIyorFxtJ6VtB8FWQMn31T8Ifv9MtY5jpiPNsBVjfVpBD/DpdXIr6ZA9b5rTE83FT8xw+e0anNPNo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcYDLHjaQ7mKwKk04TKzP7JJhaVIm4Us9P+DKvsUJZ2mcKNSNE
	bwS4SWyoO68/QakeuESPct7kZqLf6hrOpQVmG969i59JhTnDymhzXFlqu92E/wk=
X-Gm-Gg: ASbGncugVknLLyG5OWiGJTcGC9ixdRPJawc4sUATRhbG2yCTHYD/gECqeC6IhjDEtg+
	a2n/qNcOL3Id6WnbbhDSVSY6PuF5IUNfMWTgU+lp3o10M6yOjGEj20So7dYix2DqlXO0zlV2b49
	BWctzpWQmFGEircIi5mLjnNWDka5Rrmt+oqQd62AH1cyXq6XkimDrCmGu7w7lFSrrVennbJOxEg
	yzSTBqW8mncEbHpV8/NilOUCs/tbvJ+XLaZwpvRlnF9e7yRk/80xN79JiPj1sxbMZrCnhOSaoeD
	GDfZO7VHdyMuDCBzubuPGFZhLxDwl9ezBiEPxxuSFPjaUYeOUj8ud4o=
X-Google-Smtp-Source: AGHT+IEjqnWP3dEIfi5/sJb9/cKB1U8hthScnrFuLGlK0RDKVaM/D4vKB4EGDB7aUOejX3MBvOo2Zw==
X-Received: by 2002:a05:6a00:2e92:b0:736:692e:129 with SMTP id d2e1a72fcca58-736692e0243mr7650315b3a.24.1741091405277;
        Tue, 04 Mar 2025 04:30:05 -0800 (PST)
Date: Tue, 4 Mar 2025 13:29:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] docs: Add some details on XenServer PCI devices
Message-ID: <Z8byRwON4Oc23dxS@macbook.local>
References: <20250228152100.23105-1-frediano.ziglio@cloud.com>
 <D87ENZNEBN2Z.1E8WKX6K8EUE1@cloud.com>
 <Z8bfMmM5CJ5PQdhm@macbook.local>
 <CACHz=ZgmBxNKjA7KFktk-5jcPvWDn6DWpwCUEFzGO9qyJYuZsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHz=ZgmBxNKjA7KFktk-5jcPvWDn6DWpwCUEFzGO9qyJYuZsA@mail.gmail.com>

On Tue, Mar 04, 2025 at 11:17:42AM +0000, Frediano Ziglio wrote:
> On Tue, Mar 4, 2025 at 11:08 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Tue, Mar 04, 2025 at 10:21:52AM +0000, Alejandro Vallejo wrote:
> > > Hi,
> > >
> > > On Fri Feb 28, 2025 at 3:21 PM GMT, Frediano Ziglio wrote:
> > > > Describe the usage of devices 5853:0002 and 5853:C000.
> > > >
> > > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > > ---
> > > >  docs/man/xen-pci-device-reservations.7.pod | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/docs/man/xen-pci-device-reservations.7.pod b/docs/man/xen-pci-device-reservations.7.pod
> > > > index 9ddf3a18ad..62f3bd2105 100644
> > > > --- a/docs/man/xen-pci-device-reservations.7.pod
> > > > +++ b/docs/man/xen-pci-device-reservations.7.pod
> > > > @@ -10,6 +10,8 @@ use of this is with device ID 0x0001 to advertise the Xen Platform PCI
> > > >  device - the presence of this virtual device enables a guest Operating
> > > >  System (subject to the availability of suitable drivers) to make use of
> > > >  paravirtualisation features such as disk and network devices etc.
> > > > +XenServer, for Windows machines, presents Xen Platform device with device
> > > > +ID 0x0002 instead of 0x0001.
> > >
> > > nit: in the interest of future-proofing the doc 's/presents/may present/'?
> > >
> > > >
> > > >  Some Xen vendors wish to provide alternative and/or additional guest drivers
> > > >  that can bind to virtual devices[1]. This may be done using the Xen PCI
> > > > @@ -86,4 +88,11 @@ and unplug protocol.
> > > >  libxl provides support for creation of a single additional xen-pvdevice.
> > > >  See the vendor_device parameter in xl.cfg(5).
> > > >
> > > > +=item 2.
> > > > +
> > > > +XenServer, for Windows machines, presents a device with ID 0xC000.
> > > > +This device is a placeholders for Windows update.
> > > > +Device 0xC000 is presented with a Xen Platform PCI device, usually with ID
> > > > +0x0002.
> > > > +
> > > >  =back
> > >
> > > Wouldn't this be better covered under "=item 1"? Device 0xc000 is a
> > > xen-pvdevice, so it could be simplified to a single line of "XenServer uses
> > > device-id=0xc000 for its pvdevice on Windows guests", or something like that.
> >
> > I think it's important to note that c000 always appears in conjunction
> > with 0001 or 0002, and it's not a replacement for either of those
> > devices.
> >
> 
> Do you have something more precise in mind? Can you suggest what to write?

I'm fine with your proposed text, my reply was to Alejandro to note
that I think his proposed text was missing information that was on
your original proposal.

"XenServer might present a device with ID 0xC000.  Such device is a
placeholder for Windows update usage and is always exposed in
conjunction with a Xen Platform PCI device, usually with ID 0x0002."

I don't care much whether this is on a separate item or not.  My
preference would be for adding a second item, as to prevent cluttering
the first one.

I've also looked at xl.cfg, and it mentions:

vendor_device="VENDOR_DEVICE"

Selects which variant of the QEMU xen-pvdevice should be used for this
guest. Valid values are:

  none The xen-pvdevice should be omitted. This is the default.

  xenserver The xenserver variant of the xen-pvdevice (device-id=C000)
  will be specified, enabling the use of XenServer PV drivers in the
  guest.

Isn't this wrong, as selecting `xenserver` should instead use
device-id=0002 but not C000?  Maybe I'm not understanding how this is
supported to work.

> > Likewise it's important to note that 0001 and 0002 are to my
> > understanding mutually exclusive, and only one of those must be
> > exposed.
> 
> Not exactly sure if this is a must or a should. From my testing,
> presenting 2 devices (well, they are mostly the same) works. But, as
> they do the same things it seems reasonable to avoid the duplication.
> It looks like a good recommendation.

I was expecting it to not work, as I imagined Linux would then attempt
to initialize the grant tables twice for example.

Thanks, Roger.

