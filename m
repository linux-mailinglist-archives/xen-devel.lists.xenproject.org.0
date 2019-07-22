Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 302F470B9E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:40:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpfzo-0001js-UO; Mon, 22 Jul 2019 21:37:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pI0n=VT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hpfzm-0001jn-UF
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:37:22 +0000
X-Inumbo-ID: e1212a72-acc8-11e9-8498-87ded824a6f5
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1212a72-acc8-11e9-8498-87ded824a6f5;
 Mon, 22 Jul 2019 21:37:18 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Sg1GbwoyZ2MOAfuOe4r6fWrZUoPeuZPjvysNwWn+cZVVbzf1+Vcm9ppbFwx5S8qd6aNoHLQIhi
 Q2DErUB2sqW1TZF9zG9FVgOg1Bt3naG3/z9Vh6AbCCLchOppEWiJsoai5X0WQv6mdn0U89TRK7
 x3/Lf3PIzdtgxKC5fISwmZPTLI/1okbrJzWqikNKTUbZlH1veLrRrC6wRCQ7RXBCUdYwk4IRas
 99/Ff5kv0VgRGQx2X2sq5FGjL2jse4uWK6wMtCAWRxMBlGTQe/+RJS0a+8bNuSfWoKyroWTQ+H
 UWU=
X-SBRS: 2.7
X-MesageID: 3285645
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,296,1559534400"; 
   d="scan'208";a="3285645"
To: Stefano Stabellini <sstabellini@kernel.org>, <jgross@suse.com>
References: <alpine.DEB.2.21.1907221341080.31177@sstabellini-ThinkPad-T480s>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <32ddfaac-9f7b-bdfc-1ef4-bde1879e57c8@citrix.com>
Date: Mon, 22 Jul 2019 22:37:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907221341080.31177@sstabellini-ThinkPad-T480s>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG?] limit too low in privcmd-buf.c
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 206497@studenti.unimore.it, marco.solieri@unimore.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMDcvMjAxOSAyMjoyMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IEhpIEp1ZXJn
ZW4sCj4KPiBXZSBhcmUgd29ya2luZyBvbiBhIHRlY2hub2xvZ3kgdG8gbGltaXQgY2FjaGUgaW50
ZXJmZXJlbmNlIGJldHdlZW4KPiBndWVzdHMgcnVubmluZyBvbiB0aGUgc2FtZSBTb0MuIEl0IHdv
cmtzIHdlbGwsIGJ1dCBhcyBhIGNvbnNlcXVlbmNlLCBhbGwKPiBtZW1vcnkgYWxsb2NhdGlvbnMg
YXJlIDRLIG9ubHk6IGhpZ2hlciBncmFudWxhcml0aWVzICgyTSwgMUcpIGRvIG5vdAo+IHdvcmsg
YXQgYWxsLgo+Cj4gT25lIG9mIHRoZSBpc3N1ZXMgSSBhbSBzZWVpbmcgYWZ0ZXIgdXBncmFkaW5n
IGRvbTAga2VybmVsIGlzIHRoYXQgdGhlCj4gbGltaXQgaW4gcHJpdmNtZC1idWYuYywgd2hpY2gg
aXMgNjQsIGlzIHRvbyBsb3cuICAoUHJldmlvdXNseSBJIHdhcwo+IHVzaW5nIGFuIG9sZCBrZXJu
ZWwgd2l0aG91dCBwcml2Y21kLWJ1Zi5jLikgVGhlIGlzc3VlIGlzIHRoYXQgSSBjYW5ub3QKPiBz
dGFydCBhIGd1ZXN0IG9mIDEyOE1CIGJlY2F1c2UgbW1hcCByZXR1cm5zIGFuIGVycm9yLCBzcGVj
aWZpY2FsbHkgdGhlCj4gZm9sbG93aW5nIGNoZWNrIGluIHByaXZjbWRfYnVmX21tYXA6cHJpdmNt
ZF9idWZfbW1hcCBmYWlsczoKPgo+ICAgICAgICAgaWYgKCEodm1hLT52bV9mbGFncyAmIFZNX1NI
QVJFRCkgfHwgY291bnQgPiBsaW1pdCB8fAo+ICAgICAgICAgICAgIGZpbGVfcHJpdi0+YWxsb2Nh
dGVkICsgY291bnQgPiBsaW1pdCkKPiAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+IFRo
ZSBjaGVjayB0byBmYWlsIGlzICJmaWxlX3ByaXYtPmFsbG9jYXRlZCArIGNvdW50ID4gbGltaXQi
Lgo+Cj4gSW4gbXkgdGVzdHMsIGxpbWl0IG5lZWRzIHRvIGJlIHJvdWdobHkgc2ltaWxhciB0byB0
aGUgYW1vdW50IG9mIE1CIG9mCj4gZ3Vlc3QgUkFNIGdpdmVuIHRvIHRoZSBndWVzdC4gRm9yIGV4
YW1wbGUsIHdlIHdhbnQgYSBsaW1pdCBvZiA1MTIgdG8gYmUKPiBhYmxlIHRvIHN0YXJ0IGEgZ3Vl
c3Qgd2l0aCA1MTJNQiBvZiBSQU0uCj4KPiBGb3IgdGhlIG1vbWVudCwgSSBzb2x2ZWQgdGhlIHBy
b2JsZW0gc2ltcGx5IGJ5IGluY3JlYXNpbmcgdGhlIGxpbWl0Lgo+IEhvd2V2ZXIsIEkgZG9uJ3Qg
a25vdyBmb3Igc3VyZSB3aGF0IHRoZSByaWdodCBsaW1pdCB3b3VsZCBiZSBhbmQgd2hldGhlcgo+
IGl0IGlzIHRoZSByaWdodCB3YXkgdG8gc29sdmUgdGhlIHByb2JsZW0uCj4KPiBEbyB5b3UgaGF2
ZSBhbnkgc3VnZ2VzdGlvbnM/CgpUaGF0IGxpbWl0IHdhcyByZW1vdmVkIHNob3J0bHkgYWZ0ZXJ3
YXJkcyAoaXQgcmVncmVzc2VkIG1pZ3JhdGluZyBvZgptZWRpdW0gc2l6ZWQgVk1zKSwgYW5kIHJl
YWxseSBvdWdodCB0byBoYXZlIGhpdCBzdGFibGUgYnkgbm93Li4uCgp+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
