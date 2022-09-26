Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8F05EA6E3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 15:13:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411792.654856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocnup-0002hX-Kk; Mon, 26 Sep 2022 13:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411792.654856; Mon, 26 Sep 2022 13:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocnup-0002eb-Hz; Mon, 26 Sep 2022 13:12:55 +0000
Received: by outflank-mailman (input) for mailman id 411792;
 Mon, 26 Sep 2022 13:12:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTua=Z5=dornerworks.com=Nathan.Studer@srs-se1.protection.inumbo.net>)
 id 1ocnun-0002eV-JL
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 13:12:53 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0069.outbound.protection.office365.us [23.103.209.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea09a3a1-3d9c-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 15:12:48 +0200 (CEST)
Received: from BN0P110MB1627.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:187::12)
 by BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 13:12:43 +0000
Received: from BN0P110MB1627.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e45f:2ab7:859:30a]) by BN0P110MB1627.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e45f:2ab7:859:30a%3]) with mapi id 15.20.5654.024; Mon, 26 Sep 2022
 13:12:43 +0000
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
X-Inumbo-ID: ea09a3a1-3d9c-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=rLTW4EPVr9IF6YljZdD95tp7UiBB6tnRkJ+Qqh5zHFhWp7qa9h9qzSOwfOdPwi6f2woWropQrDsM0VkBO1piiNkrwfxzsPRkFUVskdvq78MC9w8jQFzyn0aVmUTZiuAFwSs+DCvA+2qzzk4baasMn9t1RgTN3tEx37NkRH08uPhI7lRFSG/gYm2vrdyR64tgpLZochypXoCZTfTzETNl0/sencecDHDy0Hv9gUC5gvhMfkg5Yn55I4LpjXEpt2jJgqpwu9woZE1TnYx9N4PXEXzhXkfbdxjTuL5iAoGjlVsZ25Y5yhwhBhReQW1pOsYYDvOKPUxyS2YSEBb/CvOrfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fOdMcuyym5knRQCoRqNW4v2KEJiYU5TE4XBXvADcLI=;
 b=YOkotQEBUmbcEi6zNCnyvakpzlS7mq6L/KIlD7W/fkxCMAXPMQuYRm6qe1eWgfxeDAGt2Jc7rA5EZUTP1Gtr26pQydlte83LgGJTcs4GQnswCbZUqi246hqlgMfZPqtMt+tLKiOvwf6/M9wnyMc06hOTpM5DPtPNrmMGs1NNcqZUsX1EKeRa5BgZtJAziK5wmrp/+/smsFKJBnF/P88mJZp0oZ37knn8R0T7Yj02b02ot8Wrs2RVDgXn4ppEZbGYxp4hVoVWSytr8BS0LtDOxYEVMhKLQzCReSRHMM/uR5UT/zpb8wwZ+wonkCg5ayMdFrs2nj53OAaM4MeiM4zf0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fOdMcuyym5knRQCoRqNW4v2KEJiYU5TE4XBXvADcLI=;
 b=gg81i5+WVCqGA7UUgTU68zSeFJ2SGZXFZXixWVcLXHwqu80mrRjxKxQtox1ks6wXJ7FQIdIDXJ0o3YdJB2hSat3tMYYjR89Epkred3Ogfy8CWc7UjTTkkxxGnKnXeXT7TZy7tNgCKowskzYe0au5NunOAMxd7cIln02n0T/w8S52YSucDpOgsx1dYyRj4AU+B/957FoJZWeTk4yzI4S9LEPZmxmFtnosIFY0q1VqaXzvFX2jPzZa5/HofK+7UpJvGoqAfH04+iQIwmieiCNYGzBZrSnDIgx2dzfjEDOs0zfXn+J+xsqD3wamzgjKOTfsdYrj4nn5TD29aSH+LvNwfQ==
From: Nathan Studer <Nathan.Studer@dornerworks.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Robert VanVossen
	<Robert.VanVossen@dornerworks.com>, xen-devel <xen-devel@dornerworks.com>,
	Stewart Hildebrand <stewart@stew.dk>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] MAINTAINERS: ARINC 653 scheduler maintainer updates
Thread-Topic: [PATCH v2] MAINTAINERS: ARINC 653 scheduler maintainer updates
Thread-Index: AQHYy828nsRUzF6SLE2+f4pUs1OUNq3xdBmAgABF0mA=
Date: Mon, 26 Sep 2022 13:12:43 +0000
Message-ID:
 <BN0P110MB16278D6C1B04C971C3F5059CF4529@BN0P110MB1627.NAMP110.PROD.OUTLOOK.COM>
References: <20220915193027.3166-1-stewart.hildebrand@dornerworks.com>
 <20220919021002.2193665-1-stewart@stew.dk>
 <021abdc2-2bd6-6220-1202-12fffe090a77@suse.com>
In-Reply-To: <021abdc2-2bd6-6220-1202-12fffe090a77@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dornerworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1627:EE_|BN0P110MB1609:EE_
x-ms-office365-filtering-correlation-id: 083dd147-0fde-4016-ebd7-08da9fc0cc3e
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cCH36Y3l4yeex+pARuUQy7XiFk38JEpv2Qu0SrA6fB5HZb6nHfYm0Hwd3+AOJQ83Y6eKyzGJYMTJQlk2Mb+zlp23gHmNA+MNLugkC0oWdiON2CRD07IVLWchv7PeEcZ5ph16FqvF+U51aOOmE51hgsjErzL3FgfTSKz1ymwv7/FeMMD4YDhwHb5frmJXYvVGUuVQab0bDijXeiD4SVkjgaR7m+K5/5Ut8Ec9mWxUAMW+f0JXI0B4lwk0lhDwF19yt5BH4R9oBlY8IaczkjJBgJOSxSh+UpaGbqFY6OIcouLnYzwytfqyoGHtMzyt9eb8mGwdRrjok2r2uDwZAOh3zQmbeKR7SJZa/UL7Nymo0wQ/mnpgJ3FcwJKLHJjnNZ68uLjqhosrRzozwpHkuPKS1prlgvs1u1JC/y4TYNoY2INwob/6X+EaezqHSmtzo55Vkhg4bTg+QtURIgMXUteYhNfeC6cV+qY/j4u5Ap6X+RCF+8KdcIj+4kKUz3j13ogRgkRIcu+8U44UWgWJ6JeT/rF1QHU3NA5uFQiyno9B3wkg7DPb8WGOlmwBudXt3CkCA6OrNVnsPxj8cHIpIu5rG4tpF3Edds7+Dq5XmWkSZ7Ic9S0D2uqRzcKe6pSwl55lcMemtj7bakrRPXgNTfedDTWeAIKweMb24otpvUTag38=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1627.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39830400003)(136003)(451199015)(71200400001)(55016003)(86362001)(41320700001)(54906003)(6916009)(7696005)(2906002)(6506007)(53546011)(26005)(9686003)(8936002)(33656002)(52536014)(66556008)(76116006)(4326008)(83380400001)(66946007)(8676002)(66446008)(64756008)(38070700005)(66476007)(508600001)(186003)(41300700001)(5660300002)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 Yu+z5P6NWiuUeSNGQofxf5ojaC9RAt43+gCwl0GARhXSN6t8Bsc54AgBEqpjQbXBNvSkqH538wB9aTS6M+k/+Zbb2YTFuJuxgaGxUPFGlGMUsF+GyxTrfSV+x1Ia6SI2GGQsEfNjIsVM7CsV6EF+TDBlX0Yd2/J5J/NoHu9hGIgpcJWtgDJAB/1DndUIK/YOeNgIhPbvE4LywtAvgIZKEDHd9Q/NYxsqIBvNt73b6uLz/TOdIX8W6WHS4h4LhmCqBlAjxJVamQZR2mz9jAFg+fQzksLiRyWsaOs2VhAUvVf44kP98c64SrbUezVyd8yqiOGqbbmxw+rDz2XCnTi2QPgHGTCskMsMgOxlNZgTzJN2i3JST3qc+QP6sgtI9jzzz27PUGWPDuHHHt22JVB6S2FXBkyaxcLiZVacioqdpSg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1627.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 083dd147-0fde-4016-ebd7-08da9fc0cc3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 13:12:43.5089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1609

PiBPbiAxOS4wOS4yMDIyIDA0OjEwLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+ID4gRnJv
bTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVyd29ya3MuY29t
Pg0KPiA+DQo+ID4gQWRkIE5hdGhhbiBTdHVkZXIgYXMgY28tbWFpbnRhaW5lci4NCj4gPg0KPiA+
IEkgYW0gZGVwYXJ0aW5nIERvcm5lcldvcmtzLiBJIHdpbGwgc3RpbGwgYmUgd29ya2luZyB3aXRo
IFhlbiBpbiBteSBuZXh0DQo+ID4gcm9sZSwgYW5kIEkgc3RpbGwgaGF2ZSBhbiBpbnRlcmVzdCBp
biBjby1tYWludGFpbmluZyB0aGUgQVJJTkMgNjUzDQo+ID4gc2NoZWR1bGVyLCBzbyBjaGFuZ2Ug
dG8gbXkgcGVyc29uYWwgZW1haWwgYWRkcmVzcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFN0
ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGRvcm5lcndvcmtzLmNvbT4NCj4g
PiAtLS0NCj4gPiAgTUFJTlRBSU5FUlMgfCAzICsrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRB
SU5FUlMgYi9NQUlOVEFJTkVSUw0KPiA+IGluZGV4IGUxMmM0OTlhMjguLjgxNjY1Njk1MGEgMTAw
NjQ0DQo+ID4gLS0tIGEvTUFJTlRBSU5FUlMNCj4gPiArKysgYi9NQUlOVEFJTkVSUw0KPiA+IEBA
IC0yMjEsNyArMjIxLDggQEAgRjogICAgICAgIHhlbi9pbmNsdWRlL3hlbi9hcmdvLmgNCj4gPiAg
RjogICB4ZW4vY29tbW9uL2FyZ28uYw0KPiA+DQo+ID4gIEFSSU5DNjUzIFNDSEVEVUxFUg0KPiA+
IC1NOiAgIFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGRvcm5lcndvcmtz
LmNvbT4NCj4gPiArTTogICBOYXRoYW4gU3R1ZGVyIDxuYXRoYW4uc3R1ZGVyQGRvcm5lcndvcmtz
LmNvbT4NCj4gPiArTTogICBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnRAc3Rldy5kaz4NCj4g
PiAgUzogICBTdXBwb3J0ZWQNCj4gPiAgTDogICB4ZW4tZGV2ZWxAZG9ybmVyd29ya3MuY29tDQo+
ID4gIEY6ICAgeGVuL2NvbW1vbi9zY2hlZC9hcmluYzY1My5jDQo+IA0KPiBOYXRoYW4sDQo+IA0K
PiBtYXkgSSBwbGVhc2UgYXNrIHRoYXQgeW91IHN1cHBseSBhbiBhY2sgaGVyZSwgaW5kaWNhdGlu
ZyB5b3VyIGFjY2VwdGFuY2UNCj4gb2YgdGhpcyByb2xlIChvciBvdGhlcndpc2UgcmVwbHkgdG8g
c3RhdGUgdGhlIGNvbnRyYXJ5KT8NCj4gDQo+IFRoYW5rcywgSmFuDQoNCk9mIGNvdXJzZS4NCg0K
QWNrZWQtYnk6IE5hdGhhbiBTdHVkZXIgPG5hdGhhbi5zdHVkZXJAZG9ybmVyd29ya3MuY29tPg0K
DQogICBOYXRlDQoNCg==

