Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA86C0AC0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 20:03:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDuWE-0004EN-5L; Fri, 27 Sep 2019 17:59:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDuWC-0004EI-7M
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 17:59:00 +0000
X-Inumbo-ID: 7a9203d2-e150-11e9-9681-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.44]) by localhost (Halon) with ESMTPS
 id 7a9203d2-e150-11e9-9681-12813bfff9fa;
 Fri, 27 Sep 2019 17:58:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XO6jwYk1CbU60u8czINVg1nR6ALIxkE/Q7Tmv9QfBK8ORYrm+N3ZEqaZ8xoWMmeqUhOjXcpd6Fv8QI/6TEO1XED0M7evBJHtJhgtDQVfPufsTPuK9yIAiSCfG7ylUuzdn2oug0dyekJb+9jjdkXtDbHQfHGNSO0L4ecIeiIM0zNmVN9ZHy+6inzAnZwd1wjwWi7gPv7HqtRs9nsWGQqom4bySesX/G75sD9NjK4rKliGJ4YH4EJPHShkhRc+ZuPeweKxNKsK4WITzvJYtd3X/jMYSuLhVtkG6ZUGA7tz/K7vv520HzIFh3mI3ufUZK8NT50YxNB9P+Bw6xR5dPo7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbPb4MIGZy9qaOjR8oKxVeoyFKC3qpU93XFr0UOnkN8=;
 b=PlbYtGg+Zc5/0vfTIZOgI+B8RQc0t2Q2Gon88H0zE7C7GULZcZoCixdotJQDcLS0/JNelRoIVYdG2MGmf5N/Sfzwu0IHWk1njwBk+RD1OoL5R5WnQjnfCv8bJrm5JPbTcw988QJ9629UhPHQiyB0mbLpf+4ZCmMq8KghkgPa9MOBHDgbSdZOBktpTObWHISQlUToDmYe+z8RoaBHzuCD+CCSqdBQYCLTBikYr9Hx/9JfsNYQ3hVuU76bsp789QeRWwZ1KGAyTE7h6HVBUW+sYJc+DQK3/Ts/xN5fMfA+ni7AvI4dAeUYzXknJS2CmKzZyyGzflwMimPhlFyoNRRX+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbPb4MIGZy9qaOjR8oKxVeoyFKC3qpU93XFr0UOnkN8=;
 b=NdEaDdbBcHNvCnbx19hb56we4nuzCkHc8yKAPU9JBQ/L4zaGbBIgnS89qfi/hPtawsJXf2S9GfwZRv7eSZsyXyVc2NNuGijmohNpnwNwCXFP5lPF7jGhAyxk6aMwf7fCeKwMh2YlNaLSrAKXK6BFePJuWaREQbycbe2RKSg1xPI=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3747.eurprd03.prod.outlook.com (52.134.87.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Fri, 27 Sep 2019 17:58:57 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 17:58:57 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD workaround
 is re-enabled right after exiting a guest
Thread-Index: AQHVdJmSz7FwOb+ZL0aIExPYLyfVU6c/a/SAgAAHRoCAAATGAIAACkYAgAAExICAAAqUgIAAAuAAgAAiYACAABpkAA==
Date: Fri, 27 Sep 2019 17:58:56 +0000
Message-ID: <87sgoh4o4f.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-5-julien.grall@arm.com> <87v9te7y1m.fsf@epam.com>
 <bbb73576-a2ae-16d8-5147-34a584721e7c@arm.com> <87r2419am7.fsf@epam.com>
 <df6b891c-2670-47d9-ae0d-223161edc225@arm.com> <87muep984i.fsf@epam.com>
 <8bc36926-a00f-d20b-c3b2-12491ed576de@arm.com> <87lfu995w9.fsf@epam.com>
 <4c8524cc-7186-c4f4-d09d-20c7a534c900@arm.com>
In-Reply-To: <4c8524cc-7186-c4f4-d09d-20c7a534c900@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a43d1c2-a41c-47bd-3e70-08d743745e2b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB3747; 
x-ms-traffictypediagnostic: AM0PR03MB3747:|AM0PR03MB3747:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB374764D9358131B1FD661D1EE6810@AM0PR03MB3747.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(199004)(189003)(6916009)(186003)(66476007)(316002)(11346002)(54906003)(6116002)(6512007)(6436002)(53546011)(478600001)(25786009)(305945005)(86362001)(7736002)(76176011)(3846002)(14444005)(66066001)(6486002)(14454004)(4326008)(8676002)(229853002)(99286004)(256004)(6506007)(66446008)(71200400001)(71190400001)(81156014)(486006)(55236004)(36756003)(8936002)(5660300002)(2906002)(81166006)(446003)(102836004)(66946007)(2616005)(66556008)(64756008)(26005)(476003)(76116006)(80792005)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3747;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iem3gEauGQlxqhZAuC6HN17jmIYRGLcut/wry/SlNg0Ov/F62bT1r07YnfJ99HIRDLfvdvpNQQtaNd2YmQlMP5iphFdMalCJmiSbp86bYQ8SKFAAPo7lHeZtnhrntXiXGxrDZdae3p16Lb4AawiCtx7JLBGfrKrnq69Qd/V1GVq++5OPR9MWs9cbT/LKoR7AB7BNtsB9X1lL15up9Z8LLDD588CdBO18Y+uXz/DPnXwgDDH/LiljZSzaTrV9M7JhyMH5/5I99MWb5P96hPVryKgi3NlPAzYSyREkFXH+cVhnK67UwevMGsAnUplWZlaNHZjeq2SIR2uC90+KYEfiSWlZFqZfr5kX184b4LOfGpaJxyvyTeG22eb8BxVkuiQcvtgRtEFrL6P3TtWkqaBGUXeSMByfDDFxubI2/T8CGcQ=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a43d1c2-a41c-47bd-3e70-08d743745e2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 17:58:57.0164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IArKlnNuHB8o1q3iPoaBoHn+R7gtD5D9qOGPE8O5rkYAoZf8X2Q1d+cOB/Czv/3AP+w7VBu5J7j1R2NP/HxB2UoAAlFYOkR1dqAGUPuCrjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3747
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD
 workaround is re-enabled right after exiting a guest
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 Andre Przywara <andre.przywara@arm.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24gMjcvMDkvMjAxOSAxNToyMSwgVm9s
b2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Cj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Cj4+PiBP
biAyNy8wOS8yMDE5IDE0OjMzLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+PiBKdWxpZW4g
R3JhbGwgd3JpdGVzOgo+Pj4+PiBPbiAyNy8wOS8yMDE5IDEzOjM5LCBWb2xvZHlteXIgQmFiY2h1
ayB3cm90ZToKPj4+Pj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Pj4+Pj4gT24gMjcvMDkvMjAx
OSAxMjo1NiwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pj4+Pj4+IEp1bGllbiBHcmFsbCB3
cml0ZXM6Cj4+Pj4+PiBPciBtYXliZSwgd2Ugc2hvdWxkIG5vdCBzcGxpdCB0aGUgZnVuY3Rpb24g
YXQgYWxsPyBJbnN0ZWFkLCB3ZSBlbmFibGUKPj4+Pj4+IGludGVycnVwdHMgcmlnaHQgaW4gdGhl
IG1pZGRsZSBvZiBpdC4KPj4+Pj4KPj4+Pj4gSSB0aG91Z2h0IGFib3V0IHRoaXMgYnV0IEkgZGlk
bid0IG11Y2ggbGlrZSB0aGUgcmVzdWx0aW5nIGNvZGUuCj4+Pj4+Cj4+Pj4+IFRoZSBpbnN0cnVj
dGlvbiB0byB1bm1hc2sgaW50ZXJydXB0cyByZXF1aXJlcyB0byB0YWtlIGFuIGltbWVkaWF0ZQo+
Pj4+PiAoaW5kaWNhdGVzIHdoaWNoIGludGVycnVwdHMgdG8gdW5tYXNrKS4gQXMgbm90IGFsbCB0
aGUgdHJhcHMgcmVxdWlyZQo+Pj4+PiB0byB1bm1hc2sgdGhlIHNhbWUgaW50ZXJydXB0cywgd2Ug
d291bGQgZW5kIHVwIHRvIGhhdmUgdG8gYSBidW5jaCBvZgo+Pj4+PiBpZiBpbiB0aGUgY29kZSB0
byBzZWxlY3QgdGhlIHJpZ2h0IHVubWFza2luZy4KPj4+PiBBaCwgeWVzLCB0aGlzIGlzIHRoZSBw
cm9ibGVtLiBXZSBjYW4gcHJvdmlkZSBjYWxsYmFjayB0bwo+Pj4+IGVudGVyX2h5cGVydmlzb3Jf
ZnJvbV9ndWVzdCgpLgo+Pj4KPj4+IEkgYW0gbm90IHN1cmUgd2hhdCB5b3UgbWVhbiBieSB0aGlz
LiBEbyB5b3UgbWVhbiBhIGNhbGxiYWNrIHRoYXQgd2lsbAo+Pj4gdW5tYXNrIHRoZSBpbnRlcnJ1
cHRzPwo+PiBZZXMuIFlvdSBjYW4gcGFzcyBmdW5jdGlvbiBwb2ludGVyIHRvIGVudGVyX2h5cGVy
dmlzb3JfZnJvbV9ndWVzdCgpLiBUbwo+PiBhIGZ1bmN0aW9uLCB0aGF0IHdpbGwgdW5tYXNrIHRo
ZSBpbnRlcnJ1cHRzLiBJJ20gc3VyZSB0aGF0IGd1ZXN0X3ZlY3Rvcgo+PiBtYWNybyBjYW4gZ2Vu
ZXJhdGUgaXQgZm9yIHlvdS4gU29tZXRoaW5nIGxpa2UgdGhpczoKPj4KPj4gICAgICAgICAgLm1h
Y3JvICBndWVzdF92ZWN0b3IgY29tcGF0LCBpZmxhZ3MsIHRyYXAsIHNhdmVfeDBfeDE9MQo+PiAg
ICAgICAgICBlbnRyeSAgIGh5cD0wLCBjb21wYXQ9XGNvbXBhdCwgc2F2ZV94MF94MT1cc2F2ZV94
MF94MQo+PiAgICAgICAgICAvKgo+PiAgICAgICAgICAgKiBUaGUgdlNFcnJvciB3aWxsIGJlIGNo
ZWNrZWQgd2hpbGUgU0tJUF9TWU5DSFJPTklaRV9TRVJST1JfRU5UUllfRVhJVAo+PiAgICAgICAg
ICAgKiBpcyBub3Qgc2V0LiBJZiBhIHZTRXJyb3IgdG9vayBwbGFjZSwgdGhlIGluaXRpYWwgZXhj
ZXB0aW9uIHdpbGwgYmUKPj4gICAgICAgICAgICogc2tpcHBlZC4gRXhpdCBBU0FQCj4+ICAgICAg
ICAgICAqLwo+PiAgICAgICAgICBBTFRFUk5BVElWRSgiYmwgY2hlY2tfcGVuZGluZ192c2Vycm9y
OyBjYm56IHgwLCAxZiIsCj4+ICAgICAgICAgICAgICAgICAgICAgICJub3A7IG5vcCIsCj4+ICAg
ICAgICAgICAgICAgICAgICAgIFNLSVBfU1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQpCj4+
ICAgICAgICAgIGxkciAgICAgeDAsID0xZgo+PiAgICAgICAgICBibCAgICAgIGVudGVyX2h5cGVy
dmlzb3JfZnJvbV9ndWVzdAo+PiAgICAgICAgICBtb3YgICAgIHgwLCBzcAo+PiAgICAgICAgICBi
bCAgICAgIGRvX3RyYXBfXHRyYXAKPj4gICAgICAgICAgYiAgICAgICAxZgo+PiAyOgo+PiAgICAg
ICAgICBtc3IgICAgIGRhaWZjbHIsIFxpZmxhZ3MKPj4gICAgICAgICAgcmV0Cj4+IDE6Cj4+ICAg
ICAgICAgIGV4aXQgICAgaHlwPTAsIGNvbXBhdD1cY29tcGF0Cj4+ICAgICAgICAgIC5lbmRtCj4K
PiBUQkgsIEkgZG9uJ3Qgc2VlIHdoYXQncyB0aGUgcG9pbnQgeW91IGFyZSB0cnlpbmcgdG8gbWFr
ZSBoZXJlLiBZZXMsCj4gdGhlcmUgYXJlIG1hbnkgd2F5IHRvIHdyaXRlIGEgY29kZSBhbmQgcG9z
c2liaWxpdHkgdG8gbWFrZSBvbmUKPiBmdW5jdGlvbi4gWW91IGNvdWxkIGFsc28gY3JlYXRlIGEg
c2tlbGV0b24gbWFjcm8gZm9yCj4gZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0IGFuZCBnZW5l
cmF0ZSBOIG9mIHRoZW0gKG9uZSBwZXIgc2V0IG9mCj4gdW5tYXNrIGludGVycnVwdHMpIGFuZCBj
YWxsIHRoZW0uCj4KPiBCdXQgYXJlIHRoZXkgcmVhbGx5IHdvcnRoIGl0PwpUaGUgcG9pbnQgaXMg
dGhhdCB5b3UgYXJlIHRyeWluZyB0byBzcGxpdCBvbmUgZW50aXR5IGludG8gdHdvLgpBcyBJIHNl
ZSBpdDogc2VtYW50aWNhbGx5IHdlIGhhdmUgb25lIGZ1bmN0aW9uOgplbnRlcl9oeXBlcnZpc29y
X2Zyb21fZ3Vlc3QoKS4gVGhlIHB1cnBvc2Ugb2YgdGhpcyBmdW5jdGlvbiBpcyBjbGVhcjoKZmlu
aXNoIHRyYW5zaXRpb24gZnJvbSBndWVzdCBtb2RlIHRvIGh5cGVydmlzb3IgbW9kZS4KCkJ1dCBi
ZWNhdXNlIG9mIHNvbWUgYXJjaGl0ZWN0dXJhbCBsaW1pdGF0aW9uIChkYWlmY2xyIHJlcXVpcmVz
IG9ubHkKaW1tZWRpYXRlIGFyZ3VtZW50KSB5b3UgYXJlIGZvcmNlZCB0byBkaXZpZGUgdGhpcyBm
dW5jdGlvbiBpbiB0d28uCkkgZG9uJ3QgbGlrZSB0aGlzLCBiZWNhdXNlIGVudHJ5IHBhdGggbm93
IGlzIG1vcmUgY29tcGxleC4gVG8gZm9sbG93CndoYXQgaXMgZ29pbmcgeW91IG5lZWQgdG8gYm91
bmNlIGJldHdlZW4gaGVhZC5TIGFuZCB0cmFwcy5jIG9uZSBleHRyYSB0aW1lLgoKQW55d2F5cywg
dGhpcyBpcyBvbmx5IG15IG9waW5pb24uIEknbSBub3QgZm9yY2luZyB5b3UgdG8gaW1wbGVtZW50
CmVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdCgpIGluIHRoaXMgd2F5LgoKSSdtIG9rYXkgd2l0
aCBlbnRlcl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3RfcHJlaXJxKCkgYXMgd2VsbC4KCi0tIApWb2xv
ZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
