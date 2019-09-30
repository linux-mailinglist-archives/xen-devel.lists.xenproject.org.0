Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D279FC1FDC
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 13:16:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtd1-0000wU-Lg; Mon, 30 Sep 2019 11:14:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=599g=XZ=amazon.de=prvs=169b711c4=wipawel@srs-us1.protection.inumbo.net>)
 id 1iEtd0-0000wK-Bc
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 11:14:06 +0000
X-Inumbo-ID: 6a7bcac6-e373-11e9-bf31-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id 6a7bcac6-e373-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 11:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1569842045; x=1601378045;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=9sLTP157b5GkxaWw+tHJlhpSsM24gZ48JVMxNbMhzm0=;
 b=Baq/rBZktHkeQumnZ3LZa81TODccT/jrRoGbqxUiwqIpsFHc7KWKcdms
 cVREumUIIQoC9CXG3Q1Tq352hFOs6DUFt+Cx8YhD3gLo1S4fgY96mL95i
 omgNnEFeqz8y4aPT+JB7iYtYHdI9yCODpLGma3jWKwttEiOpX8t96MUD6 o=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="424637625"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Sep 2019 11:14:04 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 05FC5A188B; Mon, 30 Sep 2019 11:14:01 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 11:14:01 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 11:14:00 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Mon, 30 Sep 2019 11:14:00 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v4 02/12] livepatch: Allow to override inter-modules
 buildid dependency
Thread-Index: AQHVdg9KHbMzr8zJ+UaxblsyHeoCeadEEdiAgAACWYA=
Date: Mon, 30 Sep 2019 11:14:00 +0000
Message-ID: <BE8CB0AD-C5F0-489A-9234-D0C07C13D0EF@amazon.com>
References: <20190928151305.127380-1-wipawel@amazon.de>
 <20190928151305.127380-3-wipawel@amazon.de>
 <96f675c6-a841-be3a-5388-ed13835d996c@suse.com>
In-Reply-To: <96f675c6-a841-be3a-5388-ed13835d996c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.63]
Content-ID: <FC764BDE186E2F4AB009BE7B2AAB2044@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 02/12] livepatch: Allow to override
 inter-modules buildid dependency
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 RossLagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, "Pohlack, 
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDMwLiBTZXAgMjAxOSwgYXQgMTM6MDUsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4gCj4gT24gMjguMDkuMjAxOSAxNzoxMiwgUGF3ZWwgV2llY3pvcmtpZXdp
Y3ogd3JvdGU6Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAo+PiArKysgYi94
ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKPj4gQEAgLTM1LDcgKzM1LDcgQEAKPj4gI2luY2x1
ZGUgImRvbWN0bC5oIgo+PiAjaW5jbHVkZSAicGh5c2Rldi5oIgo+PiAKPj4gLSNkZWZpbmUgWEVO
X1NZU0NUTF9JTlRFUkZBQ0VfVkVSU0lPTiAweDAwMDAwMDEyCj4+ICsjZGVmaW5lIFhFTl9TWVND
VExfSU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAxMwo+IAo+IE9oLCBJIHNlZS4KPiAKPj4gQEAg
LTk1Niw2ICs5NTYsMTUgQEAgc3RydWN0IHhlbl9zeXNjdGxfbGl2ZXBhdGNoX2FjdGlvbiB7Cj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogaHlwZXJ2aXNv
ciBkZWZhdWx0LiAqLwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIE9yIHVwcGVyIGJvdW5kIG9mIHRpbWUgKG5zKSAqLwo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIGZvciBvcGVyYXRpb24gdG8gdGFrZS4gKi8K
Pj4gKwo+PiArLyoKPj4gKyAqIE92ZXJ3cml0ZSBkZWZhdWx0IGludGVyLW1vZHVsZSBidWlsZGlk
IGRlcGVuZGVuY3kgY2hhaW4gZW5mb3JjZW1lbnQuCj4+ICsgKiBDaGVjayBvbmx5IGlmIG1vZHVs
ZSBpcyBidWlsdCBmb3IgZ2l2ZW4gaHlwZXJ2aXNvciBieSBjb21wYXJpbmcgYnVpbGRpZC4KPj4g
KyAqLwo+PiArI2RlZmluZSBMSVZFUEFUQ0hfQUNUSU9OX0FQUExZX05PREVQUyAoMSA8PCAwKQo+
PiArICAgIHVpbnQ2NF90IGZsYWdzOyAgICAgICAgICAgICAgICAgICAgICAgICAvKiBJTjogYWN0
aW9uIGZsYWdzLiAqLwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAvKiBQcm92aWRlIGFkZGl0aW9uYWwgcGFyYW1ldGVycyAqLwo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBmb3IgYW4gYWN0aW9uLiAqLwo+IAo+
IDY0IGJpdHMgc2VlbXMgcXVpdGUgYSBsb3QgKGFuZCB1bnVzdWFsKSBmb3IgYSBmbGFncyBmaWVs
ZC4gQWxzbywKCldoZW4gSSB1c2UgdWludDMyX3QgZm9yIHRoZSBmbGFncywgSSB3b3VsZCBoYXZl
IHRvIGFsc28gYWRkIGFub3RoZXIKb25lIGZvciBwYWRkaW5nIEkgc3VwcG9zZS4KV2h5IG5vdCBq
dXN0IHVzZSB0aGF0IHNwYWNlIGZvciBmdXR1cmUgZmxhZ3M/IFNvLCBJIGNob3NlIHVpbnQ2NF90
LgoKPiBhcyBhIG5pdCwgZG8geW91IHBlcmhhcHMgbWVhbiAib3ZlcnJpZGUiIGluc3RlYWQgb2Yg
Im92ZXJ3cml0ZSIKPiBpbiB0aGUgY29tbWVudD8KPiAKCkluZGVlZCBJIGRvLiBXaWxsIGZpeCBp
biB2NS4KCj4gSmFuCgpCZXN0IFJlZ2FyZHMsClBhd2VsIFdpZWN6b3JraWV3aWN6CgoKCgoKCkFt
YXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3
IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVy
YnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJC
IDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
