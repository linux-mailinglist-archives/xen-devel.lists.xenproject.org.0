Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65CB3BD32
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:54:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQKS-0002U0-P0; Mon, 10 Jun 2019 19:51:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQKR-0002Tv-Jy
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:51:39 +0000
X-Inumbo-ID: 27cd766e-8bb9-11e9-bdf0-a7c0b616622a
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 27cd766e-8bb9-11e9-bdf0-a7c0b616622a;
 Mon, 10 Jun 2019 19:51:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BB5A344;
 Mon, 10 Jun 2019 12:51:36 -0700 (PDT)
Received: from [10.37.10.2] (unknown [10.37.10.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6BE73F73C;
 Mon, 10 Jun 2019 12:51:34 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
 <20d30591-bc90-5321-2de9-a11f7d36cb11@gmail.com>
 <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
 <c0de5da0-9986-ea97-b7d3-6902bd789c19@gmail.com>
 <4d27c123-826d-ad07-ed0a-e7a7517fca62@arm.com>
 <1388d47c-efd1-b30b-9847-92c343964dfa@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <89ce5e93-f62a-2856-cb80-11a2ef7ec2be@arm.com>
Date: Mon, 10 Jun 2019 20:51:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1388d47c-efd1-b30b-9847-92c343964dfa@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8xMC8xOSA0OjQ5IFBNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGllbiwK
CkhpIEFuZHJpaSwKCj4gCj4gT24gMzEuMDUuMTkgMjA6MTEsIEp1bGllbiBHcmFsbCB3cm90ZToK
PiAKPj4gSGVyZSBteSB0YWtlIG9uIHRoZSBjb21taXQgbWVzc2FnZToKPj4KPj4gZ2ljX2ludGVy
cnVwdCgpIHdhcyBpbXBsZW1lbnRlZCB1c2luZyBhIGxvb3AgdG8gbGltaXQgdGhlIGNvc3Qgb2Yg
dGhlIAo+PiB0cmFwIGlmIHRoZXJlIGFyZSBtdWx0aXBsZSBpbnRlcnJ1cHRzIHBlbmRpbmcuCj4+
Cj4+IEF0IHRoZSBtb21lbnQsIGludGVycnVwdHMgYXJlIHVubWFza2VkIGJ5IGdpY19pbnRlcnJ1
cHQoKSBiZWZvcmUgCj4+IGNhbGxpbmcgZG9fe0lSUSwgTFBJfSgpLiBJbiB0aGUgY2FzZSBvZiBo
YW5kbGluZyBhbiBpbnRlcnJ1cHQgcm91dGVkIAo+PiB0byBndWVzdHMsIGl0cyBwcmlvcml0eSB3
aWxsIGJlIGRyb3BwZWQsIHZpYSBkZXNjLT5oYW5kbGVyLT5lbmQoKSAKPj4gY2FsbGVkIGZyb20g
ZG9faXJxKCksIHdpdGggaW50ZXJydXB0IHVubWFza2VkLgo+Pgo+PiBJbiBvdGhlciB3b3JkczoK
Pj4gwqDCoMKgwqAgLSBVbnRpbCB0aGUgcHJpb3JpdHkgaXMgZHJvcHBlZCwgb25seSBoaWdoZXIg
cHJpb3JpdHkgaW50ZXJydXB0IAo+PiBjYW4gYmUgcmVjZWl2ZWQuIFRvZGF5LCBvbmx5IFhlbiBp
bnRlcnJ1cHRzIGhhdmUgaGlnaGVyIHByaW9yaXR5Lgo+PiDCoMKgwqDCoCAtIEFzIHNvb24gYXMg
cHJpb3JpdHkgaXMgZHJvcHBlZCwgYW55IGludGVycnVwdCBjYW4gYmUgcmVjZWl2ZWQuCj4+Cj4+
IFRoaXMgbWVhbnMgdGhlIHB1cnBvc2Ugb2YgdGhlIGxvb3AgaW4gZ2ljX2ludGVycnVwdCgpIGlz
IGRlZmVhdGVkIGFzIAo+PiBhbGwgaW50ZXJydXB0cyBtYXkgZ2V0IHRyYXBwZWQgZWFybGllci4g
VG8gcmVpbnN0YXRlIHRoZSBwdXJwb3NlIG9mIAo+PiB0aGUgbG9vcCAoYW5kIHByZXZlbnQgdGhl
IHRyYXApLCBpbnRlcnJ1cHRzIHNob3VsZCBiZSBtYXNrZWQgd2hlbiAKPj4gZHJvcHBpbmcgdGhl
IHByaW9yaXR5Lgo+Pgo+PiBGb3IgaW50ZXJydXB0cyByb3V0ZWQgdG8gWGVuLCBwcmlvcml0eSB3
aWxsIGFsd2F5cyBiZSBkcm9wcGVkIHdpdGggCj4+IGludGVycnVwdHMgbWFza2VkLiBTbyB0aGUg
aXNzdWUgaXMgbm90IHByZXNlbnQuIEhvd2V2ZXIsIGl0IG1lYW5zIHRoYXQgCj4+IHdlIGFyZSBw
b2ludGxlc3MgdHJ5IHRvIG1hc2sgdGhlIGludGVycnVwdHMuCj4+Cj4+IFRvIGF2b2lkIGNvbmZs
aWN0aW5nIGJlaGF2aW9yIGJldHdlZW4gaW50ZXJydXB0IGhhbmRsaW5nLCAKPj4gZ2ljX2ludGVy
cnVwdCgpIGlzIG5vdyBrZWVwaW5nIGludGVycnVwdHMgbWFza2VkIGFuZCBkZWZlciB0aGUgCj4+
IGRlY2lzaW9uIHRvIGRvX3tMUEksIElSUX0uCj4gCj4gSXQgaXMgT0sgd2l0aCBtZS4KPiAKPiBB
cmUgeW91IHdhaXRpbmcgZnJvbSBtZSBtb3JlIG9mCgpJIHdhcy4gQnV0IEkgYWxzbyBoYWQgdGlt
ZSB0byB0aGluayBhYm91dCB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIEkgd291bGQgCmJlIGhhcHB5
IHRvIGNvbW1pdCB3aXRoIGp1c3Qgd2hhdCBpdCBpcyBjdXJyZW50bHkgd3JpdHRlbi4KCkkgaGF2
ZSBub3cgYXBwbGllZCB0byBteSBzdGFnaW5nIGJyYW5jaCB3aXRoIG15IGFja2VkLWJ5LiBJIHdp
bGwgY29tbWl0IAppdCB0b25pZ2h0LgoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
