Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63C2636C9
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 15:20:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkq0X-0001UY-F3; Tue, 09 Jul 2019 13:18:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hkq0V-0001UQ-NJ
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 13:18:07 +0000
X-Inumbo-ID: fa84eb0b-a24b-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fa84eb0b-a24b-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 13:18:06 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  9 Jul 2019 13:18:03 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 9 Jul 2019 13:16:53 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 9 Jul 2019 13:16:53 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3020.namprd18.prod.outlook.com (20.179.107.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 13:16:52 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 13:16:52 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v2 4/5] xen/gnttab: Refactor gnttab_clear_flag() to be
 gnttab_clear_flags()
Thread-Index: AQHVNbipULvbrtZ4JEWxG60w7ql3hKbBGyRcgAEqjQA=
Date: Tue, 9 Jul 2019 13:16:52 +0000
Message-ID: <1d5bbadd-8be2-d653-4904-3613fa33b19e@suse.com>
References: <1561109798-8744-5-git-send-email-andrew.cooper3@citrix.com>
 <20190704191449.22486-1-andrew.cooper3@citrix.com>
 <96aff7db-67f7-546a-da63-a915cdadd7b9@arm.com>
 <fba23c81-2ab9-28b8-86f2-89b3220345a9@citrix.com>
 <14762cea-1b87-4dea-69cc-6e4cf001c73b@arm.com>
In-Reply-To: <14762cea-1b87-4dea-69cc-6e4cf001c73b@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:208:160::36) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.80.71.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b34e23d6-0b65-430c-6320-08d7046fb508
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3020; 
x-ms-traffictypediagnostic: DM6PR18MB3020:
x-microsoft-antispam-prvs: <DM6PR18MB30206162920D7F2636B328DAB3F10@DM6PR18MB3020.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(189003)(199004)(81156014)(54906003)(81166006)(186003)(31686004)(316002)(446003)(71200400001)(476003)(53546011)(66066001)(76176011)(99286004)(80792005)(2616005)(3846002)(6116002)(53936002)(7736002)(6506007)(68736007)(8936002)(11346002)(86362001)(102836004)(72206003)(386003)(6916009)(26005)(6246003)(486006)(305945005)(8676002)(31696002)(14454004)(73956011)(256004)(36756003)(4326008)(25786009)(6512007)(71190400001)(478600001)(66556008)(64756008)(66446008)(66946007)(66476007)(229853002)(2906002)(6486002)(52116002)(5660300002)(6436002)(14444005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3020;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wr+4XE3s6IMm2XQf7OtbzK27+nenpC7Fl0EvqbY/xtbiO3DP0rZqQdocM1N78uTc79FOZE2Zs0i10ZwwrRgolzvt9QPMzaaWqqgoeZGLRAQnaP46PW1bvY9fGNhP6bE/B4hC1PQllPk8VgvAZzgz+581sA8DwmoPUzlKayUBS/HbHHMhiiQ5f+KwDFZ5jaGJd21HWmhO9Hy+A3l5BIQEuZ90PJwzvlaF4hAKU+ga8YR2PIgq59wFsrT3B4CMI22icbvat9PbokhGonjaHNJ5LaEbisvNMwS+EvaAfCOJUwpWhBb6PvCreoV4BJiiZgJUIp8zE/NGSy8KKEdkG6Rd/PxugamsbKXcD39/D0YJBdONAEBpAYRhgNCtM9DmLRrvkglshUMaE4ATi85SRUAlgJTG0tLYpR9wx0hS3OP4CMQ=
Content-ID: <4EA00618F92FAF4796875C594D734148@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b34e23d6-0b65-430c-6320-08d7046fb508
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 13:16:52.2900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3020
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 4/5] xen/gnttab: Refactor
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDcuMjAxOSAyMToyNywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSwNCj4gDQo+IE9u
IDcvOC8xOSA3OjExIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMDcvMDcvMjAxOSAx
OTo0MiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEFuZHJldywNCj4+Pg0KPj4+IE9uIDcv
NC8xOSA4OjE0IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+PiBUbyBhbGxvdyBmb3IgZnVy
dGhlciBpbXByb3ZlbWVudHMsIGl0IGlzIHVzZWZ1bCB0byBiZSBhYmxlIHRvIGNsZWFyDQo+Pj4+
IG1vcmUgdGhhbg0KPj4+PiBhIHNpbmdsZSBmbGFnIGF0IG9uY2UuwqAgUmV3b3JrIGdudHRhYl9j
bGVhcl9mbGFnKCkgaW50bw0KPj4+PiBnbnR0YWJfY2xlYXJfZmxhZ3MoKQ0KPj4+PiB3aGljaCB0
YWtlcyBhIGJpdG1hc2sgcmF0aGVyIHRoYW4gYSBiaXQgbnVtYmVyLg0KPj4+Pg0KPj4+PiBObyBw
cmFjdGljYWwgY2hhbmdlIHlldC4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IENDOiBKYW4g
QmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+DQo+Pj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
Pg0KPj4+PiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+Pj4+
IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4+IEND
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPj4+PiBDQzogR2VvcmdlIER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPg0KPj4+Pg0KPj4+PiB2MjoNCj4+Pj4g
wqDCoCAqIFVzZSB1bnNpZ25lZCBpbnQgZm9yIHRoZSBtYXNrIHBhcmFtZXRlcg0KPj4+DQo+Pj4g
SSBkb24ndCBzZWVtIHRvIGZpbmQgdGhlIHJlcXVlc3Qgb24gdGhlIE1MLiBUZWNobmljYWxseSB0
aGUgbWFzayBjYW4NCj4+PiBvbmx5IGJlIDE2LWJpdC4gTWF5IEkgYXNrIHRoZSByZWFzb24gb2Yg
dGhpcyBjaGFuZ2U/DQo+Pg0KPj4gSXQgaXMgb24gdGhlIG1haWxpbmcgbGlzdCwgYnV0IGFuIG9y
cGhhbmVkIGVtYWlsIGR1ZSB0byBKYW4ncyBlbWFpbCBjaGFuZ2VzLg0KPiANCj4gSXMgaXQgdGhl
IHNhbWUgcHJvYmxlbSBhcyBJIGhhdmUgc2VlbiB0aGUgcGFzdCA2IG1vbnRocyBiZXR3ZWVuIEp1
ZXJnZW4gYW5kIEphbidzIGUtbWFpbD8NCg0KTm8sIHRoaXMgd2FzIGR1ZSB0byBhIGRpc3J1cHRp
dmUgKG5vIGRhdGEgbWlncmF0aW9uKSBjaGFuZ2UgdG8gb3VyDQplbWFpbCBzeXN0ZW0uIEknbSBo
ZW5jZSB1bmFibGUgdG8gcHJvcGVybHkgcmVwbHkgdG8gbWFpbHMgc3RpbGwNCnNpdHRpbmcgaW4g
bXkgb2xkIG1haWxib3ggKG9ubHkpLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
