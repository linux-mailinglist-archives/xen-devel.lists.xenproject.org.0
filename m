Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967D47BEBC
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 12:57:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsmH0-0007ir-1N; Wed, 31 Jul 2019 10:55:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UN8Z=V4=suse.com=jnwang@srs-us1.protection.inumbo.net>)
 id 1hsmGy-0007il-HN
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 10:55:56 +0000
X-Inumbo-ID: c446e808-b381-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c446e808-b381-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 10:55:55 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 31 Jul 2019 10:55:53 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 10:45:06 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 10:45:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxMyRObhz5qiyxQf4wRB+AQKQ/kSmCsIRqdsu/WVkoawpHqLuMMmphPujbZ1DMpe8UQ+SJKwvzMYrdpunSAXOOq6gglQN5FiiMYnkdotz0qsgnNkdEqRPgiSxXeyqp7FVWfoNb1h55roBmKweeZC90yP9msNqBYBxC9XIX0xDLMmkONx7bZCeOaSj8yqwuHJQk1s16wmtfiAptM7FEdm7VIJap+8cDZx4a1ghmuxQipqCpTC5fKQ/IphRIuEleR/ERCyzTnSAQwW/5rhn2QHsR3fmy1hgFbaMdG+9SYdWAZnVdEfIdEUm1DJGb+c5FWtpjLhg45TAQos9dwcYLGzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAwmBdKZwlpFtqfMPbJY7DqixeV7I1EL21rNS3BUx3k=;
 b=EiQeXrKi+7lIykBTTmf3aRL4l2ZhttnHKwXnnh1MdF4lGyjvXYwLCwVtnMenN/iulBXQE68p8t+GJhM4YT/0H7Vkm/3ibipYwBiUrlrxLHGlQDSzsV1JTlZ0LYx6WCgTm/jBh6ZDvLzoDe5ijz8YR0D3DZBMcwWCM1iisUOgOhLTT9VXWFpkVMcW46WQzC9BQmsptg8eUiZIzsZb7lLJvqWkCxHnbMuqVvfkPwIJDf9fpfPqGmhStWjze3UbXQK0Kpk2t96oASM6OHFJYTRNjIfgMotqFZrgCr8RyHzK/T2LELD69dylNfw9RlY2xcT5N39Yb6yeFdZMuSiY9yOkdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3170.namprd18.prod.outlook.com (10.255.137.144) by
 BY5PR18MB3362.namprd18.prod.outlook.com (10.255.154.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Wed, 31 Jul 2019 10:45:05 +0000
Received: from BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::ad30:31ad:5576:bb56]) by BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::ad30:31ad:5576:bb56%7]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 10:45:04 +0000
From: Jin Nan Wang <jnwang@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] Speculative mitigation facilities report wrong status
Thread-Index: AQHVR4KQFSckKXZUXUiKuIVTbtEfiqbkel97gAAQlQA=
Date: Wed, 31 Jul 2019 10:45:04 +0000
Message-ID: <fc364cdc-2399-0fb6-0bf0-cfa5fd58a117@suse.com>
References: <20190731092959.21655-1-jnwang@suse.com>
 <be5c8fcd-292f-c05e-a79b-5bb818cd05da@citrix.com>
In-Reply-To: <be5c8fcd-292f-c05e-a79b-5bb818cd05da@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR06CA0221.apcprd06.prod.outlook.com
 (2603:1096:4:68::29) To BY5PR18MB3170.namprd18.prod.outlook.com
 (2603:10b6:a03:1a9::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jnwang@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 319243f3-80d1-4fbf-3101-08d715a4255c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3362; 
x-ms-traffictypediagnostic: BY5PR18MB3362:
x-microsoft-antispam-prvs: <BY5PR18MB3362F3C668182873FCDC921ABEDF0@BY5PR18MB3362.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(199004)(189003)(53546011)(186003)(8936002)(36756003)(102836004)(8676002)(4326008)(26005)(81166006)(81156014)(66946007)(66066001)(52116002)(476003)(99286004)(25786009)(6506007)(31686004)(76176011)(7736002)(305945005)(11346002)(2616005)(486006)(446003)(6246003)(386003)(68736007)(71200400001)(229853002)(66446008)(256004)(66476007)(66556008)(64756008)(110136005)(54906003)(498600001)(2501003)(2906002)(31696002)(6512007)(6436002)(5660300002)(6486002)(86362001)(14454004)(71190400001)(53936002)(3846002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3362;
 H:BY5PR18MB3170.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DolnTWxjik2ZYLTt/XdLhFrhZrNDZ5R1OzgRjCPuGn7BzuClVsOG5nQOFwicle9wHBBNSoetARe6gt1+jn2VQfqNo8asLPlHb+ciCjcGA/PKQZkzMlEkM2wqmSfqgDthvRSUzTPH9wyk6xjhtnRFFkWaNV9BeqPnEaMgzPNq9RuSbk+udzD/OFaDN1rmaI8ebGDU0nboe1hhHqVFYiu6NItaWBAHGJelLvt/WCuaBO6tckczd2eJHWNQJ+s7QClKCz3ZHyTivq4WAMBxRratzsPNY98KqZPXBfiBmdlHFhYmwY6t5S6jEyHskj1ZQjhPu0TSpA5HGwBD9kNwEbnohOuxnco/JTKEbWZgqohHWpWn+zN9N45rt7bjQIT0DhDTzzHxOSNHK0wZUXtcRUfHEBjYEhQZ/4ovY0lVjKKtP9I=
Content-ID: <E2313A4D948FC64BA6F895D48B3A53E8@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 319243f3-80d1-4fbf-3101-08d715a4255c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 10:45:04.3572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jnwang@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3362
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] Speculative mitigation facilities report
 wrong status
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
Cc: "wl@xen.org" <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgZm9sa3MsDQoNCk9uIDcvMzEvMTkgNTo0NCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4g
VGhlIGNoZWNrIGZvciByZXBvcnRpbmcgTURfQ0xFQVIgbXVzdCBzdGF5IGFzIFg4Nl9GRUFUVVJF
X01EX0NMRUFSLA0KPiBiZWNhdXNlIHRoaXMgaXMgYSBwcm9wZXJ0eSBpbiBtaWNyb2NvZGUgd2hp
Y2ggbm8gY29udHJvbHMsIGFuZCBub3RoaW5nDQo+IGZ1cnRoZXIgdG8gdmlydHVhbGlzZSBhdCBY
ZW4ncyBsZXZlbC4NCg0KVGhlcmUgYXJlIHR3byBzb2x1dGlvbiwgd2hpY2ggb25lIHdvdWxkIHlv
dSBsaWtlPw0KDQpzb2x1dGlvbjE6IG1ha2Ugc3VyZSBzZXQgWDg2X0ZFQVRVUkVfU0NfVkVSV19Q
Vi9IVk0sIHVuZGVyDQpYODZfRkVBVFVSRV9NRF9DTEVBUiBleGlzdC4NCg0KfiAxMDg0wqDCoMKg
wqAgaWYgKCBvcHRfbWRfY2xlYXJfcHYgJiYgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX01EX0NM
RUFSKSkNCsKgIDEwODXCoMKgwqDCoMKgwqDCoMKgIHNldHVwX2ZvcmNlX2NwdV9jYXAoWDg2X0ZF
QVRVUkVfU0NfVkVSV19QVik7DQp+IDEwODbCoMKgwqDCoCBpZiAoIG9wdF9tZF9jbGVhcl9wdiB8
fCBvcHRfbWRfY2xlYXJfaHZtICYmDQpib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfTURfQ0xFQVIp
KQ0KwqAgMTA4N8KgwqDCoMKgwqDCoMKgwqAgc2V0dXBfZm9yY2VfY3B1X2NhcChYODZfRkVBVFVS
RV9TQ19WRVJXX0lETEUpOw0KfiAxMDg4wqDCoMKgwqAgaWYgKCBvcHRfbWRfY2xlYXJfaHZtICYm
ICEoY2FwcyAmIEFSQ0hfQ0FQU19TS0lQX0wxREZMKSAmJg0KIW9wdF9sMWRfZmx1c2ggJiYgYm9v
dF9jcHVfaGFzKFg4Nl9GRUFUVVJFX01EX0NMRUFSKSkNCsKgIDEwODnCoMKgwqDCoMKgwqDCoMKg
IHNldHVwX2ZvcmNlX2NwdV9jYXAoWDg2X0ZFQVRVUkVfU0NfVkVSV19IVk0pOw0KDQoNClNvbHV0
aW9uMjoNCg0KwqDCoCAzNjUgI2lmZGVmIENPTkZJR19IVk0NCsKgwqAgMzY2wqDCoMKgwqAgcHJp
bnRrKCLCoCBTdXBwb3J0IGZvciBIVk0gVk1zOiVzJXMlcyVzJXNcbiIsDQrCoMKgIDM2N8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9TQ19NU1JfSFZNKSB8
fA0KwqDCoCAzNjjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFU
VVJFX1NDX1JTQl9IVk0pIHx8DQp+wqAgMzY5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChib290
X2NwdV9oYXMoWDg2X0ZFQVRVUkVfTURfQ0xFQVIpICYmDQpib290X2NwdV9oYXMoWDg2X0ZFQVRV
UkVfU0NfVkVSV19IVk0pKSB8fA0KwqDCoCAzNzDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3B0
X2VhZ2VyX2ZwdSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgID8NCiIiwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6ICIgTm9uZSIsDQrCoMKg
IDM3McKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1NDX01T
Ul9IVk0pwqDCoMKgwqDCoCA/ICINCk1TUl9TUEVDX0NUUkwiIDogIiIsDQrCoMKgIDM3MsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1NDX1JTQl9IVk0pwqDC
oMKgwqDCoCA/ICINClJTQiLCoMKgwqDCoMKgwqDCoMKgwqDCoCA6ICIiLA0KwqDCoCAzNzPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG9wdF9lYWdlcl9mcHXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA/ICINCkVBR0VSX0ZQVSLCoMKgwqDCoCA6
ICIiLA0KfsKgIDM3NMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKGJvb3RfY3B1X2hhcyhYODZfRkVB
VFVSRV9NRF9DTEVBUikgJiYNCmJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9TQ19WRVJXX0hWTSkp
wqDCoMKgwqAgPyAiIE1EX0NMRUFSIsKgwqDCoMKgwqAgOiAiIik7DQrCoMKgIDM3NQ0KwqDCoCAz
NzYgI2VuZGlmDQrCoMKgIDM3NyAjaWZkZWYgQ09ORklHX1BWDQrCoMKgIDM3OMKgwqDCoMKgIHBy
aW50aygiwqAgU3VwcG9ydCBmb3IgUFYgVk1zOiVzJXMlcyVzJXNcbiIsDQrCoMKgIDM3OcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9TQ19NU1JfUFYpIHx8
DQrCoMKgIDM4MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib290X2NwdV9oYXMoWDg2X0ZFQVRV
UkVfU0NfUlNCX1BWKSB8fA0KfsKgIDM4McKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoYm9vdF9j
cHVfaGFzKFg4Nl9GRUFUVVJFX01EX0NMRUFSKSAmJg0KYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJF
X1NDX1ZFUldfUFYpKSB8fA0KwqDCoCAzODLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3B0X2Vh
Z2VyX2ZwdSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgID8NCiIiwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6ICIgTm9uZSIsDQrCoMKgIDM4
M8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1NDX01TUl9Q
VinCoMKgwqDCoMKgwqAgPyAiDQpNU1JfU1BFQ19DVFJMIiA6ICIiLA0KwqDCoCAzODTCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9TQ19SU0JfUFYpwqDCoMKg
wqDCoMKgID8gIg0KUlNCIsKgwqDCoMKgwqDCoMKgwqDCoMKgIDogIiIsDQrCoMKgIDM4NcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgb3B0X2VhZ2VyX2ZwdcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID8gIg0KRUFHRVJfRlBVIsKgwqDCoMKgIDog
IiIsDQp+wqAgMzg2wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoYm9vdF9jcHVfaGFzKFg4Nl9GRUFU
VVJFX01EX0NMRUFSKSAmJg0KYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1NDX1ZFUldfUFYpKcKg
wqDCoMKgwqAgPyAiIE1EX0NMRUFSIsKgwqDCoMKgwqAgOiAiIik7DQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
