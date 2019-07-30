Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513487A552
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 12:00:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOta-0002MW-Au; Tue, 30 Jul 2019 09:58:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsOtY-0002MO-Rf
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:58:12 +0000
X-Inumbo-ID: 8a3a4ec4-b2b0-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a3a4ec4-b2b0-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 09:58:11 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 09:58:09 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 09:44:19 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 09:44:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/l+F23H/vzpCvpM8qdDFG5gMzpjRsSHhGz/2IDg9egJvwk+V1dacSuD8k179137vkgbUaGclQbcWBleMF5+GqQaOcHdll3uncQIJvj77tSvcCZNLBrXqNuSkSZRqPKj2NBb1RsJgkAQEST8n9X5tq+7FdQtGX4u3YKoG9ceQKHwwaKZH6HOKKXWKhVpPdFwCnMWzMuJIceRhpiFmVn3KzAkL/8wf5TqA/H1BHgB14HCdpUBLXm+N2Hn3uQOL4I/m88GAPxyqRciFcMx+4GKe0Atch721R7JbunRHCu4zClfCiw/I21zJu5wR2FHGhjRVrOX5uIhAxxVrpb6x8wdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRIHTvYDzR+Gc21NdtDUHm977Yif5xPTPKMU5kTN0qM=;
 b=DrAQZThQX7ItSBLinrrIE828xJBwVH5dnMhme+NydsD/SOzRG9rx22Y32oLt4Et9EenpnGDik62eH6Lok70CQKHXzzzHaH1RPVnfd/NIJhbJCVjacKtXpilyx7oQW5AbcHgDBltzZCP/Hy9IEynsdzMbPDf1+G4elPsk6jLWornNKQ1+B1B8XH8Mfm1yv4eQhmxguzPLQTmdIMCzv0+25EOHyLOJ+6B5qRmWDhWuHwvbmdAZhyy45gL9VX0he+SAUQNNEx7YzWclLa8+R0ohe5WNhEkGxJPEw0FDLLwOUFTxunNni6smoCSzj6nPC7ZEPyEczu6/SQey7OjZNggLaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3235.namprd18.prod.outlook.com (10.255.136.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 09:44:18 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 09:44:18 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 07/10] xen/nodemask: Drop nodes_{setall,clear}() and
 improve the initialisers
Thread-Index: AQHVRgbx+NC5iMPPZEewtwNnf41+y6bi6p2A
Date: Tue, 30 Jul 2019 09:44:18 +0000
Message-ID: <3a6217c6-25d3-3882-99da-846a957d4c02@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-8-andrew.cooper3@citrix.com>
In-Reply-To: <20190729121204.13559-8-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P18901CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:4:16::16) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a51c9bf4-67a7-4253-be2d-08d714d27da9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3235; 
x-ms-traffictypediagnostic: BY5PR18MB3235:
x-microsoft-antispam-prvs: <BY5PR18MB323556DC13D462894D115A85B3DC0@BY5PR18MB3235.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(199004)(189003)(2906002)(54906003)(31686004)(5660300002)(71190400001)(14454004)(53546011)(386003)(36756003)(76176011)(71200400001)(305945005)(478600001)(80792005)(99286004)(102836004)(6116002)(3846002)(6246003)(316002)(6506007)(53936002)(31696002)(8936002)(6486002)(25786009)(52116002)(476003)(256004)(81166006)(81156014)(86362001)(6436002)(229853002)(6512007)(7736002)(186003)(446003)(486006)(11346002)(2616005)(66556008)(4326008)(8676002)(66946007)(66476007)(64756008)(26005)(6916009)(68736007)(66066001)(66446008)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3235;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +jfDXUIpJWky7FUfLkuHQiRcX9nlN/Pyui7m+W+bY0K1kQ6EpafxGe1ZfgdE8wme8AJ/YAsLyMohCM3HUfInBsWvKCi6TRpvgu775E+s6bdvSVTZyFwmyRgXNwPg3tJWfTL9egMzON4WfA1ddkCakUk2H4pJTdleoyv0HMfmVT+eqTqci075q3SnSB+9b5fFfyp6EC8zPJLEVZf80y3rJ+l2StglPCBhURlzrRtf00mHianLIyJrVnfXLySw0XbAvBTn5BIFt1IgOGMmqkxqOYqr+nMiXV06i/gJ9gCkaxrrvy8f3cRM/ZHNmeVkWw071l03jZGuFU2ReNxPgyjiWUV+lyF4HCUZLx+YwNuHIZuru+WehN0OtJ7He6403nEePaaAs/tY7pYNHrYvFWTy3p92y8dD/Ro34JxiEDDqycQ=
Content-ID: <3B71F26DACC9814F9B32536BA86A0783@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a51c9bf4-67a7-4253-be2d-08d714d27da9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 09:44:18.3186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3235
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 07/10] xen/nodemask: Drop nodes_{setall,
 clear}() and improve the initialisers
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxNDoxMiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gVGhlcmUgaXMgbm8g
bmVlZCB0byB1c2UgcnVudGltZSB2YXJpYWJsZS1sZW5ndGggY2xlYXJpbmcgd2hlbiBNQVhfTlVN
Tk9ERVMgaXMNCj4ga25vd24gdG8gdGhlIGNvbXBpbGVyLiAgRHJvcCB0aGVzZSBmdW5jdGlvbnMg
YW5kIHVzZSB0aGUgaW5pdGlhbGlzZXJzIGluc3RlYWQuDQoNClRoZSBvbmx5IHNsaWdodCBjb25j
ZXJuIEkgaGF2ZSB3aXRoIHRoaXMgaXMgdGhhdCBpdCBmdXJ0aGVyIGxvY2tzDQpkb3duIHRoZSBt
YXhpbXVtIHJlbWFpbmluZyB0byBiZSBhIGNvbXBpbGUgdGltZSBjb25zdGFudC4gQnV0IHRoaXMN
CmlzIG5vdCBhbiBvYmplY3Rpb24sIGp1c3QgYSByZW1hcmsuDQoNCj4gQEAgLTY3LDcgKzY1LDM0
IEBAIHR5cGVkZWYgc3RydWN0IHsgREVDTEFSRV9CSVRNQVAoYml0cywgTUFYX05VTU5PREVTKTsg
fSBub2RlbWFza190Ow0KPiAgIA0KPiAgICNkZWZpbmUgbm9kZW1hc2tfYml0cyhzcmMpICgoc3Jj
KS0+Yml0cykNCj4gICANCj4gLWV4dGVybiBub2RlbWFza190IF91bnVzZWRfbm9kZW1hc2tfYXJn
XzsNCj4gKyNkZWZpbmUgTk9ERU1BU0tfTEFTVF9XT1JEIEJJVE1BUF9MQVNUX1dPUkRfTUFTSyhN
QVhfTlVNTk9ERVMpDQo+ICsNCj4gKyNkZWZpbmUgTk9ERU1BU0tfTk9ORSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gKygobm9kZW1hc2tfdCkg
e3sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwNCj4gKyAgICAgICAgWzAgLi4uIEJJVFNfVE9fTE9OR1MoTUFYX05VTU5PREVTKSAtIDFdID0g
MCAgICAgICAgICAgICAgICAgICAgIFwNCj4gK319KQ0KPiArDQo+ICsjaWYgTUFYX05VTU5PREVT
IDw9IEJJVFNfUEVSX0xPTkcNCj4gKw0KPiArI2RlZmluZSBOT0RFTUFTS19BTEwgICAgICAoKG5v
ZGVtYXNrX3QpIHt7IE5PREVNQVNLX0xBU1RfV09SRCB9fSkNCj4gKyNkZWZpbmUgTk9ERU1BU0tf
T0Yobm9kZSkgKChub2RlbWFza190KSB7eyAxVUwgPDwgKG5vZGUpIH19KQ0KPiArDQo+ICsjZWxz
ZSAvKiBNQVhfTlVNTk9ERVMgPiBCSVRTX1BFUl9MT05HICovDQo+ICsNCj4gKyNkZWZpbmUgTk9E
RU1BU0tfQUxMICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwNCj4gKygobm9kZW1hc2tfdCkge3sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gKyAgICAgICAgWzAgLi4uIEJJVFNfVE9fTE9O
R1MoTUFYX05VTU5PREVTKSAtIDJdID0gfjBVTCwgICAgICAgICAgICAgICAgIFwNCj4gKyAgICAg
ICAgW0JJVFNfVE9fTE9OR1MoTUFYX05VTU5PREVTKSAtIDFdID0gTk9ERU1BU0tfTEFTVF9XT1JE
ICAgICAgICAgIFwNCj4gK319KQ0KPiArDQo+ICsjZGVmaW5lIE5PREVNQVNLX09GKG5vZGUpICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsoeyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcDQo+ICsgICAgbm9kZW1hc2tfdCBtID0gTk9ERVNfTk9ORTsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgbS5iaXRzWyhub2RlKSAvIEJJ
VFNfUEVSX0xPTkddID0gMVVMIDw8ICgobm9kZSkgJSBCSVRTX1BFUl9MT05HKTsgICBcDQoNCkkg
dGhpbmsgeW91IHdpbGwgd2FudCB0byBhdm9pZCB0aGUgZG91YmxlIGV2YWx1YXRpb24gb2YgIm5v
ZGUiDQpoZXJlLiBXaXRoIHRoaXMgdGFrZW4gY2FyZSBvZg0KUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
