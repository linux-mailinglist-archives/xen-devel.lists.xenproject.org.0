Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2EA86244
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 14:51:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvhqc-0005hz-Rp; Thu, 08 Aug 2019 12:48:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=islG=WE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvhqa-0005hj-Ub
 for xen-devel@lists.xen.org; Thu, 08 Aug 2019 12:48:48 +0000
X-Inumbo-ID: dd33d9b2-b9da-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id dd33d9b2-b9da-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 12:48:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B26A15A2;
 Thu,  8 Aug 2019 05:48:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80E5C3F694;
 Thu,  8 Aug 2019 05:48:46 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1812050923160.527@sstabellini-ThinkPad-X260>
 <1544030891-11906-2-git-send-email-sstabellini@kernel.org>
 <5766f31c-b89a-2353-3650-e9ec732b239b@arm.com>
 <alpine.DEB.2.10.1901031246200.800@sstabellini-ThinkPad-X260>
 <f54712e7-aad7-5f76-9a51-224b1ad2c744@arm.com>
 <alpine.DEB.2.21.1908071422210.2451@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2aaaecba-7f1a-969a-ca33-3efc2bf2cca9@arm.com>
Date: Thu, 8 Aug 2019 13:48:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908071422210.2451@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/5] xen/arm: assign devices to boot domains
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Achin.Gupta@arm.com,
 andrii_anisov@epam.com, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDA3LzA4LzIwMTkgMjM6NDYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDE1IEphbiAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMKPj4+Pj4gaW5kZXggY2M2YjQ2NC4uZDQ4Zjc3ZSAxMDA2NDQKPj4+Pj4gLS0tIGEv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYwo+Pj4+PiBAQCAtMjA5NCw2ICsyMDk0LDg4IEBAIHN0YXRpYyBpbnQgX19pbml0
IGNvbnN0cnVjdF9kb21haW4oc3RydWN0IGRvbWFpbgo+Pj4+PiAqZCwKPj4+Pj4gc3RydWN0IGtl
cm5lbF9pbmZvICpraW5mbykKPj4+Pj4gICAgICAgICByZXR1cm4gMDsKPj4+Pj4gICAgIH0KPj4+
Pj4gICAgICtzdGF0aWMgaW50IF9faW5pdCBzY2FuX3B0X25vZGUoY29uc3Qgdm9pZCAqcGZkdCwK
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgbm9kZW9mZiwgY29uc3Qg
Y2hhciAqbmFtZSwgaW50Cj4+Pj4+IGRlcHRoLAo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHUzMiBhZGRyZXNzX2NlbGxzLCB1MzIgc2l6ZV9jZWxscywKPj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQo+Pj4+Cj4+Pj4gSXMgaXQgcmVh
bGx5IG5lY2Vzc2FyeSB0byBwYXJzZSB0aGUgZGV2aWNlLXRyZWUgdHdpY2U/Cj4+Pgo+Pj4gSSBk
b24ndCB0aGluayBJIHVuZGVyc3RhbmQgdGhpcyBjb21tZW50LiBUaGUgZGV2aWNlIHRyZWUgZnJh
Z21lbnQgaXMgbm90Cj4+PiBzY2FubmVkIHR3aWNlLCBqdXN0IG9uY2UgSSB0aGluay4gQW0gSSBt
aXNzaW5nIHNvbWV0aGluZz8KPj4KPj4gVGhlIHByZXZpb3VzIHBhdGNoIGlzIGdvaW5nIHRocm91
Z2ggdGhlIERUIHRvIGNvcHkgdGhlIHByb3BlcnRpZXMgb3Zlci4gVGhpcwo+PiBwYXRjaCBpbnRy
b2R1Y2UgYSBuZXcgZnVuY3Rpb24gdG8gZ28gb3ZlciB0aGUgRFQgdG8gZmluZCB0aGUgRGV2aWNl
IHRvIGF0dGFjaC4KPj4gU28geW91IGFyZSBwYXJzaW5nIHRoZSBEVCB0d2ljZS4gSXMgdGhlcmUg
YW55IHJlYXNvbiBmb3IgdGhhdD8KPiAKPiBJIGdvdCB5b3VyIHF1ZXN0aW9uIG5vdy4gIEkgc3Bl
bnQgcXVpdGUgc29tZSB0aW1lIHRvIG1lcmdlIHRoZSB0d28KPiBwYXRocywgdGhlIGZpcnN0IG9u
ZSB1c2VkIHRvIGNvcHkgdGhlIGZyYWdtZW50LCB0aGUgc2Vjb25kIG9uZSB1c2VkIHRvCj4gcGFy
c2UgaXQsIGludG8gYSBzaW5nbGUgZnVuY3Rpb24uIEl0IGlzIGRpZmZpY3VsdCBiZWNhdXNlIHRo
ZQo+IGluZm9ybWF0aW9uIGNvbnZlbmllbnQgdG8gdXNlIGZvciBvbmUgY2FzZSwgaXQgaXMgbm90
IGNvbnZlbmllbnQgZm9yIHRoZQo+IG90aGVyIChzcGVjaWZpY2FsbHkgZmlndXJpbmcgb3V0IHdo
ZW4gdG8gY2FsbCBmZHRfZW5kX25vZGUgd2hlbiBjYWxsZWQKPiBmcm9tIGRldmljZV90cmVlX2Zv
cl9lYWNoX25vZGUuKSBJIG1hbmFnZWQgdG8gZG8gaXQgdGhvdWdoLCBpbiB0aGUgbmV4dAo+IHZl
cnNpb24gdGhlcmUgd2lsbCBiZSBvbmx5IG9uZSBwYXJzaW5nIG9mIHRoZSBmcmFnbWVudC4KCkkg
d2Fzbid0IG5lY2Vzc2FyaWx5IGFza2luZyB0byBtZXJnZSB0aGUgdHdvLiBJIHdhbnRlZCB0byB1
bmRlcnN0YW5kIHdoZXRoZXIgd2UgCmNhbiBhdm9pZCB0d28gcGFyc2luZyB5ZXQga2VlcGluZyB0
aGUgY29kZSBzaW1wbGUuIFNvcnJ5IGlmIGl0IHdhc24ndCBjbGVhciBlbm91Z2guCgpbLi4uXQoK
Pj4+PiBGdXJ0aGVybW9yZSwgdGhpcyBpcyBhc3N1bWluZyBhbGwgdGhlIG5vZGVzIGluIHRoZSBm
cmFnbWVudCB3aWxsIGJlCj4+Pj4gdW5kZXIgdGhlIEdJQyBjb250cm9sbGVyLiAgWW91IG1heSB3
YW50IHRvIHBhc3N0aHJvdWdoIGEgaW50ZXJydXB0Cj4+Pj4gY29udHJvbGxlciAoaS5lIEdQSU8p
IHRvIHRoZSBndWVzdCBhbmQgdGhlIHJlbGF0ZWQgZGV2aWNlLgo+Pj4KPj4+IEkgZG9uJ3QgdGhp
bmsgdGhhdCB0aGUgbm9uLUdJQyBzY2VuYXJpbyBpcyBzdXBwb3J0ZWQgdG9kYXkuIEkgZG9uJ3QK
Pj4+IHRoaW5rIGl0IHdvcmtzIGV2ZW4gd2l0aG91dCBkb20wbGVzcy4gSSB3cm90ZSBtb3JlIGFi
b3V0IHRoaXMgYXMgYSByZXBseQo+Pj4gdG8gdGhlIG90aGVyIGVtYWlsLgo+PiBJIGJlbGlldmUg
dGhpcyB3b3JrcyBvdXQtb2YtYm94IHdpdGggdGhlIGd1ZXN0LiBJZiB3ZSB0YWtlIHRoZSBleGFt
cGxlIG9mIHRoZQo+PiBHUElPIGNvbnRyb2xsZXIsIGl0IG1heSBiZSBiZWhpbmQgdGhlIEdJQy4g
WW91IG9ubHkgY2FyZSB0byByb3V0ZSB0aG9zZQo+PiBpbnRlcnJ1cHRzIHVzZWQgYnkgR1BJTyBh
bmQgTU1JTyBhc3NvY2lhdGVkLiBUaGUgcmVzdCBjYW4gYmUgZGVzY3JpYmUgbm9ybWFsbHkKPj4g
aW4gdGhlIERULgo+Pgo+PiBPZiBjb3Vyc2UsIHRoaXMgbWVhbnMgdGhhdCB5b3UgbmVlZCB0byBw
YXNzdGhyb3VnaCBhbGwgZGV2aWNlcyB1c2luZyB0aGUgR1BJTwo+PiBjb250cm9sbGVyIHRvIHRo
YXQgZ3Vlc3QuCj4+Cj4+IFNvIEkgc3RpbGwgdGhpbmsgeW91IG5lZWQgdG8gY2hlY2sgd2hldGhl
ciB0aGUgaW50ZXJydXB0cyBiZWxvbmdzIHRoZSBHSUMgb3IKPj4gbm90Lgo+IAo+IEkgdGhpbmsg
SSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW50IG5vdy4gSSBjb3VsZCBhZGQgYSBjaGVjayBiZWZv
cmUKPiByb3V0aW5nIGFueSBpbnRlcnJ1cHRzIHRvIHRoZSBndWVzdCwgdG8gbWFrZSBzdXJlIHRo
YXQgdGhleSBhcmUgR0lDCj4gaW50ZXJydXB0cy4gSG93ZXZlciwgdGhlIHdheSB0byBkbyB0aGF0
IGNoZWNrIEkgYmVsaWV2ZSB3b3VsZCBiZSB1c2luZwo+IHRoZSAiaW50ZXJydXB0LXBhcmVudCIg
cHJvcGVydHksIGJ1dCB3ZSBoYXZlIGp1c3QgZGlzY3Vzc2VkIGFib3V0Cj4gcmVtb3ZpbmcgaXQu
CgpJIGhhdmUgc3VnZ2VzdGVkIGEgd2F5IHRvIGtlZXAgaXQgYW5kIGF2b2lkIHdyaXRpbmcgZG93
biB0aGUgcGhhbmRsZSB2YWx1ZS4KCj4gCj4gU28sIGlmIHRoZSB1c2VyIHByb3ZpZGVzIGEgZnJh
Z21lbnQgdGhhdCBkb2Vzbid0IGhhdmUgYW55Cj4gImludGVycnVwdC1wYXJlbnQiIHByb3BlcnRp
ZXMsIGhvdyBjYW4gSSBjaGVjayB0aGF0IHRoZSBpbnRlcnJ1cHRzIGFyZQo+IEdJQyBpbnRlcnJ1
cHRzPwoKVGhlIHByb2JsZW0gaGVyZSBpcyB5b3UgYXJlIHJlLXVzaW5nIHRoZSBndWVzdCAiaW50
ZXJydXB0cyIgcHJvcGVydHkgZm9yIGZpbmRpbmcgCm91dCB0aGUgaG9zdCBpbnRlcnJ1cHRzLiBG
aXJzdGx5LCB0aGlzIGRvZXMgbm90IGNhdGVyIHRoZSBjYXNlIHdoZXJlIGd1ZXN0IERUIGlzIAp1
c2luZyB0aGUgcHJvcGVydHkgImludGVycnVwdC1leHRlbmRlZCIuCgpJdCBmZWVscyB0byBtZSB0
aGF0IHdlIHNob3VsZCBsb29rIGF0IHRoZSAiaW50ZXJydXB0cyIgcHJvcGVydHkgZnJvbSB0aGUg
aG9zdCBEVCAKYW5kIG1hcCB0aGVtIDE6MSAoaS5lIGlycSA9PSB2aXJxKS4gVGhlIHByb3BlcnR5
IGluIHRoZSBwYXJ0aWFsIERUIHdvdWxkIGp1c3QgYmUgCnJlcGxpY2F0aW5nIHRoZSB2YWx1ZXMg
ZnJvbSB0aGUgaG9zdCBEVC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
