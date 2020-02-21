Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92861168586
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 18:49:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5COM-0000MX-95; Fri, 21 Feb 2020 17:47:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hh41=4J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j5COK-0000Ln-8r
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 17:47:08 +0000
X-Inumbo-ID: 2d3a8370-54d2-11ea-bc8e-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d3a8370-54d2-11ea-bc8e-bc764e2007e4;
 Fri, 21 Feb 2020 17:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582307226;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hVN4k1F6h5z+jFezB5fLHkT08UcvZkEriTDSL330ETY=;
 b=hgyGZWrooxpXW6LGeAcL5df4nMe0rmgne3YEMzBDjxoMubMxZqvr/A7H
 eiDdZtQNTycdeKmXyeKGe4a+oSoH7d6Z93U2oZvfh9ksUdagDxE5Sstnt
 faWByuP0pjzrfA2ep+viUpRhrNtluiJvepJkU83YJApv46uv6a7Q9NiZY 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JBmE4iUeYnB1pXOJ7qXHwhg9RgOpgB7Tk2Fz5bDC2Ck0acx/v2dkCuAbSGX7jJ54XtNf1oDNco
 zVeXW7oSAZLeUZEyn7hDfP62ZXynsnJuMvuoT8CbK3aFoXhXXlyXu+jA+k+FSVWAExvvmvC9rC
 LF/WWojlAdKkjvJBmqREuJSixHlwgpUHFp1P5vXd3tXzhzA20OPBJ8mRI4G53GP23J0YOYqM2r
 rG+DMG6P8l1TNt9Hnl0q8C20zbmFxm7bQ8vZCBtuu/TDbdzSZRT8R1dWoLqI6HIgryC96K8Rh5
 FQ0=
X-SBRS: 2.7
X-MesageID: 13188723
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,469,1574139600"; d="scan'208";a="13188723"
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1581362050.git.tamas.lengyel@intel.com>
 <0f7d636910c45e9ca32fda4ef864a9b7d6e32745.1581362050.git.tamas.lengyel@intel.com>
 <fa70f8c7-a822-b9de-0af6-c9fb2835c664@citrix.com>
 <CABfawh=g7OXetqAgA9rtu0gL0PB6bkg4U-e_raXrvS11X_+gBA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <24288f4e-36da-f701-9709-ca3acc1f815a@citrix.com>
Date: Fri, 21 Feb 2020 17:47:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CABfawh=g7OXetqAgA9rtu0gL0PB6bkg4U-e_raXrvS11X_+gBA@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v8 3/5] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEvMDIvMjAyMCAxNzowNywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIEZyaSwgRmVi
IDIxLCAyMDIwIGF0IDc6NDIgQU0gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gd3JvdGU6Cj4+IE9uIDEwLzAyLzIwMjAgMTk6MjEsIFRhbWFzIEsgTGVuZ3llbCB3cm90
ZToKPj4+ICtzdGF0aWMgaW50IG1lbV9zaGFyaW5nX2Zvcmsoc3RydWN0IGRvbWFpbiAqZCwgc3Ry
dWN0IGRvbWFpbiAqY2QpCj4+PiArewo+Pj4gKyAgICBpbnQgcmMgPSAtRUlOVkFMOwo+Pj4gKwo+
Pj4gKyAgICBpZiAoICFjZC0+Y29udHJvbGxlcl9wYXVzZV9jb3VudCApCj4+PiArICAgICAgICBy
ZXR1cm4gcmM7Cj4+PiArCj4+PiArICAgIC8qCj4+PiArICAgICAqIFdlIG9ubHkgd2FudCB0byBn
ZXQgYW5kIHBhdXNlIHRoZSBwYXJlbnQgb25jZSwgbm90IGVhY2ggdGltZSB0aGlzCj4+PiArICAg
ICAqIG9wZXJhdGlvbiBpcyByZXN0YXJ0ZWQgZHVlIHRvIHByZWVtcHRpb24uCj4+PiArICAgICAq
Lwo+Pj4gKyAgICBpZiAoICFjZC0+cGFyZW50X3BhdXNlZCApCj4+PiArICAgIHsKPj4+ICsgICAg
ICAgIEFTU0VSVChnZXRfZG9tYWluKGQpKTsKPj4+ICsgICAgICAgIGRvbWFpbl9wYXVzZShkKTsK
Pj4+ICsKPj4+ICsgICAgICAgIGNkLT5wYXJlbnRfcGF1c2VkID0gdHJ1ZTsKPj4+ICsgICAgICAg
IGNkLT5tYXhfcGFnZXMgPSBkLT5tYXhfcGFnZXM7Cj4+PiArICAgICAgICBjZC0+bWF4X3ZjcHVz
ID0gZC0+bWF4X3ZjcHVzOwo+PiBTb3JyeSwgSSBzcG9rZSB0b28gc29vbi4gIFlvdSBjYW4ndCBt
b2RpZnkgbWF4X3ZjcHVzIGhlcmUsIGJlY2F1c2UgaXQKPj4gdmlvbGF0ZXMgdGhlIGludmFyaWFu
dCB0aGF0IGRvbWFpbl92Y3B1KCkgZGVwZW5kcyB1cG9uIGZvciBzYWZldHkuCj4+Cj4+IElmIHRo
ZSB0b29sc3RhY2sgZ2V0cyB0aGluZ3Mgd3JvbmcsIFhlbiB3aWxsIGVpdGhlciBsZWFrIHN0cnVj
dCB2Y3B1J3MKPj4gb24gY2QncyB0ZWFyZG93biwgb3IgY29ycnVwdCBtZW1vcnkgYmV5b25kIHRo
ZSBlbmQgb2YgdGhlIGNkLT52Y3B1W10gYXJyYXkuCj4+Cj4+IExvb2tpbmcgYXQgdGhlIGh5cGVy
Y2FsbCBzZW1hbnRpY3MsIHVzZXJzcGFjZSBjcmVhdGVzIGEgbmV3IGRvbWFpbgo+PiAod2hpY2gg
c3BlY2lmaWVzIG1heF9jcHVzKSwgdGhlbiBjYWxscyBtZW1fc2hhcmluZ19mb3JrKHBhcmVudF9k
b20sCj4+IG5ld19kb20pOyAgRm9ya2luZyBzaG91bGQgYmUgcmVqZWN0ZWQgaWYgdG9vbHN0YWNr
IGhhc24ndCBjaG9zZW4gdGhlCj4+IHNhbWUgbnVtYmVyIG9mIHZjcHVzIGZvciB0aGUgbmV3IGRv
bWFpbi4KPiBUaGF0J3MgdW5mb3J0dW5hdGUgc2luY2UgdGhpcyB3b3VsZCByZXF1aXJlIGFuIGV4
dHJhIGh5cGVyY2FsbCBqdXN0IHRvCj4gZ2V0IGluZm9ybWF0aW9uIFhlbiBhbHJlYWR5IGhhcy4g
SSB0aGluayBpbnN0ZWFkIG9mIHdoYXQgeW91IHJlY29tbWVuZAo+IHdoYXQgSSdsbCBkbyBpcyBl
eHRlbmQgWEVOX0RPTUNUTF9jcmVhdGVkb21haW4gdG8gaW5jbHVkZSB0aGUgcGFyZW50Cj4gZG9t
YWluJ3MgSUQgYWxyZWFkeSBzbyBYZW4gY2FuIGdhdGhlciB0aGVzZSBpbmZvcm1hdGlvbiBhdXRv
bWF0aWNhbGx5Cj4gd2l0aG91dCB0aGUgdG9vbHN0YWNrIGhhdmluZyB0byBkbyBpdCB0aGlzIHJv
dW5kYWJvdXQgd2F5LgoKQ29uY2VwdHVhbGx5LCBJIHRoaW5rIHRoYXQgaXMgY2xlYW5lci7CoCBZ
b3UgcmVhbGx5IGRvIHdhbnQgdG8gZHVwbGljYXRlCnRoZSBwYXJlbnQgZG9tYWluLCB3aGF0ZXZl
ciBpdHMgc2V0dGluZ3MgYXJlLgoKSG93ZXZlciwgSSdkIHN1Z2dlc3Qgbm90IGV4dGVuZGluZyBj
cmVhdGVkb21haW4uwqAgV2hhdCBzaG91bGQgdGhlCnNlbWFudGljcyBiZSBmb3Igc3VjaCBhIGNh
bGwgd2hpY2ggcGFzc2VzIGNvbmZsaWN0aW5nIHNldHRpbmdzPwoKSG93IGFib3V0IGEgbmV3IHRv
cCBsZXZlbCBkb21jdGwgZm9yIGNsb25lX2RvbWFpbiwgdGFraW5nIGEgcGFyZW50CmRvbWFpbiBp
ZGVudGlmaWVyLCBhbmQgb3B0aW9uYWxseSBwcm92aWRpbmcgYSBzcGVjaWZpYyBuZXcgZG9taWQ/
wqAgVGhpcwp3YXksIGl0IGlzIGltcG9zc2libGUgdG8gcHJvdmlkZSBjb25mbGljdGluZyBzZXR0
aW5ncywgYW5kIHRoZSBzZW1hbnRpY3MKc2hvdWxkIGJlIHF1aXRlIGNsZWFyLsKgIEludGVybmFs
bHksIFhlbiBjYW4gZG8gd2hhdGV2ZXIgaXQgbmVlZHMgdG8gY29weQphcHByb3ByaWF0ZSBzZXR0
aW5ncywgYW5kIGdldCB0aGluZ3Mgc29ydGVkIGJlZm9yZSB0aGUgZG9tYWluIGJlY29tZXMKZ2xv
YmFsbHkgdmlzaWJsZS4KCk9uZSBxdWVzdGlvbiBuZWVkaW5nIGNvbnNpZGVyaW5nIGlzIHdoZXRo
ZXIgc3VjaCBhIGh5cGVyY2FsbCBjb3VsZCBpbgp0aGVvcnkgYmUgdXNlZnVsIHdpdGhvdXQgdGhl
IG1lbV9zaGFyaW5nIGluZnJhc3RydWN0dXJlLCBvciBub3QuwqAgKGkuZS4KaG93IHRpZ2h0bHkg
aW50ZWdyYXRlZCB3ZSBzaG91bGQgYWltIGZvci4pCgo+PiBUaGlzIHJhaXNlcyB0aGUgcXVlc3Rp
b24gb2Ygd2hldGhlciB0aGUgc2FtZSBzaG91bGQgYmUgdHJ1ZSBmb3IKPj4gbWF4X3BhZ2VzIGFz
IHdlbGwuCj4gQ291bGQgeW91IGV4cGFuZCBvbiB0aGlzPwoKV2VsbCAtIHRoZXNlIHR3byBhcmUg
YSB2ZXJ5IG9kZCBzdWJzZXQgb2YgdGhpbmdzIHRvIGJsaW5kbHkgY29weS7CoCBUaGUKbWF4X2Nw
dXMgc2lkZSBpcyB3cm9uZywgd2hpY2ggbWFrZXMgbWF4X3BhZ2VzIGxpa2VseSB0byBiZSB3cm9u
ZyBhcyB3ZWxsLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
