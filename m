Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E5E14A6FA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 16:13:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5zh-0006fZ-7p; Mon, 27 Jan 2020 15:08:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ayIv=3Q=amazon.com=prvs=28866d453=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iw5zf-0006fU-Jp
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 15:08:03 +0000
X-Inumbo-ID: d02edcf5-4116-11ea-8561-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d02edcf5-4116-11ea-8561-12813bfff9fa;
 Mon, 27 Jan 2020 15:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580137683; x=1611673683;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Y5qCQf88AHqEacRJkb0TJ7SwzAk3vsm8+LSboUGYaqk=;
 b=rrFqh/ne5RQ95lAblUkwgPswIx+VtcHF+mhLXGjoMmrjxuMmHwlzdQdL
 f49sK/8V1Wc41RWMp+JmJVL5lyXvl5yZZORcSxTp+J7BvcdGszEGjIgwK
 zaS1gVN2VAnbWmFPcis7s6QEqDobKZU3yb8Kx+qqlqIgW0w+3nB90azjK 8=;
IronPort-SDR: KA80QsYoK2US3bPepXx5Q87kzW0fiE77fb+iD5YV4MOg9BcOYMNhkUwGg+0jyOog6W8l2MfniT
 v+sB01hjqk6A==
X-IronPort-AV: E=Sophos;i="5.70,370,1574121600"; d="scan'208";a="14320069"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 27 Jan 2020 15:08:01 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS
 id 8F404A2059; Mon, 27 Jan 2020 15:08:00 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 27 Jan 2020 15:08:00 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 27 Jan 2020 15:07:59 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Mon, 27 Jan 2020 15:07:59 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>, "roger.pau@citrix.com"
 <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v5 2/7] x86: introduce a new set of APIs to manage Xen
 page tables
Thread-Index: AQHVzGV/yYf4IPF6JUqRqxRRI40d36f+pMwAgAACmwCAAAbsAA==
Date: Mon, 27 Jan 2020 15:07:59 +0000
Message-ID: <d28777c594dbb46d49f63f0541668888943a8358.camel@amazon.com>
References: <cover.1578397252.git.hongyxia@amazon.com>
 <5f64321c4cceccd057e3b3e7fadea696793a7966.1578397252.git.hongyxia@amazon.com>
 <baa1a699-179f-b0ae-d857-699f7f63b214@suse.com>
 <dd3836c12457a92af545651b09acf910c2071bcf.camel@amazon.com>
 <1d38a17c-9b6b-a423-1326-33e24c583393@suse.com>
In-Reply-To: <1d38a17c-9b6b-a423-1326-33e24c583393@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
Content-ID: <5F91DF2D3CC2D74482072F3D40BFC223@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 2/7] x86: introduce a new set of APIs to
 manage Xen page tables
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Grall, 
 Julien" <jgrall@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMDIwLTAxLTI3IGF0IDE1OjQzICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
T24gMjcuMDEuMjAyMCAxNTozMywgWGlhLCBIb25neWFuIHdyb3RlOg0KPiA+IC4uLg0KPiA+IA0K
PiA+IFJlZmxlY3RpbmcgYmFjayB0byB5b3VyIGNvbW1lbnQgaW4gdjMgYWJvdXQgd2hldGhlciB0
aGUgbmV3IFhlbg0KPiA+IHBhZ2UNCj4gPiB0YWJsZSBtYXBwaW5nIEFQSXMgKG1hcC91bm1hcF94
ZW5fcGFnZXRhYmxlKSBhcmUgcmVhbGx5IG5lY2Vzc2FyeSwNCj4gPiBJDQo+ID4gYWdyZWUgaW4g
dGhlIGVuZCB0aGV5IHdpbGwganVzdCBkbyB0aGUgc2FtZSB0aGluZyBhcw0KPiA+IG1hcC91bm1h
cF9kb21haW5fcGFnZSwgYWx0aG91Z2ggb25lIHRoaW5nIGlzIHRoYXQgdGhlIGxhdHRlcg0KPiA+
IHN1Z2dlc3RzDQo+ID4gaXQgaXMgdHJ5aW5nIHRvIG1hcCBhIGBkb21haW4nIHBhZ2UsIHdob3Nl
IGRlZmluaXRpb24gcHJvYmFibHkgZG9lcw0KPiA+IG5vdA0KPiA+IGluY2x1ZGUgWGVuIHBhZ2Ug
dGFibGVzLCBzbyB0aGUgbmFtZSBjb3VsZCBiZSBhIGJpdCBjb25mdXNpbmcNCj4gPiAod2VsbCwg
d2UNCj4gPiBjb3VsZCBhcmd1ZSB0aGF0IFhlbiBwYWdlIHRhYmxlcyBhcmUganVzdCBpZGxlIGBk
b21haW4nIHBhZ2VzIHNvDQo+ID4gdGhlDQo+ID4gbmFtZSBzdGlsbCBob2xkcykuIElmIHdlIGFy
ZSBoYXBweSB3aXRoIHVzaW5nIG1hcF9kb21haW5fcGFnZSBvbg0KPiA+IFhlbg0KPiA+IFBURSB0
YWJsZXMgdGhlbiBJIGFtIG9rYXkgd2l0aCBkcm9wcGluZyB0aGUgbmV3IG1hcHBpbmcgQVBJcyBh
bmQNCj4gPiBvbmx5DQo+ID4gaW5jbHVkZSB0aGUgbmV3IGFsbG9jIEFQSXMuDQo+IA0KPiBBbnlv
bmUgb24gdGhlIFRvOiBsaXN0IC0gb3BpbmlvbnM/DQoNClRoZXJlIGlzIG9uZSBhcmd1bWVudC4g
V2UgYWxyZWFkeSB1c2UgbWFwX2RvbWFpbl9wYWdlIG9uIG5vbi1kb21haW4NCnBhZ2VzIGFuZCBv
dXRzaWRlIHRoZSBkb21oZWFwLiBGb3IgZXhhbXBsZSwgdGhlIHRyYXAgaGFuZGxlciB3YWxrcyBw
YWdlDQp0YWJsZXMgYW5kIHByaW50IHRyYWNlcyB2aWEgbWFwX2RvbWFpbl9wYWdlIHJlZ2FyZGxl
c3Mgb2Ygd2hlcmUgdGhlDQp1bmRlcmx5aW5nIHBhZ2UgaXMgZnJvbS4gVGhlIG1hcHBlZCBwYWdl
IGNvdWxkIGp1c3QgYmUgZnJvbSBYZW4uDQoNCkhvbmd5YW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
