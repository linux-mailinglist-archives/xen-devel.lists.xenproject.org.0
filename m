Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2792D571B9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 21:26:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgDWe-0002DR-2W; Wed, 26 Jun 2019 19:24:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hgDWc-0002DM-8P
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 19:24:10 +0000
X-Inumbo-ID: f84042a9-9847-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f84042a9-9847-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 19:24:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A7EB360;
 Wed, 26 Jun 2019 12:24:08 -0700 (PDT)
Received: from [10.37.12.58] (unknown [10.37.12.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4E443F718;
 Wed, 26 Jun 2019 12:24:06 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-3-julien.grall@arm.com>
 <alpine.DEB.2.21.1906251627270.5851@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906251656420.5851@sstabellini-ThinkPad-T480s>
 <31afe099-1a7b-d8f3-6d11-0fdf78594c2e@arm.com>
 <alpine.DEB.2.21.1906260827080.5851@sstabellini-ThinkPad-T480s>
 <d8c94588-8f7f-84a5-aed1-fe7bfe7bd178@arm.com>
 <alpine.DEB.2.21.1906261130190.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <255f56d2-e01c-9aaf-3bb0-29436c0798e2@arm.com>
Date: Wed, 26 Jun 2019 20:24:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906261130190.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 02/17] xen/arm64: head: Don't clobber x30/lr
 in the macro PRINT
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMjYvMTkgNzozMiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIFdlZCwgMjYgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgU3RlZmFu
bywKPj4KPj4gT24gMjYvMDYvMjAxOSAxNjoyNywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+
Pj4gT24gV2VkLCAyNiBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEhpIFN0ZWZh
bm8sCj4+Pj4KPj4+PiBPbiAyNi8wNi8yMDE5IDAwOjU5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6Cj4+Pj4+IE9uIFR1ZSwgMjUgSnVuIDIwMTksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
Pj4+Pj4+IE9uIE1vbiwgMTAgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4+Pj4g
ICAgIFRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIHRoZSBtYWNybyBQUklOVCB3aWxsIGNs
b2JiZXIKPj4+Pj4+Pj4geDMwL2xyLgo+Pj4+Pj4+PiBUaGlzCj4+Pj4+Pj4gbWVhbnMgdGhlIHVz
ZXIgc2hvdWxkIHNhdmUgbHIgaWYgaXQgY2FyZXMgYWJvdXQgaXQuCj4+Pj4+Pgo+Pj4+Pj4gQnkg
eDMwL2xyLCBkbyB5b3UgbWVhbiB4MC14MyBhbmQgbHI/IEkgd291bGQgcHJlZmVyIGEgY2xlYXJl
cgo+Pj4+Pj4gZXhwcmVzc2lvbi4KPj4+Pj4KPj4+Pj4gTm8gb2YgY291cnNlIG5vdCEgWW91IG1l
YW50IHgzMCB3aGljaCBpcyBhIHN5bm9ueW0gb2YgbHIhIEl0IGlzIGp1c3QKPj4+Pj4gdGhhdCBp
biB0aGlzIGNhc2UgaXQgaXMgYWxzbyBzdXBwb3NlZCB0byBjbG9iYmVyIHgwLXgzIC0tIEkgZ290
Cj4+Pj4+IGNvbmZ1c2VkISBUaGUgY29tbWl0IG1lc3NhZ2UgaXMgYWxzbyBmaW5lIGFzIGlzIHRo
ZW4uIE1vcmUgYmVsb3cuCj4+Pj4+Cj4+Pj4+Cj4+Pj4+PiBSZXZpZXdlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pj4g
Rm9sbG93LXVwIHBhdGNoZXMgd2lsbCBpbnRyb2R1Y2UgbW9yZSB1c2Ugb2YgUFJJTlQgaW4gcGxh
Y2Ugd2hlcmUgbHIKPj4+Pj4+PiBzaG91bGQgYmUgcHJlc2VydmVkLiBSYXRoZXIgdGhhbiByZXF1
aXJpbmcgYWxsIHRoZSB1c2VycyB0byBwcmVzZXJ2ZQo+Pj4+Pj4+IGxyLAo+Pj4+Pj4+IHRoZSBt
YWNybyBQUklOVCBpcyBtb2RpZmllZCB0byBzYXZlIGFuZCByZXN0b3JlIGl0Lgo+Pj4+Pj4+Cj4+
Pj4+Pj4gV2hpbGUgdGhlIGNvbW1lbnQgc3RhdGUgeDMgd2lsbCBiZSBjbG9iYmVyZWQsIHRoaXMg
aXMgbm90IHRoZSBjYXNlLgo+Pj4+Pj4+IFNvCj4+Pj4+Pj4gUFJJTlQgd2lsbCB1c2UgeDMgdG8g
cHJlc2VydmUgbHIuCj4+Pj4+Pj4KPj4+Pj4+PiBMYXN0bHksIHRha2UgdGhlIG9wcG9ydHVuaXR5
IHRvIG1vdmUgdGhlIGNvbW1lbnQgb24gdG9wIG9mIFBSSU5UIGFuZAo+Pj4+Pj4+IHVzZQo+Pj4+
Pj4+IFBSSU5UIGluIGluaXRfdWFydC4gQm90aCBjaGFuZ2VzIHdpbGwgYmUgaGVscGZ1bCBpbiBh
IGZvbGxvdy11cAo+Pj4+Pj4+IHBhdGNoLgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiAg
ICAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDE0ICsrKysrKysrKy0tLS0tCj4+Pj4+Pj4g
ICAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pj4+
Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9h
cmNoL2FybS9hcm02NC9oZWFkLlMKPj4+Pj4+PiBpbmRleCBjOGJiZGYwNWE2Li5hNTE0N2M4ZDgw
IDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPj4+Pj4+PiAr
KysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4+Pj4+Pj4gQEAgLTc4LDEyICs3OCwxNyBA
QAo+Pj4+Pj4+ICAgICAgKiAgeDMwIC0gbHIKPj4+Pj4+PiAgICAgICovCj4+Pj4+Pj4gICAgIC0v
KiBNYWNybyB0byBwcmludCBhIHN0cmluZyB0byB0aGUgVUFSVCwgaWYgdGhlcmUgaXMgb25lLgo+
Pj4+Pj4+IC0gKiBDbG9iYmVycyB4MC14My4gKi8KPj4+Pj4+PiAgICAgI2lmZGVmIENPTkZJR19F
QVJMWV9QUklOVEsKPj4+Pj4+PiArLyoKPj4+Pj4+PiArICogTWFjcm8gdG8gcHJpbnQgYSBzdHJp
bmcgdG8gdGhlIFVBUlQsIGlmIHRoZXJlIGlzIG9uZS4KPj4+Pj4+PiArICoKPj4+Pj4+PiArICog
Q2xvYmJlcnMgeDAgLSB4Mwo+Pj4+Pj4+ICsgKi8KPj4+Pj4+PiAgICAgI2RlZmluZSBQUklOVChf
cykgICAgICAgICAgIFwKPj4+Pj4+PiArICAgICAgICBtb3YgICB4MywgbHIgIDsgICAgIFwKPj4+
Pj4+PiAgICAgICAgICAgICBhZHIgICB4MCwgOThmIDsgICAgIFwKPj4+Pj4+PiAgICAgICAgICAg
ICBibCAgICBwdXRzICAgIDsgICAgIFwKPj4+Pj4+PiArICAgICAgICBtb3YgICBsciwgeDMgIDsg
ICAgIFwKPj4+Pj4+PiAgICAgICAgICAgICBST0RBVEFfU1RSKDk4LCBfcykKPj4+Pj4KPj4+Pj4g
U3RyYW5nZWx5IGVub3VnaCBJIGdldCBhIGJ1aWxkIGVycm9yIHdpdGggZ2NjIDcuMy4xLCBidXQg
aWYgSSB1c2UgeDMwCj4+Pj4+IGluc3RlYWQgb2YgbHIsIGl0IGJ1aWxkcyBmaW5lLiBIYXZlIHlv
dSBzZWVuIHRoaXMgYmVmb3JlPwo+Pj4+Cj4+Pj4gSG1tbSwgSSBjYW4ndCB0byByZXByb2R1Y2Ug
aXQgZXZlbiBvbiBvbGRlciBjb21waWxlciAoNC45KS4gTXkgZ3Vlc3MgaXMKPj4+PiBub3QKPj4+
PiBhbGwgdGhlIGFzc2VtYmxlciBpcyBhYmxlIHRvIHVuZGVyc3RhbmQgImxyIi4KPj4+Pgo+Pj4+
IEluIHRoZSBmaWxlIGVudHJ5LlMgd2UgaGF2ZSB0aGUgZm9sbG93aW5nIGxpbmU6Cj4+Pj4KPj4+
PiBsciAgICAgIC5yZXEgICAgeDMwICAgICAgICAgICAgIC8vIGxpbmsgcmVnaXN0ZXIKPj4+Pgo+
Pj4+Cj4+Pj4gQ291bGQgeW91IGdpdmUgYSB0cnkgdG8gYWRkIHRoZSBsaW5lIGluIGhlYWQuUz8K
Pj4+Cj4+PiBUaGF0IHdvcmtzCj4+Cj4+IFRoYW5rIHlvdS4KPj4KPj4gSSB0aG91Z2h0IGEgYml0
IG1vcmUgZHVyaW5nIHRoZSBkYXkgYW5kIGRlY2lkZWQgdG8gdXNlICJ4MzAiIGRpcmVjdGx5IHJh
dGhlcgo+PiB0aGFuIGxyLiBXZSBjYW4gZGVjaWRlIHRvIHJldmlzaXQgaXQgaWYgd2UgdGhpbmsg
dGhlIGNvZGUgaXMgdG9vIGRpZmZpY3VsdCB0bwo+PiByZWFkLgo+IAo+IEkgd2FzIGdvaW5nIHRv
IHN1Z2dlc3QgeDMwIHRvbyB5ZXN0ZXJkYXksIGJ1dCBpZiB3ZSBjYW4gbWFrZSBgbHInIHdvcmsK
PiB0aGVuIHRoYXQgd291bGQgYmUgbXkgcHJlZmVyZW5jZSBiZWNhdXNlIGl0IG1ha2VzIGl0IG1v
cmUgaW1tZWRpYXRlbHkKPiBvYnZpb3VzIHdoYXQgdGhlIGNvZGUgaXMgZG9pbmcuCgpJIHdpbGwg
aGF2ZSBhIGxvb2sgdG8gbW92ZSB0aGUgbGluZSBpbiBhbiBoZWFkZXIuCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
