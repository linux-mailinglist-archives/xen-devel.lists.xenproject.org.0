Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C895985C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 12:27:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgo40-0000Nd-7j; Fri, 28 Jun 2019 10:25:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hgo3y-0000NW-VJ
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 10:25:03 +0000
X-Inumbo-ID: fc0d11c5-998e-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fc0d11c5-998e-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 10:25:01 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 28 Jun 2019 10:24:59 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 28 Jun 2019 10:20:43 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 28 Jun 2019 10:20:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=T81r4zTF5l02ozN/uwYQpS/gW15Cp/mi0Nig8btIIs1htOE3ogQ0t4W0jhr5ehLVA0IFZ8PnzmdfUz5PI1vYfvwGz3De6Um/GnAi8z/GRl/fDyc07ohZl5sZ01BPQyufjcDCoXipLRr4tSaNn8J+YDyR8n4U2NCCYIOozttpoD8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxIrdmUt1xEcpMpfHoRKSaxeSfmr+RdQ14Lr3hQeT6A=;
 b=Y9VCnUztVC4a6r+WZo+F9wPkbS40QvEttNIdcoBmaL+FE9jlw9LE5+NPn/6Ze3/w1QnQD28+oU6lsffxm8+e1qsdQefLucMZKxL41nscbsB+0L8CMOWUtCcjEhUZrpZWj+WhNyuTbFNPXehZOwpRQlJF0x/DL7SNarSSzVAiuEI=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2666.namprd18.prod.outlook.com (20.179.106.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 10:20:41 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::302a:6fe1:31f0:3abf]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::302a:6fe1:31f0:3abf%4]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 10:20:41 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 4/5] xen/gnttab: Refactor gnttab_clear_flag() to be
 gnttab_clear_flags()
Thread-Index: AQHVLZsjZKMrXTSWA0KStFQaRJ+0dw==
Date: Fri, 28 Jun 2019 10:20:41 +0000
Message-ID: <5bf4ea5a-8ddb-7a66-88fb-ffab15a53fe9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR02CA0022.eurprd02.prod.outlook.com
 (2603:10a6:6:15::35) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5fa4bfd-0978-490a-e1b8-08d6fbb245aa
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2666; 
x-ms-traffictypediagnostic: DM6PR18MB2666:
x-microsoft-antispam-prvs: <DM6PR18MB2666DAA99370E43712B648F0B3FC0@DM6PR18MB2666.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(189003)(199004)(68736007)(73956011)(2501003)(6916009)(66946007)(80792005)(71190400001)(5660300002)(6246003)(71200400001)(25786009)(2906002)(3846002)(66446008)(66556008)(64756008)(305945005)(66476007)(6116002)(36756003)(4326008)(6436002)(53936002)(229853002)(6486002)(14454004)(186003)(86362001)(6512007)(31686004)(7736002)(8676002)(99286004)(5640700003)(476003)(66066001)(2616005)(386003)(81156014)(52116002)(14444005)(478600001)(6506007)(316002)(102836004)(72206003)(26005)(53546011)(81166006)(54906003)(486006)(2351001)(8936002)(31696002)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2666;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Iu00O1zorYnhMKE4gK+nqOSK+x8Nf36PaINryLLXvcEtE29gjS8T67NDbXU8i9BQSGoK88+HNG/joWIPcJp+RiG0V46Xh37ORoVECFKvSu5tiDunv/+v9eecHfhbuCCCGCpAvMlksV3r8D7gURbN+Su24V372qxrLogeKH9gUmdEKiKzXx/u0UqojFXvSpRtWdxCPJQRZE+QKCZlWX4ttqw/OtwPxyvh0JSMxvphIT5AvKng3UQ+scKw5KRbS4gDbZp0iSDHz8ZT7JWDN1DOxtfAO7qVRN5Df/CvFJdKiBrAbqcMZLv1tIH8FvEkljK6HrOR8mjIjOl1vH6RnkigpaVHYXbUqoEw2pYEhfhvHO4LOjdYAB977GSn/rsHjowCUuepF6eIi103QS556X8Yc0zOwt+ktLGjxL542xmljlc=
Content-ID: <E4CF6D5F9F372F4A9EB21953BCDEF556@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fa4bfd-0978-490a-e1b8-08d6fbb245aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 10:20:41.3749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2666
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 4/5] xen/gnttab: Refactor
 gnttab_clear_flag() to be gnttab_clear_flags()
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA2LjE5IGF0IDExOjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6DQo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3JhbnRfdGFibGUuaA0KPiArKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L2dyYW50X3RhYmxlLmgNCj4gQEAgLTYwLDE0ICs2MCwxMSBAQCBz
dGF0aWMgaW5saW5lIGludCByZXBsYWNlX2dyYW50X2hvc3RfbWFwcGluZyh1aW50NjRfdCANCj4g
YWRkciwgbWZuX3QgZnJhbWUsDQo+ICANCj4gICNkZWZpbmUgZ250dGFiX21hcmtfZGlydHkoZCwg
ZikgcGFnaW5nX21hcmtfZGlydHkoZCwgZikNCj4gIA0KPiAtc3RhdGljIGlubGluZSB2b2lkIGdu
dHRhYl9jbGVhcl9mbGFnKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBuciwNCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCAqc3QpDQo+ICtzdGF0
aWMgaW5saW5lIHZvaWQgZ250dGFiX2NsZWFyX2ZsYWdzKHN0cnVjdCBkb21haW4gKmQsDQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IG1hc2ssIHVpbnQx
Nl90ICphZGRyKQ0KPiAgew0KPiAtICAgIC8qDQo+IC0gICAgICogTm90ZSB0aGF0IHRoaXMgY2Fu
bm90IGJlIGNsZWFyX2JpdCgpLCBhcyB0aGUgYWNjZXNzIG11c3QgYmUNCj4gLSAgICAgKiBjb25m
aW5lZCB0byB0aGUgc3BlY2lmaWVkIDIgYnl0ZXMuDQo+IC0gICAgICovDQo+IC0gICAgYXNtIHZv
bGF0aWxlICgibG9jayBidHJ3ICV3MSwlMCIgOiAiK20iICgqc3QpIDogIklyIiAobnIpKTsNCj4g
KyAgICAvKiBBY2Nlc3MgbXVzdCBiZSBjb25maW5lZCB0byB0aGUgc3BlY2lmaWVkIDIgYnl0ZXMu
ICovDQo+ICsgICAgYXNtIHZvbGF0aWxlICgibG9jayBhbmR3ICV3MSwlMCIgOiAiK20iICgqYWRk
cikgOiAiSXIiICh+bWFzaykpOw0KDQpUaGUgSSBjb25zdHJhaW50IGxpbWl0cyBsaXRlcmFsIG51
bWJlcnMgdG8gNSBiaXRzLCB3aGljaCBpcyBub3Qgd2hhdA0KeW91IHdhbnQgaGVyZSAoYWxiZWl0
IGl0J3MgZmluZSBmb3IgdGhlIHR3byBiaXRzIHdlIGN1cnJlbnRseSB3YW50DQp0aGlzIGZvciku
ICJOIiB3b3VsZCB3aWRlbiB0aGUgcmFuZ2UgdG8gOCBiaXRzLCB3aGlsZSAiZSIgYW5kICJpIg0K
d291bGQgZ28gYmV5b25kIHRoZSAxNiB3ZSB3YW50LiBUaGVyZWZvcmUgSSB0aGluayB5b3Ugd2Fu
dA0KdG8gY2FzdCB+bWFzayB0byB1aW50MTZfdCBhbmQgdXNlICJlIiBvciAiaSIuIChUaGlzIHdv
dWxkIHRoZW4NCmFsc28gYWxsb3cgZHJvcHBpbmcgdGhlIHcgbW9kaWZpZXIuKQ0KDQpTcGVha2lu
ZyBvZiB1aW50MTZfdCAtIHRoZSAibWFzayIgcGFyYW1ldGVyIGNvdWxkIGVhc2lseSBiZQ0KdW5z
aWduZWQgaW50LCBwb3NzaWJseSBhbGxvd2luZyB0aGUgY29tcGlsZXIgdG8gYXZvaWQgYSA2NiBw
cmVmaXgNCmhlcmUgYW5kIHRoZXJlLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
