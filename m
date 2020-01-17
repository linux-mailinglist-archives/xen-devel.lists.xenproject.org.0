Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F20C14129D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 22:09:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isYol-0007BB-If; Fri, 17 Jan 2020 21:06:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J6zi=3G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1isYok-0007B6-Lr
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 21:06:10 +0000
X-Inumbo-ID: 2cccba28-396d-11ea-b61d-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cccba28-396d-11ea-b61d-12813bfff9fa;
 Fri, 17 Jan 2020 21:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579295165;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0KMqRUVOCdMyxa4AcxsWBO1GY0fVp5zrtOmrbToMWIE=;
 b=DVQ3M2QSQH8XUYavzMq/xQvGje0LzlT8JwtJZptNxKkDsSmpYmQYoZ2N
 x9n6LZ//WHgbK0RaG2nC9OT81h5lm7QTkBnqBK3XSpm1O6nSD0wFw7g/h
 N98L70C1srOWMgbkS+yXJMMefJFBNETRv5byuwztjZ9IaDY5JmPk/ajf7 Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: B6FKXAd5QYXTopWzDbDk0mCoPgUih6NwykYojqUyDJLaIqFavvJaktFE7NjV7j2+VDERVtHOsO
 hiLrorC0h92q+JtpveBagkLqfY1/AhXO+2m2B5TxVFfKHe68zk3D9tpb9fmY1YB05U7wjdrmEc
 KqyCHVbCj400Izozf7507XP1ClPGKvbCfnhiSx3gY/+WWWq/5ajcefL2iuE4P+MW+J79NoyyfN
 PBnqIn+7VYLhjj7PXYuIW6e1gFYrdkHtOkJvVQxHK5tqP/e5BWyj1LQ+FQltJstq1z+eDvuB8E
 A00=
X-SBRS: 2.7
X-MesageID: 11689766
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,331,1574139600"; d="scan'208";a="11689766"
To: Jan Beulich <jbeulich@suse.com>, Eslam Elnikety <elnikety@amazon.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <d3fb2800517d79a422acc62628ad362f919824ea.1576630344.git.elnikety@amazon.com>
 <eaaffb6f-b2b1-f81e-8643-ccc238914e52@suse.com>
 <8a15bbca-e730-cbf7-2108-b8f0260e846a@amazon.com>
 <4f40b177-f60b-c988-ac99-ef7eef7dfd17@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <06707359-ff8e-7f06-34da-0c9fae46259b@citrix.com>
Date: Fri, 17 Jan 2020 21:05:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4f40b177-f60b-c988-ac99-ef7eef7dfd17@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/microcode: avoid unnecessary
 xmalloc/memcpy of ucode data
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMTIvMjAxOSAwOTo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTkuMTIuMjAxOSAy
MjoyNSwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4+IE9uIDE4LjEyLjE5IDEzOjA1LCBKYW4gQmV1
bGljaCB3cm90ZToKPj4+IE9uIDE4LjEyLjIwMTkgMDI6MzIsIEVzbGFtIEVsbmlrZXR5IHdyb3Rl
Ogo+Pj4+IEBAIC03MjUsNyArNzAxLDcgQEAgc3RhdGljIGludCBfX2luaXQgbWljcm9jb2RlX2lu
aXQodm9pZCkKPj4+PiAgICAgICAgKi8KPj4+PiAgICAgICBpZiAoIHVjb2RlX2Jsb2Iuc2l6ZSAp
Cj4+Pj4gICAgICAgewo+Pj4+IC0gICAgICAgIHhmcmVlKHVjb2RlX2Jsb2IuZGF0YSk7Cj4+Pj4g
KyAgICAgICAgYm9vdHN0cmFwX21hcChOVUxMKTsKPj4+IEFzIG11Y2ggYXMgSSBsaWtlIHRoZSBj
aGFuZ2UsIEkgd2hvbGVoZWFydGVkbHkgZGlzYWdyZWUgd2l0aCB0aGlzCj4+PiBhc3BlY3Qgb2Yg
aXQ6IFlvdSBtYWtlIGl0IGxhcmdlbHkgdW5wcmVkaWN0YWJsZSB3aGVuIHRoZSBib290Cj4+PiBt
YXBwaW5ncyB3aWxsIGdvIGF3YXkgLSBpdCBiZWNvbWVzIGVudGlyZWx5IGRlcGVuZGVudCB1cG9u
IGxpbmsKPj4+IG9yZGVyLiBBbmQgb2YgY291cnNlIHdlIHJlYWxseSB3YW50IHRoZXNlIG1hcHBp
bmdzIHRvIGJlIGdvbmUsCj4+PiB0aGUgdmVyeSBsYXRlc3QgKEkgdGhpbmspLCBieSB0aGUgdGlt
ZSB3ZSBzdGFydCBicmluZ2luZyB1cCBBUHMKPj4+IChidXQgZ2VuZXJhbGx5IHRoZSBzb29uZXIg
dGhlIGJldHRlcikuIFRoaXMgaXMgKG9uZSBvZj8pIHRoZSBtYWluCj4+PiByZWFzb24ocykgd2h5
IGl0IGhhZG4ndCBiZWVuIGRvbmUgdGhpcyB3YXkgdG8gYmVnaW4gd2l0aC4gVGhlCj4+PiBhbHRl
cm5hdGl2ZSBpcyBtb3JlIGNvbXBsaWNhdGVkIChzZXQgdXAgYSBwcm9wZXIsIGxvbmcgdGVybQo+
Pj4gbWFwcGluZyksIGJ1dCBpdCdzIGdvaW5nIHRvIGJlIG1vcmUgY2xlYW4gKGluY2x1ZGluZyB0
aGUgbWFwcGluZwo+Pj4gdGhlbiBhbHNvIGJlaW5nIHN1aXRhYmxlIHRvIHBvc3QtYm9vdCBDUFUg
b25saW5pbmcpLgo+Pj4KPj4gVGhpcyBjaGFuZ2UgaXMgYW4gaW1wcm92ZW1lbnQgb24gdGhlIGN1
cnJlbnQgc3RhdHVzLiBXZSBnZXQgdG8gYXZvaWQgCj4+IHhtYWxsb2MvbWVtY3B5IGluIHRoZSBj
YXNlIG9mIGEgc3VjY2Vzc2Z1bCB1Y29kZT1zY2FuLiBUaGUgcHJvYmxlbWF0aWMgCj4+IGFzcGVj
dCB5b3UgaGlnaGxpZ2h0IGlzIGFueXdheSB0aGVyZSByZWdhcmRsZXNzIG9mIHRoaXMgcGF0Y2gg
KHJlZi4gdG8gCj4+IHRoZSAiZWxzZSBpZiAoIHVjb2RlX21vZC5tb2RfZW5kICkiIGluIG1pY3Jv
Y29kZV9pbml0KS4KPiBIbW0sIGZhaXIgcG9pbnQuIEknbSBub3QgYSBmYW4gb2YgbWFraW5nIGEg
YmFkIHNpdHVhdGlvbiB3b3JzZSwKPiBidXQgSSB0aGluayBpdCdzIGFjY2VwdGFibGUgaGVyZToK
PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKU3BlY2lmaWNhbGx5
IHJlbGV2YW50IHRvIHRoaXMgY29udmVyc2F0aW9uIGlzIHBvaW50IDIgb2YKaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjAwMTA5MTkzMjQxLjE0NTQyLTEtYW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbS8Kd2hlcmUgaGF2aW5nIGR5bmFtaWMgYm9vdG1hcCBtYXBwaW5ncyBzZWVt
cyBwb2ludGxlc3Mgd2hlbiBhbGwgd2UncmUKZG9pbmcgaXMgbWFwcGluZyBSQU0gYmVsb3cgNEcu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
