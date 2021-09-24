Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DF4417925
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 18:57:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195562.348329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mToVs-0005CV-NU; Fri, 24 Sep 2021 16:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195562.348329; Fri, 24 Sep 2021 16:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mToVs-00059p-KH; Fri, 24 Sep 2021 16:57:28 +0000
Received: by outflank-mailman (input) for mailman id 195562;
 Fri, 24 Sep 2021 16:57:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3weo=OO=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mToVq-00059b-PM
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 16:57:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb504482-6e8f-4d3e-85df-d39b96453610;
 Fri, 24 Sep 2021 16:57:26 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-JAobXZVBPwuJQn4PsboeRQ-1; Fri, 24 Sep 2021 18:57:23 +0200
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB4852.eurprd04.prod.outlook.com (2603:10a6:208:c4::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 16:57:22 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 16:57:22 +0000
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
X-Inumbo-ID: eb504482-6e8f-4d3e-85df-d39b96453610
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632502645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oIoAN0UX4ceFgmqtgrx4FF5mhK3rydaz373p31fVaf0=;
	b=M4tiOz5a+MaDuX1pyx7gIQALQHLLbPaQ5W8bDjp+bERaE70o1R+f+3ISkwSVEy4Ij1DYkM
	gcGKw3ibfaj56O3IlUQ7PvxXbHvJ9CoIJLrOo9tCXDae4YMkzNN2MfS5f5TWsdDg5SiSeJ
	1TfjnRwuJwWVCd8gDOAzoWUa2cbIejs=
X-MC-Unique: JAobXZVBPwuJQn4PsboeRQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9547WxQnAm9OZ0xM4sfoTiugVhy6YXvxh2/XIew5DigC4zufYkhGgNKnUof4CfPHlKRMghjqVUY1G6Gm/XYk0/EOn1nwWfA/bG3qH8/yOlgbMXlzEQE1wCkYVTkGuiGuzFg0nAaYqyCBEoUfqVEDkc+2bXHZLyVLkz7yrUMh9nyGCpz/uOyQnviMvZtz2Q+wJlEdDpEjZwrpxxuib0x6YzKeXdZHHN/hKWOfPl10EFyRXRpmwEn709wfaejiAJmF0ApVGcA1cpt90p1ehQx1tvC3PxWioIqUGe68pScF/55MzZTNcUdQqy2mtqZpcyzoUVo0Dh11Ex7DPzyhegsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oIoAN0UX4ceFgmqtgrx4FF5mhK3rydaz373p31fVaf0=;
 b=XuQJSjt9/Jhd012vi85/jnlt5Nmww04xsAZ0nxibjd7aLWS6MKZqRhoTiJ50xNSmT/Si7gMb5sidHzK3MVdmkPcNbUcjRBCRv0SkxcCr/VyC200zJiOvIK6YDZD146RFA/lfpWdu+jbXtwlKiBsGZmZIoauF9Zh8XQ/NQoY7cF9dCBMX4V5ZPt57oeEBF0TcTMsyFGxPe/urC4lo5xW06TqKk7UKYmu26/W2fZ8Ybl0bxtNNWgMrxvj4FM4GT3jbv20JmjX+KTmOqtOgdDAk5YXTI0qEvv8nNQsdE/Vlg6PxOF3JxK20364j/K6scdX9VGHmKohRoMjLA0PJPXNH8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, "George.Dunlap@eu.citrix.com"
	<George.Dunlap@eu.citrix.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Juergen Gross <JGross@suse.com>, Jan Beulich
	<JBeulich@suse.com>, "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org"
	<wl@xen.org>
Subject: Re: [PATCH v2 08/12] xen/sched: Clean up trace handling
Thread-Topic: [PATCH v2 08/12] xen/sched: Clean up trace handling
Thread-Index: AQHXrkSPAFgdWM+pi0KvFKeP2OUjvKuzbfGA
Date: Fri, 24 Sep 2021 16:57:22 +0000
Message-ID: <8037af821237cea64218ed2a04afbcf40f122fcd.camel@suse.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
	 <20210920172529.24932-9-andrew.cooper3@citrix.com>
In-Reply-To: <20210920172529.24932-9-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.0 (by Flathub.org) 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 513694dd-8921-4daa-9836-08d97f7c60a1
x-ms-traffictypediagnostic: AM0PR04MB4852:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <AM0PR04MB48528E531D9F1F9E845F1E8CC5A49@AM0PR04MB4852.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 EGkcb7UHx7hBe3E0Xyqjt89uIRbGmMOZCDvDk/1y341UmJkgDFktxlCsL6bbdiSRvCaP4/rGdksGPM+ziR0/L/32pokqq25V93TvdeKQ4e2mMJPlyepdiDmfENn/3SUHq0t6yGEIzPGKqciEjAuQGTt1SWGC0iQgMhOl/oxnOeG4naMCzwbsKQrgUjPDifogncNRFqMCHEQxYOvi12bjtg8L5yJLD0D5cnv6R3QV1EGRXU8I6T/EeeX3vxTKitqWvBoEAiISpGnkuAMebUIMlA0wyR7XUD9AkAaNjpg5ToRBP7rCY+FIrugU3YbK7nNUWFO6tBNVsQgSjhtQQ8QZCwa/USnCMtar7ALrNCfK6zli9ZuH1q5XXNGK3B8e02n7pDC1v8nTCNQYh5BUqunOma3sMCW23J6nOfbwvSIGbzda3fDSy53KniMt0OQPV0MA7Yqw24MzxxNa1FuNB4W3v9zaRtXll3jvSuKnDNXE0Xjezok4TqMAh8v4cuMzFYhn1wuU/KHvB4fsnv96+evzPeD/3cJnkZuSXPeJB7Xw2slCX4U1H4mA4UT2wWBsKyF10Kgyd/Y6YgIZ8sGMHJlpy/vvfs9KyrkU10OXDZcUAHcz3inK8qA5S0S+JpajjQVhLnY80R3jxEhwfMVb5kV38Oo6Iemkz3WSraq2r3wcBozR4Ze+QpidqzDMpybb7JPu8Rt/Pba5dEHR0xOJdYYy5t4H35AfTvMBbRZGulQ7xo3adex20C32wiSWBQwoBYdnYKVjPv3kCi0SHfpIjX+FzDB2ZBGFtEzp+RkS+mzdfBkMj/XLu5vs0bg1ffXLxMRif3X5Gc3G2BKezGTfDkolBw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(71200400001)(186003)(38070700005)(4744005)(66446008)(36756003)(66556008)(6506007)(64756008)(122000001)(4326008)(66616009)(54906003)(8676002)(26005)(6486002)(508600001)(38100700002)(316002)(66946007)(966005)(91956017)(5660300002)(86362001)(76116006)(99936003)(2616005)(110136005)(6512007)(2906002)(66476007)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnAyWGhEKzB5YkU1ZlVaaU5seHJaeXM3UkRlY0ZWNDN2MkpBdHlNMldIWWpn?=
 =?utf-8?B?dExwS1c4YXkzNUFqL3pTcFJBRXdkc2ZjNzZIWnJ3ZkFETERlcms2K2lTdERu?=
 =?utf-8?B?c2JoM21qVFlkM3J0dGFhK25NTjAyWDhyaHBYQVZzOW1YdEhMSFJnTUdLbTVH?=
 =?utf-8?B?dGY2dFBBSWQ5UTFUeEQ2bjJwcXF1Wmt1V2R1MldBRTdXTDFsYi9YUXNySlIy?=
 =?utf-8?B?UTRsZlpmcUxTVXpsdE1BQ1dJbmFZVzdCbk5Mazg5dFpmZkE3VWx1WC8vdStX?=
 =?utf-8?B?Rk9aNEd1YzFESTc2NDlFMEpCby9sWFRGS3ZaeHN3MFdIYU55RVpUMnd4eG8v?=
 =?utf-8?B?ZHNibm90QW5tbkplOVA5MVFFOFZibStxUngzT3NmQ08xdldZNDl6K3NXUjlY?=
 =?utf-8?B?VU5EbThyMkJNN2lrQlplSG5UeFM2Vmt3NUNrNEJFWjAyZTRiR3F5SmRHeWpY?=
 =?utf-8?B?bllWM2hMMk5EdmQ2ejlvMXVPOHJUQjh0VkdEdVFkdG13bWpCQ0J4YVFtTDVa?=
 =?utf-8?B?R2lFZk83dE1ZZDhnUEkwemUxcE1Qc2dKVFVUY0dHTlN6Z21lT2dnVUV5NWR5?=
 =?utf-8?B?KzVPVXZxdWZZa3FuenhNQXJoVXZoVjc5VEpiWkhtU3E0b253blBiR3dHVjUv?=
 =?utf-8?B?d2VDbDZWWkpmVEpFRUR3bzBDWUs1YnRwcXVtYlZpV0lwcHBDbmVTZHZId29y?=
 =?utf-8?B?MUxxRGlzeUQvQ29GT3ZmVXZaSEVSb3VIdndQU1JmTnFLUXB2VkZ4ZTVtWHds?=
 =?utf-8?B?VHd3K0kyZGQ3alIyd2VadjBMMVUxKzZOYmw0M0lGT1NRNCtYNytZdm13NjQw?=
 =?utf-8?B?RkN1ZlRMamllb3lUL2pEUkZrbUo4Z01WM290TkJFa1hjSXo2SEl0cmZQdWh1?=
 =?utf-8?B?L1RqRVo3eGlIemNCSUZpaWh5Vk5xdmdEVHlKUGF6S01ad2JIdXExU2xuMHoz?=
 =?utf-8?B?VHhQVlg0WVQxYytQMlM4MytDOVZRdnJ0akVySllSaVpGTlcvbkRrWTM0ZGdF?=
 =?utf-8?B?SGdrWm5mTVd4VXdhY005cW1nRFJiV3BNWE95RXFtRDN5MU9YQ2hxOFhwUFRC?=
 =?utf-8?B?RFlVSHdTSEduaDR5Z2lvVW44QlRDczhMZ3c0TXF0c2VhU2JjMDkvb09aVGt1?=
 =?utf-8?B?SHhZaDJxRy9pSXVLSUh5elhqQWIvQ0ZRTnhYblowckxtVk52RmRsdXZWNEd4?=
 =?utf-8?B?MDJOREdRTjNvb2JtdFE1c211Y0ZkWUVselphWDIxRHFuckpHMEZZQkZMRUZK?=
 =?utf-8?B?NWtNT3paUjJkbk5mR1hTalorVGZ5cW5obG5pdStIckhNVnYwKzlOVTg2aXNS?=
 =?utf-8?B?OVJ0aTBaRUpxY1A4L1BmZjgvSVBqL0xpL3lWcW8rczFOL09HYlZDWlg2bDFw?=
 =?utf-8?B?MkxmeGZtVGdlWWl2YjlkUmFRekFyc1lWVTVuZTRKV3JuY0t4TW1scXpvUVo2?=
 =?utf-8?B?a3FNeFlrNENjNUgrdHplOWpFeENTSk04bCtMRFBvbkFwWGZlbjMwOVhFZzUz?=
 =?utf-8?B?L1lBMnRMMTdzZFV0UWVaaExINW9OVll1YjNmU0VLZ0lDUDJVVkU3YlVOYWxo?=
 =?utf-8?B?TXozUU80aFFPcWsvU2paTGloMTY5czBEZGV1ZElMY2pIVFdXRGdnNExLT2Va?=
 =?utf-8?B?azhLWEwyNDBzb2g3NU5zVlFVbmloTm4rUG1oYk11SEtVd2Uya0N1VlN6anRN?=
 =?utf-8?B?bHR6SDJlNVpxNG9VNXh0anZ0WXNwMUcxcnNGcDhNK052VGxaU1pvN1Zxamth?=
 =?utf-8?Q?WatXOzR16OJ0NeD8/D/r87a9LvL3ESwaABZtmk9?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-oqgLAJZhJ+E3VrEJ99bD"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513694dd-8921-4daa-9836-08d97f7c60a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 16:57:22.2651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZPHBVGY24SFU/0/y2xA9+MX4poZZlfL3VBARQWBOeXI9+6jcWM227+V0XI2bPFstVWp0Pxb1em4O91gKCSaUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4852

--=-oqgLAJZhJ+E3VrEJ99bD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-09-20 at 18:25 +0100, Andrew Cooper wrote:
> There is no need for bitfields anywhere - use more sensible types.=C2=A0
> There is
> also no need to cast 'd' to (unsigned char *) before passing it to a
> function
> taking void *.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-oqgLAJZhJ+E3VrEJ99bD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmFOA3EACgkQFkJ4iaW4
c+4qFQ//RMiv73DW67mCYDoeGyRA+j3F1OgjrtmMVdP4Ez7oeHBlW3+YH3AYO3Mm
6ANyiqTduhqdrZmfilVlLcasL9wi7HvPo5KVjuFFiTqZhfVHb97n66y0Pizqb1bG
6pohBWmbx2jUsE6mcGMp/wdxmBxH5Cy6CgeMbwHsGy2RBiRCviakAMI4d3OTPeiP
NfCAShhPpXmWz2G9dHQ6s1w5D22785OgPzN8LD2JYRPPShqqZbGkQOyc5MebDmRI
YR+JJg3a+nmQwtig5rASlsAzqxKuv4gRIT0LCJh778Fa0jXr//7zgLPkx46nVjyX
0hYKHCnUiHpBAfnRj/zgUSG+a97ksuETVKKTOHL4FExSXGzCO8RaDSLY2z1CZkES
/J89Um/Zm/EHBVhUcKnPguHCh253IO3do0uIWG880k72jC52jSWkMBbv+8+L9k78
nbet97QwlKRoVAY/Xd5kfQYfyup7oN7/TTJhiLD3D7I/6x9hR7GUCtgIphequYnW
Io2lNwzxnAh6PhWAfqENQiSfSokVJeaBNH2dWcthbww8ePdWj34fBA1pLUY4Z2Pp
dZxmL+K+b7QHv0HX71lcDqEqpZ5BNJkoPQMM2e9XQHtHXcSUwv9IqbyslpFo1h7A
T0I8woWIxYNCBB5UQk0y51HEtWvuRgfvrMsJOQRNe71/DDnQLNs=
=aA5s
-----END PGP SIGNATURE-----

--=-oqgLAJZhJ+E3VrEJ99bD--


