Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B11776DF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 14:20:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j97PN-0008VE-8f; Tue, 03 Mar 2020 13:16:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x433=4U=amazon.co.uk=prvs=32428865a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j97PK-0008V9-Mk
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 13:16:22 +0000
X-Inumbo-ID: 2cd955be-5d51-11ea-8efe-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cd955be-5d51-11ea-8efe-bc764e2007e4;
 Tue, 03 Mar 2020 13:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583241382; x=1614777382;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=JIM7TtXDDkUfkc/fmnhrA+keC+N335yHmWWWDvdU2Ow=;
 b=qAi/4WhsA0f3CO4EOasPYPm5BnoaCmnfNx2wJA31kbI5mmbHITJPryzA
 rjfzs5qoubBuIZUDWaPrGNEKaPtrl5S9Usw4vcgpJT90I+dtW1oxN+8zC
 JI2sS5TnPBYCt1CXKtfoZ8L9eLFL0JUz2JpOSvvgvfnNFU732PH3CxPy7 Y=;
IronPort-SDR: r5ANuQ/hihZNUh1QNC0SpXGxl3OrmnEvQO25mjB3CMqgWQwPW/eGhrGgoQ7Xm3+6Uen9lkWO6o
 YGP27iew7AQw==
X-IronPort-AV: E=Sophos;i="5.70,511,1574121600"; d="scan'208";a="20493956"
Thread-Topic: [Xen-devel] [PATCH v5 1/4] x86/HVM: cancel emulation when
 register state got altered
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 03 Mar 2020 13:16:18 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS
 id B4295A2C15; Tue,  3 Mar 2020 13:16:17 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 3 Mar 2020 13:16:17 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Mar 2020 13:16:16 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 3 Mar 2020 13:16:16 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Index: AQHV8UTsG/SnSOoqCEyyMrudkBjJ3qg22Ibg
Date: Tue, 3 Mar 2020 13:16:16 +0000
Message-ID: <e1293a6fcb0942bda81a5690c20a6771@EX13D32EUC003.ant.amazon.com>
References: <1e1ccd2a-526c-631b-7889-35f993b2005e@suse.com>
 <146b8935-2a48-2de7-4c21-8390b6846c05@suse.com>
In-Reply-To: <146b8935-2a48-2de7-4c21-8390b6846c05@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.151]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 1/4] x86/HVM: cancel emulation when
 register state got altered
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxp
Y2gNCj4gU2VudDogMDMgTWFyY2ggMjAyMCAxMDoxNw0KPiBUbzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnDQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1
IDx3bEB4ZW4ub3JnPjsgUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFtF
WFRFUk5BTF1bWGVuLWRldmVsXSBbUEFUQ0ggdjUgMS80XSB4ODYvSFZNOiBjYW5jZWwgZW11bGF0
aW9uDQo+IHdoZW4gcmVnaXN0ZXIgc3RhdGUgZ290IGFsdGVyZWQNCj4gDQo+IFJlLWV4ZWN1dGlv
biAoYWZ0ZXIgaGF2aW5nIHJlY2VpdmVkIGRhdGEgZnJvbSBhIGRldmljZSBtb2RlbCkgcmVsaWVz
IG9uDQo+IHRoZSBzYW1lIHJlZ2lzdGVyIHN0YXRlIHN0aWxsIGJlaW5nIGluIHBsYWNlIGFzIGl0
IHdhcyB3aGVuIHRoZSByZXF1ZXN0DQo+IHdhcyBmaXJzdCBzZW50IHRvIHRoZSBkZXZpY2UgbW9k
ZWwuIFRoZXJlZm9yZSB2Q1BVIHN0YXRlIGNoYW5nZXMNCj4gZWZmZWN0ZWQgYnkgcmVtb3RlIHNv
dXJjZXMgbmVlZCB0byByZXN1bHQgaW4gbm8gYXR0ZW1wdCBvZiByZS1leGVjdXRpb24uDQo+IElu
c3RlYWQgdGhlIHJldHVybmVkIGRhdGEgaXMgdG8gc2ltcGx5IGJlIGlnbm9yZWQuDQo+IA0KPiBO
b3RlIHRoYXQgYW55IHN1Y2ggYXN5bmNocm9ub3VzIHN0YXRlIGNoYW5nZXMgaGFwcGVuIHdpdGgg
dGhlIHZDUFUgYXQNCj4gbGVhc3QgcGF1c2VkIChwb3RlbnRpYWxseSBkb3duIGFuZC9vciBub3Qg
bWFya2VkIC0+aXNfaW5pdGlhbGlzZWQpLCBzbw0KPiB0aGVyZSdzIG5vIGlzc3VlIHdpdGggZmlk
ZGxpbmcgd2l0aCByZWdpc3RlciBzdGF0ZSBiZWhpbmQgdGhlIGFjdGl2ZWx5DQo+IHJ1bm5pbmcg
ZW11bGF0b3IncyBiYWNrLiBIZW5jZSB0aGUgbmV3IGZ1bmN0aW9uIGRvZXNuJ3QgbmVlZCB0bw0K
PiBzeW5jaHJvbml6ZSB3aXRoIHRoZSBjb3JlIGVtdWxhdGlvbiBsb2dpYy4NCj4gDQo+IFN1Z2dl
c3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpOZWVkIHdlIGJl
IGNvbmNlcm5lZCB3aXRoIGFueSBwYWdlLXNwbGl0IEkvTyBoZXJlPyBUaGF0IG1heSBtYW5pZmVz
dCBhcyB0d28gc2VwYXJhdGUgZW11bGF0aW9ucyBhbmQgQUZBSUNUIGl0IHdvdWxkIGJlIHBvc3Np
YmxlIGZvciBvbmx5IHRoZSBzZWNvbmQgcGFydCB0byBiZSBhYm9ydGVkIGJ5IHRoaXMgY2hhbmdl
Lg0KDQogIFBhdWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
