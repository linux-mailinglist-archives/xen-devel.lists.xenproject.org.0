Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3949299276
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 17:31:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12451.32418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX5Oo-0007M1-Ug; Mon, 26 Oct 2020 16:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12451.32418; Mon, 26 Oct 2020 16:31:10 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX5Oo-0007Lc-RM; Mon, 26 Oct 2020 16:31:10 +0000
Received: by outflank-mailman (input) for mailman id 12451;
 Mon, 26 Oct 2020 16:31:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TsF=EB=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kX5On-0007LW-FR
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:31:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [51.163.158.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e28c21c-8246-4a4f-b11f-08762a654786;
 Mon, 26 Oct 2020 16:31:05 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-ogrNgqPRPp-M8HVy-1nUkQ-1; Mon, 26 Oct 2020 17:31:02 +0100
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM8PR04MB7266.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 26 Oct
 2020 16:31:01 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::db0:41c3:aa05:d082]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::db0:41c3:aa05:d082%6]) with mapi id 15.20.3499.018; Mon, 26 Oct 2020
 16:31:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3TsF=EB=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kX5On-0007LW-FR
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:31:09 +0000
X-Inumbo-ID: 0e28c21c-8246-4a4f-b11f-08762a654786
Received: from de-smtp-delivery-102.mimecast.com (unknown [51.163.158.102])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0e28c21c-8246-4a4f-b11f-08762a654786;
	Mon, 26 Oct 2020 16:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1603729864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aB/GevxpENHG7YFJITbPgqvDU4lP4uZ9P5yFjCmyIns=;
	b=Yi9VxD/7TkIxJLgNcefJSAqovwA0+QwszBXKGnqPpeWkQkp94HCFpyO/+6N1fZGtGdwCqM
	NRMQv/tY1LmOk/TRbqiEkis42kE2JaeNoPiIgO3QMtAieRoEwnOn8q7Nnwy2VZyqtvPE4p
	VKksNJPEfWWBmWIU+G4h9Ec8vy5gtVc=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-ogrNgqPRPp-M8HVy-1nUkQ-1; Mon, 26 Oct 2020 17:31:02 +0100
X-MC-Unique: ogrNgqPRPp-M8HVy-1nUkQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQCfcUp4U/H9cPg9+Ij41KFMbNdMqdDj6vJIX0iNgdrUYcmvy2EA39i1qhdyjOH53Eh823JYaotV9d+zNttsYETZH52TISqe+YnzoRQM7dsMBd8VewfIP4IaBe+B6bQ3ZP+wUq+2rtNDeXbBll96YA2hlrqCfJ32SNNuZ9+0bffo6lLvr/qEylP5faL0Vq9D0idadJlatOBeFr/dEObTuCHKIe4Mll8I2o7Dsa33pzNQJ/biC7bp8jT2sQCAoTCfAw2Fw3m24ZMtJT21bFQziZyUBuR73Pj78sVSW9Ak3/1nASXE8frG2YDoKghRnb+r5ljLm9oPVbtxpwxmw11bPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aB/GevxpENHG7YFJITbPgqvDU4lP4uZ9P5yFjCmyIns=;
 b=K+oM/aS0eBVfDYpbwBdUzVGeNmNXzPOdxYpi5hMvziF+01dl8q9zGveL3zTnSshsAZvDUBaqB2qMVe4NWeQeUFEWlZ0XMd3mbuiP8Vf/qrEKKxlPfzzZLqymvwcWjKnSOHHIidwwWpX1wLC6xTm8z4jitL9arI165XIrC69WjM6/ZuoclB7t6vD6PDiFiSv3SRuwPK4DXRJxOBjDJoMYgvSPjxP7u+ah2uAfwK+fii++UpuFri2MTKkmHzetzIlSHCdv6jYagEVzCXqcXeeUEmcwhFTWfHvflNNmzWNR5KzdJWDwZN38/AA529B/cnTseXiYKGCvxLL/PFHb7HiRlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM8PR04MB7266.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 26 Oct
 2020 16:31:01 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::db0:41c3:aa05:d082]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::db0:41c3:aa05:d082%6]) with mapi id 15.20.3499.018; Mon, 26 Oct 2020
 16:31:01 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <JGross@suse.com>, "George.Dunlap@citrix.com"
	<George.Dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
	"frederic.pierret@qubes-os.org" <frederic.pierret@qubes-os.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
Thread-Topic: Recent upgrade of 4.13 -> 4.14 issue
Thread-Index: AQHWq6SD/uyafOnyXU2hV/eab0QUF6mqE3EA
Date: Mon, 26 Oct 2020 16:31:01 +0000
Message-ID: <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
References: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
	 <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
	 <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
In-Reply-To: <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.38.1 (by Flathub.org) 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56fdfeec-232a-4cc0-e23d-08d879cc86b8
x-ms-traffictypediagnostic: AM8PR04MB7266:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <AM8PR04MB7266666EA4132257392C7789C5190@AM8PR04MB7266.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LTcKB0Rxbuvcl6Hg8UWre/zW64pOWpXbucte3GoPpI09xt77it75REEEq84fceQPujnwW6WE7ifovNh3nIhjo3tBNMvVUp29RyEm4bfOuFvpoeNTF5guz6K+BYugP/07Rn8XFD1EZWPombAWbsldZEog6LPWpsOqEApP32x59gHARRnivKfQOzZFEmhc/dXBkI4t4smRtJ31EiWVvpsn1RyjNtk8zjF1uGdbPBk4AQozT7WR0Yl1LxRClMi9IPdQdDB/uGmG3BV8XFpKmbRSqj3sXLsnvNK3wT60isXFjt4hN180bfNRuOCbzzr+GswtpfsdRdLQw5CVuE5NV6bVS67z/TseeW/iIgzlxPU561xFlE1+lP2zjN2h3omwuEcNtJy71OWLe625irp3t/twuQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(39860400002)(136003)(366004)(6486002)(86362001)(76116006)(8936002)(4326008)(186003)(6506007)(4001150100001)(66574015)(5660300002)(99936003)(66946007)(8676002)(2906002)(66616009)(2616005)(66476007)(66556008)(6512007)(36756003)(83380400001)(478600001)(110136005)(53546011)(54906003)(26005)(64756008)(71200400001)(966005)(66446008)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 ieJtbYPaeJrekP9LROFuz47m0OTaNHmWtmaZ8VyZdYPFNfEq5fc1KlOwRB4e9leGczDzBK1e1YoXHoPkGiR4OF8Fl1HkQKRdvrJt5e738gn3A+SlxoPn5u6D+YqOmMutBF0ubPqWmMu20jaszEqziys9QzMiPGiGMi3AF6dsEZMWSEg50fGRLtjf7KNQFTDGePN99N9kLdIFeMDF951dnm1fBScA9sQ54FkPNOTl/SBxmCLc98o3FImPzR8TdsQYWwDThBPAB4vhYALXgBRLeJWay4IycDAbI72CztEccojdIS6tHySO4+toSx3NP250jME3LjHC8tGKMmx/3EprU5LEQCurcKjEkcAUFuU/+fb450mR20A1z0HI0S3HTHyFwKbQFNKwxR8ihv92p30atmE2+MhFWewz778yVqYmtM7qAKVBTOcDAi01OqUG5gOarqRkG4JgQuv7FSh9pgmAfgqHc690lPHex5fRB5kP7tue0uBslmM4edIBIqyplnuoTLDsxlx15LHZvLD2S8pgiqCGpQV5xsxOLg3fXyGpWc+Vepcde00TMiXnmaDqFPVHa8Wmzrp5iCENdlYm0dPQ7IQLV7WpjcNI+kJdktkmoBSXTAw/NA4eYFjvjGGee4XSq/xFXLaa2eNdDqeILMo1GA==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-xUngC0FMeVHxvue983WA"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fdfeec-232a-4cc0-e23d-08d879cc86b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 16:31:01.2538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7WaSwT2Y2CMrpjrDQhfLJrJf6G0gtivB4b+PPdVgv5l24PV2FxSwQoL7tWg+vpuqRDc9RNqRzNvP52L6fJtezQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7266

--=-xUngC0FMeVHxvue983WA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-10-26 at 15:30 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 26.10.20 14:54, Andrew Cooper wrote:
> > On 26/10/2020 13:37, Fr=C3=A9d=C3=A9ric Pierret wrote:
> > >=20
> > > If anyone would have any idea of what's going on, that would be
> > > very
> > > appreciated. Thank you.
> >=20
> > Does booting Xen with `sched=3Dcredit` make a difference?
>=20
> Hmm, I think I have spotted a problem in credit2 which could explain
> the
> hang:
>=20
> csched2_unit_wake() will NOT put the sched unit on a runqueue in case
> it
> has CSFLAG_scheduled set. This bit will be reset only in
> csched2_context_saved().
>=20
Exactly, it does not put it back there. However, if it finds a vCPU
with the CSFLAG_scheduled flag set, It should set
CSFLAG_delayed_runq_add flag.

Unless curr_on_cpu(cpu)=3D=3Dunit or unit_on_runq(svc)=3D=3Dtrue... which
should not be the case. Or where you saying that we actually are in one
of this situations?

In fact...

> So in case a vcpu (and its unit, of course) is blocked and there has
> been no other vcpu active on its physical cpu but the idle vcpu,
> there
> will be no call of csched2_context_saved(). This will block the vcpu
> to become active in theory for eternity, in case there is no need to
> run another vcpu on the physical cpu.
>=20
...I maybe am not seeing what exact situation and sequence of events
you're exactly thinking to. What I see is this: [*]

- vCPU V is running, i.e., CSFLAG_scheduled is set
- vCPU V blocks
- we enter schedule()
  - schedule calls do_schedule() --> csched2_schedule()
    - we pick idle, so CSFLAG_delayed_runq_add is set for V
  - schedule calls sched_context_switch()
    - sched_context_switch() calls context_switch()
      - context_switch() calls sched_context_switched()
        - sched_context_switched() calls:
          - vcpu_context_saved()
          - unit_context_saved()
            - unit_context_saved() calls sched_context_saved() -->   =20
                                          csched2_context_saved()
              - csched2_context_saved():
                - clears CSFLAG_scheduled
                - checks (and clear) CSFLAG_delayed_runq_add

[*] this assumes granularity 1, i.e., no core-scheduling and no=C2=A0
    rendezvous. Or was core-scheduling actually enabled?

And if CSFLAG_delayed_runq_add is set **and** the vCPU is runnable, the
task is added back to the runqueue.

So, even if we don't do the actual context switch (i.e., we don't call
__context_switch() ) if the next vCPU that we pick when vCPU V blocks
is the idle one, it looks to me that we go get to call
csched2_context_saved().

And it also looks to me that, when we get to that, if the vCPU is
runnable, even if it has the CSFLAG_scheduled still set, we do put it
back to the runqueue.

And if the vCPU blocked, but csched2_unit_wake() run while
CSFLAG_scheduled was still set, it indeed should mean that the vCPU
itself will be runnable again when we get to csched2_context_saved().

Or did you have something completely different in mind, and I'm missing
it?


Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-xUngC0FMeVHxvue983WA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+W+bYACgkQFkJ4iaW4
c+5/ww/9G663B2cz0ktfvdS1ZrrcrzSmanFSDq/VlS7NV5kvXeafGQMVLAKZS0Mi
2QWeW6JO1+CxN6rPoweS1HXSgBCEMhDtz2Q6itl6XpjUkz14NmeJOTr01wZ43tUD
UvHM8sCK/+7EGROXNB/aWwPHXCFSJME38F8NUaufjortD/J9Dtb1FNy0timYj82G
tz/OUdbU3ypU9ucStS1xaSFtcu0YiWNgVIQ9IRfNOjVZSTFNPubFRtkkSdPSw4Zi
DgH9Oh+Xm0xsx5nt8GY7tVF+2pczZRpxihi7NagzejzrSbO/ftaWm9iWOPfDKine
etQf9qzASKYeE+egiVXww3DDWY60w0GSHy+F09izcilHekCibMu1EMPL1mjdsQY2
GICqC34zNT9GVlE2dbP4qNHNeQKmt0yReM2EWvu2YThawIb1KxkCCwlv/84O4voj
uQYiHxBCuksvuS8zi+0Z1vYva071S6T6OgDPhQp5D9J076ZxQ+6Ugs+FlIheBQei
aVLL9fCyYTCNX+ts3DQ6YscOfNux737cw42gdPtm8pc/UXbrMA1VNu1qBOg2T3xv
L/+k3od6ISRUGJnICknvqkJWgHP/w2R2vv0TQX/9Lc//BEzqQm+gM4IvczxffsnS
wEBzBiteNyyTftpw0kVPRd+wEsOIcTqhq+JsY0vAPY100g3G+2s=
=uTft
-----END PGP SIGNATURE-----

--=-xUngC0FMeVHxvue983WA--


