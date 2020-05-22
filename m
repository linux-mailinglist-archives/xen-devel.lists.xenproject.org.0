Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EA91DE2FC
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 11:25:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc3w5-0004uQ-Kx; Fri, 22 May 2020 09:25:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=de5w=7E=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jc3w4-0004sp-4d
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 09:25:48 +0000
X-Inumbo-ID: 379ff538-9c0e-11ea-ab9c-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.64]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 379ff538-9c0e-11ea-ab9c-12813bfff9fa;
 Fri, 22 May 2020 09:25:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlHBJayJwfAeqv+M3KTCfFgQ8HCkznBbda8IoTQIzcdqIrsIF5mT+GVuyf4iUhxPMrPDd3hbOqwqnYBkMuI/5Zq49sw1TBxO+AY1DU1NHuD/X5FlEhF3lfRm04iDC3533hlRHB2iYcHhwndHNL5IpR45vjykJMHq7xOOITDGQISNg2Ruo8WWHORibc1B5u91/sdTjWh3vk9joikilOsitwUvXDZfWbsUL+gzXGrflLdlJCoPYDDnVTLMrRah0moqTzYzHAZXEEhP9qppOgLmx+Yu5eY7dNTDmATVIgOrIyiOGNJlQMkyTTmWkf3a7p2UR85cdLC2iGQIJbdx+aPKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNCa96JLCRBSccjpUgMoGQO3IFUEWUejdi8Mpr4pH6I=;
 b=m31LmrFcP+Fwq7/GBOHQ7XP98g+06N6M3WL9fgX4RAsFGCiJ+mjmQM8E6LkJurGWKveHBU/kLmnCVI6VGwd4WzSkuaPcdmjmeXXO5RUD35UKEfOFNNGhoaGd4VYpVMRFx2yTxhsoeMoj+XzXEhdnt2L57agtwPC+0UfrT8cCFFbzMsdLTinPizyp/Zl+8dRG2o4EiVORAh6wm6M7rYlYI5sQW7nd9lKiam/WMRT8g/78rF+z8UTHsit9Bm2f+3SPZkdgT6foJlPEixICuXFjxT6Cn7EwqCi7Bng1TiygbFbmnHx2h+PflpMdDin1LoQwY4QNJqpP94FXDIr4xLkJAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNCa96JLCRBSccjpUgMoGQO3IFUEWUejdi8Mpr4pH6I=;
 b=BDZTnUJtgxHB56SAzMwXz7g5XoEPLPcPZmAEnTN8zMROWViNtYKx6yCKqn71M6DDTdSONLRyGMVryp1EgawTtcdIPk743BqsokdxrxZxTOjyo8T8kgJw0MgE/gYWTIilfTpSfRf1Fq/laRe0L8GjSTeo1+bjRsEfp7FBGmpf2Ew=
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB2909.eurprd03.prod.outlook.com (2603:10a6:802:39::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Fri, 22 May
 2020 09:25:45 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4%7]) with mapi id 15.20.3021.027; Fri, 22 May 2020
 09:25:45 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Denis Kirjanov <kda@linux-powerpc.org>
Subject: Re: [PATCH v4] public/io/netif.h: add a new extra type for XDP
Thread-Topic: [PATCH v4] public/io/netif.h: add a new extra type for XDP
Thread-Index: AQHWMBiqME7497+04E6+8Omw+GVY7aiz01kAgAACZQA=
Date: Fri, 22 May 2020 09:25:45 +0000
Message-ID: <05f78e98-79b9-b1a7-b892-67033b9cd245@epam.com>
References: <1589814292-1789-1-git-send-email-kda@linux-powerpc.org>
 <696ee8f6-f44b-35c3-2c9f-676cb9e5ad95@epam.com>
 <CAOJe8K3wZCkc2d1nxYqesTm2Cnt3QjsLDPn7U5KJbC7Bc=oVKA@mail.gmail.com>
In-Reply-To: <CAOJe8K3wZCkc2d1nxYqesTm2Cnt3QjsLDPn7U5KJbC7Bc=oVKA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-powerpc.org; dkim=none (message not signed)
 header.d=none; linux-powerpc.org; dmarc=none action=none header.from=epam.com; 
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10c0f6a7-1cec-4855-8552-08d7fe321b52
x-ms-traffictypediagnostic: VI1PR03MB2909:
x-microsoft-antispam-prvs: <VI1PR03MB2909758D40D9B6B6D382BA84E7B40@VI1PR03MB2909.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B7olqOZMzfs78n0GfIxwgorAM0YARVx0yxy2f9ZgbQtzrA3w5YUia5GLZhsY69Po6LN2y142HZwKs92lNOLp/YVhp2yG+MaC7M8W4YaIzMc7cvborCMQ/IbplIo+y64i/48PV1TEeuC6otKMnvv3Iq2WNmm9WxbE2VO1RhFnU8R4N8AJPi7hP7rzyDd8D78A+ALWGhFQ9fOMpH5BTkw0gWYLp7+mkPrR5JY/s45F5m1phJpYizqQhfg60WUezL1ouIm9c2Qsp1iJY4lXPNPFOKbiGRdz7WYW9ddk71L5Q/T225l2ApHUwddGmmMM/DoBBFv6Dh8ZqeYE9BiiEvYc/tQp2ZOBznajgjcB/Xb08VeVRGEFz+mZt1ENlhwqtQqFDgoIe8Ot+e527Dv7q6gJBCdHv25gu1C+zO+uwGr3u9tF+b1h00j07VWIxTzKScd7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(66476007)(66446008)(26005)(6916009)(36756003)(186003)(2906002)(6506007)(71200400001)(8936002)(53546011)(2616005)(478600001)(316002)(86362001)(66946007)(31686004)(64756008)(66556008)(54906003)(8676002)(4326008)(6486002)(76116006)(5660300002)(6512007)(31696002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: AxjN9C6qJ3niN0CRBnwelaw5HKI5dvr5hX3wvcsJHx+lUOoVulBdIcUM8LkYxLLZ8/4LJghc0JSF2OfJbdauRbkNxHNIP9RqwL1SMu9kvhnkdY2q/0TFosSEuZLein6eh4M/7nANBEUCu2/U43H4KT1OlcWPAD0rVsRtJ+jOJK7CiqHDwJnsdFADRc76L9r4BdujXiZEbJqRW2MKHFs1BRlzfwk+I1KZmWkHkuuMju1gyS1PcnRRa5mEvkNTHuiD+dnl0ONE4FxNpfrxg4iIZzoNCRUvmwdDhFUMYhet5ssTIL76umllh94nTSWxElBgGO1i4zP64tB+a4RVezuX3iAmPmjDVLkPAUUPOGH63voqeNS+Vzbd1sIVjKsMDtr/1goe+4pRTjkTSZojE3r2QxMs3RxCRJZh6l+ycJVxJDXLpNYc/FQMw2E92JgO7UydmxQThNvVT3Otp5ZtC5o49/XAZ9QnnR3nMSk1QjYkHfs=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <934A95F41034AB4E85A3A113EDC7F10F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c0f6a7-1cec-4855-8552-08d7fe321b52
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 09:25:45.5857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FfU4pEskUtUPub3WLn+Nl0U2hxPXOB4Ewc8curXqn93XmyQ3y5mg9eADyzXEpmrtkU+FgvZXTbqfoFWiy9vvogqBORenTBz/SllsDAt1pZomKGfVuGSE81SYmXOFsEKq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB2909
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8yMi8yMCAxMjoxNyBQTSwgRGVuaXMgS2lyamFub3Ygd3JvdGU6DQo+IE9uIDUvMjIvMjAs
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxPbGVrc2FuZHJfQW5kcnVzaGNoZW5rb0BlcGFtLmNv
bT4gd3JvdGU6DQo+PiBPbiA1LzE4LzIwIDY6MDQgUE0sIERlbmlzIEtpcmphbm92IHdyb3RlOg0K
Pj4+IFRoZSBwYXRjaCBhZGRzIGEgbmV3IGV4dHJhIHR5cGUgdG8gYmUgYWJsZSB0byBkaWZmaXJl
bnRpYXRlDQo+Pj4gYmV0d2VlbiBSWCByZXNwb25zZXMgb24geGVuLW5ldGZyb250IHNpZGUgd2l0
aCB0aGUgYWRqdXN0ZWQgb2Zmc2V0DQo+Pj4gcmVxdWlyZWQgZm9yIFhEUCBwcm9jZXNzaW5nLg0K
Pj4+DQo+Pj4gVGhlIG9mZnNldCB2YWx1ZSBmcm9tIGEgZ3Vlc3QgaXMgcGFzc2VkIHZpYSB4ZW5z
dG9yZS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IERlbmlzIEtpcmphbm92IDxkZW5pcy5raXJq
YW5vdkBzdXNlLmNvbT4NCj4+PiAtLS0NCj4+PiB2NDoNCj4+PiAtIHVwZGF0ZWQgdGhlIGNvbW1p
dCBhbmQgZG9jdW1lbmF0aW9uDQo+Pj4NCj4+PiB2MzoNCj4+PiAtIHVwZGF0ZWQgdGhlIGNvbW1p
dCBtZXNzYWdlDQo+Pj4NCj4+PiB2MjoNCj4+PiAtIGFkZGVkIGRvY3VtZW50YXRpb24NCj4+PiAt
IGZpeGVkIHBhZGRpbmcgZm9yIG5ldGlmX2V4dHJhX2luZm8NCj4+PiAtLS0NCj4+PiAtLS0NCj4+
PiAgICB4ZW4vaW5jbHVkZS9wdWJsaWMvaW8vbmV0aWYuaCB8IDE4ICsrKysrKysrKysrKysrKysr
LQ0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2lvL25ldGlmLmgNCj4+
PiBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9uZXRpZi5oDQo+Pj4gaW5kZXggOWZjZjkxYS4uYTky
YmYwNCAxMDA2NDQNCj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vbmV0aWYuaA0KPj4+
ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9uZXRpZi5oDQo+Pj4gQEAgLTE2MSw2ICsxNjEs
MTcgQEANCj4+PiAgICAgKi8NCj4+Pg0KPj4+ICAgIC8qDQo+Pj4gKyAqICJ4ZHAtaGVhZHJvb20i
IGlzIHVzZWQgdG8gcmVxdWVzdCB0aGF0IGV4dHJhIHNwYWNlIGlzIGFkZGVkDQo+Pj4gKyAqIGZv
ciBYRFAgcHJvY2Vzc2luZy4gIFRoZSB2YWx1ZSBpcyBtZWFzdXJlZCBpbiBieXRlcyBhbmQgcGFz
c2VkIGJ5DQo+PiBub3Qgc3VyZSB0aGF0IHdlIHNob3VsZCB1c2Ugd29yZCAiYnl0ZXMiIGhlcmUg
YXMgdGhlIHJlc3Qgb2YgdGhlDQo+PiBwcm90b2NvbCAobW9zdGx5KQ0KPj4NCj4+IHRhbGtzIGFi
b3V0IG9jdGV0cy4gSXQgaXMgc29tZXdoYXQgbWl4ZWQgaGVyZSwgbm8gc3Ryb25nIG9waW5pb24N
Cj4gc3VyZSwgYnV0IHNpbmNlIHRoZSBwdWJsaWMgaGVhZGVyIG1peGVzIGl0IEkndmUgZGVjaWRl
ZCB0byB1c2UgdGhhdCB3b3JkLg0KPg0KPg0KPj4+ICsgKiB0aGUgZnJvbnRlbmQgdG8gYmUgY29u
c2lzdGVudCBiZXR3ZWVuIGJvdGggZW5kcy4NCj4+PiArICogSWYgdGhlIHZhbHVlIGlzIGdyZWF0
ZXIgdGhhbiB6ZXJvIHRoYXQgbWVhbnMgdGhhdA0KPj4+ICsgKiBhbiBSWCByZXNwb25zZSBpcyBn
b2luZyB0byBiZSBwYXNzZWQgdG8gYW4gWERQIHByb2dyYW0gZm9yDQo+Pj4gcHJvY2Vzc2luZy4N
Cj4+PiArICoNCj4+PiArICogImZlYXR1cmUteGRwLWhlYWRyb29tIiBpcyBzZXQgdG8gIjEiIGJ5
IHRoZSBuZXRiYWNrIHNpZGUgbGlrZSBvdGhlcg0KPj4+IGZlYXR1cmVzDQo+Pj4gKyAqIHNvIGEg
Z3Vlc3QgY2FuIGNoZWNrIGlmIGFuIFhEUCBwcm9ncmFtIGNhbiBiZSBwcm9jZXNzZWQuDQo+Pj4g
KyAqLw0KPj4+ICsNCj4+PiArLyoNCj4+PiAgICAgKiBDb250cm9sIHJpbmcNCj4+PiAgICAgKiA9
PT09PT09PT09PT0NCj4+PiAgICAgKg0KPj4+IEBAIC05ODUsNyArOTk2LDggQEAgdHlwZWRlZiBz
dHJ1Y3QgbmV0aWZfdHhfcmVxdWVzdCBuZXRpZl90eF9yZXF1ZXN0X3Q7DQo+Pj4gICAgI2RlZmlu
ZSBYRU5fTkVUSUZfRVhUUkFfVFlQRV9NQ0FTVF9BREQgKDIpICAvKiB1Lm1jYXN0ICovDQo+Pj4g
ICAgI2RlZmluZSBYRU5fTkVUSUZfRVhUUkFfVFlQRV9NQ0FTVF9ERUwgKDMpICAvKiB1Lm1jYXN0
ICovDQo+Pj4gICAgI2RlZmluZSBYRU5fTkVUSUZfRVhUUkFfVFlQRV9IQVNIICAgICAgKDQpICAv
KiB1Lmhhc2ggKi8NCj4+PiAtI2RlZmluZSBYRU5fTkVUSUZfRVhUUkFfVFlQRV9NQVggICAgICAg
KDUpDQo+Pj4gKyNkZWZpbmUgWEVOX05FVElGX0VYVFJBX1RZUEVfWERQICAgICAgICg1KSAgLyog
dS54ZHAgKi8NCj4+PiArI2RlZmluZSBYRU5fTkVUSUZfRVhUUkFfVFlQRV9NQVggICAgICAgKDYp
DQo+Pj4NCj4+PiAgICAvKiBuZXRpZl9leHRyYV9pbmZvX3QgZmxhZ3MuICovDQo+Pj4gICAgI2Rl
ZmluZSBfWEVOX05FVElGX0VYVFJBX0ZMQUdfTU9SRSAoMCkNCj4+PiBAQCAtMTAxOCw2ICsxMDMw
LDEwIEBAIHN0cnVjdCBuZXRpZl9leHRyYV9pbmZvIHsNCj4+PiAgICAgICAgICAgICAgICB1aW50
OF90IGFsZ29yaXRobTsNCj4+PiAgICAgICAgICAgICAgICB1aW50OF90IHZhbHVlWzRdOw0KPj4+
ICAgICAgICAgICAgfSBoYXNoOw0KPj4+ICsgICAgICAgIHN0cnVjdCB7DQo+Pj4gKyAgICAgICAg
ICAgIHVpbnQxNl90IGhlYWRyb29tOw0KPj4gd2h5IGRvIHlvdSBuZWVkICJwYWQiIGZpZWxkIGhl
cmU/DQo+IFRvIHN0YXRlIHRoYXQgd2UgaGF2ZSBhIGZpeGVkIHNpemUgYXZhaWxhYmxlLg0KDQpX
ZWxsLCBJIHdvdWxkIGV4cGVjdCAicmVzZXJ2ZWQiIG9yIHNvbWV0aGluZyBpbiB0aGF0IGNhc2Ug
YW5kICJwYWQiIGluIGNhc2UNCg0KdGhlcmUgYXJlIG90aGVyIGZpZWxkcyBmb2xsb3dpbmcgKHNl
ZSBnc28gYWJvdmUpLg0KDQpCdXQgaGVyZSBJIHRoaW5rICJwYWQiIGlzIG5vdCByZXF1aXJlZCwg
anVzdCBsaWtlIG1jYXN0IGRvZXNuJ3QgYWRkIGFueQ0KDQo+DQo+Pj4gKyAgICAgICAgICAgIHVp
bnQxNl90IHBhZFsyXQ0KPj4+ICsgICAgICAgIH0geGRwOw0KPj4+ICAgICAgICAgICAgdWludDE2
X3QgcGFkWzNdOw0KPj4+ICAgICAgICB9IHU7DQo+Pj4gICAgfTs=

