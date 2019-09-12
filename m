Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFCFB14D7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 21:42:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Uw7-0006Wa-HJ; Thu, 12 Sep 2019 19:39:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tudw=XH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i8Uw6-0006WV-Nk
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 19:39:22 +0000
X-Inumbo-ID: 0468ac18-d595-11e9-95a5-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0468ac18-d595-11e9-95a5-12813bfff9fa;
 Thu, 12 Sep 2019 19:39:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F51628;
 Thu, 12 Sep 2019 12:39:21 -0700 (PDT)
Received: from [10.37.12.51] (unknown [10.37.12.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EF393F67D;
 Thu, 12 Sep 2019 12:39:19 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-3-volodymyr_babchuk@epam.com>
 <d72ca72d-81b7-f74d-86fd-24cc54bb4102@arm.com> <87impyfyw6.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2a5adc32-80fb-d67f-46e5-074ca92fa372@arm.com>
Date: Thu, 12 Sep 2019 20:39:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87impyfyw6.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/5] xen/arm: optee: check for preemption
 while freeing shared buffers
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gOS8xMS8xOSA3OjUzIFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90
ZToKPiAKPiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBIaSBWb2xvZHlteXIsCj4+Cj4+IE9u
IDgvMjMvMTkgNzo0OCBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+PiBOb3cgd2UgaGF2
ZSBsaW1pdCBmb3Igb25lIHNoYXJlZCBidWZmZXIgc2l6ZSwgc28gd2UgY2FuIGJlIHN1cmUgdGhh
dAo+Pj4gb25lIGNhbGwgdG8gZnJlZV9vcHRlZV9zaG1fYnVmKCkgd2lsbCBub3QgZnJlZSBhbGwK
Pj4+IE1BWF9UT1RBTF9TTUhfQlVGX1BHIHBhZ2VzIGF0IG9uY2UuIFRodXMsIHdlIG5vdyBjYW4g
Y2hlY2sgZm9yCj4+PiBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpIGluIHRoZSBsb29wIGluc2lk
ZQo+Pj4gb3B0ZWVfcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSBhbmQgdGhpcyB3aWxsIGVuc3VyZSB0
aGF0IHdlIGFyZSBub3QKPj4+IG1pc3NpbmcgcHJlZW1wdGlvbi4KPj4KPj4gSSBhbSBub3Qgc3Vy
ZSB0byB1bmRlcnN0YW5kIHRoZSBjb3JyZWxhdGlvbiBiZXR3ZWVuIHRoZSB0d28KPj4gc2VudGVu
Y2VzLiBFdmVuIGlmIHByZXZpb3VzbHkgdGhlIGd1ZXN0IGNvdWxkIHBpbiB1cCB0bwo+PiBNQVhf
VE9UQUxfU0hNX0JVRl9QRyBpbiBvbmUgY2FsbCwgYSB3ZWxsLWJlaGF2ZWQgZ3Vlc3Qgd291bGQg
cmVzdWx0IHRvCj4+IGRvIG11bHRpcGxlIGNhbGxzIGFuZCB0aGVyZWZvcmUgcHJlZW1wdGlvbiB3
b3VsZCBoYXZlIGJlZW4gdXNlZnVsLgo+IExvb2tzIGxpa2Ugbm93IEkgZG9uJ3QgdW5kZXJzdGFu
ZCB5b3UuCj4gCj4gSSdtIHRhbGtpbmcgYWJvdXQgc2hhcmVkIGJ1ZmZlcnMuIFdlIGhhdmUgbGlt
aXRlZCBzaGFyZWQgYnVmZmVyIHRvIHNvbWUKPiByZWFzb25hYmxlIHNpemUuIFRoZXJlIGlzIGJh
ZC0gb3Igd2VsbC1iZWhhdmluZyBndWVzdHMgaW4gdGhpcyBjb250ZXh0LAo+IGJlY2F1c2UgZ3Vl
c3QgY2FuJ3Qgc2hhcmUgb25lIGJpZyBidWZmZXIgaW4gbXVsdGlwbGUgY2FsbHMuIEluIG90aGVy
Cj4gd29ybGRzLCBpZiBndWVzdCAqbmVlZHMqIHRvIHNoYXJlIDUxMk1CIGJ1ZmZlciB3aXRoIE9Q
LVRFRSwgaXQgd2lsbCBiZQo+IGZvcmNlZCB0byBkbyB0aGlzIGluIG9uZSBjYWxsLiBCdXQgd2Ug
YXJlIGZvcmJpZGRpbmcgYmlnIGJ1ZmZlcnMgcmlnaHQKPiBub3cuCj4gCj4gb3B0ZWVfcmVsaW5x
dWlzaF9yZXNvdXJjZXMoKSBpcyBjYWxsZWQgZHVyaW5nIGRvbWFpbiBkZXN0cnVjdGlvbi4gQXQK
PiB0aGlzIHRpbWUgd2UgY2FuIGhhdmUgYSBudW1iZXIgb2Ygc3RpbGwgbGl2aW5nIHNoYXJlZCBi
dWZmZXJzLCBlYWNoIG9mCj4gb25lIGlzIG5vIGJpZ2dlciB0aGFuIDUxMiBwYWdlcy4gVGhhbmtz
IHRvIHRoaXMsIHdlIGNhbiBjYWxsCj4gaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSBvbmx5IGlu
IG9wdGVlX3JlbGlucXVpc2hfcmVzb3VyY2VzKCksIGJ1dCBub3QKPiBpbiBmcmVlX29wdGVlX3No
bV9idWYoKS4KCkkgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuLCBob3dldmVyIG15IHBvaW50IGlz
IHRoYXQgdGhpcyBwYXRjaCBkb2VzIG5vdCAKZGVwZW5kZW50IG9mIHRoZSBwcmV2aW91cyBwYXRj
aC4gRXZlbiBpZiB0aGlzIHBhdGNoIGdvZXMgYWxvbmUsIHlvdSB3aWxsIAppbXByb3ZlIHdlbGwt
YmVoYXZlZCBndWVzdC4gRm9yIGlsbC1iZWhhdmVkIGd1ZXN0LCB0aGUgcHJvYmxlbSB3aWxsIHN0
YXkgCnRoZSBzYW1lIHNvIG5vIGNoYW5nZS4KCj4gCj4gSWYgd2Ugd2lsbCBhbGxvdyBndWVzdCB0
byByZWdpc3RlciBiaWdnZXIgYnVmZmVyLCB0aGFuIHdlIHdpbGwgYmUgZm9yY2VkCj4gdG8gY2hl
Y2sgZm9yIHByZWVtcHRpb24gaW4gZnJlZV9vcHRlZV9zaG1fYnVmKCkgYXMgd2VsbC4KCldlbGwg
eWVzLCBob3dldmVyIHRoaXMgcGF0Y2ggd291bGQgc3RpbGwgYmUgdXNlZnVsIGluZGVwZW5kZW50
bHkgb2YgdGhlIApzaXplIG9mIHRoZSBidWZmZXIuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
