Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759646A316
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 09:39:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnI1Y-0001Yt-Cv; Tue, 16 Jul 2019 07:37:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnI1X-0001Yo-5A
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 07:37:19 +0000
X-Inumbo-ID: 896103d3-a79c-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 896103d3-a79c-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 07:37:17 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 07:37:17 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 07:37:04 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 07:37:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZcj1s99Elkhn4RlaV5cbb1NDekNUg1YSz1XZ9yG7BIZATJFftfO/mKIs4EABw/6ciQFojY8ewv69hSVGNAotnMEqx+Hh5CiQ8Tw4VU9JA99VjlJrSqM3/R7+I0FBMMMUcykPotL1PkHeiY2JltaxZqprykL9NK0iet+VxD3p4T74mMGXe1GzXXt35getLVojEPMJmBMqs1k6jNsEA/97cSlKLl6HZ+UQeETJ8+uFdgwO+c6a5mON28+CveUoRHDaCPhMNcYk5cxXrFvSyi3214DUFAmEz9bOk6fT0l3Qj19eskv0HRPtd3wPq7sVS6n3M6Iqi5s1IFhGkCga6rJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBaV6+QYMIjSjouzjXOoqSe+yig3keAv8N89JGSor8Y=;
 b=XgxkDZslkH7MlTlhC4a2Y73/LzNZ1z2JEt1ZblzTO8Vc3DaK4mKtT9cjzwUl2Wbxz3r3inzY678MgMdJCU09du0IL6H0Wj07TZuyzQpBuqDn6IwRAA2AD9YyHU0DB2uwQx0hrOssxxyFHw3b7kNWyJJUGVexB++r45dWnHTiMhJZMBBBLYex7MaCrZElscoR+8H1wdDzG1gRAYysZ/JPRjfA1feTm23QdXXO8gzRbBfJl0h0+VPDNLLfi2383HD/rLkNgU8Cf+OlFq3ifMHMf3HsYADR4ENyKuf6Q3W92ptXkku0C/BGirIj76B+DuVrZXRcoAHOKNfN6Ei4E+hnQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6SPR01MB0052.namprd18.prod.outlook.com (20.178.229.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Tue, 16 Jul 2019 07:37:03 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 07:37:03 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 01/13] x86/IRQ: deal with move-in-progress state in
 fixup_irqs()
Thread-Index: AQHVO6lCxbMQu2mXuE+5o0875H2ReQ==
Date: Tue, 16 Jul 2019 07:37:02 +0000
Message-ID: <7d7524aa-cdef-ccc0-24c7-4722e0b031ab@suse.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
In-Reply-To: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0371.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::23) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12a7a776-529d-45d9-bf76-08d709c064e4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6SPR01MB0052; 
x-ms-traffictypediagnostic: DM6SPR01MB0052:
x-microsoft-antispam-prvs: <DM6SPR01MB0052CB4F3862C8BCA99231A4B3CE0@DM6SPR01MB0052.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(199004)(189003)(66446008)(7736002)(4326008)(256004)(316002)(2501003)(53936002)(6512007)(71200400001)(99286004)(5660300002)(6916009)(36756003)(14444005)(5640700003)(81166006)(81156014)(66476007)(66946007)(80792005)(64756008)(486006)(68736007)(8936002)(86362001)(52116002)(8676002)(446003)(25786009)(6436002)(6116002)(6486002)(3846002)(478600001)(31686004)(76176011)(66556008)(26005)(2351001)(305945005)(2906002)(71190400001)(54906003)(2616005)(66066001)(11346002)(476003)(6506007)(186003)(386003)(102836004)(14454004)(31696002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6SPR01MB0052;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mFMUZyiEMn523o5BOZ5qrAhLAeqAnOytFI/SgrjJsEM6YHjahiERMy0gB65F23WtJ1iwYZJix2DMg6qm+5OysJ/gRngagdTi/ywYSoTsO4W1CnSrGwctaeXqAYRFe6HmldfsVkvLhuq48x0j47OcWSU/dJUQsY9hemrrsgG38praVhGtW2zS8lw06I6t90EXGGKSFwBXzPBOTjGFPnh/sfl7YNH9Zfc9y2BMnULc1fBwq6LQNcZq1Ii5Ilwo1Hz3JjNiV4PIqVK4Tl/v25BoqHL9MRda7Ve3BDSn1a2HFatAyCFCGMGrxEOahRb04whhB88ICk2Qm62hWI2YQ9iOPCU61S/0K0+UEKyLLo9Y8YrO5CvgSjwg9oR7DaDL1+rTtXfL/ZvrD1R9a3wZr2ToM+6nGC/83hyYHUkYZVVC8is=
Content-ID: <E77448D00375CB42B215DD741878E36F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a7a776-529d-45d9-bf76-08d709c064e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 07:37:02.8427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6SPR01MB0052
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 01/13] x86/IRQ: deal with move-in-progress
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

VGhlIGZsYWcgYmVpbmcgc2V0IG1heSBwcmV2ZW50IGFmZmluaXR5IGNoYW5nZXMsIGFzIHRoZXNl
IG9mdGVuIGltcGx5DQphc3NpZ25tZW50IG9mIGEgbmV3IHZlY3Rvci4gV2hlbiB0aGVyZSdzIG5v
IHBvc3NpYmxlIGRlc3RpbmF0aW9uIGxlZnQNCmZvciB0aGUgSVJRLCB0aGUgY2xlYXJpbmcgb2Yg
dGhlIGZsYWcgbmVlZHMgdG8gaGFwcGVuIHJpZ2h0IGZyb20NCmZpeHVwX2lycXMoKS4NCg0KQWRk
aXRpb25hbGx5IF9hc3NpZ25faXJxX3ZlY3RvcigpIG5lZWRzIHRvIGF2b2lkIHNldHRpbmcgdGhl
IGZsYWcgd2hlbg0KdGhlcmUncyBubyBvbmxpbmUgQ1BVIGxlZnQgaW4gd2hhdCBnZXRzIHB1dCBp
bnRvIC0+YXJjaC5vbGRfY3B1X21hc2suDQpUaGUgb2xkIHZlY3RvciBjYW4gYmUgcmVsZWFzZWQg
cmlnaHQgYXdheSBpbiB0aGlzIGNhc2UuDQoNCkFsc28gZXh0ZW5kIHRoZSBsb2cgbWVzc2FnZSBh
Ym91dCBicm9rZW4gYWZmaW5pdHkgdG8gaW5jbHVkZSB0aGUgbmV3DQphZmZpbml0eSBhcyB3ZWxs
LCBhbGxvd2luZyB0byBub3RpY2UgaXNzdWVzIHdpdGggYWZmaW5pdHkgY2hhbmdlcyBub3QNCmFj
dHVhbGx5IGhhdmluZyB0YWtlbiBwbGFjZS4gU3dhcCB0aGUgaWYvZWxzZS1pZiBvcmRlciB0aGVy
ZSBhdCB0aGUNCnNhbWUgdGltZSB0byByZWR1Y2UgdGhlIGFtb3VudCBvZiBjb25kaXRpb25zIGNo
ZWNrZWQuDQoNCkF0IHRoZSBzYW1lIHRpbWUgcmVwbGFjZSB0d28gb3BlbiBjb2RlZCBpbnN0YW5j
ZXMgb2YgdGhlIG5ldyBoZWxwZXINCmZ1bmN0aW9uLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+DQotLS0NCnY0OiBVc2UgY3B1bWFza19iaXRzKCkgaW4gcHJp
bnRrKCkgaW52b2NhdGlvbi4gUmUtYmFzZS4NCnYzOiBNb3ZlIHJlbGVhc2Vfb2xkX3ZlYygpIGZ1
cnRoZXIgdXAgKHNvIGEgbGF0ZXIgcGF0Y2ggd29uJ3QgbmVlZCB0bykuDQogICAgIFJlLWJhc2Uu
DQp2MjogQWRkL3VzZSB2YWxpZF9pcnFfdmVjdG9yKCkuDQp2MWI6IEFsc28gdXBkYXRlIHZlY3Rv
cl9pcnFbXSBpbiB0aGUgY29kZSBhZGRlZCB0byBmaXh1cF9pcnFzKCkuDQoNCi0tLSBhL3hlbi9h
cmNoL3g4Ni9pcnEuYw0KKysrIGIveGVuL2FyY2gveDg2L2lycS5jDQpAQCAtOTksNiArOTksMjcg
QEAgdm9pZCB1bmxvY2tfdmVjdG9yX2xvY2sodm9pZCkNCiAgICAgIHNwaW5fdW5sb2NrKCZ2ZWN0
b3JfbG9jayk7DQogIH0NCiAgDQorc3RhdGljIGlubGluZSBib29sIHZhbGlkX2lycV92ZWN0b3Io
dW5zaWduZWQgaW50IHZlY3RvcikNCit7DQorICAgIHJldHVybiB2ZWN0b3IgPj0gRklSU1RfRFlO
QU1JQ19WRUNUT1IgJiYgdmVjdG9yIDw9IExBU1RfSElQUklPUklUWV9WRUNUT1I7DQorfQ0KKw0K
K3N0YXRpYyB2b2lkIHJlbGVhc2Vfb2xkX3ZlYyhzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpDQorew0K
KyAgICB1bnNpZ25lZCBpbnQgdmVjdG9yID0gZGVzYy0+YXJjaC5vbGRfdmVjdG9yOw0KKw0KKyAg
ICBkZXNjLT5hcmNoLm9sZF92ZWN0b3IgPSBJUlFfVkVDVE9SX1VOQVNTSUdORUQ7DQorICAgIGNw
dW1hc2tfY2xlYXIoZGVzYy0+YXJjaC5vbGRfY3B1X21hc2spOw0KKw0KKyAgICBpZiAoICF2YWxp
ZF9pcnFfdmVjdG9yKHZlY3RvcikgKQ0KKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQor
ICAgIGVsc2UgaWYgKCBkZXNjLT5hcmNoLnVzZWRfdmVjdG9ycyApDQorICAgIHsNCisgICAgICAg
IEFTU0VSVCh0ZXN0X2JpdCh2ZWN0b3IsIGRlc2MtPmFyY2gudXNlZF92ZWN0b3JzKSk7DQorICAg
ICAgICBjbGVhcl9iaXQodmVjdG9yLCBkZXNjLT5hcmNoLnVzZWRfdmVjdG9ycyk7DQorICAgIH0N
Cit9DQorDQogIHN0YXRpYyB2b2lkIF90cmFjZV9pcnFfbWFzayh1aW50MzJfdCBldmVudCwgaW50
IGlycSwgaW50IHZlY3RvciwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNw
dW1hc2tfdCAqbWFzaykNCiAgew0KQEAgLTI5NSwxNCArMzE2LDcgQEAgc3RhdGljIHZvaWQgX19j
bGVhcl9pcnFfdmVjdG9yKGludCBpcnEpDQogICAgICAgICAgcGVyX2NwdSh2ZWN0b3JfaXJxLCBj
cHUpW29sZF92ZWN0b3JdID0gfmlycTsNCiAgICAgIH0NCiAgDQotICAgIGRlc2MtPmFyY2gub2xk
X3ZlY3RvciA9IElSUV9WRUNUT1JfVU5BU1NJR05FRDsNCi0gICAgY3B1bWFza19jbGVhcihkZXNj
LT5hcmNoLm9sZF9jcHVfbWFzayk7DQotDQotICAgIGlmICggZGVzYy0+YXJjaC51c2VkX3ZlY3Rv
cnMgKQ0KLSAgICB7DQotICAgICAgICBBU1NFUlQodGVzdF9iaXQob2xkX3ZlY3RvciwgZGVzYy0+
YXJjaC51c2VkX3ZlY3RvcnMpKTsNCi0gICAgICAgIGNsZWFyX2JpdChvbGRfdmVjdG9yLCBkZXNj
LT5hcmNoLnVzZWRfdmVjdG9ycyk7DQotICAgIH0NCisgICAgcmVsZWFzZV9vbGRfdmVjKGRlc2Mp
Ow0KICANCiAgICAgIGRlc2MtPmFyY2gubW92ZV9pbl9wcm9ncmVzcyA9IDA7DQogIH0NCkBAIC01
MjcsMTIgKzU0MSwyMSBAQCBuZXh0Og0KICAgICAgICAgIC8qIEZvdW5kIG9uZSEgKi8NCiAgICAg
ICAgICBjdXJyZW50X3ZlY3RvciA9IHZlY3RvcjsNCiAgICAgICAgICBjdXJyZW50X29mZnNldCA9
IG9mZnNldDsNCi0gICAgICAgIGlmIChvbGRfdmVjdG9yID4gMCkgew0KLSAgICAgICAgICAgIGRl
c2MtPmFyY2gubW92ZV9pbl9wcm9ncmVzcyA9IDE7DQotICAgICAgICAgICAgY3B1bWFza19jb3B5
KGRlc2MtPmFyY2gub2xkX2NwdV9tYXNrLCBkZXNjLT5hcmNoLmNwdV9tYXNrKTsNCisNCisgICAg
ICAgIGlmICggb2xkX3ZlY3RvciA+IDAgKQ0KKyAgICAgICAgew0KKyAgICAgICAgICAgIGNwdW1h
c2tfYW5kKGRlc2MtPmFyY2gub2xkX2NwdV9tYXNrLCBkZXNjLT5hcmNoLmNwdV9tYXNrLA0KKyAg
ICAgICAgICAgICAgICAgICAgICAgICZjcHVfb25saW5lX21hcCk7DQogICAgICAgICAgICAgIGRl
c2MtPmFyY2gub2xkX3ZlY3RvciA9IGRlc2MtPmFyY2gudmVjdG9yOw0KKyAgICAgICAgICAgIGlm
ICggIWNwdW1hc2tfZW1wdHkoZGVzYy0+YXJjaC5vbGRfY3B1X21hc2spICkNCisgICAgICAgICAg
ICAgICAgZGVzYy0+YXJjaC5tb3ZlX2luX3Byb2dyZXNzID0gMTsNCisgICAgICAgICAgICBlbHNl
DQorICAgICAgICAgICAgICAgIC8qIFRoaXMgY2FuIGhhcHBlbiB3aGlsZSBvZmZsaW5pbmcgYSBD
UFUuICovDQorICAgICAgICAgICAgICAgIHJlbGVhc2Vfb2xkX3ZlYyhkZXNjKTsNCiAgICAgICAg
ICB9DQorDQogICAgICAgICAgdHJhY2VfaXJxX21hc2soVFJDX0hXX0lSUV9BU1NJR05fVkVDVE9S
LCBpcnEsIHZlY3RvciwgJnRtcF9tYXNrKTsNCisNCiAgICAgICAgICBmb3JfZWFjaF9jcHUobmV3
X2NwdSwgJnRtcF9tYXNrKQ0KICAgICAgICAgICAgICBwZXJfY3B1KHZlY3Rvcl9pcnEsIG5ld19j
cHUpW3ZlY3Rvcl0gPSBpcnE7DQogICAgICAgICAgZGVzYy0+YXJjaC52ZWN0b3IgPSB2ZWN0b3I7
DQpAQCAtNzAyLDE0ICs3MjUsOCBAQCB2b2lkIGlycV9tb3ZlX2NsZWFudXBfaW50ZXJydXB0KHN0
cnVjdCBjDQogIA0KICAgICAgICAgIGlmICggZGVzYy0+YXJjaC5tb3ZlX2NsZWFudXBfY291bnQg
PT0gMCApDQogICAgICAgICAgew0KLSAgICAgICAgICAgIGRlc2MtPmFyY2gub2xkX3ZlY3RvciA9
IElSUV9WRUNUT1JfVU5BU1NJR05FRDsNCi0gICAgICAgICAgICBjcHVtYXNrX2NsZWFyKGRlc2Mt
PmFyY2gub2xkX2NwdV9tYXNrKTsNCi0NCi0gICAgICAgICAgICBpZiAoIGRlc2MtPmFyY2gudXNl
ZF92ZWN0b3JzICkNCi0gICAgICAgICAgICB7DQotICAgICAgICAgICAgICAgIEFTU0VSVCh0ZXN0
X2JpdCh2ZWN0b3IsIGRlc2MtPmFyY2gudXNlZF92ZWN0b3JzKSk7DQotICAgICAgICAgICAgICAg
IGNsZWFyX2JpdCh2ZWN0b3IsIGRlc2MtPmFyY2gudXNlZF92ZWN0b3JzKTsNCi0gICAgICAgICAg
ICB9DQorICAgICAgICAgICAgQVNTRVJUKHZlY3RvciA9PSBkZXNjLT5hcmNoLm9sZF92ZWN0b3Ip
Ow0KKyAgICAgICAgICAgIHJlbGVhc2Vfb2xkX3ZlYyhkZXNjKTsNCiAgICAgICAgICB9DQogIHVu
bG9jazoNCiAgICAgICAgICBzcGluX3VubG9jaygmZGVzYy0+bG9jayk7DQpAQCAtMjQwOSw2ICsy
NDI2LDMzIEBAIHZvaWQgZml4dXBfaXJxcyhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGINCiAgICAg
ICAgICAgICAgY29udGludWU7DQogICAgICAgICAgfQ0KICANCisgICAgICAgIC8qDQorICAgICAg
ICAgKiBJbiBvcmRlciBmb3IgdGhlIGFmZmluaXR5IGFkanVzdG1lbnQgYmVsb3cgdG8gYmUgc3Vj
Y2Vzc2Z1bCwgd2UNCisgICAgICAgICAqIG5lZWQgX19hc3NpZ25faXJxX3ZlY3RvcigpIHRvIHN1
Y2NlZWQuIFRoaXMgaW4gcGFydGljdWxhciBtZWFucw0KKyAgICAgICAgICogY2xlYXJpbmcgZGVz
Yy0+YXJjaC5tb3ZlX2luX3Byb2dyZXNzIGlmIHRoaXMgd291bGQgb3RoZXJ3aXNlDQorICAgICAg
ICAgKiBwcmV2ZW50IHRoZSBmdW5jdGlvbiBmcm9tIHN1Y2NlZWRpbmcuIFNpbmNlIHRoZXJlJ3Mg
bm8gd2F5IGZvciB0aGUNCisgICAgICAgICAqIGZsYWcgdG8gZ2V0IGNsZWFyZWQgYW55bW9yZSB3
aGVuIHRoZXJlJ3Mgbm8gcG9zc2libGUgZGVzdGluYXRpb24NCisgICAgICAgICAqIGxlZnQgKHRo
ZSBvbmx5IHBvc3NpYmlsaXR5IHRoZW4gd291bGQgYmUgdGhlIElSUXMgZW5hYmxlZCB3aW5kb3cN
CisgICAgICAgICAqIGFmdGVyIHRoaXMgbG9vcCksIHRoZXJlJ3MgdGhlbiBhbHNvIG5vIHJhY2Ug
d2l0aCB1cyBkb2luZyBpdCBoZXJlLg0KKyAgICAgICAgICoNCisgICAgICAgICAqIFRoZXJlZm9y
ZSB0aGUgbG9naWMgaGVyZSBhbmQgdGhlcmUgbmVlZCB0byByZW1haW4gaW4gc3luYy4NCisgICAg
ICAgICAqLw0KKyAgICAgICAgaWYgKCBkZXNjLT5hcmNoLm1vdmVfaW5fcHJvZ3Jlc3MgJiYNCisg
ICAgICAgICAgICAgIWNwdW1hc2tfaW50ZXJzZWN0cyhtYXNrLCBkZXNjLT5hcmNoLmNwdV9tYXNr
KSApDQorICAgICAgICB7DQorICAgICAgICAgICAgdW5zaWduZWQgaW50IGNwdTsNCisNCisgICAg
ICAgICAgICBjcHVtYXNrX2FuZCgmYWZmaW5pdHksIGRlc2MtPmFyY2gub2xkX2NwdV9tYXNrLCAm
Y3B1X29ubGluZV9tYXApOw0KKw0KKyAgICAgICAgICAgIHNwaW5fbG9jaygmdmVjdG9yX2xvY2sp
Ow0KKyAgICAgICAgICAgIGZvcl9lYWNoX2NwdShjcHUsICZhZmZpbml0eSkNCisgICAgICAgICAg
ICAgICAgcGVyX2NwdSh2ZWN0b3JfaXJxLCBjcHUpW2Rlc2MtPmFyY2gub2xkX3ZlY3Rvcl0gPSB+
aXJxOw0KKyAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZ2ZWN0b3JfbG9jayk7DQorDQorICAgICAg
ICAgICAgcmVsZWFzZV9vbGRfdmVjKGRlc2MpOw0KKyAgICAgICAgICAgIGRlc2MtPmFyY2gubW92
ZV9pbl9wcm9ncmVzcyA9IDA7DQorICAgICAgICB9DQorDQogICAgICAgICAgY3B1bWFza19hbmQo
JmFmZmluaXR5LCAmYWZmaW5pdHksIG1hc2spOw0KICAgICAgICAgIGlmICggY3B1bWFza19lbXB0
eSgmYWZmaW5pdHkpICkNCiAgICAgICAgICB7DQpAQCAtMjQyNywxNSArMjQ3MSwxOCBAQCB2b2lk
IGZpeHVwX2lycXMoY29uc3QgY3B1bWFza190ICptYXNrLCBiDQogICAgICAgICAgaWYgKCBkZXNj
LT5oYW5kbGVyLT5lbmFibGUgKQ0KICAgICAgICAgICAgICBkZXNjLT5oYW5kbGVyLT5lbmFibGUo
ZGVzYyk7DQogIA0KKyAgICAgICAgY3B1bWFza19jb3B5KCZhZmZpbml0eSwgZGVzYy0+YWZmaW5p
dHkpOw0KKw0KICAgICAgICAgIHNwaW5fdW5sb2NrKCZkZXNjLT5sb2NrKTsNCiAgDQogICAgICAg
ICAgaWYgKCAhdmVyYm9zZSApDQogICAgICAgICAgICAgIGNvbnRpbnVlOw0KICANCi0gICAgICAg
IGlmICggYnJlYWtfYWZmaW5pdHkgJiYgc2V0X2FmZmluaXR5ICkNCi0gICAgICAgICAgICBwcmlu
dGsoIkJyb2tlIGFmZmluaXR5IGZvciBpcnEgJWlcbiIsIGlycSk7DQotICAgICAgICBlbHNlIGlm
ICggIXNldF9hZmZpbml0eSApDQotICAgICAgICAgICAgcHJpbnRrKCJDYW5ub3Qgc2V0IGFmZmlu
aXR5IGZvciBpcnEgJWlcbiIsIGlycSk7DQorICAgICAgICBpZiAoICFzZXRfYWZmaW5pdHkgKQ0K
KyAgICAgICAgICAgIHByaW50aygiQ2Fubm90IHNldCBhZmZpbml0eSBmb3IgSVJRJXVcbiIsIGly
cSk7DQorICAgICAgICBlbHNlIGlmICggYnJlYWtfYWZmaW5pdHkgKQ0KKyAgICAgICAgICAgIHBy
aW50aygiQnJva2UgYWZmaW5pdHkgZm9yIElSUSV1LCBuZXc6ICUqcGJcbiIsDQorICAgICAgICAg
ICAgICAgICAgIGlycSwgbnJfY3B1X2lkcywgY3B1bWFza19iaXRzKCZhZmZpbml0eSkpOw0KICAg
ICAgfQ0KICANCiAgICAgIC8qIFRoYXQgZG9lc24ndCBzZWVtIHN1ZmZpY2llbnQuICBHaXZlIGl0
IDFtcy4gKi8NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
