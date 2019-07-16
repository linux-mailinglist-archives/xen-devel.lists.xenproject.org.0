Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50286A33A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 09:48:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnI9z-0002di-K9; Tue, 16 Jul 2019 07:46:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnI9y-0002dZ-Ce
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 07:46:02 +0000
X-Inumbo-ID: be94c9bc-a79d-11e9-8c02-dff8a751572c
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be94c9bc-a79d-11e9-8c02-dff8a751572c;
 Tue, 16 Jul 2019 07:45:56 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 07:45:56 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 07:38:32 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 07:38:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i32TIC/XCj0bt7zFkJAj+NkEKhlWVHc1KeMNryQci7JGgbnqVLKOlUydxqj1p4/eeEEeExOfpfR5Iq0jmv10dllowOymwpBxEJCwLX2JqzHtLar7s32niCzucEe3q7B7ZiafAw22JFb48vo+OgzojDlp4cwYwC5OaJhyCfNZw/pSmSAkBz4vJNc/GelX2Utq+fBnPs1lBb22lpl6S2CQnwIke8FirJWnKBXYo7nptU7r8d5jK5Cp1qYfNBdBk0nt7eOMdr7bJNd3qVekQ6rWDrZtGK0uytkgHnbWbLdvvtUhHYpjbNfLPo14V22wWo4UF0OhCrUNiMX023x+wzebpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiZRk4taJlIjNWnHAkXa9+2wjebdatk/DSYCLPwCSkI=;
 b=WFTee2gwwU2v/MlrWCFBJsN0EtqBgW9/OChF1ulyNpmVin2HZ/bUMHhpCSTj4CCN5U+k1DKOx1vxLSIpkZ8B+I4ulBrWk6cQsOfCdruKQsuOp6NdttAsFfsoVWliE2WbCOM7jgzwFAd8HEh+riCwS4OyR23CNMuMCX6XPOnklGuJ8u6EC/A2IRItS8Ht54hMe7Ni8TEqouZzQIX6ftmt0vZ7m5gFu4fyEYxnXQcoGCN5bWHPwKskbdWxjpR62v2d2tRPigzHaECftnWqP1Yy/kpTUn7FCbx+VwCg1M1Pyz5epJZ8zARXrO2gggoMOc//984nO4dJTz7mFNwjSsdrPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2667.namprd18.prod.outlook.com (20.179.107.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 07:38:31 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 07:38:31 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 03/13] x86/IRQ: desc->affinity should strictly
 represent the requested value
Thread-Index: AQHVO6l35XHzXx7WVEi7OkZUFqn0pQ==
Date: Tue, 16 Jul 2019 07:38:31 +0000
Message-ID: <0862ea72-a405-ef5a-d309-eea3ee918969@suse.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
In-Reply-To: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR03CA0073.eurprd03.prod.outlook.com
 (2603:10a6:10:72::14) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d502ea38-e827-45ff-8555-08d709c0998b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2667; 
x-ms-traffictypediagnostic: DM6PR18MB2667:
x-microsoft-antispam-prvs: <DM6PR18MB26670CB7692800231D7C4663B3CE0@DM6PR18MB2667.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(189003)(199004)(6436002)(102836004)(5640700003)(8676002)(53936002)(6506007)(4326008)(386003)(6512007)(7736002)(186003)(6116002)(6486002)(305945005)(52116002)(2906002)(66066001)(11346002)(81166006)(2616005)(8936002)(316002)(476003)(3846002)(66476007)(446003)(76176011)(2351001)(99286004)(26005)(81156014)(31686004)(68736007)(6916009)(256004)(14444005)(14454004)(486006)(71190400001)(478600001)(71200400001)(31696002)(5660300002)(86362001)(80792005)(2501003)(54906003)(36756003)(25786009)(64756008)(66556008)(66946007)(66446008)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2667;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2h9AYB5xyvwQ3S4FpTO67UJKRtOtYrfSVbfgVQxwLItkOMWbgYBglLQD541p2VDV9BrnvkLuzL67rPMx4NKAXY6+2Wbu5TV25stvumR+iZ3QNgwwG75OrfQlQ2vWkaNwdjK3MXLQH2b29U6YNLVJ9j5pvoKNNeRzkg9U+124mfWczfIUnrPH3wybqj8a1hvhPu24OXgtGh8tlvfJFEw58izMhV/WcC54oEzij6nd/5e27QZSXg0p9Ft/0BxOx2VvhUSOjCGVCBN8c2pN1wNVBW8xiSsQvSeo6TBZYVY7A7XebuXsJZnhqYT4cLixruu00JgeNOw3HwgaqSXE4tfulQaT8zPcgZfgSOV9HDE43hAOvNBcvxHEX4/IAYmwjAVWqWu+XN8gfv10WJuSwPtflfwjSWHEeX9u7wfhY8SdCaU=
Content-ID: <BF9E3C43163AE047BCDA1765FBE99651@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d502ea38-e827-45ff-8555-08d709c0998b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 07:38:31.1862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2667
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 03/13] x86/IRQ: desc->affinity should
 strictly represent the requested value
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ZGVzYy0+YXJjaC5jcHVfbWFzayByZWZsZWN0cyB0aGUgYWN0dWFsIHNldCBvZiB0YXJnZXQgQ1BV
cy4gRG9uJ3QgZXZlcg0KZmlkZGxlIHdpdGggZGVzYy0+YWZmaW5pdHkgaXRzZWxmLCBleGNlcHQg
dG8gc3RvcmUgY2FsbGVyIHJlcXVlc3RlZA0KdmFsdWVzLiBOb3RlIHRoYXQgYXNzaWduX2lycV92
ZWN0b3IoKSBub3cgdGFrZXMgYSBOVUxMIGluY29taW5nIENQVSBtYXNrDQp0byBtZWFuICJhbGwg
Q1BVcyIgbm93LCByYXRoZXIgdGhhbiBqdXN0ICJhbGwgY3VycmVudGx5IG9ubGluZSBDUFVzIi4N
ClRoaXMgd2F5IG5vIGZ1cnRoZXIgYWZmaW5pdHkgYWRqdXN0bWVudCBpcyBuZWVkZWQgYWZ0ZXIg
b25saW5pbmcgZnVydGhlcg0KQ1BVcy4NCg0KVGhpcyByZW5kZXJzIGJvdGggc2V0X25hdGl2ZV9p
cnFfaW5mbygpIHVzZXMgKHdoaWNoIHdlcmVuJ3QgdXNpbmcgcHJvcGVyDQpsb2NraW5nIGFueXdh
eSkgcmVkdW5kYW50IC0gZHJvcCB0aGUgZnVuY3Rpb24gYWx0b2dldGhlci4NCg0KU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KUmV2aWV3ZWQtYnk6IFJvZ2Vy
IFBhdSBNb25uw4PCqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQotLS0NCnY0OiBVc2UgJSpwYmwu
DQotLS0NClRCRDogVG8gcmVkdWNlIHRoZSBiYWQgZWZmZWN0IG9uIHRoZSBzbyBmYXIgdGFidWxh
ciBvdXRwdXQgb2YgdGhlICdpJw0KICAgICAgZGVidWcga2V5LCBzaGlmdGluZyB0aGUgdHdvIGFm
ZmluaXR5IHZhbHVlcyBmdXJ0aGVyIHRvIHRoZSByaWdodA0KICAgICAgbWF5IGJlIHdvcnRod2hp
bGUgdG8gY29uc2lkZXIuDQoNCi0tLSBhL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMNCisrKyBiL3hl
bi9hcmNoL3g4Ni9pb19hcGljLmMNCkBAIC0xMDM5LDcgKzEwMzksNiBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgc2V0dXBfSU9fQVBJQ19pcnFzKHZvDQogICAgICAgICAgICAgIFNFVF9ERVNUKGVudHJ5
LCBsb2dpY2FsLCBjcHVfbWFza190b19hcGljaWQoVEFSR0VUX0NQVVMpKTsNCiAgICAgICAgICAg
ICAgc3Bpbl9sb2NrX2lycXNhdmUoJmlvYXBpY19sb2NrLCBmbGFncyk7DQogICAgICAgICAgICAg
IF9faW9hcGljX3dyaXRlX2VudHJ5KGFwaWMsIHBpbiwgMCwgZW50cnkpOw0KLSAgICAgICAgICAg
IHNldF9uYXRpdmVfaXJxX2luZm8oaXJxLCBUQVJHRVRfQ1BVUyk7DQogICAgICAgICAgICAgIHNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmlvYXBpY19sb2NrLCBmbGFncyk7DQogICAgICAgICAgfQ0K
ICAgICAgfQ0KQEAgLTIyNDgsNyArMjI0Nyw2IEBAIGludCBpb19hcGljX3NldF9wY2lfcm91dGlu
ZyAoaW50IGlvYXBpYywNCiAgDQogICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaW9hcGljX2xvY2ss
IGZsYWdzKTsNCiAgICAgIF9faW9hcGljX3dyaXRlX2VudHJ5KGlvYXBpYywgcGluLCAwLCBlbnRy
eSk7DQotICAgIHNldF9uYXRpdmVfaXJxX2luZm8oaXJxLCBUQVJHRVRfQ1BVUyk7DQogICAgICBz
cGluX3VubG9jaygmaW9hcGljX2xvY2spOw0KICANCiAgICAgIHNwaW5fbG9jaygmZGVzYy0+bG9j
ayk7DQotLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYw0K
QEAgLTU4OSwxMSArNTg5LDE2IEBAIGludCBhc3NpZ25faXJxX3ZlY3RvcihpbnQgaXJxLCBjb25z
dCBjcHUNCiAgDQogICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmdmVjdG9yX2xvY2ssIGZsYWdzKTsN
CiAgICAgIHJldCA9IF9fYXNzaWduX2lycV92ZWN0b3IoaXJxLCBkZXNjLCBtYXNrID86IFRBUkdF
VF9DUFVTKTsNCi0gICAgaWYgKCFyZXQpIHsNCisgICAgaWYgKCAhcmV0ICkNCisgICAgew0KICAg
ICAgICAgIHJldCA9IGRlc2MtPmFyY2gudmVjdG9yOw0KLSAgICAgICAgY3B1bWFza19jb3B5KGRl
c2MtPmFmZmluaXR5LCBkZXNjLT5hcmNoLmNwdV9tYXNrKTsNCisgICAgICAgIGlmICggbWFzayAp
DQorICAgICAgICAgICAgY3B1bWFza19jb3B5KGRlc2MtPmFmZmluaXR5LCBtYXNrKTsNCisgICAg
ICAgIGVsc2UNCisgICAgICAgICAgICBjcHVtYXNrX3NldGFsbChkZXNjLT5hZmZpbml0eSk7DQog
ICAgICB9DQogICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ2ZWN0b3JfbG9jaywgZmxhZ3Mp
Ow0KKw0KICAgICAgcmV0dXJuIHJldDsNCiAgfQ0KICANCkBAIC0yMzQ1LDkgKzIzNTAsMTAgQEAg
c3RhdGljIHZvaWQgZHVtcF9pcnFzKHVuc2lnbmVkIGNoYXIga2V5KQ0KICANCiAgICAgICAgICBz
cGluX2xvY2tfaXJxc2F2ZSgmZGVzYy0+bG9jaywgZmxhZ3MpOw0KICANCi0gICAgICAgIHByaW50
aygiICAgSVJROiU0ZCBhZmY6JSpwYiB2ZWM6JTAyeCAlLTE1cyBzdGF0dXM9JTAzeCAiLA0KLSAg
ICAgICAgICAgICAgIGlycSwgbnJfY3B1X2lkcywgY3B1bWFza19iaXRzKGRlc2MtPmFmZmluaXR5
KSwgZGVzYy0+YXJjaC52ZWN0b3IsDQotICAgICAgICAgICAgICAgZGVzYy0+aGFuZGxlci0+dHlw
ZW5hbWUsIGRlc2MtPnN0YXR1cyk7DQorICAgICAgICBwcmludGsoIiAgIElSUTolNGQgYWZmOnsl
KnBibH0veyUqcGJsfSB2ZWM6JTAyeCAlLTE1cyBzdGF0dXM9JTAzeCAiLA0KKyAgICAgICAgICAg
ICAgIGlycSwgbnJfY3B1X2lkcywgY3B1bWFza19iaXRzKGRlc2MtPmFmZmluaXR5KSwNCisgICAg
ICAgICAgICAgICBucl9jcHVfaWRzLCBjcHVtYXNrX2JpdHMoZGVzYy0+YXJjaC5jcHVfbWFzayks
DQorICAgICAgICAgICAgICAgZGVzYy0+YXJjaC52ZWN0b3IsIGRlc2MtPmhhbmRsZXItPnR5cGVu
YW1lLCBkZXNjLT5zdGF0dXMpOw0KICANCiAgICAgICAgICBpZiAoIHNzaWQgKQ0KICAgICAgICAg
ICAgICBwcmludGsoIlo9JS0yNXMgIiwgc3NpZCk7DQpAQCAtMjQzNSw4ICsyNDQxLDcgQEAgdm9p
ZCBmaXh1cF9pcnFzKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgYg0KICAgICAgICAgICAgICAgICAg
cmVsZWFzZV9vbGRfdmVjKGRlc2MpOw0KICAgICAgICAgIH0NCiAgDQotICAgICAgICBjcHVtYXNr
X2NvcHkoJmFmZmluaXR5LCBkZXNjLT5hZmZpbml0eSk7DQotICAgICAgICBpZiAoICFkZXNjLT5h
Y3Rpb24gfHwgY3B1bWFza19zdWJzZXQoJmFmZmluaXR5LCBtYXNrKSApDQorICAgICAgICBpZiAo
ICFkZXNjLT5hY3Rpb24gfHwgY3B1bWFza19zdWJzZXQoZGVzYy0+YWZmaW5pdHksIG1hc2spICkN
CiAgICAgICAgICB7DQogICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZkZXNjLT5sb2NrKTsNCiAg
ICAgICAgICAgICAgY29udGludWU7DQpAQCAtMjQ2OSwxMiArMjQ3NCwxMyBAQCB2b2lkIGZpeHVw
X2lycXMoY29uc3QgY3B1bWFza190ICptYXNrLCBiDQogICAgICAgICAgICAgIGRlc2MtPmFyY2gu
bW92ZV9pbl9wcm9ncmVzcyA9IDA7DQogICAgICAgICAgfQ0KICANCi0gICAgICAgIGNwdW1hc2tf
YW5kKCZhZmZpbml0eSwgJmFmZmluaXR5LCBtYXNrKTsNCi0gICAgICAgIGlmICggY3B1bWFza19l
bXB0eSgmYWZmaW5pdHkpICkNCisgICAgICAgIGlmICggIWNwdW1hc2tfaW50ZXJzZWN0cyhtYXNr
LCBkZXNjLT5hZmZpbml0eSkgKQ0KICAgICAgICAgIHsNCiAgICAgICAgICAgICAgYnJlYWtfYWZm
aW5pdHkgPSB0cnVlOw0KLSAgICAgICAgICAgIGNwdW1hc2tfY29weSgmYWZmaW5pdHksIG1hc2sp
Ow0KKyAgICAgICAgICAgIGNwdW1hc2tfc2V0YWxsKCZhZmZpbml0eSk7DQogICAgICAgICAgfQ0K
KyAgICAgICAgZWxzZQ0KKyAgICAgICAgICAgIGNwdW1hc2tfY29weSgmYWZmaW5pdHksIGRlc2Mt
PmFmZmluaXR5KTsNCiAgDQogICAgICAgICAgaWYgKCBkZXNjLT5oYW5kbGVyLT5kaXNhYmxlICkN
CiAgICAgICAgICAgICAgZGVzYy0+aGFuZGxlci0+ZGlzYWJsZShkZXNjKTsNCi0tLSBhL3hlbi9p
bmNsdWRlL3hlbi9pcnEuaA0KKysrIGIveGVuL2luY2x1ZGUveGVuL2lycS5oDQpAQCAtMTYyLDEx
ICsxNjIsNiBAQCBleHRlcm4gaXJxX2Rlc2NfdCAqZG9tYWluX3NwaW5fbG9ja19pcnFfDQogIGV4
dGVybiBpcnFfZGVzY190ICpwaXJxX3NwaW5fbG9ja19pcnFfZGVzYygNCiAgICAgIGNvbnN0IHN0
cnVjdCBwaXJxICosIHVuc2lnbmVkIGxvbmcgKnBmbGFncyk7DQogIA0KLXN0YXRpYyBpbmxpbmUg
dm9pZCBzZXRfbmF0aXZlX2lycV9pbmZvKHVuc2lnbmVkIGludCBpcnEsIGNvbnN0IGNwdW1hc2tf
dCAqbWFzaykNCi17DQotICAgIGNwdW1hc2tfY29weShpcnFfdG9fZGVzYyhpcnEpLT5hZmZpbml0
eSwgbWFzayk7DQotfQ0KLQ0KICB1bnNpZ25lZCBpbnQgc2V0X2Rlc2NfYWZmaW5pdHkoc3RydWN0
IGlycV9kZXNjICosIGNvbnN0IGNwdW1hc2tfdCAqKTsNCiAgDQogICNpZm5kZWYgYXJjaF9od2Rv
bV9pcnFzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
