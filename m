Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A18E73259
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 16:58:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqIgO-00028H-1c; Wed, 24 Jul 2019 14:55:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqIgM-000287-C5
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 14:55:54 +0000
X-Inumbo-ID: 1b400567-ae23-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1b400567-ae23-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 14:55:52 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 14:55:38 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 14:47:21 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 14:47:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5ckIU+SvH0lIChals/MvXgSB/MZ6lntGYTl29qoE8s22fMSi4CxmOiWtrIkimef8TJQXTYO3bv6/c1Z7mwLjnmsV3OAxy33jjwTnJgrc+rcNos92pzvgMzxRhkRTDH+5hyhKu31TB6AQzeXlUWP1/7PRIFUWf+6Z4fqAWf9FDW0QQRDMYl5aAqD+wOQCBeuIKZVf+G2cNoSTmoVKQRQFCv0ec/EN78LVpL7DXnAvojJxsem5atErksVykmshenjJvIMkm7crU72uEhfqw2+8SE4zO/2rMfJZX+8C/134o1oLMdlea4vYVNOl9g374T5sgJdygDedjynpu8Oh0fnCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogKDJTVgPo1eZ0Wf2g970RLw7pDtE7D5XJ06yKVT0kI=;
 b=UetR7Po1m4jfO9GPKtiRd1GyIWN8vCvk2eJVRt1dGghdQdG+4bVCwKPVKxRJlzYykZYOiyqTD4k3Uw2q9cfPxkwfVoqUYKhgZmRXwhWnsd/L0bwv5O5RU0OouNdAVIj2pAjFE5zwVMI4C5Uds2HIiJLwxO1oBFW4DVZerB/lFJ8MKKGZ2tmcVVYXm+3njpWi90YuJkA4sI+MqvvQPJ4FG7LUuW7AVvu/y6/PlEule6D0YsJzAWY13+w0QzZTU7mB+acMDKtN4mkdYurLfvZaAWQjMsdHsdzKk0UWTeu1QHF/ZSTmGN3NZTjOJHNHYar/U5rf4IwX9q5hANTDiTvlng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3171.namprd18.prod.outlook.com (10.255.137.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 14:47:19 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 14:47:19 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Fredy P.
 <fredy.pulido@savoirfairelinux.com>
Thread-Topic: [Xen-devel] CPU frequency throttling based on the temperature
Thread-Index: AQHVQiidALk+x0uDw0GmzsE7VlPwJabZ1pPngAACeAA=
Date: Wed, 24 Jul 2019 14:47:19 +0000
Message-ID: <1f653322-5d4d-5393-5790-c63b07492050@suse.com>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
In-Reply-To: <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0432.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::36) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43d26af1-e0c0-4abd-55c9-08d71045d3e6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3171; 
x-ms-traffictypediagnostic: BY5PR18MB3171:
x-microsoft-antispam-prvs: <BY5PR18MB3171CAF38E8F499FF52DA383B3C60@BY5PR18MB3171.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(52314003)(189003)(199004)(66476007)(8936002)(53546011)(64756008)(6506007)(53936002)(6436002)(66446008)(66556008)(386003)(31686004)(99286004)(76176011)(6486002)(71200400001)(71190400001)(66946007)(86362001)(229853002)(305945005)(5660300002)(6512007)(68736007)(80792005)(25786009)(31696002)(6246003)(14454004)(2906002)(36756003)(102836004)(7736002)(52116002)(316002)(26005)(11346002)(446003)(478600001)(81166006)(256004)(6116002)(110136005)(81156014)(66066001)(4326008)(476003)(8676002)(186003)(2616005)(486006)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3171;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Lx6xmrqcjCpIcMFCgsxPXVtw+HX4VAZsXUNXFar60dbOCvmx1ztz/Rs+wg8Q8LYlAGNBu45XKe86VR4ZEiLu5zyF0Rx9ZFF+TMniJVw+dSjBbT4wJNXH4qX9zw4XY6hHeW6dn3miXhwSFmLRggifflxdVA8C+cYXTFpw+eIwEM/5FRk8lBiioaj0cZMs/WL5ulwg6Mfja2T3R2QrXubyoAQfa33qOLvLSNj3BUEfQz/plosWQXRsBiqtME7hQgPuJf7LxPqpaNfwu8P0VGW1w+lZ1rmTxYfgvwhpeKZ7yJK/kzlMQ4Lx4BZWadcQ8n+fFUmwV+xMnioAyjGT/mLPv2X8qg/AJpIw27C4nKu7wah4l0/Og98SQo9IgpvGtsbjUzZBrhMawN+L+ndtG6A+J2HjyUmpIn535L8wQWHIveY=
Content-ID: <DA16431B06F19248BA114E2853F46C8C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d26af1-e0c0-4abd-55c9-08d71045d3e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 14:47:19.1509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3171
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] CPU frequency throttling based on the temperature
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDcuMjAxOSAxNjozNiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFdlZCwg
SnVsIDI0LCAyMDE5IGF0IDEwOjAxOjQwQU0gLTA0MDAsIEZyZWR5IFAuIHdyb3RlOg0KPj4gTXkg
b2JqZWN0aXZlIGlzIHRvIGdldCBDUFUgZnJlcXVlbmN5IHRocm90dGxpbmcgYmFzZWQgb24gdGhl
DQo+PiB0ZW1wZXJhdHVyZSBpbiBhIFhlbi9PcGVuV1JUKGRvbTApIHN5c3RlbS4NCj4+DQo+PiBB
ZnRlciB0byBleHBlbmQgaG91cnMgcmVhZGluZyBYZW4ncyB3aWtpLCBtYWlsaW5nIGxpc3QgYXJj
aGl2ZXMsDQo+PiBjb21taXRzLCBnb29nbGluZyBhbmQgYXNraW5nIGluIHRoZSBJUkMgY2hhbm5l
bCBJJ20gY29taW5nIGhlcmUgYXNraW5nDQo+PiBmb3IgaGVscCBiZWNhdXNlIEkgaG9wZSB0aGVy
ZSBpcyBzb21ldGhpbmcgSSBtaXNzIGFuZCB5b3UgY291bGQgcG9pbnQNCj4+IGl0Lg0KPiANCj4g
VGhhdCBzZWVtcyBsaWtlIGFuIGludGVyZXN0aW5nIHByb2plY3QsIEkgZ3Vlc3MgeW91ciBmb2N1
cyBpcyBzb21lDQo+IGtpbmQgb2YgbG93LXBvd2VyIGRldmljZT8gKG5vdCB0aGF0IGl0IG1hdHRl
cnMgbXVjaCBmb3IgdGhlIGNvbnRleHQgb2YNCj4gdGhlIHF1ZXN0aW9uKS4NCj4gDQo+IEFueXdh
eSwgdGhhbmtzIGZvciB5b3VyIGludGVyZXN0IG9uIFhlbiBhbmQgd2F5cyB0byBpbXByb3ZlIGl0
IQ0KPiANCj4+IE15IGZpcnN0IHF1ZXN0aW9uIGlzLCB0aGVyZSBpcyBhbnkgd2F5IHRvIGRvIENQ
VSBmcmVxdWVuY3kgdGhyb3R0bGluZw0KPj4gYmFzZWQgb24gdGhlIHRlbXBlcmF0dXJlPw0KPiAN
Cj4gSSBkb24ndCB0aGluayB0aGVyZSdzIHN1Y2ggZ292ZXJub3IgQVRNIGltcGxlbWVudGVkIGlu
IFhlbiwgdGhlIG1vcmUNCj4gdGhhdCBJIHRoaW5rIGFsbCBmcmVxdWVuY3kgdGhyb3R0bGluZyBp
cyBzdXBwb3NlZCB0byBiZSBkb25lIGJ5IGRvbTANCj4gdXNpbmcgeGVucG0sIGJ1dCBub3QgWGVu
IGl0c2VsZj8NCg0KVGhlIG9yaWdpbmFsIGF1dGhvcnMgb2YgUC0gYW5kIEMtc3RhdGUgaGFuZGxp
bmcgbG9vayB0byBoYXZlDQphc3N1bWVkIHRoYXQgVC1zdGF0ZSBoYW5kbGluZyBzaG91bGQgd29y
ayBzaW1pbGFybHksIGkuZS4gYnkNCkRvbTAgdXBsb2FkaW5nIHJlbGV2YW50IGRhdGEuIFNlZSBw
dWJsaWMvcGxhdGZvcm0uaCBzdGFydGluZyBhdA0KDQojZGVmaW5lIFhFTlBGX3NldF9wcm9jZXNz
b3JfcG1pbmZvICAgICAgNTQNCg0Kd2hlcmUgaW4gcGFydGljdWxhciB5b3UnbGwgZmluZA0KDQoj
ZGVmaW5lIFhFTl9QTV9UWCAgIDINCg0KQWRkaXRpb25hbGx5ICJkb25lIGJ5IGRvbTAgdXNpbmcg
eGVucG0iIHN0aWxsIG1lYW5zIFhlbiBjYXJyeWluZw0Kb3V0IHRoZSBhY3R1YWwgb3BlcmF0aW9u
LiBBbmQgeGVucG0gb2YgY291cnNlIGlzIG9ubHkgYW4NCmF1eGlsaWFyeSB0b29sIGJ5IHdoaWNo
IGFuIGFkbWluIGNhbiBpbmZsdWVuY2Ugb3ZlcmFsbCBiZWhhdmlvciwNCml0IGRvZXNuJ3QgcmVw
bGFjZSBhIHByb3BlciBnb3Zlcm5vci4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
