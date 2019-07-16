Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5182B6ACEE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 18:40:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnQSD-0002CL-Sc; Tue, 16 Jul 2019 16:37:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnQSB-0002Bl-Pg
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 16:37:23 +0000
X-Inumbo-ID: f8b02732-a7e7-11e9-b576-abca68db66c4
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8b02732-a7e7-11e9-b576-abca68db66c4;
 Tue, 16 Jul 2019 16:37:19 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 16:37:17 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 16:34:00 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 16:34:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWzb4fxa+x/38Vym0yxgFkrp1+H2Mjyc1U7l/sEzcyNWV9o+LMzehNvPBs9ZJhfIXGFVsHfY00ra40sDu8z2WdwbdCNhlb1hmDh6yyibRR19bSAfjXiTW0QbRpGsXXVWXB0Qy0GtQGf00gJrIMX3HU+qoQpiXx8DDIXBzFUXNClYR4y7PWKkS7cItLkOK5ST13VbQYJyxQ68bef8tTfHyH0WXOcLMqZTB92Ag030BmaSRd4xymfQI4dknVxxv5Bic7JicD0ok6blWO5e0G1CGMPPYXKJnIwsvHOiReWcYLKYtKMvY5vWCVJLccr+GP/bxeyPqT9TjaDLwAc5PIqeTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhE7Dzbxb71gdKgewMKD4wFCvHfmQjsXhiNBzEaO1vk=;
 b=GJ+sR0tVb+++lWKbJwgBAmdK94Ksyx37/lpl2vckNXws4qoyFx0hOEBS5MoN7j5plGQqzF/lk7+WBoLfWKdEHADK1qcrYAaxMuf6uAD+sNYlBhQW4ewmcXFc+BhUH9AkQbMsKwdlgIIEPTNlGJ6AqosB35NKAwfF2iy5wKgelTj8hr8BKVjfRW7nr7n9v66JwN7S9iYXrJYRq2VqHXFXoGoP2qc3Tkqeum6WAjGV/ku7BZge+qGpcrdBRmzFXakE9k+2mQld+YMQjyAJ0jUyKQjiw9ZE1ppUzXfKRgJVBoZ78991RDeUgvVtcFlUWTaRqV1XAdnKO3dYsakr/9UcxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3355.namprd18.prod.outlook.com (10.255.174.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 16:34:00 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 16:34:00 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3] passthrough/vtd: Don't DMA to the stack in
 queue_invalidate_wait()
Thread-Index: AQHVO/L1K7bAkJ+VBki7BnAFJZRIEqbNcJ6A
Date: Tue, 16 Jul 2019 16:33:59 +0000
Message-ID: <b180cbba-0ab6-a0ab-ba08-f1ab0701ea93@suse.com>
References: <20190716162355.1321-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190716162355.1321-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR02CA0015.eurprd02.prod.outlook.com
 (2603:10a6:10:52::28) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 322a3fa4-cab5-4810-aa09-08d70a0b67c6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3355; 
x-ms-traffictypediagnostic: DM6PR18MB3355:
x-microsoft-antispam-prvs: <DM6PR18MB335548DB3B9A9081EB140DC1B3CE0@DM6PR18MB3355.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(199004)(189003)(6116002)(229853002)(6916009)(2906002)(3846002)(305945005)(8936002)(7736002)(478600001)(186003)(14454004)(31686004)(25786009)(4326008)(14444005)(99286004)(5660300002)(6246003)(81156014)(36756003)(64756008)(26005)(256004)(71190400001)(71200400001)(8676002)(68736007)(66946007)(53936002)(66556008)(66446008)(66476007)(6512007)(76176011)(386003)(53546011)(66066001)(6506007)(4744005)(102836004)(80792005)(52116002)(86362001)(486006)(81166006)(476003)(31696002)(446003)(2616005)(11346002)(6486002)(6436002)(316002)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3355;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mzMFN3H3DfKWqXXwL3cFQ0V6qbhw7ge/j8w+teUPopEVDyyKerwn+KMDiI/o8J/q0TtawEIOmVCJDjAKYNj5Nr55u03N3XB6Z1E2llr37RuqnFDe1nPk0h96XChwP+hlStShS31WI77fXH5w5+E7Eqea2nbLQII9eZArQOWXbBKSlE07t81VYiU7usB9ISVewSfRAxnLeRd9PjsllHgb7leBf2A/kKyJJmbtCfGew9TJaxbLMF1IKgikWzxG/B3GkbUDHSeukJBHvVclfbp8EsZYLrL9hJCcsSA8de0V9o+UfzaJCTp3ycLuX2isO8J7dioTLi3rMzoPjlQOHIYlCH1KZNIB2VemOqyJolnVfoaKp36U0tl7Df+vPRbrxNl101ZWAbhjkUvPutT/q1fAPsBRRDwvoMWZa8+/dZLlKV8=
Content-ID: <4B45C3713F3579428C01144DB031294E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 322a3fa4-cab5-4810-aa09-08d70a0b67c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 16:34:00.0014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3355
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3] passthrough/vtd: Don't DMA to the stack
 in queue_invalidate_wait()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxODoyMywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gRE1BLWluZyB0byB0
aGUgc3RhY2sgaXMgY29uc2lkZXJlZCBiYWQgcHJhY3RpY2UuICBJbiB0aGlzIGNhc2UsIGlmIGEN
Cj4gdGltZW91dCBvY2N1cnMgYmVjYXVzZSBvZiBhIHNsdWdnaXNoIGRldmljZSB3aGljaCBpcyBw
cm9jZXNzaW5nIHRoZQ0KPiByZXF1ZXN0LCB0aGUgY29tcGxldGlvbiBub3RpZmljYXRpb24gd2ls
bCBjb3JydXB0IHRoZSBzdGFjayBvZiBhDQo+IHN1YnNlcXVlbnQgZGVlcGVyIGNhbGwgdHJlZS4N
Cj4gDQo+IFBsYWNlIHRoZSBwb2xsX3Nsb3QgaW4gYSBwZXJjcHUgYXJlYSBhbmQgRE1BIHRvIHRo
YXQgaW5zdGVhZC4NCj4gDQo+IEZpeCB0aGUgZGVjbGFyYXRpb24gb2Ygc2FkZHIgaW4gc3RydWN0
IHFpbnZhbF9lbnRyeSwgdG8gYXZvaWQgYSBzaGlmdCBieQ0KPiB0d28uICBUaGUgcmVxdWlyZW1l
bnQgaGVyZSBpcyB0aGF0IHRoZSBETUEgYWRkcmVzcyBpcyBkd29yZCBhbGlnbmVkLA0KPiB3aGlj
aCBpcyBjb3ZlcmVkIGJ5IHBvbGxfc2xvdCdzIHR5cGUuDQo+IA0KPiBUaGlzIGNoYW5nZSBkb2Vz
IG5vdCBhZGRyZXNzIG90aGVyIGlzc3Vlcy4gIENvcnJlbGF0aW5nIGNvbXBsZXRpb25zDQo+IGFm
dGVyIGEgdGltZW91dCB3aXRoIHRoZWlyIHJlcXVlc3QgaXMgYSBtb3JlIGNvbXBsaWNhdGVkIGNo
YW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5j
b20+DQoNCk11c3QgaGF2ZSBiZWVuIHF1aXRlIHNvbWUgdGltZSBzaW5jZSB2MiAuLi4NCg0KSmFu
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
