Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97536148651
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 14:45:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuzDe-0005Kk-UK; Fri, 24 Jan 2020 13:41:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qQZd=3N=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iuzDd-0005Kf-5S
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 13:41:53 +0000
X-Inumbo-ID: 41c88f96-3eaf-11ea-aecd-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41c88f96-3eaf-11ea-aecd-bc764e2007e4;
 Fri, 24 Jan 2020 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579873304;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DxI4uRDpzPJejOuW8Pp/aLn8+ir/Bn18KAiMaNfv51A=;
 b=IS/i7d4oE3FG47qqJEUKGIRd+716ii2gb4D9TrUTeDlmvjGPpLr7KPYm
 d8OZqoHWD3Owro9yVSs9NAeVKSri+9RRqtjODEbEpy44ZSiuOHa2swxDG
 4Wcf4d4WC3m6Jy0WZSlEGoFWK6F/7ALDQj075qseLP1u+KNYOgA3T648Q E=;
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
IronPort-SDR: lFP6rPJOKllKh8zaaWEQhfJGzen6D4DMNXeDxEDzLCJeLqM1jZ4WyC+xukaVZqCllOCmqjD5t3
 /Nvyuz4lUnnUpFykTmEGaU2fLAF7PrqfDgqJyffn6TQ284B/m3SYOQMaD6NqcphCasSvdlsCcW
 q7Xc/Dm2fIhmdY1+1MKuCHTwBz8C/GDk/otv2+kUkHUBy86pu6Ab9NXU0BWf9qJXJBs/iy9cHI
 neyRI+c70uBoqBb6bvFuEX0TA4IYfU535/F+vZeky/1PI5r7ZzS1L1fqLN1i1Vqzu8t5MvXoLP
 qwM=
X-SBRS: 2.7
X-MesageID: 11400677
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,357,1574139600"; d="scan'208";a="11400677"
To: Bobby Eshleman <bobbyeshleman@gmail.com>, <xen-devel@lists.xenproject.org>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <abbe5c9f-46e2-af76-a7ff-d98c55fa364f@citrix.com>
Date: Fri, 24 Jan 2020 13:41:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [RFC XEN PATCH 00/23] xen: beginning support for
 RISC-V
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Bobby
 Eshleman <bobby.eshleman@starlab.io>, Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMDEvMjAyMCAwMTo1OCwgQm9iYnkgRXNobGVtYW4gd3JvdGU6Cj4gQ3VycmVudGx5LCB0
aGlzIHBhdGNoc2V0IHJlYWxseSBvbmx5IHNldHMgdXAgdmlydHVhbCBtZW1vcnkgZm9yIFhlbiBh
bmQKPiBpbml0aWFsaXplcyBVQVJUIHRvIGVuYWJsZSBwcmludCBvdXRwdXQuICBOb25lIG9mIFJJ
U0MtVidzCj4gdmlydHVhbGl6YXRpb24gc3VwcG9ydCBoYXMgYmVlbiBpbXBsZW1lbnRlZCB5ZXQs
IGFsdGhvdWdoIHRoYXQgaXMgdGhlCj4gbmV4dCByb2FkIHRvIHN0YXJ0IGdvaW5nIGRvd24uICBN
YW55IGZ1bmN0aW9ucyBvbmx5IGNvbnRhaW4gZHVtbXkKPiBpbXBsZW1lbnRhdGlvbnMuICBNYW55
IHNob3J0Y3V0cyBoYXZlIGJlZW4gdGFrZW4gYW5kIFRPRE8ncyBoYXZlIGJlZW4KPiBsZWZ0IGFj
Y29yZGluZ2x5LiAgSXQgaXMgdmVyeSwgdmVyeSByb3VnaC4gIEJlIGZvcmV3YXJuZWQ6IHlvdSBh
cmUgcXVpdGUKPiBsaWtlbHkgdG8gc2VlIHNvbWUgdW5nYWlubHkgY29kZSBoZXJlIChkZXNwaXRl
IG15IGVmZm9ydHMgdG8gY2xlYW4gaXQgdXAKPiBiZWZvcmUgc2VuZGluZyB0aGlzIHBhdGNoc2V0
IG91dCkuICBNeSBpbnRlbnQgd2l0aCB0aGlzIFJGQyBpcyB0byBhbGlnbgo+IGVhcmx5IGFuZCBn
YXVnZSBpbnRlcmVzdCwgYXMgb3Bwb3NlZCB0byBwcmVzZW50aW5nIGEgdG90YWxseSBjb21wbGV0
ZQo+IHBhdGNoc2V0LgoKSSd2ZSB0YWtlbiBhIHZlcnkgcXVpY2sgbG9vayBvdmVyIHRoZSBzZXJp
ZXMuCgpOb3JtYWxseSwgd2UgcmVxdWlyZSB0aGF0IGFsbCBwYXRjaGVzIGJlIGJpc2VjdGFibGUs
IGFuZCB0aGlzIHNlcmllcyBpcwpub3QgYmVjYXVzZSBvZiB0aGUgTWFrZWZpbGUgY2hhbmdlcyBp
biBwYXRjaCAzIHNwZWNpZnlpbmcgb2JqZWN0IGZpbGVzCndoaWNoIGFyZSBpbnRyb2R1Y2VkIGlu
IHRoZSBmb2xsb3dpbmcgMjAgcGF0Y2hlcy7CoCBPZiBjb3Vyc2UsCmludHJvZHVjaW5nIGEgYnJh
bmQgbmV3IGFyY2hpdGVjdHVyZSBpcyBhIHNwZWNpYWwgY2FzZSwgYnV0IHRoZQpzdWdnZXN0ZWQg
cGxhbiBvZiBnZXR0aW5nIGEgIm1pbmltYWwgYnVpbGQiIHRvZ2V0aGVyIHdpbGwgaGVscCBrZWVw
IHRoZQpzZWNvbmQgcGhhc2Ugb2YgIm1ha2luZyBpdCBib290Ii4KClRvIHN0YXJ0IHdpdGgsIEkn
ZCByZWNvbW1lbmQgYSBoZWFkLlMgd2l0aCBfc3RhcnQ6IGFuZCBhbiBpbmZpbml0ZSBsb29wLAph
bG9uZyB3aXRoIHdoYXRldmVyIG1ha2VmaWxlL2tjb25maWcgaW5mcmFzdHJ1Y3R1cmUgaXMgcmVx
dWlyZWQgdG8gZ2V0IGEKYnVpbGQuCgpXaXRoaW4gdGhhdCBmaXJzdCBwaGFzZSBob3dldmVyLCB0
aGVyZSBhcmUgc29tZSBvYnZpb3VzIHR3ZWFrcyB3ZSBzaG91bGQKbWFrZSB0byBjb21tb24gY29k
ZS7CoCBGb3Igb25lLCB0aGUgZGVidWdnZXJfdHJhcCgpIGluZnJhc3RydWN0dXJlIHJlYWxseQpp
cyB4ODYtc3BlY2lmaWMgKGFuZCBJIGhhdmVuJ3Qgc2VlbiBpdCB1c2VkIGluIGEgZGVjYWRlKSBz
byBzaG91bGQgaGF2ZQppdHMgQVJNIHN0dWJzIGRyb3BwZWQgc28gYXMgbm90IHRvIGJlIGEgYnVy
ZGVuIG9uIG90aGVyIGFyY2hpdGVjdHVyZXMuCgpUaGVyZSBhcmUgb3RoZXIgYXNwZWN0cyAodGhl
IGF0b21pY190IGluZnJhc3RydWN0dXJlKSB3aGVyZSB4ODYgYW5kIEFSTQphbHJlYWR5IGhhdmUg
YmFzaWNhbGx5IGlkZW50aWNhbCBjb3BpZXMgb2YgdGhlIGhlYWRlciBmaWxlLCBhbmQgeW91J3Zl
CnRha2VuIGEgM3JkIGNvcHkuCgpPdGhlciBhcmVhcyB3aGVyZSB5b3UgY2FuIHJlZHVjZSB0aGUg
bWluaW11bSBidWlsZCB3b3VsZCBiZSB0byBwdXQgc29tZQpkZWZhdWx0cyBpbnRvIHRoZSBkZWZj
b25maWcsIHN1Y2ggYXMgZGlzYWJsaW5nIGdyYW50IHRhYmxlcyBhbmQgbWVtCmFjY2Vzcy7CoCBU
aGVyZSBhcmUgYWxtb3N0IGNlcnRhaW5seSBvdGhlcnMgd2hpY2ggd2lsbCBoZWxwLCBzbyBoYXZl
IGEKc2VhcmNoIGFyb3VuZCBtZW51Y29uZmlnLgoKRGlzYWJsaW5nIGdyYW50IHRhYmxlcyBpbiBw
YXJ0aWN1bGFyIHdpbGwgd29yayBhcm91bmQgdGhlIGZhY3QgdGhhdCB0aGUKQVJNIHNuYXBzaG90
IHlvdSBiYXNlZCB5b3VyIHBvcnQgb24gd2FzIHByZS1YU0EtMjk1LCBhbmQgdGhlIGNtcHhjaGcK
bG9vcCBhZ2FpbnN0IGd1ZXN0IG1lbW9yeSBpbiBnbnR0YWJfY2xlYXJfZmxhZ3MoKSBpcyByZWlu
dHJvZHVjaW5nIGEKcHJldmlvdXNseS1maXhlZCBzZWN1cml0eSB2dWxuZXJhYmlsaXR5LgoKU29t
ZSBBUk0taXNtcyB5b3UndmUgaW5oZXJpdGVkIHdvdWxkIGJlIG11Y2ggYmV0dGVyIGlmIHlvdSBk
aWRuJ3QuwqAgSW4KcGFydGljdWxhciwgSSAqcmVhbGx5KiBob3BlIFJJU0MtViBoYXNuJ3QgbWFk
ZSB0aGUgc2FtZSBiYWNrd2FyZHMgbmFtaW5nCmJ1ZyBpbiB0aGVpciBwYWdldGFibGUgbGV2ZWxz
IHdoaWNoIHJlc3VsdHMgaW4ge3NlY29uZCxmaXJzdCx6ZXJvdGh9XyoKZXQgYWwuwqAgSW4geDg2
LCB3ZSBwdXJwb3NlZnVsbHkgY2hvc2Ugbm90IHRvIGZvbGxvdyBJbnRlbCdzIG5hbWluZywgYW5k
Cmluc3RlYWQgd2VudCB3aXRoIEwxLCBMMiwgTDMsIGFuZCBmb3IgNjRiaXQgTDQuCgpBcyBhIGNv
dXBsZSBvZiBnZW5lcmFsIHBvaW50cyBmcm9tIG91ciBjb2Rpbmcgc3R5bGUsIHBsZWFzZSBhdm9p
ZApjb21tZW50ZWQgb3V0IGNvZGUsIGFuZCB5b3UgYXJlIGZyZWUgdG8gb21pdCBicmFjZXMgZm9y
IHNpbmdsZSBzdGF0ZW1lbnQKYmxvY2tzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
