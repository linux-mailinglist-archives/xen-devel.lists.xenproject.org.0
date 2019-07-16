Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CB46A32F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 09:46:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnI71-0002NA-I8; Tue, 16 Jul 2019 07:42:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnI70-0002N0-Eb
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 07:42:58 +0000
X-Inumbo-ID: 537e95da-a79d-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 537e95da-a79d-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 07:42:56 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 07:42:56 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 07:37:37 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 07:37:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+mxOclmQl/Iwnmb3Ajz3NaVoYkQZnBwRiUvl/8JGlAOvFpNQQKJMCpM4KRDfjrDTdd/tnqUj51lctIUWTTn6E0ow6j0rPzADMIpnbuTcaGxNqyK2LKwMgP1MnKbilCGNAjGWCGEDrxcbS2ME+SeRne1y3q4uz9XLxTNm4TVO1U6A2CtEtE6jE+x9HDHFyqNOxqejhw5s1UntKIFbYHXfikS3lhnaQV/IxvgzQWFZUZ6M8lLJZL7+teF3jsOxW9TijfWzvJs8Dmeuw4s1aZe++vMHVxnoXSN1W0K06ZsuLSc6A7BMjaP9J8ltcQseWOYtvmvHksajlRC0wf38FVS5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XsuRYlo9O9yePuFmC76k1W7jFTXusfwS+bbwzyeAUY=;
 b=XHfoJod67ahpFbFYqHKlaa6d1sBrAcFPiPF3o7NlBHbxVRtVePlqTIHr0ounVoy0jrkNQI6IOuyrN4YVHLrQG1tBZ0yCZ1x4rEcl+sHTuIJSDFaPR+OT72oZt1Zf5KCSJT8w5u36dCui6UDWdA3Iz3VhucaDtMggn9dr68be4nNuRGc9zuhH8eJEZKjM2zoS+EjLm+5DgsA/0wYKMDxPULmnRbzxAj0hqNg87GyE+XxnHY+zJ8YjiYUOC4AmN5OouQdGCvFP9vEzouTNFeSdylJiaD0N6US6pZHZ8C4bbBR3k2eCTfWIz+m378sPn/vDFswYeiqhlK6Qy0lF5hJU6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2667.namprd18.prod.outlook.com (20.179.107.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 07:37:36 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 07:37:36 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 02/13] x86/IRQ: deal with move cleanup count state in
 fixup_irqs()
Thread-Index: AQHVO6lWFnWLjuNRXkiFzFypmuh6cQ==
Date: Tue, 16 Jul 2019 07:37:36 +0000
Message-ID: <54a42001-e741-3c4f-ba99-6b5e270099cf@suse.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
In-Reply-To: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:6:1::26)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac9f597d-d410-421b-bcff-08d709c078ca
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2667; 
x-ms-traffictypediagnostic: DM6PR18MB2667:
x-microsoft-antispam-prvs: <DM6PR18MB26678CE4AD35557085E89657B3CE0@DM6PR18MB2667.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(189003)(199004)(6436002)(102836004)(5640700003)(8676002)(53936002)(6506007)(4326008)(386003)(6512007)(7736002)(186003)(6116002)(6486002)(305945005)(52116002)(2906002)(66066001)(11346002)(81166006)(2616005)(8936002)(316002)(476003)(3846002)(66476007)(446003)(76176011)(2351001)(99286004)(26005)(81156014)(31686004)(68736007)(6916009)(256004)(14444005)(14454004)(486006)(71190400001)(478600001)(71200400001)(31696002)(5660300002)(86362001)(80792005)(2501003)(54906003)(36756003)(25786009)(64756008)(66556008)(66946007)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2667;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lOj288oP1WxT1FgfdD5W3Fi7pt+ocLALD2FUj7WhgpTL3b0u6D5yKiNcrxnkA99TUa2tbh5cMwwwqcRVrfAeSXhUNUt7QLiLKxeXL+cm72X2vuoiTqXdeM70obx30WXva9lMU4qojLprnMLrBO6eVVBex/NR3aHFjJ/6LkL4PiLvP9W2VYcj1Atr74MZeiww2omN67yN7+vvAQBm/B9eQWwbfLeQF+Ytxu4rx6y666ycdMRw1n77yj+2863+UtdLOkzvv1qtOngTY7xvqITK1Y0YXozT9Qna2jKH5Z3w4PHPf6lFcNq1EBohMK7Si94T6HyOm8SHIbvT4lkGFpuG8ZyvdwXfVg8YEPHEQroahGl65+T6++Ep/c72rgZFclGKu3YvQedQrMRui80OjRy0sluVPXcG9MXadOXFeMZnYOk=
Content-ID: <845375980D633340BB37EF8F1F6F0B21@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9f597d-d410-421b-bcff-08d709c078ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 07:37:36.2197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2667
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 02/13] x86/IRQ: deal with move cleanup count
 state in fixup_irqs()
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

VGhlIGNsZWFudXAgSVBJIG1heSBnZXQgc2VudCBpbW1lZGlhdGVseSBiZWZvcmUgYSBDUFUgZ2V0
cyByZW1vdmVkIGZyb20NCnRoZSBvbmxpbmUgbWFwLiBJbiBzdWNoIGEgY2FzZSB0aGUgSVBJIHdv
dWxkIGdldCBoYW5kbGVkIG9uIHRoZSBDUFUNCmJlaW5nIG9mZmxpbmVkIG5vIGVhcmxpZXIgdGhh
biBpbiB0aGUgaW50ZXJydXB0cyBkaXNhYmxlZCB3aW5kb3cgYWZ0ZXINCmZpeHVwX2lycXMoKScg
bWFpbiBsb29wLiBUaGlzIGlzIHRvbyBsYXRlLCBob3dldmVyLCBiZWNhdXNlIGEgcG9zc2libGUN
CmFmZmluaXR5IGNoYW5nZSBtYXkgaW5jdXIgdGhlIG5lZWQgZm9yIHZlY3RvciBhc3NpZ25tZW50
LCB3aGljaCB3aWxsDQpmYWlsIHdoZW4gdGhlIElSUSdzIG1vdmUgY2xlYW51cCBjb3VudCBpcyBz
dGlsbCBub24temVyby4NCg0KVG8gZml4IHRoaXMNCi0gcmVjb3JkIHRoZSBzZXQgb2YgQ1BVcyB0
aGUgY2xlYW51cCBJUElzIGdldHMgYWN0dWFsbHkgc2VudCB0byBhbG9uZ3NpZGUNCiAgIHNldHRp
bmcgdGhlaXIgY291bnQsDQotIGFkanVzdCB0aGUgY291bnQgaW4gZml4dXBfaXJxcygpLCBhY2Nv
dW50aW5nIGZvciBhbGwgQ1BVcyB0aGF0IHRoZQ0KICAgY2xlYW51cCBJUEkgd2FzIHNlbnQgdG8s
IGJ1dCB0aGF0IGFyZSBubyBsb25nZXIgb25saW5lLA0KLSBiYWlsIGVhcmx5IGZyb20gdGhlIGNs
ZWFudXAgSVBJIGhhbmRsZXIgd2hlbiB0aGUgQ1BVIGlzIG5vIGxvbmdlcg0KICAgb25saW5lLCB0
byBwcmV2ZW50IGRvdWJsZSBhY2NvdW50aW5nLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+DQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCg0KLS0tIGEveGVuL2FyY2gveDg2L2lycS5jDQorKysgYi94ZW4vYXJj
aC94ODYvaXJxLmMNCkBAIC02NzUsNiArNjc1LDkgQEAgdm9pZCBpcnFfbW92ZV9jbGVhbnVwX2lu
dGVycnVwdChzdHJ1Y3QgYw0KICAgICAgYWNrX0FQSUNfaXJxKCk7DQogIA0KICAgICAgbWUgPSBz
bXBfcHJvY2Vzc29yX2lkKCk7DQorICAgIGlmICggIWNwdV9vbmxpbmUobWUpICkNCisgICAgICAg
IHJldHVybjsNCisNCiAgICAgIGZvciAoIHZlY3RvciA9IEZJUlNUX0RZTkFNSUNfVkVDVE9SOw0K
ICAgICAgICAgICAgdmVjdG9yIDw9IExBU1RfSElQUklPUklUWV9WRUNUT1I7IHZlY3RvcisrKQ0K
ICAgICAgew0KQEAgLTczNSwxMSArNzM4LDE0IEBAIHVubG9jazoNCiAgDQogIHN0YXRpYyB2b2lk
IHNlbmRfY2xlYW51cF92ZWN0b3Ioc3RydWN0IGlycV9kZXNjICpkZXNjKQ0KICB7DQotICAgIGNw
dW1hc2tfdCBjbGVhbnVwX21hc2s7DQorICAgIGNwdW1hc2tfYW5kKGRlc2MtPmFyY2gub2xkX2Nw
dV9tYXNrLCBkZXNjLT5hcmNoLm9sZF9jcHVfbWFzaywNCisgICAgICAgICAgICAgICAgJmNwdV9v
bmxpbmVfbWFwKTsNCisgICAgZGVzYy0+YXJjaC5tb3ZlX2NsZWFudXBfY291bnQgPSBjcHVtYXNr
X3dlaWdodChkZXNjLT5hcmNoLm9sZF9jcHVfbWFzayk7DQogIA0KLSAgICBjcHVtYXNrX2FuZCgm
Y2xlYW51cF9tYXNrLCBkZXNjLT5hcmNoLm9sZF9jcHVfbWFzaywgJmNwdV9vbmxpbmVfbWFwKTsN
Ci0gICAgZGVzYy0+YXJjaC5tb3ZlX2NsZWFudXBfY291bnQgPSBjcHVtYXNrX3dlaWdodCgmY2xl
YW51cF9tYXNrKTsNCi0gICAgc2VuZF9JUElfbWFzaygmY2xlYW51cF9tYXNrLCBJUlFfTU9WRV9D
TEVBTlVQX1ZFQ1RPUik7DQorICAgIGlmICggZGVzYy0+YXJjaC5tb3ZlX2NsZWFudXBfY291bnQg
KQ0KKyAgICAgICAgc2VuZF9JUElfbWFzayhkZXNjLT5hcmNoLm9sZF9jcHVfbWFzaywgSVJRX01P
VkVfQ0xFQU5VUF9WRUNUT1IpOw0KKyAgICBlbHNlDQorICAgICAgICByZWxlYXNlX29sZF92ZWMo
ZGVzYyk7DQogIA0KICAgICAgZGVzYy0+YXJjaC5tb3ZlX2luX3Byb2dyZXNzID0gMDsNCiAgfQ0K
QEAgLTI0MTksNiArMjQyNSwxNiBAQCB2b2lkIGZpeHVwX2lycXMoY29uc3QgY3B1bWFza190ICpt
YXNrLCBiDQogICAgICAgICAgICAgICB2ZWN0b3IgPD0gTEFTVF9ISVBSSU9SSVRZX1ZFQ1RPUiAp
DQogICAgICAgICAgICAgIGNwdW1hc2tfYW5kKGRlc2MtPmFyY2guY3B1X21hc2ssIGRlc2MtPmFy
Y2guY3B1X21hc2ssIG1hc2spOw0KICANCisgICAgICAgIGlmICggZGVzYy0+YXJjaC5tb3ZlX2Ns
ZWFudXBfY291bnQgKQ0KKyAgICAgICAgew0KKyAgICAgICAgICAgIC8qIFRoZSBjbGVhbnVwIElQ
SSBtYXkgaGF2ZSBnb3Qgc2VudCB3aGlsZSB3ZSB3ZXJlIHN0aWxsIG9ubGluZS4gKi8NCisgICAg
ICAgICAgICBjcHVtYXNrX2FuZG5vdCgmYWZmaW5pdHksIGRlc2MtPmFyY2gub2xkX2NwdV9tYXNr
LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICZjcHVfb25saW5lX21hcCk7DQorICAgICAg
ICAgICAgZGVzYy0+YXJjaC5tb3ZlX2NsZWFudXBfY291bnQgLT0gY3B1bWFza193ZWlnaHQoJmFm
ZmluaXR5KTsNCisgICAgICAgICAgICBpZiAoICFkZXNjLT5hcmNoLm1vdmVfY2xlYW51cF9jb3Vu
dCApDQorICAgICAgICAgICAgICAgIHJlbGVhc2Vfb2xkX3ZlYyhkZXNjKTsNCisgICAgICAgIH0N
CisNCiAgICAgICAgICBjcHVtYXNrX2NvcHkoJmFmZmluaXR5LCBkZXNjLT5hZmZpbml0eSk7DQog
ICAgICAgICAgaWYgKCAhZGVzYy0+YWN0aW9uIHx8IGNwdW1hc2tfc3Vic2V0KCZhZmZpbml0eSwg
bWFzaykgKQ0KICAgICAgICAgIHsNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
