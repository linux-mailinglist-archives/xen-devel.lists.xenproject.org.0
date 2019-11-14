Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD08FCBE6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 18:31:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVIw3-0000oK-Q5; Thu, 14 Nov 2019 17:29:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FmwO=ZG=amazon.com=prvs=2141dd62d=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iVIw3-0000oF-4I
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 17:29:35 +0000
X-Inumbo-ID: 52749156-0704-11ea-a250-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52749156-0704-11ea-a250-12813bfff9fa;
 Thu, 14 Nov 2019 17:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1573752573; x=1605288573;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vHcAt7sGIigM7t/C50ATMzok8dnC551SY59tLokQKEM=;
 b=bj08ile8wVrljbDQVdd+kXtlxyaUQVtf9G2ZYFTO7aZXDxYNjOWI2lSI
 H4GrC66ISuF4OwwHnqHrF4Ucn8eN1K1wRhfRu5cV6vbJTXbWK+AhbMhvm
 ckH8GGh64MUhJ2GvUdaryZbvVbTQNUhtdP9Hj2XAVTkZznge2ZcvhQxnX w=;
IronPort-SDR: FQxZ/GJSRZLMa3qPzyClGXLBmfi/FBHr/ccwjdiMY4LJ0cEiGUQff6Ykxza/mQwi6B2F/LLzzb
 Zby8wUVN9seQ==
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 14 Nov 2019 17:29:29 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id F2CD5A275C; Thu, 14 Nov 2019 17:29:27 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 14 Nov 2019 17:29:27 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 14 Nov 2019 17:29:26 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 14 Nov 2019 17:29:25 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2 0/2] AMD/IOMMU: re-work mode updating
Thread-Index: AQHVmwqlycWKY+rFqEawMIh3cfjNZ6eK60TQ
Date: Thu, 14 Nov 2019 17:29:23 +0000
Message-ID: <3f17589409b24992a3aac0f357b1cd56@EX13D32EUC003.ant.amazon.com>
References: <8e8866de-33a8-68c0-3352-d6dfeec4a9b6@suse.com>
In-Reply-To: <8e8866de-33a8-68c0-3352-d6dfeec4a9b6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.165]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 0/2] AMD/IOMMU: re-work mode updating
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Sander Eikelenboom <linux@eikelenboom.it>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxp
Y2gNCj4gU2VudDogMTQgTm92ZW1iZXIgMjAxOSAxNjo0Mg0KPiBUbzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+OyBT
YW5kZXIgRWlrZWxlbmJvb20NCj4gPGxpbnV4QGVpa2VsZW5ib29tLml0PjsgQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BB
VENIIHYyIDAvMl0gQU1EL0lPTU1VOiByZS13b3JrIG1vZGUgdXBkYXRpbmcNCj4gDQo+IHVwZGF0
ZV9wYWdpbmdfbW9kZSgpIGluIHRoZSBBTUQgSU9NTVUgY29kZSBleHBlY3RzIHRvIGJlIGludm9r
ZWQgd2l0aA0KPiB0aGUgUENJIGRldmljZXMgbG9jayBoZWxkLiBUaGUgY2hlY2sgb2NjdXJyaW5n
IG9ubHkgd2hlbiB0aGUgbW9kZQ0KPiBhY3R1YWxseSBuZWVkcyB1cGRhdGluZywgdGhlIHZpb2xh
dGlvbiBvZiB0aGlzIHJ1bGUgYnkgdGhlIG1ham9yaXR5DQo+IG9mIGNhbGxlcnMgZGlkIGdvIHVu
bm90aWNlZCB1bnRpbCBwZXItZG9tYWluIElPTU1VIHNldHVwIHdhcyBjaGFuZ2VkDQo+IHRvIGRv
IGF3YXkgd2l0aCBvbi1kZW1hbmQgY3JlYXRpb24gb2YgSU9NTVUgcGFnZSB0YWJsZXMuDQoNCldv
dWxkbid0IGl0IGJlIHNhZmVyIHRvIGp1c3QgZ2V0IHJpZCBvZiB1cGRhdGVfcGFnaW5nX21vZGUo
KSBhbmQgc3RhcnQgd2l0aCBhIHJlYXNvbmFibGUgbnVtYmVyIG9mIGxldmVscz8NCg0KICBQYXVs
DQoNCj4gDQo+IFVuZm9ydHVuYXRlbHkgdGhlIG9ubHkgaGFsZiB3YXkgcmVhc29uYWJsZSBmaXgg
dG8gdGhpcyB0aGF0IEkgY291bGQNCj4gY29tZSB1cCB3aXRoIHJlcXVpcmVzIG1vcmUgcmUtd29y
ayB0aGFuIHdvdWxkIHNlZW0gZGVzaXJhYmxlIGF0IHRoaXMNCj4gdGltZSBvZiB0aGUgcmVsZWFz
ZSBwcm9jZXNzLCBidXQgYWRkcmVzc2luZyB0aGUgaXNzdWUgc2VlbXMNCj4gdW5hdm9pZGFibGUg
dG8gbWUgYXMgaXRzIG1hbmlmZXN0YXRpb24gaXMgYSByZWdyZXNzaW9uIGZyb20gdGhlDQo+IElP
TU1VIHBhZ2UgdGFibGUgc2V0dXAgcmUtd29yay4gVGhlIGNoYW5nZSBhbHNvIGlzbid0IHdpdGhv
dXQgcmlzaw0KPiBvZiBmdXJ0aGVyIHJlZ3Jlc3Npb25zIC0gaWYgaW4gcGF0Y2ggMiBJJ3ZlIG1p
c3NlZCBhIGNvZGUgcGF0aCB0aGF0DQo+IHdvdWxkIGFsc28gbmVlZCB0byBpbnZva2UgdGhlIG5l
dyBob29rLCB0aGVuIHRoaXMgbWlnaHQgbWVhbiBub24tDQo+IHdvcmtpbmcgZ3Vlc3RzICh3aXRo
IHBhc3NlZC10aHJvdWdoIGRldmljZXMgb24gQU1EIGhhcmR3YXJlKS4NCj4gDQo+IDE6IGludHJv
ZHVjZSBHRk4gbm90aWZpY2F0aW9uIGZvciB0cmFuc2xhdGVkIGRvbWFpbnMNCj4gMjogQU1EL0lP
TU1VOiB1c2Ugbm90aWZ5X2RmbigpIGhvb2sgdG8gdXBkYXRlIHBhZ2luZyBtb2RlDQo+IA0KPiBK
YW4NCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnDQo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
