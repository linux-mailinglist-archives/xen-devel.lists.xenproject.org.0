Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD808417919
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 18:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195534.348286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mToP0-0002KH-0n; Fri, 24 Sep 2021 16:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195534.348286; Fri, 24 Sep 2021 16:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mToOz-0002H1-Sl; Fri, 24 Sep 2021 16:50:21 +0000
Received: by outflank-mailman (input) for mailman id 195534;
 Fri, 24 Sep 2021 16:50:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3weo=OO=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mToOy-0002Gv-R3
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 16:50:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ff7cb78-1d57-11ec-baff-12813bfff9fa;
 Fri, 24 Sep 2021 16:50:19 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-PHeMdsOjNle11dol2LZ0og-1;
 Fri, 24 Sep 2021 18:50:17 +0200
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB7089.eurprd04.prod.outlook.com (2603:10a6:208:1a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 24 Sep
 2021 16:50:15 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 16:50:15 +0000
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
X-Inumbo-ID: 7ff7cb78-1d57-11ec-baff-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632502218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9A0+pnQRcAewGwpyyb5SKYkn/HCvTCcn0tztU1NU3PA=;
	b=Ln++xIen5dfyKUVnHXR7OMHQbeML6uknPiwbZpQoq8X5dmEGIttGhE3IgWzyLS613NP+dH
	4tRBRgvWcRh3/GX1W3WhosrO8rHUn6rnLmGJntNcrOt5Zj38KqZ58WPionV56/APU9Uueg
	EvaPTeN+muu3jf2akPHU0NAnjApEAQQ=
X-MC-Unique: PHeMdsOjNle11dol2LZ0og-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSuHP3GBaE1fg98lgJURIpB8431AkMQutWepoB4Lb3PS1R145eSRnkRSZeCO9xFEW33zxNA1chdSuCY8dKYpxBZGgokIeKQh/dTYwZTeZq+WMi8kZU2ijjAilXuz/i/SRraBPtqH4LlM++BvaKzkqUlheWgW2lrj3z0XNlFKUZnw0ViZjbyhvXofM+Tphdj1Zep7YPolfcWuDHLqMR9Tx9igtX1QP01xc4VpPfKip1W2qvMW5VcN0YE3Egg5As6ohvbVbSNY4h11uvApTjNiI6FKo8loI3/E/Bn4U2qYT7N6WtIqysEkuxCGT8+91verBOv4hZveG6Sv0B0tG9cR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9A0+pnQRcAewGwpyyb5SKYkn/HCvTCcn0tztU1NU3PA=;
 b=O3BK7iBvsZoodbctepiqUigwSp5FsY9d8nyy97qpIt/TTeDG5acDEccqrWigEUU6gN6vXrdODYhKwdRb8029bPhFpdJCDWMhGdRUVYnyqbqGHs8zHf2+L/zibQOcUg413h5eYfVOHqCrIZYQiytvYLe7VYakIVBhtp+dWzboog0AbyhNiS04qCJiAUcFbKvmy+ZCMgZ5rkpbqvH/7T6Cc7l6yUcprCK31NVTMy4zh1vpZu6A33B/LVwnuJozqAfCA4GBVMU4A7yS0XLmFcbFgX6buF3MRBr/eqm6k9pno0yg3I93AZOEjAX2SY/OLj6P5TY/sgGMD7K1+axoQQA+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, "George.Dunlap@eu.citrix.com"
	<George.Dunlap@eu.citrix.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>,
	"iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v2 02/12] xen/memory: Remove tail padding from TRC_MEM_*
 records
Thread-Topic: [PATCH v2 02/12] xen/memory: Remove tail padding from TRC_MEM_*
 records
Thread-Index: AQHXrkSKbARHP/AzFEumZlsoMq5Uf6uza/QA
Date: Fri, 24 Sep 2021 16:50:15 +0000
Message-ID: <dbecc633dda9f0efb4b458a204affad44dfaa177.camel@suse.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
	 <20210920172529.24932-3-andrew.cooper3@citrix.com>
In-Reply-To: <20210920172529.24932-3-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.0 (by Flathub.org) 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70ebaf77-b529-47eb-5d96-08d97f7b6223
x-ms-traffictypediagnostic: AM0PR04MB7089:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <AM0PR04MB70895722889E15F3D62F66ECC5A49@AM0PR04MB7089.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nLDBB+DKJJOLo76yhW+EheCK6Fw94AkdsdNipiHPIl0vijyu1Urh4FMceNOTnxR1eK6v5P+Gp5xS57WDgbQ73LZAnae9Fb7aeVANJsSiI3KrnYfoTYvXimYAB+J4rlOCtN4SqoEOuzraVeg0nYWvFQfWzsH3qr6D9r573xioqOeS0mLidvz1l9CFxq2NNFc5nE+wmm2lU+V2RjrE3a5fxwqhRmKBLsgIqas5Ty/4yGkLBIPHTqqkwxBNwzqRF3sytKitiskb0FR2z+UkkDWVobWhQkMm97hv83f0sNBgRoU1jSmHJr6iwuABGSfvemXrqzrqk5XqM4XnSkhptJ8GO+TrfaMn2DPPbn9KdnwoaiUBWrhsp6y5nIm9v2gOsHnwmUVjmOp7GibJn1mq/NPOy/+ZCytubfRp6gqI4d/YQA3g297oFnyQPeDO9K95Isi61HXgpxYrCTYZMqzYfwK0ZF0DVv7DzL7fDSlxkhnc9CEQQxzaCKaOTDRlVWUh+iTiAz+wJBzVXEmL3x/WJfFiBZ5YplnB0Zqptfl9t2Utfomfc63zbNB70dJofDnc4OhloDDf9RmzCPMawR9W4ssMMGQBY1JCJpnlRDqZPkye/rTfOjpsH4K/PEETpA+G6gzkO5KWfPTWAFLQLgYxBpI2GEOUiaCe/b3GQfzMWdWJEFnQtwAX9WiDYv9yLPyssNVQptlsvUZ4xY65mtG9CafGvHp6d8vwH+PEI+qF8CN+M3J4YOIy9tNkUoIqox+FMQV6XIsjgtazfCx3pHOiEiScxYsV+PNDMNLQZJEXu5L5RhYP+VuiEvsInoDm29aP41TB4KjjmDrw6a0CVwFOrZJRjw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(6512007)(5660300002)(99936003)(86362001)(110136005)(54906003)(508600001)(2616005)(8936002)(71200400001)(4326008)(76116006)(91956017)(66446008)(26005)(38070700005)(64756008)(66476007)(6486002)(6506007)(66556008)(66616009)(186003)(66946007)(966005)(83380400001)(2906002)(122000001)(36756003)(8676002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEl5QndLNGRVQ0JyOU9mOGpqbXRPWkowcThqMEVqdTB0Skc0MGc5YTdCN2FK?=
 =?utf-8?B?WEJJSkRnY3U4dE1ZejRWQWFOMGYySmZQYWo4cGozMU1vbHJBREdpZXJ6ZDR6?=
 =?utf-8?B?Wmh0RVJkN014dmpQdFUxZ28xcUFHbzRqNkx1L0VZUVZPM0V6NUtUc1BrdUdM?=
 =?utf-8?B?VUZFNXl4aVVwazg1R0E0eDlQS29EandTQWd6ZDgyS1lOM2Qrc1JzMHpiS3Qx?=
 =?utf-8?B?bVdMMzQ3ejFKQ2xNdEZRNHZlNEtIeDNDMWxNNURXNkdJVkEyYVYvL1VWbTY1?=
 =?utf-8?B?d0lqbHJZT1NNdzBMbm1oSFAyNUQ3aHdYazV0YURzdHYzeFZpTERIQ0FHcEt4?=
 =?utf-8?B?dENPM1ZtSjYyV3ljaTBFckFyNTFtTGFUalRzUE8rWGRQRXZaMmVCVllNMmIr?=
 =?utf-8?B?MmpnNkNVa0dCYWtqelAxSFVwNmJnU2x3MUFZT1NjM3BhT1NLdWtmbzE3NDdC?=
 =?utf-8?B?Qm5FNkRJbVdnQU5tZ2tqM20xcmRybll2VHlEZXAxZzF5aTZaMmk4dlFENnIz?=
 =?utf-8?B?OHhxTWVzeHJFbFBvNWpSQXJmUWhpQmk2WHIxNytkT1hvNWhqVmxTcUtqMkVQ?=
 =?utf-8?B?ejk5cU1hSjBVODNORjQ2TEJDYVA1V3VjeHVibEIrWEl3M2dCOXdhSkFIR0V1?=
 =?utf-8?B?SmdjWVdEY3FzZE5rWW14OGxBalVibmh5VkJxNGRIOWlJdHhXcjdKcDREaXIv?=
 =?utf-8?B?TWVUK1Q3UTltOHhnQW5BUWI2ZTQ1Ym9xaytta3JHUmVBOERkNWU0VWRTWkNF?=
 =?utf-8?B?V3ZlTUdMeWs2QlpLM29NelBNRXVjUHpHZElyWGtIeFRkWTFsZ2NGZTYxeVpt?=
 =?utf-8?B?QkFBNFZYMGRCTkxwRG9naHJEQVRDTW9ZdmhrNDAyUmFhdUVFN1orT3dPUDlL?=
 =?utf-8?B?SmVvempSQk4rMmQxaXkzcEhGVjMzOEF5UFUyeDdlWEIwR0FNU1U5dDR0ajhs?=
 =?utf-8?B?UHBqNDRGeFFpWHRBZnB1UTVjUGdIUWRXajI4OUhGVVpKQ0JldkxwWTdHZzRq?=
 =?utf-8?B?cUtoNDkrSkVzcU9UMHJ6L1Y0MEpySjVWZCtFLzVvc1I2SkZCRU8zQ01uOW84?=
 =?utf-8?B?K214WExzZGZyZ0FOcmwyTCtlM2FuRGlTU0tqRy9qeDJFTjlEWXZ0dUdyajVR?=
 =?utf-8?B?TGIrMVA5QzcxeUxxQTRmdlIrNXhheEJSY1pjMCtUbDBxU0RiTUtPUlF4S2s0?=
 =?utf-8?B?ZnRHUjdkN2o2M0UvNkNWZmMwWTJBcjhaMm0xWHhhVW15YXFpbFNyM2JMc2hz?=
 =?utf-8?B?NlpWdDhaVWNJVEVxc3ZuMVpELzNSbmpldDJVcmRtL2ZzTkFFR1RSdjMzcnJ4?=
 =?utf-8?B?Y3pOd3hueEpCdFAvL3dNNzRUbkpGV2hSQnMvckMyVE1pY0tlWW56OHJJYnQz?=
 =?utf-8?B?ZHIxenJUTTU0MThDSExkdzZXSFF1Q1A0YnlvcTIvYUNIci9SZ0xrVDZGUTVF?=
 =?utf-8?B?TSs1WUgzQzhyamFCQUhHcTdFc29Qb1RsZWUvcU04OFJENjBmVStUYXVscmVQ?=
 =?utf-8?B?NFplaVUrUGRHRTZwdHNPYlVpVk1VdDhQaXNiWFlBQmNNVzRtaFFYRWZZODlp?=
 =?utf-8?B?ZS9JYThIbGFkM0w0VkxrdXMrQ042T1NYeTQxNERQVEtzQzE5TVJvZDJmanNz?=
 =?utf-8?B?YVo0emlSandtUUtFZjJPQWpOeFZkc0QyTS9jUUpqZHhUSTEyVDYvU2ZaallP?=
 =?utf-8?B?Vjd5eThIejR3ZEhORXE0Q3dtUGE0c3NhNVVsS1FCRlVIOWFueUVicFRrdm1a?=
 =?utf-8?Q?yt7hNTNDeh/hXDL063+NOPyZe9QUKkII0pM2M6g?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-yreP9YeHWsEKtcDML9fj"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ebaf77-b529-47eb-5d96-08d97f7b6223
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 16:50:15.3036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M1AmenVmVXD6jXNcX9LLzfEklWUUaIqxtXyoB2kGCcWOBsOCeenvslKFy0Mhr7jHsJMqv7QIIQGLf5SCuEJ8uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7089

--=-yreP9YeHWsEKtcDML9fj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-09-20 at 18:25 +0100, Andrew Cooper wrote:
> Four TRC_MEM_* records supply custom structures with tail padding,
> leaking
> stack rubble into the trace buffer.=C2=A0 Three of the records were fine
> in 32-bit
> builds of Xen, due to the relaxed alignment of 64-bit integers, but
> POD_SUPERPAGE_SPLITER was broken right from the outset.
>=20
> We could pack the datastructures to remove the padding, but
> xentrace_format
> has no way of rendering the upper half of a 16-bit field.=C2=A0 Instead,
> expand all
> 16-bit fields to 32-bit.
>=20
> For POD_SUPERPAGE_SPLINTER, introduce an order field as it is
> relevant
> information, and to match DECREASE_RESERVATION, and so it doesn't
> require a
> __packed attribute to drop tail padding.
>=20
> Update xenalyze's structures to match, and introduce xentrace_format
> rendering
> which was absent previously.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
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

--=-yreP9YeHWsEKtcDML9fj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmFOAcYACgkQFkJ4iaW4
c+79zw//TlLQ7V82XrFwJwJOqVTscw0tkTv07UzpF0CB27W8Jtwjxz9ZonCG67zp
h9ZDnuCtutmLZ0U/NSa1HShDgthj2H+wZbICKMhseE/MTngCai8pzuVT+dg4dPVX
Bbvqpy7ZiSKxXUxF9mX5G/XOK2b55ofbD94g0Z57ZeSeb1UR42crLMhGFOdzgLWa
LHTN5eB9Gu9p+SlM40QlKqFylnUYuYiG9u9ap0gNqpnKbwP+qGdp0lWp9VfxkkIG
gKgNUKAWMCA2u69EjToX4vBeFaNRbRKg+FtYIBXBiA+FkQ0Bj27sdMAnCJdXPJAJ
PTBhbF1FZBCNiiBuWHVtx4zJGIc5jinMFxbsd8imR2LL/esR5ipH8tgz1Ej2zXI6
WJp6UJRl6aExU+7WFDZSy7tZVxKxQ7kWAf+erbj6Wf0KE6qHxbOrurVdCJ5hPisR
BUwyfSjXLALj82CpxarEd6EMiCL+yx/HpXM7wVme4FZPSwCH1DMj9N8pet0Puva6
N+qu8L6pfBj5gUJkDNM8/k7nGjTHF6nF6Rm8HDBcVXMlr5YMMlDSuZoiACzjzVsX
iJouM+PzR4cY4fMyJr9v0RRYzYdvmZljjobSz5G99KgaDszTf8WeGY7tDB1cz8iH
gkWhMX2+nB9FMBqW1EeP7ufXFoGwx+ZUxXuD6xYByPICbALrVaw=
=2bPf
-----END PGP SIGNATURE-----

--=-yreP9YeHWsEKtcDML9fj--


