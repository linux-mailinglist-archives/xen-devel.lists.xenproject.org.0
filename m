Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F7DEE3E2
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 16:33:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iReK5-0008CK-7q; Mon, 04 Nov 2019 15:31:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kevs=Y4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iReK4-0008CF-7Y
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 15:31:16 +0000
X-Inumbo-ID: 236b6ff4-ff18-11e9-b678-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 236b6ff4-ff18-11e9-b678-bc764e2007e4;
 Mon, 04 Nov 2019 15:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572881476;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5c9b6BpZqw4b8vTyf7zvMZbbvzDGOH9EzGKprkMJx3s=;
 b=GhS6y4c7CgA1Xc0/5T5P3sdcEnrE3hnB1RaoWAGfjMr2z/okzRMulxHH
 tOYuigB5yVuqLL2+EynktU3yit17jT+ThPoatWPjfdZRHcN9uGtUkIOJj
 odBT+VdzOOz4P1goZp9OHX5GZZ2kpzL/4UKwaDmfN1nYE6v8jFMDNkrRp M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: S/whVqIPl6IdTL6I0zfE40AxudkF3cw36CgjtKsUy3uk2DxJ035fvoLDFJ5lbRow8Sxbs7aKnX
 /orX5L1eLbtrjuWnK+bUZstxWfvv9jY7QCrcWAZkzD91zx+JCiGG9kKvsqQuqyeWCpLSSOojhQ
 pTvwG7x7uULONJtZlixU4xyEgkMftqZxlfTV2BoaiPgJaYq3wsiRyJYv3JKQo14Nv3V3JYvkMg
 jSBZvmX9CTIbvRlHxLo70GVzN7ZB7G+W6JkNPch2YCIG1JBA+Ozpyqtz96ciHhfKR1e1qD/PlH
 /hc=
X-SBRS: 2.7
X-MesageID: 7811082
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,267,1569297600"; 
   d="scan'208";a="7811082"
To: Jan Beulich <jbeulich@suse.com>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
 <20191101202502.31750-3-andrew.cooper3@citrix.com>
 <6eedb8a2-4c12-c615-edf5-abbe19c278f1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c5ce9c59-e608-459c-5c1b-19f5f0225d21@citrix.com>
Date: Mon, 4 Nov 2019 15:31:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6eedb8a2-4c12-c615-edf5-abbe19c278f1@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/3] x86/boot: Cache cpu_has_hypervisor very
 early on boot
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTEvMjAxOSAxMzozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDEuMTEuMjAxOSAy
MToyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvaGVh
ZC5TCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwo+PiBAQCAtNjMwLDYgKzYzMCwx
MCBAQCB0cmFtcG9saW5lX3NldHVwOgo+PiAgCj4+ICAxOgo+PiAgICAgICAgICAvKiBJbnRlcnJv
Z2F0ZSBDUFUgZXh0ZW5kZWQgZmVhdHVyZXMgdmlhIENQVUlELiAqLwo+PiArICAgICAgICBtb3Yg
ICAgICQxLCAlZWF4Cj4+ICsgICAgICAgIGNwdWlkCj4+ICsgICAgICAgIG1vdiAgICAgJWVjeCwg
c3ltX2ZzKGJvb3RfY3B1X2RhdGEpICsgQ1BVSU5GT19GRUFUVVJFX09GRlNFVChYODZfRkVBVFVS
RV9IWVBFUlZJU09SKQo+IEkgdW5kZXJzdGFuZCB0aGUgRUNYIG91dHB1dCBpcyBhbGwgd2UgbmVl
ZCByaWdodCBub3cuIEJ1dCB3b3VsZG4ndAo+IGl0IGJlIGJldHRlciB0byB0aGVuIHN0b3JlIEVE
WCBhcyB3ZWxsIChhbmQgc2ltaWxhcmx5IEVDWCBvZgo+IDB4ODAwMDAwMDEgb3V0cHV0KT8KCk5v
IC0gSSBkb24ndCB0aGluayBzby4KCkkgZGlkIGRlYmF0ZSBhcHBseWluZyBhbiBhbmQgbWFzayBm
b3IgdGhlIGZlYXR1cmVzIHdlIG9ubHkgaW50ZW5kIHRvIGJlCnVzYWJsZSB0aGlzIGVhcmx5LCB0
byBhdm9pZCBnZXR0aW5nIGJ1Z2d5IGNvZGUgd2hpY2ggY2hlY2tzIGZvcgp1bmV4cGVjdGVkIGZl
YXR1cmVzIHRoaXMgZWFybHkuCgo+IEFsc28sIGFsb25nIHRoZSBsaW5lcyBvZiBhIHF1ZXN0aW9u
IGJhY2sgdG8gU2VyZ2V5IG9uIGhpcwo+IHN0YW5kYWxvbmUgcGF0Y2gsIHdvdWxkbid0IGl0IGJl
IGJldHRlciB0byB0YWtlIHRoZSBvcHBvcnR1bml0eQo+IGFuZCBjaGVjayBoZXJlIHRoYXQgQ1BV
SUQgbGVhZiAxIGlzIGFjdHVhbGx5IHZhbGlkPwoKVGhlcmUgaXMgbm8gc3VjaCB0aGluZyBhcyBh
IDY0LWJpdCBjYXBhYmxlIENQVSB3aXRob3V0IGxlYWYgMS4KCj4gT2YgY291cnNlIHRoZSBxdWVz
dGlvbiBvbiB0aGUgKGludGVuZGVkKSBlZmZlY3Qgb2YKPiAiY3B1aWQ9bm8taHlwZXJ2aXNvciIg
YWxzbyByZW1haW5zLiBBcyBzYWlkIGJlZm9yZSwgSSB0aGluayB0aGlzCj4gc2hvdWxkIGJlIGhv
bm9yZWQgYnkgYWxsIG9mIG91ciBjb2RlIHRoYXQgcG9zc2libHkgY2FuIChpLmUuIGF0Cj4gbGVh
c3QgZXZlcnl0aGluZyBmb2xsb3dpbmcgY29tbWFuZCBsaW5lIHBhcnNpbmcpLgoKVGhlcmUgaXMg
bm8gY2hhbmNlIG9mIG1ha2luZyB0aGF0IHdvcmsgaW4gYSBzYW5lIHdheSAtIHdlIHVzZQpjcHVf
aGFzX2h5cGVydmlzb3IgZm9yIHF1aXRlIGEgZmV3IHRoaW5ncyBiZWZvcmUgdGhlIGNvbW1hbmQg
bGluZSBnZXRzCnBhcnNlZC4KCklmIHlvdSdyZSBib290aW5nIHVuZGVyIGEgaHlwZXJ2aXNvciwg
eW91ciBoeXBlcnZpc29yIG91Z2h0IHRvIGhhdmUgYQp3YXkgdG8gdHVybiB0aGF0IG9mZi4KCn5B
bmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
