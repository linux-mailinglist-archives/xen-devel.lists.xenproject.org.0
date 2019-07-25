Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A9874BAC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:35:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqb3b-0001hW-B7; Thu, 25 Jul 2019 10:33:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqb3a-0001hR-4I
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:33:06 +0000
X-Inumbo-ID: 95a81dba-aec7-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 95a81dba-aec7-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 10:33:04 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 10:33:03 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 10:29:42 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 10:29:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfMsb+YL481KHfcusMBmsk6Fk0nbOYUa/cVGj2PlVIZlnu+ZWC4xIVT31uDN+laLLASThEyQ7/O3vahfneRXacRudw/0JI2J3AXMcDpwUsMa7O39s6OPUwXRQgj219BPsrQLQrQgFKhUFV3pfn54HAtk5IWI8vHbqoZEHNzwBqYxGtEaAHLdP4YncIS+nZCBNFoIO5fXY/cmLjP8q+pAO+3yTwk/CGWPf7Z6Y+Y1XYkgVx9LBTTftdBsyoAOiT564gPjxnqdo0k7YafeHHgObWIGAi0fK2/ww6KTAfCVt8E6fq0yfQR+9URjfnid7h6p7y2Z/hEdO14P443dBeM/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5EAAgUX3DJZl/hkfvE59RSRlNypwdyAxqbuNhma6A8=;
 b=P20WwkmYnrD/Ejvi6m/K+ExgBVqtyqB8XvWfz3z5/xsXE6bOvIppJiqYMtBoLRPrBhCE1yTdMtNnfLjtRF5q44UZ7dNP3blk/75C3SUMbd2Mo7xjzHmtotAqW3DL79MU493tLie41a4ZpIilnVQHEoMOp5UfTsnVNwfW7KtYUa24ku4Wopd4uiSdSSNd1DLDuQDrL+iksLpF7XuTN78eALwyabek/fV0Fmtdnoqe4jpnSNfWZpoMoPc5JSvuvBcl6smq1x6yQ5A1XYPbGjcf32Q8u7nsynEjspwJMfgbwAouYH3guv4za3lRedvtOwx24q72vO7pixqdPfosl1bYoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2985.namprd18.prod.outlook.com (20.179.48.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Thu, 25 Jul 2019 10:29:41 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 10:29:41 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH] x86: optimize loading of GDT at context switch
Thread-Index: AQHVQJCXlrwkqC0KdkuIf6brzf0OP6bbJpaA
Date: Thu, 25 Jul 2019 10:29:41 +0000
Message-ID: <8be991e5-8a8c-fe9f-b856-696ad46e76a2@suse.com>
References: <20190722132244.893-1-jgross@suse.com>
In-Reply-To: <20190722132244.893-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0307.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::31) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cefc477d-5750-4f64-4811-08d710eb0110
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2985; 
x-ms-traffictypediagnostic: DM6PR18MB2985:
x-microsoft-antispam-prvs: <DM6PR18MB29858FDA89A5EAA03244FCFDB3C10@DM6PR18MB2985.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(189003)(199004)(8676002)(6436002)(14454004)(6512007)(81166006)(2906002)(68736007)(81156014)(8936002)(3846002)(478600001)(6116002)(31686004)(7736002)(37006003)(54906003)(80792005)(36756003)(66066001)(6486002)(229853002)(6506007)(53546011)(6636002)(316002)(486006)(52116002)(99286004)(186003)(26005)(76176011)(66946007)(446003)(476003)(2616005)(11346002)(102836004)(31696002)(6246003)(386003)(6862004)(4326008)(71200400001)(71190400001)(66446008)(86362001)(305945005)(4744005)(256004)(14444005)(5660300002)(66476007)(66556008)(64756008)(53936002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2985;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g7+w3W1m+Dxnc+OUg9i4XZZzjdFbZpuoh1TeyN25DNdmPWYSYX3kZ9+Nn0cyPLsINeBWJT8ejQt3PzxQsnZcgdKh24GY1pSJNWQeuOTxBpx4aGvr0Cjyb3kJg8cSVilWyNB1iOXVIkCFNl8QHVms9PMYtQcUZtWsw8RNZe8rqRj8NO5v9Ccgb0HcyD7ekJIx86sDpKJAYTaIw4NB9j+udwoZQ0VtB15YkdB6sALot019Cb+D967q9izXkh43pzhXEjNB1wuoImky6G+EqLVDpGK1bI9Z2nVf11VTwzktlh9w8f7jXW1fwVC4pwQAq73896gv/a5BmWl8PqgvrrOJ6X1hnQuRsaxwwDbjN9XBn3hrs/8Z9N1+2836G6SkUhAjt8REHltTX178g7nHLo88+ZRNGhd1IiMys8KLlJP8Q1Q=
Content-ID: <225A028B41043744A6009E6CE6155792@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cefc477d-5750-4f64-4811-08d710eb0110
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 10:29:41.8836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2985
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86: optimize loading of GDT at context
 switch
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDcuMjAxOSAxNToyMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gQEAgLTc1Niw2ICs3
NTgsNyBAQCB2b2lkIGxvYWRfc3lzdGVtX3RhYmxlcyh2b2lkKQ0KPiAgIAkJb2Zmc2V0b2Yoc3Ry
dWN0IHRzc19zdHJ1Y3QsIF9fY2FjaGVsaW5lX2ZpbGxlcikgLSAxLA0KPiAgIAkJU1lTX0RFU0Nf
dHNzX2J1c3kpOw0KPiAgIA0KPiArICAgICAgICBwZXJfY3B1KGZ1bGxfZ2R0X2xvYWRlZCwgY3B1
KSA9IGZhbHNlOw0KPiAgIAlsZ2R0KCZnZHRyKTsNCj4gICAJbGlkdCgmaWR0cik7DQo+ICAgCWx0
cihUU1NfRU5UUlkgPDwgMyk7DQoNCkFzIHBlciB0aGUgc3Vycm91bmRpbmcgY29kZSB0aGVyZSBz
aG91bGQgYmUgYSBoYXJkIHRhYiB1c2VkIGZvcg0KaW5kZW50YXRpb24gaGVyZS4NCg0KPiBAQCAt
MTczOSw4ICsxNzQzLDcgQEAgc3RhdGljIHZvaWQgX19jb250ZXh0X3N3aXRjaCh2b2lkKQ0KPiAg
IA0KPiAgICAgICBpZiAoIG5lZWRfZnVsbF9nZHQobmQpICkNCj4gICAgICAgICAgIHVwZGF0ZV94
ZW5fc2xvdF9pbl9mdWxsX2dkdChuLCBjcHUpOw0KPiAtDQo+IC0gICAgaWYgKCBuZWVkX2Z1bGxf
Z2R0KHBkKSAmJg0KPiArICAgIGlmICggcGVyX2NwdShmdWxsX2dkdF9sb2FkZWQsIGNwdSkgJiYN
Cj4gICAgICAgICAgICAoKHAtPnZjcHVfaWQgIT0gbi0+dmNwdV9pZCkgfHwgIW5lZWRfZnVsbF9n
ZHQobmQpKSApDQo+ICAgICAgICAgICBsb2FkX2RlZmF1bHRfZ2R0KGNwdSk7DQoNCkkgdGhpbmsg
aXQgd291bGRuJ3QgYmUgYmFkIGlmIHRoZSBibGFuayBsaW5lIHdhcyBrZXB0Lg0KDQpJZiBJIGVu
ZCB1cCBjb21taXR0aW5nIHRoaXMsIEknbGwgdHJ5IHRvIHJlbWVtYmVyIHRvIGRvIGJvdGgNCmFk
anVzdG1lbnRzLCB1bmxlc3MgeW91IG9iamVjdCBmb3Igc29tZSByZWFzb24uDQoNCkphbg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
