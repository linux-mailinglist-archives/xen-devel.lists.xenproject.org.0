Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9DEA9C13
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 09:40:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5mIq-0002IY-8D; Thu, 05 Sep 2019 07:35:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IWTx=XA=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1i5mIp-0002I1-96
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 07:35:35 +0000
X-Inumbo-ID: bee005c8-cfaf-11e9-978d-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bee005c8-cfaf-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 07:35:34 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.1 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1i5mIk-000247-IK; Thu, 05 Sep 2019 07:35:30 +0000
Date: Thu, 5 Sep 2019 08:35:30 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190905073530.GA5201@deinos.phlegethon.org>
References: <23892a29-60ef-b1e4-9e19-024559e0d2a0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23892a29-60ef-b1e4-9e19-024559e0d2a0@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
Subject: Re: [Xen-devel] [PATCH] x86/shadow: don't enable shadow mode with
 too small a shadow allocation (part 2)
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgMDk6NTUgKzAyMDAgb24gMDQgU2VwICgxNTY3NTkwOTQwKSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gQ29tbWl0IDI2MzRiOTk3YWYgKCJ4ODYvc2hhZG93OiBkb24ndCBlbmFibGUgc2hhZG93IG1v
ZGUgd2l0aCB0b28gc21hbGwKPiBhIHNoYWRvdyBhbGxvY2F0aW9uIikgd2FzIGluY29tcGxldGU6
IFRoZSBhZGp1c3RtZW50IGRvbmUgdGhlcmUgdG8KPiBzaGFkb3dfZW5hYmxlKCkgaXMgYWxzbyBu
ZWVkZWQgaW4gc2hhZG93X29uZV9iaXRfZW5hYmxlKCkuIFRoZSAobmV3KQo+IHByb2JsZW0gcmVw
b3J0IHdhcyAoYXBwYXJlbnRseSkgYSBmYWlsZWQgUFYgZ3Vlc3QgbWlncmF0aW9uIGZvbGxvd2Vk
IGJ5Cj4gYW5vdGhlciBtaWdyYXRpb24gYXR0ZW1wdCBmb3IgdGhhdCBzYW1lIGd1ZXN0LiBEaXNh
YmxpbmcgbG9nLWRpcnR5IG1vZGUKPiBhZnRlciB0aGUgZmlyc3Qgb25lIGhhZCBsZWZ0IGEgY291
cGxlIG9mIHNoYWRvdyBwYWdlcyBhbGxvY2F0ZWQgKHBlcmhhcHMKPiBzb21ldGhpbmcgdGhhdCBh
bHNvIHdhbnRzIGZpeGluZyksIGFuZCBoZW5jZSB0aGUgc2Vjb25kIGVuYWJsaW5nIG9mCj4gbG9n
LWRpcnR5IG1vZGUgd291bGRuJ3QgaGF2ZSBhbGxvY2F0ZWQgYW55dGhpbmcgZnVydGhlci4KPiAK
PiBSZXBvcnRlZC1ieTogSmFtZXMgV2FuZyA8am53YW5nQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBUaW0gRGVlZ2Fu
IDx0aW1AeGVuLm9yZz4KCj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYwo+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMKPiBAQCAtMjg2NCw3ICsyODY0
LDggQEAgc3RhdGljIGludCBzaGFkb3dfb25lX2JpdF9lbmFibGUoc3RydWN0Cj4gIAo+ICAgICAg
bW9kZSB8PSBQR19TSF9lbmFibGU7Cj4gIAo+IC0gICAgaWYgKCBkLT5hcmNoLnBhZ2luZy5zaGFk
b3cudG90YWxfcGFnZXMgPT0gMCApCj4gKyAgICBpZiAoIGQtPmFyY2gucGFnaW5nLnNoYWRvdy50
b3RhbF9wYWdlcyA8Cj4gKyAgICAgICAgIHNoX21pbl9hbGxvY2F0aW9uKGQpICsgZC0+YXJjaC5w
YWdpbmcuc2hhZG93LnAybV9wYWdlcyApCj4gICAgICB7Cj4gICAgICAgICAgLyogSW5pdCB0aGUg
c2hhZG93IG1lbW9yeSBhbGxvY2F0aW9uIGlmIHRoZSB1c2VyIGhhc24ndCBkb25lIHNvICovCj4g
ICAgICAgICAgaWYgKCBzaGFkb3dfc2V0X2FsbG9jYXRpb24oZCwgMSwgTlVMTCkgIT0gMCApCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
