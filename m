Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B7D7509A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 16:08:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqeMb-0003e3-F7; Thu, 25 Jul 2019 14:04:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e7IC=VW=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hqeMZ-0003dy-G5
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 14:04:55 +0000
X-Inumbo-ID: 2cd37190-aee5-11e9-8980-bc764e045a96
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (unknown
 [40.107.74.53]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2cd37190-aee5-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 14:04:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2DozYoJC3reCptlGjH3vLx8Q0LSLbxZOoD4kcAI6EhjjBRju/31zawMNqkMSIjAlg0dAnCu2zf4NB+XH1czrPDNhTfj/O5voc6xJTUdGYNPX9JI3YTuqB3SCdu0t5gbGVec9v+9EtLpw7acxlec2XRZ275hXavD2GGQ8jA4ZNkvHCAXa9UllooqEnplwvxip+f+tsBfUt1QtH+OLfJ7ovWWrhBhhkNrPRNDis8ja/c6YPAynjn2l+U1npvPQYF7qp73/HQeo4Xh9Qs6VyoQQ3sg1x+n1LrdlsnOgej453ppD50IaB0TkblAvgF+L2dmfemqFFn+IRE4KRSJTRrwDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zldGsXefkL5fHNfZuvvpA8Guvm2uXpddO6X9hYNJc8=;
 b=dTsheRLWSMFP/ACdbc4PlxQVdJr8UNm8u+H8mW/aJO2aaOoKH1i2tzTEFDqwxgRdidVPER4bxKUlGmdQ7YNDS2UFlzGccJHK9rCbBls6dSYHv/K1Pz4qC0eCui75/YU0zp0SdR4VGa12me83rGBIWP1YHugQtEJW1iX4nBDbB+FhI982HTY5B9nFjnW7Ltqu6/vFAFdgv/yo6DgQDkjByKHUwMpVmUgvN+fUOFrCFIvDOd0MYmBAHZ7ecywaPoliB3GQx9cXfEUxpI1PsghdB0XuE2gKynPQKTdvd3LW6wkNc/Bvb5kCXPgOXez8E2gN+U6Uac87hI3lun4qu2hB2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zldGsXefkL5fHNfZuvvpA8Guvm2uXpddO6X9hYNJc8=;
 b=FIlMUIbYVeqf6zJWVWTmFaKlKdz4WFqZcUNlWu967mtRj2+hM1GrbDdjNrslo2vZvDcqFD3SQ5p5r0F0JKYLQbams7kcPe863LXexIIYQ2BWjvWFN8GWxLdVGoe839t1/FwNHxRju5P2CrMWtmuS0m02zKjHEYvF3X9ppvr/Z9g=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3130.namprd12.prod.outlook.com (20.178.31.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 14:04:52 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 14:04:51 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v4 10/12] AMD/IOMMU: correct IRTE updating
Thread-Index: AQHVQu8Sv0h/SjvNh0miri6LNzAjzqbbXfmA
Date: Thu, 25 Jul 2019 14:04:51 +0000
Message-ID: <20190725140448.GA28364@amd.com>
References: <b8ae110a-f94a-4ed2-5cf9-c00ff1c0cb81@suse.com>
 <0ca33ff2-6a66-fce1-1b62-fb30394398bf@suse.com>
In-Reply-To: <0ca33ff2-6a66-fce1-1b62-fb30394398bf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM3PR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:0:52::32) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5606a79c-354c-4061-3051-08d711090ff3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3130; 
x-ms-traffictypediagnostic: DM6PR12MB3130:
x-microsoft-antispam-prvs: <DM6PR12MB313008A48D8FEE16C19747D1E5C10@DM6PR12MB3130.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(189003)(199004)(33656002)(86362001)(5660300002)(25786009)(54906003)(478600001)(81166006)(81156014)(8936002)(36756003)(68736007)(316002)(76176011)(99286004)(52116002)(66066001)(64756008)(66476007)(66556008)(26005)(102836004)(53936002)(6436002)(2906002)(66446008)(66946007)(14454004)(386003)(6506007)(6246003)(7736002)(305945005)(6512007)(186003)(71200400001)(71190400001)(6916009)(446003)(2616005)(256004)(14444005)(229853002)(11346002)(6486002)(486006)(476003)(4326008)(6116002)(3846002)(8676002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3130;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yfmxAEjktovxnam/szRLuYQPWJh1xWolBkTLFxsZ7H7itxsSc37FNypTaeLZRPlh+QpOHiyGwv9phzIxwO40sCYDr/5GnhKMq7nhCQ8tWld8RHeS1FRdRNCE2UMT6qj9AMoOU7CmJJ/VrKuwZfdkEKiEfSrTUkHtW18N6Hg7Scv68fbODOxcL9dcOlQO06f0SVB1dq3pp+RMZYbfmYSp3hfIa3x5bd0ADSsrWEF1ruJKHNAu8fRUNDPKKLbfIM9JHygZdUuh8ZrRglzQyAqQEpXtKZP37oXzRx/K4X/rhVRJHba4zXrA4laueAqQXeYZllaCu/eq+jkck7dOpQTt25ls6AgBRTN82WSELopUjMN/xZKiO6UcM8kvKoU8t3NK/fHWWPcClnp7bb7uzekN6Xdn34ZD/5+iIKrTQBkrXC0=
Content-ID: <988827E4C08B2B4FA310B56B14CD4775@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5606a79c-354c-4061-3051-08d711090ff3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 14:04:51.8317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3130
Subject: Re: [Xen-devel] [PATCH v4 10/12] AMD/IOMMU: correct IRTE updating
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woods, 
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDE6MzM6MDJQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRmx1c2hpbmcgZGlkbid0IGdldCBkb25lIGFsb25nIHRoZSBsaW5lcyBvZiB3aGF0IHRo
ZSBzcGVjaWZpY2F0aW9uIHNheXMuCj4gTWFyayBlbnRyaWVzIHRvIGJlIHVwZGF0ZWQgYXMgbm90
IHJlbWFwcGVkICh3aGljaCB3aWxsIHJlc3VsdCBpbgo+IGludGVycnVwdCByZXF1ZXN0cyB0byBn
ZXQgdGFyZ2V0IGFib3J0ZWQsIGJ1dCB0aGUgaW50ZXJydXB0cyBzaG91bGQgYmUKPiBtYXNrZWQg
YW55d2F5IGF0IHRoYXQgcG9pbnQgaW4gdGltZSksIGlzc3VlIHRoZSBmbHVzaCwgYW5kIG9ubHkg
dGhlbgo+IHdyaXRlIHRoZSBuZXcgZW50cnkuCj4gCj4gSW4gdXBkYXRlX2ludHJlbWFwX2VudHJ5
X2Zyb21fbXNpX21zZygpIGFsc28gZm9sZCB0aGUgZHVwbGljYXRlIGluaXRpYWwKPiBsb2NrIGRl
dGVybWluYXRpb24gYW5kIGFjcXVpcmUgaW50byBqdXN0IGEgc2luZ2xlIGluc3RhbmNlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBBY2tlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBC
cmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KCj4gLS0tCj4gUkZDOiBQdXR0aW5nIHRo
ZSBmbHVzaCBpbnZvY2F0aW9ucyBpbiBsb29wcyBpc24ndCBvdmVybHkgbmljZSwgYnV0IEkKPiAg
ICAgICBkb24ndCB0aGluayB0aGlzIGNhbiByZWFsbHkgYmUgYWJ1c2VkLCBzaW5jZSBjYWxsZXJz
IHVwIHRoZSBzdGFjawo+ICAgICAgIGhvbGQgZnVydGhlciBsb2Nrcy4gTmV2ZXJ0aGVsZXNzIEkn
ZCBsaWtlIHRvIGFzayBmb3IgYmV0dGVyCj4gICAgICAgc3VnZ2VzdGlvbnMuCj4gLS0tCj4gdjQ6
IFJlLWJhc2UuCj4gdjM6IFJlbW92ZSBzdGFsZSBwYXJ0cyBvZiBkZXNjcmlwdGlvbi4gUmUtYmFz
ZS4KPiB2MjogUGFydHMgbW9ycGhlZCBpbnRvIGVhcmxpZXIgcGF0Y2guCj4gCj4gLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwo+ICsrKyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMKPiBAQCAtMjEzLDE1ICsyMTMsMTMgQEAgc3Rh
dGljIHZvaWQgdXBkYXRlX2ludHJlbWFwX2VudHJ5KGNvbnN0Cj4gICAgICAgICAgICAgICB9LAo+
ICAgICAgICAgICB9Owo+ICAgCj4gLSAgICAgICAgQUNDRVNTX09OQ0UoZW50cnkucHRyMTI4LT5y
YXdbMF0pID0gMDsKPiArICAgICAgICBBU1NFUlQoIWVudHJ5LnB0cjEyOC0+ZnVsbC5yZW1hcF9l
bik7Cj4gKyAgICAgICAgZW50cnkucHRyMTI4LT5yYXdbMV0gPSBpcnRlLnJhd1sxXTsKPiAgICAg
ICAgICAgLyoKPiAtICAgICAgICAgKiBMb3cgaGFsZiwgaW4gcGFydGljdWxhciBSZW1hcEVuLCBu
ZWVkcyB0byBiZSBjbGVhcmVkIGZpcnN0LiAgU2VlCj4gKyAgICAgICAgICogSGlnaCBoYWxmIG5l
ZWRzIHRvIGJlIHNldCBiZWZvcmUgbG93IG9uZSAoY29udGFpbmluZyBSZW1hcEVuKS4gIFNlZQo+
ICAgICAgICAgICAgKiBjb21tZW50IGluIGZyZWVfaW50cmVtYXBfZW50cnkoKSByZWdhcmRpbmcg
dGhlIGNob2ljZSBvZiBiYXJyaWVyLgo+ICAgICAgICAgICAgKi8KPiAgICAgICAgICAgc21wX3dt
YigpOwo+IC0gICAgICAgIGVudHJ5LnB0cjEyOC0+cmF3WzFdID0gaXJ0ZS5yYXdbMV07Cj4gLSAg
ICAgICAgLyogSGlnaCBoYWxmIG5lZWRzIHRvIGJlIHNldCBiZWZvcmUgbG93IG9uZSAoY29udGFp
bmluZyBSZW1hcEVuKS4gKi8KPiAtICAgICAgICBzbXBfd21iKCk7Cj4gICAgICAgICAgIEFDQ0VT
U19PTkNFKGVudHJ5LnB0cjEyOC0+cmF3WzBdKSA9IGlydGUucmF3WzBdOwo+ICAgICAgIH0KPiAg
ICAgICBlbHNlCj4gQEAgLTI5Niw2ICsyOTQsMjAgQEAgc3RhdGljIGludCB1cGRhdGVfaW50cmVt
YXBfZW50cnlfZnJvbV9pbwo+ICAgICAgIH0KPiAgIAo+ICAgICAgIGVudHJ5ID0gZ2V0X2ludHJl
bWFwX2VudHJ5KGlvbW11LCByZXFfaWQsIG9mZnNldCk7Cj4gKwo+ICsgICAgLyogVGhlIFJlbWFw
RW4gZmllbGRzIG1hdGNoIGZvciBhbGwgZm9ybWF0cy4gKi8KPiArICAgIHdoaWxlICggaW9tbXUt
PmVuYWJsZWQgJiYgZW50cnkucHRyMzItPmZsZHMucmVtYXBfZW4gKQo+ICsgICAgewo+ICsgICAg
ICAgIGVudHJ5LnB0cjMyLT5mbGRzLnJlbWFwX2VuID0gZmFsc2U7Cj4gKyAgICAgICAgc3Bpbl91
bmxvY2sobG9jayk7Cj4gKwo+ICsgICAgICAgIHNwaW5fbG9jaygmaW9tbXUtPmxvY2spOwo+ICsg
ICAgICAgIGFtZF9pb21tdV9mbHVzaF9pbnRyZW1hcChpb21tdSwgcmVxX2lkKTsKPiArICAgICAg
ICBzcGluX3VubG9jaygmaW9tbXUtPmxvY2spOwo+ICsKPiArICAgICAgICBzcGluX2xvY2sobG9j
ayk7Cj4gKyAgICB9Cj4gKwo+ICAgICAgIGlmICggZnJlc2ggKQo+ICAgICAgICAgICAvKiBub3Ro
aW5nICovOwo+ICAgICAgIGVsc2UgaWYgKCAhbG9fdXBkYXRlICkKPiBAQCAtMzI1LDEzICszMzcs
NiBAQCBzdGF0aWMgaW50IHVwZGF0ZV9pbnRyZW1hcF9lbnRyeV9mcm9tX2lvCj4gICAKPiAgICAg
ICBzcGluX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzKTsKPiAgIAo+IC0gICAgaWYgKCBp
b21tdS0+ZW5hYmxlZCAmJiAhZnJlc2ggKQo+IC0gICAgewo+IC0gICAgICAgIHNwaW5fbG9ja19p
cnFzYXZlKCZpb21tdS0+bG9jaywgZmxhZ3MpOwo+IC0gICAgICAgIGFtZF9pb21tdV9mbHVzaF9p
bnRyZW1hcChpb21tdSwgcmVxX2lkKTsKPiAtICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZpb21tdS0+bG9jaywgZmxhZ3MpOwo+IC0gICAgfQo+IC0KPiAgICAgICBzZXRfcnRlX2luZGV4
KHJ0ZSwgb2Zmc2V0KTsKPiAgIAo+ICAgICAgIHJldHVybiAwOwo+IEBAIC01ODcsMTkgKzU5Miwy
NyBAQCBzdGF0aWMgaW50IHVwZGF0ZV9pbnRyZW1hcF9lbnRyeV9mcm9tX21zCj4gICAgICAgcmVx
X2lkID0gZ2V0X2RtYV9yZXF1ZXN0b3JfaWQoaW9tbXUtPnNlZywgYmRmKTsKPiAgICAgICBhbGlh
c19pZCA9IGdldF9pbnRyZW1hcF9yZXF1ZXN0b3JfaWQoaW9tbXUtPnNlZywgYmRmKTsKPiAgIAo+
ICsgICAgbG9jayA9IGdldF9pbnRyZW1hcF9sb2NrKGlvbW11LT5zZWcsIHJlcV9pZCk7Cj4gKyAg
ICBzcGluX2xvY2tfaXJxc2F2ZShsb2NrLCBmbGFncyk7Cj4gKwo+ICAgICAgIGlmICggbXNnID09
IE5VTEwgKQo+ICAgICAgIHsKPiAtICAgICAgICBsb2NrID0gZ2V0X2ludHJlbWFwX2xvY2soaW9t
bXUtPnNlZywgcmVxX2lkKTsKPiAtICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZShsb2NrLCBmbGFn
cyk7Cj4gICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgbnI7ICsraSApCj4gICAgICAgICAgICAg
ICBmcmVlX2ludHJlbWFwX2VudHJ5KGlvbW11LCByZXFfaWQsICpyZW1hcF9pbmRleCArIGkpOwo+
ICAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzKTsKPiAtICAgICAg
ICBnb3RvIGRvbmU7Cj4gLSAgICB9Cj4gICAKPiAtICAgIGxvY2sgPSBnZXRfaW50cmVtYXBfbG9j
ayhpb21tdS0+c2VnLCByZXFfaWQpOwo+ICsgICAgICAgIGlmICggaW9tbXUtPmVuYWJsZWQgKQo+
ICsgICAgICAgIHsKPiArICAgICAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmlvbW11LT5sb2Nr
LCBmbGFncyk7Cj4gKyAgICAgICAgICAgIGFtZF9pb21tdV9mbHVzaF9pbnRyZW1hcChpb21tdSwg
cmVxX2lkKTsKPiArICAgICAgICAgICAgaWYgKCBhbGlhc19pZCAhPSByZXFfaWQgKQo+ICsgICAg
ICAgICAgICAgICAgYW1kX2lvbW11X2ZsdXNoX2ludHJlbWFwKGlvbW11LCBhbGlhc19pZCk7Cj4g
KyAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmlvbW11LT5sb2NrLCBmbGFncyk7
Cj4gKyAgICAgICAgfQo+ICsKPiArICAgICAgICByZXR1cm4gMDsKPiArICAgIH0KPiAgIAo+IC0g
ICAgc3Bpbl9sb2NrX2lycXNhdmUobG9jaywgZmxhZ3MpOwo+ICAgICAgIGRlc3RfbW9kZSA9ICht
c2ctPmFkZHJlc3NfbG8gPj4gTVNJX0FERFJfREVTVE1PREVfU0hJRlQpICYgMHgxOwo+ICAgICAg
IGRlbGl2ZXJ5X21vZGUgPSAobXNnLT5kYXRhID4+IE1TSV9EQVRBX0RFTElWRVJZX01PREVfU0hJ
RlQpICYgMHgxOwo+ICAgICAgIHZlY3RvciA9IChtc2ctPmRhdGEgPj4gTVNJX0RBVEFfVkVDVE9S
X1NISUZUKSAmIE1TSV9EQVRBX1ZFQ1RPUl9NQVNLOwo+IEBAIC02MjMsNiArNjM2LDIyIEBAIHN0
YXRpYyBpbnQgdXBkYXRlX2ludHJlbWFwX2VudHJ5X2Zyb21fbXMKPiAgICAgICB9Cj4gICAKPiAg
ICAgICBlbnRyeSA9IGdldF9pbnRyZW1hcF9lbnRyeShpb21tdSwgcmVxX2lkLCBvZmZzZXQpOwo+
ICsKPiArICAgIC8qIFRoZSBSZW1hcEVuIGZpZWxkcyBtYXRjaCBmb3IgYWxsIGZvcm1hdHMuICov
Cj4gKyAgICB3aGlsZSAoIGlvbW11LT5lbmFibGVkICYmIGVudHJ5LnB0cjMyLT5mbGRzLnJlbWFw
X2VuICkKPiArICAgIHsKPiArICAgICAgICBlbnRyeS5wdHIzMi0+Zmxkcy5yZW1hcF9lbiA9IGZh
bHNlOwo+ICsgICAgICAgIHNwaW5fdW5sb2NrKGxvY2spOwo+ICsKPiArICAgICAgICBzcGluX2xv
Y2soJmlvbW11LT5sb2NrKTsKPiArICAgICAgICBhbWRfaW9tbXVfZmx1c2hfaW50cmVtYXAoaW9t
bXUsIHJlcV9pZCk7Cj4gKyAgICAgICAgaWYgKCBhbGlhc19pZCAhPSByZXFfaWQgKQo+ICsgICAg
ICAgICAgICBhbWRfaW9tbXVfZmx1c2hfaW50cmVtYXAoaW9tbXUsIGFsaWFzX2lkKTsKPiArICAg
ICAgICBzcGluX3VubG9jaygmaW9tbXUtPmxvY2spOwo+ICsKPiArICAgICAgICBzcGluX2xvY2so
bG9jayk7Cj4gKyAgICB9Cj4gKwo+ICAgICAgIHVwZGF0ZV9pbnRyZW1hcF9lbnRyeShpb21tdSwg
ZW50cnksIHZlY3RvciwgZGVsaXZlcnlfbW9kZSwgZGVzdF9tb2RlLCBkZXN0KTsKPiAgICAgICBz
cGluX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzKTsKPiAgIAo+IEBAIC02NDIsMTYgKzY3
MSw2IEBAIHN0YXRpYyBpbnQgdXBkYXRlX2ludHJlbWFwX2VudHJ5X2Zyb21fbXMKPiAgICAgICAg
ICAgICAgICAgIGdldF9pdnJzX21hcHBpbmdzKGlvbW11LT5zZWcpW2FsaWFzX2lkXS5pbnRyZW1h
cF90YWJsZSk7Cj4gICAgICAgfQo+ICAgCj4gLWRvbmU6Cj4gLSAgICBpZiAoIGlvbW11LT5lbmFi
bGVkICkKPiAtICAgIHsKPiAtICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaW9tbXUtPmxvY2ss
IGZsYWdzKTsKPiAtICAgICAgICBhbWRfaW9tbXVfZmx1c2hfaW50cmVtYXAoaW9tbXUsIHJlcV9p
ZCk7Cj4gLSAgICAgICAgaWYgKCBhbGlhc19pZCAhPSByZXFfaWQgKQo+IC0gICAgICAgICAgICBh
bWRfaW9tbXVfZmx1c2hfaW50cmVtYXAoaW9tbXUsIGFsaWFzX2lkKTsKPiAtICAgICAgICBzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZpb21tdS0+bG9jaywgZmxhZ3MpOwo+IC0gICAgfQo+IC0KPiAg
ICAgICByZXR1cm4gMDsKPiAgIH0KPiAgIAo+IAoKLS0gCkJyaWFuIFdvb2RzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
