Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1331A9DB9
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 11:04:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5ncv-0003MJ-Fh; Thu, 05 Sep 2019 09:00:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5nct-0003M8-Va
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 09:00:24 +0000
X-Inumbo-ID: 97a35ec2-cfbb-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97a35ec2-cfbb-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 09:00:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BA46EAC8B;
 Thu,  5 Sep 2019 09:00:21 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190819182612.16706-1-andrew.cooper3@citrix.com>
 <20190904175708.18853-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <026889e4-363b-ed1a-0385-e98f8bd9efa8@suse.com>
Date: Thu, 5 Sep 2019 11:00:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904175708.18853-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] x86/AMD: Fix handling of x87
 exception pointers on Fam17h hardware
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxOTo1NywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBBTUQgUHJlLUZhbTE3
aCBDUFVzICJvcHRpbWlzZSIge0YsfVh7U0FWRSxSU1RPUn0gYnkgbm90IHNhdmluZy9yZXN0b3Jp
bmcKPiBGT1AvRklQL0ZEUCBpZiBhbiB4ODcgZXhjZXB0aW9uIGlzbid0IHBlbmRpbmcuICBUaGlz
IGNhdXNlcyBhbiBpbmZvcm1hdGlvbgo+IGxlYWssIENWRS0yMDA2LTEwNTYsIGFuZCB3b3JrZWQg
YXJvdW5kIGJ5IHNldmVyYWwgT1NlcywgaW5jbHVkaW5nIFhlbi4gIEFNRAo+IEZhbTE3aCBDUFVz
IG5vIGxvbmdlciBoYXZlIHRoaXMgbGVhaywgYW5kIGFkdmVydGlzZSBzbyBpbiBhIENQVUlEIGJp
dC4KPiAKPiBJbnRyb2R1Y2UgdGhlIFJTVFJfRlBfRVJSX1BUUlMgZmVhdHVyZSwgYXMgc3BlY2lm
aWVkIGJ5IEFNRCwgYW5kIGV4cG9zZSB0byBhbGwKPiBndWVzdHMgYnkgZGVmYXVsdC4gIFdoaWxl
IGFkanVzdGluZyBsaWJ4bCdzIGNwdWlkIHRhYmxlLCBhZGQgQ0xaRVJPIHdoaWNoCj4gbG9va3Mg
dG8gaGF2ZSBiZWVuIG9taXR0ZWQgcHJldmlvdXNseS4KPiAKPiBBbHNvIGludHJvZHVjZSBhbiBY
ODZfQlVHIGJpdCB0byB0cmlnZ2VyIHRoZSAoRilYUlNUT1Igd29ya2Fyb3VuZCwgYW5kIHNldCBp
dAo+IG9uIEFNRCBoYXJkd2FyZSB3aGVyZSBSU1RSX0ZQX0VSUl9QVFJTIGlzIG5vdCBhZHZlcnRp
c2VkLiAgT3B0aW1pc2UgdGhlCj4gY29uZGl0aW9ucyBmb3IgdGhlIHdvcmthcm91bmQgcGF0aHMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CmlycmVz
cGVjdGl2ZSBvZiBhIGZldyByZW1hcmtzOgoKPiB2MzoKPiAgKiBSZW5hbWUgdG8gWDg2X0JVR19G
UFVfUFRSUwoKV2hpbGUgSSBkaWQgYWdyZWUgdG8gdXNlIHRoaXMgbmFtZSwgSSdkIHN0aWxsIGxp
a2UgdG8gcG9pbnQgb3V0IHRoYXQKd2hldGhlciBvciBub3QgdGhpcyBpcyB2aWV3ZWQgYXMgYSBi
dWcgaXMgYSBtYXR0ZXIgb2YgdGhlIHBvc2l0aW9uCm9uZSB0YWtlcy4gSSdtIHByZXR0eSBzdXJl
IHRoZSBBTUQgZW5naW5lZXJzIG9yaWdpbmFsbHkgaGF2aW5nIGRlY2lkZWQKdG8gYXZvaWQgc2F2
aW5nL3Jlc3RvcmluZyB0aGVzZSB2YWx1ZSB3b3VsZG4ndCBoYXZlIGNhbGxlZCB0aGlzIGEgYnVn
LApidXQgYSBmZWF0dXJlLgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L2FtZC5jCj4gKysrIGIv
eGVuL2FyY2gveDg2L2NwdS9hbWQuYwo+IEBAIC01ODAsNiArNTgwLDEzIEBAIHN0YXRpYyB2b2lk
IGluaXRfYW1kKHN0cnVjdCBjcHVpbmZvX3g4NiAqYykKPiAgCX0KPiAgCj4gIAkvKgo+ICsJICog
T2xkZXIgQU1EIENQVXMgZG9uJ3Qgc2F2ZS9sb2FkIEZPUC9GSVAvRkRQIHVubGVzcyBhbiBGUFUg
ZXhjZXB0aW9uCj4gKwkgKiBpcyBwZW5kaW5nLiAgWGVuIHdvcmtzIGFyb3VuZCB0aGlzIGF0IChG
KVhSU1RPUiB0aW1lLgo+ICsJICovCj4gKwlpZiAoICFjcHVfaGFzKGMsIFg4Nl9GRUFUVVJFX1JT
VFJfRlBfRVJSX1BUUlMpICkKPiArCQlzZXR1cF9mb3JjZV9jcHVfY2FwKFg4Nl9CVUdfRlBVX1BU
UlMpOwoKSSB0aGluayBpbiB0aGlzIGZpbGUgeW91IHdhbnQgdG8gb21pdCB0aGUgYmxhbmtzIGlt
bWVkaWF0ZWx5IGluc2lkZQp0aGUgaWYoKSBwYXJlbnRoZXNlcy4KCj4gQEAgLTE2OSwxMSArMTY3
LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmcHVfZnhzYXZlKHN0cnVjdCB2Y3B1ICp2KQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIDogIj1tIiAoKmZwdV9jdHh0KSA6ICJSIiAoZnB1X2N0eHQp
ICk7Cj4gIAo+ICAgICAgICAgIC8qCj4gLSAgICAgICAgICogQU1EIENQVXMgZG9uJ3Qgc2F2ZS9y
ZXN0b3JlIEZEUC9GSVAvRk9QIHVubGVzcyBhbiBleGNlcHRpb24KPiAtICAgICAgICAgKiBpcyBw
ZW5kaW5nLgo+ICsgICAgICAgICAqIFNvbWUgQ1BVcyBkb24ndCBzYXZlL3Jlc3RvcmUgRkRQL0ZJ
UC9GT1AgdW5sZXNzIGFuIGV4Y2VwdGlvbiBpcwo+ICsgICAgICAgICAqIHBlbmRpbmcuICBJbiB0
aGlzIGNhc2UsIHRoZSByZXN0b3JlIHNpZGUgd2lsbCBhcnJhbmdlIHNhZmUgdmFsdWVzLAo+ICsg
ICAgICAgICAqIGFuZCB0aGVyZSBpcyBubyBwb2ludCB0cnlpbmcgdG8gcmVzdG9yZSBGQ1MvRkRT
IGluIGFkZGl0aW9uLgo+ICAgICAgICAgICAqLwo+IC0gICAgICAgIGlmICggIShmcHVfY3R4dC0+
ZnN3ICYgMHgwMDgwKSAmJgo+IC0gICAgICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9y
ID09IFg4Nl9WRU5ET1JfQU1EICkKPiArICAgICAgICBpZiAoIGNwdV9idWdfZnB1X3B0cnMgJiYg
IShmcHVfY3R4dC0+ZnN3ICYgMHgwMDgwKSApCj4gICAgICAgICAgICAgIHJldHVybjsKCkNvdWxk
IEkgdGFsayB5b3UgaW50byBzL3RyeWluZyB0byByZXN0b3JlL3RyeWluZyB0byBjb2xsZWN0LyBm
b3IgdGhlCmNvbW1lbnQ/IFRoZSBjb25zdW1lciBvZiB0aGUgY29sbGVjdGVkIGRhdGEgY291bGQg
aW4gcHJpbmNpcGxlIGJlCm90aGVyIHRoYW4gdGhlIGNvcnJlc3BvbmRpbmcgcmVzdG9yZSBjb2Rl
LCBlLmcuIHRoZSBpbnNuIGVtdWxhdG9yLgooaHZtZW11bF9wdXRfZnB1KCkgaGFzIGFuIGV4YW1w
bGUgb2YgdGhlIG9wcG9zaXRlIGRpcmVjdGlvbiwgaS5lLgpwcm9kdWNpbmcgZGF0YSBmb3IgdGhl
IHJlc3RvcmUgbG9naWMgdG8gY29uc3VtZS4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
