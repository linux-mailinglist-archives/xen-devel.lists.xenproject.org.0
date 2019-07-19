Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427036E24A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 10:12:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoNvl-0000GV-TO; Fri, 19 Jul 2019 08:07:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoNvk-0000GQ-Jt
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 08:07:52 +0000
X-Inumbo-ID: 405e2b36-a9fc-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 405e2b36-a9fc-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 08:07:50 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 08:07:30 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 08:04:46 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 08:04:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoVEoVna4x/Nreng4ZKfoBN0q3GSaUwAap3X52hVec+LqoF6ack0skMEFmTnmzLaJYxgr+2tm4OeQSxoNH+mRcvruIxa1U72Di/3kQih6WxiIqLNNYwdIt3hwzcKKpi9NPFZu+9lRmzyoLpldPwnJ8zHEd5zRPz/4o6NUMMV8Tn0V38ITXx+7ZzEeuMCsPf9bfRWJ3PqVXzqI7Q1aS2CIxsHQTxFvQbp75ws7TP8ELRfeIeLha0sI2ZIIgu9+TB9ELZs8Rk2xGqkX2x2DX6PhFWPGIrPcLU0tAeGE9HHx82U7NaVwoRRDSqQ5CiGAGopVWhvmpW95UmmWb+fJKgB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFWptcam5i5EQlQE4vbKBA0alU4Lzecql0ADQzSMEa0=;
 b=QUdtGVfzjnmYjIhx+NhF4Y+lHB2kUaijuhTKxl2gMPHgW52WPCDH6e1Pg1a2KhoDt4jxbp6tubK02tn7UIRIX0r2hJgnbOJfOc/oNnZ5nSyYxZTXLhODcfD/B/oGbmDNPqE/GFnMYta/q3pHn6GO0QD/WGm2XGDRFa7C5R4lSapA8+o/X2DN4e+P4h6tHAJhPUGZDkwycq1dpv0GzokLfJ+GId7SP0u6+6lT8srs5m3g4BKUWolrNf+wQVNqdU8dvUudwZxx+gp7S3s4NS/JhbKwJ+0eUM5RrKtxjaYfqbHsLtYE7ing0Fjav9ff+Bd3KuMzmJsqTY2KtFTsSIlE0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3402.namprd18.prod.outlook.com (10.255.174.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.11; Fri, 19 Jul 2019 08:04:45 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 08:04:45 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
Thread-Index: AQHVPW85l6TypzCOPUKKzJbbmldm3qbQfOwAgAAauduAAP6xgA==
Date: Fri, 19 Jul 2019 08:04:45 +0000
Message-ID: <f5ff77af-d2d5-1a89-06d4-6049f607ec80@suse.com>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <7280f16277aa9d7bdc9c2373277ef1b40459090b.1563325215.git-series.marmarek@invisiblethingslab.com>
 <20190717101843.2nmigl4dt4kekuax@Air-de-Roger.citrite.net>
 <20190717235426.GX1250@mail-itl>
 <20190718134604.owj6l4hk7rjq72es@Air-de-Roger.citrite.net>
 <9d0c36b7-97d3-5da8-c35b-7073c2066841@suse.com>
 <20190718165212.rj23yh5bphtc2cq5@Air-de-Roger.citrite.net>
In-Reply-To: <20190718165212.rj23yh5bphtc2cq5@Air-de-Roger.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0030.eurprd05.prod.outlook.com
 (2603:10a6:4:67::16) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f11a9aa-2d6b-4494-8284-08d70c1fc2d6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3402; 
x-ms-traffictypediagnostic: DM6PR18MB3402:
x-microsoft-antispam-prvs: <DM6PR18MB34021579971BACDDB336D951B3CB0@DM6PR18MB3402.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(189003)(199004)(36756003)(446003)(14454004)(316002)(53936002)(26005)(478600001)(6436002)(229853002)(2906002)(25786009)(6486002)(6512007)(68736007)(66476007)(386003)(53546011)(102836004)(52116002)(186003)(76176011)(6916009)(71190400001)(2616005)(6506007)(6246003)(11346002)(81166006)(80792005)(4326008)(6116002)(3846002)(54906003)(486006)(256004)(5660300002)(31696002)(66066001)(7736002)(99286004)(86362001)(64756008)(66556008)(66446008)(66946007)(31686004)(305945005)(8676002)(8936002)(476003)(71200400001)(7416002)(14444005)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3402;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HpDT9XmGZb/8KzyGu76KW8rVHd2Cuayvf8eMECk0r4+bltEHBoUQj+cVoxos7SGp8sXQ6ra36ic19FF43zP453M6qDbcPXmvRPnocfU8fBSr2sM0CLF9uoKPdmyI6l4NQ0Q03BZowp6dWtzaKDQERY2WoBXmnxl5VyS2oQurZsk+RrYzL6dunqqhICCDhOyXdn5FvNj+3+uQHbi5A9lXn4aWDmwpzy/1CyB5bWbZUX4i9C7y1NhLH46iqAo3ghX32n6JJy8aLMG0dLHXejk/R4jwl79N3LvFLMVyL6ZlJ9kPUKZtsGR0mfKoL7bJVJlLw7Abp6s12U/EJ55pv0/g6wh+HiP5ZiWKccHG+3FZ1I1Zm1/cNVzBFndFRhnKMDA8sPraU4Y8USYK2mLtcs8yLQjYL1M4+Z6iIE+DYE8oCDk=
Content-ID: <77F51D18F3CD8347B6264279D8A53F32@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f11a9aa-2d6b-4494-8284-08d70c1fc2d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 08:04:45.0400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3402
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxODo1MiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFRodSwg
SnVsIDE4LCAyMDE5IGF0IDAzOjE3OjI3UE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
T24gMTguMDcuMjAxOSAxNTo0NiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+Pj4gSW4gZmFj
dCBJIGRvbid0IHRoaW5rIElOVHggc2hvdWxkIGJlIGVuYWJsZWQgd2hlbiBNU0koLVgpIGlzIGRp
c2FibGVkLA0KPj4+IFFFTVUgYWxyZWFkeSB0cmFwcyB3cml0ZXMgdG8gdGhlIGNvbW1hbmQgcmVn
aXN0ZXIsIGFuZCBpdCB3aWxsIG1hbmFnZQ0KPj4+IElOVHggZW5hYmxpbmcvZGlzYWJsaW5nIGJ5
IGl0c2VsZi4gSSB0aGluayB0aGUgb25seSBjaGVjayByZXF1aXJlZCBpcw0KPj4+IHRoYXQgTVNJ
KC1YKSBjYW5ub3QgYmUgZW5hYmxlZCBpZiBJTlR4IGlzIGFsc28gZW5hYmxlZC4gSW4gdGhlIHNh
bWUNCj4+PiB3YXkgYm90aCBNU0kgY2FzcGFiaWxpdGllcyBjYW5ub3QgYmUgZW5hYmxlZCBzaW11
bHRhbmVvdXNseS4gVGhlDQo+Pj4gZnVuY3Rpb24gc2hvdWxkIG5vdCBleHBsaWNpdGx5IGRpc2Fi
bGUgYW55IG9mIHRoZSBvdGhlciBjYXBhYmlsaXRpZXMsDQo+Pj4gYW5kIGp1c3QgcmV0dXJuIC1F
QlVTWSBpZiB0aGUgY2FsbGVyIGF0dGVtcHRzIGZvciBleGFtcGxlIHRvIGVuYWJsZQ0KPj4+IE1T
SSB3aGlsZSBJTlR4IG9yIE1TSS1YIGlzIGVuYWJsZWQuDQo+Pg0KPj4gWW91IGRvIHJlYWxpemUg
dGhhdCBwY2lfaW50eCgpIG9ubHkgZXZlciBnZXRzIGNhbGxlZCBmb3IgWGVuDQo+PiBpbnRlcm5h
bGx5IHVzZWQgaW50ZXJydXB0cywgaS5lLiBtYWlubHkgdGhlIHNlcmlhbCBjb25zb2xlIG9uZT8N
Cj4gDQo+IFlvdSB3aWxsIGhhdmUgdG8gYmVhciB3aXRoIG1lIGJlY2F1c2UgSSdtIG5vdCBzdXJl
IEkgdW5kZXJzdGFuZCB3aHkNCj4gaXQgZG9lcyBtYXR0ZXIuIERvIHlvdSBtZWFuIHRvIHBvaW50
IG91dCB0aGF0IGRvbTAgaXMgdGhlIG9uZSBpbiBmdWxsDQo+IGNvbnRyb2wgb2YgSU5UeCwgYW5k
IHRodXMgWGVuIHNob3VsZG4ndCBjYXJlIG9mIHdoZXRoZXIgSU5UeCBhbmQNCj4gTVNJKC1YKSBh
cmUgZW5hYmxlZCBhdCB0aGUgc2FtZSB0aW1lPw0KPiANCj4gSSBzdGlsbCB0aGluayB0aGF0IGF0
IGxlYXN0IGEgd2FybmluZyBzaG91bGQgYmUgcHJpbnRlZCBpZiBhIGNhbGxlcg0KPiB0cmllcyB0
byBlbmFibGUgTVNJKC1YKSB3aGlsZSBJTlR4IGlzIGFsc28gZW5hYmxlZCwgYnV0IHVubGVzcyB0
aGVyZSdzDQo+IGEgcmVhc29uIHRvIGhhdmUgYm90aCBNU0koLVgpIGFuZCBJTlR4IGVuYWJsZWQg
YXQgdGhlIHNhbWUgdGltZSAobWF5YmUNCj4gYSBxdWlyayBmb3Igc29tZSBoYXJkd2FyZSBpc3N1
ZT8pIGl0IHNob3VsZG4ndCBiZSBhbGxvd2VkIG9uIHRoaXMgbmV3DQo+IGludGVyZmFjZS4NCg0K
SSBkb24ndCBtaW5kIGltcHJvdmVtZW50cyB0byB0aGUgY3VycmVudCBzaXR1YXRpb24gKGkuZS4g
c3VjaCBhDQp3YXJuaW5nIG1heSBpbmRlZWQgbWFrZSBzZW5zZSk7IEkgbWVyZWx5IHN0YXRlZCBo
b3cgdGhpbmdzIGN1cnJlbnRseQ0KYXJlLiBJTlR4IHRyZWF0bWVudCB3YXMgY29tcGxldGVseSBs
ZWZ0IGFzaWRlIHdoZW4gTVNJIHN1cHBvcnQgd2FzDQppbnRyb2R1Y2VkIGludG8gWGVuLg0KDQpK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
