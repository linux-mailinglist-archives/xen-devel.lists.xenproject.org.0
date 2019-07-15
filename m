Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CE26964F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 17:04:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn2Ug-0007y5-C9; Mon, 15 Jul 2019 15:02:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hn2Uf-0007xw-DC
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 15:02:21 +0000
X-Inumbo-ID: 8a603730-a711-11e9-9072-db243e2e6cba
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a603730-a711-11e9-9072-db243e2e6cba;
 Mon, 15 Jul 2019 15:02:19 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 15:02:16 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 15:00:41 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 15:00:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiI52cGfI3cP8/VdyigypzkHY5sjXuxWcpVn1nh3gYquWrbfculYAbjj34Lhgz6IRNJt7OlqiSRTyB3RM/dvOVcqwrCeOJak2uTP0U+mHo051gRLTb8cUtSlYIqVpeTt/oQYM2UOFJIsnl/myv6O/ZRum8cPl8Upx3YnN/T7JhSkQ/3aOuzVE4Y6x0GE9dIjWHgt9sP5awJQK+oVFveGCoGtieLa+ks7G89TJYOJcY6wPTbfQq4sopLfLuz6hQqw2BBpInEnZQaSLvPFVkPVC7zcP4asEdla9LB38c3tei7bOZTO381jQvhDOfhKAcr/PREh9EhvInfJEhWoeD35QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUUSs4hO/I1VqoM1938k8FBeM59LlV/DoUjLRcNzEY4=;
 b=RBwXTfa7mtC12E1azAGUbHH8ZMj8O6vPGaXqXIXfyMJCKQJ4lVLW6boHReALQots/oFa1IygQyFTOz/s2EWkfL81x8AJJNx/4JbcROuTbVbskQk7+GzT1fmXiPKKcmiOg9rWEKIaXOGcch7zdtwaTXI9CkORFQKVX/36DZCbM6d/Xhq6BeKbTVw21UjFSP9Ru31O7y6Oj+NCj3GcBdvU2JpPZEBN7e8FdCIov0VDh28P1gOwLmEkxNk2ZLdWUlxpRvpjPCv/ZU6EmkdrcL03cXPiOTlxuSr0zsPi8cx3X/w1tSaJOkghMJ/JiBf/sVF/opr6jKWenxoHoK59d+oZ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3273.namprd18.prod.outlook.com (10.255.173.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 15:00:39 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 15:00:39 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 1/2] x86/traps: guard top-of-stack reads
Thread-Index: AQHVOx4Q9IEYs8wHZ02rzC92a0citA==
Date: Mon, 15 Jul 2019 15:00:39 +0000
Message-ID: <92120cfd-0b0b-0152-5296-9c6889d21687@suse.com>
References: <48d6972c-c15a-6f74-1726-ff4154f04c4d@suse.com>
In-Reply-To: <48d6972c-c15a-6f74-1726-ff4154f04c4d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0301CA0027.eurprd03.prod.outlook.com
 (2603:10a6:4:3e::37) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0256eb8d-5ff9-4c4c-6885-08d709353338
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB3273; 
x-ms-traffictypediagnostic: DM6PR18MB3273:
x-microsoft-antispam-prvs: <DM6PR18MB32736913385D51CFF49E5D08B3CF0@DM6PR18MB3273.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(199004)(189003)(446003)(2616005)(186003)(11346002)(31686004)(5640700003)(6486002)(26005)(14454004)(6512007)(81166006)(80792005)(81156014)(102836004)(5024004)(31696002)(36756003)(486006)(66066001)(54906003)(6436002)(476003)(256004)(53936002)(2906002)(316002)(76176011)(52116002)(386003)(6506007)(2351001)(6916009)(7736002)(5660300002)(2501003)(68736007)(66446008)(64756008)(99286004)(66556008)(305945005)(4326008)(25786009)(3846002)(71200400001)(71190400001)(478600001)(66946007)(66476007)(6116002)(8936002)(8676002)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3273;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mMLShOfbfPJDrcVwySxuqEnpC1+iNiGWo22B1JqiKbAL0esoen+cWIoT0EU+gL7DkFVwcECM7sWSifB78hCDfblIg2f/B2H9Bc2TzwZF5IBBc9ZrydylGVq6UZO4geDGRHzJnyvm+hmT+WZa4LRYk/tZHJAwnxo+ts3tcDaHU2dkQzeHyeJ/Moluaq11evpNctbiNVY0EhUkMzS91dW3quIf3lwHGgXnjV0jy4WuolyWQV4mnkL91D/FRCQpuBFaNKbAq8latYnIo6tpFU1HOSaSkEkCsusAEejAQYfdDngGVt4NjOVPJ4ZCToaTt35JltXLSIQNrO2pwzulAA0Kes+n+xnHOymId1FpbChtfZQKNK5ACZtxtmifSoJLzJxboZFJd1KKhBM8Yo/WTY+QLk4u4zkyDa/lIo88+m8vCtM=
Content-ID: <C5FF68C491630241840E2181908C1EC9@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0256eb8d-5ff9-4c4c-6885-08d709353338
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 15:00:39.5065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3273
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v3 1/2] x86/traps: guard top-of-stack reads
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

Tm90aGluZyBndWFyYW50ZWVzIHRoYXQgdGhlIG9yaWdpbmFsIGZyYW1lJ3Mgc3RhY2sgcG9pbnRl
ciBwb2ludHMgYXQNCnJlYWRhYmxlIG1lbW9yeS4gQXZvaWQgYSAobGlrZWx5IG5lc3RlZCkgY3Jh
c2ggYnkgYXR0YWNoaW5nIGV4Y2VwdGlvbg0KcmVjb3ZlcnkgdG8gdGhlIHJlYWQgKG1ha2luZyBp
dCBhIHNpbmdsZSByZWFkIGF0IHRoZSBzYW1lIHRpbWUpLiBEb24ndA0KZXZlbiBpbnZva2UgX3No
b3dfdHJhY2UoKSBpbiBjYXNlIG9mIGEgbm9uLXJlYWRhYmxlIHRvcCBzbG90Lg0KDQpTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpSZXZpZXdlZC1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCi0tLQ0KdjI6IE5hbWUgYXNt
KCkgYXJndW1lbnRzLiBVc2UgZXhwbGljaXQgImZhdWx0IiB2YXJpYWJsZS4NCg0KLS0tIGEveGVu
L2FyY2gveDg2L3RyYXBzLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jDQpAQCAtNDg2LDE3
ICs0ODYsMzEgQEAgc3RhdGljIHZvaWQgX3Nob3dfdHJhY2UodW5zaWduZWQgbG9uZyBzcA0KICAN
CiAgc3RhdGljIHZvaWQgc2hvd190cmFjZShjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVn
cykNCiAgew0KLSAgICB1bnNpZ25lZCBsb25nICpzcCA9IEVTUF9CRUZPUkVfRVhDRVBUSU9OKHJl
Z3MpOw0KKyAgICB1bnNpZ25lZCBsb25nICpzcCA9IEVTUF9CRUZPUkVfRVhDRVBUSU9OKHJlZ3Mp
LCB0b3MgPSAwOw0KKyAgICBib29sIGZhdWx0ID0gZmFsc2U7DQogIA0KICAgICAgcHJpbnRrKCJY
ZW4gY2FsbCB0cmFjZTpcbiIpOw0KICANCisgICAgLyogR3VhcmRlZCByZWFkIG9mIHRoZSBzdGFj
ayB0b3AuICovDQorICAgIGFzbSAoICIxOiBtb3YgJVtkYXRhXSwgJVt0b3NdOyAyOlxuIg0KKyAg
ICAgICAgICAiLnB1c2hzZWN0aW9uIC5maXh1cCxcImF4XCJcbiINCisgICAgICAgICAgIjM6IG1v
dmIgJDEsICVbZmF1bHRdOyBqbXAgMmJcbiINCisgICAgICAgICAgIi5wb3BzZWN0aW9uXG4iDQor
ICAgICAgICAgIF9BU01fRVhUQUJMRSgxYiwgM2IpDQorICAgICAgICAgIDogW3Rvc10gIityIiAo
dG9zKSwgW2ZhdWx0XSAiK3FtIiAoZmF1bHQpIDogW2RhdGFdICJtIiAoKnNwKSApOw0KKw0KICAg
ICAgLyoNCiAgICAgICAqIElmIFJJUCBsb29rcyBzZW5zaWJsZSwgb3IgdGhlIHRvcCBvZiB0aGUg
c3RhY2sgZG9lc24ndCwgcHJpbnQgUklQIGF0DQogICAgICAgKiB0aGUgdG9wIG9mIHRoZSBzdGFj
ayB0cmFjZS4NCiAgICAgICAqLw0KICAgICAgaWYgKCBpc19hY3RpdmVfa2VybmVsX3RleHQocmVn
cy0+cmlwKSB8fA0KLSAgICAgICAgICFpc19hY3RpdmVfa2VybmVsX3RleHQoKnNwKSApDQorICAg
ICAgICAgIWlzX2FjdGl2ZV9rZXJuZWxfdGV4dCh0b3MpICkNCiAgICAgICAgICBwcmludGsoIiAg
IFs8JXA+XSAlcFNcbiIsIF9wKHJlZ3MtPnJpcCksIF9wKHJlZ3MtPnJpcCkpOw0KKyAgICBlbHNl
IGlmICggZmF1bHQgKQ0KKyAgICB7DQorICAgICAgICBwcmludGsoIiAgIFtGYXVsdCBvbiBhY2Nl
c3NdXG4iKTsNCisgICAgICAgIHJldHVybjsNCisgICAgfQ0KICAgICAgLyoNCiAgICAgICAqIEVs
c2UgUklQIGxvb2tzIGJhZCBidXQgdGhlIHRvcCBvZiB0aGUgc3RhY2sgbG9va3MgZ29vZC4gIFBl
cmhhcHMgd2UNCiAgICAgICAqIGZvbGxvd2VkIGEgd2lsZCBmdW5jdGlvbiBwb2ludGVyPyBMZXRz
IGFzc3VtZSB0aGUgdG9wIG9mIHRoZSBzdGFjayBpcyBhDQpAQCAtNTA1LDcgKzUxOSw3IEBAIHN0
YXRpYyB2b2lkIHNob3dfdHJhY2UoY29uc3Qgc3RydWN0IGNwdV8NCiAgICAgICAqLw0KICAgICAg
ZWxzZQ0KICAgICAgew0KLSAgICAgICAgcHJpbnRrKCIgICBbPCVwPl0gJXBTXG4iLCBfcCgqc3Ap
LCBfcCgqc3ApKTsNCisgICAgICAgIHByaW50aygiICAgWzwlcD5dICVwU1xuIiwgX3AodG9zKSwg
X3AodG9zKSk7DQogICAgICAgICAgc3ArKzsNCiAgICAgIH0NCiAgDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
