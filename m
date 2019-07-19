Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AC46EAA5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 20:29:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoXb6-0004w5-18; Fri, 19 Jul 2019 18:27:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AH7D=VQ=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hoXb4-0004vw-TC
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 18:27:10 +0000
X-Inumbo-ID: d0b83446-aa52-11e9-9b25-937bd1462ba2
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.69.86]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0b83446-aa52-11e9-9b25-937bd1462ba2;
 Fri, 19 Jul 2019 18:27:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kd/C/mCKt/df6XO9j5eB4toniz1gHaa46oqVbefWW9nvhLwFjdgYsr8elD6TxFi4jQ1stF3A8PnP+jw7UyJelVJrgXMlTd8FSZPGv2ZDW03EWGoEUS/KX7nDFf/+GkN9tLeioFBANYhY+LRXEIza9V+bvRtWPVlloIcPairL2XbE4Ymwp0RFheAaPcgG1GPD8pPUovutnSSj/8Kd6lfbp2TvW5fcp7iTSKn8HtvMp30tVdYE+Vtate+pLfzqrUIC5OedM8IIS0e2c6GFQZf3dCn/zIEn3d0M9+DE/DKNRp32GlAnMPShfzw/ApuxuFnjwYESSBapP51w5AS6NgTv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZR0CRGiS01IBZT4t4R5zQUeQd+Z4ioVkxk5CiavRrmQ=;
 b=oBmL0Yp8MpGrXwjziIBoAJzXZ+hFIXtBgFdBpwBniQWc0uTidgoKaJAUNFLFp9aX8YxjaAiZj4jMnLFKt2nTEbOybwIJnpQNeXFa8YXTUSIyDsn2yMTL8KmHC/OrUDubJ8LjCZ4Tqwh1wntKXJsUq0XXebdk9AIpGvhhl0mwaL/In2gbAL0ROf3m6NkZo4V98dcKKs3vojEVzP1D6fRLVTREYoqTjVbcsUO9vF9bgwKOWXSc3Z2Q7nQwxsJnHj1RIvv6iXA79Tyms/kATfDnGqId+m6vWvQwnQMe68SdUiogIjKtxi8R3rEhhGUPI9RfbitcW54DsjszbJGv6U+q5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZR0CRGiS01IBZT4t4R5zQUeQd+Z4ioVkxk5CiavRrmQ=;
 b=i7UjVSEBx+WU5A/wm0eyx/OpB3pipBZZaODKQNo+IYCEg1Ld0iEXF+oUJr+0bgkptr+TWOeiFxFBvbfdrsrNaRLlavW2mZPn6lsPApbNaiGmuYUEwFfz0wImd3G/Q3ms1UCRdWPkILGejQDxsszBLAglOvgA6iVvr576Dzzf9ng=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB2602.namprd12.prod.outlook.com (20.176.116.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 18:27:06 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc%7]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 18:27:06 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v3 06/14] AMD/IOMMU: pass IOMMU to
 amd_iommu_alloc_intremap_table()
Thread-Index: AQHVO/Ub6nM/uQWgm0mN0o5ojpwgx6bSRzYA
Date: Fri, 19 Jul 2019 18:27:06 +0000
Message-ID: <20190719182703.GE4496@amd.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <56c60443-083e-7e86-636c-4095a399f048@suse.com>
In-Reply-To: <56c60443-083e-7e86-636c-4095a399f048@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR1501CA0004.namprd15.prod.outlook.com
 (2603:10b6:805::17) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ef0c556-006a-4043-4466-08d70c76b43f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2602; 
x-ms-traffictypediagnostic: DM6PR12MB2602:
x-microsoft-antispam-prvs: <DM6PR12MB26028D76E1499DEA42FD1FF1E5CB0@DM6PR12MB2602.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(189003)(199004)(68736007)(54906003)(2616005)(478600001)(486006)(11346002)(14454004)(6506007)(446003)(386003)(476003)(256004)(52116002)(99286004)(1076003)(25786009)(76176011)(102836004)(4326008)(6246003)(36756003)(316002)(71200400001)(71190400001)(14444005)(26005)(6436002)(305945005)(81166006)(6916009)(229853002)(8676002)(66476007)(66556008)(8936002)(64756008)(66446008)(66946007)(86362001)(53936002)(6116002)(186003)(7736002)(3846002)(6486002)(6512007)(2906002)(81156014)(66066001)(33656002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2602;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oxyaRKegZSqmAD4cT1jxo0zADHpy7PQ5RMRq/JGAeUUZiJTtq/sEnWraAPRuswW1lT6DP2XfDk287kRje7O/nGvaeC2rm5d1cE+tEkWaL3t6wd7tzwMP9kA233LVD+AJi2ADKitb9pC0hvOKUkBtYbEZlzCJdU8FG7BCG+MvEZC6NlPmfFIsVl6J3j2SfG657RkbwXpQvC/w6hO/8kdCksFX8zAWI25b3TUaPYQzBHIE12WwMo+qfL7cs//RahwD0U57o4723MGlHtMlVYiERY7hvDzystSEmtGfIp8EsCXq5RRZpxuSgJtLNOrSjtO83/lRje73w6rrjRXZEA/zkfAhcR2g2y6ypfS9HwVWgBGZMyM+kcGeCkYXWv0prexf4PnzHseXnwYTOsZjUsxFgTtFefG2QLoD+MJAeUGo0IM=
Content-ID: <B5B83DA38EFF30478744A1A5A03CE0C5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef0c556-006a-4043-4466-08d70c76b43f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 18:27:06.7283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2602
Subject: Re: [Xen-devel] [PATCH v3 06/14] AMD/IOMMU: pass IOMMU to
 amd_iommu_alloc_intremap_table()
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

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDQ6Mzc6MjZQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIGZ1bmN0aW9uIHdpbGwgd2FudCB0byBrbm93IElPTU1VIHByb3BlcnRpZXMgKHNw
ZWNpZmljYWxseSB0aGUgSVJURQo+IHNpemUpIHN1YnNlcXVlbnRseS4KPiAKPiBDb3JyZWN0IGlu
ZGVudGF0aW9uIG9mIG9uZSBvZiB0aGUgY2FsbCBzaXRlcyBhdCB0aGlzIG9jY2FzaW9uLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5
OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KCj4gLS0tCj4gdjM6IE5ldy4KPiAK
PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfYWNwaS5jCj4gKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2FjcGkuYwo+IEBAIC03NCwxMiArNzQs
MTQgQEAgc3RhdGljIHZvaWQgX19pbml0IGFkZF9pdnJzX21hcHBpbmdfZW50cgo+ICAgICAgICAg
ICAgLyogYWxsb2NhdGUgcGVyLWRldmljZSBpbnRlcnJ1cHQgcmVtYXBwaW5nIHRhYmxlICovCj4g
ICAgICAgICAgICBpZiAoIGFtZF9pb21tdV9wZXJkZXZfaW50cmVtYXAgKQo+ICAgICAgICAgICAg
ICAgIGl2cnNfbWFwcGluZ3NbYWxpYXNfaWRdLmludHJlbWFwX3RhYmxlID0KPiAtICAgICAgICAg
ICAgICAgIGFtZF9pb21tdV9hbGxvY19pbnRyZW1hcF90YWJsZSgKPiAtICAgICAgICAgICAgICAg
ICAgICAmaXZyc19tYXBwaW5nc1thbGlhc19pZF0uaW50cmVtYXBfaW51c2UpOwo+ICsgICAgICAg
ICAgICAgICAgIGFtZF9pb21tdV9hbGxvY19pbnRyZW1hcF90YWJsZSgKPiArICAgICAgICAgICAg
ICAgICAgICAgaW9tbXUsCj4gKyAgICAgICAgICAgICAgICAgICAgICZpdnJzX21hcHBpbmdzW2Fs
aWFzX2lkXS5pbnRyZW1hcF9pbnVzZSk7Cj4gICAgICAgICAgICBlbHNlCj4gICAgICAgICAgICB7
Cj4gICAgICAgICAgICAgICAgaWYgKCBzaGFyZWRfaW50cmVtYXBfdGFibGUgPT0gTlVMTCAgKQo+
ICAgICAgICAgICAgICAgICAgICBzaGFyZWRfaW50cmVtYXBfdGFibGUgPSBhbWRfaW9tbXVfYWxs
b2NfaW50cmVtYXBfdGFibGUoCj4gKyAgICAgICAgICAgICAgICAgICAgIGlvbW11LAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgJnNoYXJlZF9pbnRyZW1hcF9pbnVzZSk7Cj4gICAgICAgICAgICAg
ICAgaXZyc19tYXBwaW5nc1thbGlhc19pZF0uaW50cmVtYXBfdGFibGUgPSBzaGFyZWRfaW50cmVt
YXBfdGFibGU7Cj4gICAgICAgICAgICAgICAgaXZyc19tYXBwaW5nc1thbGlhc19pZF0uaW50cmVt
YXBfaW51c2UgPSBzaGFyZWRfaW50cmVtYXBfaW51c2U7Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FtZC9pb21tdV9pbnRyLmMKPiBAQCAtNjMyLDcgKzYzMiw4IEBAIGludCBfX2luaXQgYW1kX2lv
bW11X2ZyZWVfaW50cmVtYXBfdGFibGUKPiAgICAgICByZXR1cm4gMDsKPiAgIH0KPiAgIAo+IC12
b2lkKiBfX2luaXQgYW1kX2lvbW11X2FsbG9jX2ludHJlbWFwX3RhYmxlKHVuc2lnbmVkIGxvbmcg
KippbnVzZV9tYXApCj4gK3ZvaWQgKl9faW5pdCBhbWRfaW9tbXVfYWxsb2NfaW50cmVtYXBfdGFi
bGUoCj4gKyAgICBjb25zdCBzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwgdW5zaWduZWQgbG9uZyAq
KmludXNlX21hcCkKPiAgIHsKPiAgICAgICB2b2lkICp0YjsKPiAgICAgICB0YiA9IF9fYWxsb2Nf
YW1kX2lvbW11X3RhYmxlcyhJTlRSRU1BUF9UQUJMRV9PUkRFUik7Cj4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vc3ZtL2FtZC1pb21tdS1wcm90by5oCj4gKysrIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vc3ZtL2FtZC1pb21tdS1wcm90by5oCj4gQEAgLTk3LDcgKzk3LDggQEAgc3Ry
dWN0IGFtZF9pb21tdSAqZmluZF9pb21tdV9mb3JfZGV2aWNlKAo+ICAgCj4gICAvKiBpbnRlcnJ1
cHQgcmVtYXBwaW5nICovCj4gICBpbnQgYW1kX2lvbW11X3NldHVwX2lvYXBpY19yZW1hcHBpbmco
dm9pZCk7Cj4gLXZvaWQgKmFtZF9pb21tdV9hbGxvY19pbnRyZW1hcF90YWJsZSh1bnNpZ25lZCBs
b25nICoqKTsKPiArdm9pZCAqYW1kX2lvbW11X2FsbG9jX2ludHJlbWFwX3RhYmxlKAo+ICsgICAg
Y29uc3Qgc3RydWN0IGFtZF9pb21tdSAqLCB1bnNpZ25lZCBsb25nICoqKTsKPiAgIGludCBhbWRf
aW9tbXVfZnJlZV9pbnRyZW1hcF90YWJsZSgKPiAgICAgICBjb25zdCBzdHJ1Y3QgYW1kX2lvbW11
ICosIHN0cnVjdCBpdnJzX21hcHBpbmdzICopOwo+ICAgdm9pZCBhbWRfaW9tbXVfaW9hcGljX3Vw
ZGF0ZV9pcmUoCj4gCgotLSAKQnJpYW4gV29vZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
