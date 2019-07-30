Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89777B410
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 22:13:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsYSb-00040P-WA; Tue, 30 Jul 2019 20:11:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WuyF=V3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsYSa-00040F-PO
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 20:11:00 +0000
X-Inumbo-ID: 2588c6b6-b306-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 2588c6b6-b306-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 20:10:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DA06344;
 Tue, 30 Jul 2019 13:10:59 -0700 (PDT)
Received: from [10.37.8.36] (unknown [10.37.8.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED9823F575;
 Tue, 30 Jul 2019 13:10:57 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
Date: Tue, 30 Jul 2019 21:10:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmlpLAoKT24gNy8zMC8xOSA2OjM1IFBNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IE9u
IDI2LjA3LjE5IDEzOjQ4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFRoaXMgaXMgdGhlIDNyZCB0
aW1lIHlvdSBzZW5kIHRoaXMgcGF0Y2guLi4gYW5kIHN0aWxsIG5vIHByb3BlciAKPj4gZXhwbGFu
YXRpb24gd2h5IHRoaXMgaXMgZG9uZSBub3IgdGhlIGltcGFjdCBvbiBrZWVwaW5nIHRoZSBpbnRl
cnJ1cHRzIAo+PiBkaXNhYmxlZCBsb25nZXIgdGhhbiBuZWNlc3NhcnkuCj4gCj4gSSBrbm93IGl0
IGlzIHRoZSB0aGlyZCB0aW1lIGZvciB0aGlzIHBhdGNoLiBZZXQgaXQgaXMgaW4gdGhlIFJGQyBz
ZXJpZXMgCj4gYWdhaW4uCgpTbz8gUkZDIGRvZXMgbm90IG1lYW4geW91IGhhdmUgdG8gaWdub3Jl
IHByZXZpb3VzIGNvbW1lbnRzLi4uIFlvdSBjb3VsZCAKaGF2ZSBhdCBsZWFzdCBhY2tub3dsZWRn
ZSBteSBwb2ludHMuLi4KCj4gSW4gdGhpcyBzZXJpZXMgSSB0aGluayBJIG5lZWQgaW50ZXJydXB0
cyBsb2NrZWQgdW50aWwgSSBzdGFydCB0aW1lIAo+IGFjY291bnRpbmcgZm9yIGh5cGVydmlzb3Iu
IFRpbWUgYWNjb3VudGluZyBpcyBzdGFydGVkIGJ5IGB0YWNjX2hlYWQoKWAgCj4gZnVuY3Rpb24u
IEkgcHJlZmVyIHRvIGhhdmUgaXQgY2FsbGVkIGZyb20gQywgYmVjYXVzZSBpdCBpcyBtb3JlIAo+
IGNvbnZlbmllbnQgYW5kIG9idmlvdXMgZm9yIHRob3NlIHdobyBhcmUgbGVzcyBmYW1pbGlhciB3
aXRoIHRoZSBBUk0gY29kZS4KPiAKPj4gUmVzZW5kaW5nIHRoZSBwYXRjaCB3aXRob3V0IHRoaW5n
cyBhZGRyZXNzZWQgaXMgb25seSBnb2luZyB0byBtYWtlIGl0IAo+PiB3b3JzdC4KPiAKPiBJJ20g
c3RpbGwgY29udmluY2VkIHRoZSBwYXRjaCB3b3VsZCBpbXByb3ZlIGludGVycnVwdCBsYXRlbmN5
IGZvciBoaWdoIAo+IGludGVycnVwdCByYXRlIHVzZSBjYXNlcy4KPiBCdXQgSSB1bmRlcnN0YW5k
IHRoYXQgSSBoYXZlIG5vIGV4cGVyaW1lbnQgdG8gcHJvdmUgdGhlIGVmZmVjdCwgc28gSSdtIAo+
IG5vdCB3aWxsaW5nIHRvIHB1c2ggdGhyb3VnaCB0aGUgcGF0Y2guCgpUaGUgb25seSB0aGluZyBJ
IGFzayBpcyBqdXN0aWZpY2F0aW9uIGluIHlvdXIgY29tbWl0IG1lc3NhZ2UgcmF0aGVyIHRoYW4g
CnRocm93aW5nIHRoaW5ncyBhbmQgZXhwZWN0aW5nIHRoZSByZXZpZXdlciB0byB1bmRlcnN0YW5k
IHdoeSB5b3UgZG8gCnRoYXQuIEkgd291bGQgcmVjb21tZW5kIHRvIHJlZnJlc2ggeW91cnNlbGYg
aG93IHRvIHN1Ym1pdCBhIHBhdGNoIHNlcmllcyAKWzFdLgoKPiAKPiBBbHNvLCBJIGhhdmUgYSBx
dWVzdGlvbiB0byB5b3UgYWJvdXQgYW5vdGhlciBhc3BlY3Qgb2YgdGhpcyBwYXRjaC4gSW4gCj4g
dGhlIGZ1bmN0aW9uIGBlbnRlcl9oeXBlcnZpc29yX2hlYWQoKWAgdGhlcmUgaXMgYSBjaGVjayBm
b3IgYSBkaXNhYmxlZCAKPiB3b3JrYXJvdW5kIGFuZCB0dXJuaW5nIGl0IG9uLiBJZiB3ZSBoYXZl
IHRoZSBpbnRlcnJ1cHRzIGVuYWJsZWQgdW50aWwgCj4gdGhlcmUsIHdlIGhhdmUgZ29vZCBjaGFu
Y2VzIHRvIGdvIHRocm91Z2ggdGhlIGludGVycnVwdCBwcm9jZXNzaW5nIAo+IGBkb19JUlEoKWAg
YmVmb3JlIFdBIGVuYWJsZWQuIElzIGl0IHN0aWxsIE9LPwoKSG1tbSwgdGhhdCdzIGNvcnJlY3Qu
CgpDaGVlcnMsCgpbMV0gaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvU3VibWl0dGlu
Z19YZW5fUHJvamVjdF9QYXRjaGVzCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
