Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513B8417922
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 18:56:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195548.348307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mToUA-0003bR-Vx; Fri, 24 Sep 2021 16:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195548.348307; Fri, 24 Sep 2021 16:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mToUA-0003Yv-Sp; Fri, 24 Sep 2021 16:55:42 +0000
Received: by outflank-mailman (input) for mailman id 195548;
 Fri, 24 Sep 2021 16:55:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3weo=OO=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mToUA-0003Yn-9T
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 16:55:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41227806-ac2e-4c80-a937-c24d58ad0643;
 Fri, 24 Sep 2021 16:55:40 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-iXIvZgvxNbKbOhCFbRyftA-1; Fri, 24 Sep 2021 18:55:38 +0200
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com (2603:10a6:208:134::22)
 by AM0PR04MB4852.eurprd04.prod.outlook.com (2603:10a6:208:c4::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 16:55:36 +0000
Received: from AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95]) by AM0PR04MB5826.eurprd04.prod.outlook.com
 ([fe80::7dc7:c:77b6:ed95%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 16:55:36 +0000
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
X-Inumbo-ID: 41227806-ac2e-4c80-a937-c24d58ad0643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632502539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TFPkAcyRbiMboSMP0wOapdLx/LTk8YFY2obi434qYKI=;
	b=Zeie5XjYuidQPAK3HAU/jqcewstJOu+t1MK9EOp0xIru1sViv3LA2Dm+zonGH+g7gVqe2g
	Wc99ILHHaO6QNJj2eSJVU9S5at70tEvVFwDNYJOb9ocD/Q4zYun/8nDl1N2uUQJxY560sJ
	aEaNkaLZ0LAkhGJcR5nX5gBUffN0Qa4=
X-MC-Unique: iXIvZgvxNbKbOhCFbRyftA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6RAaO7ZEgoxo0hl08BF15vCYjXN5IvFlVLewCUpp42JDynfwuYiUx67H/Y8BESWvS3brMF22iSVX6gUoKdB+SZ9irJTYZvs0ZR2yC2h0yt82L5mKsLC69kaOAhekUTM9e1n3xDzUSZecJXzkMD7JAK2WzkV2FFKTfHGaGblM2eMuNUDFcXCZ4SFyRmDf/DT95kfk0SX8njFspREcm0gsISZKxTqs119OFO7JC8MCTDKBLVXhK8t8Splzkr1FfLSc4WhqN6Cu6y9/iR+/Ch44AwXWHmpjnSHGGgTfm1eNomvMwU2wVmAQhb7kb3q1bIimP6pBIzTs4mjkXa5JWn1TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TFPkAcyRbiMboSMP0wOapdLx/LTk8YFY2obi434qYKI=;
 b=hDqNG6LYWCYPPI4nW2niD+DZJoU9x1NckaxFNDpF+Bf3E2bHRmxvr+CA7vT5vP2HVcGK8rYSYnUmgJdnGCsovbk7ungov/k1RwhKw5fEMKxLc1CW2pMrfgaFB3wZZt7Le/wZwYyHELKSywIm0GvVj0i1GHAoc5/uDi3sCrkYav82j46czAZD9y8qG8ClIc1y8oZcZ/cfAGttFqXrQnV7W0oPgHRmz54J2rNTgrtROPlfiSi4q9V/9FEDWcIDdOFNq9YZ/OteEYEWPCHR7ZE6w8NlS/AzeAUPa+BdPQzo7U0g87PyxyMusY44GsJsDjowCdy4F6vnyaYc70H1W/rNKA==
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
Subject: Re: [PATCH v2 06/12] xen/credit2: Clean up trace handling
Thread-Topic: [PATCH v2 06/12] xen/credit2: Clean up trace handling
Thread-Index: AQHXrkSN6XYb+hOIeEOo8+4FDChVo6uzbXOA
Date: Fri, 24 Sep 2021 16:55:36 +0000
Message-ID: <c35eb0695c5d10fb7883424442b09da5497db87e.camel@suse.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
	 <20210920172529.24932-7-andrew.cooper3@citrix.com>
In-Reply-To: <20210920172529.24932-7-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.0 (by Flathub.org) 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82f146b9-f018-49bb-bc82-08d97f7c21ac
x-ms-traffictypediagnostic: AM0PR04MB4852:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <AM0PR04MB485203ADE737ADCDCF07028CC5A49@AM0PR04MB4852.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aFrAfKMvsQ2wFy0hlgCXki/6bnsn3HANvmapJexAuUsNZ+H+GNpx9nWjlTdLx8XLz8oFcFjIn0VbmTTHdCHwbLdHnVQu+OSBftUwaKMHzc9Jfu4xOrALlln8MrSIwaiQQf4i/d9EbocDj17IxhOFXnyaFFAlK6HtkRaGa6WkJQOl4avU9kHnRRsPK+qEskD6G3i7DBpp+58MrrE2CbXMa+JZgoI10+nREgPWW1El8EJOJIz5LXVh3plQlyQkdJZyyEhosz6i7jj/06fzGJSxqOCyP9Jb7ImbRpt6JKi6Rj4ykR7xx+6VnyJ/4FVKJUDfweoR68gVj7axstDWH0BFIonOiSDFCr9Lut6qnqDqKbhvGhjT7hDOxrSKRJuGnt2ap7KdkWmFa5XuL/TPzkNV5NJWkSJ8i8us3xhAWMFX2Lx4YBeQjsxvhIDgFpxwOjjfiEQb9DgJzkcfZf5vYb874gqBCWocJaUi4CmXR5tQ/O30awjd29g2E4agFcWL7znUpQn8C7LsSlweWpI01pAxezb2bjFcPFPSmSJXw1J8kfwOQdvS+w+Ti0n+3uOo7KTbMuaHLMsFbRVfy7Box4UQZ1WBEBMGyMv0dkUUiZtgGpNla1BltYE0jveYKlS5I0hbzQ/qRLmgLQnzoFEF2XHH4lHc/bIoEo6mPpgNCQvtPMhpqJ176SCn5u8CDO536BNI22AvNpCHLPRbP2d+nr5tecR1yc5B7c78Kce4Du870gn05Tn66cI+u3mzFKAGecsYXIJnYzQIRftRWmqLVhBOTF6fDekteJBYbSkTqf4rLdQ7Gu/BgyPWiDVqiRRm+pY1lggJn5RiSnmYWcOpy5VR5A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5826.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(966005)(91956017)(5660300002)(38100700002)(66946007)(316002)(508600001)(2906002)(110136005)(6512007)(8936002)(66476007)(86362001)(76116006)(2616005)(99936003)(66446008)(36756003)(66556008)(6506007)(71200400001)(186003)(38070700005)(4744005)(26005)(6486002)(4326008)(64756008)(122000001)(8676002)(66616009)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S2Q2UVZFMVRtZ3NWRlczMXgvU296VmJlN2E0Z2UyZmhDbzVGQ2FIOXN2d3Jh?=
 =?utf-8?B?b0pLYUVWZlQ2dkxNWFIxcGZKSjVHMjloVDBqNFZ1V2ZIT1hObmdpNnlPTTN4?=
 =?utf-8?B?eFQySDlrV1pid3Q5WnBuYWpzU3ovdVN0MWM4S3VGcThGbmJNTDBQQ0RIZ3h3?=
 =?utf-8?B?czF6Tnl5ZkNCdWpPWERsZkxvSFQwZ1ZkMWdBakhONzdUbFluQU53WTRqd2tY?=
 =?utf-8?B?QmY2VisyeC82bjIwa1REZWVNK0RRdFNMbk5uTVNLYkNTM2czcmJDdlYxWHZa?=
 =?utf-8?B?dTVEdE42M1BLMUVrOEJXYlpNZlNEN3NLYzlINWtWVVN3dHhEZ2ZSNjdrQkkx?=
 =?utf-8?B?WlRZOHhZSXIzQXEzajdoK3A1LzlsVG5qK1ZCUVRZd09xeEdMczZyUkZGbmNp?=
 =?utf-8?B?UXZmaGVYdlVsZC8vMEtFRlZ0UG9iRUJXQm90djd5bzV6Uzg2SU5JSzkzTjht?=
 =?utf-8?B?TTZkRTd0UlVGekdkYnZCSFJCcjlTTUVUUEUrcUowS05PRE1wTG1qQlBHSkZa?=
 =?utf-8?B?cEtEQkpGV0F4ZnNaNnRYeFhxdi9UWTlUZHQ5SVgyQytDTDhKN0VEQ0VXbXJM?=
 =?utf-8?B?VDNJT2M3WFFiMVJaZlU5eWh0ZVNDSkdDZ0JZZUNwZFo3RVVsWGp4blA1WWNW?=
 =?utf-8?B?SW9wU2MrbkltVG5UMHZISUl1RysvTVJlWE9XU04raXdSamNpR1UyZlU3czlH?=
 =?utf-8?B?US9ORGx1REdPZ1lFM3lqcVEvN3hjYldhL2hENTZiTENsYVZtYjlXK0RPOW1m?=
 =?utf-8?B?a25lSmJ5eGhCcHUxQng3czRITHlSRUNxYWE4bFljNmFKdkhmMnE4T05Meit3?=
 =?utf-8?B?TlFOSUlOY1FoRkN2a2dTV0R3YVl4aVRiYndyZUdBT2RYSkZPOUh1YTRNZTk1?=
 =?utf-8?B?QU5ENE5oT2FqbmdVbSsyR1lqT2RWR0xCTERFbC9lRGJTenlPbFRMT3RMdFBt?=
 =?utf-8?B?VjZPU05takJJd0dVTytsRWtEVVJ5bkI1Z0NXcTRtemMyY3VNblIxc2pFS2xt?=
 =?utf-8?B?cUh3QmpCclhXWCthaFEwOFZuY2JtQ1owd2ozUXloWHROOEhuL2V6K1NyTWJR?=
 =?utf-8?B?Y2hURnlwU0wzWDZFbDVoTGQ2WGRwLzJlZk1RcHRRZVEvdW9aM09UdTdleUwy?=
 =?utf-8?B?aWc5cEJRL0tIRTFpR2kyY1JabHllS3N4ampIWm9YUEpxYUtna1NqUnM2UWNm?=
 =?utf-8?B?OWVveGVlUnR6RTkvMXRYaDBhanVLL0MrODk5N0h2SVNaaHY3TEFiVTMxTkth?=
 =?utf-8?B?WkkwdmxneFpjak5Jdis2UEg2aXdURGVERFN3QVVjYmF2dFJwd0hSQSt2ME1n?=
 =?utf-8?B?dWV1UWlWbldmMi9ySEw5YjJ0ejlaL2s2cGNlR2tJZGZJcnFCamZiTlMxeEJk?=
 =?utf-8?B?aHdBa2VCRjVrSFJ4enY0bmpEOHBjUWlsam4rWDYrWlcrWURqZ1lXdEpwUzhC?=
 =?utf-8?B?akFHWHlXYmN6dHpHVS80bHYrREdjc1MrbllLckV5TFVzNUpwOVFnVmdyYlln?=
 =?utf-8?B?aUZybEJDWERzZTdDK0NFZnhNUnlKMFBmQ2YyWWRoMnlaR1VaTnJISG4zRG1o?=
 =?utf-8?B?TjQ3TXZRL1dGQ2RnT09ESkpTcndWYXlGVktvZlYyeThKeTZjdml3YW9mem5B?=
 =?utf-8?B?SXR5SWUxZDFiMFVZSWk0YnZwRlpqQW5rWVY3Qk41MlVpc0NoU21RaXZnaDMv?=
 =?utf-8?B?SXpvYTE0bnhqSmtNZ2l1cEtZcGhzblp3U25EckJWMHpYakhYTlgyR1FjZ3ZZ?=
 =?utf-8?Q?Jf6w9+x9Y0CGpWrLrQ0C7dv+KRnn6wvj2Qq+zLJ?=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-cbsApmocyeJ2b5RoHR7B"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5826.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f146b9-f018-49bb-bc82-08d97f7c21ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 16:55:36.3428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n5Y/JRYACIS77odMmJqmF5rkVYwTpk+0/IaiBQW8hk5eUtG2AW/rUC1Wl2FAf85XK1+snDO8yZ5Su7V6Kk8Oag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4852

--=-cbsApmocyeJ2b5RoHR7B
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

--=-cbsApmocyeJ2b5RoHR7B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmFOAwcACgkQFkJ4iaW4
c+5VoxAAm5IRhGDKOLM0ld3nYjiY8MLk11R0ESt+5Nyar76kiRYs+1IRPMCLXuuv
sfg+dayyN1xxpKaq2MD/9gO7eUoQRO7znlAz0F8uLBnqZfsUuEuzqovCNsAJ27tj
GvozaqXvWc1G/ET8PxBeugXCZ58Ta8G3pUFtYePSTquBp6oGU0BBYpWH/QbxbPB2
fa34c+qJMzhblvSJR9U2FFY9eT6EGaHHJSd5np+i9/oSkzB8TE0I/HoCHf8SZ8lT
4NV2rVEwRTkZnLZj+UHPm0rtByNp9MXty2l5AUVmSWdDKoySk+9irEUsdN2k1cCA
Jw4l0G7cbXSwjMRD0tnb4UTs1JPtzZDRVvJP26DOeKnco3paM3e7a8Lb+Y45LrQS
MMKyi8+Lmo1bueRdEHe6SSsc5pRT+z2PGVOyrE39szwEOrWDLPDSOKFTOEIJiwV5
eNnB6QyT1901gbU+VX8UQg3exrIKM3TzqI3ucOHxkaojRYlmT/oOncntUBix6Bgp
czY6+cuHe5e1qKfoEHBYlQx6Uh92knMdgbd+f0dKkU3CE+jA5BEwL/Czd963OFFy
uTsjKmIsQKQAu9/jlxOxQ2EL+StZwTS0Bpgllbf0b5ZJb/MtRcJ2KqlZXC2lRnZl
vmmHf7g2mmSwbAo4b5U9F8rHk3I33ZF1wtRjq5GvzFtCnRmgydM=
=m7Dn
-----END PGP SIGNATURE-----

--=-cbsApmocyeJ2b5RoHR7B--


