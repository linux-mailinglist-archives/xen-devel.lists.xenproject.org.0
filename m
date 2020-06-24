Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FCF206D64
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 09:17:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnzey-0001xZ-J9; Wed, 24 Jun 2020 07:17:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DbcV=AF=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jnzew-0001xT-Ed
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 07:17:26 +0000
X-Inumbo-ID: c095f5a4-b5ea-11ea-b7bb-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.65]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c095f5a4-b5ea-11ea-b7bb-bc764e2007e4;
 Wed, 24 Jun 2020 07:17:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PldPYImNNoCKjmYHyiqk2QZUEKKNrzKBewMYaoK4Ur732uSULnhp9AhiBzvvuCQUPL4vkR8nOT8JgcXK2Sq9vJbZQorNuO86O9NcSWvcPEs5rNP3U5ROpf33G9CRQvzsnpfVmbVB7VI2evdBxY2PmW0rVWx2mJXndhsMaIJWeJnmK27EiyNFDvpUSYVydOXbNtLwxLLneh9+JlCzaMrG7ZeDLnD4cyu5XIDHxH/9KhXHVRQjqzIV5VghHomKKMMYdgfKwCjVJczz+7csFqpC3uF23nPzEn9+9UOmP2q5pkY+W0rL3HkF2WJjdskVWIJPkGXglFstsG09fHeQoVsKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Es/g0CUgP46QKaZoI9vtQkjg822tBACsUFYgrC9e0Y=;
 b=EbAM+btYXntppn87yvI1Qk0VeLuf4gt/p5s+5I3hafFaHDqWRvSBPTjCgWqY3RcO9Z/MpWRFRKczf0KzlqvS+6IckyAMyO5zhSUbzy7z0jYQW7OgZzkmc7gdVe4kPPrA7C5h0mNjywwANQD6MNNichALlooS2pRSZSkEQLM/JrDTU1B/7IDdZRDt83p1WmqOHbdsvNFSx7wDVUioEDtIn3Ho0zlCWfMRuaGGdod6SIzc32Bxts1lDl0/qujbzBW8p+puTaNhapaeUmQNDJx+nC77vQrb+PVBUOxMR9Fny99ovaUwzMYJ57Y7h97UfJKGorZgH3WssQhNJTt5MJ1FsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Es/g0CUgP46QKaZoI9vtQkjg822tBACsUFYgrC9e0Y=;
 b=li/xYypteU6tcb3nxIlyvxFcFoBrv4EqYhwzm3p7Udjw21gykSbnVAfiTNIZm3xwNFZzH6MVPjTa6oCpcW2u15Nx/cPAQd1Lns7izRvUCoykO/zPxIdgQnYojN1Ye/0mFYL5jTk0VLZIrSo4GcBDtdn34HS/y1uVaGjF62yx8a3BC9x6Mu/RPytr8Bjh2U1qyF9jlm6N0TnItSHZTKgkoDS1j7F48153pW8y+pzuO30sQyjHISaOGmnQ8r90GYJ/HW3Bpo668CNHD++jM6xFradw5t4JysFHm008IruFqWn9CtrKn4nJPqk6rBzgqIgGUBBP+Py6Xs6vfEAqiivSKg==
Received: from AM6PR03MB3991.eurprd03.prod.outlook.com (2603:10a6:20b:25::20)
 by AM6PR03MB3688.eurprd03.prod.outlook.com (2603:10a6:209:35::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 07:17:23 +0000
Received: from AM6PR03MB3991.eurprd03.prod.outlook.com
 ([fe80::b015:38c7:355d:1c1c]) by AM6PR03MB3991.eurprd03.prod.outlook.com
 ([fe80::b015:38c7:355d:1c1c%4]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 07:17:23 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>
Subject: Re: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWOoSI1wnhumD+IkWBnAQX9mudyajIlWsAgBVWbwCAAJ62gIAAeBOAgAANxQCAAWPDgIAEUtgAgAAGgYCAAAHAgIAANpaAgAB+IgCAAEYyAIABnlyAgAAOqgCAAALEAA==
Date: Wed, 24 Jun 2020 07:17:23 +0000
Message-ID: <273d5fe8-dac9-6375-77df-e24f56066cfe@epam.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
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
 <DB6PR0402MB27601E1DDED18CDBF3D6A18188950@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB27601E1DDED18CDBF3D6A18188950@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32b1efd2-7f78-45c5-4828-08d8180ea430
x-ms-traffictypediagnostic: AM6PR03MB3688:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR03MB3688D2455E4F9359CC1F7476E7950@AM6PR03MB3688.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tnFlYr40TeU9N5+NW8CzqbweOhRJwKjBiewEOfV0KMHd8j1aOMdMczq/yUK+9CCA2rcLQwyOR5z+VaUSxX+zXZqT82JkVkuA4Z7dj/Sv639dBZfY7WEM+jhZKlsKs54ne2eUxJwDpcMQ8d/j49tOuPiIvtqjdCGHyrEz0exErWJTySHtj28ys8+xxlTI9alcddyew3qdjBF3eBH0+qd3htRSkce0IvgItzTu7Dnzk7MSNfZTowB0EFA1SB1cZax8m7VfG9rbjex0+oVmiIi5T4gx1zfcwm9ZuzwoLG5eDDGi3HlbpCpyQ7nxB/AaM8YxMdQKl8FF7aN2+qgJ5GFlOUYS8im5wIQSlgP9srVgeJFzMjTfhEg1MehC1N6N903uuSUdb7wRvh/CMlJfCa/MyA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB3991.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(53546011)(2616005)(6506007)(186003)(86362001)(31696002)(5660300002)(76116006)(966005)(91956017)(66946007)(83380400001)(26005)(7416002)(66476007)(31686004)(64756008)(66556008)(110136005)(2906002)(54906003)(45080400002)(478600001)(66446008)(8936002)(4326008)(316002)(71200400001)(36756003)(6486002)(8676002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: IZdgxaglixY+MUdUoQcOYTB4nkL2nmnJ4zLGKuwV8W+iOWhhMsNdzbrM9Fy7IH/QrOYw0c4wsqy9aj7c1Ucwdfy0qUam/iqZ02uwUqZHqgdK1p6xp6rG92nEN1llHIik7B3K0S8lVtddpgeDOMzF7Lcg7sd28mmiLwsismt3+FpT+xpOrquNlVCKK/d5yDhJWKryKPxLeoiXcNUhpVXQDAVCdzuIupQGfAThCFGp7lrHTxGbq1kdk1uGYUDwIJxVlet6Mcrh7v5ZQPaEvzo9L0AkX3YA5AJTew0q9vodT/Csb/RrUzTzR5frwv8pnx9ZTrqJTBS8dXCVQ2COaZnVOWAYhpbCT6qCeNi3Hs0fthFXn/KIC08Ur8vivjnv6Gdz0ZLx4KraU0dDIkEzw7wyhTp+epeMsVNtTHhwlsUqJQEnSYrsW385Ei/S/1cXkIuD6YHhnQAUL63Dq6q4wRnJ1o2wuXtJAAa4qtaImNbYYgg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <396295CCE294DA43B8898190689BE266@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b1efd2-7f78-45c5-4828-08d8180ea430
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 07:17:23.5002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wVpEm/Sj32diK6ktOB7jfF8fxr0kZT6hHYXsnOB9L4yJ6VDsw50TwHa8ctf/iM9rrMbS8v0W0yM4mQ6hElkzRNSIXd0Jxn+Lk92t8VVdCN95bvSNBc5NLAo9kTWzi/MT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3688
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
 Juergen Gross <jgross@suse.com>, Oleksandr Andrushchenko <andr2000@gmail.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA2LzI0LzIwIDEwOjA3IEFNLCBQZW5nIEZhbiB3cm90ZToNCj4+IFN1YmplY3Q6IFJlOiBV
RUZJIHN1cHBvcnQgaW4gQVJNIERvbVVzDQo+Pg0KPj4NCj4+IE9uIDYvMjMvMjAgODozMSBBTSwg
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4gT24gNi8yMy8yMCA0OjIwIEFNLCBT
dGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+IE9uIE1vbiwgMjIgSnVuIDIwMjAsIEp1bGll
biBHcmFsbCB3cm90ZToNCj4+Pj4+Pj4+IEZvciB0aGUgZmlyc3QgcGFydCAoX19YRU5fSU5URVJG
QUNFX1ZFUlNJT05fXykgSSB0aGluayB3ZSBjYW4NCj4+Pj4+Pj4+IHByb3ZpZGUgaXQgdmlhDQo+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4gQ0ZMQUdTIG9yIHNvbWV0aGluZy4gVGhpcyBjYW4gYWxzbyBiZSBk
b25lIGZvciB0aGUgbG9jYXRpb24gb2YNCj4+Pj4+Pj4+IFhlbiBoZWFkZXJzLg0KPj4+Pj4+PiBf
X1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fIHNob3VsZCB3b3JrIHRocm91Z2ggdGhlIENGTEFHUy4g
QW4NCj4+Pj4+Pj4gYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gYWxsb3cgdGhlIHVzZXIgdG8gc3Bl
Y2lmeSB0aHJvdWdoIHRoZSBLY29uZmlnLg0KPj4+Pj4+IFlvdSBtZWFuIHNwZWNpZnlpbmcgdmlh
IEtjb25maWcgc29tZXRoaW5nIGxpa2UgIjB4MDAwNDBkMDAiPw0KPj4+Pj4gUG9zc2libHkgeWVz
Lg0KPj4+Pj4NCj4+Pj4+PiBBbmQgd2hhdCBhYm91dCB0aGUgaGVhZGVycz8gSG93IHdpbGwgd2Ug
cHJvdmlkZSB0aGVpciBsb2NhdGlvbiBpZg0KPj4+Pj4+IHdlIGRlY2lkZSBub3QgdG8gaW5jbHVk
ZSB0aG9zZQ0KPj4+Pj4+DQo+Pj4+Pj4gaW4gdGhlIHRyZWU/DQo+Pj4+PiBJIHdvdWxkIGRvIHRo
cm91Z2ggS2NvbmZpZyBhcyB3ZWxsLg0KPj4+PiBJZiB3ZSBzcGVjaWZ5IHRoZSBleHRlcm5hbCBs
b2NhdGlvbiBvZiB0aGUgWGVuIGhlYWRlcnMgdmlhIEtjb25maWcsDQo+Pj4+IGl0IHNlZW1zIHRv
IG1lIHRoYXQgd2Ugc2hvdWxkIGJlIGFibGUgdG8gZGV0ZWN0IHRoZSBpbnRlcmZhY2UgdmVyc2lv
bg0KPj4+PiBhdXRvbWF0aWNhbGx5IGZyb20gYW55IE1ha2VmaWxlIGFzIHBhcnQgb2YgdGhlIGJ1
aWxkLiBObyBuZWVkIHRvIGFzaw0KPj4+PiB0aGUgdXNlci4NCj4+Pj4NCj4+Pj4gSG93ZXZlciwg
aWYgT2xla3NhbmRyIGlzIHRoaW5raW5nIG9mIHVzaW5nIHRoZSBYZW4gaGVhZGVycyBmb3IgdGhl
DQo+Pj4+IGh5cGVyY2FsbHMgZGVmaW5pdGlvbnMsIHRoZW4gSSB0aGluayB3ZSBtaWdodCBub3Qg
bmVlZCBleHRlcm5hbA0KPj4+PiBoZWFkZXJzIGF0IGFsbCBiZWNhdXNlIHRoYXQgaXMgYSBzdGFi
bGUgaW50ZXJmYWNlLCBhcyBKdWxpZW4gd3JvdGUuDQo+Pj4+IFdlIGNvdWxkIGp1c3QgZGVmaW5l
IG91ciBvd24gZmV3IGhlYWRlcnMgZm9yIGp1c3Qgd2hhdCB5b3UgbmVlZCBsaWtlIExpbnV4DQo+
PiBkb2VzLg0KPj4+IFRoaXMgaXMgYSBnb29kIGlkZWE6IEknbGwgdHJ5IHRvIGdldCB0aGUgbWlu
aW1hbCBzZXQgb2YgaGVhZGVycyBmcm9tDQo+Pj4gTGludXgNCj4+Pg0KPj4+IGluc3RlYWQgb2Yg
WGVuIGFzIHRob3NlIHNlZW0gdG8gYmUgd2VsbCBwcmVwYXJlZCBmb3Igc3VjaCBhIHVzZS1jYXNl
Lg0KPj4+IFRoaXMNCj4+Pg0KPj4+IHdheSB3ZSdsbCBoYXZlIGhlYWRlcnMgaW4gVS1ib290IHRy
ZWUgYW5kIGd1YXJhbnRlZSB0aGF0IHdlIGhhdmUgYQ0KPj4+IG1pbmltYWwNCj4+Pg0KPj4+IHN1
YnNldCB3aGljaCBpcyBlYXNpZXIgdG8gbWFpbnRhaW4uIEknbGwga2VlcCB5b3UgdXBkYXRlZCBv
biB0aGUNCj4+PiBwcm9ncmVzcw0KPj4gV2UndmUgbWFuYWdlZCB0byBzdHJpcCB0aGUgaGVhZGVy
cyBhbmQgcmVtb3ZlIF9fWEVOX18gYW5kIHRoZSByZXN0DQo+PiBkZWZpbml0aW9ucw0KPj4NCj4+
IHdlIHdlcmUgdGFsa2luZyBhYm91dC4gU28sIHRoZXNlIGFyZSBub3cgdGhlIG1pbmltYWwgcmVx
dWlyZWQgc2V0IG9mIGhlYWRlcnMNCj4+DQo+PiB0aGF0IGFsbG93cyBVLWJvb3QgdG8gYnVpbGQg
c2VyaWFsIGFuZCBibG9jayBkcml2ZXJzLiBQbGVhc2UgdGFrZSBhIGxvb2sgYXQgWzFdDQo+Pg0K
Pj4gUHVsbCByZXF1ZXN0IGZvciBjb21tZW50cyBpcyBhdCBbMl0NCj4gVGhlIFUtQm9vdCBuZXcg
bWVyZ2Ugd2luZG93IHdpbGwgYmUgb3BlbiBpbiAyMDIwLzcvMSwgc28gSSdkIHN1Z2dlc3QNCj4g
dGhlIHBhdGNoc2V0IGdvZXMgdG8gVS1Cb290IG1haWwgbGlzdCBmb3IgZGlzY3Vzc2lvbiBpZiB5
b3Ugd2FubmEgdGhlIHBhdGNoZXMNCj4gZ29ubmEgbWVyZ2VkIHNvb24uDQoNCldlIGRlZmluaXRl
bHkgd2FudCB0aGUgcGF0Y2hlcyB0byBiZSB1cHN0cmVhbWVkIGFuZCBtZXJnZWQsIGJ1dCBiZWZv
cmUgdGhhdA0KDQp3ZSBhbHNvIHdhbnQgdG8gbWFrZSBzdXJlIHRoYXQgWGVuIGNvbW11bml0eSBp
cyBoYXBweSB3aXRoIHdoYXQgd2UgdXBzdHJlYW0NCg0KSSBiZWxpZXZlIHdlIHJlc29sdmVkIG1v
c3Qgb2YgdGhlIGNvbmNlcm5zIHN1Y2ggYXMgaGVhZGVycywgUElFIGV0Yywgc28gdGhpcyBjYW4N
Cg0KYmUgZG9uZS4NCg0KQlRXLCBQZW5nLCBkaWQgeW91IGhhdmUgYSBjaGFuY2UgdG8gdHJ5IHRo
ZSBwdmJsb2NrIGRyaXZlciB5ZXQ/DQoNCj4NCj4gUmVnYXJkcywNCj4gUGVuZy4NCj4NCj4+Pj4g
SWYgeW91IGNhbiBkbyB0aGF0LCBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciBiZWNhdXNlIHdl
IGRlY291cGxlDQo+Pj4+IHRoZSBVQm9vdCBidWlsZCBmcm9tIHRoZSBYZW4gYnVpbGQgY29tcGxl
dGVseS4gV2UgZG9uJ3QgZXZlbiBuZWVkIHRoZQ0KPj4+PiBYZW4gdHJlZSBjaGVja2VkIG91dCB0
byBidWlsZCBVQm9vdC4gSXQgd291bGQgYmUgYSBodWdlIGFkdmFudGFnZQ0KPj4+PiBiZWNhdXNl
IGl0IG1ha2VzIGl0IGZhciBlYXNpZXIgdG8gYnVpbGQtdGVzdCBjaGFuZ2VzIGZvciBvdGhlcnMg
aW4NCj4+Pj4gdGhlIGNvbW11bml0eSB0aGF0IGRvbid0IGtub3cgYWJvdXQgWGVuIGFuZCBhbHNv
IGl0IGJlY29tZXMgZmFyDQo+Pj4+IGVhc2llciB0byBpbnRlZ3JhdGUgaW50byBhbnkgYnVpbGQg
c3lzdGVtLg0KPj4gWzFdDQo+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9l
dXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzKjNBKjJGKjJG
Z2l0aHViX187SlNVbCEhR0ZfMjlkYmNRSVVCUEEhbXdpYjN1bjYtdllCRzY4ek1mdXJXNi0wTXV1
RVI1dE5tSnRPaXREcFZpSUNOa1gwbGhpZzhpUEhtWm9rdU0tQkxRWXBlS1lBR1EkIC4NCj4+IGNv
bSUyRmFuZHIyMDAwJTJGdS1ib290JTJGdHJlZSUyRnB2YmxvY2tfdXBzdHJlYW1fdjEmYW1wO2Rh
dGE9MA0KPj4gMiU3QzAxJTdDcGVuZy5mYW4lNDBueHAuY29tJTdDNDA3ZDhhZjI0YTM2NDgzZmJk
Y2UwOGQ4MTgwNWVkODgNCj4+ICU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdD
MCU3QzAlN0M2MzcyODU3NjEwMjE5NzUNCj4+IDE2NCZhbXA7c2RhdGE9NXZXZkJiTFNjSUNYUFpX
VSUyQlUzYjdEeU9OY2d4VDhpSUNzeHJ3VWJPUlpZJQ0KPj4gM0QmYW1wO3Jlc2VydmVkPTANCj4+
DQo+PiBbMl0NCj4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2V1cjAxLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMqM0EqMkYqMkZnaXRodWJf
XztKU1VsISFHRl8yOWRiY1FJVUJQQSFtd2liM3VuNi12WUJHNjh6TWZ1clc2LTBNdXVFUjV0Tm1K
dE9pdERwVmlJQ05rWDBsaGlnOGlQSG1ab2t1TS1CTFFZcGVLWUFHUSQgLg0KPj4gY29tJTJGeGVu
LXRyb29wcyUyRnUtYm9vdCUyRnB1bGwlMkYyJmFtcDtkYXRhPTAyJTdDMDElN0NwZW5nLmZhDQo+
PiBuJTQwbnhwLmNvbSU3QzQwN2Q4YWYyNGEzNjQ4M2ZiZGNlMDhkODE4MDVlZDg4JTdDNjg2ZWEx
ZDNiYzJiNA0KPj4gYzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0MwJTdDNjM3Mjg1NzYxMDIxOTc1
MTY0JmFtcDtzZGF0YT0lMg0KPj4gRm1YaGVFdktzc0xqamFGS3NIQkJicWglMkI3MmpIM3VRbkU3
Y3BOMEozazhJJTNEJmFtcDtyZXNlcnZlZD0w

