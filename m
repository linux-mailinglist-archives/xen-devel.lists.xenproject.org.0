Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1823A636E5
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 15:26:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkq5d-0002Mt-Bl; Tue, 09 Jul 2019 13:23:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hkq5b-0002Mj-R1
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 13:23:23 +0000
X-Inumbo-ID: b95f7647-a24c-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b95f7647-a24c-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 13:23:22 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  9 Jul 2019 13:23:21 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 9 Jul 2019 13:23:20 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 9 Jul 2019 13:23:20 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2809.namprd18.prod.outlook.com (20.179.50.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 13:23:19 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 13:23:19 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86/grant: Use explicit instruction size in
 gnttab_clear_flags()
Thread-Index: AQHVNdrwyPrIs+JHfUaOvCGKE0IMz6bCRzsA
Date: Tue, 9 Jul 2019 13:23:19 +0000
Message-ID: <aaba481b-90b4-75bd-765e-bcb7b476594d@suse.com>
References: <20190708221522.967-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190708221522.967-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CH2PR19CA0028.namprd19.prod.outlook.com
 (2603:10b6:610:4d::38) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.80.71.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33fac228-bedc-41d7-1cd0-08d704709ba2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2809; 
x-ms-traffictypediagnostic: DM6PR18MB2809:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR18MB28091F9A7A5C35CA4025A4CBB3F10@DM6PR18MB2809.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(199004)(189003)(11346002)(68736007)(8936002)(446003)(4326008)(2616005)(81166006)(66066001)(31686004)(99286004)(3846002)(14444005)(2906002)(486006)(71190400001)(71200400001)(6916009)(6486002)(229853002)(14454004)(186003)(6116002)(7736002)(64756008)(6436002)(6246003)(66446008)(305945005)(66476007)(66556008)(53936002)(6512007)(81156014)(73956011)(86362001)(8676002)(76176011)(66946007)(5660300002)(316002)(72206003)(102836004)(4744005)(26005)(256004)(476003)(966005)(6506007)(386003)(52116002)(80792005)(25786009)(31696002)(54906003)(53546011)(6306002)(36756003)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2809;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: csjx6sfhOsVq1kPx7DfYYTw2VTnH/YpcnLKNephVKvflQoc/I/33yWBEW2uXC3+BARlIKZB44HvnwYKtnRadFYxeoQkzJNVKsOnL+JeHPo3tKy7KH7WmE0ZoEW5vOFnqTbUELRGQDMsXhKvr2YHq1Crq7jBoLSshbgUTCeABqhhLwevF0ImdHxhbMZ0jx7rarySNV44AwnGF9xcLb9tde88Tc2egwQ+72h3AluuOqm/wrCFxNKY27TvJ3Jgz715ls0VXJQJeApTY8xA63Hi0QAkSkMmU50BdmxIxY7kvMy94cnr/2NW4ARM6sPD4WNrAO9MWzxlpq4P9bBYC7atUZQR2sDFypXXU9rPKyiQtuzbVA+I0JGThcwRYsDt7cldHOUblKpyYT51MFTsUD4NdAsz2SobmWRn2bvLVy5UWuCs=
Content-ID: <841461EEFBF837438888FE7E95A4B9E5@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fac228-bedc-41d7-1cd0-08d704709ba2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 13:23:19.1834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2809
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/grant: Use explicit instruction size in
 gnttab_clear_flags()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDcuMjAxOSAwMDoxNSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gVGhlIE9wZW5TVVNF
IExlYXAgY29tcGlsZXJzIGNvbXBsYWluIGFib3V0IGFtYmlndWl0eToNCj4gDQo+IEluIGZpbGUg
aW5jbHVkZWQgZnJvbSBncmFudF90YWJsZS5jOjMzOg0KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20g
Li4ueGVuL2luY2x1ZGUveGVuL2dyYW50X3RhYmxlLmg6MzA6DQo+IC4uLnhlbi9pbmNsdWRlL2Fz
bS9ncmFudF90YWJsZS5oOjY3OjE5OiBlcnJvcjogYW1iaWd1b3VzIGluc3RydWN0aW9ucyByZXF1
aXJlDQo+IGFuIGV4cGxpY2l0IHN1ZmZpeCAoY291bGQgYmUgJ2FuZGInLCAnYW5kdycsICdhbmRs
Jywgb3IgJ2FuZHEnKQ0KPiAgICAgIGFzbSB2b2xhdGlsZSAoImxvY2sgYW5kICUxLCUwIiA6ICIr
bSIgKCphZGRyKSA6ICJpciIgKCh1aW50MTZfdCl+bWFzaykpOw0KPiAgICAgICAgICAgICAgICAg
ICAgXg0KPiA8aW5saW5lIGFzbT46MToyOiBub3RlOiBpbnN0YW50aWF0ZWQgaW50byBhc3NlbWJs
eSBoZXJlDQo+ICAgICAgICAgIGxvY2sgYW5kICQtMTcsKCVyc2kpDQo+ICAgICAgICAgIF4NCg0K
V293IC0gcHJldHR5IGhlbHBmdWwgaW1wcm92ZW1lbnQgdG8gdGhlIGNvbXBpbGVyLCBhbGJlaXQg
SSBoYXZlDQpubyBpZGVhIGhvdyB0aGlzIGFjdHVhbGx5IHdvcmsuIFRoZSBhc3NlbWJsZXIgd291
bGQgaGF2ZSBwaWNrZWQNCmFuZGwgaGVyZS4NCg0KPiBGdWxsIGxvZ3M6IGh0dHBzOi8vZ2l0bGFi
LmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYW5keWhocC94ZW4vLS9qb2JzLzI0NzYwMDI4NA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K
DQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
