Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332C36EAA6
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 20:29:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoXa4-0004qC-Lr; Fri, 19 Jul 2019 18:26:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AH7D=VQ=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hoXa2-0004q3-Nw
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 18:26:06 +0000
X-Inumbo-ID: aa1801a4-aa52-11e9-8974-7f63a07d2ccf
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.69.64]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa1801a4-aa52-11e9-8974-7f63a07d2ccf;
 Fri, 19 Jul 2019 18:26:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8eN0AkNQrT/nU5INFhjn7DPkVc7ekvXANf46H6c9Z56XAYnA/V3zo5a3MeRaKNUMGtR0g8sJbP/N2IqKyuv+qa5bLGyXT6Xs0+jcbbAa/FpBRLcrRF+NOlzSuGQEamlbPPKb7xu84iguQOlOPQpT6mOCZTHb0eQyTFj4/QNu7eB58iojDlpmeGW4g8sJz6get6r1lUcv9FOlbaKABXoibXrS6DLogSb+FtwMXKieqjYiZ4YMo8WjxQrdzhawD35oJDRNLRVLPm2cVb/g8FFc7o6GdG+Jy4jf6iRs0gwwZrKEW3zn9RduIKBrzRoWrCDClDUAU5nTu2kDI+z1rug0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdqUr8lKYhvCwP4ckyLlWwRxje7XLcf6tV1yV8mnfqk=;
 b=HeE/FBZC26BYSObkqZzujjo/aHrwk3DaTaETKKPEhniMh3W807SGJR8RlVEZrw9/q6iHtLcLGfre7Z+GX/Hj0kvLyk+OA+wep/8y+7BMEC9N4FisotvLx1l0ucKjQ1sFNFFRHwNpB9+9Qm/088SG+zOwwrKFPcM0h9Bt3ZBTWQKzMkf4EYDuf32BDyI4NYEVxF2PPWwAf4wGSURCu83pJAkkvTU1PA3hiyBk/+yixNLLd4nh8P5sKY0FP1LQcRaBfutJleMUJnF1/yovphyLxLgg4VGsHpXj19zDxT7J1a3w2hbDGcL0PeNnuCNT8dtJCL6Gr/QMalO0v1ChtUu5Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdqUr8lKYhvCwP4ckyLlWwRxje7XLcf6tV1yV8mnfqk=;
 b=OJlRGUOD2tmAYt1UxXBlNqFj3lHpmAd5Wu0445WRY9eDMZlvihJgy9yzheKfphFvgyWUMAuxl+txL8nuMipnlm7yN5mRxGlTYT9ciInErwMgbNpScllsspZYGqLEGli2NPvoWXnDru+b5L3zztw76gbrOSueEWhcJeT+V1MfABQ=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB2602.namprd12.prod.outlook.com (20.176.116.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 18:26:01 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc%7]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 18:26:01 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v3 05/14] AMD/IOMMU: pass IOMMU to iterate_ivrs_entries()
 callback
Thread-Index: AQHVO/TkY4CTIKCfUkqJrx2Ef3CMU6bSRugA
Date: Fri, 19 Jul 2019 18:26:01 +0000
Message-ID: <20190719182558.GD4496@amd.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <e2072315-7c8c-2f82-99f4-795cc93f1fa8@suse.com>
In-Reply-To: <e2072315-7c8c-2f82-99f4-795cc93f1fa8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM6PR11CA0057.namprd11.prod.outlook.com
 (2603:10b6:5:14c::34) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6e51757-7c1f-4c15-c890-08d70c768d28
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2602; 
x-ms-traffictypediagnostic: DM6PR12MB2602:
x-microsoft-antispam-prvs: <DM6PR12MB2602D5CE22B7B4E4BFA6034CE5CB0@DM6PR12MB2602.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(189003)(199004)(52314003)(68736007)(54906003)(2616005)(478600001)(486006)(11346002)(14454004)(6506007)(446003)(386003)(476003)(256004)(52116002)(99286004)(1076003)(25786009)(76176011)(102836004)(4326008)(6246003)(36756003)(316002)(71200400001)(71190400001)(14444005)(26005)(6436002)(305945005)(81166006)(6916009)(229853002)(8676002)(66476007)(66556008)(8936002)(64756008)(66446008)(66946007)(86362001)(53936002)(6116002)(186003)(7736002)(3846002)(6486002)(6512007)(2906002)(81156014)(66066001)(33656002)(5660300002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2602;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LXcEuResnajI1XNqfDQbzqpFhGmWQCCcStxr7eDGXxG8t7J4ANPD7OtlCVuh1M20gY47B//XS3Am+TAsCPdeU+CVlk/wn42OQyfrUVDXPylOrXmKt57UiFOjbUdgp7ab1Qg5QYMW2yEzyEXj3YV+8LXp90iamev7a8Y0mQrqPY1JD+AutoIBHtqz7W/Kcwh886HiUEiQuWIIR7E4wSjoO0qrhczRXhQeQ4eNIFdM+y0lxrBYtIlfrQJaYFWx8oqywpn6rJPLkq+4GBhk9X/XWioIIX8CmSU9fw1vtb282Zo9IYIUnH+NYWrxpirD0cYm3wmqpgTcnmPBnRQ/QS2JvnFkpnONdjRXSRjEIeVArKaNkj63ojSczyAzBZPV2jxUIFP86SlKAFvDuApu01Qx7uICXQ1HP8RdW2otRG+GELk=
Content-ID: <CD385F2F5CB5A54A9CDC95DA45448BCB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e51757-7c1f-4c15-c890-08d70c768d28
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 18:26:01.1358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2602
Subject: Re: [Xen-devel] [PATCH v3 05/14] AMD/IOMMU: pass IOMMU to
 iterate_ivrs_entries() callback
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

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDQ6Mzc6MDRQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQm90aCB1c2VycyB3aWxsIHdhbnQgdG8ga25vdyBJT01NVSBwcm9wZXJ0aWVzIChzcGVj
aWZpY2FsbHkgdGhlIElSVEUKPiBzaXplKSBzdWJzZXF1ZW50bHkuIExldmVyYWdlIHRoaXMgdG8g
YXZvaWQgcG9pbnRsZXNzIGNhbGxzIHRvIHRoZQo+IGNhbGxiYWNrIHdoZW4gSVZSUyBtYXBwaW5n
IHRhYmxlIGVudHJpZXMgYXJlIHVucG9wdWxhdGVkLiBUbyBhdm9pZAo+IGxlYWtpbmcgaW50ZXJy
dXB0IHJlbWFwcGluZyB0YWJsZXMgKGJvZ3VzbHkpIGFsbG9jYXRlZCBmb3IgSU9NTVVzCj4gdGhl
bXNlbHZlcywgdGhpcyByZXF1aXJlcyBzdXBwcmVzc2luZyB0aGVpciBhbGxvY2F0aW9uIGluIHRo
ZSBmaXJzdAo+IHBsYWNlLCB0YWtpbmcgYSBzdGVwIGZ1cnRoZXIgd2hhdCBjb21taXQgNzU3MTIy
YzBjZiAoJ0FNRC9JT01NVTogZG9uJ3QKPiAiYWRkIiBJT01NVXMnKSBoYWQgZG9uZS4KPiAKPiBB
ZGRpdGlvbmFsbHkgc3VwcHJlc3MgdGhlIGNhbGwgZm9yIGFsaWFzIGVudHJpZXMsIGFzIGFnYWlu
IGJvdGggdXNlcnMKPiBkb24ndCBjYXJlIGFib3V0IHRoZXNlIGFueXdheS4gSW4gZmFjdCB0aGlz
IGVsaW1pbmF0ZXMgYSBmYWlyIGJpdCBvZgo+IHJlZHVuZGFuY3kgZnJvbSBkdW1wIG91dHB1dC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tl
ZC1ieTogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+Cgo+IC0tLQo+IHYzOiBOZXcu
Cj4gLS0tCj4gVEJEOiBBbG9uZyB0aGUgbGluZXMgb2YgYXZvaWRpbmcgdGhlIElSVCBhbGxvY2F0
aW9uIGZvciB0aGUgSU9NTVVzLCBpcwo+ICAgICAgIHRoZXJlIGEgd2F5IHRvIHJlY29nbml6ZSB0
aGUgbWFueSBDUFUtcHJvdmlkZWQgZGV2aWNlcyBtYW55IG9mCj4gICAgICAgd2hpY2ggY2FuJ3Qg
Z2VuZXJhdGUgaW50ZXJydXB0cyBhbnl3YXksIGFuZCBhdm9pZCBhbGxvY2F0aW9ucyBmb3IKPiAg
ICAgICB0aGVtIGFzIHdlbGw/IEl0J3MgMzJrIHBlciBkZXZpY2UsIGFmdGVyIGFsbC4gQW5vdGhl
ciBvcHRpb24gbWlnaHQKPiAgICAgICBiZSBvbi1kZW1hbmQgYWxsb2NhdGlvbiBvZiB0aGUgdGFi
bGVzLCBidXQgcXVpdGUgcG9zc2libHkgd2UnZCBnZXQKPiAgICAgICBpbnRvIHRyb3VibGUgd2l0
aCBlcnJvciBoYW5kbGluZyB0aGVyZS4KPiAKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hbWQvaW9tbXVfYWNwaS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lv
bW11X2FjcGkuYwo+IEBAIC02NSw3ICs2NSwxMSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYWRkX2l2
cnNfbWFwcGluZ19lbnRyCj4gICAgICAgLyogb3ZlcnJpZGUgZmxhZ3MgZm9yIHJhbmdlIG9mIGRl
dmljZXMgKi8KPiAgICAgICBpdnJzX21hcHBpbmdzW2JkZl0uZGV2aWNlX2ZsYWdzID0gZmxhZ3M7
Cj4gICAKPiAtICAgIGlmIChpdnJzX21hcHBpbmdzW2FsaWFzX2lkXS5pbnRyZW1hcF90YWJsZSA9
PSBOVUxMICkKPiArICAgIC8qIERvbid0IG1hcCBhbiBJT01NVSBieSBpdHNlbGYuICovCj4gKyAg
ICBpZiAoIGlvbW11LT5iZGYgPT0gYmRmICkKPiArICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAg
aWYgKCAhaXZyc19tYXBwaW5nc1thbGlhc19pZF0uaW50cmVtYXBfdGFibGUgKQo+ICAgICAgIHsK
PiAgICAgICAgICAgIC8qIGFsbG9jYXRlIHBlci1kZXZpY2UgaW50ZXJydXB0IHJlbWFwcGluZyB0
YWJsZSAqLwo+ICAgICAgICAgICAgaWYgKCBhbWRfaW9tbXVfcGVyZGV2X2ludHJlbWFwICkKPiBA
QCAtODEsOCArODUsOSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYWRkX2l2cnNfbWFwcGluZ19lbnRy
Cj4gICAgICAgICAgICAgICAgaXZyc19tYXBwaW5nc1thbGlhc19pZF0uaW50cmVtYXBfaW51c2Ug
PSBzaGFyZWRfaW50cmVtYXBfaW51c2U7Cj4gICAgICAgICAgICB9Cj4gICAgICAgfQo+IC0gICAg
LyogQXNzaWduIElPTU1VIGhhcmR3YXJlLCBidXQgZG9uJ3QgbWFwIGFuIElPTU1VIGJ5IGl0c2Vs
Zi4gKi8KPiAtICAgIGl2cnNfbWFwcGluZ3NbYmRmXS5pb21tdSA9IGlvbW11LT5iZGYgIT0gYmRm
ID8gaW9tbXUgOiBOVUxMOwo+ICsKPiArICAgIC8qIEFzc2lnbiBJT01NVSBoYXJkd2FyZS4gKi8K
PiArICAgIGl2cnNfbWFwcGluZ3NbYmRmXS5pb21tdSA9IGlvbW11Owo+ICAgfQo+ICAgCj4gICBz
dGF0aWMgc3RydWN0IGFtZF9pb21tdSAqIF9faW5pdCBmaW5kX2lvbW11X2Zyb21fYmRmX2NhcCgK
PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4gKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwo+IEBAIC0xMDY5LDcgKzEw
NjksOCBAQCBpbnQgaXRlcmF0ZV9pdnJzX21hcHBpbmdzKGludCAoKmhhbmRsZXIpCj4gICAgICAg
cmV0dXJuIHJjOwo+ICAgfQo+ICAgCj4gLWludCBpdGVyYXRlX2l2cnNfZW50cmllcyhpbnQgKCpo
YW5kbGVyKSh1MTYgc2VnLCBzdHJ1Y3QgaXZyc19tYXBwaW5ncyAqKSkKPiAraW50IGl0ZXJhdGVf
aXZyc19lbnRyaWVzKGludCAoKmhhbmRsZXIpKGNvbnN0IHN0cnVjdCBhbWRfaW9tbXUgKiwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBpdnJzX21hcHBp
bmdzICopKQo+ICAgewo+ICAgICAgIHUxNiBzZWcgPSAwOwo+ICAgICAgIGludCByYyA9IDA7Cj4g
QEAgLTEwODIsNyArMTA4MywxMiBAQCBpbnQgaXRlcmF0ZV9pdnJzX2VudHJpZXMoaW50ICgqaGFu
ZGxlcikoCj4gICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAgc2VnID0gSVZSU19NQVBQ
SU5HU19TRUcobWFwKTsKPiAgICAgICAgICAgZm9yICggYmRmID0gMDsgIXJjICYmIGJkZiA8IGl2
cnNfYmRmX2VudHJpZXM7ICsrYmRmICkKPiAtICAgICAgICAgICAgcmMgPSBoYW5kbGVyKHNlZywg
bWFwICsgYmRmKTsKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBhbWRf
aW9tbXUgKmlvbW11ID0gbWFwW2JkZl0uaW9tbXU7Cj4gKwo+ICsgICAgICAgICAgICBpZiAoIGlv
bW11ICYmIG1hcFtiZGZdLmR0ZV9yZXF1ZXN0b3JfaWQgPT0gYmRmICkKPiArICAgICAgICAgICAg
ICAgIHJjID0gaGFuZGxlcihpb21tdSwgJm1hcFtiZGZdKTsKPiArICAgICAgICB9Cj4gICAgICAg
fSB3aGlsZSAoICFyYyAmJiArK3NlZyApOwo+ICAgCj4gICAgICAgcmV0dXJuIHJjOwo+IC0tLSBh
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMKPiArKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jCj4gQEAgLTYxNyw3ICs2MTcsNyBAQCB2
b2lkIGFtZF9pb21tdV9yZWFkX21zaV9mcm9tX2lyZSgKPiAgIH0KPiAgIAo+ICAgaW50IF9faW5p
dCBhbWRfaW9tbXVfZnJlZV9pbnRyZW1hcF90YWJsZSgKPiAtICAgIHUxNiBzZWcsIHN0cnVjdCBp
dnJzX21hcHBpbmdzICppdnJzX21hcHBpbmcpCj4gKyAgICBjb25zdCBzdHJ1Y3QgYW1kX2lvbW11
ICppb21tdSwgc3RydWN0IGl2cnNfbWFwcGluZ3MgKml2cnNfbWFwcGluZykKPiAgIHsKPiAgICAg
ICB2b2lkICp0YiA9IGl2cnNfbWFwcGluZy0+aW50cmVtYXBfdGFibGU7Cj4gICAKPiBAQCAtNjkz
LDE0ICs2OTMsMTUgQEAgc3RhdGljIHZvaWQgZHVtcF9pbnRyZW1hcF90YWJsZShjb25zdCB1Mwo+
ICAgICAgIH0KPiAgIH0KPiAgIAo+IC1zdGF0aWMgaW50IGR1bXBfaW50cmVtYXBfbWFwcGluZyh1
MTYgc2VnLCBzdHJ1Y3QgaXZyc19tYXBwaW5ncyAqaXZyc19tYXBwaW5nKQo+ICtzdGF0aWMgaW50
IGR1bXBfaW50cmVtYXBfbWFwcGluZyhjb25zdCBzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGl2cnNfbWFwcGluZ3MgKml2
cnNfbWFwcGluZykKPiAgIHsKPiAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICAgCj4gICAg
ICAgaWYgKCAhaXZyc19tYXBwaW5nICkKPiAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAKPiAtICAg
IHByaW50aygiICAlMDR4OiUwMng6JTAyeDoldTpcbiIsIHNlZywKPiArICAgIHByaW50aygiICAl
MDR4OiUwMng6JTAyeDoldTpcbiIsIGlvbW11LT5zZWcsCj4gICAgICAgICAgICAgIFBDSV9CVVMo
aXZyc19tYXBwaW5nLT5kdGVfcmVxdWVzdG9yX2lkKSwKPiAgICAgICAgICAgICAgUENJX1NMT1Qo
aXZyc19tYXBwaW5nLT5kdGVfcmVxdWVzdG9yX2lkKSwKPiAgICAgICAgICAgICAgUENJX0ZVTkMo
aXZyc19tYXBwaW5nLT5kdGVfcmVxdWVzdG9yX2lkKSk7Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9hbWQtaW9tbXUuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYW1kLWlvbW11LmgK
PiBAQCAtMTI5LDcgKzEyOSw4IEBAIGV4dGVybiB1OCBpdmhkX3R5cGU7Cj4gICAKPiAgIHN0cnVj
dCBpdnJzX21hcHBpbmdzICpnZXRfaXZyc19tYXBwaW5ncyh1MTYgc2VnKTsKPiAgIGludCBpdGVy
YXRlX2l2cnNfbWFwcGluZ3MoaW50ICgqKSh1MTYgc2VnLCBzdHJ1Y3QgaXZyc19tYXBwaW5ncyAq
KSk7Cj4gLWludCBpdGVyYXRlX2l2cnNfZW50cmllcyhpbnQgKCopKHUxNiBzZWcsIHN0cnVjdCBp
dnJzX21hcHBpbmdzICopKTsKPiAraW50IGl0ZXJhdGVfaXZyc19lbnRyaWVzKGludCAoKikoY29u
c3Qgc3RydWN0IGFtZF9pb21tdSAqLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgaXZyc19tYXBwaW5ncyAqKSk7Cj4gICAKPiAgIC8qIGlvbW11IHRhYmxlcyBpbiBn
dWVzdCBzcGFjZSAqLwo+ICAgc3RydWN0IG1taW9fcmVnIHsKPiAtLS0gYS94ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS9zdm0vYW1kLWlvbW11LXByb3RvLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS9zdm0vYW1kLWlvbW11LXByb3RvLmgKPiBAQCAtOTgsNyArOTgsOCBAQCBzdHJ1Y3Qg
YW1kX2lvbW11ICpmaW5kX2lvbW11X2Zvcl9kZXZpY2UoCj4gICAvKiBpbnRlcnJ1cHQgcmVtYXBw
aW5nICovCj4gICBpbnQgYW1kX2lvbW11X3NldHVwX2lvYXBpY19yZW1hcHBpbmcodm9pZCk7Cj4g
ICB2b2lkICphbWRfaW9tbXVfYWxsb2NfaW50cmVtYXBfdGFibGUodW5zaWduZWQgbG9uZyAqKik7
Cj4gLWludCBhbWRfaW9tbXVfZnJlZV9pbnRyZW1hcF90YWJsZSh1MTYgc2VnLCBzdHJ1Y3QgaXZy
c19tYXBwaW5ncyAqKTsKPiAraW50IGFtZF9pb21tdV9mcmVlX2ludHJlbWFwX3RhYmxlKAo+ICsg
ICAgY29uc3Qgc3RydWN0IGFtZF9pb21tdSAqLCBzdHJ1Y3QgaXZyc19tYXBwaW5ncyAqKTsKPiAg
IHZvaWQgYW1kX2lvbW11X2lvYXBpY191cGRhdGVfaXJlKAo+ICAgICAgIHVuc2lnbmVkIGludCBh
cGljLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgdmFsdWUpOwo+ICAgdW5zaWduZWQg
aW50IGFtZF9pb21tdV9yZWFkX2lvYXBpY19mcm9tX2lyZSgKPiAKCi0tIApCcmlhbiBXb29kcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
