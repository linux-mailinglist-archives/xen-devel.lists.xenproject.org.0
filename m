Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC40299433
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 18:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12516.32586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX6Xz-0006Tv-9y; Mon, 26 Oct 2020 17:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12516.32586; Mon, 26 Oct 2020 17:44:43 +0000
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
	id 1kX6Xz-0006TW-6n; Mon, 26 Oct 2020 17:44:43 +0000
Received: by outflank-mailman (input) for mailman id 12516;
 Mon, 26 Oct 2020 17:44:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TsF=EB=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kX6Xx-0006TP-1w
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:44:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [51.163.158.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7a05408-0de9-44ab-8bdb-e68065950964;
 Mon, 26 Oct 2020 17:44:40 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-KzpoajMePXqRQchpX_6GvQ-1; Mon, 26 Oct 2020 18:44:36 +0100
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB5010.eurprd04.prod.outlook.com (2603:10a6:208:c3::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 26 Oct
 2020 17:44:33 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::db0:41c3:aa05:d082]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::db0:41c3:aa05:d082%6]) with mapi id 15.20.3499.018; Mon, 26 Oct 2020
 17:44:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3TsF=EB=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kX6Xx-0006TP-1w
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:44:41 +0000
X-Inumbo-ID: a7a05408-0de9-44ab-8bdb-e68065950964
Received: from de-smtp-delivery-102.mimecast.com (unknown [51.163.158.102])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a7a05408-0de9-44ab-8bdb-e68065950964;
	Mon, 26 Oct 2020 17:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1603734278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s+dcP0fDsH7fHeSWMU+ap3zr7bH622FyjHlpD2W3gSI=;
	b=ZzWkxp/t8yzNmtH9s2MNdyKLEyqD7PBE18AketkiIjnAAI7xbCXhxWdoYiopvTpuJMeR47
	N6oP2zfqYQb8KjTEhCUEY5n77eMFtj1aXT9Z/v5G9lcZ1PIZ/MqQkaOfW8Q3UWfu9JmigH
	gELm1BVee/wnJIz5kyLSY9IJR/jgTN4=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-KzpoajMePXqRQchpX_6GvQ-1; Mon, 26 Oct 2020 18:44:36 +0100
X-MC-Unique: KzpoajMePXqRQchpX_6GvQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2aNUeYsGKkOy5fpABeZP48YPp5kjq061clD/DFK9BT7aTmDug2Xg5lPbB4aGBRiUpBPg8s4TpJxHUI3/0V2H+WFxnk40CShD+MEu/z0RIPb/7rwTtNzr0yj7qojluKp5wuX9xG9peXP5xEjT3PiIjtonzXN2Gd/B9jWv7dcXvuF+PCJr+r7C/fP9muc5WqBI1C6B0365fsY568zqX+oBLsgf+P4a2g/cHWCPk8yAhWaPRlYQByxiT4kBpoSlavuf/0RSPhZps3n+05NlScQRq3qpubehNab12eVt/tBK5kQX+uN3KfL3kkfncXtvYFeSqm+IIoMq/rFpfv3HBt+4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+dcP0fDsH7fHeSWMU+ap3zr7bH622FyjHlpD2W3gSI=;
 b=EtlMy0e383W75vSzQIt3zDvFBEn1KYgaisj096OfMxKolWHAaCnTpqHd90eRLNG4yRU67Q2d/EBd8h4Ek5GxUehR6aZvll1l899IyzSMpqBNIl87exHID9QNDG5A/Nmiw+TqD0ZelQR1KCG0O/GXPPW/lrqHQc30oYj7t6Nmgnl040KtnqCMBKTOQSASTul1uOs/8RB8jKDoV0+FoCekw/jIbtwjr/+LmHq3hCzkqugr1Fk+7CAdsDYBCXTWP4rnZiBgHwK5Aejl2WEQxPWRtN5L6aqvNiapaJ+Iyj4jnRYlMn8lK2WgG/YUk7FMrfN5WzdfYJRzfqzSyvc3xYxtqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB5010.eurprd04.prod.outlook.com (2603:10a6:208:c3::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 26 Oct
 2020 17:44:33 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::db0:41c3:aa05:d082]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::db0:41c3:aa05:d082%6]) with mapi id 15.20.3499.018; Mon, 26 Oct 2020
 17:44:33 +0000
From: Dario Faggioli <dfaggioli@suse.com>
To: "dunlapg@umich.edu" <dunlapg@umich.edu>
CC: Juergen Gross <JGross@suse.com>, Jan Beulich <JBeulich@suse.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] [PATCH] xen: credit2: document that min_rqd is valid
 and ok to use
Thread-Topic: [Xen-devel] [PATCH] xen: credit2: document that min_rqd is valid
 and ok to use
Thread-Index: AQHWq4TS/h5FA3rgjEyszqb6NOGihKmqKEQA
Date: Mon, 26 Oct 2020 17:44:33 +0000
Message-ID: <815860112d49d09cec5d70dfe75b9a659ec061ca.camel@suse.com>
References: <158524252335.30595.3422322089286433323.stgit@Palanthas>
	 <CAFLBxZaPNsxoazbB=e1sN7A=gzvr2rpAj7qdA73TtcRpPqUkLw@mail.gmail.com>
In-Reply-To:
 <CAFLBxZaPNsxoazbB=e1sN7A=gzvr2rpAj7qdA73TtcRpPqUkLw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.38.1 (by Flathub.org) 
authentication-results: umich.edu; dkim=none (message not signed)
 header.d=none;umich.edu; dmarc=none action=none header.from=suse.com;
x-originating-ip: [89.186.78.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7e16f8d-f0ca-43a0-c8b1-08d879d6ccc5
x-ms-traffictypediagnostic: AM0PR04MB5010:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <AM0PR04MB50105713137F6C77C182DC2DC5190@AM0PR04MB5010.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dl0cnC0VBRvm20WlRuoHtEGW3olMRqkW5lQM5aPYC7H72cg4p5qWn31dUfo9hxlsRdzv5F/AGf02G0e2iA7EsweSJ5b/lO/CPUcObmiSMy8g3/rILAdy+bNZaaaoSonl85Bahb4TaU4vF0Dx9XT2CwrRX+FFcPp0PhVt4rthxtTi+VMdMPn5Nw2ZCfDkC7YthvUt6/3o30OpNF2JmdspqhAT3WMIgVIAFSPtgFxHApnnSiOlBQBtwvXqYawZS631suwnEe4b+UeKtcL8a5FZxHoKBJBGSckMBimHtqVLby/ZJS65D7elP3nxcy8Ux9rbrdNMWDE0DATnzPkOVg2E3kNiq0+JZVc6fh1q8DUT8PTOyIMixI9a8m7TFGf1lywIMh5sFyctkdQAcZSXIJWCzw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(366004)(136003)(376002)(396003)(36756003)(26005)(6916009)(76116006)(86362001)(4001150100001)(2906002)(54906003)(186003)(478600001)(8936002)(5660300002)(966005)(2616005)(66616009)(66476007)(64756008)(83380400001)(99936003)(6486002)(66446008)(4326008)(66556008)(8676002)(71200400001)(6512007)(66946007)(53546011)(316002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 s/injg2lhCURwqSxQz2uQOUl4XpctC9zuuq1vGLhG/sCNMvMwwD9F2JkLyRi0pFkxKgghb1nkyvu7L9RPpy4L7UvjFNzhnrjTrwQi5XuEaU5y+QqDmYtb3oCmepKbTFpe4Ln2Sdn0cuGrX0ewlCMbpnpxFcPIeIoTYbrHEF/foI+JzVKyB/6103aI+mqISS4hRfHHuufL2m9Hm84MeoqWQTSzklUsxP9MV3aQsKYbSvqOwk4K1DCKfhG7BFNZQHzSPLmqa9CwDb+eRVPYlZnim1ykFun1dLSKBJN97xGF+bdRAxQurAyJLy6JAz3e5njaq+pV7Jr6gfLPrPcC4Y/ubaIC1hqjitI9s8lAo4wzcdmgLiedpqx50b3kjAL/GVepZ5/yIVXha+vsRJUImC/v4/NSbZ5YRqu7wy/BNnYqB7Ahy5+KP0oMdOK9PTPbASI9N48K9pzERsZ+OgaC1aJqTkIX2YTXHpNTAEn+VlOj6dW9xQjCQ0Z1xYkaaRsLG0Cv4tmWO+UGod0wejDS71jACeroXyDiHOOprjArU/w9+oQJxfj+ltJofoTy67XajuolTQSdXclP5ckPWf0F4sZToOq9t6pPIyfMiv9LwQ6B30qfOBzpst8JW9hPq674+j60mxhn/A6Zg8pfiRIHl2pcg==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-VbeZjh9/9BT2JlfMdhj/"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e16f8d-f0ca-43a0-c8b1-08d879d6ccc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 17:44:33.7731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ufGS4swowTsoMteklvZWRD6Bb/SPJWYhV/4YcHvDVbC7seLr7nrtMqi6tzKYKhbqRZBDNEFAuDU65rRV1wIzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5010

--=-VbeZjh9/9BT2JlfMdhj/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-10-26 at 10:43 +0000, George Dunlap wrote:
> On Thu, Mar 26, 2020 at 5:09 PM Dario Faggioli <dfaggioli@suse.com>
> wrote:
> > diff --git a/xen/common/sched/credit2.c
> > b/xen/common/sched/credit2.c
> > index c7241944a8..9da51e624b 100644
> > --- a/xen/common/sched/credit2.c
> > +++ b/xen/common/sched/credit2.c
> > @@ -2387,6 +2387,13 @@ csched2_res_pick(const struct scheduler
> > *ops, const struct sched_unit *unit)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_up;
> > =C2=A0 =C2=A0 =C2=A0}
> >=20
> > + =C2=A0 =C2=A0/*
> > + =C2=A0 =C2=A0 * If we're here, min_rqd must be valid. In fact, either=
 we
> > picked a
> > + =C2=A0 =C2=A0 * runqueue in the "list_for_each" (as min_avgload is
> > initialized to
> > + =C2=A0 =C2=A0 * MAX_LOAD) or we just did that (in the "else" branch) =
above.
> > + =C2=A0 =C2=A0 */
>=20
>=20
> Sorry it's taken so long to get back to you on this.
>=20
> The problem with this is that there are actually *three* alternate
> clauses above:
>=20
> 1. (has_soft && min_s_rqd)
> 2. min_rqd
> 3. <none of the above>
>=20
Yes, indeed.

However, one of the three is "if (min_rqs)", and I think it is clear
that in that case (which would be 2 in the list above) min_rqd is
valid.

Therefore, this part of the comment "In fact, either we picked a
runqueue in the "list_for_each" (as min_avgload is initialized to
MAX_LOAD)", was referring to 1.

And this other part "or we just did that (in the "else" branch) above",
was referring to 3.

> It's obvious that if we hit #2 or #3, that min_rqd will be set.=C2=A0 But
> it's not immediately obvious why the condition in #1 guarantees that
> min_rqd will be set.
>=20
That's what I tried to explain with this: "we picked a runqueue in the
"list_for_each" (as min_avgload is initialized to MAX_LOAD)"

> Is it because if we get to the point in the above loop where
> min_s_rqd is set, then min_rqd will always be set if it hasn't been
> set already?=C2=A0 Or to put it a different way -- the only way for
> min_rqd *not* to be set is if it always bailed before min_s_rqd was
> set?
>=20
The point is really that the "list_for_each" loop scans all the
runqueues. If we do at least one step of the loop, min_rqd is ok,
because min_avgload is initialized to MAX_LOAD, and hence we have done
at least one assignment of min_rq=3Drqd (in the body of the very last if
of the loop itself).

min_s_rqd may or may not have been set to point to any runqueue. But if
it is valid, it means we have done at least one step of the loop, and
hence min_rqd is valid too.

Makes sense? :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-VbeZjh9/9BT2JlfMdhj/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+XBMoACgkQFkJ4iaW4
c+6nYw//ZL0XdoWgUouXWjsi3xKYACHJSyvf+GOe1D7+axLgvv5iOgNH6mySas3e
/q1lnQONe+kSl8kSM/yBpCcJRR2PwhPaX+/AFscA2CIc2zAXCnZjVwzV8AGGlWu9
vi5uwFkMuD7bVgZviU2p/Qd83sAzrs/Ej4PGuYo1caBJOPv2/UdreA7Nyk9ydlad
XXoAWSB/VZvcHfZKHLV8zwlmw6vC3lGuen07Kl1ehdsVG2p5fT4RZlOlm+l9B7rA
Wl600iPEAF79yzHjbQYjm/0AgYKaArYylDCFa2HhklJ+HreIizUfvo2mZ2DPUfBo
cjNaqYyNoUr8mC2wsdYrdCETGH3+HpF75qdC9E4kRw+aPPE2tVJxb0AcoXkKs8Fa
0IK7wm9bnfwvdP1cwQEKn15IrE7wWA6V+6WujRndG5YmYZxFk4cDqzK2KcXbCH7Y
I3rVlLDBle7q8wW6mjj8Vyghz88Vsx0k6pJl2CjH1JCcDW+YcTJWuPg5GVtA5kM7
OMyBJf+q4IJxHark6P8mL5cmfs+WuWiVGEmVypjQaFdGu+I3czX1Kdr+Ja/+l5je
YBW/Uboti63832O1mawDR8ZPaieImBZoU7tu635UKirNJH0jQ5Rc06+nBYVKQJol
Yd9otYdp7IA7NzHAC/hmdrcjF0KXoUsy3Yy9L3SYX+8N120DLKI=
=CZ09
-----END PGP SIGNATURE-----

--=-VbeZjh9/9BT2JlfMdhj/--


