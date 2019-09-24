Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C83BC7A0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 14:10:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCjaX-0002h4-Bt; Tue, 24 Sep 2019 12:06:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCjaV-0002gR-Vw
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 12:06:36 +0000
X-Inumbo-ID: c0b9082d-dec3-11e9-9618-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id c0b9082d-dec3-11e9-9618-12813bfff9fa;
 Tue, 24 Sep 2019 12:06:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 818B2142F;
 Tue, 24 Sep 2019 05:06:34 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E96443F67D;
 Tue, 24 Sep 2019 05:06:33 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
 <20190918185041.22738-5-volodymyr_babchuk@epam.com>
 <b6ddb159-463f-2e30-35b8-5aefae38b94f@arm.com> <87ef069b7w.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <de2f8861-8705-bd99-268b-2312dd50d84c@arm.com>
Date: Tue, 24 Sep 2019 13:06:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87ef069b7w.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/6] xen/arm: optee: handle shared buffer
 translation error
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

CgpPbiAyNC8wOS8yMDE5IDEyOjM3LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiBIaSBK
dWxpZW4sCj4gCj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPiAKPj4gSGksCj4+Cj4+IE9uIDE4LzA5
LzIwMTkgMTk6NTEsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+Pj4gKy8qIEhhbmRsZXMgcmV0
dXJuIGZyb20gWGVuLWlzc3VlZCBSUEMgKi8KPj4+ICtzdGF0aWMgdm9pZCBoYW5kbGVfeGVuX3Jw
Y19yZXR1cm4oc3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4LAo+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywKPj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG9wdGVlX3N0ZF9jYWxsICpjYWxsLAo+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2htX3JwYyAqc2ht
X3JwYykKPj4+ICt7Cj4+PiArICAgIGNhbGwtPnN0YXRlID0gT1BURUVfQ0FMTF9OT1JNQUw7Cj4+
PiArCj4+PiArICAgIC8qCj4+PiArICAgICAqIFJpZ2h0IG5vdyB3ZSBoYXZlIG9ubHkgb25lIHJl
YXNvbiB0byBiZSB0aGVyZSAtIHdlIGFza2VkIGd1ZXN0Cj4+PiArICAgICAqIHRvIGZyZWUgc2hh
cmVkIGJ1ZmZlciBhbmQgaXQgZGlkIGl0LiBOb3cgd2UgY2FuIHRlbGwgT1AtVEVFCj4+PiArICAg
ICAqIHRoYXQgYnVmZmVyIGFsbG9jYXRpb24gZmFpbGVkLiBXZSBhcmUgbm90IHN0b3JpbmcgZXhh
Y3QgY29tbWFuZAo+Pj4gKyAgICAgKiB0eXBlLCBvbmx5IHR5cGUgb2YgUlBDIHJldHVybi4gU28s
IHRoaXMgaXMgdGhlIG9ubHkgY2hlY2sgd2UKPj4+ICsgICAgICogY2FuIHBlcmZvcm0gdGhlcmUu
Cj4+PiArICAgICAqLwo+Pj4gKyAgICBBU1NFUlQoY2FsbC0+cnBjX29wID09IE9QVEVFX1NNQ19S
UENfRlVOQ19DTUQpOwo+Pgo+PiBBcyBJIHBvaW50ZWQgb3V0IGluIHYxLCBBU1NFUlQoKSBpcyBw
cm9iYWJseSB0aGUgbGVzcyBkZXNpcmFibGUKPj4gc29sdXRpb24gaGVyZSBhcyB0aGlzIGlzIGFu
IGVycm9yIHBhdGguCj4gTG9va3MgbGlrZSBJIG1pc3VuZGVyc3Rvb2QgeW91IDooCj4gCj4+IENh
biB5b3UgZXhwbGFpbiB3aHkgeW91IGNob3NlIHRoYXQgb3ZlciB0aGUgMyBzb2x1dGlvbnMgSSBz
dWdnZXN0ZWQ/Cj4gSSB0aGluayBJIG5lZWQgc29tZSBjbGFyaWZpY2F0aW9uIHRoZXJlLiBBU1NF
UlQoKSBpcyBhZG9wdGVkIHdheSB0byB0ZWxsCj4gYWJvdXQgaW52YXJpYW50LiBDbGVhcmx5LCB0
aGlzIGlzIHByb2dyYW1taW5nIGVycm9yIGlmIEFTU0VSVCgpIGZhaWxzLgoKVGhhdCdzIGNvcnJl
Y3QuCgo+IAo+IEJ1dCBJIHVuZGVyc3RhbmQsIHRoYXQgQVNTRVJUKCkgaXMgYXZhaWxhYmxlIG9u
bHkgaW4gZGVidWcgYnVpbGQuIFNvLCBpbgo+IHJlbGVhc2UgaXQgd2lsbCBuZXZlciBmaXJlLiBB
cyB0aGlzIGlzIHZlcnkgdW5saWtlbHkgZXJyb3IgcGF0aCwgYnVnCj4gdGhlcmUgY2FuIGxpdmUg
Zm9yZXZlci4gT2theSwgc28gQVNTRVJUKCkgaXMgdGhlIGxlYXN0IGRlc2lyYWJsZSB3YXkuCgpU
aGlzIGlzIG15IGNvbmNlcm4sIEFTU0VSVCgpIGFyZSBmaW5lIGluIHBhdGggdGhhdCBjYW4gYmUg
ZXhlcmNpc2VkIHF1aXRlIHdlbGwuIApCeSBleHBlcmllbmNlLCBlcnJvciBwYXRoIGFzIG5vdCBz
byB3ZWxsIHRlc3RlZCwgc28gYW55IHZlcmJvc2l0eSBpbiBub24tZGVidWcgCmJ1aWxkIGlzIGFs
d2F5cyBoZWxwZnVsLgoKPiAKPiBXYXJuaW5nIGlzIG5vdCBlbm91Z2gsIGFzIHdlIGFyZSBhbHJl
YWR5IGluIGluY29ycmVjdCBzdGF0ZS4KCkluY29ycmVjdCBzdGF0ZSBmb3Igd2hvPyBUaGUgZ3Vl
c3Q/Cgo+IAo+IFNvLCBiZXN0IHdheSBpcyB0byBjcmFzaCBndWVzdCwgaXQgdGhpcyBjb3JyZWN0
PyBJJ2xsIGRvIHRoaXMgaW4gdGhlCj4gbmV4dCB2ZXJzaW9uIHRoZW4uCgpBIHJ1bGUgb2YgdGh1
bWIgaXMKICAgLSBCVUdfT04gY2FuIGJlIHJlcGxhY2VkIGJ5IGRvbWFpbl9jcmFzaCgpIGFzIHRo
aXMgaXMgYSBmYXRhbCBlcnJvciB5b3UgY2FuJ3QgCnJlY292ZXIgKHRoZSBzY29wZSBkZXBlbmRz
IG9uIHRoZSBmdW5jdGlvbiBjYWxsKS4KCiAgIC0gQVNTRVJUKCkgY2FuIGJlIHJlcGxhY2VkIGJ5
IFdBUk5fT04oKSBhcyB0aGUgZm9ybWVyIHdpbGwgYmUgYSBOT1AgaW4gCm5vbi1kZWJ1ZyBidWls
ZC4gSW4gYm90aCBjYXNlLCB0aGUgZXJyb3IgaXMgbm90IGZhdGFsIGFuZCBjb250aW51ZSB3aWxs
IG5vdCAKcmVzdWx0IFNvIGl0IG1lYW5zIHRoZSBlcnJvciBpcyBub3QgZmF0YWwuCgpZb3UgdXNl
ZCBBU1NFUlQoKSBpbiB5b3VyIGNvZGUsIHNvIGl0IGZlZWxzIHRvIG1lIHRoYXQgV0FSTl9PTigp
IHdvdWxkIGJlIGEgCnN1aXRhYmxlIHJlcGxhY2VtZW50LgoKSG93ZXZlciwgaWYgdGhlIHN0YXRl
IGluY29uc2lzdGVuY3kgaXMgZm9yIFhlbiwgdGhlbiBkb21haW5fY3Jhc2goKSBpcyB0aGUgYmVz
dC4gCklmIHRoaXMgaXMgZm9yIHRoZSBndWVzdCwgdGhlbiB0aGlzIGlzIG5vdCByZWFsbHkgb3Vy
IGJ1c2luZXNzIGFuZCBpdCBtYXkgYmUgCmJlc3QgdG8gbGV0IGhpbSBjb250aW51ZSBhcyBpdCBj
b3VsZCBwcm92aWRlIG1vcmUgZGVidWcgKGRvbWFpbl9jcmFzaCgpIHdpbGwgCm9ubHkgZHVtcCB0
aGUgc3RhY2sgYW5kIHJlZ2lzdGVycykuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
