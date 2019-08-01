Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E757D938
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 12:20:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht893-0001Yx-8p; Thu, 01 Aug 2019 10:17:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qeGT=V5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ht892-0001Yj-3K
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 10:17:12 +0000
X-Inumbo-ID: 84b87a0e-b445-11e9-9509-9f493a658228
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 84b87a0e-b445-11e9-9509-9f493a658228;
 Thu, 01 Aug 2019 10:17:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EF3A1570;
 Thu,  1 Aug 2019 03:17:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FE403F575;
 Thu,  1 Aug 2019 03:17:07 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-7-git-send-email-andrii.anisov@gmail.com>
 <c971845f-7305-22c2-081f-9faa36e4c8d2@arm.com>
 <63256c34-fab7-1fb8-3637-9c5a50d6d6bf@gmail.com>
 <8c7bc6d1-3482-ec5b-b3d9-c6562caf5711@arm.com>
 <c2a220ad-553f-272f-606f-2c569e299e10@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ed14fff5-5cc3-cb6c-2676-02b510b0553e@arm.com>
Date: Thu, 1 Aug 2019 11:17:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c2a220ad-553f-272f-606f-2c569e299e10@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 5/6] arm64: call enter_hypervisor_head only
 when it is needed
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
 Andrii Anisov <andrii_anisov@epam.com>,
 Andre Przywara <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmlpLAoKT24gMDEvMDgvMjAxOSAwODozMywgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiAK
PiAKPiBPbiAzMS4wNy4xOSAxNDowMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBFdmVyeXRoaW5n
IGlzIGluIHRoZSBob3QgcGF0aCBoZXJlLCB5ZXQgdGhlcmUgYXJlIGEgbG90IG9mIG90aGVyIGJy
YW5jaGVzLiBTbyAKPj4gd2h5IHRoaXMgYnJhbmNoIGluIHBhcnRpY3VsYXI/Cj4gCj4gVGhpcyBi
cmFuY2ggYW5kIGZ1bmN0aW9uIGNhbGwgaXMgcGFydGljdWxhciBiZWNhdXNlIEkgZmluZCB0aGlz
IHBpZWNlIG9mIGNvZGUgCj4gcXVpdGUgY29uZnVzaW5nOgoKQWxsIHRoZSBjb21taXQgbWVzc2Fn
ZSBpcyBiYXNlZCBvbiAicGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQiLi4uLiBOb3cgeW91IGFyZSAK
c2VsbGluZyBpdCBhcyB0aGlzIGlzIGNvbmZ1c2luZy4gV2hhdCBhcmUgdGhlIHJlYWwgcmVhc29u
cyBmb3IgdGhpcyBwYXRjaD8KCj4gCj4+PiBJJ20gbm90IHNlZWluZyBhbnkgYmVuZWZpdHMgaW4g
Y2FsbGluZyBgZW50ZXJfaHlwZXJ2aXNvcl9oZWFkKClgIGZyb20gCj4+PiBmdW5jdGlvbnMgbmFt
ZWQgYGRvX3RyYXBfaHlwXypgLiBUaGF0IGNvZGUgaXMgY29uZnVzaW5nIGZvciBtZS4KPj4+IElN
SE8sIGRpdmlkaW5nIGBkb190cmFwX2lycS9maXEoKWAgaW50byBndWVzdCBhbmQgaHlwIHNwZWNp
ZmljIGZ1bmN0aW9ucyBpcyAKPj4+IG5vdCBhIGJpZyBkZWFsLiBFdmVuIGZvciBBUk0zMi4gTW9y
ZW92ZXIsIGl0IHdpbGwgbWFrZSBtb3JlIG9idmlvdXMgdGhlIGZhY3QgCj4+PiB0aGF0IG5vdGhp
bmcgZnJvbSBgZW50ZXJfaHlwZXJ2aXNvcl9oZWFkKClgIGlzIGRvbmUgZm9yIElSUSB0cmFwcyB0
YWtlbiBmcm9tIAo+Pj4gaHlwLgo+IAo+IEFuZCBJIGJlbGlldmUgdGhpcyBwYXRjaCBiYWxhbmNl
cyBwYXRjaCAieGVuL2FybTogUmUtZW5hYmxlIGludGVycnVwdCBsYXRlciBpbiAKPiB0aGUgdHJh
cCBwYXRoIiB3aGF0IHlvdSBOQUtlZCBiZWNhdXNlIG9mIGluY3JlYXNlZCBJUlEgbGF0ZW5jeS4K
CkkgbmV2ZXIgTkFLZWQgdGhlIHBhdGNoIGFzIHlvdSBrZWVwIGNsYWltaW5nIGl0LiBZb3UgYXJl
IHNlbmRpbmcgYSBwYXRjaCB3aXRob3V0IAphbnkganVzdGlmaWNhdGlvbiB0aHJlZSB0aW1lIGlu
IGEgcm93LCBzbyBpdCBpcyBub3JtYWwgdG8gcmVxdWVzdCBtb3JlIGRldGFpbHMgCmFuZCB0byBi
ZSBzbGlnaHRseSBhbm5veWVkLgoKSWYgeW91IGV4cGVjdCBtZSB0byBhY2sgYSBwYXRjaCB3aXRo
b3V0IHVuZGVyc3RhbmRpbmcgdGhlIGltcGxpY2F0aW9ucywgdGhlbiBJIAphbSBhZnJhaWQgdGhp
cyBpcyBub3QgZ29pbmcgdG8gaGFwcGVuLiBBZGRpdGlvbmFsbHksIGl0IGlzIGltcG9ydGFudCB0
byBrZWVwIAp0cmFjayBvZiB0aGUgcmVhc29uaW5nIG9mIHdlIGNhbiBjb21lIGJhY2sgaW4gMiB5
ZWFycyB0aW1lIGFuZCBmaW5kIG91dCBxdWlja2x5IAp3aHkgaW50ZXJydXB0cyBhcmUgbWFza2Vk
IGZvciBhIGxvbmcgcGVyaW9kIG9mIHRpbWUuCgpBcyBJIHBvaW50ZWQgb3V0IFhlbiBzdXBwb3J0
cyBtdWx0aXBsZSB1c2UtY2FzZXMuIEkgYW0gY29uY2VybmVkIHlvdSBhcmUgdHJ5aW5nIAp0byBv
cHRpbWl6ZSBmb3IgeW91ciB1c2UtY2FzZSBhbmQgZGlzcmVnYXJkIHRoZSByZXN0LiBJIGhhdmUg
YWN0dWFsbHkgcmVxdWVzdGVkIAptb3JlIGRldGFpbHMgb24geW91ciB1c2UgY2FzZSB0byB1bmRl
cnN0YW5kIGEgYml0IG1vcmUgd2hlcmUgeW91IGFyZSBjb21pbmcgCmZyb20uIFNlZSBteSBlLW1h
aWwgWzFdLgoKSSBrbm93IEkgd3JvdGUgdGhlIHBhdGNoIGJ1dCBpdCB3YXMgZnJvbSBkZWJ1Z2dp
bmcgb3RoZXIgdGhhbiByZWFsIGltcHJvdmVtZW50LiAKIEZyb20gbXkgdW5kZXJzdGFuZGluZywg
eW91IGFyZSB1c2luZyB0byBvcHRpbWl6ZSB0aGUgY2FzZSB3aGVyZSBhbGwgTFJzIGFyZSAKZnVs
bC4gSXMgaXQgc29tZXRoaW5nIHlvdSBoYXZlIHNlZW4gZHVyaW5nIHlvdXIgdGVzdGluZz8KCklm
IHNvLCBob3cgbWFueSBMUnMgZG9lcyB0aGUgcGxhdGZvcm0gcHJvdmlkZT8gQ2FuIHlvdSBwcm92
aWRlIG1vcmUgZGV0YWlscyBvbiAKeW91ciB1c2UgY2FzZT8gSSBkb24ndCBuZWVkIHRoZSBmdWxs
IGRldGFpbHMsIGJ1dCByb3VnaGx5IHRoZSBudW1iZXIgb2YgCmludGVycnVwdHMgdXNlZCBhbmQg
b2Z0ZW4gdGhleSB0cmlnZ2VyLgoKQWRkaXRpb25hbGx5LCBpdCB3b3VsZCBiZSBnb29kIHRvIGtu
b3cgdGhlIHVzYWdlIG92ZXIgdGhlIHRpbWUuICBZb3UgY291bGQgCm1vZGlmeSBYZW4gdG8gcmVj
b3JkIHRoZSBudW1iZXIgb2YgTFJzIHVzZWQgdG8gZWFjaCBlbnRyeS4KCj4gV2hpbGUgdGhlbSB0
b2dldGhlciBtYWtlIHRoZSBjb2RlIG1vcmUgc3RyYWlnaHQgZm9yd2FyZCBhbmQgY2xlYXIsIGJl
Y2F1c2U6Cj4gIMKgLSB5b3Ugc3RhcnQgYWxsIEMtY29kZWQgY29tbW9uIHRyYXAgaGFuZGxlcnMg
d2l0aCBJUlFzIGxvY2tlZCwgYW5kIGZyZWUgZnJvbSAKPiBhc20gY29kZSBtaXN1bmRlcnN0YW5k
aW5nCgpXZWxsLCB0aGVyZSBhcmUgb25seSBvbmUgKHR3byBpZiB5b3UgY291bnQgdGhlIEZJUSkg
Y2FzZSB3aGVyZSBpbnRlcnJ1cHRzIGFyZSAKa2VwdCBkaXNhYmxlZCwgdGhpcyBpcyB3aGVuIHJl
Y2VpdmluZyBhbiBpbnRlcnJ1cHQuIEkgZG9uJ3Qgc2VlIGl0IGFzIGEgZ29vZCAKZW5vdWdoIGp1
c3RpZmljYXRpb24gdG8gaGF2ZSB0byBpbXBvc2UgdGhhdCB0byBhbGwgdGhlIGhhbmRsZXJzLgoK
PiAgwqAtIGFsbCBjb21tb24gdHJhcCBoYW5kbGVycyBhcmUgZGlzdGluY3QgaW4gdGhlaXIgbmFt
aW5nLCBwdXJwb3NlIGFuZCBhY3Rpb24uIAo+IEluIHRlcm1zIG9mIGNhbGxpbmcgYGVudGVyX2h5
cGVydmlzb3JfaGVhZCgpYCBvbmx5IGZyb20gdGhlIHRyYXBzIHRha2VuIGZyb20gZ3Vlc3QuCgpU
aGVyZSBhcmUgbmVhcmx5IG5vIGRpZmZlcmVuY2UgYmV0d2VlbiByZWNlaXZpbmcgYW4gaW50ZXJy
dXB0IHdoaWxlIHJ1bm5pbmcgdGhlIApndWVzdCBtb2RlIGFuZCB3aGlsZSBydW5uaW5nIGluIGh5
cGVydmlzb3IgbW9kZS4gU28gd2hhdCBkbyB5b3UgcmVhbGx5IGdhaW4gd2l0aCAKdGhlIGR1cGxp
Y2F0aW9uPwoKQ2hlZXJzLAoKWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMjMzNS5odG1sCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
