Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4460826E028
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 18:00:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIwK1-00053S-Iz; Thu, 17 Sep 2020 15:59:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qtsM=C2=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1kIwJz-00053N-MP
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 15:59:43 +0000
X-Inumbo-ID: 19459be7-1fc2-40dc-a1f3-d93dfb3b5479
Received: from USG02-BN3-obe.outbound.protection.office365.us (unknown
 [23.103.208.48]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19459be7-1fc2-40dc-a1f3-d93dfb3b5479;
 Thu, 17 Sep 2020 15:59:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=q8rMTemUNQbf9RBI+U2ca69J75A7OFvtKFWRhlt/5JkpJe0SAMa1OFP/ROcGIChcW47i/UQgwHfX4EVVJ9BR7tAhXlZq55OErFWuVE7fyrFjRlWpAgRxhrJPsBhMebIGXDzAshCC9INfSFJyrVNlWxJtJSh77uiud06t28EJbFrcAnrf9QIVWH5GZfEcJl5iy+DnlQQywSCSUe+s3VpH3R7kzfGfFgqkyQu/NyceVOsbKmOtpM7QrQWWdCk7OuwnKh6h1kJLJchD6QI+afH5hQ5veyyHw2WdHrjFE1KjjfWqPm7V7h/k98EOl4h8EkR1rLtoNM80+FW5CULHgvOVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrpKS71eMcjBfOG9zsiKG/++G/fogWyjda55xTwxHx4=;
 b=SiriArxHyrViBTFfVM2Ch4TsXRyXg12ssgvmZfC0rHH++q34VEW5wBB1yoo7fspGqwtUf3scl937jFfK7KLIqI6lYQaS+cR87nj6o03/TvWDJqam357ZWrb7j0Ogl3spnNe/CLIS+BX3Zy89sBbbAo5rgMs6mx7UvuuZzeXRVObQMKAVbkEeJFh9ZHMCk1h8L4Ah7tp9y4jl93MmqwJnxCcG1/JpLpuf4p4Vlm3Xdxrqt87BIKDZT1uGyvIPtWhmym2o3H9nMHnsB8NH7ThikhtVKJheZYiuTskVfkNXrn2i7NwHUhmQEixb/BTWCmaaDh/GCfGYBNM6R4JdN7XNng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrpKS71eMcjBfOG9zsiKG/++G/fogWyjda55xTwxHx4=;
 b=DZWdcprxYVG7nCWjFMy8dGr5DeJVG9wcRUOgqqm1RhIMnn3IA12tKshQ83PONZnUCPQkRV52Q97xG1yg5n2fI9zxLT2YgBjBWbt/3ltbt1f0InWzepR7jy2oRDq80PSppeuqKAeSpnqHky2SAxLnDsfvod1DunR+aJTs6a61uDKKbzQkVjTWlBzb9qtRD76Cv9rVDJqj0N1leVT5w7oMQxNDxz0UOoP9otrpV24NjoeKQPgI5sKHtkzln15lf71R9GAzP8SzHgNqZDLgFQaP215pLIUEdPu2wfPw+7WWucJPUg5RDJhJdDaQ1FhHvKqzM4iCVRxT/0nhtfz4lD+qPA==
Received: from CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM (52.145.2.14) by
 CY1P110MB024.NAMP110.PROD.OUTLOOK.COM (23.103.10.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.17; Thu, 17 Sep 2020 15:59:32 +0000
Received: from CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
 ([fe80::75b8:922a:1a45:32c0]) by CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
 ([fe80::75b8:922a:1a45:32c0%10]) with mapi id 15.20.3391.015; Thu, 17 Sep
 2020 15:59:32 +0000
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Dario Faggioli <dfaggioli@suse.com>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: xen-devel <xen-devel@dornerworks.com>, Josh Whitehead
 <Josh.Whitehead@dornerworks.com>, George Dunlap <george.dunlap@citrix.com>
Subject: RE: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
Thread-Topic: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
Thread-Index: AQHWjFXo8LfVF1vuZEGd+q7v79upsqlsik8AgABi9pCAAAYkAIAACwXA
Date: Thu, 17 Sep 2020 15:59:32 +0000
Message-ID: <CY1P110MB0551518BC91E77341A9A37718C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
 <d2973002-86b5-17b7-cbfa-ba235af75ba3@suse.com>
 <CY1P110MB055125447405A5DA2202BF028C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <5b758105ee47638c36ef19eb3804b76ee19020a8.camel@suse.com>
In-Reply-To: <5b758105ee47638c36ef19eb3804b76ee19020a8.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=dornerworks.com;
x-originating-ip: [207.242.234.14]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e49dd24f-8769-48c0-86ea-08d85b22aadc
x-ms-traffictypediagnostic: CY1P110MB024:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1P110MB024BE985CC6853C6DA586048C3E0@CY1P110MB024.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(54906003)(966005)(66574015)(33656002)(66446008)(6506007)(64756008)(53546011)(66556008)(508600001)(83380400001)(26005)(186003)(66946007)(66476007)(8936002)(55016002)(9686003)(52536014)(76116006)(2906002)(7696005)(110136005)(8676002)(5660300002)(86362001)(4326008)(71200400001);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e49dd24f-8769-48c0-86ea-08d85b22aadc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 15:59:32.4390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB024
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1cnNkYXksIFNlcHRlbWJlciAxNywgMjAyMCAxMToyMCBBTSwgRGFyaW8gRmFnZ2lvbGkg
d3JvdGU6DQo+T24gVGh1LCAyMDIwLTA5LTE3IGF0IDE1OjEwICswMDAwLCBTdGV3YXJ0IEhpbGRl
YnJhbmQgd3JvdGU6DQo+PiBPbiBUaHVyc2RheSwgU2VwdGVtYmVyIDE3LCAyMDIwIDU6MDQgQU0s
IErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiA+IE9uIDE2LjA5LjIwIDIwOjE4LCBKZWZmIEt1YmFz
Y2lrIHdyb3RlOg0KPj4gPiA+IFRoaXMgY2hhbmdlIGlzIGFuIG92ZXJoYXVsIG9mIHRoZSBBUklO
QzY1MyBzY2hlZHVsZXIgdG8gZW5hYmxlDQo+PiA+ID4gQ0FTVC0zMkENCj4+ID4gPiBtdWx0aWNv
cmUgc2NoZWR1bGluZy4gQ0FTVC0zMkEgc3BlY2lmaWVzIHRoYXQgb25seSBvbmUgcGFydGl0aW9u
DQo+PiA+ID4gKGRvbWFpbikgY2FuIHJ1biBkdXJpbmcgYSBtaW5vciBmcmFtZSwgYnV0IHRoYXQg
ZG9tYWluIGlzIG5vdw0KPj4gPiA+IGFsbG93ZWQgdG8NCj4+ID4gPiBoYXZlIG1vcmUgdGhhbiBv
bmUgdkNQVS4NCj4+ID4NCj4+ID4gSXQgbWlnaHQgYmUgd29ydGggdG8gY29uc2lkZXIgdXNpbmcg
anVzdCB0aGUgY29yZSBzY2hlZHVsaW5nDQo+PiA+IGZyYW1ld29yaw0KPj4gPiBpbiBvcmRlciB0
byBhY2hpdmUgdGhpcy4gVXNpbmcgYSBzY2hlZF9ncmFudWxhcml0eSB3aXRoIHRoZSBudW1iZXIN
Cj4+ID4gb2YNCj4+ID4gY3B1cyBpbiB0aGUgY3B1cG9vbCBydW5uaW5nIEFSSU5DNjUzIHNjaGVk
dWxlciBzaG91bGQgYWxyZWFkeSBkbw0KPj4gPiB0aGUNCj4+ID4gdHJpY2suIFRoZXJlIHNob3Vs
ZCBiZSBubyBmdXJ0aGVyIG1pZGlmaWNhdGlvbiBvZiBBUklOQzY1Mw0KPj4gPiBzY2hlZHVsZXIN
Cj4+ID4gcmVxdWlyZWQuDQo+PiA+DQo+Pg0KPj4gVGhpcyBDQVNULTMyQSBtdWx0aWNvcmUgcGF0
Y2ggc2VyaWVzIGFsbG93cyB5b3UgdG8gaGF2ZSBhIGRpZmZlcmVudA0KPj4gbnVtYmVyIG9mIHZD
UFVzIChVTklUcywgSSBndWVzcykgYXNzaWduZWQgdG8gZG9tVXMuDQo+Pg0KPlllcCwgeW91IGNh
biBoYXZlIGRvbWFpbnMgd2l0aCBkaWZmZXJlbnQgbnVtYmVycyBvZiB2Q1BVcywgd2hlbiB1c2lu
Zw0KPmNvcmUtc2NoZWR1bGluZyAob3Igc29ja2V0LXNjaGVkdWxpbmcsIG9yIC4uLiksIGlmIHRo
aXMgaXMgd2hhdCB5b3UncmUNCj5hc2tpbmcuDQo+DQo+PiBGb3IgZXhhbXBsZSwgZG9tMSBoYXMg
YSBzaW5nbGUgdkNQVSwgYW5kIGRvbTIgaGFzIDQgdkNQVXMuIEkgZGlkbid0DQo+PiB0aGluayB0
aGUgY29yZSBzY2hlZHVsaW5nIGZyYW1ld29yayBoYWQgdGhpcyBmbGV4aWJpbGl0eT8NCj4+DQo+
SXQgZG9lcy4NCj4NCj5BbmQgaWYgeW91IGhhdmUgZG9tYWluIEEgd2l0aCAxIHZDUFUgYW5kIGRv
bWFpbiBCIHdpdGggMiB2Q1BVcywgd2l0aA0KPnNjaGVkLWdyYW49Y29yZToNCj4tIHdoZW4gdGhl
IHZDUFUgb2YgZG9tYWluIEEgaXMgc2NoZWR1bGVkIG9uIGEgcENQVSBvZiBhIGNvcmUsIG5vIHZD
UFUNCj4gIGZyb20gZG9tYWluIEIgY2FuIGJlIHNjaGVkdWxlZCBvbiB0aGUgc2FtZSBjb3JlOw0K
Pi0gd2hlbiBvbmUgb2YgdGhlIHZDUFVzIG9mIGRvbWFpbiBCIGlzIHNjaGVkdWxlZCBvbiBhIHBD
UFUgb2YgYSBjb3JlLA0KPiAgbm8gb3RoZXIgdkNQVXMsIGV4Y2VwdCB0aGUgb3RoZXIgdkNQVSBv
ZiBkb21haW4gQiBjYW4gcnVuIG9uIHRoZQ0KPiAgc2FtZSBjb3JlLg0KPg0KPldpdGggc2NoZWQt
Z3Jhbj1zb2NrZXQsIHRoZSBzYW1lLCB3aXRoIHMvY29yZS9zb2NrZXQuIDotKQ0KPg0KPlNvIGlu
ZGVlZCBpdCBzZWVtcyB0aGF0IHNjaGVkLWdyYW49TlJfQ1BVUyAoYWN0dWFsbHksIG51bWJlciBv
ZiBDUFVzIGluDQo+dGhlIHBvb2wsIGFzIEp1ZXJnZW4gaXMgc2F5aW5nKSBtYXkgaW5kZWVkIGRv
IHdoYXQgeW91IHdhbnQuDQoNCkZhc2NpbmF0aW5nLiBWZXJ5IGNvb2wsIHRoYW5rcyBmb3IgdGhl
IGluc2lnaHQuIE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBjb3JlIHNjaGVkdWxpbmcgaXMgbm90
IGN1cnJlbnRseSBlbmFibGVkIG9uIGFybS4gVGhpcyBzZXJpZXMgYWxsb3dzIHVzIHRvIGhhdmUg
bXVsdGljb3JlIEFSSU5DIDY1MyBvbiBhcm0gdG9kYXkgd2l0aG91dCBjaGFzaW5nIGRvd24gcG90
ZW50aWFsIGlzc3VlcyB3aXRoIGNvcmUgc2NoZWR1bGluZyBvbiBhcm0uLi4NCg0KU3Rldw0KDQo+
DQo+UmVnYXJkcw0KPi0tDQo+RGFyaW8gRmFnZ2lvbGksIFBoLkQNCj5odHRwOi8vYWJvdXQubWUv
ZGFyaW8uZmFnZ2lvbGkNCj5WaXJ0dWFsaXphdGlvbiBTb2Z0d2FyZSBFbmdpbmVlcg0KPlNVU0Ug
TGFicywgU1VTRSBodHRwczovL3d3dy5zdXNlLmNvbS8NCj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PDxUaGlzIGhh
cHBlbnMgYmVjYXVzZSBfSV8gY2hvb3NlIGl0IHRvIGhhcHBlbiE+PiAoUmFpc3RsaW4gTWFqZXJl
KQ0K

