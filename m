Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 054811DE3BA
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 12:10:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4d8-0001wa-MH; Fri, 22 May 2020 10:10:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=de5w=7E=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jc4d7-0001wO-9T
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 10:10:17 +0000
X-Inumbo-ID: 6ec346d6-9c14-11ea-ae69-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::614])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ec346d6-9c14-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 10:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QisDxXEcjL0FLe4iwHsxNprKObQa3cQg+djV5J9gyQIVjErRWJxG2ORnjnFP+LsfepebskpmrB0x9Wfs20MMhbJ5twFJWMFwTk1mogFEW3ac/gDN09XEeT/0P3xD5BVGaoBAiPPnq8eHIc7nRYZpR6VHSZuRxDihGOIfYeVU7yNsyDEl+9OWnmQhFM/xS4RMRWHVpmToW4hv1yzwyDCI79Br9dZcjgQ8CNAVp/yt80Qo94ccsZVB8FHErCKFHc4Dqeu1GCmDtMPCHTfZD0aw2azWyLh8AWsPQxvDkxUf0PB8oqTq00oVuTFZ20yVq9bhYvGsvKbchgdOoXNnJHsEhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z81P0w2E9rPDUXDKcF8PG7ztBVmG5KoTvDdoezk8nW0=;
 b=Z31QwQIqLm4yG2JZT7MRfrdRV1ZTzgpPf+0UV2dJzGpcU1NfiwWtn1VCfatzNYPLuS7PJKKSTuaHEbCyq7/6WO5cM2ry818qeuG5oChfbmd7c3XC7kJeNyCHKWOAqrWWbwxISmQ4aZifP8E1X09HovhBhz4h1zuCIoeODgTxbcEVqfcSnU3fPgMLZvgFhYRdQkXETA7VVP8Kev5LXXflmql8gExggnkc4+CZEIvgsOa8xx1S+aYyIJcd0kFzAPZDatkQOPKd7SPcfK8TNt/tccrhJ9fuEarrcRMEYWgjlPQ+Flvzj6J0g4g7pbgsSPauztv6hJ5ZbwGvQ0MjVAFWHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z81P0w2E9rPDUXDKcF8PG7ztBVmG5KoTvDdoezk8nW0=;
 b=MrWP3STeHIMqkecKfpLn9KHWD3dxV/xYslIpUMN2/w/RC1Xtbg2EWLZD49Cm7TFW2Ym3O3KPUNsCQDTDjZl4SkEnhroI8rYrRKyOwosUVbwTmh6My5SAJEN+fcmqVa0WEZy51TrT8dyoaFgEefolCkXUc7T7f+uy/09XHqlSbdM=
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com (2603:10a6:803:72::14)
 by VI1PR03MB6333.eurprd03.prod.outlook.com (2603:10a6:800:13c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 22 May
 2020 10:10:13 +0000
Received: from VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4]) by VI1PR03MB3998.eurprd03.prod.outlook.com
 ([fe80::28ec:3584:94d:27a4%7]) with mapi id 15.20.3021.027; Fri, 22 May 2020
 10:10:13 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Denis Kirjanov <kda@linux-powerpc.org>
Subject: Re: [PATCH v4] public/io/netif.h: add a new extra type for XDP
Thread-Topic: [PATCH v4] public/io/netif.h: add a new extra type for XDP
Thread-Index: AQHWMBiqME7497+04E6+8Omw+GVY7aiz01kAgAACZQCAAAIYAIAAClQA
Date: Fri, 22 May 2020 10:10:13 +0000
Message-ID: <aff85c9c-fd98-c848-6062-4694d7f1a9c1@epam.com>
References: <1589814292-1789-1-git-send-email-kda@linux-powerpc.org>
 <696ee8f6-f44b-35c3-2c9f-676cb9e5ad95@epam.com>
 <CAOJe8K3wZCkc2d1nxYqesTm2Cnt3QjsLDPn7U5KJbC7Bc=oVKA@mail.gmail.com>
 <05f78e98-79b9-b1a7-b892-67033b9cd245@epam.com>
 <CAOJe8K3Zwf7SjDwdPntucgu13meGahDNMi3oaqc6g9Y7Ttoo4Q@mail.gmail.com>
In-Reply-To: <CAOJe8K3Zwf7SjDwdPntucgu13meGahDNMi3oaqc6g9Y7Ttoo4Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-powerpc.org; dkim=none (message not signed)
 header.d=none; linux-powerpc.org; dmarc=none action=none header.from=epam.com; 
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb0301b2-25d5-4762-117e-08d7fe3851c0
x-ms-traffictypediagnostic: VI1PR03MB6333:
x-microsoft-antispam-prvs: <VI1PR03MB6333F1B6DB38AC539D10EE2EE7B40@VI1PR03MB6333.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ql7VWJ0g+BdyOx3/WHid4LPPVPfljHep7SEIkYDgwhBgFkzbymRELEzQO4lYDv2STqvTJ5Zd3wj+V1XWYMYh/+0tX4VE17YPxasqP7B7whVrYSDj8/8PF2Ya6zpkgtAk3njcbUbSDpnwBIgbAkq3ORj1/hag2qhGpcVBoSykU8avAzBWlRtjZbRgFutUa+z0Dm1NMq/VDAG+PfaERZfR20h3ya9nO6ww1WOtthUp1MDm1ukI3MJszUddm9rRzjW1uep89979FZ/0LbjkUXPpxq/U7NpNZp5BF1zqs1KGNbGC2d4wg38QeJU7t719J/sbpOH1zZ0k1FzzgAOUZZAGOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB3998.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(26005)(6506007)(53546011)(2616005)(6486002)(2906002)(186003)(36756003)(8676002)(8936002)(86362001)(316002)(31686004)(478600001)(31696002)(6512007)(6916009)(66556008)(4326008)(64756008)(66446008)(66476007)(76116006)(66946007)(71200400001)(5660300002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: E0lQ0gyBC88Vfn7kfyA+B5qvUW3h/053KNOZizvSbmir1wuj4YvK1D1xVDJwBIBy2xpWIRcKQJhobAaTXk+dXK5x3cin/XZljIc1+7bUn6SRXc1Rw6ueGuEIDswt07fHyFEaqpIJx0USU31FClXcuwpmLbrG4GIVFiqjio8DXhmF9Z0LbEUJnJWSbyiGZuLGE0iW/MXVr4Ftkx/fSc20iw4T48ha1OSYEf9GwwpBbA+TTiBFTuvjABSemrn5ukk4ZOBF4jNUwSrEUcqPKMhCOQu66EhBqJ0UtoLJEjbPxps0dgWutE1PPcTiFGrF+LD+sSKVhHHccMMOywk5wzk/bgTBpUgd+PntgfDY1Cet2c5hHeQCIPJ6AswjfX/1D9p5IH7/9FXrUIyRzTX7bJ2tZSnbB1U6FCtqUuQEO1ABLRDQvTI8wxulzCsRmj/nwp5JpR8+j7736FLQBkRVPALY6HP+3RN4PDbdvYUFLXsdA5c=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <039DE3ACB2D7504BB39CAFF65F064479@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0301b2-25d5-4762-117e-08d7fe3851c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 10:10:13.8850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5it0DEQT3Q1GfuA/DinBSIDw02k0TZyTuMIIqAxhzVEFbqZgpT5jJtopFW2oeWHCVE6UpA72vYyCRhxu71htLPESUInn1MmJGK4jgk8/huvQd3lQuSXdLomQCr5K8l1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6333
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

DQpPbiA1LzIyLzIwIDEyOjMzIFBNLCBEZW5pcyBLaXJqYW5vdiB3cm90ZToNCj4gT24gNS8yMi8y
MCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPE9sZWtzYW5kcl9BbmRydXNoY2hlbmtvQGVwYW0u
Y29tPiB3cm90ZToNCj4+IE9uIDUvMjIvMjAgMTI6MTcgUE0sIERlbmlzIEtpcmphbm92IHdyb3Rl
Og0KPj4+IE9uIDUvMjIvMjAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxPbGVrc2FuZHJfQW5k
cnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+PiB3cm90ZToNCj4+Pj4gT24gNS8xOC8yMCA2OjA0IFBN
LCBEZW5pcyBLaXJqYW5vdiB3cm90ZToNCj4+Pj4+IFRoZSBwYXRjaCBhZGRzIGEgbmV3IGV4dHJh
IHR5cGUgdG8gYmUgYWJsZSB0byBkaWZmaXJlbnRpYXRlDQo+Pj4+PiBiZXR3ZWVuIFJYIHJlc3Bv
bnNlcyBvbiB4ZW4tbmV0ZnJvbnQgc2lkZSB3aXRoIHRoZSBhZGp1c3RlZCBvZmZzZXQNCj4+Pj4+
IHJlcXVpcmVkIGZvciBYRFAgcHJvY2Vzc2luZy4NCj4+Pj4+DQo+Pj4+PiBUaGUgb2Zmc2V0IHZh
bHVlIGZyb20gYSBndWVzdCBpcyBwYXNzZWQgdmlhIHhlbnN0b3JlLg0KPj4+Pj4NCj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IERlbmlzIEtpcmphbm92IDxkZW5pcy5raXJqYW5vdkBzdXNlLmNvbT4NCj4+
Pj4+IC0tLQ0KPj4+Pj4gdjQ6DQo+Pj4+PiAtIHVwZGF0ZWQgdGhlIGNvbW1pdCBhbmQgZG9jdW1l
bmF0aW9uDQo+Pj4+Pg0KPj4+Pj4gdjM6DQo+Pj4+PiAtIHVwZGF0ZWQgdGhlIGNvbW1pdCBtZXNz
YWdlDQo+Pj4+Pg0KPj4+Pj4gdjI6DQo+Pj4+PiAtIGFkZGVkIGRvY3VtZW50YXRpb24NCj4+Pj4+
IC0gZml4ZWQgcGFkZGluZyBmb3IgbmV0aWZfZXh0cmFfaW5mbw0KPj4+Pj4gLS0tDQo+Pj4+PiAt
LS0NCj4+Pj4+ICAgICB4ZW4vaW5jbHVkZS9wdWJsaWMvaW8vbmV0aWYuaCB8IDE4ICsrKysrKysr
KysrKysrKysrLQ0KPj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9pby9uZXRpZi5oDQo+Pj4+PiBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9uZXRpZi5oDQo+Pj4+
PiBpbmRleCA5ZmNmOTFhLi5hOTJiZjA0IDEwMDY0NA0KPj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUv
cHVibGljL2lvL25ldGlmLmgNCj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9uZXRp
Zi5oDQo+Pj4+PiBAQCAtMTYxLDYgKzE2MSwxNyBAQA0KPj4+Pj4gICAgICAqLw0KPj4+Pj4NCj4+
Pj4+ICAgICAvKg0KPj4+Pj4gKyAqICJ4ZHAtaGVhZHJvb20iIGlzIHVzZWQgdG8gcmVxdWVzdCB0
aGF0IGV4dHJhIHNwYWNlIGlzIGFkZGVkDQo+Pj4+PiArICogZm9yIFhEUCBwcm9jZXNzaW5nLiAg
VGhlIHZhbHVlIGlzIG1lYXN1cmVkIGluIGJ5dGVzIGFuZCBwYXNzZWQgYnkNCj4+Pj4gbm90IHN1
cmUgdGhhdCB3ZSBzaG91bGQgdXNlIHdvcmQgImJ5dGVzIiBoZXJlIGFzIHRoZSByZXN0IG9mIHRo
ZQ0KPj4+PiBwcm90b2NvbCAobW9zdGx5KQ0KPj4+Pg0KPj4+PiB0YWxrcyBhYm91dCBvY3RldHMu
IEl0IGlzIHNvbWV3aGF0IG1peGVkIGhlcmUsIG5vIHN0cm9uZyBvcGluaW9uDQo+Pj4gc3VyZSwg
YnV0IHNpbmNlIHRoZSBwdWJsaWMgaGVhZGVyIG1peGVzIGl0IEkndmUgZGVjaWRlZCB0byB1c2Ug
dGhhdCB3b3JkLg0KPj4+DQo+Pj4NCj4+Pj4+ICsgKiB0aGUgZnJvbnRlbmQgdG8gYmUgY29uc2lz
dGVudCBiZXR3ZWVuIGJvdGggZW5kcy4NCj4+Pj4+ICsgKiBJZiB0aGUgdmFsdWUgaXMgZ3JlYXRl
ciB0aGFuIHplcm8gdGhhdCBtZWFucyB0aGF0DQo+Pj4+PiArICogYW4gUlggcmVzcG9uc2UgaXMg
Z29pbmcgdG8gYmUgcGFzc2VkIHRvIGFuIFhEUCBwcm9ncmFtIGZvcg0KPj4+Pj4gcHJvY2Vzc2lu
Zy4NCj4+Pj4+ICsgKg0KPj4+Pj4gKyAqICJmZWF0dXJlLXhkcC1oZWFkcm9vbSIgaXMgc2V0IHRv
ICIxIiBieSB0aGUgbmV0YmFjayBzaWRlIGxpa2Ugb3RoZXINCj4+Pj4+IGZlYXR1cmVzDQo+Pj4+
PiArICogc28gYSBndWVzdCBjYW4gY2hlY2sgaWYgYW4gWERQIHByb2dyYW0gY2FuIGJlIHByb2Nl
c3NlZC4NCj4+Pj4+ICsgKi8NCj4+Pj4+ICsNCj4+Pj4+ICsvKg0KPj4+Pj4gICAgICAqIENvbnRy
b2wgcmluZw0KPj4+Pj4gICAgICAqID09PT09PT09PT09PQ0KPj4+Pj4gICAgICAqDQo+Pj4+PiBA
QCAtOTg1LDcgKzk5Niw4IEBAIHR5cGVkZWYgc3RydWN0IG5ldGlmX3R4X3JlcXVlc3QgbmV0aWZf
dHhfcmVxdWVzdF90Ow0KPj4+Pj4gICAgICNkZWZpbmUgWEVOX05FVElGX0VYVFJBX1RZUEVfTUNB
U1RfQUREICgyKSAgLyogdS5tY2FzdCAqLw0KPj4+Pj4gICAgICNkZWZpbmUgWEVOX05FVElGX0VY
VFJBX1RZUEVfTUNBU1RfREVMICgzKSAgLyogdS5tY2FzdCAqLw0KPj4+Pj4gICAgICNkZWZpbmUg
WEVOX05FVElGX0VYVFJBX1RZUEVfSEFTSCAgICAgICg0KSAgLyogdS5oYXNoICovDQo+Pj4+PiAt
I2RlZmluZSBYRU5fTkVUSUZfRVhUUkFfVFlQRV9NQVggICAgICAgKDUpDQo+Pj4+PiArI2RlZmlu
ZSBYRU5fTkVUSUZfRVhUUkFfVFlQRV9YRFAgICAgICAgKDUpICAvKiB1LnhkcCAqLw0KPj4+Pj4g
KyNkZWZpbmUgWEVOX05FVElGX0VYVFJBX1RZUEVfTUFYICAgICAgICg2KQ0KPj4+Pj4NCj4+Pj4+
ICAgICAvKiBuZXRpZl9leHRyYV9pbmZvX3QgZmxhZ3MuICovDQo+Pj4+PiAgICAgI2RlZmluZSBf
WEVOX05FVElGX0VYVFJBX0ZMQUdfTU9SRSAoMCkNCj4+Pj4+IEBAIC0xMDE4LDYgKzEwMzAsMTAg
QEAgc3RydWN0IG5ldGlmX2V4dHJhX2luZm8gew0KPj4+Pj4gICAgICAgICAgICAgICAgIHVpbnQ4
X3QgYWxnb3JpdGhtOw0KPj4+Pj4gICAgICAgICAgICAgICAgIHVpbnQ4X3QgdmFsdWVbNF07DQo+
Pj4+PiAgICAgICAgICAgICB9IGhhc2g7DQo+Pj4+PiArICAgICAgICBzdHJ1Y3Qgew0KPj4+Pj4g
KyAgICAgICAgICAgIHVpbnQxNl90IGhlYWRyb29tOw0KPj4+PiB3aHkgZG8geW91IG5lZWQgInBh
ZCIgZmllbGQgaGVyZT8NCj4+PiBUbyBzdGF0ZSB0aGF0IHdlIGhhdmUgYSBmaXhlZCBzaXplIGF2
YWlsYWJsZS4NCj4+IFdlbGwsIEkgd291bGQgZXhwZWN0ICJyZXNlcnZlZCIgb3Igc29tZXRoaW5n
IGluIHRoYXQgY2FzZSBhbmQgInBhZCIgaW4gY2FzZQ0KPj4NCj4+IHRoZXJlIGFyZSBvdGhlciBm
aWVsZHMgZm9sbG93aW5nIChzZWUgZ3NvIGFib3ZlKS4NCj4gaXQgY2FuIGJlIGNvbnNpc3RlbnQg
d2l0aCBvdGhlciBuYW1lcyBsaWtlIHBhZCBhdCB0aGVuIGVuZCBvZiB0aGUgc3RydWN0dXJlLg0K
Pg0KPiBJZiBpdCByZWFsbHkgbWF0dGVycyBJIGNhbiBjaGFuZ2UgaXQsIG5vIHByb2JsZW0uDQpN
eSBwb2ludCBpcyB0aGF0IElNTyBpdCBpcyBub3QgcmVxdWlyZWQgYXQgYWxsLCBidXQgdGhpcyBp
cyB1cCB0byANCm1haW50YWluZXJzIHRvIGRlY2lkZQ0KPg0KPj4gQnV0IGhlcmUgSSB0aGluayAi
cGFkIiBpcyBub3QgcmVxdWlyZWQsIGp1c3QgbGlrZSBtY2FzdCBkb2Vzbid0IGFkZCBhbnkNCj4g
YmVjYXVzZSBpdCdzIGFscmVhZHkgNi1ieXRlcyBsb25nDQp5b3UgYXJlIHJpZ2h0DQo+DQo+Pj4+
PiArICAgICAgICAgICAgdWludDE2X3QgcGFkWzJdDQo+Pj4+PiArICAgICAgICB9IHhkcDsNCj4+
Pj4+ICAgICAgICAgICAgIHVpbnQxNl90IHBhZFszXTsNCj4+Pj4+ICAgICAgICAgfSB1Ow0KPj4+
Pj4gICAgIH07

