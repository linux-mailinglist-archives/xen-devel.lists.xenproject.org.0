Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281B873B00
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 21:56:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqNKe-0000ja-Fo; Wed, 24 Jul 2019 19:53:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z+U7=VV=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hqNKd-0000jV-F8
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 19:53:47 +0000
X-Inumbo-ID: bef5f146-ae4c-11e9-8980-bc764e045a96
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe4a::626])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bef5f146-ae4c-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 19:53:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ky30FN4vQIv8BxYGVsWNtICllqEnF6M1yAevBk5SHh+SeFNvfy+zASNGyBD3dMzrXmqFlt/fUTaL6/1zD9myHt/w+ZMKTQYw9Cy6nhDBV4W5un0LT+lIo6rf0t8+otA1by1PBlqdUA07u18L2NR86SDvy9x1ynsK+83lxSR7N0ddyZhpE6/leGQ3eBv8X/S0fknDTqehmKAxlOgRfiIgez2GBXlwXlUjQjLab4ibcfVloWWe5JAEJFKia06UZ2Lg6i4rahQZESiT1/sQrDYxtG8gh9y/zvkriN7oAXYts/LSTLKxXNbRMrhmEg0Ttfal9N3u96v+sE1BI1M0v4M6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYx+vI/vfTGqaSbnd3roZBc4b4KBFIoBkrQTKE8qYDo=;
 b=NcCCwZM6t42uf1lz3jiAVTsIHV8UY3pr4Slq/nbHyb6iuUqw7iVU6/v1HQJ2YfvNcG1aXGhF2CNrp8tB8sVaas+05m7563W596RmDq1kArwz8NNMyXLm2VwMLS9N1PukL0czzILkfvOVR9g+Wq7yvN+z4cDUp6bQP8K0cB8LyYccL/IYujkrslPJuKfzyq9mR8/u2IeiuhK6fMpOa0jnJ9OnxvpcORYjpGnfkFSJZ4/JuM41524862rT73UDPobSBLdl1/0F5ll9onnzt0iMi+42UyP/0jJ+OEtoI74azfJ0Xxhukb5nGSVn25aJ+QxL9G5DAJOk+KoUbI5Oe62LOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYx+vI/vfTGqaSbnd3roZBc4b4KBFIoBkrQTKE8qYDo=;
 b=zqcKmyxuNF2+fRJnMfhP0gecVVCLWNfOWSppx9dxYKP+timCHHmc2R7wVgMeSUn+DCjiUDZgk2l87fTZvnCCRd15kZH6iZIZETJAK7SySWvZNPjlAMbuFGYPlRwQHmiaps2SraNUgsCQiZ7sUd/7jOU7+wvtgnaOE/NiNW/S7go=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB2938.namprd12.prod.outlook.com (20.179.104.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 19:53:44 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc%7]) with mapi id 15.20.2115.005; Wed, 24 Jul 2019
 19:53:44 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v4 06/13] x86/IOMMU: don't restrict IRQ affinities to
 online CPUs
Thread-Index: AQHVO6rZo/SR3Zk3NE+9LO3KXZNABKbaO6aA
Date: Wed, 24 Jul 2019 19:53:44 +0000
Message-ID: <20190724195341.GC25253@amd.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
 <923083ba-66f9-a88b-8909-a2f5e2808a69@suse.com>
In-Reply-To: <923083ba-66f9-a88b-8909-a2f5e2808a69@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0501CA0130.namprd05.prod.outlook.com
 (2603:10b6:803:42::47) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0431f19b-10a8-4e40-860e-08d71070a25f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2938; 
x-ms-traffictypediagnostic: DM6PR12MB2938:
x-microsoft-antispam-prvs: <DM6PR12MB2938E7A4A21BBEACE451718FE5C60@DM6PR12MB2938.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(199004)(189003)(8936002)(14444005)(66066001)(256004)(11346002)(102836004)(446003)(2616005)(476003)(6506007)(66556008)(186003)(66446008)(64756008)(25786009)(66476007)(66946007)(386003)(36756003)(52116002)(26005)(71190400001)(71200400001)(5660300002)(86362001)(229853002)(2906002)(4326008)(486006)(68736007)(76176011)(81156014)(81166006)(6486002)(305945005)(6512007)(6436002)(53936002)(3846002)(316002)(6116002)(99286004)(14454004)(8676002)(1076003)(6916009)(478600001)(33656002)(54906003)(6246003)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2938;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n2b1s6o1gLVUDxWS3Dpb7MzZ/NgBaSrbO3ccgg3owRP6QCFeKSKRiohW2bT/YqxRo1a3NFQSxt1lBQYoCv69ZQOkYHYFsyo2f9Oh/reXuosEjD8KwWe1xiE9yuEg8cG+jigPReZLeAEKvlnF+qtjePHUhJUWcvv9Bmo2EE8yK0moVwL9k9cDgS11wa5aNRX6BmaW7G6MxXnNE3f0I/gS2F8D+VEazOILbZFY3/f0AuiZwIpWwYmSB1s2mSTasB0k2hV2brjkHvxBKfCYtDmYhTEsbPpCySbETOPAx7XorBaTZp7Wt8Ahq7wuDZgursP6AB81OqqFapTrF5Qch32Tx/07eqIudeQzQno0a+8v+U/Wn1xgz55QsXn1IA+eEJAncrkoC+rTycpiyfjlpV3jxFIajpvmfZLwQjiRgLB8r0s=
Content-ID: <49172F02DE4E70498C7DFC340D13469C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0431f19b-10a8-4e40-860e-08d71070a25f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 19:53:44.5273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2938
Subject: Re: [Xen-devel] [PATCH v4 06/13] x86/IOMMU: don't restrict IRQ
 affinities to online CPUs
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woods,
 Brian" <Brian.Woods@amd.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDc6NDA6NTdBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSW4gbGluZSB3aXRoICJ4ODYvSVJROiBkZXNjLT5hZmZpbml0eSBzaG91bGQgc3RyaWN0
bHkgcmVwcmVzZW50IHRoZQo+IHJlcXVlc3RlZCB2YWx1ZSIgdGhlIGludGVybmFsbHkgdXNlZCBJ
UlEocykgYWxzbyBzaG91bGRuJ3QgYmUgcmVzdHJpY3RlZAo+IHRvIG9ubGluZSBvbmVzLiBNYWtl
IHNldF9kZXNjX2FmZmluaXR5KCkgKHNldF9tc2lfYWZmaW5pdHkoKSB0aGVuIGRvZXMKPiBieSBp
bXBsaWNhdGlvbikgY29wZSB3aXRoIGEgTlVMTCBtYXNrIGJlaW5nIHBhc3NlZCAoanVzdCBsaWtl
Cj4gYXNzaWduX2lycV92ZWN0b3IoKSBkb2VzKSwgYW5kIGhhdmUgSU9NTVUgY29kZSBwYXNzIE5V
TEwgaW5zdGVhZCBvZgo+ICZjcHVfb25saW5lX21hcCAod2hlbiwgZm9yIFZULWQsIHRoZXJlJ3Mg
bm8gTlVNQSBub2RlIGluZm9ybWF0aW9uCj4gYXZhaWxhYmxlKS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogQnJpYW4gV29vZHMg
PGJyaWFuLndvb2RzQGFtZC5jb20+Cgo+IC0tLQo+IHY0OiBOZXcuCj4gCj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2lycS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2lycS5jCj4gQEAgLTc5NiwxOCArNzk2
LDI2IEBAIHVuc2lnbmVkIGludCBzZXRfZGVzY19hZmZpbml0eShzdHJ1Y3QgaXIKPiAgICAgICB1
bnNpZ25lZCBsb25nIGZsYWdzOwo+ICAgICAgIGNwdW1hc2tfdCBkZXN0X21hc2s7Cj4gICAKPiAt
ICAgIGlmICghY3B1bWFza19pbnRlcnNlY3RzKG1hc2ssICZjcHVfb25saW5lX21hcCkpCj4gKyAg
ICBpZiAoIG1hc2sgJiYgIWNwdW1hc2tfaW50ZXJzZWN0cyhtYXNrLCAmY3B1X29ubGluZV9tYXAp
ICkKPiAgICAgICAgICAgcmV0dXJuIEJBRF9BUElDSUQ7Cj4gICAKPiAgICAgICBzcGluX2xvY2tf
aXJxc2F2ZSgmdmVjdG9yX2xvY2ssIGZsYWdzKTsKPiAtICAgIHJldCA9IF9hc3NpZ25faXJxX3Zl
Y3RvcihkZXNjLCBtYXNrKTsKPiArICAgIHJldCA9IF9hc3NpZ25faXJxX3ZlY3RvcihkZXNjLCBt
YXNrID86IFRBUkdFVF9DUFVTKTsKPiAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ2ZWN0
b3JfbG9jaywgZmxhZ3MpOwo+ICAgCj4gLSAgICBpZiAocmV0IDwgMCkKPiArICAgIGlmICggcmV0
IDwgMCApCj4gICAgICAgICAgIHJldHVybiBCQURfQVBJQ0lEOwo+ICAgCj4gLSAgICBjcHVtYXNr
X2NvcHkoZGVzYy0+YWZmaW5pdHksIG1hc2spOwo+IC0gICAgY3B1bWFza19hbmQoJmRlc3RfbWFz
aywgbWFzaywgZGVzYy0+YXJjaC5jcHVfbWFzayk7Cj4gKyAgICBpZiAoIG1hc2sgKQo+ICsgICAg
ewo+ICsgICAgICAgIGNwdW1hc2tfY29weShkZXNjLT5hZmZpbml0eSwgbWFzayk7Cj4gKyAgICAg
ICAgY3B1bWFza19hbmQoJmRlc3RfbWFzaywgbWFzaywgZGVzYy0+YXJjaC5jcHVfbWFzayk7Cj4g
KyAgICB9Cj4gKyAgICBlbHNlCj4gKyAgICB7Cj4gKyAgICAgICAgY3B1bWFza19zZXRhbGwoZGVz
Yy0+YWZmaW5pdHkpOwo+ICsgICAgICAgIGNwdW1hc2tfY29weSgmZGVzdF9tYXNrLCBkZXNjLT5h
cmNoLmNwdV9tYXNrKTsKPiArICAgIH0KPiAgICAgICBjcHVtYXNrX2FuZCgmZGVzdF9tYXNrLCAm
ZGVzdF9tYXNrLCAmY3B1X29ubGluZV9tYXApOwo+ICAgCj4gICAgICAgcmV0dXJuIGNwdV9tYXNr
X3RvX2FwaWNpZCgmZGVzdF9tYXNrKTsKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
bWQvaW9tbXVfaW5pdC5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11
X2luaXQuYwo+IEBAIC04ODgsNyArODg4LDcgQEAgc3RhdGljIHZvaWQgZW5hYmxlX2lvbW11KHN0
cnVjdCBhbWRfaW9tbQo+ICAgCj4gICAgICAgZGVzYyA9IGlycV90b19kZXNjKGlvbW11LT5tc2ku
aXJxKTsKPiAgICAgICBzcGluX2xvY2soJmRlc2MtPmxvY2spOwo+IC0gICAgc2V0X21zaV9hZmZp
bml0eShkZXNjLCAmY3B1X29ubGluZV9tYXApOwo+ICsgICAgc2V0X21zaV9hZmZpbml0eShkZXNj
LCBOVUxMKTsKPiAgICAgICBzcGluX3VubG9jaygmZGVzYy0+bG9jayk7Cj4gICAKPiAgICAgICBh
bWRfaW9tbXVfbXNpX2VuYWJsZShpb21tdSwgSU9NTVVfQ09OVFJPTF9FTkFCTEVEKTsKPiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+ICsrKyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gQEAgLTIxMzMsMTEgKzIxMzMsMTEgQEAgc3RhdGlj
IHZvaWQgYWRqdXN0X2lycV9hZmZpbml0eShzdHJ1Y3QgYQo+ICAgICAgIGNvbnN0IHN0cnVjdCBh
Y3BpX3Joc2FfdW5pdCAqcmhzYSA9IGRyaGRfdG9fcmhzYShkcmhkKTsKPiAgICAgICB1bnNpZ25l
ZCBpbnQgbm9kZSA9IHJoc2EgPyBweG1fdG9fbm9kZShyaHNhLT5wcm94aW1pdHlfZG9tYWluKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IE5VTUFfTk9fTk9ERTsKPiAtICAgIGNv
bnN0IGNwdW1hc2tfdCAqY3B1bWFzayA9ICZjcHVfb25saW5lX21hcDsKPiArICAgIGNvbnN0IGNw
dW1hc2tfdCAqY3B1bWFzayA9IE5VTEw7Cj4gICAgICAgc3RydWN0IGlycV9kZXNjICpkZXNjOwo+
ICAgCj4gICAgICAgaWYgKCBub2RlIDwgTUFYX05VTU5PREVTICYmIG5vZGVfb25saW5lKG5vZGUp
ICYmCj4gLSAgICAgICAgIGNwdW1hc2tfaW50ZXJzZWN0cygmbm9kZV90b19jcHVtYXNrKG5vZGUp
LCBjcHVtYXNrKSApCj4gKyAgICAgICAgIGNwdW1hc2tfaW50ZXJzZWN0cygmbm9kZV90b19jcHVt
YXNrKG5vZGUpLCAmY3B1X29ubGluZV9tYXApICkKPiAgICAgICAgICAgY3B1bWFzayA9ICZub2Rl
X3RvX2NwdW1hc2sobm9kZSk7Cj4gICAKPiAgICAgICBkZXNjID0gaXJxX3RvX2Rlc2MoZHJoZC0+
aW9tbXUtPm1zaS5pcnEpOwoKLS0gCkJyaWFuIFdvb2RzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
