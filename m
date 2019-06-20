Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9E84D20C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 17:23:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdyrG-0005ra-Gi; Thu, 20 Jun 2019 15:20:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YAo9=UT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hdyrF-0005rV-Ea
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 15:20:13 +0000
X-Inumbo-ID: e4d2ca8c-936e-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e4d2ca8c-936e-11e9-8980-bc764e045a96;
 Thu, 20 Jun 2019 15:20:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1D804AE46;
 Thu, 20 Jun 2019 15:20:10 +0000 (UTC)
To: Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20190620094015.21206-1-jgross@suse.com>
 <d11cf6a9ac9f2f21b6102464bf80925ada02bc78.camel@linux.intel.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <0fae5789-3859-d49f-6c4c-2bde09dc3307@suse.com>
Date: Thu, 20 Jun 2019 17:20:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d11cf6a9ac9f2f21b6102464bf80925ada02bc78.camel@linux.intel.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH RFC] mm: fix regression with deferred struct
 page init
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDYuMTkgMTc6MTcsIEFsZXhhbmRlciBEdXljayB3cm90ZToKPiBPbiBUaHUsIDIwMTkt
MDYtMjAgYXQgMTE6NDAgKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IENvbW1pdCAwZTU2
YWNhZTRiNGRkNGE5ICgibW06IGluaXRpYWxpemUgTUFYX09SREVSX05SX1BBR0VTIGF0IGEgdGlt
ZQo+PiBpbnN0ZWFkIG9mIGRvaW5nIGxhcmdlciBzZWN0aW9ucyIpIGlzIGNhdXNpbmcgYSByZWdy
ZXNzaW9uIG9uIHNvbWUKPj4gc3lzdGVtcyB3aGVuIHRoZSBrZXJuZWwgaXMgYm9vdGVkIGFzIFhl
biBkb20wLgo+Pgo+PiBUaGUgc3lzdGVtIHdpbGwganVzdCBoYW5nIGluIGVhcmx5IGJvb3QuCj4+
Cj4+IFJlYXNvbiBpcyBhbiBlbmRsZXNzIGxvb3AgaW4gZ2V0X3BhZ2VfZnJvbV9mcmVlbGlzdCgp
IGluIGNhc2UgdGhlIGZpcnN0Cj4+IHpvbmUgbG9va2VkIGF0IGhhcyBubyBmcmVlIG1lbW9yeS4g
ZGVmZXJyZWRfZ3Jvd196b25lKCkgaXMgYWx3YXlzCj4+IHJldHVybmluZyB0cnVlIGR1ZSB0byB0
aGUgZm9sbG93aW5nIGNvZGUgc25pcHBsZXQ6Cj4+Cj4+ICAgIC8qIElmIHRoZSB6b25lIGlzIGVt
cHR5IHNvbWVib2R5IGVsc2UgbWF5IGhhdmUgY2xlYXJlZCBvdXQgdGhlIHpvbmUgKi8KPj4gICAg
aWYgKCFkZWZlcnJlZF9pbml0X21lbV9wZm5fcmFuZ2VfaW5fem9uZSgmaSwgem9uZSwgJnNwZm4s
ICZlcGZuLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZp
cnN0X2RlZmVycmVkX3BmbikpIHsKPj4gICAgICAgICAgICBwZ2RhdC0+Zmlyc3RfZGVmZXJyZWRf
cGZuID0gVUxPTkdfTUFYOwo+PiAgICAgICAgICAgIHBnZGF0X3Jlc2l6ZV91bmxvY2socGdkYXQs
ICZmbGFncyk7Cj4+ICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4+ICAgIH0KPj4KPj4gVGhpcyBp
biB0dXJuIHJlc3VsdHMgaW4gdGhlIGxvb3AgYXMgZ2V0X3BhZ2VfZnJvbV9mcmVlbGlzdCgpIGlz
Cj4+IGFzc3VtaW5nIGZvcndhcmQgcHJvZ3Jlc3MgY2FuIGJlIG1hZGUgYnkgZG9pbmcgc29tZSBt
b3JlIHN0cnVjdCBwYWdlCj4+IGluaXRpYWxpemF0aW9uLgo+Pgo+PiBGaXhlczogMGU1NmFjYWU0
YjRkZDRhOSAoIm1tOiBpbml0aWFsaXplIE1BWF9PUkRFUl9OUl9QQUdFUyBhdCBhIHRpbWUgaW5z
dGVhZCBvZiBkb2luZyBsYXJnZXIgc2VjdGlvbnMiKQo+PiAtLS0KPj4gVGhpcyBwYXRjaCBtYWtl
cyBteSBzeXN0ZW0gYm9vdCBhZ2FpbiBhcyBYZW4gZG9tMCwgYnV0IEknbSBub3QgcmVhbGx5Cj4+
IHN1cmUgaXQgaXMgdGhlIGNvcnJlY3Qgd2F5IHRvIGRvIGl0LCBoZW5jZSB0aGUgUkZDLgo+PiBT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+IC0tLQo+PiAg
IG1tL3BhZ2VfYWxsb2MuYyB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL21tL3BhZ2VfYWxsb2MuYyBiL21t
L3BhZ2VfYWxsb2MuYwo+PiBpbmRleCBkNjZiYzhhYmUwYWYuLjZlZTc1NGI1Y2Q5MiAxMDA2NDQK
Pj4gLS0tIGEvbW0vcGFnZV9hbGxvYy5jCj4+ICsrKyBiL21tL3BhZ2VfYWxsb2MuYwo+PiBAQCAt
MTgyNiw3ICsxODI2LDcgQEAgZGVmZXJyZWRfZ3Jvd196b25lKHN0cnVjdCB6b25lICp6b25lLCB1
bnNpZ25lZCBpbnQgb3JkZXIpCj4+ICAgCQkJCQkJIGZpcnN0X2RlZmVycmVkX3BmbikpIHsKPj4g
ICAJCXBnZGF0LT5maXJzdF9kZWZlcnJlZF9wZm4gPSBVTE9OR19NQVg7Cj4+ICAgCQlwZ2RhdF9y
ZXNpemVfdW5sb2NrKHBnZGF0LCAmZmxhZ3MpOwo+PiAtCQlyZXR1cm4gdHJ1ZTsKPj4gKwkJcmV0
dXJuIGZhbHNlOwo+PiAgIAl9Cj4+ICAgCj4+ICAgCS8qCj4gCj4gVGhlIG9uZSBjaGFuZ2UgSSBt
aWdodCBtYWtlIHRvIHRoaXMgd291bGQgYmUgdG8gZG86Cj4gCXJldHVybiBmaXJzdF9kZWZlcnJl
ZF9wZm4gIT0gVUxPTkdfTUFYOwo+IAo+IFRoYXQgd2F5IGluIHRoZSBldmVudCB0aGUgcHJldmlv
dXMgY2FsbGVyIGRpZCBmcmVlIHVwIHRoZSBsYXN0IG9mIHRoZQo+IHBhZ2VzIGFuZCBlbXB0eSB0
aGUgem9uZSBqdXN0IGJlZm9yZSB3ZSBnb3QgaGVyZSB0aGVuIHdlIHdpbGwgdHJ5IG9uZSBtb3Jl
Cj4gdGltZS4gT3RoZXJ3aXNlIGlmIGl0IHdhcyBhbHJlYWR5IGRvbmUgYmVmb3JlIHdlIGdvdCBo
ZXJlIHdlIGV4aXQuCgpUaGFua3MgZm9yIHRoZSBjb25zdHJ1Y3RpdmUgZmVlZGJhY2shCgpXaWxs
IHNlbmQgYSBub24tUkZDIHZhcmlhbnQgc29vbi4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
