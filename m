Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BF75A02C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 18:03:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgtHk-0008SI-Cw; Fri, 28 Jun 2019 15:59:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VTnx=U3=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hgtHj-0008SD-IV
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 15:59:35 +0000
X-Inumbo-ID: b80fca16-99bd-11e9-8980-bc764e045a96
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe50::605])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b80fca16-99bd-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 15:59:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=wCiN2gQoak8saq1+KWjEgY0PbHBSaBVq+hhjBxdMASba4xGo/E4XMCqejR0aLd6+tEeMOPY5Yob8oeJFO1YpUQai7vtI28Wuhy0UieWzASmiMYCRompaNXL/fpr+8EAHHQSuvXQkSs3N+o97nV8D95/bJcqvQ738m3TTjJ6FarM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66av14pKHRIAiAi9DzeV+nGkJ59K/0olHF5/pDUdRWI=;
 b=ApA2nez5lFF500w4Fhl9FciTqcCqUmBqiFIcGBivevz8YnxmegoUWO0PRye5/PxfchzEYSzeYcUGMwz5XuXbvv/ybiu8B/7/FoqdznXJCWViw0PuQYBUqAqqsT66rMGP1Ix0Yef/HvVwI0NbHacBMxmGp+3p+G3O81ZmznY8BuA=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66av14pKHRIAiAi9DzeV+nGkJ59K/0olHF5/pDUdRWI=;
 b=hF6eUhf8Z9UYUA81eXTervFB2dB6yI4xLNXLw32cwggQH+V4xfK7s5o5Su5vK5FMRBPkJtST9Y+9sfC66r4hrTkfWvY/4PJDSRUTOPgpD9d0uoQOFpzCSmXwFrXDtOjtE5c4lIXx1+L0gj469VcmKq/zcupKsBGTRhz8TAhzWrA=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3788.namprd12.prod.outlook.com (10.255.173.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 15:59:31 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::c8d:cf8b:2569:1653]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::c8d:cf8b:2569:1653%7]) with mapi id 15.20.2008.020; Fri, 28 Jun 2019
 15:59:31 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86/svm: Drop svm_vm{load,save}() helpers
Thread-Index: AQHVJ2Ca5PkM0pibh0SK+JriWeVAr6axRiwA
Date: Fri, 28 Jun 2019 15:59:31 +0000
Message-ID: <20190628155927.GA13179@amd.com>
References: <1561032381-24385-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1561032381-24385-1-git-send-email-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR0102CA0017.prod.exchangelabs.com (2603:10b6:805:1::30)
 To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08068f1c-cfb3-48b5-a07e-08d6fbe19b37
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3788; 
x-ms-traffictypediagnostic: DM6PR12MB3788:
x-microsoft-antispam-prvs: <DM6PR12MB378862C7122272A2631A03B6E5FC0@DM6PR12MB3788.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(189003)(199004)(4326008)(386003)(33656002)(3846002)(1076003)(2906002)(6916009)(6512007)(86362001)(5660300002)(256004)(64756008)(71200400001)(73956011)(71190400001)(66556008)(66476007)(66446008)(66946007)(6116002)(36756003)(66066001)(476003)(316002)(478600001)(2616005)(11346002)(81166006)(14454004)(229853002)(25786009)(6436002)(68736007)(102836004)(99286004)(81156014)(53936002)(6246003)(305945005)(186003)(446003)(52116002)(6486002)(8676002)(26005)(76176011)(6506007)(54906003)(486006)(7736002)(8936002)(72206003)(142933001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3788;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Pg7Lu+A0aUQOHwyWvMRr5GHQD/7k2L1tfru7xibk2Cmrvv96QpjaiF88akfxMrQ7AcsSNVeu8ckvrolnAppfnT+VZqqq3rpVK9ohd+1zu73Wvp04NdGv3oZwnJnPZIQ8iFC1yNEQl9anmCCmd7Ukkv8joNU0Q7YKZI/6xySQUqeAQcsFomaNVvaVUKuSRH4Zxj1IznySHllnxFSwwrCuOAyFn78JXBs02MiXtQkdNt3HPDTgEBa6keg79En8TSRDM/vBai0psU6PN5ujyk4goCPIMj/KaSRW84hd+O5g7DpIWc8Gvj3DXKPn5FUtNtXmstc4t9ZM2uig4Nfr8pQigYc0WZLiaqPLj4AhRjFbPxlHg+lE1A4jSMfVJDqdokZ24w/2a4Ud0iZbhRs8eTAeC4YzqoiAHYkaLdYiz9S2Q3M=
Content-ID: <AC0AF1C816559742957947BDAE6BB9C5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08068f1c-cfb3-48b5-a07e-08d6fbe19b37
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 15:59:31.3049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3788
Subject: Re: [Xen-devel] [PATCH] x86/svm: Drop svm_vm{load,save}() helpers
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
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Woods,
 Brian" <Brian.Woods@amd.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMDE6MDY6MjFQTSArMDEwMCwgQW5keSBDb29wZXIgd3Jv
dGU6Cj4gRm9sbG93aW5nIG9uIGZyb20gYy9zIDdkMTYxZjY1MzcgIng4Ni9zdm06IEZpeCBzdm1f
dm1jYl9kdW1wKCkgd2hlbiB1c2VkIGluCj4gY3VycmVudCBjb250ZXh0IiwgdGhlcmUgaXMgbm93
IG9ubHkgYSBzaW5nbGUgdXNlciBvZiBzdm1fdm1zYXZlKCkgcmVtYWluaW5nIGluCj4gdGhlIHRy
ZWUsIHdpdGggYWxsIHVzZXJzIG1vdmVkIHRvIHN2bV92bXtsb2FkLHNhdmV9X3BhKCkuCj4gCj4g
bnYtPm52X24xdm1jeCBoYXMgYSBtYXRjaGluZyBudi0+bnZfbjF2bWN4X3BhIHdoaWNoIGlzIGFs
d2F5cyBjb3JyZWN0LCBhbmQKPiBhdm9pZHMgYSByZWR1bmRhbnQgX19wYSgpIHRyYW5zbGF0aW9u
IGJlaGluZCB0aGUgc2NlbmVzLgo+IAo+IFdpdGggdGhpcyBnb25lLCBhbGwgVk17TE9BRCxTQVZF
fSBvcGVyYXRpb25zIGFyZSB1c2luZyBwYWRkcl90J3Mgd2hpY2ggaXMgbW9yZQo+IGVmZmljaWVu
dCwgc28gZHJvcCB0aGUgc3ZtX3Zte2xvYWQsc2F2ZX0oKSBoZWxwZXJzIHRvIGF2b2lkIHVzZXMg
b2YgdGhlbQo+IHJlYXBwZWFyaW5nIGluIHRoZSBmdXR1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBCcmlh
biBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KCj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxK
QmV1bGljaEBzdXNlLmNvbT4KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IEJvcmlzIE9zdHJvdnNreSA8
Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gQ0M6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8
c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+Cj4gQ0M6IEJyaWFuIFdvb2RzIDxicmlhbi53
b29kc0BhbWQuY29tPgo+IAo+IEl0IHR1cm5zIG91dCBJIHdhcyBtaXN0YWtlbiBhYm91dCBob3cg
Y29tcGxpY2F0ZWQgdGhpcyB3YXMuCj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3Rl
ZHN2bS5jICB8IDIgKy0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3N2bS5oIHwgMyAt
LS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMgYi94ZW4vYXJj
aC94ODYvaHZtL3N2bS9uZXN0ZWRzdm0uYwo+IGluZGV4IDM1YzFhMDQuLmZlZjEyNGYgMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMKPiArKysgYi94ZW4vYXJj
aC94ODYvaHZtL3N2bS9uZXN0ZWRzdm0uYwo+IEBAIC0xMDMwLDcgKzEwMzAsNyBAQCBuc3ZtX3Zt
Y2JfcHJlcGFyZTR2bWV4aXQoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCBjcHVfdXNlcl9yZWdzICpy
ZWdzKQo+ICAgICAgc3RydWN0IHZtY2Jfc3RydWN0ICpuc192bWNiID0gbnYtPm52X3Z2bWN4Owo+
ICAgICAgc3RydWN0IHZtY2Jfc3RydWN0ICpuMnZtY2IgPSBudi0+bnZfbjJ2bWN4Owo+ICAKPiAt
ICAgIHN2bV92bXNhdmUobnYtPm52X24xdm1jeCk7Cj4gKyAgICBzdm1fdm1zYXZlX3BhKG52LT5u
dl9uMXZtY3hfcGEpOwo+ICAKPiAgICAgIC8qIENhY2hlIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3Mg
b2YgdmlydHVhbCB2bWNiCj4gICAgICAgKiBmb3IgVk1DQiBDbGVhbmJpdCBlbXVsYXRpb24uCj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS9zdm0uaCBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL3N2bS9zdm0uaAo+IGluZGV4IDZlNjg4YTguLjE2YTk5NGUgMTAwNjQ0
Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3N2bS5oCj4gKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3N2bS5oCj4gQEAgLTIyLDkgKzIyLDYgQEAKPiAgCj4gICNp
bmNsdWRlIDx4ZW4vdHlwZXMuaD4KPiAgCj4gLSNkZWZpbmUgc3ZtX3ZtbG9hZCh4KSAgICAgc3Zt
X3ZtbG9hZF9wYShfX3BhKHgpKQo+IC0jZGVmaW5lIHN2bV92bXNhdmUoeCkgICAgIHN2bV92bXNh
dmVfcGEoX19wYSh4KSkKPiAtCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBzdm1fdm1sb2FkX3BhKHBh
ZGRyX3Qgdm1jYikKPiAgewo+ICAgICAgYXNtIHZvbGF0aWxlICgKPiAtLSAKPiAyLjEuNAo+IAoK
LS0gCkJyaWFuIFdvb2RzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
