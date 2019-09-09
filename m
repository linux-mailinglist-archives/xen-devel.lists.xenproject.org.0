Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2DCAE0FC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 00:24:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7S0r-0006NT-1u; Mon, 09 Sep 2019 22:19:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fSZh=XE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7S0p-0006NO-TW
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 22:19:55 +0000
X-Inumbo-ID: f34d6e6a-d34f-11e9-b299-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f34d6e6a-d34f-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 22:19:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD09828;
 Mon,  9 Sep 2019 15:19:54 -0700 (PDT)
Received: from [10.37.12.117] (unknown [10.37.12.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B99F33F59C;
 Mon,  9 Sep 2019 15:19:53 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-3-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d72ca72d-81b7-f74d-86fd-24cc54bb4102@arm.com>
Date: Mon, 9 Sep 2019 23:19:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823184826.14525-3-volodymyr_babchuk@epam.com>
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
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gOC8yMy8xOSA3OjQ4IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90
ZToKPiBOb3cgd2UgaGF2ZSBsaW1pdCBmb3Igb25lIHNoYXJlZCBidWZmZXIgc2l6ZSwgc28gd2Ug
Y2FuIGJlIHN1cmUgdGhhdAo+IG9uZSBjYWxsIHRvIGZyZWVfb3B0ZWVfc2htX2J1ZigpIHdpbGwg
bm90IGZyZWUgYWxsCj4gTUFYX1RPVEFMX1NNSF9CVUZfUEcgcGFnZXMgYXQgb25jZS4gVGh1cywg
d2Ugbm93IGNhbiBjaGVjayBmb3IKPiBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpIGluIHRoZSBs
b29wIGluc2lkZQo+IG9wdGVlX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkgYW5kIHRoaXMgd2lsbCBl
bnN1cmUgdGhhdCB3ZSBhcmUgbm90Cj4gbWlzc2luZyBwcmVlbXB0aW9uLgoKSSBhbSBub3Qgc3Vy
ZSB0byB1bmRlcnN0YW5kIHRoZSBjb3JyZWxhdGlvbiBiZXR3ZWVuIHRoZSB0d28gc2VudGVuY2Vz
LiAKRXZlbiBpZiBwcmV2aW91c2x5IHRoZSBndWVzdCBjb3VsZCBwaW4gdXAgdG8gTUFYX1RPVEFM
X1NITV9CVUZfUEcgaW4gb25lIApjYWxsLCBhIHdlbGwtYmVoYXZlZCBndWVzdCB3b3VsZCByZXN1
bHQgdG8gZG8gbXVsdGlwbGUgY2FsbHMgYW5kIAp0aGVyZWZvcmUgcHJlZW1wdGlvbiB3b3VsZCBo
YXZlIGJlZW4gdXNlZnVsLgoKU28gSSB0aGluayB0aGUgY29tbWl0IG1lc3NhZ2UgbmVlZHMgc29t
ZSByZXdvcmRpbmcuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xv
ZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS90ZWUvb3B0ZWUu
YyB8IDEwICsrKysrLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYyBi
L3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYwo+IGluZGV4IGY0ZmE4YTc3NTguLmE4NGZmYTMwODkg
MTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jCj4gKysrIGIveGVuL2FyY2gv
YXJtL3RlZS9vcHRlZS5jCj4gQEAgLTYzNCwxNCArNjM0LDE0IEBAIHN0YXRpYyBpbnQgb3B0ZWVf
cmVsaW5xdWlzaF9yZXNvdXJjZXMoc3RydWN0IGRvbWFpbiAqZCkKPiAgICAgICBpZiAoIGh5cGVy
Y2FsbF9wcmVlbXB0X2NoZWNrKCkgKQo+ICAgICAgICAgICByZXR1cm4gLUVSRVNUQVJUOwo+ICAg
Cj4gLSAgICAvKgo+IC0gICAgICogVE9ETzogR3Vlc3QgY2FuIHBpbiB1cCB0byBNQVhfVE9UQUxf
U01IX0JVRl9QRyBwYWdlcyBhbmQgYWxsIG9mCj4gLSAgICAgKiB0aGVtIHdpbGwgYmUgcHV0IGlu
IHRoaXMgbG9vcC4gSXQgaXMgd29ydGggY29uc2lkZXJpbmcgdG8KPiAtICAgICAqIGNoZWNrIGZv
ciBwcmVlbXB0aW9uIGluc2lkZSB0aGUgbG9vcC4KPiAtICAgICAqLwo+ICAgICAgIGxpc3RfZm9y
X2VhY2hfZW50cnlfc2FmZSggb3B0ZWVfc2htX2J1Ziwgb3B0ZWVfc2htX2J1Zl90bXAsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY3R4LT5vcHRlZV9zaG1fYnVmX2xpc3QsIGxp
c3QgKQo+ICsgICAgewo+ICsgICAgICAgIGlmICggaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSAp
CgpTbyBvbiB0aGUgZmlyc3QgaXRlcmF0aW9uLCB5b3Ugd2lsbCBjaGVjayB0d2ljZSBwcmVlbXB0
aW9uIChvbmUgYmVmb3JlIAp0aGUgbG9vcCBhbmQganVzdCBlbnRlcmluZykuIGh5cGVyY2FsbF9w
cmVlbXB0X2NoZWNrKCkuIFRoZSBmdW5jdGlvbiBpcyAKbm90IGVudGlyZWx5IGZyZWUgb24gQXJt
IGJlY2F1c2Ugb2YgdGhlIGltcGxlbWVudGF0aW9uIG9mIAp2Z2ljX3ZjcHVfcGVuZGluZ19pcnEo
KS4gU28gcHJldmVudGluZyBwb2ludGxlc3MgY2FsbCB3b3VsZCBiZSBuaWNlLgoKSW4gdGhpcyBj
YXNlLCB0aGUgaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSBiZWZvcmUgdGhlIGxvb3AgY291bGQg
YmUgCmRyb3BwZWQuCgo+ICsgICAgICAgICAgICByZXR1cm4gLUVSRVNUQVJUOwo+ICsKPiAgICAg
ICAgICAgZnJlZV9vcHRlZV9zaG1fYnVmKGN0eCwgb3B0ZWVfc2htX2J1Zi0+Y29va2llKTsKPiAr
ICAgIH0KPiAgIAo+ICAgICAgIGlmICggaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSApCj4gICAg
ICAgICAgIHJldHVybiAtRVJFU1RBUlQ7Cj4gCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
