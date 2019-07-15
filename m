Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3363D69B02
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 20:49:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn607-0000HF-7x; Mon, 15 Jul 2019 18:47:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v+uT=VM=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hn606-0000HA-2U
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 18:47:02 +0000
X-Inumbo-ID: ecd5f84a-a730-11e9-aaea-53553cf98e35
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.85]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecd5f84a-a730-11e9-aaea-53553cf98e35;
 Mon, 15 Jul 2019 18:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHYaO3/BJu+SMW9Qrs6/7msTsSW4wpjpwppHF1ZS5KKAgzbaKpuMfO27ECuJxXioSqlwSUFPbdCkcGcDacHMJxKt4O8kJInnuojbc4Ga+Q8ZfteKbRtNMqWaEITDhVRHS1hqwtKCECo9D5eEAAIeounQybM5xC4nKKyBlToIQ+32MxWQkC5kYCh4UVK19IsRZvlm/0RMVo9DyOAx+7fDdQCmbiKlbes9+GCbWeaQXUq3ZSQrzjcmcBgPDlU1ufNKX3/yEafExMrYYfoycbuBYvr0PzJg/Mm2TP8c8aqQ0c/juj8V5WwHcleQjczqbrqrJpFnwnwNO0ab5/llqHIsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/i6bqkAB26aYReFriZ1gVThPStd3ED9InutEigAjJ0=;
 b=bfgajlGMWOAoTzD4RiozncPXnuLH4mVGoI+YMYMBrI1VnUqcdg8sr+ORvbllBKWlKKWgQRp2mlro4PQ5T+8alQvmdgfaQq0/Bxeb4adyhg+bluFJcz42KlOxxhNvnPj3ZuLP3GPpQzLfDL59KKSCph9o3+ChJ865/DXI/o3RDMIjpRZMoDWqJN50l3xyDwd3A3gsbj5hf71apW7VIGNCZRCqmZkdnAflviX6X0KIKgR0+3gwgl9bcsqWBToLNr0Ni1D/qmjvhs2oEx4MLhgKE3XKV0QIywH46SJFYsfYbEgd1AaJDZkKdrkwDfAcT+KlRQPRE8P7KRzvc3nAiccXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/i6bqkAB26aYReFriZ1gVThPStd3ED9InutEigAjJ0=;
 b=Q4Rs4hJ98ZiZShrco+iX3yTKDISYMx9OsPu7d0vgditNxymkL0vDgioOiEC/Kneqnf7cUZF9OG/IV5Y3giXMkba8UAJcTRfVNu0scgLQHTAV/VWqYbp8fkL1dkOOAums/VCyYQ2x+L8aLG1fQew7TNPiPtecCuWWQHydQ+34P+N6ZmJ8/t5zFYoaDCF/Zv0TQ/yrr1ZkQGWo0Sw5ZMDHhFikkqMrS2E0AWBXOUBKY7EAcmaMn4UhomjoyyGuMtnPPEIGAjkD1o22Mq8g6uMPus8yg8dUVJ9hv0pzbK78frGVCl6qzTJZeNIi8rf3LAEdWzmSwYpBJL0IrETVP0G8rg==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3505.eurprd03.prod.outlook.com (52.134.80.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 18:46:57 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::3964:dfa4:cb6:5f74]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::3964:dfa4:cb6:5f74%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 18:46:57 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [Xen-devel] [PATCH 05/17] xen/arm64: head: Introduce print_reg
Thread-Index: AQHVH8NX5OjaNXd6d0iFM3XX9g6mI6bMO9MA
Date: Mon, 15 Jul 2019 18:46:57 +0000
Message-ID: <87v9w3rv8f.fsf@epam.com>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-6-julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-6-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41cacce8-7637-4ad5-150f-08d70954d075
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB3505; 
x-ms-traffictypediagnostic: AM0PR03MB3505:
x-microsoft-antispam-prvs: <AM0PR03MB3505FEF449C5FEDA2A790E2FE6CF0@AM0PR03MB3505.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(43544003)(199004)(189003)(64756008)(66946007)(66476007)(6436002)(8676002)(66446008)(68736007)(316002)(71200400001)(446003)(71190400001)(91956017)(76116006)(54906003)(2906002)(6486002)(81166006)(5660300002)(6512007)(8936002)(107886003)(6246003)(11346002)(7736002)(305945005)(66556008)(53936002)(86362001)(3846002)(6116002)(66066001)(186003)(36756003)(486006)(81156014)(6916009)(80792005)(256004)(4326008)(478600001)(229853002)(102836004)(14454004)(99286004)(2616005)(476003)(25786009)(76176011)(6506007)(55236004)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3505;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Lb7lHt/rqAHL6X3nPGd0sEq337WQPfElw6LefZ4HoLHvU6S2qd1hzfWhlRS5hmkWxQkcT4OhJXzgf8+VC7TZ+YQ82fN0X8L9FbjUpLnquBVfJpQm/N9Oe3jDOq4n0DMqB6IEIts8c4AE9uCrfk+44bjFmyzRXdhQGgk3K7RHAC8Mh20OFbzloYjhNVU/oHt6Xeuluky4M0TO6YBT7sOQ4HrjJf2pOHOopSCTYPxBCG2YwOvgUkNez0zeRYYPq7Y0k6p2j64PVs0pNVDfSXPsoYm5DjmLIWyuIMlnGmW9sOfGhn+D6Tj/F6dYDWwa0904h0Cjs8H2eEjb0esMYFAqFfc8S/AxQqi+XpclHC6YvCKDfWAwH633gqLtVncBSC/QmBnc0Qj7CdbJCq27E2nZwGxkF0o7boXFsOAMAZHNt24=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cacce8-7637-4ad5-150f-08d70954d075
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 18:46:57.3092 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3505
Subject: Re: [Xen-devel] [PATCH 05/17] xen/arm64: head: Introduce print_reg
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "andre.przywara@arm.com" <andre.przywara@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLAoKSnVsaWVuIEdyYWxsIHdyaXRlczoKCj4gQXQgdGhlIG1vbWVudCwgdGhlIHVz
ZXIgc2hvdWxkIHNhdmUgeDMwL2xyIGlmIGl0IGNhcmVzIGFib3V0IGl0Lgo+Cj4gRm9sbG93LXVw
IHBhdGNoZXMgd2lsbCBpbnRyb2R1Y2UgbW9yZSB1c2Ugb2YgcHV0biBpbiBwbGFjZSB3aGVyZSBs
cgo+IHNob3VsZCBiZSBwcmVzZXJ2ZWQuCj4KPiBGdXJ0aGVybW9yZSwgYW55IHVzZXIgb2YgcHV0
biBzaG91bGQgYWxzbyBtb3ZlIHRoZSB2YWx1ZSB0byByZWdpc3RlciB4MAo+IGlmIGl0IHdhcyBz
dG9yZWQgaW4gYSBkaWZmZXJlbnQgcmVnaXN0ZXIuCj4KPiBGb3IgY29udmVuaWVuY2UsIGEgbmV3
IG1hY3JvIGlzIGludHJvZHVjZWQgdG8gcHJpbnQgYSBnaXZlbiByZWdpc3Rlci4KPiBUaGUgbWFj
cm8gd2lsbCB0YWtlIGNhcmUgZm9yIHVzIHRvIG1vdmUgdGhlIHZhbHVlIHRvIHgwIGFuZCBhbHNv
Cj4gcHJlc2VydmUgbHIuCj4KPiBMYXN0bHkgdGhlIG5ldyBtYWNybyBpcyB1c2VkIHRvIHJlcGxh
Y2UgYWxsIHRoZSBjYWxsc2l0ZSBvZiBwdXRuLiBUaGlzCj4gd2lsbCBzaW1wbGlmeSByZXdvcmsv
cmV2aWV3IGxhdGVyIG9uLgo+Cj4gTm90ZSB0aGF0IEN1cnJlbnRFTCBpcyBub3cgc3RvcmVkIGlu
IHg1IGluc3RlYWQgb2YgeDQgYmVjYXVzZSB0aGUgbGF0dGVyCj4gd2lsbCBiZSBjbG9iYmVyZWQg
YnkgdGhlIG1hY3JvIHByaW50X3JlZy4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMg
fCAyOSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjIg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IGluZGV4IDg0ZTI2
NTgyYzQuLjkxNDJiNGE3NzQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQu
Uwo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBAQCAtOTAsOCArOTAsMjUgQEAK
PiAgICAgICAgICBibCAgICBwdXRzICAgIDsgICAgIFwKPiAgICAgICAgICBtb3YgICBsciwgeDMg
IDsgICAgIFwKPiAgICAgICAgICBST0RBVEFfU1RSKDk4LCBfcykKPiArCj4gKy8qCj4gKyAqIE1h
Y3JvIHRvIHByaW50IHRoZSB2YWx1ZSBvZiByZWdpc3RlciBceGIKPiArICoKPiArICogQ2xvYmJl
cnMgeDAgLSB4NAo+ICsgKi8KCkRlc3BpdGUgaXRzIG5hbWUsIHRoaXMgbWFjcm8gY2FuJ3QgcHJp
bnQgeDQuIEkgd291bGQgcmVjb21tZW5kIGFkZGluZyBhdApsZWFzdCBjb21tZW50IGFib3V0IHRo
aXMuIFN0YXRpYyBhc3NlcnRpb24gd291bGQgYmUgZXZlbiBiZXR0ZXIsIGJ1dApsb29rcyBsaWtl
IHdlIGRvbid0IGhhdmUgdGhlbSBmb3IgYXNtIGNvZGUuCgo+ICsubWFjcm8gcHJpbnRfcmVnIHhi
Cj4gKyAgICAgICAgbW92ICAgeDQsIGxyCj4gKyAgICAgICAgbW92ICAgeDAsIFx4Ygo+ICsgICAg
ICAgIGJsICAgIHB1dG4KPiArICAgICAgICBtb3YgICBsciwgeDQKPiArLmVuZG0KPiArCj4gICNl
bHNlIC8qIENPTkZJR19FQVJMWV9QUklOVEsgKi8KPiAgI2RlZmluZSBQUklOVChzKQo+ICsKPiAr
Lm1hY3JvIHByaW50X3JlZyB4Ygo+ICsuZW5kbQo+ICsKPiAgI2VuZGlmIC8qICFDT05GSUdfRUFS
TFlfUFJJTlRLICovCj4KPiAgLyogTG9hZCB0aGUgcGh5c2ljYWwgYWRkcmVzcyBvZiBhIHN5bWJv
bCBpbnRvIHhiICovCj4gQEAgLTMwNCwyMiArMzIxLDIwIEBAIEdMT0JBTChpbml0X3NlY29uZGFy
eSkKPiAgI2lmZGVmIENPTkZJR19FQVJMWV9QUklOVEsKPiAgICAgICAgICBsZHIgICB4MjMsID1F
QVJMWV9VQVJUX0JBU0VfQUREUkVTUyAvKiB4MjMgOj0gVUFSVCBiYXNlIGFkZHJlc3MgKi8KPiAg
ICAgICAgICBQUklOVCgiLSBDUFUgIikKPiAtICAgICAgICBtb3YgICB4MCwgeDI0Cj4gLSAgICAg
ICAgYmwgICAgcHV0bgo+ICsgICAgICAgIHByaW50X3JlZyB4MjQKPiAgICAgICAgICBQUklOVCgi
IGJvb3RpbmcgLVxyXG4iKQo+ICAjZW5kaWYKPgo+ICBjb21tb25fc3RhcnQ6Cj4KPiAgICAgICAg
ICBQUklOVCgiLSBDdXJyZW50IEVMICIpCj4gLSAgICAgICAgbXJzICAgeDQsIEN1cnJlbnRFTAo+
IC0gICAgICAgIG1vdiAgIHgwLCB4NAo+IC0gICAgICAgIGJsICAgIHB1dG4KPiArICAgICAgICBt
cnMgICB4NSwgQ3VycmVudEVMCj4gKyAgICAgICAgcHJpbnRfcmVnIHg1Cj4gICAgICAgICAgUFJJ
TlQoIiAtXHJcbiIpCj4KPiAgICAgICAgICAvKiBBcmUgd2UgaW4gRUwyICovCj4gLSAgICAgICAg
Y21wICAgeDQsICNQU1JfTU9ERV9FTDJ0Cj4gLSAgICAgICAgY2NtcCAgeDQsICNQU1JfTU9ERV9F
TDJoLCAjMHg0LCBuZQo+ICsgICAgICAgIGNtcCAgIHg1LCAjUFNSX01PREVfRUwydAo+ICsgICAg
ICAgIGNjbXAgIHg1LCAjUFNSX01PREVfRUwyaCwgIzB4NCwgbmUKPiAgICAgICAgICBiLmVxICBl
bDIgLyogWWVzICovCj4KPiAgICAgICAgICAvKiBPSywgd2UncmUgYm9uZWQuICovCgoKLS0KQmVz
dCByZWdhcmRzLCBWb2xvZHlteXIgQmFiY2h1awpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
