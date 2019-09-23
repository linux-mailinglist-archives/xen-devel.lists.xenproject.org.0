Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EACBBB7FC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 17:33:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCQID-0004lh-N5; Mon, 23 Sep 2019 15:30:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o459=XS=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1iCQIC-0004lc-9Q
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 15:30:24 +0000
X-Inumbo-ID: 0ebe0c78-de17-11e9-9600-12813bfff9fa
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.126]) by localhost (Halon) with ESMTPS
 id 0ebe0c78-de17-11e9-9600-12813bfff9fa;
 Mon, 23 Sep 2019 15:30:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfgav1M0XYT3Qd+TRi46fbjQ2W2xMqBCY+UyQf40vEzhk3UDXTArvtk2+MgBqfj77E00+pu/+czdERw3CechKi0ts1WH6rxGacSQ6Bn14YV+Bm34BxyVodfobeVy9u13orGrCtmRm9AYHwiY0wow/Pxfe0NtJmxieAmWe85RixRHzUiQ5dPoAUE7ts7sEu3qWfXqaH9kfFypuFAtAZMS7pd98RRo5UY9ktTpXhc9WZa+wn+Zyj2NK6nNI/DTUyrGuD/B+50lcU8+VNdeE9E7bLDsF7FTC/2PVlIgyvZ/tsgxN9FKabcq2VIDnlR+ZgedTIGjdm1nOg1kFVNfKGt8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGi8HE1llaQw7JgghiPzaUjJQpUhmqutn+jRD8zNPWA=;
 b=X1PIYIaA/aX9buvv8Un8dr9dgCsLEqahzehPTFcp+rjBq52Z5YOch+FctarTRBQjsNe/XccZUF/Nis/4+ykdAzxfmX+quJCm8Zm7F+1EzPgLo7kdtEirgVZ2c8GB+b1sowCdYTZKx0nYPuDMRJomAhv1SHd+cdTt/qfZZ6e7g3OXrNGafdm8aVGAQGOn2S4sbMBvsE2SN9wGX/wInwOwYcQlQ86uCEbeCItUd8Hb1yzb8MwOauqDamQWxwwEOmVohr178f5tGfxvr7iTlAru5ERXcxiIeoFHolhrKV2oHZQ1EE96BAVaQLhcCToqXusgMW7h4FV6p8Wo3elld5/Cog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGi8HE1llaQw7JgghiPzaUjJQpUhmqutn+jRD8zNPWA=;
 b=U7IkdWUzP3BD6XO5HHUMAJYIrWqQ7XxGyuDNfhBpCulNW9Jd3aeKCHlXvjuyE+ivUeSHGZvJemUi5A9srE0liJPaSejoOzShaoNvLUQQ26owbf2HyJa4Wh6FWoBvQRaxwSyysDOjWaJzFsgZ3ycuzWiEuTDICKN0MMDc7Zj148E=
Received: from AM0PR02MB5779.eurprd02.prod.outlook.com (52.132.215.21) by
 AM0PR02MB5105.eurprd02.prod.outlook.com (20.178.22.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Mon, 23 Sep 2019 15:30:21 +0000
Received: from AM0PR02MB5779.eurprd02.prod.outlook.com
 ([fe80::f098:acf1:9011:c816]) by AM0PR02MB5779.eurprd02.prod.outlook.com
 ([fe80::f098:acf1:9011:c816%3]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 15:30:21 +0000
From: Razvan COJOCARU <rcojocaru@bitdefender.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v13] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVcgc/RjZRGBRqJUWCjIFeFraK9Kc5Y4oA
Date: Mon, 23 Sep 2019 15:30:21 +0000
Message-ID: <2e5322e2-2643-e43a-fd5f-d0b2b18c7599@bitdefender.com>
References: <20190923120539.25242-1-aisaila@bitdefender.com>
In-Reply-To: <20190923120539.25242-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0067.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::31) To AM0PR02MB5779.eurprd02.prod.outlook.com
 (2603:10a6:208:189::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=rcojocaru@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c707c98c-d17b-4659-2bac-08d7403af207
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR02MB5105; 
x-ms-traffictypediagnostic: AM0PR02MB5105:|AM0PR02MB5105:|AM0PR02MB5105:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB5105B5701DAA7E5AEE8C8FC4AB850@AM0PR02MB5105.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(346002)(39860400002)(376002)(366004)(189003)(199004)(2616005)(6246003)(66066001)(86362001)(64756008)(476003)(478600001)(8936002)(54906003)(66446008)(66476007)(4326008)(6436002)(6512007)(81156014)(81166006)(53546011)(5660300002)(52116002)(7736002)(110136005)(186003)(102836004)(229853002)(2906002)(26005)(2501003)(305945005)(3846002)(6116002)(66946007)(446003)(486006)(31686004)(71190400001)(71200400001)(31696002)(66556008)(14454004)(316002)(99286004)(6486002)(6506007)(386003)(25786009)(14444005)(256004)(11346002)(8676002)(36756003)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5105;
 H:AM0PR02MB5779.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qp1+KUujwUpW/9P/YOKkmymg2IiShESKnuSyqbksq+ufr7rMWB5NsGicUZnK8ZQgC9L/2dDeTMm55qpBLquYfxkaU9D1y4SN7rphrUMc+sFx0FgRpDlIrNg6QWerFpj4uC3gJPVof4K97lgHIIA6TP315YtvxHcmsvEJbRGRH7f8hz/fv8+5Ql/C8yp6g2QmmILXOjy6smwf46b3DU2qsPT2SqXxDXuP8SA+OQQeU92TFA8Awbemk6lKnWP18VPmbae+jeUYuYAXXFdcBzd4LFR7nFsQr6h/nvoL720V5mYARXQlF41RgmDI6wqsql3Q1eZ3vTlkvX6hPnZGcD42ClwHHXm7BpD4XWC4NvQElWaM6d3Zr+vneHMztVWtnzmaUUkb1qn9saH1bmquigRSD1CApMsC5sd8CJ1RxZRexEM=
Content-ID: <2BD4967EEB70EF438E06CC7717410259@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c707c98c-d17b-4659-2bac-08d7403af207
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 15:30:21.0882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMHKBwJHo1kWeWUBMFbdG2soUOQNwI3Wgat6JW3yJ/3m6AaN/Dpu+6v3uIORiYjNKX26jjbToRyEq5Krf3Km5sqq0t2mDWhiKccnnYIBy+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5105
Subject: Re: [Xen-devel] [PATCH v13] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yMy8xOSAzOjA1IFBNLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4gQS9E
IGJpdCB3cml0ZXMgKG9uIHBhZ2Ugd2Fsa3MpIGNhbiBiZSBjb25zaWRlcmVkIGJlbmlnbiBieSBh
biBpbnRyb3NwZWN0aW9uDQo+IGFnZW50LCBzbyByZWNlaXZpbmcgdm1fZXZlbnRzIGZvciB0aGVt
IGlzIGEgcGVzc2ltaXphdGlvbi4gV2UgdHJ5IGhlcmUgdG8NCj4gb3B0aW1pemUgYnkgZmlsdGVy
aW5nIHRoZXNlIGV2ZW50cyBvdXQuDQo+IEN1cnJlbnRseSwgd2UgYXJlIGZ1bGx5IGVtdWxhdGlu
ZyB0aGUgaW5zdHJ1Y3Rpb24gYXQgUklQIHdoZW4gdGhlIGhhcmR3YXJlIHNlZXMNCj4gYW4gRVBU
IGZhdWx0IHdpdGggbnBmZWMua2luZCAhPSBucGZlY19raW5kX3dpdGhfZ2xhLiBUaGlzIGlzLCBo
b3dldmVyLA0KPiBpbmNvcnJlY3QsIGJlY2F1c2UgdGhlIGluc3RydWN0aW9uIGF0IFJJUCBtaWdo
dCBsZWdpdGltYXRlbHkgY2F1c2UgYW4NCj4gRVBUIGZhdWx0IG9mIGl0cyBvd24gd2hpbGUgYWNj
ZXNzaW5nIGFfZGlmZmVyZW50XyAgcGFnZSBmcm9tIHRoZSBvcmlnaW5hbCBvbmUsDQo+IHdoZXJl
IEEvRCB3ZXJlIHNldC4NCj4gVGhlIHNvbHV0aW9uIGlzIHRvIHBlcmZvcm0gdGhlIHdob2xlIGVt
dWxhdGlvbiwgd2hpbGUgaWdub3JpbmcgRVBUIHJlc3RyaWN0aW9ucw0KPiBmb3IgdGhlIHdhbGsg
cGFydCwgYW5kIHRha2luZyB0aGVtIGludG8gYWNjb3VudCBmb3IgdGhlICJhY3R1YWwiIGVtdWxh
dGluZyBvZg0KPiB0aGUgaW5zdHJ1Y3Rpb24gYXQgUklQLiBXaGVuIHdlIHNlbmQgb3V0IGEgdm1f
ZXZlbnQsIHdlIGRvbid0IHdhbnQgdGhlIGVtdWxhdGlvbg0KPiB0byBjb21wbGV0ZSwgc2luY2Ug
aW4gdGhhdCBjYXNlIHdlIHdvbid0IGJlIGFibGUgdG8gdmV0byB3aGF0ZXZlciBpdCBpcyBkb2lu
Zy4NCj4gVGhhdCB3b3VsZCBtZWFuIHRoYXQgd2UgY2FuJ3QgYWN0dWFsbHkgcHJldmVudCBhbnkg
bWFsaWNpb3VzIGFjdGl2aXR5LCBpbnN0ZWFkDQo+IHdlJ2Qgb25seSBiZSBhYmxlIHRvIHJlcG9y
dCBvbiBpdC4NCj4gV2hlbiB3ZSBzZWUgYSAic2VuZC12bV9ldmVudCIgY2FzZSB3aGlsZSBlbXVs
YXRpbmcsIHdlIG5lZWQgdG8gZmlyc3Qgc2VuZCB0aGUNCj4gZXZlbnQgb3V0IGFuZCB0aGVuIHN1
c3BlbmQgdGhlIGVtdWxhdGlvbiAocmV0dXJuIFg4NkVNVUxfUkVUUlkpLg0KPiBBZnRlciB0aGUg
ZW11bGF0aW9uIHN0b3BzIHdlJ2xsIGNhbGwgaHZtX3ZtX2V2ZW50X2RvX3Jlc3VtZSgpIGFnYWlu
IGFmdGVyIHRoZQ0KPiBpbnRyb3NwZWN0aW9uIGFnZW50IHRyZWF0cyB0aGUgZXZlbnQgYW5kIHJl
c3VtZXMgdGhlIGd1ZXN0LiBUaGVyZSwgdGhlDQo+IGluc3RydWN0aW9uIGF0IFJJUCB3aWxsIGJl
IGZ1bGx5IGVtdWxhdGVkICh3aXRoIHRoZSBFUFQgaWdub3JlZCkgaWYgdGhlDQo+IGludHJvc3Bl
Y3Rpb24gYXBwbGljYXRpb24gYWxsb3dzIGl0LCBhbmQgdGhlIGd1ZXN0IHdpbGwgY29udGludWUg
dG8gcnVuIHBhc3QNCj4gdGhlIGluc3RydWN0aW9uLg0KPiANCj4gQSBjb21tb24gZXhhbXBsZSBp
cyBpZiB0aGUgaGFyZHdhcmUgZXhpdHMgYmVjYXVzZSBvZiBhbiBFUFQgZmF1bHQgY2F1c2VkIGJ5
IGENCj4gcGFnZSB3YWxrLCBwMm1fbWVtX2FjY2Vzc19jaGVjaygpIGRlY2lkZXMgaWYgaXQgaXMg
Z29pbmcgdG8gc2VuZCBhIHZtX2V2ZW50Lg0KPiBJZiB0aGUgdm1fZXZlbnQgd2FzIHNlbnQgYW5k
IGl0IHdvdWxkIGJlIHRyZWF0ZWQgc28gaXQgcnVucyB0aGUgaW5zdHJ1Y3Rpb24NCj4gYXQgUklQ
LCB0aGF0IGluc3RydWN0aW9uIG1pZ2h0IGFsc28gaGl0IGEgcHJvdGVjdGVkIHBhZ2UgYW5kIHBy
b3Zva2UgYSB2bV9ldmVudC4NCj4gDQo+IE5vdyBpZiBucGZlYy5raW5kID09IG5wZmVjX2tpbmRf
aW5fZ3B0IGFuZCBkLT5hcmNoLm1vbml0b3IuaW5ndWVzdF9wYWdlZmF1bHRfZGlzYWJsZWQNCj4g
aXMgdHJ1ZSB0aGVuIHdlIGFyZSBpbiB0aGUgcGFnZSB3YWxrIGNhc2UgYW5kIHdlIGNhbiBkbyB0
aGlzIGVtdWxhdGlvbiBvcHRpbWl6YXRpb24NCj4gYW5kIGVtdWxhdGUgdGhlIHBhZ2Ugd2FsayB3
aGlsZSBpZ25vcmluZyB0aGUgRVBULCBidXQgZG9uJ3QgaWdub3JlIHRoZSBFUFQgZm9yIHRoZQ0K
PiBlbXVsYXRpb24gb2YgdGhlIGFjdHVhbCBpbnN0cnVjdGlvbi4NCj4gDQo+IEluIHRoZSBmaXJz
dCBjYXNlIHdlIHdvdWxkIGhhdmUgMiBFUFQgZXZlbnRzLCBpbiB0aGUgc2Vjb25kIGNhc2Ugd2Ug
d291bGQgaGF2ZQ0KPiAxIEVQVCBldmVudCBpZiB0aGUgaW5zdHJ1Y3Rpb24gYXQgdGhlIFJJUCB0
cmlnZ2VycyBhbiBFUFQgZXZlbnQuDQo+IA0KPiBXZSB1c2UgaHZtZW11bF9tYXBfbGluZWFyX2Fk
ZHIoKSB0byBpbnRlcmNlcHQgd3JpdGUgYWNjZXNzIGFuZA0KPiBfX2h2bV9jb3B5KCkgdG8gaW50
ZXJjZXB0IGV4ZWMsIHJlYWQgYW5kIHdyaXRlIGFjY2Vzcy4NCj4gDQo+IEEgbmV3IHJldHVybiB0
eXBlIHdhcyBhZGRlZCwgSFZNVFJBTlNfbmVlZF9yZXRyeSwgaW4gb3JkZXIgdG8gaGF2ZSBhbGwN
Cj4gdGhlIHBsYWNlcyB0aGF0IGNvbnN1bWUgSFZNVFJBTlMqIHJldHVybiBYODZFTVVMX1JFVFJZ
Lg0KPiANCj4gaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudCgpIGNhbiByZXR1cm4gZmFsc2UgaWYg
dGhlcmUgd2FzIG5vIHZpb2xhdGlvbiwNCj4gaWYgdGhlcmUgd2FzIGFuIGVycm9yIGZyb20gbW9u
aXRvcl90cmFwcygpIG9yIHAybV9nZXRfbWVtX2FjY2VzcygpLg0KPiAtRVNSQ0ggZnJvbSBwMm1f
Z2V0X21lbV9hY2Nlc3MoKSBpcyB0cmVhdGVkIGFzIHJlc3RyaWN0ZWQgYWNjZXNzLg0KPiANCj4g
Tk9URTogaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudCgpIGFzc3VtZXMgdGhlIGNhbGxlciB3aWxs
IGVuYWJsZS9kaXNhYmxlDQo+IGFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGE8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQoNCkZX
SVcsIEFja2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
