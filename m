Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E87319FA1
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 16:56:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP6u9-0005Hp-4i; Fri, 10 May 2019 14:53:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wlzL=TK=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hP6u6-0005Hh-R9
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:53:42 +0000
X-Inumbo-ID: 655436a6-7333-11e9-8bba-47934e10d333
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 655436a6-7333-11e9-8bba-47934e10d333;
 Fri, 10 May 2019 14:53:40 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 D96073031FD4; Fri, 10 May 2019 17:53:38 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id D12D03034450;
 Fri, 10 May 2019 17:53:38 +0300 (EEST)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <CABfawhkp2rODvh1j6AvEEEgc=EheM53sVprRiZWrhHcQ8Ve_+w@mail.gmail.com>
 <3e6ecacc-6dcc-6c0d-2b2d-b5179572cb5b@citrix.com>
 <CABfawh=tD8DKDCVTKAtsYi3yRWiq_d-oxGOMnEgJn7BiT6dZ1w@mail.gmail.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <64df9a6f-40bc-68f9-155d-8c83e1ecfd5c@bitdefender.com>
Date: Fri, 10 May 2019 17:53:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABfawh=tD8DKDCVTKAtsYi3yRWiq_d-oxGOMnEgJn7BiT6dZ1w@mail.gmail.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] Altp2m use with PML can deadlock Xen
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8xMC8xOSA1OjQyIFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gT24gVGh1LCBNYXkg
OSwgMjAxOSBhdCAxMDoxOSBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPiB3cm90ZToKPj4KPj4gT24gMDkvMDUvMjAxOSAxNDozOCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+Pj4gSGkgYWxsLAo+Pj4gSSdtIGludmVzdGlnYXRpbmcgYW4gaXNzdWUgd2l0aCBhbHRw
Mm0gdGhhdCBjYW4gZWFzaWx5IGJlIHJlcHJvZHVjZWQKPj4+IGFuZCBsZWFkcyB0byBhIGh5cGVy
dmlzb3IgZGVhZGxvY2sgd2hlbiBQTUwgaXMgYXZhaWxhYmxlIGluIGhhcmR3YXJlLgo+Pj4gSSBo
YXZlbid0IGJlZW4gYWJsZSB0byB0cmFjZSBkb3duIHdoZXJlIHRoZSBhY3R1YWwgZGVhZGxvY2sg
b2NjdXJzLgo+Pj4KPj4+IFRoZSBwcm9ibGVtIHNlZW0gdG8gc3RlbSBmcm9tIGh2bS92bXgvdm1j
cy5jOnZteF92Y3B1X2ZsdXNoX3BtbF9idWZmZXIKPj4+IHRoYXQgY2FsbHMgcDJtX2NoYW5nZV90
eXBlX29uZSBvbiBhbGwgZ2ZucyB0aGF0IHdlcmUgcmVjb3JkZWQgdGhlIFBNTAo+Pj4gYnVmZmVy
LiBUaGUgcHJvYmxlbSBvY2N1cnMgd2hlbiB0aGUgUE1MIGJ1ZmZlciBmdWxsIHZtZXhpdCBoYXBw
ZW5zCj4+PiB3aGlsZSB0aGUgYWN0aXZlIHAybSBpcyBhbiBhbHRwMm0uIFN3aXRjaGluZyAgcDJt
X2NoYW5nZV90eXBlX29uZSB0bwo+Pj4gd29yayB3aXRoIHRoZSBhbHRwMm0gaW5zdGVhZCBvZiB0
aGUgaG9zdHAybSBob3dldmVyIHJlc3VsdHMgaW4gRVBUCj4+PiBtaXNjb25maWd1cmF0aW9uIGNy
YXNoZXMuCj4+Pgo+Pj4gQWRkaW5nIHRvIHRoZSBpc3N1ZSBpcyB0aGF0IGl0IHNlZW0gdG8gb25s
eSBvY2N1ciB3aGVuIHRoZSBhbHRwMm0gaGFzCj4+PiByZW1hcHBlZCBHRk5zLiBTaW5jZSBQTUwg
cmVjb3JkcyBlbnRyaWVzIGJhc2VkIG9uIEdGTiBsZWFkcyBtZSB0bwo+Pj4gcXVlc3Rpb24gd2hl
dGhlciBpdCBpcyBzYWZlIGF0IGFsbCB0byB1c2UgUE1MIHdoZW4gYWx0cDJtIGlzIHVzZWQgd2l0
aAo+Pj4gR0ZOIHJlbWFwcGluZy4gSG93ZXZlciwgQUZBSUNUIHRoZSBHRk5zIGluIHRoZSBQTUwg
YnVmZmVyIGFyZSBub3QgdGhlCj4+PiByZW1hcHBlZCBHRk5zIGFuZCBteSB1bmRlcnN0YW5kaW5n
IGlzIHRoYXQgaXQgc2hvdWxkIGJlIHNhZmUgYXMgbG9uZwo+Pj4gYXMgdGhlIEdGTnMgYmVpbmcg
dHJhY2tlZCBieSBQTUwgYXJlIG5ldmVyIHRoZSByZW1hcHBlZCBHRk5zLgo+Pj4KPj4+IEJvb3Rp
bmcgWGVuIHdpdGggZXB0PXBtbD0wIHJlc29sdmVzIHRoZSBpc3N1ZS4KPj4+Cj4+PiBJZiBhbnlv
bmUgaGFzIGFueSBpbnNpZ2h0IGludG8gd2hhdCBtaWdodCBiZSBoYXBwZW5pbmcsIHBsZWFzZSBs
ZXQgbWUga25vdy4KPj4KPj4KPj4gSSBjb3VsZCBoYXZlIHN3b3JuIHRoYXQgR2VvcmdlIHNwb3R0
ZWQgYSBwcm9ibGVtIGhlcmUgYW5kIGZpeGVkIGl0LiAgSQo+PiBzaG91bGRuJ3QgYmUgc3VycHJp
c2VkIGlmIHdlIGhhdmUgbW9yZS4KPj4KPj4gVGhlIHByb2JsZW0gdGhhdCBQTUwgaW50cm9kdWNl
ZCAoYW5kIHRoaXMgaXMgbW9zdGx5IG15IGZhdWx0LCBhcyBJCj4+IHN1Z2dlc3RlZCB0aGUgYnVn
Z3kgc29sdXRpb24pIGlzIHRoYXQgdGhlIHZtZXhpdCBoYW5kbGVyIGZyb20gb25lIHZjcHUKPj4g
cGF1c2VzIG90aGVycyB0byBkcmFpbiB0aGUgUE1MIHF1ZXVlIGludG8gdGhlIGRpcnR5IGJpdG1h
cC4gIE92ZXJhbGwgSQo+PiB3YXNuJ3QgaGFwcHkgd2l0aCB0aGUgZGVzaWduIGFuZCBJJ3ZlIGdv
dCBzb21lIGlkZWFzIHRvIGltcHJvdmUgaXQsIGJ1dAo+PiB3aXRoaW4gdGhlIHNjb3BlIG9mIGhv
dyBhbHRwMm0gd2FzIGVuZ2luZWVyZWQsIEkgcHJvcG9zZWQKPj4gZG9tYWluX3BhdXNlX2V4Y2Vw
dF9zZWxmKCkuCj4+Cj4+IEFzIGl0IHR1cm5zIG91dCwgdGhhdCBpcyB2dWxuZXJhYmxlIHRvIGRl
YWRsb2NrcyB3aGVuIHlvdSBnZXQgdHdvIHZjcHVzCj4+IHRyeWluZyB0byBwYXVzZSBlYWNoIG90
aGVyIGFuZCB3YWl0aW5nIGZvciBlYWNoIG90aGVyIHRvIGJlY29tZQo+PiBkZS1zY2hlZHVsZWQu
Cj4gCj4gTWFrZXMgc2Vuc2UuCj4gCj4+Cj4+IEkgc2VlIHRoaXMgaGFzIGJlZW4gcmV1c2VkIGJ5
IHRoZSBhbHRwMm0gY29kZSwgYnV0IGl0ICpzaG91bGQqIGJlIHNhZmUKPj4gdG8gZGVhZGxvY2tz
IG5vdyB0aGF0IGl0IHRha2VzIHRoZSBoeXBlcmNhbGxfZGVhZGxvY2tfbXV0ZXh0Lgo+IAo+IElz
IHRoYXQgYWxyZWFkeSBpbiBzdGFnaW5nIG9yIHlvdXIgeDg2LW5leHQgYnJhbmNoPyBJIHdvdWxk
IGxpa2UgdG8KPiB2ZXJpZnkgdGhhdCB0aGUgcHJvYmxlbSBpcyBzdGlsbCBwcmVzZW50IG9yIG5v
dCB3aXRoIHRoYXQgY2hhbmdlLiBJCj4gdGVzdGVkIHdpdGggWGVuIDQuMTIgcmVsZWFzZSBhbmQg
dGhhdCBkZWZpbml0ZWx5IHN0aWxsIGRlYWRsb2Nrcy4KCkkgZG9uJ3Qga25vdyBpZiBBbmRyZXcg
aXMgdGFsa2luZyBhYm91dCB0aGlzIHBhdGNoIChwcm9iYWJseSBub3QsIGJ1dCBpdCAKbG9va3Mg
YXQgbGVhc3QgcmVsYXRlZCk6CgpodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4u
Z2l0O2E9Y29tbWl0ZGlmZjtoPTI0ZDUyODI1MjdmNDY0NzkwN2IzNTcyODIwYjUzMzVjMTVjZDAz
NTY7aHA9MjlkMjhiMjkxOTBiYTA5ZDUzYWU3ZTQ3NTEwOGRlZjg0ZTE2ZTM2MwoKU2luY2UgdGhl
cmUncyBhICJSZWxlYXNlLWFja2VkIiB0YWcgb24gaXQsIEkgdGhpbmsgaXQncyBpbiA0LjEyLgoK
ClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
