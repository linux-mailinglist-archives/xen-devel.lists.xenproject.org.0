Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2691DC0557
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:41:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpX2-00082H-PZ; Fri, 27 Sep 2019 12:39:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDpX1-00082B-LF
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:39:31 +0000
X-Inumbo-ID: d96a6976-e123-11e9-bf31-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::628]) by localhost (Halon) with ESMTPS
 id d96a6976-e123-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 12:39:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3EJ9YqbmTUqzceBMF2JI6bwqG9UtvTEPFqJwMf6q0lY1kzs4HNIYY1b4dqZmomy7Udbv4feNqsSNwEgBFM5FJYz3Wvkwc4v3PTTErgbxpQZMeGZiSmePRRk4KSnWSQeeHocmIlsK7pJZ9EHgmEDrKnYAssiCZ1SAVUpwygJ+gVsMF9V8St5SGf01SBZbj4IEAiDZu4HIb7NOut6wlShdJzl52M1iRLr2/5yrgfNiufe68EvTZbWxM3YCiM3E7lhzpqhk2++OHe8SI59DP0fcJioxYdW2ksiEKUYA3GksxqKPdiUgDhe85v40XJwYJqBdB9l/6k/7nJxpVbzgpFlOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asBHieXMl+me2l//v3N6dPUdo1inqE7B52zGBftGoRc=;
 b=IPo8rsaYXsuyNrKMzakzEU7OzWAaQZm3hrjIDNOO04rqDKcLCp3vOr58gNizydSiGFTcNRheaZQcJfJdfdAd1B/LHfG5l/CLrrZ0E5EJtHC9idIfDvBJgjk7UcQWUpdZOMsRbgudwn54WddoZi4+iiMIUQPiXqaRxGb3gM/vo6Zapmkts10D9TaWQex5Qi4jEhVIQv7T2c9o8H0OJt7t4ynRcyoAw1CviEknj2xI3Voq/Gk8MDxmTQboFyj/qQv1mT7hExyoubuzXv0Rppu2stkCJlLgjb0lLyBkUwEISE5iSBr4mY+gRrXXdUkiouaFiUZhOwKli/kfY6jBMC6NpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asBHieXMl+me2l//v3N6dPUdo1inqE7B52zGBftGoRc=;
 b=TfZ741xxzqOzsohhzNdNGGzPNmkX4DW7UGNQ9YII+LAWhStwBAz80CAxpJ0iOOLuwvzgupRwmvR7WQOe/u9rBA1ev4KUpNWOUyxFryF7Cbv/PumiwKxUWGIFRLvwXzx+1DMlLXTQVFxjDNBJxpQODiClkYhdLVJFcPTTOYmbaN0=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3506.eurprd03.prod.outlook.com (52.134.80.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Fri, 27 Sep 2019 12:39:29 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 12:39:29 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD workaround
 is re-enabled right after exiting a guest
Thread-Index: AQHVdJmSz7FwOb+ZL0aIExPYLyfVU6c/a/SAgAAHRoCAAATGAA==
Date: Fri, 27 Sep 2019 12:39:28 +0000
Message-ID: <87r2419am7.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-5-julien.grall@arm.com> <87v9te7y1m.fsf@epam.com>
 <bbb73576-a2ae-16d8-5147-34a584721e7c@arm.com>
In-Reply-To: <bbb73576-a2ae-16d8-5147-34a584721e7c@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cffb3f42-685d-4fff-6046-08d74347bd23
x-ms-traffictypediagnostic: AM0PR03MB3506:|AM0PR03MB3506:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB35061C05213470B6D79BDC98E6810@AM0PR03MB3506.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(199004)(189003)(305945005)(54906003)(81156014)(81166006)(2906002)(4326008)(86362001)(186003)(316002)(478600001)(6916009)(8936002)(91956017)(64756008)(66556008)(76116006)(66446008)(8676002)(14454004)(66946007)(66476007)(256004)(66066001)(2616005)(446003)(25786009)(229853002)(36756003)(476003)(11346002)(7736002)(6436002)(6512007)(6486002)(486006)(5660300002)(76176011)(107886003)(102836004)(80792005)(6246003)(99286004)(71190400001)(26005)(55236004)(6506007)(53546011)(3846002)(6116002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3506;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9WLpueNp+7vs5uQQYC8ovobd3qyyf9y/NrsV1PxY7KnNvny0Wpd9gMpt7gFmAzX5NP5L5V2dZ3suMGDFrpMjCBYIalQKqfz9p8227JCYPiLbxBqxIPQw0eLzJDDGbJUXvGXa+//NXMsbhfsaU05WUkEi2dxxyom66yY1Pl2n31BV7gMkvMUEdEOnn1ER+dSOdAZuhtJvfqAACsKYy4Wu2AYyMnmpXwyQcTDCav+Jv7an+uFJk/VTD/2LhluEZmjBFyvE0+sOyyp1gu54e/e1QHOs/HjfCpZ8yNucMIYiPt359HgxAjgG4gJ7MI8aiZEewmDE/krNPZtx8T2oHh9j97f/l90cQCkM17uicD5I34zQj5VuGyGwZW37Ee6S4ztSvpA5YWHzGxuI1i90FjmDuM2LyYqR71lDRXszDVgn9ek=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cffb3f42-685d-4fff-6046-08d74347bd23
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 12:39:29.0066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pImT1BV/59FrJoaxA5wwxpnbOlcyLX0tB8ll2T/kqNPOCp2SbRluVj5+OgarePEPJF/55tOYzR4eqG8Rdx6BUtPgoq6QNfzq9XOCgv+6//I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3506
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uIDI3LzA5LzIwMTkgMTI6NTYsIFZvbG9keW15ciBC
YWJjaHVrIHdyb3RlOgo+Pgo+PiBKdWxpZW4sCj4KPiBIaS4uLgo+Cj4+Cj4+IEp1bGllbiBHcmFs
bCB3cml0ZXM6Cj4+Cj4+PiBBdCB0aGUgbW9tZW50LCBTU0JEIHdvcmthcm91bmQgaXMgcmUtZW5h
YmxlZCBmb3IgWGVuIGFmdGVyIGludGVycnVwdHMKPj4+IGFyZSB1bm1hc2tlZC4gVGhpcyBtZWFu
cyB3ZSBtYXkgZW5kIHVwIHRvIGV4ZWN1dGUgc29tZSBwYXJ0IG9mIHRoZQo+Pj4gaHlwZXJ2aXNv
ciBpZiBhbiBpbnRlcnJ1cHQgaXMgcmVjZWl2ZWQgYmVmb3JlIHRoZSB3b3JrYXJvdW5kIGlzCj4+
PiByZS1lbmFibGVkLgo+Pj4KPj4+IEFzIHRoZSByZXN0IG9mIGVudGVyX2h5cGVydmlzb3JfZnJv
bV9ndWVzdCgpIGRvZXMgbm90IHJlcXVpcmUgdG8gaGF2ZQo+Pj4gaW50ZXJydXB0cyBtYXNrZWQs
IHRoZSBmdW5jdGlvbiBpcyBub3cgc3BsaXQgaW4gdHdvIHBhcnRzOgo+Pj4gICAgICAxKSBlbnRl
cl9oeXBlcnZpc29yX2Zyb21fZ3Vlc3Rfbm9pcnEoKSBjYWxsZWQgd2l0aCBpbnRlcnJ1cHRzCj4+
PiAgICAgICAgIG1hc2tlZC4KPj4gSSdtIG9rYXkgd2l0aCB0aGlzIGFwcHJvYWNoLCBidXQgSSBk
b24ndCBsaWtlIG5hbWUgZm9yCj4+IGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9ub2lycSgp
LiBSaWdodCBub3cgaXQgaXMgZG9pbmcgZXhhY3RseSBvbmUKPj4gdGhpbmcgLSBtaXRpZ2F0ZXMg
U1NCRC4gU28sIG1heWJlIG1vcmUgYXBwcm9wcmlhdGUgbmFtZSB3aWxsIGJlCj4+IHNvbWV0aGlu
ZyBsaWtlICJtaXRpZ2F0ZV9zc2JkKCkiID8KPgo+IElmIEkgd2FudGVkIHRvIGNhbGwgaXQgbWl0
aWdhdGVfc3NiZCgpIEkgd291bGQgaGF2ZSBpbXBsZW1lbnRlZAo+IGNvbXBsZXRlbHkgZGlmZmVy
ZW50bHkuIFRoZSByZWFzb24gaXQgaXMgbGlrZSB0aGF0IGlzIGJlY2F1c2Ugd2UgbWF5Cj4gbmVl
ZCBtb3JlIGNvZGUgdG8gYmUgYWRkZWQgaGVyZSBpbiB0aGUgZnV0dXJlIChJIGhhdmUgQW5kcmlp
J3Mgc2VyaWVzCj4gaW4gbWluZCkuIFNvIEkgd291bGQgcmF0aGVyIGF2b2lkIGEgZnVydGhlciBy
ZW5hbWluZyBsYXRlciBvbiBhbmQgc29tZQo+IHJld29yay4KRmFpciBlbm91Z2gKCj4KPiBSZWdh
cmRpbmcgdGhlIG5hbWUsIHRoaXMgaXMgYSBzcGxpdCBvZgo+IGVudGVyX2h5cGVydmlzb3JfZnJv
bV9ndWVzdCgpLiBIZW5jZSwgd2h5IHRoZSBmaXJzdCBwYXRoIGlzIHRoZQo+IHNhbWUuIFRoZSBu
b2lycSBtZXJlbHkgaGVscCB0aGUgdXNlciB0byBrbm93IHdoYXQgdG8gZXhwZWN0LiBUaGlzIGlz
Cj4gYmV0dGVyIG9mIHlldCBhbiBfXyB2ZXJzaW9uLiBGZWVsIGZyZWUgdG8gc3VnZ2VzdCBhIGJl
dHRlciBzdWZmaXguCkknbSBiYWQgYXQgbmFtaW5nIHRoaW5ncyA6KQoKSSB1bmRlcnN0YW5kIHRo
YXQgaXMgdHdvIGhhbHZlcyBvZiBvbmUgZnVuY3Rpb24uIEJ1dCBmdW5jX25hbWVfbm9pcnEoKQpw
YXR0ZXJuIGlzIHdpZGVseSB1c2VkIGZvciBvdGhlciBjYXNlOiB3aGVuIHdlIGhhdmUgZnVuY19u
YW1lX25vaXJxKCkKZnVuY3Rpb24gYW5kIHNvbWUgZnVuY19uYW1lKCkgdGhhdCBkaXNhYmxlcyBp
bnRlcnJ1cHRzIGxpa2UgdGhpczoKCnZvaWQgZnVuY19uYW1lKCkKewogICAgICAgIGRpc2FibGVf
aXJxcygpOwogICAgICAgIGZ1bmNfbmFtZV9ub2lycSgpOwogICAgICAgIGVuYWJsZV9pcnFzKCk7
Cn0KCkkgbGlrZSBwcmluY2lwbGUgb2YgbGVhc3Qgc3VycHJpc2UsIHNvIGl0IGlzIGJldHRlciB0
byB1c2Ugc29tZSBvdGhlcgpuYW1pbmcgcGF0dGVybiB0aGVyZS4KCm1heWJlIHNvbWV0aGluZyBs
aWtlIGVudGVyX2h5cGVydmlzb3JfZnJvbV9ndWVzdF9wdDEoKSBhbmQKZW50ZXJfaHlwZXJ2aXNv
cl9mcm9tX2d1ZXN0X3B0MigpPwoKT3IgbWF5YmUsIHdlIHNob3VsZCBub3Qgc3BsaXQgdGhlIGZ1
bmN0aW9uIGF0IGFsbD8gSW5zdGVhZCwgd2UgZW5hYmxlCmludGVycnVwdHMgcmlnaHQgaW4gdGhl
IG1pZGRsZSBvZiBpdC4KCj4KPj4KPj4+ICAgICAgMikgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1
ZXN0KCkgY2FsbGVkIHdpdGggaW50ZXJydXB0cyB1bm1hc2tlZC4KPj4+Cj4+PiBOb3RlIHRoYXQg
d2hpbGUgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0X25vaXJxKCkgZG9lcyBub3QgdXNlIHRo
ZQo+Pj4gb24tc3RhY2sgY29udGV4dCByZWdpc3RlcnMsIGl0IGlzIHN0aWxsIHBhc3NlZCBhcyBw
YXJhbWV0ZXIgdG8gbWF0Y2ggdGhlCj4+PiByZXN0IG9mIHRoZSBDIGZ1bmN0aW9ucyBjYWxsZWQg
ZnJvbSB0aGUgZW50cnkgcGF0aC4KPj4gQXMgSSBwb2ludGVkIGluIHRoZSBwcmV2aW91cyBlbWFp
bCwgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0KCkgZG9lcwo+PiBub3QgdXNlIG9uLXN0YWNr
IHJlZ2lzdGVycyBhcyB3ZWxsLgo+Cj4gSSBhbSB3ZWxsIGF3YXJlIG9mIHRoaXMsIGhlbmNlIG15
IGNvbW1lbnQgaGVyZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UKPiA7KS4gVGhlIHJlYXNvbiBpdCBp
cyBsaWtlIHRoYXQgaXMgYmVjYXVzZSBJIHdhbnRlZCB0byBrZWVwIHRoZQo+IHByb3RvdHlwZSB0
aGUgc2FtZSBmb3IgYWxsIGZ1bmN0aW9ucyBjYWxsZWQgZnJvbSB0aGUgZW50cnkgcGF0aCAodGhp
cwo+IGluY2x1ZGVzIGRvX3RyYXBfKikuCkxldCdzIGNvbnRpbnVlIHRob3NlIGRpc2N1c3Npb24g
aW4gdGhlIG90aGVyIHRocmVhZC4KWy4uLl0KCi0tClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
