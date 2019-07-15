Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81778683E3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 09:09:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmv4q-0003N5-V3; Mon, 15 Jul 2019 07:07:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hmv4o-0003My-Gv
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 07:07:10 +0000
X-Inumbo-ID: 1280d900-a6cf-11e9-b727-b37b0c2c95cf
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1280d900-a6cf-11e9-b727-b37b0c2c95cf;
 Mon, 15 Jul 2019 07:07:07 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 07:06:57 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 06:54:29 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 06:54:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEMqq86toZ0NrdI0MBpKkLJ7Hueg2loUV3F4ZO57PHqJHr23h0G/1iDIgIcnG6ezan4+HCZff9OYlE/jeyJzm087Cm2rbqV+MtISAkxa8Y6BONmcujdNIGngqC924pLnlunZwC1PuhMQfpuiSTidXCobDTdvlRZqDyQ/1C+7SPESLpT3RLGqEXq2r7chhAjZHrMaQ1KaX643csH2IOXjWTZOaGOcoLB6G47NV4WeYalUVcqaxsQ5sDYGCj9A1c9L73AwvsIpzyAMJtWPYOfuzdLk37QXL6DdjEbfa5R8O1N3fv3FY1vZAKfx3cwNgnpNuYvoXSmRAeZ9wBfDHyNgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcPacChXb77rQUIpw8yDJPWQJgxYibaSDcb/JLWQdM0=;
 b=SgnQuCDnKUolIdrtpxznlXQ+MRGHP8NYNql77KcZgT9cGgvE2C2Z/z50XWb0Qpi1DVhu8uBNA6fGHIKxO7nCOc865C6a2bnQ78lLOBmfB7mQ66yMztVQsqhDS09SxD42FiYluxoCQ7U05PXrromWZLzSTglCiv0yHARc9fxKcRP2nI5b0obkOCKOLlRhy/QSijOlK3A+q+yWmfEHX96agAcgmeSjWegHEDoq80T9LyLnpjCqiVSn+C6nH3TVa9UbMXD9IZmMDaRoh/oBtCRxIYG+eBA6Vii4vX+gsG9emjpxJvdb5KARfpG0x4migNVfg6XGbecQbFwlcK4y5FWJbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2457.namprd18.prod.outlook.com (20.179.104.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 06:54:27 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 06:54:27 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Thread-Topic: [Xen-devel] [PATCH v2] xen/pv: Fix a boot up hang revealed by
 int3 self test
Thread-Index: AQHVOImcjcwxoNt5ZUKNkWkdaGDt/qbHCyGugAQaD5iAAB39AA==
Date: Mon, 15 Jul 2019 06:54:27 +0000
Message-ID: <18619ecb-108a-0d89-812c-7525a566e805@suse.com>
References: <1562832921-20831-1-git-send-email-zhenzhong.duan@oracle.com>
 <ebf9657b-7d97-87a0-e32e-af8453ee7bba@citrix.com>
 <b9702975-dd2d-cf0b-e47f-a1c4361db18f@oracle.com>
In-Reply-To: <b9702975-dd2d-cf0b-e47f-a1c4361db18f@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::16)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a2295bf-fe38-4111-a5b6-08d708f14751
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2457; 
x-ms-traffictypediagnostic: DM6PR18MB2457:
x-microsoft-antispam-prvs: <DM6PR18MB245741770A007D379924D6B1B3CF0@DM6PR18MB2457.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(199004)(189003)(186003)(26005)(7736002)(8936002)(14454004)(64756008)(3846002)(31696002)(66446008)(80792005)(305945005)(7416002)(5660300002)(6436002)(6116002)(86362001)(81166006)(31686004)(4326008)(81156014)(66476007)(66556008)(66946007)(8676002)(25786009)(2906002)(71200400001)(71190400001)(316002)(6506007)(6916009)(68736007)(99286004)(54906003)(107886003)(53936002)(14444005)(256004)(6512007)(478600001)(486006)(66066001)(76176011)(229853002)(446003)(11346002)(2616005)(36756003)(476003)(6246003)(52116002)(102836004)(6486002)(386003)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2457;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bWFob7XQdx8Rd1m+9ToMA6Lr1cLuAlh01W1jxTU6XqYkDbdpTC2o8a7uWPy35z8KsHgn9sdgvyHt85/V1amCWC+dPnW3gej0iLogQW5UmGWrkDyubnmaUypAqQfpZdzGBAwu8HlSJ3pTV50ObYlcBuWl1XaF9ZG9QRWueAafqCoIXCnHVxvtvOk8rhzx/y3kDdnN+zBmRi//yvFRyKjYG2VqH7HFnm8pirPLeZGz3x0uXkCFiD/wsHvBZlt2xe7mk9/62I77djek/7C0DBTcLyw6nDr9FkFLD32ABkjKNctDhdunx5tvRv8i9I5rHZrQ9t3YZvX3iu+0aj4ZUxotS/GlSQvaZn+lCD4EFywaCIT6DbI17D4/9KPR9N1bbp+VehRy/G9eAEnZxCY07QE3T7jm74DfUOHO56g/D/TqcxA=
Content-ID: <CC86C020B0C53845B03D74E58CC62742@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2295bf-fe38-4111-a5b6-08d708f14751
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 06:54:27.4117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2457
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] xen/pv: Fix a boot up hang revealed by
 int3 self test
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
Cc: Juergen Gross <JGross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "srinivas.eeda@oracle.com" <srinivas.eeda@oracle.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMjAxOSAwNzowNSwgWmhlbnpob25nIER1YW4gd3JvdGU6DQo+IA0KPiBPbiAyMDE5
LzcvMTIgMjI6MDYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxMS8wNy8yMDE5IDAzOjE1
LCBaaGVuemhvbmcgRHVhbiB3cm90ZToNCj4+PiBDb21taXQgNzQ1N2MwZGEwMjRiICgieDg2L2Fs
dGVybmF0aXZlczogQWRkIGludDNfZW11bGF0ZV9jYWxsKCkNCj4+PiBzZWxmdGVzdCIpIGlzIHVz
ZWQgdG8gZW5zdXJlIHRoZXJlIGlzIGEgZ2FwIHNldHVwIGluIGV4Y2VwdGlvbiBzdGFjaw0KPj4+
IHdoaWNoIGNvdWxkIGJlIHVzZWQgZm9yIGluc2VydGluZyBjYWxsIHJldHVybiBhZGRyZXNzLg0K
Pj4+DQo+Pj4gVGhpcyBnYXAgaXMgbWlzc2VkIGluIFhFTiBQViBpbnQzIGV4Y2VwdGlvbiBlbnRy
eSBwYXRoLCB0aGVuIGJlbG93IHBhbmljDQo+Pj4gdHJpZ2dlcmVkOg0KPj4+DQo+Pj4gW8KgwqDC
oCAwLjc3Mjg3Nl0gZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0OiAwMDAwIFsjMV0gU01QIE5PUFRJ
DQo+Pj4gW8KgwqDCoCAwLjc3Mjg4Nl0gQ1BVOiAwIFBJRDogMCBDb21tOiBzd2FwcGVyLzAgTm90
IHRhaW50ZWQgNS4yLjArICMxMQ0KPj4+IFvCoMKgwqAgMC43NzI4OTNdIFJJUDogZTAzMDppbnQz
X21hZ2ljKzB4MC8weDcNCj4+PiBbwqDCoMKgIDAuNzcyOTA1XSBSU1A6IDM1MDc6ZmZmZmZmZmY4
MjIwM2U5OCBFRkxBR1M6IDAwMDAwMjQ2DQo+Pj4gW8KgwqDCoCAwLjc3MzMzNF0gQ2FsbCBUcmFj
ZToNCj4+PiBbwqDCoMKgIDAuNzczMzM0XcKgIGFsdGVybmF0aXZlX2luc3RydWN0aW9ucysweDNk
LzB4MTJlDQo+Pj4gW8KgwqDCoCAwLjc3MzMzNF3CoCBjaGVja19idWdzKzB4N2M5LzB4ODg3DQo+
Pj4gW8KgwqDCoCAwLjc3MzMzNF3CoCA/IF9fZ2V0X2xvY2tlZF9wdGUrMHgxNzgvMHgxZjANCj4+
PiBbwqDCoMKgIDAuNzczMzM0XcKgIHN0YXJ0X2tlcm5lbCsweDRmZi8weDUzNQ0KPj4+IFvCoMKg
wqAgMC43NzMzMzRdwqAgPyBzZXRfaW5pdF9hcmcrMHg1NS8weDU1DQo+Pj4gW8KgwqDCoCAwLjc3
MzMzNF3CoCB4ZW5fc3RhcnRfa2VybmVsKzB4NTcxLzB4NTdhDQo+Pj4NCj4+PiBBcyB4ZW5pbnQz
IGFuZCBpbnQzIGVudHJ5IGNvZGUgYXJlIHNhbWUgZXhjZXB0IHhlbmludDMgZG9lc24ndCBnZW5l
cmF0ZQ0KPj4+IGEgZ2FwLCB3ZSBjYW4gZml4IGl0IGJ5IHVzaW5nIGludDMgYW5kIGRyb3AgdXNl
bGVzcyB4ZW5pbnQzLg0KPj4gRm9yIDY0Yml0IFBWIGd1ZXN0cywgWGVuJ3MgQUJJIGVudGVycyB0
aGUga2VybmVsIHdpdGggdXNpbmcgU1lTUkVULCB3aXRoDQo+PiAlcmN4LyVyMTEgb24gdGhlIHN0
YWNrLg0KPj4NCj4+IFRvIGNvbnZlcnQgYmFjayB0byAibm9ybWFsIiBsb29raW5nIGV4Y2VwdGlv
bnMsIHRoZSB4ZW4gdGh1bmtzIGRvIGBwb3ANCj4+ICVyY3g7IHBvcCAlcjExOyBqbXAgZG9fKmAu
Li4NCj4gSSB3aWxsIGFkZCB0aGlzIHRvIGNvbW1pdCBtZXNzYWdlLg0KPj4NCj4+PiBkaWZmIC0t
Z2l0IGEvYXJjaC94ODYvZW50cnkvZW50cnlfNjQuUyBiL2FyY2gveDg2L2VudHJ5L2VudHJ5XzY0
LlMNCj4+PiBpbmRleCAwZWE0ODMxLi4zNWE2NmZjIDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gveDg2
L2VudHJ5L2VudHJ5XzY0LlMNCj4+PiArKysgYi9hcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TDQo+
Pj4gQEAgLTExNzYsNyArMTE3Niw2IEBAIGlkdGVudHJ5IHN0YWNrX3NlZ21lbnTCoMKgwqDCoMKg
wqDCoCBkb19zdGFja19zZWdtZW50wqDCoMKgIGhhc19lcnJvcl9jb2RlPTENCj4+PiDCoCAjaWZk
ZWYgQ09ORklHX1hFTl9QVg0KPj4+IMKgIGlkdGVudHJ5IHhlbm5tacKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZG9fbm1pwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoYXNfZXJyb3JfY29kZT0wDQo+Pj4g
wqAgaWR0ZW50cnkgeGVuZGVidWfCoMKgwqDCoMKgwqDCoCBkb19kZWJ1Z8KgwqDCoMKgwqDCoMKg
IGhhc19lcnJvcl9jb2RlPTANCj4+PiAtaWR0ZW50cnkgeGVuaW50M8KgwqDCoMKgwqDCoMKgIGRv
X2ludDPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhhc19lcnJvcl9jb2RlPTANCj4+PiDCoCAjZW5k
aWYNCj4+IFdoYXQgaXMgY29uZnVzaW5nIGlzIHdoeSB0aGVyZSBhcmUgMyBleHRyYSBtYWdpYyB2
ZXJzaW9ucyBoZXJlLsKgIEF0IGENCj4+IGd1ZXNzLCBJJ2Qgc2F5IHNvbWV0aGluZyB0byBkbyB3
aXRoIElTVCBzZXR0aW5ncyAoZ2l2ZW4gdGhlIHZlY3RvcnMpLA0KPj4gYnV0IEkgZG9uJ3Qgc2Vl
IHdoeSAjREIvI0JQIHdvdWxkIG5lZWQgdG8gYmUgZGlmZmVyZW50IGluIHRoZSBmaXJzdA0KPj4g
cGxhY2UuwqAgKE5NSSBzdXJlLCBidXQgdGhhdCBpcyBtb3JlIHRvIGRvIHdpdGggdGhlIGNyYXp5
IGhvb3BzIG5lZWRpbmcNCj4+IHRvIGJlIGp1bXBlZCB0aHJvdWdoIHRvIGtlZXAgbmF0aXZlIGZ1
bmN0aW9uaW5nIHNhZmVseS4pDQo+IA0KPiB4ZW5pbnQzIHdpbGwgYmUgcmVtb3ZlZCBpbiB0aGlz
IHBhdGNoIHNhZmVseSBhcyBpdCBkb24ndCB1c2UgSVNUIG5vdy4NCj4gDQo+IEJ1dCBkZWJ1ZyBh
bmQgbm1pIG5lZWQgcGFyYW5vaWRfZW50cnkgd2hpY2ggd2lsbCByZWFkIE1TUl9HU19CQVNFIHRv
IGRldGVybWluZQ0KPiANCj4gaWYgc3dhcGdzIGlzIG5lZWRlZC4gSSBndWVzcyBQViBndWVzdGlu
ZyBydW5uaW5nIGluIHJpbmczIHdpbGwgI0dQIHdpdGggc3dhcGdzPw0KDQpOb3Qgb25seSB0aGF0
IChYZW4gY291bGQgdHJhcCBhbmQgZW11bGF0ZSBzd2FwZ3MgaWYgdGhhdCB3YXMgbmVlZGVkKSAt
IDY0LWJpdA0KUFYga2VybmVsIG1vZGUgYWx3YXlzIGdldHMgZW50ZXJlZCB3aXRoIGtlcm5lbCBH
UyBiYXNlIGFscmVhZHkgc2V0LiBIZW5jZQ0KZmluZGluZyBvdXQgd2hldGhlciB0byBzd2l0Y2gg
dGhlIEdTIGJhc2UgaXMgc3BlY2lmaWNhbGx5IG5vdCBzb21ldGhpbmcgdGhhdA0KYW55IGV4Y2Vw
dGlvbiBlbnRyeSBwb2ludCB3b3VsZCBuZWVkIHRvIGRvIChhbmQgaXQgc2hvdWxkIGFjdGl2ZWx5
IHRyeSB0bw0KYXZvaWQgaXQsIGZvciBwZXJmb3JtYW5jZSByZWFzb25zKS4NCg0KSmFuDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
