Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2445CFDC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 14:57:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiIHP-00076N-ES; Tue, 02 Jul 2019 12:53:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiIHO-00076I-Dc
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 12:53:02 +0000
X-Inumbo-ID: 524e14c8-9cc8-11e9-8fee-87b52811dce9
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 524e14c8-9cc8-11e9-8fee-87b52811dce9;
 Tue, 02 Jul 2019 12:53:00 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  2 Jul 2019 12:52:54 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 2 Jul 2019 12:48:49 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 12:48:48 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3347.namprd18.prod.outlook.com (10.255.138.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 12:48:48 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Tue, 2 Jul 2019
 12:48:48 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 38/60] x86: make loading of GDT at context switch more
 modular
Thread-Index: AQHVMNR9v1fNvM+jwka4KlZbyFcySQ==
Date: Tue, 2 Jul 2019 12:48:48 +0000
Message-ID: <6f3419c8-73fa-e46b-0432-c2a178180d6c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0402CA0002.eurprd04.prod.outlook.com
 (2603:10a6:4:91::12) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79e7ef27-e997-402b-6aac-08d6feeba01c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3347; 
x-ms-traffictypediagnostic: BY5PR18MB3347:
x-microsoft-antispam-prvs: <BY5PR18MB33475DE21CDE9120CAC9CCEDB3F80@BY5PR18MB3347.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(189003)(199004)(4326008)(3846002)(6116002)(25786009)(478600001)(53936002)(6246003)(68736007)(99286004)(72206003)(80792005)(316002)(110136005)(66066001)(52116002)(229853002)(8676002)(6436002)(81166006)(6486002)(54906003)(53546011)(6512007)(6506007)(186003)(81156014)(26005)(14454004)(71200400001)(36756003)(486006)(2616005)(476003)(8936002)(73956011)(66476007)(66556008)(64756008)(31696002)(66946007)(66446008)(102836004)(86362001)(71190400001)(7736002)(31686004)(305945005)(2906002)(256004)(5660300002)(4744005)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3347;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N6Xkt+jQBdT9TI+PU9xgwtIN674Q0TKozvrk48fkbTSq9PE3YXUjj1Bi3KPz0xmAXdczPhfj9UMLwef11VRbKzrWrB9uRvgt5xpwovX2R1qgKT7nCEt9EcIBFi/O/2TBzUkioPG3eF8KQYGQCTQlQOxJu2aursSHpPqVlf91JhikvYBE/cMV22OB4thjgIuqHlaJPAxo8iaTER+WpIvMSUNecA44WVohKb2KAiMtvf+sgh/Ye1VENKOA/qqr6rrSs/+kMSKLzL64oxbRMY30O6N0mpoD1LIFYDy5wscoPWGUEPzvYZuhB5DbthqRmPrj0LX7UD2JywP6S6t/8JTz9XVF9wUlGCSk7Op4p601LoIv3rNHTaCsCeJup+0FysIRkjxFIUxe45M0NMpFzZvDAiK/2w+5SoD9I6gujenBkts=
Content-ID: <DDAAB262F9D4D046A756C49C56B06AA6@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e7ef27-e997-402b-6aac-08d6feeba01c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 12:48:48.1017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3347
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 38/60] x86: make loading of GDT at context
 switch more modular
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
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI4LjA1LjE5IGF0IDEyOjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4gSW4g
cHJlcGFyYXRpb24gZm9yIGNvcmUgc2NoZWR1bGluZyBjYXJ2ZSBvdXQgdGhlIEdEVCByZWxhdGVk
DQo+IGZ1bmN0aW9uYWxpdHkgKHdyaXRpbmcgR0RUIHJlbGF0ZWQgUFRFcywgbG9hZGluZyBkZWZh
dWx0IG9mIGZ1bGwgR0RUKQ0KPiBpbnRvIHN1Yi1mdW5jdGlvbnMuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IEFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IC0tLQ0KPiBSRkMgVjI6IHNwbGl0IG9mZiBub24t
cmVmYWN0b3JpbmcgcGFydA0KPiBWMTogY29uc3RpZnkgcG9pbnRlcnMsIHVzZSBpbml0aWFsaXpl
cnMgKEphbiBCZXVsaWNoKQ0KDQpJJ20gZ2V0dGluZyB0aGUgaW1wcmVzc2lvbiB0aGF0IHRoaXMg
YW5kIHRoZSBmb2xsb3dpbmcgcGF0Y2ggYXJlDQppbmRlcGVuZGVudCBvZiB0aGUgZWFybGllciBw
YXJ0cyBvZiB0aGUgc2VyaWVzLCBhbmQgaGVuY2UgY291bGQNCmluIHByaW5jaXBsZSBnbyBpbiBy
aWdodCBhd2F5PyBBbSBJIG92ZXJsb29raW5nIGFueXRoaW5nPw0KDQpBbmRyZXcsIG9iamVjdGlv
bnM/DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
