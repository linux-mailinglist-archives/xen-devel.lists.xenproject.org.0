Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3867A272148
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 12:37:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKJBe-0002G8-6C; Mon, 21 Sep 2020 10:36:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PHp+=C6=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kKJBc-0002G3-9r
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 10:36:44 +0000
X-Inumbo-ID: 1e86a75f-8717-4bec-bc8f-49c03df680e1
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e86a75f-8717-4bec-bc8f-49c03df680e1;
 Mon, 21 Sep 2020 10:36:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e16so12195779wrm.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2020 03:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=mF6SOI4m0LLmT0ew4idoXDSyVoCVmcOJlV8T0/9cVGQ=;
 b=moAWuFDKAaRxgjqoz+S8Hi94cqfGg/ue9zPO0visWJQs6NWM4yxyWc9xj1hV2dRCbh
 E33clrv4RFxmgM1V4I6rNHkEKjvzz5BK4vELRP6vncsuUqTF1x29Jyx/yhtUSCz7kL/3
 FHfJQj0j6cZeoRqvIcgiMSSh36Fs6CRGwfI+M/CPj3iSM08jv5DdwSzV88bvhCeR4FEU
 USRLyUOAjXiRsBdzsHtAv8Il8dcyLZaSkGoRx+x5YqJP/bj27Wq2TLhX1TZlAtHyvcXs
 47Hwb/cLm6urRDBXAZx2ruzClb3ApR31AAMOL8C1E+aybihD5sDvu/Et8XesI+zHP3Va
 an3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=mF6SOI4m0LLmT0ew4idoXDSyVoCVmcOJlV8T0/9cVGQ=;
 b=Oul9x/C4s3Mtqp+yn/kAOFh3vLbDWFfCe1/fPWlc8+P6v9IY7eVuKVJGIj32mBjA+U
 N+MHHwfBwb5C/i6oj10XQL+yTzKfX4a3g6lMa8RaTSD3h1GB1vdscGUNnSh9nXHaWVXs
 tOROOcUDRZiAGApyfqSCibxrRNd/SQV1onczLJ4N0mJKrxGx6FKVCxXIt8c6fXAqAlsA
 UqaWS2QQAfraxKLyh7Ge7HoZPJAaZnpI8EGpjZSOgIajWXsBIZbSzI2ja56s3XdmI9Oj
 o8hfN9nfm0OSCVO9pJCHN356eHw6m/7nCvMQmmJwp9e+rGwns+OMvVSA3SXbAj/lwgPB
 8XBg==
X-Gm-Message-State: AOAM5316DMXcqgQQz624ol1Q8wYU9vgqMWYI9n7rsrCkrOSSX0njhAQR
 TGSiwE6D+DyMMIOFpg76G9U=
X-Google-Smtp-Source: ABdhPJzjR/qI8cPl8ds2rdYaH/Z2T+wa7GdtxBsqfthtu+rRMWETNnlnh2Kmx0K7AbjAy+/l/kO8zQ==
X-Received: by 2002:adf:f88d:: with SMTP id u13mr55468037wrp.213.1600684602110; 
 Mon, 21 Sep 2020 03:36:42 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id y2sm18663049wmg.23.2020.09.21.03.36.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Sep 2020 03:36:41 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Cc: "'Ian Jackson'" <iwj@xenproject.org>,
 "'Debian folks: Michael Tokarev'" <mjt@tls.msk.ru>,
 "'Hans van Kranenburg'" <hans@knorrie.org>,
 "'Xen upstream folks with an interest: Andrew Cooper'"
 <Andrew.Cooper3@citrix.com>, <pkg-xen-devel@lists.alioth.debian.org>,
 <xen-devel@lists.xenproject.org>,
 "'My Xen upstream tools co-maintainer: Wei Liu'" <wl@xen.org>
References: <24420.58027.291045.507128@mariner.uk.xensource.com>
 <001b01d68fe9$fb3ae060$f1b0a120$@xen.org>
 <20200921101606.GF19254@Air-de-Roger>
In-Reply-To: <20200921101606.GF19254@Air-de-Roger>
Subject: RE: qemu and Xen ABI-unstable libs
Date: Mon, 21 Sep 2020 11:36:40 +0100
Message-ID: <003801d69003$17dbf100$4793d300$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH2uLOlkL5RRHeQwNjnzSMb6hz+iQIfRTUkAjfOWNypD9d7IA==
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
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Sent: 21 September 2020 11:16
> To: paul@xen.org
> Cc: 'Ian Jackson' <iwj@xenproject.org>; 'Debian folks: Michael =
Tokarev' <mjt@tls.msk.ru>; 'Hans van
> Kranenburg' <hans@knorrie.org>; 'Xen upstream folks with an interest: =
Andrew Cooper'
> <Andrew.Cooper3@citrix.com>; pkg-xen-devel@lists.alioth.debian.org; =
xen-devel@lists.xenproject.org;
> 'My Xen upstream tools co-maintainer: Wei Liu' <wl@xen.org>
> Subject: Re: qemu and Xen ABI-unstable libs
>=20
> On Mon, Sep 21, 2020 at 08:36:55AM +0100, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf =
Of Ian Jackson
> > > Sent: 18 September 2020 17:39
> > > To: Debian folks: Michael Tokarev <mjt@tls.msk.ru>; Hans van =
Kranenburg <hans@knorrie.org>; Xen
> > > upstream folks with an interest: Andrew Cooper =
<Andrew.Cooper3@citrix.com>; Roger Pau Monn=C3=A9
> > > <roger.pau@citrix.com>
> > > Cc: pkg-xen-devel@lists.alioth.debian.org; =
xen-devel@lists.xenproject.org; My Xen upstream tools
> co-
> > > maintainer: Wei Liu <wl@xen.org>
> > > Subject: RFC: qemu and Xen ABI-unstable libs
> > >
> > > Hi all.  Michael Tokarev has been looking into the problem that =
qemu
> > > is using Xen libraries with usntable ABIs.  We did an experiment =
to
> > > see which abi-unstable symbols qemu links to, by suppressing libxc
> > > from the link line.  The results are below.[1]
> > >
> > > Things are not looking too bad.  After some discussion on =
#xendevel I
> > > have tried to summarise the situation for each of the troublesome
> > > symbols.
> > >
> > > Also, we discovered that upstream qemu does not link against any
> > > abi-unstable Xen libraries if PCI passthrough is disabled.
> > >
> > > Please would my Xen colleages correct me if I have made any =
mistakes.
> > > Michael, I hope this is helpful and clear.
> > >
> > >
> > > In order from easy to hard:
> > >
> > >
> > > xc_domain_shutdown
> > >
> > > This call in qemu needs to be replaced with a call to the existing
> > > function xendevicemodel_shutdown in libxendevicemodel.  I think it =
is
> > > likely that this call is fixed in qemu upstream.
> > >
> >
> > I just pulled QEMU master and it appears that destroy_hvm_domain() =
is still calling
> xc_domain_shutdown().
> >
> > >
> > > xc_get_hvm_param
> > >
> > > There are three references in qemu's
> > > xen_get_default_ioreq_server_info, relating to ioreq servers.  =
These
> > > uses (and perhaps surrounding code at this function's call site)
> > > should be replaced by use of xendevicemodel_create_ioreq_server
> > > etc. from libxendevicemodel.  I think it is likely that this call =
is
> > > fixed in qemu upstream.
> > >
> >
> > These references are in compat code for Xen < 4.6. Use of =
(non-default) ioreq server has been
> present in the code for a long time.
> > We can remove them by retiring the compat code.
> >
> > >
> > > xc_physdev_map_pirq
> > > xc_physdev_map_pirq_msi
> > > xc_physdev_unmap_pirq
> > >
> > > These are all small wrappers for the PHYSDEVOP_map_pirq hypercall.
> > > PHYSDEVOP is already reasonably abi-stable at the hypervisor level =
(in
> > > theory it's versioned, but changing it would break all dom0's).
> >
> > The hypercalls are non-tools and directly called from the Linux =
kernel code so they are ABI.
> >
> > > These calls could just be provided as-is by a new stable abi
> > > entrypoint.  We think this should probably go in =
libxendevicemodel.
> > >
> >
> > Rather than simply moving this calls into libxendevicemodel, we =
should think about their
> interactions with calls such as
> > xc_domain_bind_pt_pci_irq() below and maybe have a stable library =
that actually provides a better
> API/ABI for interrupt
> > mapping/triggering although...
>=20
> I've thought the same when speaking with Ian about this, as (for HVM
> passthrough) we use the physdev op to obtain a pirq from a physical
> device interrupt source (a MSI entry in the QEMU case, because the
> legacy interrupt is bound by the toolstack IIRC) and then use that
> pirq to bind it to a guest lapic vector.
>=20
> I think in a sense such physical interrupt abstraction (the pirq) is
> helpful in order to simplify the binding, as you don't end up with a
> hypercall with a massive number of parameters to identify both the
> source and destination interrupt data. It's also helpful when the
> guest changes the interrupt binding, as you then only update the guest
> side and keep using the same pirq.
>=20
> We might want however to have an interface more specific to
> passthrough, such that the pirqs (or maybe we could just call them
> handles) returned by such interface can only be used with guest
> specific bind hypercalls?

Yes, that sounds sensible: we have functions to allocare/free a pirq =
handle and then functions to bind/unbind such a handle to guest vector.

>=20
> > I've long felt PCI pass-through should not be done by QEMU anyway =
(not least because we currently
> > have no mechanism for PCI pass-through to PVH domains).
>=20
> Having xenpt in tree would be fine IMO. Now we have all the proper
> infrastructure in place to allow different pci devices to be handled
> by different emulators IIRC, which is all that's required for this to
> work correctly.

To be useful we need a way of selecting pass-through emulator in the =
toolstack and we also need to re-visit moving the PCI hotplug controller =
implementation into Xen (and augmenting the ioreq server API to add some =
sort of unplug request callback). I'll give it some thought.

  Paul

>=20
> Thanks, Roger.


