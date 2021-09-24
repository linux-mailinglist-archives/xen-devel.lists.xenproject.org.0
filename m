Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E9E417923
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 18:56:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195554.348319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mToUy-0004B7-AR; Fri, 24 Sep 2021 16:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195554.348319; Fri, 24 Sep 2021 16:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mToUy-00047i-78; Fri, 24 Sep 2021 16:56:32 +0000
Received: by outflank-mailman (input) for mailman id 195554;
 Fri, 24 Sep 2021 16:56:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3weo=OO=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mToUx-00047c-Fc
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 16:56:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cabdd5f3-4bf4-425b-804e-60f03347a173;
 Fri, 24 Sep 2021 16:56:30 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-KNbwxSlQN32gDs059HQpFw-1; Fri, 24 Sep 2021 18:56:28 +0200
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB4852.eurprd04.prod.outlook.com (2603:10a6:208:c4::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 16:56:27 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 16:56:26 +0000
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
X-Inumbo-ID: cabdd5f3-4bf4-425b-804e-60f03347a173
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632502589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CIAOIVl1ibqmSuT0l70VRYoVc3b+GFNXFAe7MZWjNRU=;
	b=l3lbmovS0Qfa/zfAwZCydpeLn4FjFgCDIU76gVUhAAHnOttFeK35xpSJoRDKVQo2JGvjvp
	FU3xCDLqAOa6DXg0tC5mOBh/r7aXA9L7y0UIyPkRe3Au6294eMKI1kf+Bqan3aQICmaXM1
	OIVYuQfZe7M/xmiPBDpe/ogRFtQTrVk=
X-MC-Unique: KNbwxSlQN32gDs059HQpFw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPH65MB8kPCGmwVlofl5bFavmFJGx4sKSeVqjHKZ735w1kM/uYZai4rCMnWr8RixSy3HGb/10slULU21OZasS2teqax1pSj8hFgaCUeMIgG/9YWbtiATCGvbkiEqczurIEiAakX/pW3NPap0IvOGvDrgJf0D5vyGr0Npsi8FFBNRYK1Ir+npSQ3hOo6eClwpndvrji/MG48i0GHjPKTOXOW7XnGiDYYitWnXkvPzAX8BHJE2hn5R+Z/QGtND0ytiWzmwWrXnpF9G2OBLlcBF4RzvbMh7CXCW7Qs2ckeAAYmVWgF88MjZXha3HhTGxLlVP9aebSDZAkL/0y1gRMArog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CIAOIVl1ibqmSuT0l70VRYoVc3b+GFNXFAe7MZWjNRU=;
 b=i6JmSgqZjumSq2iC3Bo8vU6y3CzD1qa+YA9GHPBJH1FJOqJURV1NAG0w3YAnnNrLoGJJi4hT/KgoX0t1MRFxaEfCNw57JqOVMPGVp/6XFIFgFBB1ZDGLwRcJ8aH7TzmH27bm0/x7Zd+LGvPlsBXJewgGln559S0tPi5vI/xjVBfqZ+DfxjvTAiQkL9ZUJ/NZXQrmfKLtIgWBUw8lMTOK/07QEVlYQ54ftPE/U7AGfRjUn+4ddy8k/itkyA3z+0PmBLEO4NkNizGbV3AO4mWIX+ZYIYJfA2gkj59eLGhKH3qkqUFdv5nTqpqmAt/CDD8wYLSRc+RTFXKA4kQfyLUThg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
From: Dario Faggioli <dfaggioli@suse.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, "George.Dunlap@eu.citrix.com"
	<George.Dunlap@eu.citrix.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>,
	"iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
	"mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>
Subject: Re: [PATCH v2 07/12] xen/rt: Clean up trace handling
Thread-Topic: [PATCH v2 07/12] xen/rt: Clean up trace handling
Thread-Index: AQHXrkSMaq9oWJXIp0iPAISC71kjzKuzba6A
Date: Fri, 24 Sep 2021 16:56:26 +0000
Message-ID: <7efbdf8d22de4ffcc71a86f2f742ac63f335e07a.camel@suse.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
	 <20210920172529.24932-8-andrew.cooper3@citrix.com>
In-Reply-To: <20210920172529.24932-8-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.0 (by Flathub.org) 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d5613a0-750e-49a6-aff5-08d97f7c3f97
x-ms-traffictypediagnostic: AM0PR04MB4852:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <AM0PR04MB4852E9818CA171F7FEA7ED7EC5A49@AM0PR04MB4852.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1BBzMFQVoa4XI/xTETe72OFHEGvkJ2cA7Yo99SwzWQ3uuBN1vYcM1F6I8vABvcgX2bt8fGhdNvBWqZfBp4Ag7ioNrGxXHDq+zEmNtg0hwupMMMq+TLsVBg+wO4Xo5UV50iDdubGwWJUfItRFTSUK/BeIiY195/6AxbLOdtZKQmPLt2Qtr7uP6AyovExgufHOoAZXzxh0Unbp6QmqVO9HSNsjtqhYHGtcD2zMpQrYZeYo7cZaaZ5AFajA3vrYnvO56TuAj9F/uozRy3RQhdF5hWU8OJj1S4Le8hnV1lGWMUU+8VHEDcoXI3tKVK88nL/TWXHSKLbObkxCRi4a4Z9/A3NsASsfHyDzf0vO8a96hroTSJInyHaNUVJWsHFL6OyIXEJM/Ssp8u8/K6J0geaLU7v92fgEtsk0TUZW3/ZbLiEGZxBLfU7kdSpvgqqXqNGqaXkRX2u6HkLN9tPiDEjVFAfr3nam5r6qzVoOkdkLjYAyGipYUfRqwMXOWVzxxenKC7lMWE+ulPh2iiIBjli/mXNIKk6T0YyywlsHmsIIvk8qJP+TnVPFQuJL3fT3iF6B0tPsByWE4W/x8xfDqARtNFt+cFRwnPmHRoSgnfEG7x9qEiP7CF/lyfMN0qhL8BKWMe2r/ujUUjz/LzXS3AGDT2+xh/rU/9npm4ElPhUKU8Dos6ebqw2OgasyyqdjyrKJjI2kYGtnsyR16E4TTX8N27l0yNH0dz43XWcJjA5Q7DVETFb0tamPHqQBbDiQ0jxXtXBtfE8Nh8ZDKq36WfxoKV2Sg5R5CLh/x2LPy/wK59LNqfjQG3DUBrkkcH8lwvK9gv9f+QNuG8BqsY7hVpzv3w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(966005)(91956017)(5660300002)(38100700002)(66946007)(316002)(508600001)(2906002)(110136005)(6512007)(8936002)(66476007)(86362001)(76116006)(2616005)(99936003)(66446008)(36756003)(66556008)(6506007)(71200400001)(186003)(38070700005)(4744005)(26005)(6486002)(4326008)(64756008)(122000001)(8676002)(66616009)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlVwUHNjL05aTFd0MUxmc3U5Q05UQ1pqbjY4TitlNEMzLzNZS0VvOUFCSmRI?=
 =?utf-8?B?QmI0dVVzcGpTMC9jdTJyNFk0RmtGUW5HNERnMCtzV3RVaXk1WGdqcDhGOXcw?=
 =?utf-8?B?VDBsR3JZaGxxRG5kVDJQU3UzTm5IQmtTLzd4QXNTeUVNdG94UFMyd1A3dWlu?=
 =?utf-8?B?eklsSy9BemN1MjM2WFZ4cW1yL0xYMzVCclRnbjVHUDRQZ09JWlJreEdsbEZF?=
 =?utf-8?B?ZHBLbUVBamsvTGxrM3RpNWhWcEdIZ0t1a3BNSVd5elR5cjczWkN4MjhNNVE5?=
 =?utf-8?B?TVYrby9iWXlyYmpTQ0NHK29yaUhSUE13dnNkSGIySlVwa0p3bUpXTThWeUlt?=
 =?utf-8?B?dlVXcjdSOVRraXhjUVRKT2VhVVBUUlFvN3docmpuTksyQnJ5bFVISHBoVU95?=
 =?utf-8?B?aERib2k1d0lqSE5uckh5SWFVU2JONFZPL2F0dGlBU0JPdzZUYncvMXVSYkNl?=
 =?utf-8?B?d2JIMk5tQ201bGVyWjNWb0tSVTQzVjVVcU11Y29CZFZWZFYxQ0l0RXlUeG13?=
 =?utf-8?B?RVZpeVJwTzdyVFFtTEpvOGRQdXQ0ZW94VWE1dS9ZemxoMkY3OU9na2srVFll?=
 =?utf-8?B?N3N5aDlBK1pMMGQ2Sk9hb2k4bTB3NEZBdkFjcUR3R2lvUk1mVVlxT3Z0QzN1?=
 =?utf-8?B?WkRLKzd1N0FPMXBRQXBicHBMRHdOODN6clVFTDk4L1I1VExyd0txNWV2TTh3?=
 =?utf-8?B?eHhJZi9GTTdOdk1yL3JyZm1vNE90TVdGTjBPZjhsc1pkWkdpWHB4TEpWM3Nk?=
 =?utf-8?B?d3lONkdBVER6NVpjTnNMYVZUVE9kNGlHMUMzL0lSQmVrU2NiQWN1M2kvbmVC?=
 =?utf-8?B?SGwyWS9EOG5TK01CSmR3d2RSNCs2SkJEK3Vpbm1tRG83L3FuNUZKZUJqZlRL?=
 =?utf-8?B?N1VvODNUZHFkRGpGcGExcDhIN3ZhcEhFRkpPWld5anFzVHlaQ3duQk9Fd1A5?=
 =?utf-8?B?S0YvOUthZHlsNVNLZjFzUXYwd2FJVmhXZTgzT0FoYXZYUWt6MkNmRDlHYzBa?=
 =?utf-8?B?d0tWNi9JTmptT3d6MVhaWFBEOXRLVm5UMnlBZ24yWTM3a1JhbTVWaG5xd1Bx?=
 =?utf-8?B?NWhxTlk1QnFrazZ2bElVMEZ0eGlzcDh2RlU1WWJOVU9iVUpvOC9LVm9UdThN?=
 =?utf-8?B?TVF5aDJXLzU0QXJ5L3NuditrUkRMUjJkdy9ZTnpFL1laeS9jdGlIS0hwY3hK?=
 =?utf-8?B?Y3l4WEZTa01YUDV3eTBrRElTYkdNajBtWUdxT1k2SG5UOXpxQ055M2E3T215?=
 =?utf-8?B?a0pmSDNFa2lyQm8yU0Fta05ZRkZTWVVhN3BYTW5GaEJYRXNvbWh2TGpYZEFw?=
 =?utf-8?B?OFdMQURLMk5oQmtIK1lnUi9KYWpVOU1wWG5nNEtKRDF1enBFeDRFUk1nZ1FU?=
 =?utf-8?B?c3JRWnNmRUVFeVdEenNvSUlCSDAvWG5mSjZFczU3SWgrWitPN3k2UVRIM05G?=
 =?utf-8?B?alJ3NnFudHV3YlpKaEYvM2RMUGhBNFRITzNJVENJaXVMeHROYTd2VHRuVith?=
 =?utf-8?B?dW1TKzRGNVlKc0FzOVBmd2piQmU5M05PSjg0YnhZZWJBMThYNi9SRnM5cUZY?=
 =?utf-8?B?S0pRV0NBb1FBcU1VTkNSZEU2OXpQSi9ZTXRFMTBFMmFsL3c3bHdQemVrSm1G?=
 =?utf-8?B?a2RFZE5RZ0pDcG51eWI2SzA4enFIVmxRcjRvbkFDdzNzL2FPcmc0Yk81M25F?=
 =?utf-8?B?cFNkMXg3N3VUT3ZEOG04eHpGR2VueG5QY1NEZ0dtbTh5ay8vL2hYVGdzYUFw?=
 =?utf-8?Q?DaxzYkgcTS86/iQjRu3OFJ7eDLuAGeU0Fywud/H?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Doqs+l0Pe63MATy+SOIy"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5613a0-750e-49a6-aff5-08d97f7c3f97
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 16:56:26.7814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n6ymTEo514KxhyKdwhRYUUQZtdb4227cnr976uZutzrCiksoq7D1XbwrPpyiryUeQNeIVts0WqK9M9fcqxPssw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4852

--=-Doqs+l0Pe63MATy+SOIy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-09-20 at 18:25 +0100, Andrew Cooper wrote:
> Most uses of bitfields and __packed are unnecessary.=C2=A0 There is also
> no need to
> cast 'd' to (unsigned char *) before passing it to a function taking
> void *.
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

--=-Doqs+l0Pe63MATy+SOIy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmFOAzoACgkQFkJ4iaW4
c+6E9A//Ymjk8w16+d6jo9lk/XJFJiJmSJjZLJ7S6BZlkc7IiIrHOgJLhiuC821X
y4il47O0Ezqj40HnzH8upM0dGe5J42bXZVWlMw9fqiRtfJt1r6nDYP2k/O3VceLu
jG2B5dS5IqXjOHkpLuH6ke7Rx5wv3nWmJee6jARC58iIaT9rl4lFSNL+/5VP+swM
AoFRGg3mGFZP1ZcJcce7zcf40xsh29LOXlDit88aGZpspZ86r96P8Mn78kMemqu2
5zIW1RZUzMGA2ei4ulNbTbF5brfPSyyCPgTRMTNuTdToy+kQnVwuaxfO8voBm8Gu
wREF439lkT6s5P1G6hJxpiWhHZB0B9vKYc1QxuCLjJWK5w93eyE2WUZUfiCmP74b
ygjoJp7z2lXWDbmH/J+J8MoSADKFvZyvhpatMolv9z4Vr6Ob3vD2pmJx5nEhUJ+r
SGPgxneSDNLQ3EJaUHSYfMpsTXcmqqcCTmyHCPeDlSZeZNrkgHfkmPBvMAPqkoiJ
qP//VsVDYAFY11KHQU75GJXPjg7Kq77GYzRHbDQ2N/vC6lJp+ZcQ0bfcb+AjJqN1
QYi7lf2R7wH128eGZnZgClA70HLHcoJp+91jndYTuvdNyix0BfloD7I1RMCOTECH
/2/Rr6zYUzHrmyhjc9RFyKYA248I1gayfy+sjbkuyTtovw2dg/w=
=J5BY
-----END PGP SIGNATURE-----

--=-Doqs+l0Pe63MATy+SOIy--


