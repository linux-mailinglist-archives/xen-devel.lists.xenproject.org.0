Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74F76A34B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 09:52:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnIDX-0003Je-GD; Tue, 16 Jul 2019 07:49:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnIDW-0003JI-0R
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 07:49:42 +0000
X-Inumbo-ID: 430d682a-a79e-11e9-9aed-cb506622191e
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 430d682a-a79e-11e9-9aed-cb506622191e;
 Tue, 16 Jul 2019 07:49:39 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 07:49:38 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 07:45:10 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 07:45:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBAwgak7oqjtfLsBV0U2jt9zd6+1ZknP0l0qGQ1dnmEcPxYqiU7uMINteWDC0FXuxyLrWImoLy2Zejs6LUTNDGhy2q3FPq/+ER96kn4iyW5Moqe1FrZxyXrvJTWfjDwpOt35WyVeNOfyO1H02Rktg/ubO5o8POhgBmJMc8dcGniGDY4dC8mXqIHjVt6HbDtcO7nwSpUOUOT8Rtj5mpb1dbsb9e9Y0LyblqDtxhXrIONDfyvNA7gn4lyawhooUmwHwM+jkme9WngIMM4W9KtMI/gcNinofPanNs20dHlytyIm0/eMV7g6iD6xTJl99kff31UagGj5JjheDYFtWyMdYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztG/zi8MSotOng688+TdG51kku7Oud9SA3uAgfPq2nA=;
 b=WA3EyoM2bTJLO0QskMvHpR5BgSQbl++AV2oQoyE6Uaq03/dGarlPj5kzqNRaKoRHDTDmloZADAX/BBtxugPtNRv3fMPSHRPu1PFa3yIrZiFg81O95oUV0sAiZPxCEw43CK9U28L2YCMtlZIv7DpRL3VpIUrtZkY970zxsKWgHAzK17cLlc0O5a2DOMXWNLLLRMb1klRYd7QQgm501IxFoT0V3MMjGk6tENxrWKpaZNx2M9tTY2oC6Ghq0bG/iaWs3IHqs47i4pgDNNj5eB3QocGGwLYqIdtYLet2JjHiES+usa+TYTwX2ecbm1oJ6PwHnJ7TtdOj0MnvNbLZY+eVZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2667.namprd18.prod.outlook.com (20.179.107.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 07:45:09 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 07:45:09 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 13/13] x86/IRQ: move {,_}clear_irq_vector()
Thread-Index: AQHVO6pkTX8uPTDJYESDSiTTro5CBQ==
Date: Tue, 16 Jul 2019 07:45:09 +0000
Message-ID: <0c053afa-ec03-6dc6-ba79-e49a0555dd8d@suse.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
In-Reply-To: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR05CA0019.eurprd05.prod.outlook.com
 (2603:10a6:10:36::32) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c4dec81-3ada-40c4-d58a-08d709c186f4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2667; 
x-ms-traffictypediagnostic: DM6PR18MB2667:
x-microsoft-antispam-prvs: <DM6PR18MB2667737E3BEC940DDD446406B3CE0@DM6PR18MB2667.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(189003)(199004)(6436002)(102836004)(5640700003)(8676002)(53936002)(6506007)(4326008)(386003)(6512007)(7736002)(186003)(6116002)(6486002)(305945005)(52116002)(2906002)(66066001)(11346002)(81166006)(2616005)(8936002)(316002)(476003)(3846002)(66476007)(446003)(76176011)(2351001)(99286004)(26005)(81156014)(31686004)(68736007)(6916009)(256004)(14444005)(14454004)(486006)(71190400001)(478600001)(71200400001)(31696002)(5660300002)(86362001)(80792005)(2501003)(54906003)(36756003)(25786009)(64756008)(66556008)(66946007)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2667;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2VVjCVemPAhM24trO5gqANnBQP7VlGCbeTlObsft1BMgmRoTCRi6jrMzIRoeDpvJLZ6188An5Jjudwu+FXigQTekpf/Lh4yDGjZhuyBA2hM61sJJMa3vNvua5v1QYnKbkigoUTOz1PDkEkrLcxTT1sg08dmtub5cErFdwZSuWCSXknA99aB4VK5K+SOowWXJaTIryJ9e/UHI9+so82EnYrafNViuO55ibe9ydSu9LT7SHmPnaShWolL1a1+OVtcX+69H+pi8nejWDoLtupZEk72L6SxRYKP+LBYusCk0ed8IXtIBLAUmqetDIFRvb6JlhHx+Fu82vVKRtJKmNwDbCLRDrfdccFe+Ewyct/yQbeQ546qIZ0S+IVw2jUhQMuFBkYEf0TgiV13XCqrZLO+uTNO43B12+h1wWwN40Rfke8o=
Content-ID: <079A0C135EA7DC4A96ED3CBF509F165C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4dec81-3ada-40c4-d58a-08d709c186f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 07:45:09.5044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2667
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 13/13] x86/IRQ: move {,_}clear_irq_vector()
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

VGhpcyBpcyBsYXJnZWx5IHRvIGRyb3AgYSBmb3J3YXJkIGRlY2xhcmF0aW9uLiBUaGVyZSdzIG9u
ZSBmdW5jdGlvbmFsDQpjaGFuZ2UgLSBjbGVhcl9pcnFfdmVjdG9yKCkgZ2V0cyBtYXJrZWQgX19p
bml0LCBhcyBpdHMgb25seSBjYWxsZXIgaXMNCmNoZWNrX3RpbWVyKCkuIEJleW9uZCB0aGlzIG9u
bHkgYSBmZXcgc3RyYXkgYmxhbmtzIGdldCByZW1vdmVkLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCi0tLQ0KdjM6IE5ldy4NCg0KLS0tIGEveGVuL2FyY2gv
eDg2L2lycS5jDQorKysgYi94ZW4vYXJjaC94ODYvaXJxLmMNCkBAIC0yNyw3ICsyNyw2IEBADQog
ICNpbmNsdWRlIDxwdWJsaWMvcGh5c2Rldi5oPg0KICANCiAgc3RhdGljIGludCBwYXJzZV9pcnFf
dmVjdG9yX21hcF9wYXJhbShjb25zdCBjaGFyICpzKTsNCi1zdGF0aWMgdm9pZCBfY2xlYXJfaXJx
X3ZlY3RvcihzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpOw0KICANCiAgLyogb3B0X25vaXJxYmFsYW5j
ZTogSWYgdHJ1ZSwgc29mdHdhcmUgSVJRIGJhbGFuY2luZy9hZmZpbml0eSBpcyBkaXNhYmxlZC4g
Ki8NCiAgYm9vbCBfX3JlYWRfbW9zdGx5IG9wdF9ub2lycWJhbGFuY2U7DQpAQCAtMTkxLDYgKzE5
MCw2NyBAQCBpbnQgX19pbml0IGJpbmRfaXJxX3ZlY3RvcihpbnQgaXJxLCBpbnQNCiAgICAgIHJl
dHVybiByZXQ7DQogIH0NCiAgDQorc3RhdGljIHZvaWQgX2NsZWFyX2lycV92ZWN0b3Ioc3RydWN0
IGlycV9kZXNjICpkZXNjKQ0KK3sNCisgICAgdW5zaWduZWQgaW50IGNwdSwgb2xkX3ZlY3Rvciwg
aXJxID0gZGVzYy0+aXJxOw0KKyAgICB1bnNpZ25lZCBpbnQgdmVjdG9yID0gZGVzYy0+YXJjaC52
ZWN0b3I7DQorICAgIGNwdW1hc2tfdCAqdG1wX21hc2sgPSB0aGlzX2NwdShzY3JhdGNoX2NwdW1h
c2spOw0KKw0KKyAgICBCVUdfT04oIXZhbGlkX2lycV92ZWN0b3IodmVjdG9yKSk7DQorDQorICAg
IC8qIEFsd2F5cyBjbGVhciBkZXNjLT5hcmNoLnZlY3RvciAqLw0KKyAgICBjcHVtYXNrX2FuZCh0
bXBfbWFzaywgZGVzYy0+YXJjaC5jcHVfbWFzaywgJmNwdV9vbmxpbmVfbWFwKTsNCisNCisgICAg
Zm9yX2VhY2hfY3B1KGNwdSwgdG1wX21hc2spDQorICAgIHsNCisgICAgICAgIEFTU0VSVChwZXJf
Y3B1KHZlY3Rvcl9pcnEsIGNwdSlbdmVjdG9yXSA9PSBpcnEpOw0KKyAgICAgICAgcGVyX2NwdSh2
ZWN0b3JfaXJxLCBjcHUpW3ZlY3Rvcl0gPSB+aXJxOw0KKyAgICB9DQorDQorICAgIGRlc2MtPmFy
Y2gudmVjdG9yID0gSVJRX1ZFQ1RPUl9VTkFTU0lHTkVEOw0KKyAgICBjcHVtYXNrX2NsZWFyKGRl
c2MtPmFyY2guY3B1X21hc2spOw0KKw0KKyAgICBpZiAoIGRlc2MtPmFyY2gudXNlZF92ZWN0b3Jz
ICkNCisgICAgew0KKyAgICAgICAgQVNTRVJUKHRlc3RfYml0KHZlY3RvciwgZGVzYy0+YXJjaC51
c2VkX3ZlY3RvcnMpKTsNCisgICAgICAgIGNsZWFyX2JpdCh2ZWN0b3IsIGRlc2MtPmFyY2gudXNl
ZF92ZWN0b3JzKTsNCisgICAgfQ0KKw0KKyAgICBkZXNjLT5hcmNoLnVzZWQgPSBJUlFfVU5VU0VE
Ow0KKw0KKyAgICB0cmFjZV9pcnFfbWFzayhUUkNfSFdfSVJRX0NMRUFSX1ZFQ1RPUiwgaXJxLCB2
ZWN0b3IsIHRtcF9tYXNrKTsNCisNCisgICAgaWYgKCBsaWtlbHkoIWRlc2MtPmFyY2gubW92ZV9p
bl9wcm9ncmVzcykgKQ0KKyAgICAgICAgcmV0dXJuOw0KKw0KKyAgICAvKiBJZiB3ZSB3ZXJlIGlu
IG1vdGlvbiwgYWxzbyBjbGVhciBkZXNjLT5hcmNoLm9sZF92ZWN0b3IgKi8NCisgICAgb2xkX3Zl
Y3RvciA9IGRlc2MtPmFyY2gub2xkX3ZlY3RvcjsNCisgICAgY3B1bWFza19hbmQodG1wX21hc2ss
IGRlc2MtPmFyY2gub2xkX2NwdV9tYXNrLCAmY3B1X29ubGluZV9tYXApOw0KKw0KKyAgICBmb3Jf
ZWFjaF9jcHUoY3B1LCB0bXBfbWFzaykNCisgICAgew0KKyAgICAgICAgQVNTRVJUKHBlcl9jcHUo
dmVjdG9yX2lycSwgY3B1KVtvbGRfdmVjdG9yXSA9PSBpcnEpOw0KKyAgICAgICAgVFJBQ0VfM0Qo
VFJDX0hXX0lSUV9NT1ZFX0ZJTklTSCwgaXJxLCBvbGRfdmVjdG9yLCBjcHUpOw0KKyAgICAgICAg
cGVyX2NwdSh2ZWN0b3JfaXJxLCBjcHUpW29sZF92ZWN0b3JdID0gfmlycTsNCisgICAgfQ0KKw0K
KyAgICByZWxlYXNlX29sZF92ZWMoZGVzYyk7DQorDQorICAgIGRlc2MtPmFyY2gubW92ZV9pbl9w
cm9ncmVzcyA9IDA7DQorfQ0KKw0KK3ZvaWQgX19pbml0IGNsZWFyX2lycV92ZWN0b3IoaW50IGly
cSkNCit7DQorICAgIHN0cnVjdCBpcnFfZGVzYyAqZGVzYyA9IGlycV90b19kZXNjKGlycSk7DQor
ICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQorDQorICAgIHNwaW5fbG9ja19pcnFzYXZlKCZkZXNj
LT5sb2NrLCBmbGFncyk7DQorICAgIHNwaW5fbG9jaygmdmVjdG9yX2xvY2spOw0KKyAgICBfY2xl
YXJfaXJxX3ZlY3RvcihkZXNjKTsNCisgICAgc3Bpbl91bmxvY2soJnZlY3Rvcl9sb2NrKTsNCisg
ICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGVzYy0+bG9jaywgZmxhZ3MpOw0KK30NCisNCiAg
LyoNCiAgICogRHluYW1pYyBpcnEgYWxsb2NhdGUgYW5kIGRlYWxsb2NhdGlvbiBmb3IgTVNJDQog
ICAqLw0KQEAgLTI4MSw2NyArMzQxLDYgQEAgdm9pZCBkZXN0cm95X2lycSh1bnNpZ25lZCBpbnQg
aXJxKQ0KICAgICAgeGZyZWUoYWN0aW9uKTsNCiAgfQ0KICANCi1zdGF0aWMgdm9pZCBfY2xlYXJf
aXJxX3ZlY3RvcihzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpDQotew0KLSAgICB1bnNpZ25lZCBpbnQg
Y3B1LCBvbGRfdmVjdG9yLCBpcnEgPSBkZXNjLT5pcnE7DQotICAgIHVuc2lnbmVkIGludCB2ZWN0
b3IgPSBkZXNjLT5hcmNoLnZlY3RvcjsNCi0gICAgY3B1bWFza190ICp0bXBfbWFzayA9IHRoaXNf
Y3B1KHNjcmF0Y2hfY3B1bWFzayk7DQotDQotICAgIEJVR19PTighdmFsaWRfaXJxX3ZlY3Rvcih2
ZWN0b3IpKTsNCi0NCi0gICAgLyogQWx3YXlzIGNsZWFyIGRlc2MtPmFyY2gudmVjdG9yICovDQot
ICAgIGNwdW1hc2tfYW5kKHRtcF9tYXNrLCBkZXNjLT5hcmNoLmNwdV9tYXNrLCAmY3B1X29ubGlu
ZV9tYXApOw0KLQ0KLSAgICBmb3JfZWFjaF9jcHUoY3B1LCB0bXBfbWFzaykNCi0gICAgew0KLSAg
ICAgICAgQVNTRVJUKCBwZXJfY3B1KHZlY3Rvcl9pcnEsIGNwdSlbdmVjdG9yXSA9PSBpcnEgKTsN
Ci0gICAgICAgIHBlcl9jcHUodmVjdG9yX2lycSwgY3B1KVt2ZWN0b3JdID0gfmlycTsNCi0gICAg
fQ0KLQ0KLSAgICBkZXNjLT5hcmNoLnZlY3RvciA9IElSUV9WRUNUT1JfVU5BU1NJR05FRDsNCi0g
ICAgY3B1bWFza19jbGVhcihkZXNjLT5hcmNoLmNwdV9tYXNrKTsNCi0NCi0gICAgaWYgKCBkZXNj
LT5hcmNoLnVzZWRfdmVjdG9ycyApDQotICAgIHsNCi0gICAgICAgIEFTU0VSVCh0ZXN0X2JpdCh2
ZWN0b3IsIGRlc2MtPmFyY2gudXNlZF92ZWN0b3JzKSk7DQotICAgICAgICBjbGVhcl9iaXQodmVj
dG9yLCBkZXNjLT5hcmNoLnVzZWRfdmVjdG9ycyk7DQotICAgIH0NCi0NCi0gICAgZGVzYy0+YXJj
aC51c2VkID0gSVJRX1VOVVNFRDsNCi0NCi0gICAgdHJhY2VfaXJxX21hc2soVFJDX0hXX0lSUV9D
TEVBUl9WRUNUT1IsIGlycSwgdmVjdG9yLCB0bXBfbWFzayk7DQotDQotICAgIGlmICggbGlrZWx5
KCFkZXNjLT5hcmNoLm1vdmVfaW5fcHJvZ3Jlc3MpICkNCi0gICAgICAgIHJldHVybjsNCi0NCi0g
ICAgLyogSWYgd2Ugd2VyZSBpbiBtb3Rpb24sIGFsc28gY2xlYXIgZGVzYy0+YXJjaC5vbGRfdmVj
dG9yICovDQotICAgIG9sZF92ZWN0b3IgPSBkZXNjLT5hcmNoLm9sZF92ZWN0b3I7DQotICAgIGNw
dW1hc2tfYW5kKHRtcF9tYXNrLCBkZXNjLT5hcmNoLm9sZF9jcHVfbWFzaywgJmNwdV9vbmxpbmVf
bWFwKTsNCi0NCi0gICAgZm9yX2VhY2hfY3B1KGNwdSwgdG1wX21hc2spDQotICAgIHsNCi0gICAg
ICAgIEFTU0VSVCggcGVyX2NwdSh2ZWN0b3JfaXJxLCBjcHUpW29sZF92ZWN0b3JdID09IGlycSAp
Ow0KLSAgICAgICAgVFJBQ0VfM0QoVFJDX0hXX0lSUV9NT1ZFX0ZJTklTSCwgaXJxLCBvbGRfdmVj
dG9yLCBjcHUpOw0KLSAgICAgICAgcGVyX2NwdSh2ZWN0b3JfaXJxLCBjcHUpW29sZF92ZWN0b3Jd
ID0gfmlycTsNCi0gICAgfQ0KLQ0KLSAgICByZWxlYXNlX29sZF92ZWMoZGVzYyk7DQotDQotICAg
IGRlc2MtPmFyY2gubW92ZV9pbl9wcm9ncmVzcyA9IDA7DQotfQ0KLQ0KLXZvaWQgY2xlYXJfaXJx
X3ZlY3RvcihpbnQgaXJxKQ0KLXsNCi0gICAgc3RydWN0IGlycV9kZXNjICpkZXNjID0gaXJxX3Rv
X2Rlc2MoaXJxKTsNCi0gICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCi0NCi0gICAgc3Bpbl9sb2Nr
X2lycXNhdmUoJmRlc2MtPmxvY2ssIGZsYWdzKTsNCi0gICAgc3Bpbl9sb2NrKCZ2ZWN0b3JfbG9j
ayk7DQotICAgIF9jbGVhcl9pcnFfdmVjdG9yKGRlc2MpOw0KLSAgICBzcGluX3VubG9jaygmdmVj
dG9yX2xvY2spOw0KLSAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkZXNjLT5sb2NrLCBmbGFn
cyk7DQotfQ0KLQ0KICBpbnQgaXJxX3RvX3ZlY3RvcihpbnQgaXJxKQ0KICB7DQogICAgICBpbnQg
dmVjdG9yID0gSVJRX1ZFQ1RPUl9VTkFTU0lHTkVEOw0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
