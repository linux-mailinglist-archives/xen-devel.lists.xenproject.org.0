Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B341131B2
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 19:03:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icYy4-0000dq-19; Wed, 04 Dec 2019 18:01:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQYo=Z2=amazon.com=prvs=234ed30ac=hongyxia@srs-us1.protection.inumbo.net>)
 id 1icYy2-0000dk-Ei
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 18:01:38 +0000
X-Inumbo-ID: 1d9baaf2-16c0-11ea-aea8-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d9baaf2-16c0-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 18:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575482498; x=1607018498;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gaIku/HxJbx5B4wKSvl+muh3KQE+Z8krxs5VUzL1fT0=;
 b=f7mMAT8WeVS7BseVFusGmgYHq8wrQ32c+pRW8Jq6WkPj2TRrJ5IRCuKI
 Z7MKknKtLT4I80wyqTp8C8uR1EBlsi4h1y6WARIv0hliWfCl6UgLzGkJe
 bd/mqOs3V8yjnHBa/VGvcjFVerJrxpLzH+P/toi9icFKEp/qfNsreoKTU I=;
IronPort-SDR: BkB1bq/GNoA5vW0PoeU7QG/GubNXoYLFa4xFTRP22jl2aYa+W6tIt53g/WaLlmcrgs6b8eIuLC
 12+X+0FVFF0A==
X-IronPort-AV: E=Sophos;i="5.69,278,1571702400"; 
   d="scan'208";a="3233996"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 04 Dec 2019 18:01:24 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 94461A1DD1; Wed,  4 Dec 2019 18:01:22 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 18:01:21 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 18:01:20 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Wed, 4 Dec 2019 18:01:20 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v4 3/9] x86/mm: introduce l{1, 2}t local
 variables to map_pages_to_xen
Thread-Index: AQHVqsZDk+kwyHtHE0WI6CgFUEIr56eqRByA
Date: Wed, 4 Dec 2019 18:01:20 +0000
Message-ID: <a037f9b1d5881214ec17c2b68316dc8fd0d1c36b.camel@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
 <032b7288fc1606a68dc18cf5709c83540717f38a.1575477921.git.hongyxia@amazon.com>
In-Reply-To: <032b7288fc1606a68dc18cf5709c83540717f38a.1575477921.git.hongyxia@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.185]
Content-ID: <0355AC283ED25646B3DF68C0703D5D1B@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 3/9] x86/mm: introduce l{1,
 2}t local variables to map_pages_to_xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4gQEAgLTUyNzIsNiArNTI3OSw3IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKA0KPj4gICAgICAg
ICAgICAgICAgICAgICAgKCgxdSA8PCBQQUdFVEFCTEVfT1JERVIpIC0gMSkpID09IDApKSApDQo+
PiAgICAgICAgICAgICAgew0KPj4gICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGJhc2Vf
bWZuOw0KPj4gKyAgICAgICAgICAgICAgICBsMV9wZ2VudHJ5X3QgKmwxdDsNCj4NCj4gY29uc3Qs
IGFzIHRoaXMgbG9va3MgdG8gYmUgdXNlZCBmb3IgbG9va3VwIG9ubHk/DQoNCkkgY2Fubm90IGRv
IHRoaXMgZm9yIG5vdyBzaW5jZSB2YXJpYWJsZXMgbGlrZSBsMXQgYXJlIHN0aWxsIHVzaW5nIHRo
ZQ0Kb2xkIEFQSSB3aGljaCBpcyBub24tY29uc3QuIEkgY2FuIGNoYW5nZSBpdCBvbmNlIHRoZXkg
YXJlIHN3aXRjaGVkIHRvDQp0aGUgbmV3IGNvbnN0IEFQSSBpbiBsYXRlciBwYXRjaGVzLg0KDQpI
b25neWFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
