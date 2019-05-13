Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 955C31B766
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 15:51:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBJk-0004Rh-WA; Mon, 13 May 2019 13:48:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KEM8=TN=citrix.com=prvs=029c3005f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQBJj-0004RY-SP
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:48:35 +0000
X-Inumbo-ID: ccb1cd9d-7585-11e9-8980-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ccb1cd9d-7585-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 13:48:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="89708470"
Date: Mon, 13 May 2019 15:48:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190513134821.pomwew6vmtibxvem@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
 <5CD2D563020000780022CD40@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CD2D563020000780022CD40@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 07/12] x86/IRQ: fix locking around vector
 management
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDc6MTA6NTlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQWxsIG9mIF9fe2Fzc2lnbixiaW5kLGNsZWFyfV9pcnFfdmVjdG9yKCkgbWFuaXB1bGF0
ZSBzdHJ1Y3QgaXJxX2Rlc2MKPiBmaWVsZHMsIGFuZCBoZW5jZSBvdWdodCB0byBiZSBjYWxsZWQg
d2l0aCB0aGUgZGVzY3JpcHRvciBsb2NrIGhlbGQgaW4KPiBhZGRpdGlvbiB0byB2ZWN0b3JfbG9j
ay4gVGhpcyBpcyBjdXJyZW50bHkgdGhlIGNhc2UgZm9yIG9ubHkKPiBzZXRfZGVzY19hZmZpbml0
eSgpIChpbiB0aGUgY29tbW9uIGNhc2UpIGFuZCBkZXN0cm95X2lycSgpLCB3aGljaCBhbHNvCj4g
Y2xhcmlmaWVzIHdoYXQgdGhlIG5lc3RpbmcgYmVoYXZpb3IgYmV0d2VlbiB0aGUgbG9ja3MgaGFz
IHRvIGJlLgo+IFJlZmxlY3QgdGhlIG5ldyBleHBlY3RhdGlvbiBieSBoYXZpbmcgdGhlc2UgZnVu
Y3Rpb25zIGFsbCB0YWtlIGEKPiBkZXNjcmlwdG9yIGFzIHBhcmFtZXRlciBpbnN0ZWFkIG9mIGFu
IGludGVycnVwdCBudW1iZXIuCj4gCj4gQWxzbyB0YWtlIGNhcmUgb2YgdGhlIHR3byBzcGVjaWFs
IGNhc2VzIG9mIGNhbGxzIHRvIHNldF9kZXNjX2FmZmluaXR5KCk6Cj4gc2V0X2lvYXBpY19hZmZp
bml0eV9pcnEoKSBhbmQgVlQtZCdzIGRtYV9tc2lfc2V0X2FmZmluaXR5KCkgZ2V0IGNhbGxlZAo+
IGRpcmVjdGx5IGFzIHdlbGwsIGFuZCBpbiB0aGVzZSBjYXNlcyB0aGUgZGVzY3JpcHRvciBsb2Nr
cyBoYWRuJ3QgZ290Cj4gYWNxdWlyZWQgdGlsbCBub3cuIEZvciBzZXRfaW9hcGljX2FmZmluaXR5
X2lycSgpIHRoaXMgbWVhbnMgYWNxdWlyaW5nIC8KPiByZWxlYXNpbmcgb2YgdGhlIElPLUFQSUMg
bG9jayBjYW4gYmUgcGxhaW4gc3Bpbl97LHVufWxvY2soKSB0aGVuLgo+IAo+IERyb3Agb25lIG9m
IHRoZSB0d28gbGVhZGluZyB1bmRlcnNjb3JlcyBmcm9tIGFsbCB0aHJlZSBmdW5jdGlvbnMgYXQK
PiB0aGUgc2FtZSB0aW1lLgo+IAo+IFRoZXJlJ3Mgb25lIGNhc2UgbGVmdCB3aGVyZSBkZXNjcmlw
dG9ycyBnZXQgbWFuaXB1bGF0ZWQgd2l0aCBqdXN0Cj4gdmVjdG9yX2xvY2sgaGVsZDogc2V0dXBf
dmVjdG9yX2lycSgpIGFzc3VtZXMgaXRzIGNhbGxlciB0byBhY3F1aXJlCj4gdmVjdG9yX2xvY2ss
IGFuZCBoZW5jZSBjYW4ndCBpdHNlbGYgYWNxdWlyZSB0aGUgZGVzY3JpcHRvciBsb2NrcyAod3Jv
bmcKPiBsb2NrIG9yZGVyKS4gSSBkb24ndCBjdXJyZW50bHkgc2VlIGhvdyB0byBhZGRyZXNzIHRo
aXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
UmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKPiAt
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+ICsrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gQEAgLTIxMzQsMTEgKzIxMzQsMTYgQEAgc3Rh
dGljIHZvaWQgYWRqdXN0X2lycV9hZmZpbml0eShzdHJ1Y3QgYQo+ICAgICAgdW5zaWduZWQgaW50
IG5vZGUgPSByaHNhID8gcHhtX3RvX25vZGUocmhzYS0+cHJveGltaXR5X2RvbWFpbikKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA6IE5VTUFfTk9fTk9ERTsKPiAgICAgIGNvbnN0IGNw
dW1hc2tfdCAqY3B1bWFzayA9ICZjcHVfb25saW5lX21hcDsKPiArICAgIHN0cnVjdCBpcnFfZGVz
YyAqZGVzYzsKPiAgCj4gICAgICBpZiAoIG5vZGUgPCBNQVhfTlVNTk9ERVMgJiYgbm9kZV9vbmxp
bmUobm9kZSkgJiYKPiAgICAgICAgICAgY3B1bWFza19pbnRlcnNlY3RzKCZub2RlX3RvX2NwdW1h
c2sobm9kZSksIGNwdW1hc2spICkKPiAgICAgICAgICBjcHVtYXNrID0gJm5vZGVfdG9fY3B1bWFz
ayhub2RlKTsKPiAtICAgIGRtYV9tc2lfc2V0X2FmZmluaXR5KGlycV90b19kZXNjKGRyaGQtPmlv
bW11LT5tc2kuaXJxKSwgY3B1bWFzayk7Cj4gKwo+ICsgICAgZGVzYyA9IGlycV90b19kZXNjKGRy
aGQtPmlvbW11LT5tc2kuaXJxKTsKPiArICAgIHNwaW5fbG9ja19pcnEoJmRlc2MtPmxvY2spOwoK
SSB3b3VsZCB1c2UgdGhlIGlycXNhdmUvaXJxcmVzdG9yZSB2YXJpYW50cyBoZXJlIGZvciBleHRy
YSBzYWZldHkuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
