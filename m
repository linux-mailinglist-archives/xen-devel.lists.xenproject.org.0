Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BF26EAA3
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 20:27:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoXYt-0004kF-9n; Fri, 19 Jul 2019 18:24:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AH7D=VQ=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hoXYr-0004k3-Fg
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 18:24:53 +0000
X-Inumbo-ID: 7f849415-aa52-11e9-8980-bc764e045a96
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe4d::607])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7f849415-aa52-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 18:24:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmLNS9CuuU73gm9hr+zVGz8cudtynLseUm97U2d8GB8frwoy8s/3oOHDyCZUWngNDhGXeAjOHuNkSo7c7URz3Mhdri6M2bgEExriU81ORmcijl5BXNzH3J0eoDlzKecpTHGhtvL7nhOHft/ZPt7f8LmAlNDSf8SykKJP4T932IEaHBHaVarv7Z34XNSpQ0961MeApGzoFphexYXcCJTGmyA2V6Mvw2PnR4/ZcEHYBaWchySb2GEc0gyIB6dd3f2459L27S4FAcNOimp8Ja029Yz2yGNouuZ1AiuOc7pTd3QxGPwhRFWqBCwW5IavbU7V8+khz+ZgooJ2Yjfk2rYjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnjiTMik2AD5WSa4bzUKwTMvcXBfjuzg684U/A543Ug=;
 b=QqWlYeAAynfR+SaSXW/5HPmIrLwGNV+PkpWrDvVeX7oYgZ0QKJJtRcBRGNL3AacbyIz1MZXQpi0MN0F6XvtrFHvgn7HASNRKGnuNpkhhjbhceNHRajdavkjNs0mTKPUvpvSNk3I6l0MqsriJK6L8DeFN3ZR+/1cM6y8nd95FhwXEwqYNcIvPUWBxE5O6S62MeWE2eEUQC+ed5PS0OJdSnq+ZtiV3Q3gRAECDGsC2O/YG32AMz3h4M5fYJG1NdtF3muyu7vOHhUIZySOslA8pjGEAPed1hAvwtw5SX6V4bayGyEOLAdTVUvp88k6A2yyPhzG12uKk5AR0EYIZ81qaMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnjiTMik2AD5WSa4bzUKwTMvcXBfjuzg684U/A543Ug=;
 b=gsBcnbkpm/pwll9VzATVfpmqqvXexH048kT4+NsdzpvqRpiYHU7CHBgvIkYFI/91BuZl3OdADug3TdUrvnGuOiRzDWwWfXbGAIdgScpjAVqJwbPJ09f8wZAcG8eBcHsEHvyyJOhplSgZ9S34pnMhjuoUUc881jPc6KTa4kr3uPk=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB2602.namprd12.prod.outlook.com (20.176.116.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 18:24:50 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc%7]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 18:24:50 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v3 04/14] AMD/IOMMU: use bit field for IRTE
Thread-Index: AQHVO/TALHT8MFjk0U6/m63AjfwRcKbSRpOA
Date: Fri, 19 Jul 2019 18:24:50 +0000
Message-ID: <20190719182447.GC4496@amd.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <7eb213ad-94f1-6092-c670-3296aedf3f0e@suse.com>
In-Reply-To: <7eb213ad-94f1-6092-c670-3296aedf3f0e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR0102CA0026.prod.exchangelabs.com (2603:10b6:805:1::39)
 To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73c5b75e-363b-424f-510d-08d70c7662e5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2602; 
x-ms-traffictypediagnostic: DM6PR12MB2602:
x-microsoft-antispam-prvs: <DM6PR12MB26029E24B92C10F64D883723E5CB0@DM6PR12MB2602.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(189003)(199004)(68736007)(54906003)(2616005)(478600001)(486006)(11346002)(14454004)(6506007)(446003)(386003)(476003)(256004)(52116002)(99286004)(1076003)(25786009)(76176011)(102836004)(4326008)(6246003)(36756003)(316002)(71200400001)(71190400001)(14444005)(26005)(6436002)(305945005)(81166006)(6916009)(229853002)(8676002)(66476007)(66556008)(8936002)(64756008)(66446008)(66946007)(86362001)(53936002)(6116002)(186003)(7736002)(3846002)(6486002)(6512007)(2906002)(81156014)(66066001)(33656002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2602;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dlBooOsy5eCgkBaed6Nl622xaiGvEl+1DRkzWvHYkzWvmDSA03+4w2vKBHrWoBa2cJZ4HAl7xy2cu8feQnTJ8KF+15tVYX9xKyFCeZo2KVEpHg+WnQG1wdSRmienh5GgPlMxHNuM0EA54mZQnMAgxn4Q6eXRlGkt0/t1dCstZrmjdJ0S4ng/TN8jwB+vOIGdZDX4042J6YAoOQoSCdZH4Qzj6lDNtotS9cmuLiYNCLDliLydEQBUKjq7KPqc0LqyQogja8d6LGm6qK35MzKonvNWLckPUuKJsSgFCiVQTt2R4HaCvBNotUJZxe4EToxaB7gzfvPqqEksRB3tpRac7civpWcFw1zzNQg3YHsaXAWCMIRYTv+kmW/pHq7oWZK6IPBvdNVN+cX0x0DmDHuA/4uUGXs7Uwia50hJ8Tc5zz4=
Content-ID: <B13BC2D19558B04DB1A724BEB1648306@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c5b75e-363b-424f-510d-08d70c7662e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 18:24:50.2463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2602
Subject: Re: [Xen-devel] [PATCH v3 04/14] AMD/IOMMU: use bit field for IRTE
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

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDQ6MzY6MzRQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQXQgdGhlIHNhbWUgdGltZSByZXN0cmljdCBpdHMgc2NvcGUgdG8ganVzdCB0aGUgc2lu
Z2xlIHNvdXJjZSBmaWxlCj4gYWN0dWFsbHkgdXNpbmcgaXQsIGFuZCBhYnN0cmFjdCBhY2Nlc3Nl
cyBieSBpbnRyb2R1Y2luZyBhIHVuaW9uIG9mCj4gcG9pbnRlcnMuIChBIHVuaW9uIG9mIHRoZSBh
Y3R1YWwgdGFibGUgZW50cmllcyBpcyBub3QgdXNlZCB0byBtYWtlIGl0Cj4gaW1wb3NzaWJsZSB0
byBbd3JvbmdseSwgb25jZSB0aGUgMTI4LWJpdCBmb3JtIGdldHMgYWRkZWRdIHBlcmZvcm0KPiBw
b2ludGVyIGFyaXRobWV0aWMgLyBhcnJheSBhY2Nlc3NlcyBvbiBkZXJpdmVkIHR5cGVzLikKPiAK
PiBBbHNvIG1vdmUgYXdheSBmcm9tIHVwZGF0aW5nIHRoZSBlbnRyaWVzIHBpZWNlbWVhbDogQ29u
c3RydWN0IGEgZnVsbCBuZXcKPiBlbnRyeSwgYW5kIHdyaXRlIGl0IG91dC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogQnJpYW4g
V29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+Cgo+IC0tLQo+IHYzOiBTd2l0Y2ggYm9vbGVhbiBi
aXRmaWVsZHMgdG8gYm9vbC4KPiB2MjogbmFtZSB7Z2V0LGZyZWV9X2ludHJlbWFwX2VudHJ5KCkn
cyBsYXN0IHBhcmFtZXRlciAiaW5kZXgiIGluc3RlYWQgb2YKPiAgICAgICJvZmZzZXQiLiBJbnRy
b2R1Y2UgdW5pb24gaXJ0ZTMyLgo+IAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9pb21tdV9pbnRyLmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
aW50ci5jCj4gQEAgLTIzLDYgKzIzLDI4IEBACj4gICAjaW5jbHVkZSA8YXNtL2lvX2FwaWMuaD4K
PiAgICNpbmNsdWRlIDx4ZW4va2V5aGFuZGxlci5oPgo+ICAgCj4gK3N0cnVjdCBpcnRlX2Jhc2lj
IHsKPiArICAgIGJvb2wgcmVtYXBfZW46MTsKPiArICAgIGJvb2wgc3VwX2lvX3BmOjE7Cj4gKyAg
ICB1bnNpZ25lZCBpbnQgaW50X3R5cGU6MzsKPiArICAgIGJvb2wgcnFfZW9pOjE7Cj4gKyAgICBi
b29sIGRtOjE7Cj4gKyAgICBib29sIGd1ZXN0X21vZGU6MTsgLyogTUJaICovCj4gKyAgICB1bnNp
Z25lZCBpbnQgZGVzdDo4Owo+ICsgICAgdW5zaWduZWQgaW50IHZlY3Rvcjo4Owo+ICsgICAgdW5z
aWduZWQgaW50IDo4Owo+ICt9Owo+ICsKPiArdW5pb24gaXJ0ZTMyIHsKPiArICAgIHVpbnQzMl90
IHJhd1sxXTsKPiArICAgIHN0cnVjdCBpcnRlX2Jhc2ljIGJhc2ljOwo+ICt9Owo+ICsKPiArdW5p
b24gaXJ0ZV9wdHIgewo+ICsgICAgdm9pZCAqcHRyOwo+ICsgICAgdW5pb24gaXJ0ZTMyICpwdHIz
MjsKPiArfTsKPiArCj4gICAjZGVmaW5lIElOVFJFTUFQX1RBQkxFX09SREVSICAgIDEKPiAgICNk
ZWZpbmUgSU5UUkVNQVBfTEVOR1RIIDB4Qgo+ICAgI2RlZmluZSBJTlRSRU1BUF9FTlRSSUVTICgx
IDw8IElOVFJFTUFQX0xFTkdUSCkKPiBAQCAtMTAxLDQ3ICsxMjMsNDQgQEAgc3RhdGljIHVuc2ln
bmVkIGludCBhbGxvY19pbnRyZW1hcF9lbnRyeQo+ICAgICAgIHJldHVybiBzbG90Owo+ICAgfQo+
ICAgCj4gLXN0YXRpYyB1MzIgKmdldF9pbnRyZW1hcF9lbnRyeShpbnQgc2VnLCBpbnQgYmRmLCBp
bnQgb2Zmc2V0KQo+ICtzdGF0aWMgdW5pb24gaXJ0ZV9wdHIgZ2V0X2ludHJlbWFwX2VudHJ5KHVu
c2lnbmVkIGludCBzZWcsIHVuc2lnbmVkIGludCBiZGYsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGluZGV4KQo+ICAgewo+IC0gICAgdTMy
ICp0YWJsZSA9IGdldF9pdnJzX21hcHBpbmdzKHNlZylbYmRmXS5pbnRyZW1hcF90YWJsZTsKPiAr
ICAgIHVuaW9uIGlydGVfcHRyIHRhYmxlID0gewo+ICsgICAgICAgIC5wdHIgPSBnZXRfaXZyc19t
YXBwaW5ncyhzZWcpW2JkZl0uaW50cmVtYXBfdGFibGUKPiArICAgIH07Cj4gKwo+ICsgICAgQVNT
RVJUKHRhYmxlLnB0ciAmJiAoaW5kZXggPCBJTlRSRU1BUF9FTlRSSUVTKSk7Cj4gICAKPiAtICAg
IEFTU0VSVCggKHRhYmxlICE9IE5VTEwpICYmIChvZmZzZXQgPCBJTlRSRU1BUF9FTlRSSUVTKSAp
Owo+ICsgICAgdGFibGUucHRyMzIgKz0gaW5kZXg7Cj4gICAKPiAtICAgIHJldHVybiB0YWJsZSAr
IG9mZnNldDsKPiArICAgIHJldHVybiB0YWJsZTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgdm9pZCBm
cmVlX2ludHJlbWFwX2VudHJ5KGludCBzZWcsIGludCBiZGYsIGludCBvZmZzZXQpCj4gLXsKPiAt
ICAgIHUzMiAqZW50cnkgPSBnZXRfaW50cmVtYXBfZW50cnkoc2VnLCBiZGYsIG9mZnNldCk7Cj4g
LQo+IC0gICAgbWVtc2V0KGVudHJ5LCAwLCBzaXplb2YodTMyKSk7Cj4gLSAgICBfX2NsZWFyX2Jp
dChvZmZzZXQsIGdldF9pdnJzX21hcHBpbmdzKHNlZylbYmRmXS5pbnRyZW1hcF9pbnVzZSk7Cj4g
LX0KPiAtCj4gLXN0YXRpYyB2b2lkIHVwZGF0ZV9pbnRyZW1hcF9lbnRyeSh1MzIqIGVudHJ5LCB1
OCB2ZWN0b3IsIHU4IGludF90eXBlLAo+IC0gICAgdTggZGVzdF9tb2RlLCB1OCBkZXN0KQo+IC17
Cj4gLSAgICBzZXRfZmllbGRfaW5fcmVnX3UzMihJT01NVV9DT05UUk9MX0VOQUJMRUQsIDAsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICBJTlRfUkVNQVBfRU5UUllfUkVNQVBFTl9NQVNL
LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgSU5UX1JFTUFQX0VOVFJZX1JFTUFQRU5f
U0hJRlQsIGVudHJ5KTsKPiAtICAgIHNldF9maWVsZF9pbl9yZWdfdTMyKElPTU1VX0NPTlRST0xf
RElTQUJMRUQsICplbnRyeSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIElOVF9SRU1B
UF9FTlRSWV9TVVBJT1BGX01BU0ssCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBJTlRf
UkVNQVBfRU5UUllfU1VQSU9QRl9TSElGVCwgZW50cnkpOwo+IC0gICAgc2V0X2ZpZWxkX2luX3Jl
Z191MzIoaW50X3R5cGUsICplbnRyeSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIElO
VF9SRU1BUF9FTlRSWV9JTlRUWVBFX01BU0ssCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBJTlRfUkVNQVBfRU5UUllfSU5UVFlQRV9TSElGVCwgZW50cnkpOwo+IC0gICAgc2V0X2ZpZWxk
X2luX3JlZ191MzIoSU9NTVVfQ09OVFJPTF9ESVNBQkxFRCwgKmVudHJ5LAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgSU5UX1JFTUFQX0VOVFJZX1JFUUVPSV9NQVNLLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgSU5UX1JFTUFQX0VOVFJZX1JFUUVPSV9TSElGVCwgZW50cnkp
Owo+IC0gICAgc2V0X2ZpZWxkX2luX3JlZ191MzIoKHUzMilkZXN0X21vZGUsICplbnRyeSwKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIElOVF9SRU1BUF9FTlRSWV9ETV9NQVNLLAo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgSU5UX1JFTUFQX0VOVFJZX0RNX1NISUZULCBlbnRy
eSk7Cj4gLSAgICBzZXRfZmllbGRfaW5fcmVnX3UzMigodTMyKWRlc3QsICplbnRyeSwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIElOVF9SRU1BUF9FTlRSWV9ERVNUX01BU1QsCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBJTlRfUkVNQVBfRU5UUllfREVTVF9TSElGVCwgZW50
cnkpOwo+IC0gICAgc2V0X2ZpZWxkX2luX3JlZ191MzIoKHUzMil2ZWN0b3IsICplbnRyeSwKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIElOVF9SRU1BUF9FTlRSWV9WRUNUT1JfTUFTSywK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIElOVF9SRU1BUF9FTlRSWV9WRUNUT1JfU0hJ
RlQsIGVudHJ5KTsKPiArc3RhdGljIHZvaWQgZnJlZV9pbnRyZW1hcF9lbnRyeSh1bnNpZ25lZCBp
bnQgc2VnLCB1bnNpZ25lZCBpbnQgYmRmLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBpbmRleCkKPiArewo+ICsgICAgdW5pb24gaXJ0ZV9wdHIgZW50cnkg
PSBnZXRfaW50cmVtYXBfZW50cnkoc2VnLCBiZGYsIGluZGV4KTsKPiArCj4gKyAgICBBQ0NFU1Nf
T05DRShlbnRyeS5wdHIzMi0+cmF3WzBdKSA9IDA7Cj4gKwo+ICsgICAgX19jbGVhcl9iaXQoaW5k
ZXgsIGdldF9pdnJzX21hcHBpbmdzKHNlZylbYmRmXS5pbnRyZW1hcF9pbnVzZSk7Cj4gK30KPiAr
Cj4gK3N0YXRpYyB2b2lkIHVwZGF0ZV9pbnRyZW1hcF9lbnRyeSh1bmlvbiBpcnRlX3B0ciBlbnRy
eSwgdW5zaWduZWQgaW50IHZlY3RvciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBpbnRfdHlwZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBkZXN0X21vZGUsIHVuc2lnbmVkIGludCBkZXN0KQo+ICt7Cj4g
KyAgICBzdHJ1Y3QgaXJ0ZV9iYXNpYyBiYXNpYyA9IHsKPiArICAgICAgICAucmVtYXBfZW4gPSB0
cnVlLAo+ICsgICAgICAgIC5pbnRfdHlwZSA9IGludF90eXBlLAo+ICsgICAgICAgIC5kbSA9IGRl
c3RfbW9kZSwKPiArICAgICAgICAuZGVzdCA9IGRlc3QsCj4gKyAgICAgICAgLnZlY3RvciA9IHZl
Y3RvciwKPiArICAgIH07Cj4gKwo+ICsgICAgQUNDRVNTX09OQ0UoZW50cnkucHRyMzItPnJhd1sw
XSkgPQo+ICsgICAgICAgIGNvbnRhaW5lcl9vZigmYmFzaWMsIHVuaW9uIGlydGUzMiwgYmFzaWMp
LT5yYXdbMF07Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyBpbmxpbmUgaW50IGdldF9ydGVfaW5kZXgo
Y29uc3Qgc3RydWN0IElPX0FQSUNfcm91dGVfZW50cnkgKnJ0ZSkKPiBAQCAtMTYzLDcgKzE4Miw3
IEBAIHN0YXRpYyBpbnQgdXBkYXRlX2ludHJlbWFwX2VudHJ5X2Zyb21faW8KPiAgICAgICB1MTYg
KmluZGV4KQo+ICAgewo+ICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gLSAgICB1MzIqIGVu
dHJ5Owo+ICsgICAgdW5pb24gaXJ0ZV9wdHIgZW50cnk7Cj4gICAgICAgdTggZGVsaXZlcnlfbW9k
ZSwgZGVzdCwgdmVjdG9yLCBkZXN0X21vZGU7Cj4gICAgICAgaW50IHJlcV9pZDsKPiAgICAgICBz
cGlubG9ja190ICpsb2NrOwo+IEBAIC0yMDEsMTIgKzIyMCw4IEBAIHN0YXRpYyBpbnQgdXBkYXRl
X2ludHJlbWFwX2VudHJ5X2Zyb21faW8KPiAgICAgICAgICAgICogc28gbmVlZCB0byByZWNvdmVy
IHZlY3RvciBhbmQgZGVsaXZlcnkgbW9kZSBmcm9tIElSVEUuCj4gICAgICAgICAgICAqLwo+ICAg
ICAgICAgICBBU1NFUlQoZ2V0X3J0ZV9pbmRleChydGUpID09IG9mZnNldCk7Cj4gLSAgICAgICAg
dmVjdG9yID0gZ2V0X2ZpZWxkX2Zyb21fcmVnX3UzMigqZW50cnksCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBJTlRfUkVNQVBfRU5UUllfVkVDVE9SX01BU0ssCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJTlRfUkVNQVBfRU5UUllf
VkVDVE9SX1NISUZUKTsKPiAtICAgICAgICBkZWxpdmVyeV9tb2RlID0gZ2V0X2ZpZWxkX2Zyb21f
cmVnX3UzMigqZW50cnksCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgSU5UX1JFTUFQX0VOVFJZX0lOVFRZUEVfTUFTSywKPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJTlRfUkVNQVBfRU5UUllfSU5UVFlQRV9T
SElGVCk7Cj4gKyAgICAgICAgdmVjdG9yID0gZW50cnkucHRyMzItPmJhc2ljLnZlY3RvcjsKPiAr
ICAgICAgICBkZWxpdmVyeV9tb2RlID0gZW50cnkucHRyMzItPmJhc2ljLmludF90eXBlOwo+ICAg
ICAgIH0KPiAgICAgICB1cGRhdGVfaW50cmVtYXBfZW50cnkoZW50cnksIHZlY3RvciwgZGVsaXZl
cnlfbW9kZSwgZGVzdF9tb2RlLCBkZXN0KTsKPiAgIAo+IEBAIC0yMjgsNyArMjQzLDcgQEAgaW50
IF9faW5pdCBhbWRfaW9tbXVfc2V0dXBfaW9hcGljX3JlbWFwcAo+ICAgewo+ICAgICAgIHN0cnVj
dCBJT19BUElDX3JvdXRlX2VudHJ5IHJ0ZTsKPiAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+
IC0gICAgdTMyKiBlbnRyeTsKPiArICAgIHVuaW9uIGlydGVfcHRyIGVudHJ5Owo+ICAgICAgIGlu
dCBhcGljLCBwaW47Cj4gICAgICAgdTggZGVsaXZlcnlfbW9kZSwgZGVzdCwgdmVjdG9yLCBkZXN0
X21vZGU7Cj4gICAgICAgdTE2IHNlZywgYmRmLCByZXFfaWQ7Cj4gQEAgLTQwNywxNiArNDIyLDE0
IEBAIHVuc2lnbmVkIGludCBhbWRfaW9tbXVfcmVhZF9pb2FwaWNfZnJvbV8KPiAgICAgICAgICAg
dTE2IGJkZiA9IGlvYXBpY19zYmRmW2lkeF0uYmRmOwo+ICAgICAgICAgICB1MTYgc2VnID0gaW9h
cGljX3NiZGZbaWR4XS5zZWc7Cj4gICAgICAgICAgIHUxNiByZXFfaWQgPSBnZXRfaW50cmVtYXBf
cmVxdWVzdG9yX2lkKHNlZywgYmRmKTsKPiAtICAgICAgICBjb25zdCB1MzIgKmVudHJ5ID0gZ2V0
X2ludHJlbWFwX2VudHJ5KHNlZywgcmVxX2lkLCBvZmZzZXQpOwo+ICsgICAgICAgIHVuaW9uIGly
dGVfcHRyIGVudHJ5ID0gZ2V0X2ludHJlbWFwX2VudHJ5KHNlZywgcmVxX2lkLCBvZmZzZXQpOwo+
ICAgCj4gICAgICAgICAgIEFTU0VSVChvZmZzZXQgPT0gKHZhbCAmIChJTlRSRU1BUF9FTlRSSUVT
IC0gMSkpKTsKPiAgICAgICAgICAgdmFsICY9IH4oSU5UUkVNQVBfRU5UUklFUyAtIDEpOwo+IC0g
ICAgICAgIHZhbCB8PSBnZXRfZmllbGRfZnJvbV9yZWdfdTMyKCplbnRyeSwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJTlRfUkVNQVBfRU5UUllfSU5UVFlQRV9NQVNL
LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElOVF9SRU1BUF9FTlRS
WV9JTlRUWVBFX1NISUZUKSA8PCA4Owo+IC0gICAgICAgIHZhbCB8PSBnZXRfZmllbGRfZnJvbV9y
ZWdfdTMyKCplbnRyeSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJ
TlRfUkVNQVBfRU5UUllfVkVDVE9SX01BU0ssCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgSU5UX1JFTUFQX0VOVFJZX1ZFQ1RPUl9TSElGVCk7Cj4gKyAgICAgICAgdmFs
IHw9IE1BU0tfSU5TUihlbnRyeS5wdHIzMi0+YmFzaWMuaW50X3R5cGUsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICBJT19BUElDX1JFRElSX0RFTElWX01PREVfTUFTSyk7Cj4gKyAgICAgICAg
dmFsIHw9IE1BU0tfSU5TUihlbnRyeS5wdHIzMi0+YmFzaWMudmVjdG9yLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgSU9fQVBJQ19SRURJUl9WRUNUT1JfTUFTSyk7Cj4gICAgICAgfQo+ICAg
Cj4gICAgICAgcmV0dXJuIHZhbDsKPiBAQCAtNDI3LDcgKzQ0MCw3IEBAIHN0YXRpYyBpbnQgdXBk
YXRlX2ludHJlbWFwX2VudHJ5X2Zyb21fbXMKPiAgICAgICBpbnQgKnJlbWFwX2luZGV4LCBjb25z
dCBzdHJ1Y3QgbXNpX21zZyAqbXNnLCB1MzIgKmRhdGEpCj4gICB7Cj4gICAgICAgdW5zaWduZWQg
bG9uZyBmbGFnczsKPiAtICAgIHUzMiogZW50cnk7Cj4gKyAgICB1bmlvbiBpcnRlX3B0ciBlbnRy
eTsKPiAgICAgICB1MTYgcmVxX2lkLCBhbGlhc19pZDsKPiAgICAgICB1OCBkZWxpdmVyeV9tb2Rl
LCBkZXN0LCB2ZWN0b3IsIGRlc3RfbW9kZTsKPiAgICAgICBzcGlubG9ja190ICpsb2NrOwo+IEBA
IC01ODEsNyArNTk0LDcgQEAgdm9pZCBhbWRfaW9tbXVfcmVhZF9tc2lfZnJvbV9pcmUoCj4gICAg
ICAgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSBtc2lfZGVzYy0+ZGV2Owo+ICAgICAgIHUx
NiBiZGYgPSBwZGV2ID8gUENJX0JERjIocGRldi0+YnVzLCBwZGV2LT5kZXZmbikgOiBocGV0X3Ni
ZGYuYmRmOwo+ICAgICAgIHUxNiBzZWcgPSBwZGV2ID8gcGRldi0+c2VnIDogaHBldF9zYmRmLnNl
ZzsKPiAtICAgIGNvbnN0IHUzMiAqZW50cnk7Cj4gKyAgICB1bmlvbiBpcnRlX3B0ciBlbnRyeTsK
PiAgIAo+ICAgICAgIGlmICggSVNfRVJSX09SX05VTEwoX2ZpbmRfaW9tbXVfZm9yX2RldmljZShz
ZWcsIGJkZikpICkKPiAgICAgICAgICAgcmV0dXJuOwo+IEBAIC01OTcsMTIgKzYxMCwxMCBAQCB2
b2lkIGFtZF9pb21tdV9yZWFkX21zaV9mcm9tX2lyZSgKPiAgICAgICB9Cj4gICAKPiAgICAgICBt
c2ctPmRhdGEgJj0gfihJTlRSRU1BUF9FTlRSSUVTIC0gMSk7Cj4gLSAgICBtc2ctPmRhdGEgfD0g
Z2V0X2ZpZWxkX2Zyb21fcmVnX3UzMigqZW50cnksCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBJTlRfUkVNQVBfRU5UUllfSU5UVFlQRV9NQVNLLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU5UX1JFTUFQX0VOVFJZX0lOVFRZUEVf
U0hJRlQpIDw8IDg7Cj4gLSAgICBtc2ctPmRhdGEgfD0gZ2V0X2ZpZWxkX2Zyb21fcmVnX3UzMigq
ZW50cnksCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJTlRfUkVN
QVBfRU5UUllfVkVDVE9SX01BU0ssCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBJTlRfUkVNQVBfRU5UUllfVkVDVE9SX1NISUZUKTsKPiArICAgIG1zZy0+ZGF0YSB8
PSBNQVNLX0lOU1IoZW50cnkucHRyMzItPmJhc2ljLmludF90eXBlLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICBNU0lfREFUQV9ERUxJVkVSWV9NT0RFX01BU0spOwo+ICsgICAgbXNnLT5k
YXRhIHw9IE1BU0tfSU5TUihlbnRyeS5wdHIzMi0+YmFzaWMudmVjdG9yLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICBNU0lfREFUQV9WRUNUT1JfTUFTSyk7Cj4gICB9Cj4gICAKPiAgIGlu
dCBfX2luaXQgYW1kX2lvbW11X2ZyZWVfaW50cmVtYXBfdGFibGUoCj4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vc3ZtL2FtZC1pb21tdS1kZWZzLmgKPiArKysgYi94ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS9zdm0vYW1kLWlvbW11LWRlZnMuaAo+IEBAIC00NjksMjIgKzQ2OSw2IEBAIHN0
cnVjdCBhbWRfaW9tbXVfcHRlIHsKPiAgICNkZWZpbmUgSU9NTVVfQ09OVFJPTF9ESVNBQkxFRAkw
Cj4gICAjZGVmaW5lIElPTU1VX0NPTlRST0xfRU5BQkxFRAkxCj4gICAKPiAtLyogaW50ZXJydXB0
IHJlbWFwcGluZyB0YWJsZSAqLwo+IC0jZGVmaW5lIElOVF9SRU1BUF9FTlRSWV9SRU1BUEVOX01B
U0sgICAgMHgwMDAwMDAwMQo+IC0jZGVmaW5lIElOVF9SRU1BUF9FTlRSWV9SRU1BUEVOX1NISUZU
ICAgMAo+IC0jZGVmaW5lIElOVF9SRU1BUF9FTlRSWV9TVVBJT1BGX01BU0sgICAgMHgwMDAwMDAw
Mgo+IC0jZGVmaW5lIElOVF9SRU1BUF9FTlRSWV9TVVBJT1BGX1NISUZUICAgMQo+IC0jZGVmaW5l
IElOVF9SRU1BUF9FTlRSWV9JTlRUWVBFX01BU0sgICAgMHgwMDAwMDAxQwo+IC0jZGVmaW5lIElO
VF9SRU1BUF9FTlRSWV9JTlRUWVBFX1NISUZUICAgMgo+IC0jZGVmaW5lIElOVF9SRU1BUF9FTlRS
WV9SRVFFT0lfTUFTSyAgICAgMHgwMDAwMDAyMAo+IC0jZGVmaW5lIElOVF9SRU1BUF9FTlRSWV9S
RVFFT0lfU0hJRlQgICAgNQo+IC0jZGVmaW5lIElOVF9SRU1BUF9FTlRSWV9ETV9NQVNLICAgICAg
ICAgMHgwMDAwMDA0MAo+IC0jZGVmaW5lIElOVF9SRU1BUF9FTlRSWV9ETV9TSElGVCAgICAgICAg
Ngo+IC0jZGVmaW5lIElOVF9SRU1BUF9FTlRSWV9ERVNUX01BU1QgICAgICAgMHgwMDAwRkYwMAo+
IC0jZGVmaW5lIElOVF9SRU1BUF9FTlRSWV9ERVNUX1NISUZUICAgICAgOAo+IC0jZGVmaW5lIElO
VF9SRU1BUF9FTlRSWV9WRUNUT1JfTUFTSyAgICAgMHgwMEZGMDAwMAo+IC0jZGVmaW5lIElOVF9S
RU1BUF9FTlRSWV9WRUNUT1JfU0hJRlQgICAgMTYKPiAtCj4gICAjZGVmaW5lIElOVl9JT01NVV9B
TExfUEFHRVNfQUREUkVTUyAgICAgICgoMVVMTCA8PCA2MykgLSAxKQo+ICAgCj4gICAjZGVmaW5l
IElPTU1VX1JJTkdfQlVGRkVSX1BUUl9NQVNLICAgICAgICAgICAgICAgICAgMHgwMDA3RkZGMAo+
IAoKLS0gCkJyaWFuIFdvb2RzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
