Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16FD98483
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 21:32:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0WI7-0005Ku-0z; Wed, 21 Aug 2019 19:29:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0WI5-0005Kp-Hs
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 19:29:05 +0000
X-Inumbo-ID: ef9a85f6-c449-11e9-8980-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef9a85f6-c449-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 19:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566415744; x=1597951744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=FQFhOuuWMiT8ruaaF0vNlS8j0tyWSQq9JzuoPQCzL8Y=;
 b=MngV81j1k7LDo2VG37nzyqCyzY3b3Urouh3dHF6/jJk/AbcRRoYf0Mnh
 gj++tGc0Dk/45S8SAqb/SKu3cJt/8nkvxBEXgBiHFEVRK43revRRQ/d/b
 +pFrBBUJ/htWG41B+j/7kjo4v0CMjpRtmpBvqT1dOAcZDWmuLnfpwKEFW A=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="416739573"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 21 Aug 2019 19:28:57 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id CF348A1C6B; Wed, 21 Aug 2019 19:28:56 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 19:28:55 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 19:28:55 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Wed, 21 Aug 2019 19:28:55 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Thread-Topic: [PATCH 08/20] livepatch-build: detect special section group sizes
Thread-Index: AQHVV/loHZXN3SIA00Co8NAyPuRT8qcF8oGAgAAK4gA=
Date: Wed, 21 Aug 2019 19:28:54 +0000
Message-ID: <742766A6-BC33-47DC-9DF0-DE9B905F8F1C@amazon.com>
References: <20190821082056.91090-1-wipawel@amazon.de>
 <20190821082056.91090-9-wipawel@amazon.de>
 <9154b48a-4b9c-4a64-3b42-38c58bf866d1@oracle.com>
In-Reply-To: <9154b48a-4b9c-4a64-3b42-38c58bf866d1@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.55]
Content-ID: <69C8D77F64457243B2D30758BDB179AC@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 08/20] livepatch-build: detect special
 section group sizes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIDIxLiBBdWcgMjAxOSwgYXQgMjA6NDksIEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4+ICsgICAgIyBVc2luZyB4ZW4t
c3ltcyBidWlsdCBpbiB0aGUgcHJldmlvdXMgc3RlcCBieSBidWlsZF9mdWxsKCkuDQo+PiArICAg
IFNQRUNJQUxfVkFSUz0kKHJlYWRlbGYgLXdpICIkT1VUUFVUL3hlbi1zeW1zIiB8DQo+IA0KPiBX
aGF0IHZlcnNpb24gb2YgcmVhZGVsZiBzdXBwb3J0cyB0aGlzPyBBc2tpbmcgYXMgaW4gdGhlIHBh
c3QgdGhlcmUgd2VyZSBzb21lIG9wdGlvbnMgd2l0aCBiaW51dGlscyB0aGF0IGhhZCBjb25mbGlj
dGluZyBvcHRpb25zIGFuZCB3ZSBoYWQgdG8gYWRkIHNvbWUgY3VzdG9tIGhhY2tlcnkgY29kZSB0
byBmaWd1cmUgb3V0IHdoaWNoIHBhcmFtZXRlciB0byB1c2UuDQoNCg0KVGhlIHZlcnNpb24gSSB1
c2UgZG9lczogR05VIHJlYWRlbGYgdmVyc2lvbiAyLjIzLjUyLjAuMSAyMDEzMDIyNg0KVGhlIC13
aSBpcyBhIHNob3J0Y3V0IGZvciDigJRkZWJ1Zy1kdW1wPWluZm8uDQpJIGRvIGhvcGUgaXTigJlz
IGEgc3RhbmRhcmQgcmVhZGVsZiBmZWF0dXJlIGJ5IG5vdy4NCg0KQmVzdCBSZWdhcmRzLA0KUGF3
ZWwgV2llY3pvcmtpZXdpY3oKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdt
YkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0
aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBD
aGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUg
Mjg5IDIzNyA4NzkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
