Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991E31F8C2F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 04:00:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkeOZ-0002xJ-Pd; Mon, 15 Jun 2020 01:58:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uIX7=74=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1jkeOY-0002xE-B4
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 01:58:42 +0000
X-Inumbo-ID: bc16e4b6-aeab-11ea-bca7-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.69]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc16e4b6-aeab-11ea-bca7-bc764e2007e4;
 Mon, 15 Jun 2020 01:58:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpgXFeHP0KrCb092cOdVRGrUZ/oHYVbdkIECXQx1vRKZ92djEOaPall2KDf0+2csfXCqKeM6XCQVIapqRJKE2tAsMtiA33rPQy/JE9t9XT6j50vwEz/xSdkOh5zX7UbaPhei0m+Pn2bLL/vgb19BOOWQEpz1fO8NjyToge7HA8iWVg8HXgDJlLezCeC1/d6mJHI2Hs6pjsMqGiU0cz9PFo63M2xAm7M2vL2Uf5H1yZ1zL43fjqaGvGC3WgF1Zp/IW4Ge4K8T+bTdp9EY74QgzMuzZBcRqncetFy+o7sJyeB+qsZ9hYiGR74mVwcC2CWNq0pVVSMeThx8Jh+1sRk1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdAKC1uxTVfiefCGuDrSLGAVY237PwO2jpTLEcKuQmc=;
 b=FQTm3ciXiT0jirzHgKesRGqIpyZGNSx6s1a32v4Al7MUm0y0LvoTL+HVNvKKOLoTqfE9YI7s5py7kqjfpKJ3o0tdwVnc0CVNA6kfHLQnceEB3M4Q8uRnX8HVn2HkVDnvBJ2/RBBWLrhH0qkeX2HXTerzHAgf2Mvr9dMmOSoWR/32MNAyxQ/dKr5EVaSQ9LqumPCwkeK6G+80WAAQ2cZKA37BCFrgAlXL7MCc9YVs7yjW3Cp/UtCTQn3kk26yoGKFdJrDpxHmnQligEzWMdn3uRl3AmRlAGX3v2tponsKmPXhAjH/5b54/DDYGEbH83BuStkLIBveYvpZRPYcUI5OWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdAKC1uxTVfiefCGuDrSLGAVY237PwO2jpTLEcKuQmc=;
 b=bB/+cwy3jdF7UCXFS079BjqntOv0Pjfr0hQBoSxMoni85yNfQ1CzN39XIvnh9Qm3sPHAOTbjIdaVh7C7Tj0kcIMurmcQGDsfQvPHhFRBoq32om2bTNiNvcbCEtie0k4rgLWPP5rNsFyCbFXws4fb+fJBZ6mhUGCwkU1RZ29Yh/Q=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2696.eurprd04.prod.outlook.com (2603:10a6:4:a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Mon, 15 Jun
 2020 01:58:38 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3088.028; Mon, 15 Jun 2020
 01:58:38 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Andrushchenko
 <Oleksandr_Andrushchenko@epam.com>
Subject: RE: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWN5exllox/cqJUUS0HFcLChNz8ajHt2rggADieACAAAFjAIAQZaQA
Date: Mon, 15 Jun 2020 01:58:38 +0000
Message-ID: <DB6PR0402MB27609D12F3949F929A43742A889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1bc5a175-3192-4232-bb99-08d810cf9f19
x-ms-traffictypediagnostic: DB6PR0402MB2696:
x-microsoft-antispam-prvs: <DB6PR0402MB2696C021CBF73302978C9676889C0@DB6PR0402MB2696.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YQnBaNeW537xlZNI7iokLI+hbKVInSTpSCBIIal8CJfCMQpQp1y3BfzxepChVr7KWcmlSLedt+ik9ctTUBZkYLAXB3oA7XuqfNM2FRkGtUK5rdIiwFTljk2ieaa4+EXEt2S9cxP9IXz0HPodftkQLX02/kR9hy/c2AUZrXAxh+x26qmHGZiwMMFTPtKRhg81dXVtcQWB094Fczxl7fDWRPMzhV9c6G0fL+4q8Y0fiR6XgaAJ2FUeSXLjBV0DuUHwgmTYMFY4gpDipghz27EhTHlAxoEiEuPN9FeOl9bTq+WPxV6HszeKkGf0XKlajScsBpARWoeTqtAqYUUWzhRGF3Bv8is1lzbbrqlXkgMiqKdTmYwU6HqT/AS9shNZ4IKtXOh71aJQlL927mOzygtuKQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(66446008)(76116006)(66476007)(66556008)(64756008)(66946007)(86362001)(44832011)(54906003)(5660300002)(2906002)(6506007)(7696005)(186003)(52536014)(53546011)(26005)(55016002)(33656002)(478600001)(9686003)(71200400001)(8936002)(316002)(110136005)(966005)(8676002)(83380400001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Aw9YAc3o6rcMZu6Z0vuYIxi8Y9c+FrtHOS92o4NR3nJ9jjecDjHzMmkO3IpcIhRTaXOEjy0m9xoxRssJQmJUoLkTdukrZk5qRqSUPAW+HzjFVSh49PJWPxcegcf3KOGFaaicXlS+xU0WFTNi+xIMGs/ClxXv5/kzhf3/bAlefTI0DYXngCuf8r4djRYdWaHX1TMWnrB1mlFZUCiS7mOqkxBNO3lWTjnnoDsYFaULbCWEpfWrXruf3dcmHXYlhhMWl9C5Q8ceo2Wtrd1sVWl8hOQZz5fQEydS9AVqf4Do1RnBSES8AwEPLICBBR6HezNFdFgZRjWTHpHFLErRKFs+os0tsvpfJTjeuz9AFxF3QzEZQ+NsZRVrZae8sno+OGiu/Zzpxb9enFuvV1/Df9wcVyHhXNEfEe7GT0ztDRmWkakNgfswFUPiHVhhVMcKgFQ2Vwb/YFBrOaBZebgBNiBW7rNuF7cw7VwU96l4Rp5v3Ss=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc5a175-3192-4232-bb99-08d810cf9f19
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 01:58:38.5504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mDJrh54OH9sjGjXbU8KXdzQyKP59OMAusqmw/wTmmYPukJPzV1iVwt5O1KY8ab/zaa7Z39J7ZgUMrv4TYZCxuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2696
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Roman Shaposhnik <roman@zededa.com>, Julien Grall <julien@xen.org>,
 Nataliya Korovkina <malus.brandywine@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgW21haWx0bzpzc3RhYmVsbGluaUBrZXJuZWwub3JnXQ0KPiBTZW50OiAy
MDIwxOo21MI0yNUgMjM6MzINCj4gVG86IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxPbGVrc2Fu
ZHJfQW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4gQ2M6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAu
Y29tPjsgUm9tYW4gU2hhcG9zaG5paw0KPiA8cm9tYW5AemVkZWRhLmNvbT47IFhlbi1kZXZlbCA8
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IE5h
dGFsaXlhDQo+IEtvcm92a2luYSA8bWFsdXMuYnJhbmR5d2luZUBnbWFpbC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBVRUZJIHN1cHBvcnQgaW4gQVJNIERvbVVzDQo+IA0KPiBPbiBUaHUsIDQgSnVuIDIw
MjAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPiA+IE9uIDYvNC8yMCA0OjU3IEFN
LCBQZW5nIEZhbiB3cm90ZToNCj4gPiA+IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47DQo+ID4gPj4g
TmF0YWxpeWEgS29yb3ZraW5hIDxtYWx1cy5icmFuZHl3aW5lQGdtYWlsLmNvbT4NCj4gPiA+PiBT
dWJqZWN0OiBVRUZJIHN1cHBvcnQgaW4gQVJNIERvbVVzDQo+ID4gPiBXZSBoYXZlIG1hZGUgVS1C
b290IHJ1biBpbnNpZGUgWEVOIERvbVUsIGJ1dCBqdXN0IG9ubHkgUFYgY29uc29sZQ0KPiA+ID4g
cGFydCwgbm90IGltcGxlbWVudCBvdGhlciBmcm9udGVuZCBkcml2ZXJzIGN1cnJlbnRseS4gV291
bGQgdGhpcw0KPiA+ID4gaGVscCBmb3IgeW91ciBjYXNlIGlmIGVuYWJsZSBFRkkgaW4gVS1Cb290
Pw0KPiA+DQo+ID4gV2VsbCwgd2UgaGF2ZSBhIHdvcmtpbmcgUFYgYmxvY2sgaW1wbGVtZW50YXRp
b24gb24gdG9wIG9mIHRoYXQgb24gaU1YOA0KPiA+DQo+ID4gcGxhdGZvcm0sIG1vc3RseSBwb3J0
ZWQgZnJvbSBtaW5pLW9zLiBDdXJyZW50bHkgd2UgYXJlIGZpbmFsaXppbmcgdGhlDQo+ID4gd29y
aw0KPiA+DQo+ID4gYW5kIGNsZWFuaW5nIHVwIChpdCdzIGdvaW5nIHRvIHRha2UgYSB3ZWVrIG9y
IHNvIGhvcGVmdWxseSkuIFRoZW4sIHdlDQo+ID4gd2UnbGwgcG9zdA0KPiA+DQo+ID4gaXQgb24g
b3VyIHB1YmxpYyBnaXRodWIuIFdlIGFyZSBhbHNvIHRoaW5raW5nIGFib3V0IHVwc3RyZWFtaW5n
IHRoZQ0KPiA+IHdvcmssIGJ1dCBpdCBtYXkNCj4gPg0KPiA+IHRha2UgcXVpdGUgc29tZSB0aW1l
IGlmIHRoZSB3aG9sZSBpZGVhIGZpdHMgdS1ib290J3MgdmlldyBvbiBzdWNoIGFuDQo+IGV4dGVu
c2lvbiBhdCBhbGwuDQo+IA0KPiBZZXMgcGxlYXNlIHRvIGJvdGggb2YgeW91ISA6LSkNCg0KVGhl
IHNpbXBsZSBjb25zb2xlIHBhcnQNCg0KaHR0cHM6Ly9zb3VyY2UuY29kZWF1cm9yYS5vcmcvZXh0
ZXJuYWwvaW14L3Vib290LWlteC90cmVlL2RyaXZlcnMvc2VyaWFsL3NlcmlhbF94ZW4uYz9oPWlt
eF92MjAyMC4wNF81LjQuMjRfMi4xLjANCg0KV2UgZW5hYmxlIFUtQm9vdCBpbiBEb21VIGlzIG1v
c3RseSBmb3IgYW5kcm9pZCBhdXRvIGR1YWwgYm9vdGxvYWRlciBjYXNlLg0KDQpJdCBoYXMgdGhl
IGlzc3VlIHRoYXQgb25seSBoYXZlIGNvbnNvbGUgb3V0cHV0IGFmdGVyIG1tdSBlbmFibGVkIGlu
IFUtQm9vdCBzdGFnZS4NCg0KUmVnYXJkcywNClBlbmcuDQoNCj4gDQo+IEluIHRoZSBtZWFudGlt
ZSwgd2hpbGUgd2Ugd2FpdCBmb3IgdGhvc2UgY2hhbmdlcyB0byBnbyB1cHN0cmVhbSBpbiB1Ym9v
dCwNCj4gY291bGQgeW91IHBsZWFzZSBwb3N0IGEgYnJhbmNoIG9uIGdpdGh1YiBhbmQgYSBsaW5r
IG9uIHRoaXMgZW1haWwgdGhyZWFkPw0KPiANCj4gTWF5YmUgd2Ugc2hvdWxkIGhhdmUgYSB3aWtp
cGFnZSBvbiB3aWtpLnhlbnByb2plY3Qub3JnIGFib3V0DQo+IHdvcmstaW4tcHJvZ3Jlc3MgdWJv
b3QgaXRlbXMuDQo+IA0KPiANCj4gDQo+IA0KPiA+ID4gUmVnYXJkcywNCj4gPiA+IFBlbmcuDQo+
ID4gPg0KPiA+ID4+IEhpIQ0KPiA+ID4+DQo+ID4gPj4gd2l0aCBhIGxvdCBvZiBoZWxwIGZyb20g
U3RlZmFubywgd2UncmUgZ2V0dGluZyBSUGk0IHN1cHBvcnQgaW4NCj4gPiA+PiBQcm9qZWN0IEVW
RSBwcmV0dHkgbXVjaCBvbiBwYXIgYmV0d2VlbiBLVk0gYW5kIFhlbi4NCj4gPiA+Pg0KPiA+ID4+
IE9uZSBiaWcgYXJlYSB0aGF0IHN0aWxsIHJlbWFpbnMgaXMgc3VwcG9ydGluZyBVRUZJIGJvb3Qg
c2VxdWVuY2UgZm9yDQo+IERvbVVzLg0KPiA+ID4+IFdpdGggS1ZNLCBnaXZlbiB0aGUgcWVtdSB2
aXJ0IGRldmljZSBtb2RlbCB0aGlzIGlzIGFzIHNpbXBsZSBhcw0KPiA+ID4+IHVzaW5nIGVpdGhl
ciBzdG9jayBVRUZJIGJ1aWxkIGZvciBhcm0gb3IgZXZlbiBVLUJvb3QgRUZJIGVtdWxhdGlvbg0K
PiA+ID4+IGVudmlyb25tZW50IGFuZCBwYXNzaW5nIGl0IHZpYSAtYmlvcyBvcHRpb24uDQo+ID4g
Pj4NCj4gPiA+PiBPYnZpb3VzbHkgd2l0aCBYZW4gb24gQVJNIHdlIGRvbid0IGhhdmUgdGhlIGRl
dmljZSBtb2RlbCBzbyBteQ0KPiA+ID4+IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgZWFzaWVz
dCB3YXkgd2UgY2FuIHN1cHBvcnQgaXQgd291bGQgYmUgdG8NCj4gPiA+PiBwb3J0IFVFRkkncyBP
dm1mUGtnL092bWZYZW4gdGFyZ2V0IHRvIEFSTSAoaXQgc2VlbXMgdG8gYmUgY3VycmVudGx5DQo+
ID4gPj4gZXhjbHVzaXZlbHkgWDY0KS4NCj4gPiA+Pg0KPiA+ID4+IFNvIGhlcmUncyBteSBmaXJz
dCBxdWVzdGlvbjogaWYgdGhlcmUncyBhbnlib2R5IG9uIHRoaXMgbGlzdCB3aG8NCj4gPiA+PiBo
YWQgYSBoYW5kIGluIGltcGxlbWVudGluZyBPdm1mUGtnL092bWZYZW4gY2FuIHlvdSBwbGVhc2Ug
c2hhcmUNCj4gPiA+PiB5b3VyIHRob3VnaHRzIG9uIGhvdyBtdWNoIHdvcmsgdGhhdCBwb3J0IG1h
eSBiZSAob3Igd2hldGhlciBpdCBpcw0KPiA+ID4+IGV2ZW4gZmVhc2libGUgLS0gSSBtYXkgdG90
YWxseSBiZSBtaXNzaW5nIHNvbWV0aGluZyByZWFsbHkgb2J2aW91cyBoZXJlKS4NCj4gPiA+Pg0K
PiA+ID4+IEFuZCBhcyBsb25nIGFzIEkndmUgZ290IHlvdXIgYXR0ZW50aW9uOiB0d28gbW9yZSBx
dWVzdGlvbnM6DQo+ID4gPj4gICAgIDEuLiBjb21wYXJlZCB0byB0aGUgYWJvdmUsIHdvdWxkIHBv
cnRpbmcgcHZncnViIHRvIEFSTSBiZSBhbnkNCj4gPiA+PiAgICAgZWFzaWVyIG9yIG1vcmUgZGlm
ZmljdWx0Pw0KPiA+ID4+DQo+ID4gPj4gICAgIDIuIHNhbWUgcXVlc3Rpb24gZm9yIHRlYWNoaW5n
IHUtYm9vdCBhYm91dCBQViBjYWxscy4NCj4gPiA+Pg0KPiA+ID4+IFRoYW5rcywNCj4gPiA+PiBS
b21hbi4NCj4gPiA+Pg0KPiA+ID4+IFAuUy4gT2ggYW5kIEkgZ3Vlc3MgYmV0d2VlbjoNCj4gPiA+
PiAgICAgMC4gT3ZtZlBrZy9Pdm1mWGVuIG9uIEFSTTY0DQo+ID4gPj4gICAgIDEuIHB2Z3J1YiBv
biBBUk02NA0KPiA+ID4+ICAgICAyLiB1LWJvb3QvRUZJIGVtdWxhdGlvbiB3aXRoIFBWIGNhbGxz
IGJhY2tlbmQgSSBkaWRuJ3QgbWlzcyBhbnkNCj4gPiA+PiBvdGhlciBvYnZpb3VzIHdheSBvZiBt
YWtpbmcgVUVGSS1hd2FyZSBWTSBpbWFnZXMgdG8gYm9vdCBvbiBYZW4NCj4gPiA+PiBBUk02NCBE
b21VLCByaWdodD8NCg==

