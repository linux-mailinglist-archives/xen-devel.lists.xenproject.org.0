Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA01C23C9F8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 12:43:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3Gsw-0000O8-H0; Wed, 05 Aug 2020 10:43:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UJHd=BP=amazon.co.uk=prvs=479daf7cf=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k3Gsu-0000O3-RM
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 10:43:00 +0000
X-Inumbo-ID: 7eda6b78-f5a3-4f28-9b75-b6a626977f24
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7eda6b78-f5a3-4f28-9b75-b6a626977f24;
 Wed, 05 Aug 2020 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1596624180; x=1628160180;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=VRAPOeC1MmOq3/iWAGGXVUHPh8eViJyWgIeLUk1RZ8w=;
 b=ry9n7reS4ZCsQ7l4Pd3XqLxrnUSs/sr+3I3ppoH1N/dsmLI+aTCGIFfb
 0WQVRzd37uRKMyktUT4rAblQHljH4/dvQVUnLRdYjXyw93l32P60k5jpE
 kow43QNH+Re0bjSvGbSP4Krra02XCR0vbsbCcEcFCe65SEM9Aad02gqWX Q=;
IronPort-SDR: boTZSxI9IQH/b8wfGaTzW1Kb63Sqzw+kDORKnfxftFDfzfUep+D8eTDUN0Bo3hhnR6wBTBwoYX
 q/68jUznU2/A==
X-IronPort-AV: E=Sophos;i="5.75,436,1589241600"; d="scan'208";a="64498978"
Subject: RE: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the
 frontend via xenstore
Thread-Topic: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the
 frontend via xenstore
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 05 Aug 2020 10:42:56 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id C8F07A0807; Wed,  5 Aug 2020 10:42:54 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 5 Aug 2020 10:42:54 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 5 Aug 2020 10:42:53 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 5 Aug 2020 10:42:53 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Index: AQHWalBvjr/TvfDJJEyo1xgwd7E00aknzdYAgAAEPoCAACBVAIABTyMAgAACc7CAAAl7AIAABRVA
Date: Wed, 5 Aug 2020 10:42:53 +0000
Message-ID: <8fc31fce45d54e8a92bf3755fa829a84@EX13D32EUC003.ant.amazon.com>
References: <20200803124931.2678-1-paul@xen.org>
 <20200803124931.2678-5-paul@xen.org>
 <24361.17132.762055.478992@mariner.uk.xensource.com>
 <002001d66a51$3cd055f0$b67101d0$@xen.org>
 <24361.18433.500622.984594@mariner.uk.xensource.com>
 <002801d66a63$85fb8c10$91f2a430$@xen.org>
 <24362.31810.819871.943707@mariner.uk.xensource.com>
 <f1e3c392c45246e1aba7329d1b03da5b@EX13D32EUC003.ant.amazon.com>
 <24362.34372.501505.911622@mariner.uk.xensource.com>
In-Reply-To: <24362.34372.501505.911622@mariner.uk.xensource.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 'Wei Liu' <wl@xen.org>, "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 05 August 2020 11:13
> To: Durrant, Paul <pdurrant@amazon.co.uk>
> Cc: paul@xen.org; xen-devel@lists.xenproject.org; 'Wei Liu' <wl@xen.org>
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
> Durrant, Paul writes ("RE: [PATCH v2 4/4] tools/hotplug: modify set_mtu()=
 to inform the frontend via
> xenstore"):
> > > -----Original Message-----
> > > From: Ian Jackson <ian.jackson@citrix.com>
> ...
> > Well, I guess we address the driver domain issue in this way
> > too... I will add a patch to libxl to write the libxl_device_nic mtu
> > value into xenstore,
>=20
> Do you mean libxl in dom0 or libxl in the driver domain ?
>=20
> libxl contains code that runs in both contexts.
>=20
> See device_hotplug in libxl_device.c, in particular notice
>     if (aodev->dev->backend_domid !=3D domid) {
>=20
> If you want the mtu to be read from the bridge, it can only be
> determined by the driver domain, because the bridge is in the driver
> domain.
>=20
> In v2 of this series you arrange for the hotplug script to copy the
> mtu from the bridge into the frontend path.  That won't work because
> the hotplug script can't write to that xenstore node because (unlike a
> domo0 backend) a driver domain backend doesn't have write access to
> the frontend so can't create a new node there.
>=20
> ISTM that it is correct that it is the hotplug script that does this
> interface setup.  If it weren't for this erroneous use of the frontend
> path I think the right design would be:
>   * toolstack libxl reads the config file to find whether there is an MTU
>   * toolstack libxl writes mtu node in backend iff one was in config
>     (and leaves the node absent otherwise)

This is where the 'subsequent patch' comes in (see the end of the email)...

>   * driver domain libxl runs hotplug script
>   * driver domain hotplug script looks for mtu in backend; if there
>     isn't one, it gets the value from the bridge and writes it to
>     the backend in xenstore
>   * driver domain backend driver reads mtu value from backend path
>   * guest domain frontend driver reads mtu value from backend path
>   * on domain save/migrate, toolstack libxl will record the mtu
>     value as the actual configuration so that the migrated domain
>     will get the same mtu
>=20

That sounds right.

> I don't think I understand what (in these kind of terms) you are
> proposing, in order to support the frontends that want to read the mtu
> from the frontend.

We need some way for creating the frontend node such that the driver domain=
 has write access. Presumably there is a suitable place in the toolstack in=
stance of libxl to do this. This would mean we either need to write a senti=
nel 'invalid' value or write the default value. In the default case we coul=
d still leave the backend node absent so the hotplug script will still know=
 whether or not a value was set in the cfg.

>=20
> >  I think the current setting of 1492 can be changed to 1500 safely
> > (since nothing appears to currently use that value).
>=20
> Right, that seems correct to me.
>=20
> > The hotplug script should then have sufficient access to update, and
> > a subsequent patch can add a mechanism to set the value from the
> > config.
>=20
> I think what I am missing is how this "subsequent patch" would work ?
> Ie what design are we aiming for, that we are now implementing part
> of ?

The subsequent patch would be one that actually acquires the mtu value from=
 the vif config, and adds documentation to xl-network-configuration.5.pod, =
since this is currently missing.

  Paul

>=20
> Ian.

