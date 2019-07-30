Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808DA7A9B3
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 15:34:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsSD3-0003nj-MY; Tue, 30 Jul 2019 13:30:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsSD3-0003ne-0g
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 13:30:33 +0000
X-Inumbo-ID: 2c2b4a42-b2ce-11e9-9173-4756aa3fd482
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c2b4a42-b2ce-11e9-9173-4756aa3fd482;
 Tue, 30 Jul 2019 13:30:31 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 13:30:22 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 13:23:58 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 13:23:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+WwsEBDhZ4i+suX56lVnNk4SUtGr8EB87mc49FBjFYsWL365iTt0PENFnp+wRFN6I3rqBPss6fKCaVykx21PpQrPNFSL/VMe9a0bMcZzrWGgqQ58FKK92qjhb2AVHsCaBrQLBeIhpGi3qJAdU6ovOqKPGlIF+EHkHFJmxL7E9aZ7aNQiqSjdcNg7hoVpUw0l9lan91991+rlCdevQiNgqSYgJIfheTuYIh2NIIgzcpInAHLaxmZBOni+hi0XVHJJ/J6p5ROdI/wiL1txTKUQ/kji6h4rc15plYmDUeUvyDAko6mp9FHjUhWBsYayHsYWI5FyH3fJFQ8WI7G4s3FbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY7L2p/MzHohN+vjwziEflQGdfX4XRK/xvP/3szE39U=;
 b=Iy49+a4B+FWaG2i5WIeBi1AO8sL8I6F9hKF8vb0HqnuDN5N6q6Atc4G7Kqe2fJ7/5Emz8asdv0WitGy4pA8XY8ov3PVraHk5TSzZbY+6ASvIYzp4osrkzmfUPzaqQxku8gRqMvMhFDoV4DpLVIFB+ixgBbV6ttRh17OMgV1rFemza6B4KlTUcjopNxfR8/hBN3bKY0GgUKbguY0BUbuvwqz4bKW42T52+1JEoou5Lr2P99N/ghenmJ5lgGm8acymavxK7np/8Rrvt+Dqi2NseZz5sEfjFfzD/zndJPI4tQln6jB4e4hKq3zdk5xXRYoT2HdJZcTRujBuKtF0AuZekQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3249.namprd18.prod.outlook.com (10.255.138.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 13:23:56 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 13:23:56 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Norbert Manthey <nmanthey@amazon.de>
Thread-Topic: [PATCH L1TF MDS GT v3 1/2] common/grant_table: harden bound
 accesses
Thread-Index: AQHVOI9EFD+2Co2LEUukceT0T/LFJ6bQUgiAgBLmMgqAAAqwgA==
Date: Tue, 30 Jul 2019 13:23:55 +0000
Message-ID: <16a741fb-5944-6cb8-61f8-e6d65d620b04@suse.com>
References: <1562921502-20137-1-git-send-email-nmanthey@amazon.de>
 <1562921502-20137-2-git-send-email-nmanthey@amazon.de>
 <b70d3c83-d7c8-e8a3-f587-e5a7cca8ca0d@suse.com>
 <7524db98-5718-0cd3-b1fe-0ad0a60c0980@amazon.de>
In-Reply-To: <7524db98-5718-0cd3-b1fe-0ad0a60c0980@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0902CA0027.eurprd09.prod.outlook.com
 (2603:10a6:6:2::40) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a00618e-12b9-4783-6efe-08d714f12bd9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3249; 
x-ms-traffictypediagnostic: BY5PR18MB3249:
x-microsoft-antispam-prvs: <BY5PR18MB3249BE9A4ED8C2AC2E6D8365B3DC0@BY5PR18MB3249.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(199004)(189003)(6486002)(31686004)(6506007)(53546011)(76176011)(386003)(81166006)(81156014)(25786009)(5660300002)(102836004)(186003)(26005)(6246003)(66946007)(66476007)(52116002)(7736002)(64756008)(66556008)(66446008)(68736007)(4326008)(8676002)(99286004)(53936002)(6116002)(7416002)(54906003)(36756003)(305945005)(31696002)(11346002)(80792005)(8936002)(478600001)(6916009)(229853002)(14454004)(256004)(14444005)(446003)(6436002)(3846002)(71190400001)(2616005)(476003)(486006)(2906002)(316002)(86362001)(71200400001)(6512007)(66066001)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3249;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xiqhT6snpBOfk9H6bXP+/QSxXL5hnihwJzivDd6Xb2IQg0EVFDjyPFGGX+uWWmly52gzHlKaw3FwVt85NFI7rxec8xHKjNcHOrl7T9zvl2sC138FdfPlCtycu+zmmsyYm/bSTRgrH6i95vukWluLVsLlbmsY+U5RpI47YLevJmXS4wPC6MO+7nn2iOwN/Gvf5C1CD92kwSQHqCocvvBUhCDinCNjGJt1p/3bffhbXBPt+j9hR14tX4rFsNhkUA0m5cQeZSMRXrP6cGyHuAmNBy80rPDyZOLclh3mQ/rtEleixd+78nXj55ZZgoumi1ydplmoviVb4R12C6yAAp0paZiIgsQtvEkdYHdHqBWI4OH0jIa/TCivP2Ej6ILxZvDyN02TrQoxXLaq6sRqpKhbFVnjOzE1SZtV1y/+hALOm8I=
Content-ID: <BFF025A5E399224F9CAA634DB7033066@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a00618e-12b9-4783-6efe-08d714f12bd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 13:23:56.0643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3249
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v3 1/2] common/grant_table:
 harden bound accesses
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
Cc: Juergen Gross <JGross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, PawelWieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, DavidWoodhouse <dwmw@amazon.co.uk>,
 Martin Mazein <amazein@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 BjoernDoebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxNDo0NCwgTm9yYmVydCBNYW50aGV5IHdyb3RlOg0KPiBPbiA3LzE4LzE5
IDE0OjA5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDEyLjA3LjIwMTkgMTA6NTEsIE5vcmJl
cnQgTWFudGhleSB3cm90ZToNCj4+PiBHdWVzdHMgY2FuIGlzc3VlIGdyYW50IHRhYmxlIG9wZXJh
dGlvbnMgYW5kIHByb3ZpZGUgZ3Vlc3QgY29udHJvbGxlZA0KPj4+IGRhdGEgdG8gdGhlbS4gVGhp
cyBkYXRhIGlzIHVzZWQgYXMgaW5kZXggZm9yIG1lbW9yeSBsb2FkcyBhZnRlciBib3VuZA0KPj4+
IGNoZWNrcyBoYXZlIGJlZW4gZG9uZS4gVG8gYXZvaWQgc3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5k
IGFjY2Vzc2VzLCB3ZQ0KPj4+IHVzZSB0aGUgYXJyYXlfaW5kZXhfbm9zcGVjIG1hY3JvIHdoZXJl
IGFwcGxpY2FibGUsIG9yIHRoZSBtYWNybw0KPj4+IGJsb2NrX3NwZWN1bGF0aW9uLiBOb3RlLCB0
aGUgYmxvY2tfc3BlY3VsYXRpb24gbWFjcm8gaXMgdXNlZCBvbiBhbGwNCj4+PiBwYXRoIGluIHNo
YXJlZF9lbnRyeV9oZWFkZXIgYW5kIG5yX2dyYW50X2VudHJpZXMuIFRoaXMgd2F5LCBhZnRlciBh
DQo+Pj4gY2FsbCB0byBzdWNoIGEgZnVuY3Rpb24sIGFsbCBib3VuZCBjaGVja3MgdGhhdCBoYXBw
ZW5lZCBiZWZvcmUgYmVjb21lDQo+Pj4gYXJjaGl0ZWN0dXJhbCB2aXNpYmxlLCBzbyB0aGF0IG5v
IGFkZGl0aW9uYWwgcHJvdGVjdGlvbiBpcyByZXF1aXJlZA0KPj4+IGZvciBjb3JyZXNwb25kaW5n
IGFycmF5IGFjY2Vzc2VzLiBBcyB0aGUgd2F5IHdlIGludHJvZHVjZSBhbiBsZmVuY2UNCj4+PiBp
bnN0cnVjdGlvbiBtaWdodCBhbGxvdyB0aGUgY29tcGlsZXIgdG8gcmVsb2FkIGNlcnRhaW4gdmFs
dWVzIGZyb20NCj4+PiBtZW1vcnkgbXVsdGlwbGUgdGltZXMsIHdlIHRyeSB0byBhdm9pZCBzcGVj
dWxhdGl2ZWx5IGNvbnRpbnVpbmcNCj4+PiBleGVjdXRpb24gd2l0aCBzdGFsZSByZWdpc3RlciBk
YXRhIGJ5IG1vdmluZyByZWxldmFudCBkYXRhIGludG8NCj4+PiBmdW5jdGlvbiBsb2NhbCB2YXJp
YWJsZXMuDQo+Pj4NCj4+PiBTcGVjdWxhdGl2ZSBleGVjdXRpb24gaXMgbm90IGJsb2NrZWQgaW4g
Y2FzZSBvbmUgb2YgdGhlIGZvbGxvd2luZw0KPj4+IHByb3BlcnRpZXMgaXMgdHJ1ZToNCj4+PiAg
ICAtIHBhdGggY2Fubm90IGJlIHRyaWdnZXJlZCBieSB0aGUgZ3Vlc3QNCj4+PiAgICAtIHBhdGgg
ZG9lcyBub3QgcmV0dXJuIHRvIHRoZSBndWVzdA0KPj4+ICAgIC0gcGF0aCBkb2VzIG5vdCByZXN1
bHQgaW4gYW4gb3V0LW9mLWJvdW5kIGFjY2Vzcw0KPj4+ICAgIC0gcGF0aCBjYW5ub3QgYmUgZXhl
Y3V0ZWQgcmVwZWF0ZWRseQ0KPj4gSSBub3RpY2UgdGhpcyBzZW50ZW5jZSBpcyBzdGlsbCB0aGVy
ZSB3aXRob3V0IG1vZGlmaWNhdGlvbi4gSWYgeW91DQo+PiBkb24ndCB3YW50IHRvIGRyb3AgaXQg
KGFuZCB0aGVuIHBlcmhhcHMgbWFrZSBjaGFuZ2VzIHRvIGEgZmV3IG1vcmUNCj4+IHBhdGhzKSwg
Y2FuIHdlIGF0IGxlYXN0IHNldHRsZSBvbiBhIGxlc3MgZmlybSBzdGF0ZW1lbnQgbGlrZSAicGF0
aA0KPj4gaXMgdW5saWtlbHkgdG8gYmUgZXhlY3V0ZWQgcmVwZWF0ZWRseSBpbiByYXBpZCBzdWNj
ZXNzaW9uIj8NCj4gDQo+IEkgd2lsbCBkcm9wIHRoZSBsYXN0IGNvbmRpdGlvbiwgYW5kIHBvc3Qg
YW4gdXBkYXRlIG9uZSBtb3JlIHRpbWUuDQoNCkZBT0QgLSB0aGVyZSdzIG5vIHN0cmljdCBuZWVk
IHRvIHBvc3QgYW5vdGhlciB2ZXJzaW9uLiBJZiB3ZSBjYW4NCnNldHRsZSBvbiB0aGUgd29yZGlu
ZywgdGhpcyBpcyBlYXN5IGVub3VnaCB0byBjaGFuZ2Ugd2hpbGUgY29tbWl0dGluZy4NCg0KSmFu
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
