Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1426E606
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:03:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSUW-0007Al-DE; Fri, 19 Jul 2019 13:00:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoSUV-00073R-8J
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:00:03 +0000
X-Inumbo-ID: 1469155c-aa25-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1469155c-aa25-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 13:00:02 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 12:59:45 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 12:59:36 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 12:59:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/g7jxK84i/PKbJfamfH1pfqpnF8fT+GKu8o+ZUY028HERys7N264Ps7C8tS6IgN13VH1G4uWpcVbnihlaEn+lRjXMDzxek0SbOt/5gjT/KV07UJAlo7ydptgYhWME2x9eFHFUuB4JoSUC0fA8fsyfAJfksKaa38aFgo7e1reFuy6J/ZzDd17TM8+zG5fFX75i0PNljhrz26+neITOiRZxjbEwvNnE735Zck3+y51YNGK6lzacw+bKbHGT7zpzlSriPeKfJng8eS1WDpbYJgEC54n7BUFRHaUZvTMz8m++GBPmnjt1NO3FSyIpjVw5VDtaYfqRTQU3qd+H47vQOJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUl2TuZOl/WmYvqmfYjy9BueKAsbDJIpm/6uy+OODJI=;
 b=LVnr2i4LlJLCSJPUjwXJaypQLc+n1aE5eVPSum23NOXeahZcPFYbny9j0ija0upf144eqGzQSrnFrDU/7d1s8232qkeJaq5V6quhTdFUlN3UqX/TEBy2WA/DtvqhH06DmbQBKdXJQJye30dI0Z2mDQgA+mRvDj40iAp3NHOlHAZgFlCDX2A3LBM+E59Q5FQUJOBNeuWOISFohloybseCUHUmEVh1Y6POJmQwBMHoQRNaJ2wcivt2lD7MYuoyovReL12bw1JSlxC0VRJkkCNL1UWeer0vupAN85x9C3KiJohMyDy7a2MrJ970O+LnKcYLArVZkT0Ju94tBcG/yhha5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3098.namprd18.prod.outlook.com (10.255.76.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 12:59:34 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 12:59:34 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ja8zGHp8jkY0SwPhMewFAvpabOwNgAgAAfJACAAWdVAIABTcoA///mggCAACI9gIAAEGyAgAAuTSD//+TaAIAAId8AgAAIXQA=
Date: Fri, 19 Jul 2019 12:59:34 +0000
Message-ID: <96e2ece1-5460-52d5-d2a5-8123d8148441@suse.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
 <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
 <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
 <d73a2d9ba0b5407390ae9a635314f6d4@AMSPEX02CL03.citrite.net>
 <014491cd-8ee7-26ff-5619-6c5d54c51b3c@suse.com>
 <ebe52ee6d8a9483b87f21d01c5f2c435@AMSPEX02CL03.citrite.net>
 <bf1c57019b77fd6b79f86957477862ae81db5678.camel@bitdefender.com>
 <875eb41c92654f5a85625f0cc08994b5@AMSPEX02CL03.citrite.net>
 <88cd6480-cda4-5e9b-2e9a-aa1e275832cb@suse.com>
 <24e346edb9604148b5790369b4fce384@AMSPEX02CL03.citrite.net>
In-Reply-To: <24e346edb9604148b5790369b4fce384@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR02CA0025.eurprd02.prod.outlook.com
 (2603:10a6:6:15::38) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56ed6aad-319d-4290-bbce-08d70c48f2a1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3098; 
x-ms-traffictypediagnostic: DM6PR18MB3098:
x-microsoft-antispam-prvs: <DM6PR18MB30985D301BA8EC2196027FD1B3CB0@DM6PR18MB3098.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(199004)(189003)(13464003)(76176011)(68736007)(6512007)(66066001)(2616005)(6436002)(99286004)(7416002)(5660300002)(3846002)(71200400001)(229853002)(6116002)(316002)(25786009)(53936002)(7736002)(86362001)(31686004)(8936002)(305945005)(8676002)(81166006)(186003)(54906003)(66476007)(66946007)(52116002)(36756003)(2906002)(6246003)(6486002)(256004)(4326008)(66446008)(53546011)(81156014)(6506007)(446003)(26005)(478600001)(386003)(71190400001)(102836004)(80792005)(31696002)(486006)(14454004)(4744005)(476003)(64756008)(66556008)(11346002)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3098;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BCJgUwhIPViu6kDFF0/Xm5olsabB8GnObc+zZF7+TdNxxGfXtW7gMTJTSNKEiXudiG74hMq6tbvFPMotGBMeYH7QjZgWH+Mi7sHA25koHh5QjhX6MitiDjiEvj1S5yjg1WBuQzoLUx5xQqaCM6NLci6oiiSbSXKXR1iHAcRQghueZ942ffnVUn0eu5rqrB3bysHGXC7LB17VO6Qni8tbgAwnerIZrhJl8NkO/xh/a3xGxQsrMX5lMcNJc4e3LbBaFV7MS7uMlfi4qNTfhwEO/LhZFvLBhmwoiy2lPQROBgjSgeMw1OekfSHPsyke/72uY13i+NFc32jr9ByqhAyUbtCsISe3be1vcA9sT4FLA8wjOrdkIHBSn2lXdgPT1Lqrpa23AndM1SXY0pzS2oZQ11EC3NZaNszP9VpbjFRPyIU=
Content-ID: <77463DA043CF7F4F90AFEE443ED2D1CC@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ed6aad-319d-4290-bbce-08d70c48f2a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 12:59:34.6797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3098
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
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
Cc: 'Petre Ovidiu PIRCALABU' <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim\(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 IanJackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxNDozNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gRnJvbTogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPj4gU2VudDogMTkgSnVseSAyMDE5IDEzOjMyDQo+
Pg0KPj4gT24gMTkuMDcuMjAxOSAxNDoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+PiBGcm9tOiBQZXRyZSBPdmlkaXUgUElSQ0FMQUJV
IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4+Pj4gU2VudDogMTkgSnVseSAyMDE5IDEy
OjI0DQo+Pj4+DQo+Pj4+IFNvcnJ5LCBteSBtaXN0YWtlLiBJIG1lYW50IHRvIHNheSBpdCdzIHNo
YXJlZCB3aXRoIE1ELg0KPj4+Pg0KPj4+PiBNYW55IHRoYW5rcyBmb3IgeW91ciBzdXBwb3J0LA0K
Pj4+DQo+Pj4gT2ssIGluIHRoYXQgY2FzZSBwbGVhc2Ugc2hhcmUgd2l0aCB0aGUgSUQgaW5zdGVh
ZC4NCj4+DQo+PiBCdXQgdGhhdCdzIGV4YWN0bHkgd2hhdCB3ZSB3YW50IHRvIGF2b2lkOiBJZiBz
aGFyaW5nIGF0IGFsbCwgdGhlbg0KPj4gcGxlYXNlIHdpdGggdGhlIG1vcmUgcHJpdmlsZWdlZCBl
bnRpdHkuDQo+IA0KPiBXaHk/IFdlJ3JlIHRhbGtpbmcgSFZNIGd1ZXN0cyBvbmx5IGhlcmUgSUlV
QyBzbyB0aGlzIGlzIGVxdWl2YWxlbnQNCj4gdG8gSU9SRVEgc2VydmVyLi4uDQoNCk5vdCBzdXJl
OiBUaGUgbWFpbiB2bV9ldmVudC5jIGZpbGVzIGxpdmUgaW4gY29tbW9uLyBhbmQgYXJjaC94ODYv
DQpyZXNwZWN0aXZlbHksIHNvIEkgdGhvdWdodCBhdCBsZWFzdCBhcmNoaXRlY3R1cmFsbHkgVk0g
ZXZlbnRzIHdlcmUNCnBvc3NpYmxlIGZvciBQViBhcyB3ZWxsLiBJZiBpdCdzIGluZGVlZCBIVk0t
b25seSwgdGhlbiBmb2xsb3dpbmcNCnRoZSBJT1JFUSBzZXJ2ZXIgbW9kZWwgaW4gaXRzIGVudGly
ZXR5IHdvdWxkIG9mIGNvdXJzZSBiZSBmaW5lLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
