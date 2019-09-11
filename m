Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010AFB044C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 20:55:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i87jz-0005iM-PU; Wed, 11 Sep 2019 18:53:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b1gu=XG=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i87jx-0005iG-Ix
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 18:53:17 +0000
X-Inumbo-ID: 69826362-d4c5-11e9-978d-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::611])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69826362-d4c5-11e9-978d-bc764e2007e4;
 Wed, 11 Sep 2019 18:53:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iap8kwEdeGmpAZqaBOLq98eqb3T8vjF8AonYczrTve0Aqin/GebXJ/RmBzrTJZ6AF+OevcxxRk0CHMolVaSJmKA8Rwyw9F4vIJyOymBGND1HmlHcLb4ZIBfJChaoV1NcUyrlOF2srrgd8ZHgQzSXtlBSrSHXZyhns+o7ErTvzu7WcQYg4KJW3/gOikBYZo/OGycSCtsw46X5F7zLNg/W1kxeBcgXu09Na9mgdLFx+Ctm3mPXjX1wTR1FqhknoCOxxfir6glb+55XE2VWHr+VQ1wq30hrFf1/EiXVaF4srcZHin1QN6KquttyLe6CoROiSDhmr/OdoEIIujpVMpSgEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0MS1Iw51oHBM4Y386QriJQ+wkx2DiLVqzdjXi9Oln0=;
 b=lGtEN9+giH7Tx/ubPJ24vXo/IL3yc72IXoXglq2dkGo9ncueW9WxmjQIbd7WYCK6E3Ai1mIKDLJotptl2QzWDvvEtkRD81R8K3WpmJ9ocR39jLfyumSw37JkEeuMu7qsbaEQFgtSBrdacG7/0ZrYCTGLo8FJSS6foeKBsxMNALrqL5WjnkE3naU0mzIRuP5KCjCIuo1QwCOHoHsXWh3d0+qK0bQwa2H00Yto8Ac3Oa1pylgwl3binaKBvofKABGf1NmPMov5a/dDPvrzDG/fYROXRtI5Ptymg2TlH7/8D0XVekD5fDeb8Uj8fblu1P413T+NaYJ+h1L43JQFGVux5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0MS1Iw51oHBM4Y386QriJQ+wkx2DiLVqzdjXi9Oln0=;
 b=fnDuZbs8H/ateYTvTlZ/gXnlDeOhrq+p7UhRRUNmKiZSEWkLfOxVGRY464y7UMuaIyuyeu/hJ0ori73Wvbz60gD/5RzO/5MckqTg6xVP6qFLOBYG7rGtRhogQExL4yoqUly72F0lmS+Vrw5r7MxpGGes81QD5RrWv9HDd4xOoIg=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4962.eurprd03.prod.outlook.com (20.178.23.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Wed, 11 Sep 2019 18:53:14 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Wed, 11 Sep 2019
 18:53:14 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 2/5] xen/arm: optee: check for preemption while freeing
 shared buffers
Thread-Index: AQHVWeNlIytwW28PUEKII1lAK5bjtackBZ8AgALq7YA=
Date: Wed, 11 Sep 2019 18:53:14 +0000
Message-ID: <87impyfyw6.fsf@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-3-volodymyr_babchuk@epam.com>
 <d72ca72d-81b7-f74d-86fd-24cc54bb4102@arm.com>
In-Reply-To: <d72ca72d-81b7-f74d-86fd-24cc54bb4102@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e426db9-6c69-492a-ddba-08d736e94cfc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4962; 
x-ms-traffictypediagnostic: AM0PR03MB4962:|AM0PR03MB4962:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB496233C28C213F5DAAA52589E6B10@AM0PR03MB4962.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(189003)(199004)(86362001)(81166006)(5660300002)(229853002)(66066001)(8676002)(14444005)(66446008)(66476007)(64756008)(80792005)(25786009)(186003)(99286004)(81156014)(11346002)(66946007)(486006)(6246003)(446003)(8936002)(4326008)(476003)(71190400001)(71200400001)(91956017)(76116006)(36756003)(66556008)(2616005)(6486002)(102836004)(2906002)(76176011)(256004)(53936002)(6116002)(3846002)(478600001)(14454004)(305945005)(6506007)(6436002)(55236004)(53546011)(54906003)(316002)(6512007)(7736002)(6916009)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4962;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iRUo7Putsc4CqJ4/8QHp5ZY+LC89LBHuOiLq7GUGEH6lvbEcBas2CE0HKfJuOkwG9yW8vCFuyh5GF4IzHTRbPTtiuWGjFJz4jDF8y+NXuw0X/URQsM5iYk3OoyyZeB254OW14WandU3qa1OzKORT7IwLnDHpswhkYBCOmm3iYsR3AEtWkSksvcET+UhXm6flhHDW2f+jQWcWcoj23R/3HcQ38BzYPIIVoZv2x/2LC1GBROZxNwIiAB+CsgQGO4mRr5NzS77rVWue4JlhZIkWX0MRQCcC1GD4+dhfA7TY2+RteEdaEslMV215f8iUaVGZviI18Nlqd5/0vEDHWOBHtRO+KMjrpPFhUmFlo722FI+UOB7zDC4LCbAv7tjd6cH7mRVw1/EFWaTr3223hHpnUuBlYJx6NRR8XMe2MNEZp3Y=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e426db9-6c69-492a-ddba-08d736e94cfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 18:53:14.2435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qfJPKI2JbSWvCrIiQyRBGHCyocBPCUSbf3+IL5sUPBnCmiNJNI/gJUK9SsO8On3prWW3kmxdSFDlM8x8akLXgifyxFK47mx2B3b//SO+bG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4962
Subject: Re: [Xen-devel] [PATCH 2/5] xen/arm: optee: check for preemption
 while freeing shared buffers
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpIFZvbG9keW15ciwKPgo+IE9uIDgvMjMvMTkgNzo0
OCBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+IE5vdyB3ZSBoYXZlIGxpbWl0IGZvciBv
bmUgc2hhcmVkIGJ1ZmZlciBzaXplLCBzbyB3ZSBjYW4gYmUgc3VyZSB0aGF0Cj4+IG9uZSBjYWxs
IHRvIGZyZWVfb3B0ZWVfc2htX2J1ZigpIHdpbGwgbm90IGZyZWUgYWxsCj4+IE1BWF9UT1RBTF9T
TUhfQlVGX1BHIHBhZ2VzIGF0IG9uY2UuIFRodXMsIHdlIG5vdyBjYW4gY2hlY2sgZm9yCj4+IGh5
cGVyY2FsbF9wcmVlbXB0X2NoZWNrKCkgaW4gdGhlIGxvb3AgaW5zaWRlCj4+IG9wdGVlX3JlbGlu
cXVpc2hfcmVzb3VyY2VzKCkgYW5kIHRoaXMgd2lsbCBlbnN1cmUgdGhhdCB3ZSBhcmUgbm90Cj4+
IG1pc3NpbmcgcHJlZW1wdGlvbi4KPgo+IEkgYW0gbm90IHN1cmUgdG8gdW5kZXJzdGFuZCB0aGUg
Y29ycmVsYXRpb24gYmV0d2VlbiB0aGUgdHdvCj4gc2VudGVuY2VzLiBFdmVuIGlmIHByZXZpb3Vz
bHkgdGhlIGd1ZXN0IGNvdWxkIHBpbiB1cCB0bwo+IE1BWF9UT1RBTF9TSE1fQlVGX1BHIGluIG9u
ZSBjYWxsLCBhIHdlbGwtYmVoYXZlZCBndWVzdCB3b3VsZCByZXN1bHQgdG8KPiBkbyBtdWx0aXBs
ZSBjYWxscyBhbmQgdGhlcmVmb3JlIHByZWVtcHRpb24gd291bGQgaGF2ZSBiZWVuIHVzZWZ1bC4K
TG9va3MgbGlrZSBub3cgSSBkb24ndCB1bmRlcnN0YW5kIHlvdS4KCkknbSB0YWxraW5nIGFib3V0
IHNoYXJlZCBidWZmZXJzLiBXZSBoYXZlIGxpbWl0ZWQgc2hhcmVkIGJ1ZmZlciB0byBzb21lCnJl
YXNvbmFibGUgc2l6ZS4gVGhlcmUgaXMgYmFkLSBvciB3ZWxsLWJlaGF2aW5nIGd1ZXN0cyBpbiB0
aGlzIGNvbnRleHQsCmJlY2F1c2UgZ3Vlc3QgY2FuJ3Qgc2hhcmUgb25lIGJpZyBidWZmZXIgaW4g
bXVsdGlwbGUgY2FsbHMuIEluIG90aGVyCndvcmxkcywgaWYgZ3Vlc3QgKm5lZWRzKiB0byBzaGFy
ZSA1MTJNQiBidWZmZXIgd2l0aCBPUC1URUUsIGl0IHdpbGwgYmUKZm9yY2VkIHRvIGRvIHRoaXMg
aW4gb25lIGNhbGwuIEJ1dCB3ZSBhcmUgZm9yYmlkZGluZyBiaWcgYnVmZmVycyByaWdodApub3cu
CgpvcHRlZV9yZWxpbnF1aXNoX3Jlc291cmNlcygpIGlzIGNhbGxlZCBkdXJpbmcgZG9tYWluIGRl
c3RydWN0aW9uLiBBdAp0aGlzIHRpbWUgd2UgY2FuIGhhdmUgYSBudW1iZXIgb2Ygc3RpbGwgbGl2
aW5nIHNoYXJlZCBidWZmZXJzLCBlYWNoIG9mCm9uZSBpcyBubyBiaWdnZXIgdGhhbiA1MTIgcGFn
ZXMuIFRoYW5rcyB0byB0aGlzLCB3ZSBjYW4gY2FsbApoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygp
IG9ubHkgaW4gb3B0ZWVfcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSwgYnV0IG5vdAppbiBmcmVlX29w
dGVlX3NobV9idWYoKS4KCklmIHdlIHdpbGwgYWxsb3cgZ3Vlc3QgdG8gcmVnaXN0ZXIgYmlnZ2Vy
IGJ1ZmZlciwgdGhhbiB3ZSB3aWxsIGJlIGZvcmNlZAp0byBjaGVjayBmb3IgcHJlZW1wdGlvbiBp
biBmcmVlX29wdGVlX3NobV9idWYoKSBhcyB3ZWxsLgoKVGhpcyBpcyB3aGF0IEkgbWVhbnQgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlLgoKPiBTbyBJIHRoaW5rIHRoZSBjb21taXQgbWVzc2FnZSBuZWVk
cyBzb21lIHJld29yZGluZy4KUHJvYmFibHkgeWVzLi4uCgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBW
b2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Cj4+IC0tLQo+PiAg
IHhlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYyB8IDEwICsrKysrLS0tLS0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jIGIveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jCj4+IGlu
ZGV4IGY0ZmE4YTc3NTguLmE4NGZmYTMwODkgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS90
ZWUvb3B0ZWUuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMKPj4gQEAgLTYzNCwx
NCArNjM0LDE0IEBAIHN0YXRpYyBpbnQgb3B0ZWVfcmVsaW5xdWlzaF9yZXNvdXJjZXMoc3RydWN0
IGRvbWFpbiAqZCkKPj4gICAgICAgaWYgKCBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpICkKPj4g
ICAgICAgICAgIHJldHVybiAtRVJFU1RBUlQ7Cj4+ICAgLSAgICAvKgo+PiAtICAgICAqIFRPRE86
IEd1ZXN0IGNhbiBwaW4gdXAgdG8gTUFYX1RPVEFMX1NNSF9CVUZfUEcgcGFnZXMgYW5kIGFsbCBv
Zgo+PiAtICAgICAqIHRoZW0gd2lsbCBiZSBwdXQgaW4gdGhpcyBsb29wLiBJdCBpcyB3b3J0aCBj
b25zaWRlcmluZyB0bwo+PiAtICAgICAqIGNoZWNrIGZvciBwcmVlbXB0aW9uIGluc2lkZSB0aGUg
bG9vcC4KPj4gLSAgICAgKi8KPj4gICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKCBvcHRl
ZV9zaG1fYnVmLCBvcHRlZV9zaG1fYnVmX3RtcCwKPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmY3R4LT5vcHRlZV9zaG1fYnVmX2xpc3QsIGxpc3QgKQo+PiArICAgIHsKPj4gKyAg
ICAgICAgaWYgKCBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpICkKPgo+IFNvIG9uIHRoZSBmaXJz
dCBpdGVyYXRpb24sIHlvdSB3aWxsIGNoZWNrIHR3aWNlIHByZWVtcHRpb24gKG9uZSBiZWZvcmUK
PiB0aGUgbG9vcCBhbmQganVzdCBlbnRlcmluZykuIGh5cGVyY2FsbF9wcmVlbXB0X2NoZWNrKCku
IFRoZSBmdW5jdGlvbgo+IGlzIG5vdCBlbnRpcmVseSBmcmVlIG9uIEFybSBiZWNhdXNlIG9mIHRo
ZSBpbXBsZW1lbnRhdGlvbiBvZgo+IHZnaWNfdmNwdV9wZW5kaW5nX2lycSgpLiBTbyBwcmV2ZW50
aW5nIHBvaW50bGVzcyBjYWxsIHdvdWxkIGJlIG5pY2UuCj4KPiBJbiB0aGlzIGNhc2UsIHRoZSBo
eXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpIGJlZm9yZSB0aGUgbG9vcCBjb3VsZCBiZQo+IGRyb3Bw
ZWQuClllcywgeW91IGFyZSByaWdodC4KCj4KPj4gKyAgICAgICAgICAgIHJldHVybiAtRVJFU1RB
UlQ7Cj4+ICsKPj4gICAgICAgICAgIGZyZWVfb3B0ZWVfc2htX2J1ZihjdHgsIG9wdGVlX3NobV9i
dWYtPmNvb2tpZSk7Cj4+ICsgICAgfQo+PiAgICAgICAgIGlmICggaHlwZXJjYWxsX3ByZWVtcHRf
Y2hlY2soKSApCj4+ICAgICAgICAgICByZXR1cm4gLUVSRVNUQVJUOwo+Pgo+Cj4gQ2hlZXJzLAoK
Ci0tClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
