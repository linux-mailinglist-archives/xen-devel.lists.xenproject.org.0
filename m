Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDFA207C36
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 21:32:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joB7R-00088Q-4K; Wed, 24 Jun 2020 19:31:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DbcV=AF=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1joB7P-00088L-BW
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 19:31:35 +0000
X-Inumbo-ID: 4fd455ba-b651-11ea-bb8b-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fd455ba-b651-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 19:31:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSuxsUBgIt/hxzgPqI0PW4EXiltUo8+oDWUSHr/Zec/b1ZYAMXLrO3U4NRXOw80yq7sqwU0t6iBC4Egq6E5to1kr+7sd4KXh2L0DB0LloP9P6Kg55HMiBZpVI8fGTZDEEj5iFDKD08woLwWzitsNs7zXNJU+QjtQErmRKjsADeOqn7SSx1gXKPAfc9M6hiOp33hoTePp3e4kmnXRHpS3Lh9hEj7lJOQfD0lWls2NgMf5X7BmGth2gTepzclh1Nq/9nwcM9JA8Kb3QMITh8FWdYDrZ7Ar9K+p8241DZHH8784VzORyJljoacwsBC4ethc/aIpzVRPg+/TauTMFnirlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBX2+fpeC/ugVAt5hiuQeME+Rge+yTxCGULaNRegUf4=;
 b=CBCiH7xNAPA1RD9QmDjhQAGleUQW24gNRx1T3hR2SFv8qRgrD5HU0eU85rmqdsJQWX0tQkMSHu7HiM2GCO1T2lg/QOgzZibcgU+2EJjKivZjexLiS5LI1VUIwNLwlF0JjZ+hRhwXZN1zT1kmOtxS4q2cPfYnTYO0MAxgHq3NVlGjWaJrXn+UQA1Jg1ERCM2Sp0UG9/NdYwizQLMD/mN9K1Tj0pbGyB3xnM0yrPf/QuLj7t6iJZ6HLpVv4UVdeolHMlfg7A+YMEqu3jxmgXsrQozGsYuEIOzq4Klo8rk0BfuIgx4OvhLOqWSPS30HXb4lZOpWk4wWrpzyZGNrsPNzkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBX2+fpeC/ugVAt5hiuQeME+Rge+yTxCGULaNRegUf4=;
 b=ygLZohI+E2plDGCHq3I7tHeaSiBQ6jnA/gtyxMzZGCg+PghbdOZUe1+ckhIZbsY26hSlzSrDZX2AIY74Z91oLJHED7nhJHXInX6DkWXWgOTovSPLEYiJ4KPvXTf7QXiwnL1vQbN0E6x2jR+z/gAWNUp0YXeC8RsxTXtsqwaxnPyV1crrSJJtjsy2clf+0jNp358vZKUhe02wnHb3Bg0Cj0ClziG6pncuD0rYxUIpxAyc0bBccf7tC0bvGm9dFgFOhFXC7kmkwzdXpS9/ztNxDLsipKRBEev9K46LwdVPbS/A4bDoq0xNB4Tio/jW0N8ePieImY6BbCADQHck7rRABQ==
Received: from AM6PR03MB3991.eurprd03.prod.outlook.com (2603:10a6:20b:25::20)
 by AM6PR03MB4951.eurprd03.prod.outlook.com (2603:10a6:20b:82::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 24 Jun
 2020 19:31:32 +0000
Received: from AM6PR03MB3991.eurprd03.prod.outlook.com
 ([fe80::b015:38c7:355d:1c1c]) by AM6PR03MB3991.eurprd03.prod.outlook.com
 ([fe80::b015:38c7:355d:1c1c%4]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 19:31:32 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWOoSI1wnhumD+IkWBnAQX9mudyajIlWsAgBVWbwCAAJ62gIAAeBOAgAANxQCAAWPDgIAEUtgAgAAGgYCAAAHAgIAANpaAgAB+IgCAAEYyAIABnlyAgAC1sYCAACjZgA==
Date: Wed, 24 Jun 2020 19:31:31 +0000
Message-ID: <473beeda-15e6-dd69-e140-b4084bea3ead@epam.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <alpine.DEB.2.21.2006191020110.12730@sstabellini-ThinkPad-T480s>
 <c5905f40-6d0a-358f-35e4-239e88ace7d8@epam.com>
 <94bfe57c-c1be-62b4-3799-b90415264487@xen.org>
 <4ece84cf-dd68-6eb4-a0e2-e9008d264ba5@epam.com>
 <1a44c645-8c9a-93ce-8466-35c87eb4fca5@xen.org>
 <alpine.DEB.2.21.2006221419200.8121@sstabellini-ThinkPad-T480s>
 <271a4db0-5ce5-ba25-65e7-107c040f5069@epam.com>
 <a122102d-c023-0379-5d2c-b7b08d262844@epam.com>
 <alpine.DEB.2.21.2006241000260.8121@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006241000260.8121@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1167a4e3-362d-430f-3447-08d818753315
x-ms-traffictypediagnostic: AM6PR03MB4951:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR03MB495145D65A67309E91DD9757E7950@AM6PR03MB4951.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ARA1NmlOkIZFI7g3VeJ96y1yKIzkZZ5xmFeIAg9xbwLB83RoONIxeLLCc/s+LkifUeoGGOX5fgrG52v5TINjpE2KrRQzanjEadGQBrTfxHJfAhtbQpwBDEDBZ7uHmfBMBJO3LrXs6ERL/F8gTk8ugt1uOeBKYCjz60h9v516WQ6ZRRNaOWR79pBCAh0yxt2CV3VLKYRmAg2imMdED9q8Nvtrd/WimEq/WES4oN49JpsbGoCeWdIU+SheNYHEVOOefvc+HSlCTW1wMvcyy7/dQQUxELRXBfLOk69kfIzd/ao8/yOcTJUgV/PhydWc7dIVI8kBA3/TuCmWjzWIHLkzHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB3991.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(478600001)(2906002)(6512007)(54906003)(86362001)(31696002)(36756003)(6506007)(31686004)(53546011)(2616005)(4326008)(316002)(186003)(26005)(71200400001)(7416002)(66446008)(66556008)(66476007)(6486002)(8676002)(5660300002)(66946007)(76116006)(83380400001)(8936002)(6916009)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 2A0xCrVB5gIT1XIxsrbn/S2ij26u9jwRcj+0aUKneRMT9wWqN4lA7KruRaF7cRQskcshZkR2Jchk52UPkETZHAWDgpNoDxRK4e/WdejF3H+po6zskTF3MDYC2IfnMh8n4PM5+uEc+YAM5zQDoemnPocPU36Vg9TQXzva2aCPhy9F7oPn6V+9jrik6dMFDDSwuGV7YF9HwJo5rtq0d4z265tTd0UZosCGaCloAlYXM2DWp9vaEikUDJ2HK2NySMqh7AQwA+g8WpkSZ716gQ/cs1PFWqiOTadc6hEMo1n4ZtZWA4pTjDmnhrOxOQNQK3Wi35TJllMzlggciTWrO8E4/eriP6Fx3nIU2MR1q+xy4Vdpp7KQ38ehtxk5PWaP/CJ0F2JXReJMZV9RBYYrPihyiT2fpd48GWucllBwHgLFvEbF8K60HTJAcvP5ebNX+tTrGlbi/XYSc4Jixi5EopR+Gzf3QF4PJ/uQLi4N0KCtSYA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB36E52E73A0C745B631A9CA08B94EA1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB3991.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1167a4e3-362d-430f-3447-08d818753315
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 19:31:31.8524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zsx3E+/xgon608qoHXzW7bS0opbf/xS8J2ObQLsKE1oE78Yr7mWh0ptuutTWIG+2itKUrrd88VtKQkJVHU3bDKRJloO3lnReuB3LuBNFVbfG0Y5qLR1//uJgZMfk42Zz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4951
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
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Julien Grall <julien@xen.org>, Oleksandr Andrushchenko <andr2000@gmail.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8yNC8yMCA4OjA1IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIFdlZCwg
MjQgSnVuIDIwMjAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gNi8yMy8y
MCA4OjMxIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+PiBPbiA2LzIzLzIw
IDQ6MjAgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+Pj4gT24gTW9uLCAyMiBKdW4g
MjAyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4+Pj4gRm9yIHRoZSBmaXJzdCBwYXJ0IChf
X1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fKSBJIHRoaW5rIHdlIGNhbiBwcm92aWRlIGl0DQo+Pj4+
Pj4+PiB2aWENCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBDRkxBR1Mgb3Igc29tZXRoaW5nLiBUaGlzIGNh
biBhbHNvIGJlIGRvbmUgZm9yIHRoZSBsb2NhdGlvbiBvZiBYZW4NCj4+Pj4+Pj4+IGhlYWRlcnMu
DQo+Pj4+Pj4+IF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gc2hvdWxkIHdvcmsgdGhyb3VnaCB0
aGUgQ0ZMQUdTLiBBbiBhbHRlcm5hdGl2ZQ0KPj4+Pj4+PiB3b3VsZCBiZSB0byBhbGxvdyB0aGUg
dXNlciB0byBzcGVjaWZ5IHRocm91Z2ggdGhlIEtjb25maWcuDQo+Pj4+Pj4gWW91IG1lYW4gc3Bl
Y2lmeWluZyB2aWEgS2NvbmZpZyBzb21ldGhpbmcgbGlrZSAiMHgwMDA0MGQwMCI/DQo+Pj4+PiBQ
b3NzaWJseSB5ZXMuDQo+Pj4+Pg0KPj4+Pj4+IEFuZCB3aGF0IGFib3V0IHRoZSBoZWFkZXJzPyBI
b3cgd2lsbCB3ZSBwcm92aWRlIHRoZWlyIGxvY2F0aW9uIGlmIHdlIGRlY2lkZQ0KPj4+Pj4+IG5v
dCB0byBpbmNsdWRlIHRob3NlDQo+Pj4+Pj4NCj4+Pj4+PiBpbiB0aGUgdHJlZT8NCj4+Pj4+IEkg
d291bGQgZG8gdGhyb3VnaCBLY29uZmlnIGFzIHdlbGwuDQo+Pj4+IElmIHdlIHNwZWNpZnkgdGhl
IGV4dGVybmFsIGxvY2F0aW9uIG9mIHRoZSBYZW4gaGVhZGVycyB2aWEgS2NvbmZpZywgaXQNCj4+
Pj4gc2VlbXMgdG8gbWUgdGhhdCB3ZSBzaG91bGQgYmUgYWJsZSB0byBkZXRlY3QgdGhlIGludGVy
ZmFjZSB2ZXJzaW9uDQo+Pj4+IGF1dG9tYXRpY2FsbHkgZnJvbSBhbnkgTWFrZWZpbGUgYXMgcGFy
dCBvZiB0aGUgYnVpbGQuIE5vIG5lZWQgdG8gYXNrIHRoZQ0KPj4+PiB1c2VyLg0KPj4+Pg0KPj4+
PiBIb3dldmVyLCBpZiBPbGVrc2FuZHIgaXMgdGhpbmtpbmcgb2YgdXNpbmcgdGhlIFhlbiBoZWFk
ZXJzIGZvciB0aGUNCj4+Pj4gaHlwZXJjYWxscyBkZWZpbml0aW9ucywgdGhlbiBJIHRoaW5rIHdl
IG1pZ2h0IG5vdCBuZWVkIGV4dGVybmFsIGhlYWRlcnMNCj4+Pj4gYXQgYWxsIGJlY2F1c2UgdGhh
dCBpcyBhIHN0YWJsZSBpbnRlcmZhY2UsIGFzIEp1bGllbiB3cm90ZS4gV2UgY291bGQNCj4+Pj4g
anVzdCBkZWZpbmUgb3VyIG93biBmZXcgaGVhZGVycyBmb3IganVzdCB3aGF0IHlvdSBuZWVkIGxp
a2UgTGludXggZG9lcy4NCj4+PiBUaGlzIGlzIGEgZ29vZCBpZGVhOiBJJ2xsIHRyeSB0byBnZXQg
dGhlIG1pbmltYWwgc2V0IG9mIGhlYWRlcnMgZnJvbSBMaW51eA0KPj4+DQo+Pj4gaW5zdGVhZCBv
ZiBYZW4gYXMgdGhvc2Ugc2VlbSB0byBiZSB3ZWxsIHByZXBhcmVkIGZvciBzdWNoIGEgdXNlLWNh
c2UuIFRoaXMNCj4+Pg0KPj4+IHdheSB3ZSdsbCBoYXZlIGhlYWRlcnMgaW4gVS1ib290IHRyZWUg
YW5kIGd1YXJhbnRlZSB0aGF0IHdlIGhhdmUgYSBtaW5pbWFsDQo+Pj4NCj4+PiBzdWJzZXQgd2hp
Y2ggaXMgZWFzaWVyIHRvIG1haW50YWluLiBJJ2xsIGtlZXAgeW91IHVwZGF0ZWQgb24gdGhlIHBy
b2dyZXNzDQo+PiBXZSd2ZSBtYW5hZ2VkIHRvIHN0cmlwIHRoZSBoZWFkZXJzIGFuZCByZW1vdmUg
X19YRU5fXyBhbmQgdGhlIHJlc3QgZGVmaW5pdGlvbnMNCj4+DQo+PiB3ZSB3ZXJlIHRhbGtpbmcg
YWJvdXQuIFNvLCB0aGVzZSBhcmUgbm93IHRoZSBtaW5pbWFsIHJlcXVpcmVkIHNldCBvZiBoZWFk
ZXJzDQo+Pg0KPj4gdGhhdCBhbGxvd3MgVS1ib290IHRvIGJ1aWxkIHNlcmlhbCBhbmQgYmxvY2sg
ZHJpdmVycy4gUGxlYXNlIHRha2UgYSBsb29rIGF0IFsxXQ0KPj4NCj4+IFB1bGwgcmVxdWVzdCBm
b3IgY29tbWVudHMgaXMgYXQgWzJdDQo+IEkgdGhpbmsgdGhpcyBpcyB0aGUgcmlnaHQgYXBwcm9h
Y2guIFRoZXJlIGlzIG5vIGJ1aWxkLWRlcGVuZGVuY3kgb24gWGVuDQo+IGFueW1vcmUsIGlzIHRo
YXQgY29ycmVjdD8NCk5vIGRlcGVuZGVuY3k=

