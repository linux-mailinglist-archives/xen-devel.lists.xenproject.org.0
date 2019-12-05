Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC72113E6E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 10:45:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icndS-0001VU-7i; Thu, 05 Dec 2019 09:41:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fY9/=Z3=amazon.com=prvs=2352ce6fd=hongyxia@srs-us1.protection.inumbo.net>)
 id 1icndQ-0001VP-1n
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 09:41:20 +0000
X-Inumbo-ID: 6405eef2-1743-11ea-aea8-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6405eef2-1743-11ea-aea8-bc764e2007e4;
 Thu, 05 Dec 2019 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575538880; x=1607074880;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vcIWt+03DUlhgr4CJP+0Wjo4R9++CzbaMbjN0na7A5I=;
 b=gMPu/YZjc8P0IlAVsZ+SXnLryGmrwtqML2k8A6j6Muz5Tn/fLjYWGdPm
 W5BIRGgbfwpqyBPUv1skKgDzoyWNegr3/xd55bZmUEKp+RfYDm92UoA5I
 V33zoCQVfhrdBog5ieADs7m6/GDrBywpl/m/en52GWXY5x90fVTAgVuZs o=;
IronPort-SDR: OBX4Foh94w1Dse95IROwCqKRRmvNzcd1QfCCewQ1kGKCA2nG/mTS4hNc9PBz/9MFmC9KUGYU00
 /P90p8cR9txg==
X-IronPort-AV: E=Sophos;i="5.69,280,1571702400"; 
   d="scan'208";a="7182122"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 05 Dec 2019 09:41:19 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS
 id B6471A1EBE; Thu,  5 Dec 2019 09:41:17 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 09:41:16 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 09:41:16 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Thu, 5 Dec 2019 09:41:16 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Topic: [PATCH v4 0/9] Add alternative API for Xen PTEs
Thread-Index: AQHVq0xxroTQx3memk2uPVDKAnsvMqerSa2A
Date: Thu, 5 Dec 2019 09:41:15 +0000
Message-ID: <16bdd981299ef440eacd38df92f3fd76e7a13521.camel@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
 <b6c93e86-0b3a-2b39-4e06-6c888191df12@suse.com>
In-Reply-To: <b6c93e86-0b3a-2b39-4e06-6c888191df12@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.177]
Content-ID: <55AE6188DB5FDB49B4BBD76716FC535D@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 0/9] Add alternative API for Xen PTEs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBoYXZlIGFkZHJlc3NlZCB0aGUgY29tbWVudHMgdGhhdCBJIGNhbiBmaW5kIGluIHRoZSBhcmNo
aXZlLiBTb21lIGJpZw0KZGViYXRlcyAobGlrZSBfbmV3IG9yIG5vdCBfbmV3LCB3aGV0aGVyIHRv
IG1vZHVsYXJpc2UgbWFwX3BhZ2VzX3RvX3hlbikNCmhhdmUgbm90IGJlZW4gdG91Y2hlZC4gVmFy
aW91cyBhY2tlZC1ieSBhbmQgcmV2aWV3ZWQtYnkgYWRkZWQuDQoNCkhvbmd5YW4NCg0KT24gVGh1
LCAyMDE5LTEyLTA1IGF0IDEwOjE0ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDQu
MTIuMjAxOSAxODoxMCwgSG9uZ3lhbiBYaWEgd3JvdGU6DQo+ID4gTk9URTogTXkgZW1haWwgYWRk
cmVzcyBoYXMgY2hhbmdlZCBkdWUgdG8gc29tZSBIUiBtYW5hZ2VtZW50LiBJDQo+ID4gaGF2ZQ0K
PiA+IGxvc3QgYWxsIG15IHByZXZpb3VzIGVtYWlscyBhbmQgSSBjb3VsZCBvbmx5IHNhbHZhZ2Ug
c29tZSBvZiB0aGUNCj4gPiBjb21tZW50cyB0byB2MyBmcm9tIHRoZSBtYWlsaW5nIGxpc3QgYXJj
aGl2ZS4gSSB3aWxsIHJlcGx5IHRvIHRoZQ0KPiA+IGNvbW1lbnRzIGZyb20gdjMgaW4gdGhpcyB2
NCBzZXJpZXMuDQo+IA0KPiBJJ20gYWZyYWlkIHRoaXMgaXNuJ3QgdmVyeSBoZWxwZnVsLiBJbiBw
YXJ0aWN1bGFyLCBkb2VzIHRoaXMgbWVhbg0KPiB2NCBpcyBlZmZlY3RpdmVseSB2MywgaS5lLiBu
byByZXZpZXcgY29tbWVudHMgdGFrZW4gY2FyZSBvZj8gT3INCj4ganVzdCBzb21lIG9mIHRoZW0s
IGFuZCBvdGhlcnMgbGVmdCBvdXQ/IEknbSBub3QgZmFuY3lpbmcgcmUtDQo+IHJldmlld2luZyBh
IHZlcnNpb24gdGhhdCBkb2Vzbid0IGhhdmUgcHJpb3IgY29tbWVudHMgdGFrZW4gY2FyZQ0KPiBv
Zi4gUGxlYXNlIGNsYXJpZnkuDQo+IA0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
