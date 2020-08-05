Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B9C23C96B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 11:45:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3Fyc-0003Qh-98; Wed, 05 Aug 2020 09:44:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UJHd=BP=amazon.co.uk=prvs=479daf7cf=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k3Fya-0003Qc-J4
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 09:44:48 +0000
X-Inumbo-ID: 64ea7f85-7265-410a-9f74-75ae43ad0366
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64ea7f85-7265-410a-9f74-75ae43ad0366;
 Wed, 05 Aug 2020 09:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1596620687; x=1628156687;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=za7okMpA4SI+IfCgnq91XC9ou5HIclFe21JqbIWoxmw=;
 b=UYxjuncvyLbTdloGOwhrAYO5x5EUzZIjAxK4NdK19D9IKYXJBrARa1sR
 ojHNJaIA08W3ic0d/uWLW+F7Mp1xy2167nz0xlunxMnbk7qNicEzpxrq1
 6muhIXlTuULz6486PXjRrO1wq5k4e+YEp5KgmGhz+la60ye2Zt3udYdQE 4=;
IronPort-SDR: rI2cdBR4CUe1Dzg4XdmWXd4I4RxSrjWtpUCmhzzGh9wFvLzDKck2Us+mEXbFCSaDX50ACSYgZE
 KjtipuXjMsCQ==
X-IronPort-AV: E=Sophos;i="5.75,436,1589241600"; d="scan'208";a="47582771"
Subject: RE: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the
 frontend via xenstore
Thread-Topic: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the
 frontend via xenstore
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 05 Aug 2020 09:44:46 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 737C0A17C0; Wed,  5 Aug 2020 09:44:45 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 5 Aug 2020 09:44:44 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 5 Aug 2020 09:44:44 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 5 Aug 2020 09:44:43 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>, "paul@xen.org" <paul@xen.org>
Thread-Index: AQHWalBvjr/TvfDJJEyo1xgwd7E00aknzdYAgAAEPoCAACBVAIABTyMAgAACc7A=
Date: Wed, 5 Aug 2020 09:44:43 +0000
Message-ID: <f1e3c392c45246e1aba7329d1b03da5b@EX13D32EUC003.ant.amazon.com>
References: <20200803124931.2678-1-paul@xen.org>
 <20200803124931.2678-5-paul@xen.org>
 <24361.17132.762055.478992@mariner.uk.xensource.com>
 <002001d66a51$3cd055f0$b67101d0$@xen.org>
 <24361.18433.500622.984594@mariner.uk.xensource.com>
 <002801d66a63$85fb8c10$91f2a430$@xen.org>
 <24362.31810.819871.943707@mariner.uk.xensource.com>
In-Reply-To: <24362.31810.819871.943707@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.209]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 'Wei
 Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 05 August 2020 10:31
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; Durrant, Paul <pdurrant@amazon.co.uk>=
; 'Wei Liu' <wl@xen.org>
> Subject: RE: [EXTERNAL] [PATCH v2 4/4] tools/hotplug: modify set_mtu() to=
 inform the frontend via
> xenstore
>=20
> CAUTION: This email originated from outside of the organization. Do not c=
lick links or open
> attachments unless you can confirm the sender and know the content is saf=
e.
>=20
>=20
>=20
> Paul Durrant writes ("RE: [PATCH v2 4/4] tools/hotplug: modify set_mtu() =
to inform the frontend via
> xenstore"):
> > > -----Original Message-----
> > > From: Ian Jackson <ian.jackson@citrix.com>
> ...
> > > Actually.
> > >
> > > This shouldn't be in the frontend at all, should it ?  In general the
> > > backend writes to the backend and the frontend to the frontend.
> > >
> > > So maybe I need to take back my R-b of
> > >   [PATCH v2 3/4] public/io/netif: specify MTU override node
> > >
> > > Sorry for the confusion.  I seem rather undercaffienated today.
> >
> > Too late. The xenstore node has been used by Windows frontends for the =
best part of a decade so we
> can't practically change the
> > path. Another way would be to also modify netback to simply echo the va=
lue from backend into
> frontend, but that seems rather
> > pointless.
>=20
> Hmm.  How does this interact with driver domains ?  I think a driver
> domain might not have write access to this node.
>=20

That's a good point; I think we will also need to actually write it from li=
bxl first in that case.

> Is there a value we can store in it that won't break these Windows
> frontends, that libxl in the toolstack domain could write, before the
> hotplug script runs in the driver domain ?
>=20
> > Interestingly libxl does define an 'mtu' field for libxl_device_nic, wh=
ich it sets to 1492 in
> libxl__device_nic_setdefault() but
> > never writes it into xenstore. There is even a comment:
> >
> > /* nic->mtu =3D */
> >
> > in libxl__nic_from_xenstore() which implies it should have been there, =
but isn't.
> > I still think picking up the MTU from the bridge is the better way thou=
gh.
>=20
> I agree that the default should come from the bridge.  Ideally there
> would be a way to override it in the config.
>=20

Well, I guess we address the driver domain issue in this way too... I will =
add a patch to libxl to write the libxl_device_nic mtu value into xenstore,=
 in both backend (where it should always have been) and frontend. I think t=
he current setting of 1492 can be changed to 1500 safely (since nothing app=
ears to currently use that value). The hotplug script should then have suff=
icient access to update, and a subsequent patch can add a mechanism to set =
the value from the config.

  Paul

