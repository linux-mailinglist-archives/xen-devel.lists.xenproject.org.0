Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D276E5C8
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 14:36:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoS4K-00050m-Q6; Fri, 19 Jul 2019 12:33:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoS4I-00050h-Pt
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 12:32:58 +0000
X-Inumbo-ID: 4dc696e4-aa21-11e9-ab04-5fbcb0abb550
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4dc696e4-aa21-11e9-ab04-5fbcb0abb550;
 Fri, 19 Jul 2019 12:32:56 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 12:32:46 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 12:32:23 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 12:32:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X88uvKlzhD0nhEO1z5WxQ8OufNSPuXZZGj6FVpIOnxwwd/Ic1RWI7QdmL4l80ceV06lJf9zB7GLBcLSnmoMFY1wKwGP59tK2UD755LCA5O6K0b06zV73W8/x3V8DzxEF5/jjmfyU7io3uA9BQQNv7CBB3FKckvwsNVhQJlCwf8XZtqHj540HsLwnijomwpoyWgV91+CsJ0t2bZyGj6HT4idgwbjWd5nFoDUsL1CbsfHcmd+Nsedq02m1DOIj9wi9wDSC4DtUW7xBkjVDXhKRQ/13PK9BnH5D0wrgG9otqTi7Fat+8kos7BEEmy2vjn/NmJmE6TPoAIjUd3SLQPXfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRFu19EEj4Ou0Ssl6i4L0I1DDu8rROJuhxrheOXBMTk=;
 b=I4Q9ZsMG8avmfMPCFwDaoz46+v+MVDKKqwnsl9LZAGV/wb1jBSE8WMXsGxAT6UvadjVE6DFKEKB+gA/JauS66SW3USAzYkiXBSravvVrx3QgIgKfd3Pdn0pZaSQkxuOF/5p6bFNFZUghc1kqfixTeT6V1oit+IaiAvebmt1E4xeYC/WbEWCr0QtjAMpE0DREI6D1pDPWVjeIGfUxhfBPc0HuRGVOEF7YZ7p4GganR+ep4pcj+jqK3265P5BB/y7CUAdBMyYw31yh6JH+YlEtScuKGkgjsCWZiNZRsbxv7qem3oHEIuGUs8WzTbaMCjM7ssh0AJE8689gV2+Ua3G9XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2937.namprd18.prod.outlook.com (20.179.52.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 12:32:21 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 12:32:20 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ja8zGHp8jkY0SwPhMewFAvpabOwNgAgAAfJACAAWdVAIABTcoA///mggCAACI9gIAAEGyAgAAuTSCAAAd6AA==
Date: Fri, 19 Jul 2019 12:32:20 +0000
Message-ID: <88cd6480-cda4-5e9b-2e9a-aa1e275832cb@suse.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
 <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
 <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
 <d73a2d9ba0b5407390ae9a635314f6d4@AMSPEX02CL03.citrite.net>
 <014491cd-8ee7-26ff-5619-6c5d54c51b3c@suse.com>
 <ebe52ee6d8a9483b87f21d01c5f2c435@AMSPEX02CL03.citrite.net>
 <bf1c57019b77fd6b79f86957477862ae81db5678.camel@bitdefender.com>
 <875eb41c92654f5a85625f0cc08994b5@AMSPEX02CL03.citrite.net>
In-Reply-To: <875eb41c92654f5a85625f0cc08994b5@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR02CA0036.eurprd02.prod.outlook.com
 (2603:10a6:6:15::49) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7c9f704-7b1c-4fea-b491-08d70c4524a8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2937; 
x-ms-traffictypediagnostic: DM6PR18MB2937:
x-microsoft-antispam-prvs: <DM6PR18MB2937C1A942FD549EAA566FB6B3CB0@DM6PR18MB2937.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(189003)(199004)(13464003)(8936002)(81166006)(256004)(81156014)(64756008)(6246003)(66476007)(186003)(66556008)(8676002)(66946007)(316002)(486006)(66446008)(14444005)(5660300002)(6436002)(68736007)(52116002)(3846002)(99286004)(478600001)(76176011)(54906003)(86362001)(80792005)(31696002)(25786009)(2906002)(6486002)(446003)(6506007)(6916009)(386003)(31686004)(66066001)(14454004)(53936002)(305945005)(71190400001)(71200400001)(229853002)(102836004)(53546011)(11346002)(476003)(4326008)(26005)(6512007)(2616005)(6116002)(7736002)(36756003)(7416002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2937;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hu/J336kDcaGv1Wr14GD1MxwW1eEWWANVuH5DlowekDwq/dydMUzx0Ban/jxHgof0ElHjaXAYslE/OPPsM5l17CjYwW3pVnmpc1jvHvdsKRQt9gWJV9+Jc33yM9Nm3sWP23yUcssxZcveaG+dEHH39rd2AjxoXw9phagMVB2CgnfdGNqrUb/uXSIEmKYjoufnXqsaCPFedk1kPUbjDjNG9uM/oODqHse5yLVfC2uF8Nq28Sd3m/+thWN9749anoRQWywR52Z2fTIGRXbnRMQJEXBIlEFFfyAscTFMkIQnjPYWlkYA0YwK83RIAgp0AUZYsoaOx5QLswHuDT5klJmDC3QElOAAYr9rRLC9rNKDQITLV9kCN9dL9n0ud4r1+e5o/tOzeeejWt5HIT8uNOEj5c5LBMNUfk7rXCjGQHJ02A=
Content-ID: <B14B78FC3EF7744D9952C9CC7FD4EF47@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c9f704-7b1c-4fea-b491-08d70c4524a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 12:32:20.6765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2937
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Petre Ovidiu PIRCALABU' <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 JulienGrall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Roger PauMonne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxNDoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IFBldHJlIE92aWRpdSBQSVJDQUxBQlUgPHBwaXJjYWxh
YnVAYml0ZGVmZW5kZXIuY29tPg0KPj4gU2VudDogMTkgSnVseSAyMDE5IDEyOjI0DQo+Pg0KPj4g
T24gRnJpLCAyMDE5LTA3LTE5IGF0IDA4OjI2ICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
Pj4+IEZyb206IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4NCj4+Pj4gU2VudDogMTkg
SnVseSAyMDE5IDA5OjIyDQo+Pj4+DQo+Pj4+IE9uIDE5LjA3LjIwMTkgMDk6NTYsIFBhdWwgRHVy
cmFudCB3cm90ZToNCj4+Pj4+IElmIHRoYXQgcGFnZSBpcyBzaGFyZWQgd2l0aCB0aGUgSUQgdGhl
bg0KPj4+Pj4gWEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25lZA0KPj4+Pj4gc2hvdWxkICpub3Qq
IGJlIHNldC4gQWxzbywgdGhhdCBmbGFnIGlzIGFuICdvdXQnIGZsYWcuLi4gdGhlDQo+Pj4+PiBj
YWxsZXINCj4+Pj4+IGRvZXNuJ3QgZGVjaWRlIHdobyBvd25zIHRoZSByZXNvdXJjZS4NCj4+Pj4N
Cj4+Pj4gSSBoYWQgaW1wbGllZCB0aGF0IGl0J3MgcmVhbGx5IE1EIHRoYXQncyBtZWFudCBoZXJl
LCBidXQgbWF5YmUgSQ0KPj4+PiB3YXMNCj4+Pj4gd3JvbmcgZG9pbmcgc28uDQo+Pj4+DQo+Pj4+
PiBUQkggSSByZWdyZXQgZXZlciBpbnRyb2R1Y2luZyB0aGUgZmxhZzsgaXQgY2F1c2VkIGEgbG90
IG9mDQo+Pj4+PiBwcm9ibGVtcywNCj4+Pj4gd2hpY2ggaXMgd2h5IGl0IGlzIG5vIGxvbmdlciB1
c2VkLg0KPj4+Pg0KPj4+PiBJdCdzIGEgdG9vbHMgb25seSBpbnRlcmZhY2UgLSB3aHkgZG9uJ3Qg
d2UgZHJvcCB0aGUgZmxhZyBpZiB5b3Ugbm93DQo+Pj4+IHRoaW5rIGl0IHdhcyBhIGJhZCBpZGVh
IHRvIGludHJvZHVjZSBpdD8NCj4+Pg0KPj4+IEkgd2FzIGluZGVlZCB0aGlua2luZyBJIHNob3Vs
ZCBmaW5kIGVub3VnaCB0dWl0cyB0byBkbyB0aGF0IGluIHRoZQ0KPj4+IG5lYXIgZnV0dXJlLg0K
Pj4+DQo+PiBTb3JyeSwgbXkgbWlzdGFrZS4gSSBtZWFudCB0byBzYXkgaXQncyBzaGFyZWQgd2l0
aCBNRC4NCj4+DQo+PiBNYW55IHRoYW5rcyBmb3IgeW91ciBzdXBwb3J0LA0KPiANCj4gT2ssIGlu
IHRoYXQgY2FzZSBwbGVhc2Ugc2hhcmUgd2l0aCB0aGUgSUQgaW5zdGVhZC4NCg0KQnV0IHRoYXQn
cyBleGFjdGx5IHdoYXQgd2Ugd2FudCB0byBhdm9pZDogSWYgc2hhcmluZyBhdCBhbGwsIHRoZW4N
CnBsZWFzZSB3aXRoIHRoZSBtb3JlIHByaXZpbGVnZWQgZW50aXR5LiBIb3cgd291bGQgTUQgYWNj
ZXNzIHRoZSBwYWdlDQppZiBpdCdzIHNoYXJlZCB3aXRoIElEICh3aGljaCwgYWl1aSwgaGFzIG5v
IGJ1c2luZXNzIGFjY2Vzc2luZyB0aGUNCnBhZ2UgYXQgYWxsKT8NCg0KSmFuDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
