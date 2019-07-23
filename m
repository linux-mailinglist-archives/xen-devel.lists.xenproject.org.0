Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B161371C62
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 18:02:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpxCE-00008e-Qd; Tue, 23 Jul 2019 15:59:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpxCC-00008Z-RS
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 15:59:20 +0000
X-Inumbo-ID: ced208f6-ad62-11e9-bdd9-c7d04a3f0d2b
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ced208f6-ad62-11e9-bdd9-c7d04a3f0d2b;
 Tue, 23 Jul 2019 15:59:18 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 15:55:16 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 15:55:37 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 15:55:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwupeFfqn81sI31nQucIGOSNn27Cy6Zg/hii3jDaFgpJCfZq1H0svg3oA0B3LMq7gMKqNVLRMkBnAlFH1OwFAVCcl98z0AaAG/jSHxHiN8EEmDE8GIDkWwIAnsS9LK8gjjdVzL1IsKSmR9BSjHGUYGijUnNogmcaX9QMbtw/NT5iSEunzrSF2rqaISOViwjM5etyKnzuo9+AJz5pE7/82xMmNMIlPSvGNjkdHt6L4qIwsQ7ZA5caazBIFJiGAMlYFL/jEORfK5aXxXkc5FmhrvKoSVX13C0BFV/Obv47Ff6Bq+/mei6mp8skA3LW+aAGCWk4XcT2R6UmhJ8qrHf42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqsIiNDnNsmo138/skQvOCItdUNYEs40PGrLpu/+cQ8=;
 b=Q06+NLFn7zguuU6biKBBQSGlg0pnpNyE3zBg71dqcRD54Z/EePNIhs4FP4ET4h6T/3uhrBnQlVtBir/mdItdfDoB9BUCf1O/jrjjdL0t+1lIMdFLQZYG+Vgg7cUBaKz5qhKXmZKbV16IkMgIbXmUk1fO0sjYZ+6XF9aZF7LL/x+MBtDuILDRPe08GrZiZhXVvF0h4lus+k8wzX/wvxCa/jmCABKNRs94E9hymMPpnMYM2/JkbzN9RgHPSMd3A9FzHFtLhMSXDA3U0AdD26e7mStKcji4uxYONZBq1POiObf2L/GzuVPmAwjSnjwJLBZCsq3ihgoVzPwcL3ZSk5LVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2905.namprd18.prod.outlook.com (20.179.49.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 15:55:35 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 15:55:34 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
Thread-Index: AQHVQTgCmOXaxQxPLUKxvpzXZTTLrabYJaWAgAARcbKAACa/gP//4aOAgAAEQOaAAAmMAIAABVrXgAAJCYA=
Date: Tue, 23 Jul 2019 15:55:34 +0000
Message-ID: <5c69c3db-b30c-2f19-4670-e669ba0aea2d@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
 <eb7d7c8a-9bb1-f264-b72e-7e4c96087568@suse.com>
 <4c6a7888-d697-1b2c-cdbf-7127ae00bc4f@suse.com>
 <779077d6-5f07-9801-49e6-58fcd1fe31b4@suse.com>
 <e28384ea-4c85-e1c2-efce-01ec354d4ab3@suse.com>
 <fd38498a-2918-8cb1-3575-044ecbdd423e@suse.com>
 <0da102f5-6f61-4a14-5c07-3ac92f4db68c@suse.com>
 <1ac4a860-4bde-5566-18b8-2e435ee85bb1@suse.com>
In-Reply-To: <1ac4a860-4bde-5566-18b8-2e435ee85bb1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0180.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::24) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9b22b20-4f38-4bfe-3013-08d70f863269
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2905; 
x-ms-traffictypediagnostic: DM6PR18MB2905:
x-microsoft-antispam-prvs: <DM6PR18MB2905CF7151ED437FB8BDB3CFB3C70@DM6PR18MB2905.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39850400004)(376002)(396003)(366004)(346002)(199004)(189003)(66446008)(6486002)(66556008)(64756008)(66946007)(229853002)(5660300002)(86362001)(66476007)(25786009)(486006)(76176011)(6246003)(102836004)(26005)(6436002)(6862004)(53936002)(4326008)(81166006)(53546011)(31696002)(6512007)(81156014)(14444005)(8936002)(256004)(478600001)(71200400001)(316002)(6116002)(71190400001)(68736007)(8676002)(36756003)(80792005)(6636002)(37006003)(14454004)(54906003)(2906002)(31686004)(6506007)(66066001)(386003)(7416002)(11346002)(446003)(2616005)(476003)(99286004)(52116002)(7736002)(3846002)(186003)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2905;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O61xHwiGFMxviOtfQxL4wo32gzt1LNIcH+a0sclBoN6iPwMi0cNXCF0PFwM58JKsgGtKQ8VSs8IIdQxmTJPWaDBMV1TPIZx1H/OZ1D1/S5D+Woq0to/gTy48TDXG8IvTp5ODcrbWmWpBfKsvvanV2H+cRjfno4rp6npThZxpKNcm5gou97sLptJHWggrV45L763EcVqZwrR+ypmBbiuTRyy2oHZN0AlqEFbBrVCIF+xkvtVeqSyc5lHrp8PJeOqfEuHkyfPkLe1kQXaXCDBXAS9HVxKcMDz1Htpqwa//EyvDk+nu5GzZS1Kpb8S024qgLhb1ls/Uov1vPGFESRei6CeQJzAVnXP42jg5hAKoAekfmNkR2yY+MuC8FPE2VRWibILc9Td1C13w6/Jyg6JSC4PbA8ZxoPldXmDWUEhpw+E=
Content-ID: <CC1A8CB62CEAE94F99923ABE242A8A43@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b22b20-4f38-4bfe-3013-08d70f863269
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 15:55:34.4241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2905
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAxNzoyMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjMuMDcuMTkg
MTc6MDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjMuMDcuMjAxOSAxNjoyOSwgSnVlcmdl
biBHcm9zcyB3cm90ZToNCj4+PiBPbiAyMy4wNy4xOSAxNjoxNCwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+IE9oLCBuby4gVGhlICNNQyBzaWRlIHVzZSBoYXMgZ29uZSBhd2F5IGluIDNhOTE3Njlk
NmUsIHdpdGhvdXQgY2xlYW5pbmcNCj4+Pj4gdXAgb3RoZXIgY29kZS4gU28gdGhlcmUgZG9lc24n
dCBzZWVtIHRvIGJlIGFueSBzdWNoIHJlcXVpcmVtZW50IGFueW1vcmUuDQo+Pj4NCj4+PiBTbyBq
dXN0IHRvIGJlIHN1cmU6IHlvdSBhcmUgZmluZSBmb3IgbWUgcmVtb3ZpbmcgdGhlIHBpbm5pbmcg
Zm9yIE5NSXM/DQo+Pg0KPj4gTm8sIG5vdCB0aGUgcGlubmluZyBhcyBhIHdob2xlLiBUaGUgZm9y
Y2VkIENQVTAgYWZmaW5pdHkgc2hvdWxkIHN0aWxsDQo+PiByZW1haW4uIEl0J3MganVzdCB0aGF0
IHRoZXJlJ3Mgbm8gY29ycmVsYXRpb24gYW55bW9yZSBiZXR3ZWVuIHRoZSBDUFUNCj4+IGEgdkNQ
VSB3YXMgcnVubmluZyBvbiBhbmQgdGhlIENQVSBpdCBpcyB0byBiZSBwaW5uZWQgdG8gKHRlbXBv
cmFyaWx5KS4NCj4gDQo+IEkgZG9uJ3QgZ2V0IGl0LiBUb2RheSB2Y3B1MCBvZiB0aGUgaGFyZHdh
cmUgZG9tYWluIGlzIHBpbm5lZCB0byB0aGUgY3B1DQo+IGl0IHdhcyBsYXN0IHJ1bm5pbmcgb24g
d2hlbiB0aGUgTk1JIGhhcHBlbmVkLiBXaHkgaXMgdGhhdCBpbXBvcnRhbnQ/DQo+IE9yIGRvIHlv
dSB3YW50IHRvIGNoYW5nZSB0aGUgbG9naWMgYW5kIHBpbiB2Y3B1MCBmb3IgTk1JIGhhbmRsaW5n
IGFsd2F5cw0KPiB0byBDUFUwPw0KDQpIbW0sIEkndmUgYmVlbiBjb25mdXNlZC4gVG8gbWUgaXQg
ZG9lc24ndCBtYWtlIHNlbnNlIHRvIGZvcmNlDQphZmZpbml0eSBvdGhlciB0aGFuIHRvIENQVTAg
Zm9yIGFuIE5NSS4gSGVuY2UgSSB3YXMgbWlzLXJlYWRpbmcNCnRoZSBvcmlnaW5hbCBzZW5kX2d1
ZXN0X3RyYXAoKSBpbnZvY2F0aW9uIChpbiBwYXJ0aWN1bGFyIGl0cw0KbWlkZGxlIGFyZ3VtZW50
KS4gTG9va2luZyBhdCBjb21taXQgMzU1YjA0NjlhOCAoIng4NjogTUNBIHN1cHBvcnQiKQ0KSSB3
b3VsZCBndWVzcyB0aGUgYWZmaW5pdHkgY2hhbmdlIGZvciBOTUkgZGVsaXZlcnkgd2FzIGRvbmUg
YnkNCm1pc3Rha2UsIG9yIGF0IGJlc3QganVzdCB0byBub3QgZGlzdGluZ3Vpc2ggTk1JIGZyb20g
I01DLg0KDQpBcyBhIHJlc3VsdCwgY29uc2lkZXJpbmcgdGhhdCBiZWZvcmUgdGhhdCB0aGVyZSB3
YXMgbm8gYWZmaW5pdHkNCmNoYW5nZSBhdCBhbGwsIGFuZCBjb25zaWRlcmluZyBmdXJ0aGVyIHRo
YW4gY2hhbmdpbmcgdG8gb3RoZXINCnRoYW4gQ1BVMCBkb2Vzbid0IHJlYWxseSBtYWtlIHNlbnNl
LCBidXQgd2UgZ290IGF3YXkgd2l0aCBub3QNCmRvaW5nIHNvIGZvciBzbyBtYW55IHllYXJzLCBJ
IHRoaW5rIEkgYWdyZWUgdGhhdCBpdCBjYW4gYmUgcmlwcGVkDQpvdXQgYWx0b2dldGhlci4gUGVy
c29uYWxseSBJJ2QgcHJlZmVyIGEgZml4IHRvIG1ha2UgaXQgdXNlIENQVTAsDQpidXQgSSdtIGlu
IG5vIHdheSBnb2luZyB0byBpbnNpc3QuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
