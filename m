Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A80B175D15
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 15:31:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8m45-0005GO-4y; Mon, 02 Mar 2020 14:29:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j8m43-0005GI-Sq
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 14:28:59 +0000
X-Inumbo-ID: 2789d77e-5c92-11ea-b122-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2789d77e-5c92-11ea-b122-bc764e2007e4;
 Mon, 02 Mar 2020 14:28:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E04EBAB8F;
 Mon,  2 Mar 2020 14:28:57 +0000 (UTC)
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20200211093122.5644-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b65b34d-0078-ad0c-9a6c-ada5d2828cc0@suse.com>
Date: Mon, 2 Mar 2020 15:28:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200211093122.5644-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: do live patching only from main idle
 loop
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDIuMjAyMCAxMDozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbmUgb2YgdGhlIG1h
aW4gZGVzaWduIGdvYWxzIG9mIGNvcmUgc2NoZWR1bGluZyBpcyB0byBhdm9pZCBhY3Rpb25zCj4g
d2hpY2ggYXJlIG5vdCBkaXJlY3RseSByZWxhdGVkIHRvIHRoZSBkb21haW4gY3VycmVudGx5IHJ1
bm5pbmcgb24gYQo+IGdpdmVuIGNwdSBvciBjb3JlLiBMaXZlIHBhdGNoaW5nIGlzIG9uZSBvZiB0
aG9zZSBhY3Rpb25zIHdoaWNoIGFyZQo+IGFsbG93ZWQgdGFraW5nIHBsYWNlIG9uIGEgY3B1IG9u
bHkgd2hlbiB0aGUgaWRsZSBzY2hlZHVsaW5nIHVuaXQgaXMKPiBhY3RpdmUgb24gdGhhdCBjcHUu
Cj4gCj4gVW5mb3J0dW5hdGVseSBsaXZlIHBhdGNoaW5nIHRyaWVzIHRvIGZvcmNlIHRoZSBjcHVz
IGludG8gdGhlIGlkbGUgbG9vcAo+IGp1c3QgYnkgcmFpc2luZyB0aGUgc2NoZWR1bGUgc29mdGly
cSwgd2hpY2ggd2lsbCBubyBsb25nZXIgYmUKPiBndWFyYW50ZWVkIHRvIHdvcmsgd2l0aCBjb3Jl
IHNjaGVkdWxpbmcgYWN0aXZlLiBBZGRpdGlvbmFsbHkgdGhlcmUgYXJlCj4gc3RpbGwgc29tZSBw
bGFjZXMgaW4gdGhlIGh5cGVydmlzb3IgY2FsbGluZyBjaGVja19mb3JfbGl2ZXBhdGNoX3dvcmso
KQo+IHdpdGhvdXQgYmVpbmcgaW4gdGhlIGlkbGUgbG9vcC4KPiAKPiBJdCBpcyBlYXN5IHRvIGZv
cmNlIGEgY3B1IGludG8gdGhlIG1haW4gaWRsZSBsb29wIGJ5IHNjaGVkdWxpbmcgYQo+IHRhc2ts
ZXQgb24gaXQuIFNvIHN3aXRjaCBsaXZlIHBhdGNoaW5nIHRvIHVzZSB0YXNrbGV0cyBmb3Igc3dp
dGNoaW5nIHRvCj4gaWRsZSBhbmQgcmFpc2luZyBzY2hlZHVsaW5nIGV2ZW50cy4gQWRkaXRpb25h
bGx5IHRoZSBjYWxscyBvZgo+IGNoZWNrX2Zvcl9saXZlcGF0Y2hfd29yaygpIG91dHNpZGUgdGhl
IG1haW4gaWRsZSBsb29wIGNhbiBiZSBkcm9wcGVkLgo+IAo+IEFzIHRhc2tsZXRzIGFyZSBvbmx5
IHJ1bm5pbmcgb24gaWRsZSB2Y3B1cyBhbmQgc3RvcF9tYWNoaW5lX3J1bigpCj4gaXMgYWN0aXZh
dGluZyB0YXNrbGV0cyBvbiBhbGwgY3B1cyBidXQgdGhlIG9uZSBpdCBoYXMgYmVlbiBjYWxsZWQg
b24KPiB0byByZW5kZXp2b3VzLCBpdCBpcyBtYW5kYXRvcnkgZm9yIHN0b3BfbWFjaGluZV9ydW4o
KSB0byBiZSBjYWxsZWQgb24KPiBhbiBpZGxlIHZjcHUsIHRvbywgYXMgb3RoZXJ3aXNlIHRoZXJl
IGlzIG5vIHdheSBmb3Igc2NoZWR1bGluZyB0bwo+IGFjdGl2YXRlIHRoZSBpZGxlIHZjcHUgZm9y
IHRoZSB0YXNrbGV0IG9uIHRoZSBzaWJsaW5nIG9mIHRoZSBjcHUKPiBzdG9wX21hY2hpbmVfcnVu
KCkgaGFzIGJlZW4gY2FsbGVkIG9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgIHwg
IDkgKysrKy0tLS0tCj4gIHhlbi9hcmNoL2FybS90cmFwcy5jICAgICAgICB8ICA2IC0tLS0tLQo+
ICB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgfCAgOSArKysrLS0tLS0KPiAgeGVuL2FyY2gv
eDg2L2h2bS9zdm0vc3ZtLmMgIHwgIDIgKy0KPiAgeGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5j
IHwgIDIgKy0KPiAgeGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jICAgIHwgIDIgKy0KPiAgeGVuL2Fy
Y2gveDg2L3NldHVwLmMgICAgICAgIHwgIDIgKy0KPiAgeGVuL2NvbW1vbi9saXZlcGF0Y2guYyAg
ICAgIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gIDggZmls
ZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCgpLb25yYWQsIFJv
c3MgLSBJIHdhcyBhYm91dCB0byBhcHBseSB0aGlzIHdoZW4gSSBub3RpY2VkIGFuIGFjawpieSBv
bmUgb2YgdGhlIHR3byBvZiB5b3UgaXMgc3RpbGwgbmVlZGVkLiBDYXJlIHRvIHByb3ZpZGUgb25l
CihvciBjb21tZW50IGlmIHRoZXJlIGFyZSBpc3N1ZXMpPwoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
