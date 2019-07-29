Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B9478E04
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 16:30:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs6dO-0001wf-H1; Mon, 29 Jul 2019 14:28:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uQHP=V2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hs6dM-0001wa-Vy
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 14:28:17 +0000
X-Inumbo-ID: 19b09d4d-b20d-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 19b09d4d-b20d-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 14:28:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 259C6AE2F;
 Mon, 29 Jul 2019 14:28:14 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190728084100.13071-1-jgross@suse.com>
 <20190728084100.13071-2-jgross@suse.com>
 <014a658d-c2d5-0497-a2b3-793997f952ad@suse.com>
 <1895d2d8-db34-8c93-09c2-56f11b890cd6@suse.com>
 <58a04e6c-8dbc-198c-cfb2-16a5b626bfb8@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <954eb28c-1aeb-8072-aa17-5e4e4f0bba52@suse.com>
Date: Mon, 29 Jul 2019 16:28:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <58a04e6c-8dbc-198c-cfb2-16a5b626bfb8@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] xen: move debugtrace coding to
 common/debugtrace.c
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMTkgMTY6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI5LjA3LjIwMTkgMTU6
MzAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDI5LjA3LjE5IDE0OjQ1LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDI4LjA3LjIwMTkgMTA6NDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gLSNlbmRpZiAvKiAhQ09ORklHX0RFQlVHX1RSQUNFICovCj4+Pj4gLQo+Pj4+IC0KPj4+PiAg
wqDCoCAvKgo+Pj4+ICDCoMKgwqAgKiAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+Pj4+ICDCoMKgwqAgKiAqKioqKioqKioqKioq
KiogRGVidWdnaW5nL3RyYWNpbmcvZXJyb3ItcmVwb3J0ICoqKioqKioqKioqKioqKgo+Pj4KPj4+
IC4uLiB3aGF0IGFib3V0IHRoaXMgb25lPyBUaGVyZSdzIG9ubHkgcGFuaWMoKSBiZXR3ZWVuIGl0
IGFuZCB0aGUgbmV4dAo+Pj4gc3VjaCBjb21tZW50LCBhbmQgSSBkb24ndCB0aGluayB0aGUgIkRl
YnVnZ2luZy90cmFjaW5nIiBwYXJ0IG9mIGl0Cj4+PiBhcmUgYXBwbGljYWJsZSAoYW55bW9yZSku
Cj4+Cj4+IFRydWUuIEknbGwgcmVtb3ZlIHRoZSAiRGVidWdnaW5nL3RyYWNpbmciIHBhcnQuCj4+
Cj4+Pgo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9jb25zb2xlLmgKPj4+PiArKysgYi94ZW4v
aW5jbHVkZS94ZW4vY29uc29sZS5oCj4+Pj4gQEAgLTQ4LDQgKzQ4LDggQEAgaW50IGNvbnNvbGVf
cmVzdW1lKHZvaWQpOwo+Pj4+ICDCoMKgIGV4dGVybiBpbnQ4X3Qgb3B0X2NvbnNvbGVfeGVuOwo+
Pj4+ICsvKiBJc3N1ZSBzdHJpbmcgdmlhIHNlcmlhbCBsaW5lLiAqLwo+Pj4+ICtleHRlcm4gaW50
IHNlcmNvbl9oYW5kbGU7Cj4+Pj4gK3ZvaWQgc2VyY29uX3B1dHMoY29uc3QgY2hhciAqcyk7Cj4+
Pgo+Pj4gSSBndWVzcyBhdm9pZGluZyB0aGVpciBleHBvc3VyZSB3YXMgb25lIG9mIHRoZSByZWFz
b25zIHRoZSBkZWJ1ZyB0cmFjZQo+Pj4gY29kZSBsaXZlZCBpbiB0aGUgcGxhY2UgeW91IG1vdmUg
aXQgZnJvbS4gSSdtIHVuY29udmluY2VkIG5vbi1jb25zb2xlCj4+PiBjb2RlIGlzIGFjdHVhbGx5
IHN1cHBvc2VkIHRvIG1ha2UgdXNlIG9mIGVpdGhlciwgYnV0IEknbSBub3Qgb3Bwb3NlZAo+Pj4g
ZW5vdWdoIHRvIG5hayB0aGUgY2hhbmdlLiBJIGRvbid0IHRoaW5rIHRob3VnaCB0aGUgY29tbWVu
dCBmaXRzIHdlbGwKPj4+IHdpdGggdGhlIHZhcmlhYmxlIGRlY2xhcmF0aW9uLgo+Pgo+PiBzZXJj
b25faGFuZGxlIGlzIHVzZWQgZm9yIGNhbGxpbmcgc2VyaWFsX3B1dHMoKSwgc28gbWF5YmUgaW5z
dGVhZCBvZgo+PiBkaXJlY3RseSB1c2luZyBzZXJpYWxfcHV0cygpIHdpdGggc2VyY29uX2hhbmRs
ZSBJIHNob3VsZCBhZGQgYSB3cmFwcGVyCj4+IHRvIGNvbnNvbGUuYyAoZS5nLiBjb25zb2xlX3Nl
cmlhbF9wdXRzKCkpPyBJdCBzaG91bGQgYmUgbm90ZWQgdGhhdAo+PiBzZXJpYWxfcHV0cygpIGlz
IGNhbGxlZCBvbmx5IGluIGNhc2Ugb2YgZGVidWd0cmFjZSBvdXRwdXQgdG9nZ2xlZCB0byBnbwo+
PiB0byB0aGUgY29uc29sZS4gSSBndWVzcyB1c2luZyBzZXJpYWxfcHV0cygpIGluIHRoYXQgY2Fz
ZSBpcyBtZWFudCB0bwo+PiBhdm9pZCB0b28gbWFueSBzb2Z0d2FyZSBsYXllcnMgd2hlbiBkb2lu
ZyB0aGUgb3V0cHV0Lgo+IAo+IEhtbSwgSSdkIHJhdGhlciBleHBlY3QgdGhpcyB0byBiZSB1c2Vk
IHRvIGF2b2lkIGRvaW5nIGFueXRoaW5nIGVsc2UKPiBzZXJjb25fcHV0cygpIGRvZXMgYmVzaWRl
cyBjYWxsaW5nIHNlcmlhbF9wdXRzKCkuIFRoZXNlIG90aGVyIHN0ZXBzCj4gYXJlIGFsc28gd2h5
IEkgdGhpbmsgdGhpcyBpcyB0byByZW1haW4gYSBjb25zb2xlIGludGVybmFsIGludGVyZmFjZS4K
ClRvIG1lIGl0IHNlZW1zIGEgbGl0dGxlIGJpdCBzdHJhbmdlIHRvIGhhdmUgdGhlIGJ1ZmZlciBk
dW1waW5nIHVzaW5nCnNlcmNvbl9wdXRzKCkgd2hpbGUgaXNzdWluZyB0aGUgYWN0dWFsIHRyYWNl
IGVudHJpZXMgdG8gY29uc29sZSBpc24ndAp1c2luZyBpdC4KCj4gCj4+IEl0IHdvdWxkIGJlCj4+
IHBvc3NpYmxlIHRvIHVzZSBzZXJjb25fcHV0cygpIGZvciB0aGF0IGNhc2UsIHRvbywgcmVzdWx0
aW5nIGluIHRoZQo+PiBpbmFiaWxpdHkgdG8gdXNlIGRlYnVndHJhY2VfcHJpbnRrKCkgaW4gdGhl
IHRoZW4gYWRkaXRpb25hbGx5IG5lZWRlZAo+PiBwYXRocyAob3IgYmV0dGVyOiB0byB1c2UgaXQg
d2l0aCBvdXRwdXQgcmVkaXJlY3RlZCB0byBjb25zb2xlKS4KPj4KPj4gc2VyY29uX3B1dHMoKSBj
b3VsZCB1c2UgYW5vdGhlciB3cmFwcGVyLCBlLmcuIGNvbnNvbGVfZGVidWdfcHV0cygpLgo+Pgo+
PiBXb3VsZCB5b3UgbGlrZSB0aGF0IGJldHRlcj8KPiAKPiBQcm9iYWJseSBub3QuIEkgd29uZGVy
IHdoZXRoZXIgc3BsaXR0aW5nIG91dCB0aGlzIGNvZGUgaXMgcmVhbGx5IGEKPiBnb29kIHN0ZXAu
CgpJJ20gbm90IGZpZ2h0aW5nIGZvciBpdCwgSSBqdXN0IHRob3VnaHQgaXQgd291bGQgYmV0dGVy
IGJlIHB1dCBpbnRvIGEKZmlsZSBvZiBpdHMgb3duLgoKSW4gY2FzZSB5b3UgZGlzYWdyZWUgYW5k
IG90aGVycyBhcmUgbm90IHB1c2hpbmcgZm9yIHNlcGFyYXRpb24gSSdtIGZpbmUKdG8gZHJvcCB0
aGlzIHBhdGNoLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
