Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30B36AA56
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 16:10:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnO7N-0007kg-BI; Tue, 16 Jul 2019 14:07:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OaJR=VN=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hnO7M-0007kb-Jm
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 14:07:44 +0000
X-Inumbo-ID: 137f0750-a7d3-11e9-b52e-6f9e8f4e66a5
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (unknown
 [40.107.78.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 137f0750-a7d3-11e9-b52e-6f9e8f4e66a5;
 Tue, 16 Jul 2019 14:07:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OB6HEPQwDMirJaUP+MQSn7tDOBY+4oqtp1nNpsJhcikv5Vi7PyWzmtBucL7pA4bupb7sg8g4Z1hX2oGPbuh/5RiOTOL/wZsWLfcPU5g/quVmT2YjAPTOmngJFBzUA5oED3ID77e733EIdFZiaS5JcnRF9cckDOWJ2diVDlDI0QJev8bua8DCX27v7DZZtFr5i65aPyuGEzGaSfiSAdsSm8UR2SHSOf0pJDXatzlvQx1wzq3IvFuMfvTml5yHuG+g6MfPH9RAJjx+C89czAK/ciafwQMF0DP10vH8q/0ZYojugxooDEyCjcx6vXG5ZiMcvtu4NgTdrjcMiRfD1BoWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXsVSmIsB5iZtSdYkAl7LCjQV5m9ZwUCATNjeHSuGko=;
 b=MA7GCx7niTxFb51aPIPN2xCef8qB3Y1z2d5evzm3W/OjOri0SgxuL470Zra/knXpOME0szA/CFIeK2ogupJeEwHrfF/ZbvTeMlr0kILam0RM5LNOq7wbT/L5UIvicT8ADLc3vg3vhbzN3GMC1DkSuufRtSUmPsA4wmM/p6CEnmXYDXevoGDCMoGU0xRWNpBWPU8/pIzJtzFf8489uJfV4Bi4eZYsIUHtmZQyI6ebTFPBUzRJ4erSq9lwYBLK9CSvKSJUFT6nQs+yBUtcrHRgzX8z1gL6Ohd6SxYsMk7TStyvOevMEG7l3hCYeB6su3jayGVLSU0/ueCd3Ui0Pchp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXsVSmIsB5iZtSdYkAl7LCjQV5m9ZwUCATNjeHSuGko=;
 b=IQCxkgDEngqHRb92BV3EeiZSEZAPbzSupHxlDRaW1k+TDhep7DivLgC7rXDUVgf6JRhyjPVBKZMBytMS2JKtL1B6x/ZiIEn+Dt276iwiMdbHOTC+q3Q8ZvX3QHK4IuX2nUjCmb2+O0qA7XwT6g4wFciT/PEWVvTi2wwDi/LnU4U=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3546.namprd12.prod.outlook.com (20.179.106.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 16 Jul 2019 14:07:40 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::c8d:cf8b:2569:1653]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::c8d:cf8b:2569:1653%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 14:07:40 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 1/4] iommu / x86: move call to scan_pci_devices() out
 of vendor code
Thread-Index: AQHVOwoJmACSitCOz0OFuPG+4gPVs6bNSZRk
Date: Tue, 16 Jul 2019 14:07:40 +0000
Message-ID: <DM6PR12MB3515441B2DC6C1E04D181F9EE5CE0@DM6PR12MB3515.namprd12.prod.outlook.com>
References: <20190715123710.1780-1-paul.durrant@citrix.com>
 <20190715123710.1780-2-paul.durrant@citrix.com>
In-Reply-To: <20190715123710.1780-2-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-originating-ip: [174.207.13.76]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9db7f50e-4d63-4f8b-1466-08d709f6f6f0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3546; 
x-ms-traffictypediagnostic: DM6PR12MB3546:
x-microsoft-antispam-prvs: <DM6PR12MB3546FCD27F593B4190CAD9E2E5CE0@DM6PR12MB3546.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(189003)(199004)(305945005)(52536014)(6436002)(55016002)(9686003)(66946007)(33656002)(74316002)(446003)(11346002)(14444005)(256004)(76116006)(81166006)(25786009)(4326008)(7696005)(91956017)(476003)(66556008)(66066001)(54906003)(5660300002)(81156014)(110136005)(26005)(76176011)(316002)(6246003)(8936002)(2501003)(66446008)(2906002)(229853002)(64756008)(99286004)(8676002)(68736007)(7736002)(486006)(478600001)(102836004)(3846002)(14454004)(53936002)(71200400001)(71190400001)(186003)(6116002)(86362001)(66476007)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3546;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4PGItxs194txN/lR+2xNacWKwM2xw/Ar6Yw0NUM2FitZeWrLVWpuTqiyiLj+nVy2wqkzFfc3kex6SdGZvROlwpRF5DVdnyTb5YGiwt/xEfA8W3l496PeTt/iz4q54jqrT1QY0GwBfgzscbmaq3xr+LPfa/RQ0Ceq3O27x4tY7LU1FAKdQqBkaWACGrTwe1TPE8BJn0aeHWGKPBBBxUEyzieqc6h1VggKyfXZHRkksf58mIFwEu3gdWslE3jAwJ+a54Mj54SJP8Fs4y8dnsTHRf6K7LCDwrIryuCQdZ1CtfZEKgMKg/3jps9yP0cL93aQjWMlDmK/EXPH7t6QXzcjs6M/EuC1bMCRxGWsttLq27ho/wOVOmblaVdTuh7zfsYFueagepr8MarQ59QVsC9F4b2NFItC0NPX8NfCIuwcKg8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db7f50e-4d63-4f8b-1466-08d709f6f6f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 14:07:40.3659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3546
Subject: Re: [Xen-devel] [PATCH v2 1/4] iommu / x86: move call to
 scan_pci_devices() out of vendor code
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
Cc: Kevin Tian <kevin.tian@intel.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "Woods, Brian" <Brian.Woods@amd.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gSnVseSAxNSwgMjAxOSA3OjM3OjE3IEFNIFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNp
dHJpeC5jb20+IHdyb3RlOgoKPiBJdCdzIG5vdCB2ZW5kb3Igc3BlY2lmaWMgc28gaXQgZG9lc24n
dCByZWFsbHkgYmVsb25nIHRoZXJlLgo+Cj4KPiBTY2FubmluZyB0aGUgUENJIHRvcG9sb2d5IGFs
c28gcmVhbGx5IGRvZXNuJ3QgaGF2ZSBtdWNoIHRvIGRvIHdpdGggSU9NTVUKPiBpbml0aWFsaXph
dGlvbi4gSXQgZG9lc24ndCBkZXBlbmQgb24gdGhlcmUgZXZlbiBiZWluZyBhbiBJT01NVS4gVGhp
cyBwYXRjaAo+IG1vdmVzIHRvIHRoZSBjYWxsIHRvIHRoZSBiZWdpbm5pbmcgb2YgaW9tbXVfaGFy
ZHdhcmVfc2V0dXAoKSBidXQgb25seQo+IHBsYWNlcyBpdCB0aGVyZSBiZWNhdXNlIHRoZSB0b3Bv
bG9neSBpbmZvcm1hdGlvbiB3b3VsZCBiZSBvdGhlcndpc2UgdW51c2VkLgo+Cj4KPiBTdWJzZXF1
ZW50IHBhdGNoZXMgd2lsbCBhY3R1YWxseSBtYWtlIHVzZSBvZiB0aGUgUENJIHRvcG9sb2d5IGR1
cmluZwo+ICh4ODYpIElPTU1VIGluaXRpYWxpemF0aW9uLgo+Cj4KPiBTaWduZWQtb2ZmLWJ5OiBQ
YXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEJyaWFuIFdv
b2RzIDxicmlhbi53b29kc0BhbWQuY29tPgoKPiAtLS0KPiBDYzogU3VyYXZlZSBTdXRoaWt1bHBh
bml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT4KPiBDYzogQnJpYW4gV29vZHMgPGJy
aWFuLndvb2RzQGFtZC5jb20+Cj4gQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29t
Pgo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Cj4gQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4KPgo+IHYy
Ogo+IC0gRXhwYW5kZWQgY29tbWl0IGNvbW1lbnQuCj4gLSBNb3ZlZCBQQ0kgc2NhbiB0byBiZWZv
cmUgSU9NTVUgaW5pdGlhbGl6YXRpb24sIHJhdGhlciB0aGFuIGFmdGVyIGl0Lgo+IC0tLQo+IHhl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMgfCAzICsrLQo+IHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jICAgICAgICAgfCA0IC0tLS0KPiB4ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYyAgICAgICAgIHwgNiArKysrKysKPiAzIGZpbGVz
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+Cj4gZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCj4gaW5kZXggNGFmYmNkMTYwOS4u
MzMzOGE4ZTBlOCAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNp
X2FtZF9pb21tdS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRf
aW9tbXUuYwo+IEBAIC0xODAsNyArMTgwLDggQEAgc3RhdGljIGludCBfX2luaXQgaW92X2RldGVj
dCh2b2lkKQo+Cj4gICAgIGlmICggIWFtZF9pb21tdV9wZXJkZXZfaW50cmVtYXAgKQo+ICAgICAg
ICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJBTUQtVmk6IFVzaW5nIGdsb2JhbCBpbnRlcnJ1cHQg
cmVtYXAgdGFibGUgaXMgbm90IHJlY29tbWVuZGVkIChzZWUgWFNBLTM2KSFcbiIpOwo+IC0gICAg
cmV0dXJuIHNjYW5fcGNpX2RldmljZXMoKTsKPiArCj4gKyAgICByZXR1cm4gMDsKPiB9Cj4KPiBp
bnQgYW1kX2lvbW11X2FsbG9jX3Jvb3Qoc3RydWN0IGRvbWFpbl9pb21tdSAqaGQpCj4gZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPiBpbmRleCA4YjI3ZDdlNzc1Li5iMGUzYmYyNmI1IDEw
MDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPiBAQCAtMjM3MiwxMCArMjM3Miw2
IEBAIHN0YXRpYyBpbnQgX19pbml0IHZ0ZF9zZXR1cCh2b2lkKQo+ICAgICBQKGlvbW11X2hhcF9w
dF9zaGFyZSwgIlNoYXJlZCBFUFQgdGFibGVzIik7Cj4gI3VuZGVmIFAKPgo+IC0gICAgcmV0ID0g
c2Nhbl9wY2lfZGV2aWNlcygpOwo+IC0gICAgaWYgKCByZXQgKQo+IC0gICAgICAgIGdvdG8gZXJy
b3I7Cj4gLQo+ICAgICByZXQgPSBpbml0X3Z0ZF9odygpOwo+ICAgICBpZiAoIHJldCApCj4gICAg
ICAgICBnb3RvIGVycm9yOwo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94
ODYvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jCj4gaW5kZXgg
MGZhNmRjYzNmZC4uYTc0MzhjOWMyNSAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC94ODYvaW9tbXUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21t
dS5jCj4gQEAgLTI4LDkgKzI4LDE1IEBAIHN0cnVjdCBpb21tdV9vcHMgX19yZWFkX21vc3RseSBp
b21tdV9vcHM7Cj4KPiBpbnQgX19pbml0IGlvbW11X2hhcmR3YXJlX3NldHVwKHZvaWQpCj4gewo+
ICsgICAgaW50IHJjOwo+ICsKPiAgICAgaWYgKCAhaW9tbXVfaW5pdF9vcHMgKQo+ICAgICAgICAg
cmV0dXJuIC1FTk9ERVY7Cj4KPiArICAgIHJjID0gc2Nhbl9wY2lfZGV2aWNlcygpOwo+ICsgICAg
aWYgKCByYyApCj4gKyAgICAgICAgcmV0dXJuIHJjOwo+ICsKPiAgICAgaWYgKCAhaW9tbXVfb3Bz
LmluaXQgKQo+ICAgICAgICAgaW9tbXVfb3BzID0gKmlvbW11X2luaXRfb3BzLT5vcHM7Cj4gICAg
IGVsc2UKPiAtLQo+IDIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
