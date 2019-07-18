Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B66AF6D112
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:26:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho8GF-0003is-7l; Thu, 18 Jul 2019 15:23:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho8GD-0003in-5V
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:23:57 +0000
X-Inumbo-ID: 0d1c291c-a970-11e9-8786-7f39258423f0
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d1c291c-a970-11e9-8786-7f39258423f0;
 Thu, 18 Jul 2019 15:23:54 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 15:23:50 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 15:23:39 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 15:23:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2WZD4m50BP1DPD1HLIiUnQ13P6cO6a4GDdeIfMy7t2PKmReh0NetnYGT5MCtcLqlxFrjBlT0m0/2dllsEVGEskkeoBEN4WytTd6pJgyGqrnLhRkgWMkHRubJ3XEVRogVjsnDOrs1Bkxat5DeTiLUtOzvnw8LNp8+7pG7LFejhTNEGIfAwVB34Tv0IQ3o0l2907oV7/jM4wY1JS+hnxjwYxq2FsAna65/LvAGbHxsRLHwaCBAkgrkl8JlATHlpMwAxyHzD7VYSKmqHEDHST4Ax7ZykDUrVY5jU41Y2QX1NJs0fsz5eBGLwLRgQPQzeo0ktJnAWBjIYp9vC6LS2b0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07A0HDpuygHnYvbwb2RXoC4G7XDKDsajtyfq2kvfHLs=;
 b=DjQgrH21ZkVoP6T69ARwu6w2n58JCWmwY2TWyjHxMXHyfPNZZ0+6SR9m+xCFtMddQ+1wE1n8PF2Pp7eJ4/r1Hb5JhxUM4/mpP2ImEIN32io5sLV71htbGbYXxquIcmdga6lkRJLfEMHMogxe6M402IaZS1UaWF5w0q/ASHkRFrvebzR+ZQCvEllhkdc/n38N+ZiNi4wJlhqc5m//SU6TnLhzJY7ZEPBtJ8YjeCBxdzBbUcmdxhN2DmNrDZGgRSa2jKrxxRj0PKPh8Ag/1EMwBTADbypRqt5EpXD41Utd7g0WRkz9Ixh7T5vS+1qADK7PMaWPtSJQ2UFYp/b7+KWZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2361.namprd18.prod.outlook.com (20.179.71.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 15:23:38 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 15:23:38 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] xen/trace: Adjust types in trace_var() declarations
Thread-Index: AQHVPXEn9tz4a96/o0e+1XNlyOHUq6bQfqQA
Date: Thu, 18 Jul 2019 15:23:38 +0000
Message-ID: <de4d58df-7033-b661-2ebf-b56dc4b76eec@suse.com>
References: <20190718140009.16021-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190718140009.16021-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::23) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39e6c00d-c158-4986-772e-08d70b93e833
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2361; 
x-ms-traffictypediagnostic: DM6PR18MB2361:
x-microsoft-antispam-prvs: <DM6PR18MB2361C813935713408B6A0D33B3C80@DM6PR18MB2361.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(189003)(199004)(486006)(66446008)(7736002)(6512007)(25786009)(4326008)(66476007)(66556008)(66946007)(8676002)(31686004)(64756008)(256004)(6246003)(6436002)(53936002)(6486002)(2616005)(476003)(446003)(11346002)(68736007)(66066001)(52116002)(36756003)(229853002)(2906002)(99286004)(3846002)(102836004)(6916009)(76176011)(6506007)(53546011)(26005)(186003)(6116002)(54906003)(316002)(71200400001)(14454004)(478600001)(71190400001)(80792005)(5660300002)(305945005)(81156014)(8936002)(86362001)(31696002)(81166006)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2361;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N885yunREKINjOQrRbLVeeo0j4a46WwzaV/mIgLkfsGgCGdmYt3PK/B9ExBeadNu9aUZ/nlNa/sUyIrQs/QDNOUTetXQ3il9GDBEOQuqqjqgcuMPmgwPeh4I/QfJEFeFd4nbhUiDubSUglioMC9f45FgElfKa5X9Qhr4Wr431c8GOrnGwTORDPfLiNCUJgJsEnArHASRPNzsNypKvmXbqP4NXb7suwN2aY91WCgF5JGbsUMtAONIT8C47Deionekol5ThvDbOv42EQg8IKTl56BMesk614U9SmanqYSq01V0yu1Cb7SDKA4sges7UOLgmnMNMWC+9ZBBmrxl09pq0dYGjgMEpm+o/Y9dcBWAQJVSGQJ766r/FLEVj+JKnT2pJPGY73fJ/DVJICn7b0EQBPyuxBnkCTdoE78wDy5355I=
Content-ID: <91AABF4DFC5241429A0D5A2E107CB0CA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e6c00d-c158-4986-772e-08d70b93e833
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 15:23:38.1228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2361
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] xen/trace: Adjust types in trace_var()
 declarations
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxNjowMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gVXNlIGJvb2wgcmF0
aGVyIHRoYW4gaW50L2Jvb2xfdCBmb3IgJ2N5Y2xlcycgdG8gbWF0Y2ggdGhlICFDT05GSUdfVFJB
Q0VCVUZGRVINCj4gdmVyc2lvbiwgYW5kIHVzZSB1bnNpZ25lZCBpbnQgcmF0aGVyIHRoYW4gaW50
IGZvciAnZXh0cmEnIHRvIG1hdGNoIHRoZQ0KPiBmdW5jdGlvbiBpdCBpcyBmb3J3YXJkZWQgdG8u
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPg0KDQpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KYWxi
ZWl0IEknZCBoYXZlIGV4cGVjdGVkIHRoZSBmaWxlIHRvIGJ5IHBhcnQgb2YgdGhlIFhFTlRSQUNF
DQpzZWN0aW9uIG9mIC4vTUFJTlRBSU5FUlMuDQoNCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3Ry
YWNlLmgNCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3RyYWNlLmgNCj4gQEAgLTQxLDkgKzQxLDkg
QEAgaW50IHRiX2NvbnRyb2woc3RydWN0IHhlbl9zeXNjdGxfdGJ1Zl9vcCAqdGJjKTsNCj4gICAN
Cj4gICBpbnQgdHJhY2Vfd2lsbF90cmFjZV9ldmVudCh1MzIgZXZlbnQpOw0KPiAgIA0KPiAtdm9p
ZCBfX3RyYWNlX3Zhcih1MzIgZXZlbnQsIGJvb2xfdCBjeWNsZXMsIHVuc2lnbmVkIGludCBleHRy
YSwgY29uc3Qgdm9pZCAqKTsNCj4gK3ZvaWQgX190cmFjZV92YXIodTMyIGV2ZW50LCBib29sIGN5
Y2xlcywgdW5zaWduZWQgaW50IGV4dHJhLCBjb25zdCB2b2lkICopOw0KPiAgIA0KPiAtc3RhdGlj
IGlubGluZSB2b2lkIHRyYWNlX3Zhcih1MzIgZXZlbnQsIGludCBjeWNsZXMsIGludCBleHRyYSwN
Cj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB0cmFjZV92YXIodTMyIGV2ZW50LCBib29sIGN5Y2xlcywg
dW5zaWduZWQgaW50IGV4dHJhLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgdm9pZCAqZXh0cmFfZGF0YSkNCg0KV291bGQgYmUgbmljZSBpZiB0aGUgdTMyLXMgaGVyZSBj
b3VsZCBnbyBhd2F5IGF0IHRoZSBzYW1lIHRpbWUuDQpJZGVhbGx5IHRoZXknZCBiZWNvbWUgdW5z
aWduZWQgaW50LCBidXQgSSBndWVzcyB5b3UncmUgb25jZQ0KYWdhaW4gcmF0aGVyIHNlZWluZyB0
aGVtIGJlIHVpbnQzMl90Lg0KDQpBbHNvIHdvdWxkbid0IHlvdSBiZXR0ZXIgYWRqdXN0IF9fdHJh
Y2VfdmFyKCkncyBkZWZpbml0aW9uIGFzIHdlbGwNCmF0IHRoaXMgb2NjYXNpb24/DQoNCkphbg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
