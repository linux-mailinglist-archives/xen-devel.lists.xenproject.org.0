Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6355044FB7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 01:01:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbYfI-0006Ud-5x; Thu, 13 Jun 2019 22:57:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fP4x=UM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hbYfG-0006UX-GB
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 22:57:50 +0000
X-Inumbo-ID: aa9ed426-8e2e-11e9-9ecb-a32e079c7bf4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa9ed426-8e2e-11e9-9ecb-a32e079c7bf4;
 Thu, 13 Jun 2019 22:57:49 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A7C772082C;
 Thu, 13 Jun 2019 22:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560466669;
 bh=X2OfU5SJ4jn3YT9poiPYf8ffQvobOtGJOP3QDvfWHK8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tF4oey2L/rRJuPisu/WFzNiYTjAGGXK7auXIobjvPduhhtj0rv97/8zES00zX2h0V
 oNXA5znRIIoitbbhq1z8BbyYF44yg5UN9ZB0Ik0aLoxJKKkbz79DaoQCO0vLTA2evB
 j1qOMEclT2qjRfQ8haVpdWPMUvP24HK4QgGRsS5A=
Date: Thu, 13 Jun 2019 15:57:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <0208270b-1c4e-84a0-ce69-fd88c9e04983@arm.com>
Message-ID: <alpine.DEB.2.21.1906131556100.2072@sstabellini-ThinkPad-T480s>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-11-julien.grall@arm.com>
 <alpine.DEB.2.21.1906121541260.13737@sstabellini-ThinkPad-T480s>
 <7938b611-5ad7-86a0-14a2-c03d1953a81b@arm.com>
 <alpine.DEB.2.21.1906131056310.13737@sstabellini-ThinkPad-T480s>
 <0208270b-1c4e-84a0-ce69-fd88c9e04983@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 10/12] xen/arm: mm: Rework Xen
 page-tables walk during update
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxMyBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMTMvMDYvMjAxOSAxODo1OSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
VGh1LCAxMyBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOiA+Pj4+ICsgKiBSZXR1cm4gdmFs
dWVzOgo+ID4+Pj4gKyAqICBYRU5fVEFCTEVfTUFQX0ZBSUxFRDogRWl0aGVyIHJlYWRfb25seSB3
YXMgc2V0IGFuZCB0aGUgZW50cnkKPiA+Pj4+ICsgKiAgd2FzIGVtcHR5LCBvciBhbGxvY2F0aW5n
IGEgbmV3IHBhZ2UgZmFpbGVkLgo+ID4+Pj4gKyAqICBYRU5fVEFCTEVfTk9STUFMX1BBR0U6IG5l
eHQgbGV2ZWwgbWFwcGVkIG5vcm1hbGx5Cj4gPj4+PiArICogIFhFTl9UQUJMRV9TVVBFUl9QQUdF
OiBUaGUgbmV4dCBlbnRyeSBwb2ludHMgdG8gYSBzdXBlcnBhZ2UuCj4gPj4+PiArICovCj4gPj4+
PiArc3RhdGljIGludCB4ZW5fcHRfbmV4dF9sZXZlbChib29sIHJlYWRfb25seSwgdW5zaWduZWQg
aW50IGxldmVsLAo+ID4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbHBhZV90ICoq
dGFibGUsIHVuc2lnbmVkIGludCBvZmZzZXQpCj4gPj4+PiArewo+ID4+Pj4gKyAgICBscGFlX3Qg
KmVudHJ5Owo+ID4+Pj4gKyAgICBpbnQgcmV0Owo+ID4+Pj4gKwo+ID4+Pj4gKyAgICBlbnRyeSA9
ICp0YWJsZSArIG9mZnNldDsKPiA+Pj4+ICsKPiA+Pj4+ICsgICAgaWYgKCAhbHBhZV9pc192YWxp
ZCgqZW50cnkpICkKPiA+Pj4+ICsgICAgewo+ID4+Pj4gKyAgICAgICAgaWYgKCByZWFkX29ubHkg
KQo+ID4+Pj4gKyAgICAgICAgICAgIHJldHVybiBYRU5fVEFCTEVfTUFQX0ZBSUxFRDsKPiA+Pj4+
ICsKPiA+Pj4+ICsgICAgICAgIHJldCA9IGNyZWF0ZV94ZW5fdGFibGUoZW50cnkpOwo+ID4+Pj4g
KyAgICAgICAgaWYgKCByZXQgKQo+ID4+Pj4gKyAgICAgICAgICAgIHJldHVybiBYRU5fVEFCTEVf
TUFQX0ZBSUxFRDsKPiA+Pj4+ICsgICAgfQo+ID4+Pj4gKwo+ID4+Pj4gKyAgICBBU1NFUlQobHBh
ZV9pc192YWxpZCgqZW50cnkpKTsKPiA+Pj4KPiA+Pj4gV2h5IHRoZSBBU1NFUlQganVzdCBhZnRl
ciB0aGUgbHBhZV9pc192YWxpZCBjaGVjayBhYm92ZT8KPiA+Pgo+ID4+IFdoZW4gdGhlIGVudHJ5
IGlzIGludmFsaWQsIHRoZSBuZXcgcGFnZSB0YWJsZSB3aWxsIGJlIGFsbG9jYXRlZCBhbmQgdGhl
IGVudHJ5Cj4gPj4gd2lsbCBiZSBnZW5lcmF0ZWQuIFRoZSByZXN0IG9mIHRoZSBmdW5jdGlvbiB3
aWxsIHRoZW4gYmUgZXhlY3V0ZWQuIFRoZQo+ID4+IEFTU0VSVCgpIGhlcmUgY29uZmlybXMgdGhl
IGVudHJ5IHdlIGhhdmUgaW4gaGFuZCBpcyB2YWxpZCBpbiBhbGwgdGhlIGNhc2VzLgo+ID4gCj4g
PiBTbyBpdCdzIHRvIGRvdWJsZS1jaGVjayB0aGF0IGFmdGVyIGdldHRpbmcgaW50byB0aGUgYGlm
JyBzdGF0ZW1lbnQsIHRoZQo+ID4gZW50cnkgYmVjb21lcyB2YWxpZCwgd2hpY2ggaXMga2luZCBv
ZiByZWR1bmRhbnQgZHVlIHRvIHRoZSB0d28gZXJyb3JzCj4gPiBjaGVjayBhYm92ZSBidXQgaXQg
aXMgc3RpbGwgdmFsaWQuIE9LLgo+IAo+IFdoaWxlIEkgYWdyZWUgdGhhdCB3ZSBoYXZlIDIgaWZz
IGFib3ZlLCB3ZSBvbmx5IGNoZWNrICJyYyIgYW5kIG5vdCAiZW50cnkiLgo+IAo+IEkgb3VnaHQg
dG8gdGhpbmsgSSB3cm90ZSBwZXJmZWN0IGNvZGUsIHNhZGx5IHRoaXMgaXMgbm90IGFsd2F5cyB0
aGUgY2FzZSA7KS4KPiAKPiBIZXJlLCBpdCB3b3VsZCBjYXRjaCBhbnkgbWlzdGFrZSBpZiAicmMi
IGlzIHplcm8gYnV0ICJlbnRyeSIgaXMgc3RpbGwgCj4gaW52YWxpZC4gVGhlIHJpc2sgaGVyZSBp
cyB0aGUgImVudHJ5IiB3b3VsZCBiZSBpbnZhbGlkIGJ1dCB0aGUgbWlzdGFrZSAKPiBtYXkgYmUg
c3BvdHRlZCBhIGxvbmcgdGltZSBhZnRlciAoaS5lIGFueSBhY2Nlc3MgdG8gdGhlIG1hcHBpbmcg
d2lsbCAKPiBmYXVsdCkuIFRoaXMgd291bGQgcG90ZW50aWFsbHkgY29zdCBhIGxvdCBvZiBkZWJ1
Zy4KPiAKPiBJIGFncmVlIHRoaXMgaXMgcHJvYmFibHkgb3ZlciBjYXV0aW91cywgSSBjYW4ndCBy
ZW1lbWJlciBpZiBJIGhpdCB0aGUgCj4gcHJvYmxlbSBiZWZvcmUuIEFueXdheSwgSSBhbSBoYXBw
eSB0byBkcm9wIHRoZSBBU1NFUlQoKSBpZiB5b3UgdGhpbmsgaXQgCj4gaXMgdG9vIHJlZHVuZGFu
dC4KCkkgd291bGQgZHJvcCBpdCwgYnV0IEkgZG9uJ3QgY2FyZSBtdWNoIGFib3V0IGl0LgoKPiBS
ZWdhcmRsZXNzIHRoYXQsIGFyZSB5b3UgaGFwcHkgd2l0aCB0aGUgcmVzdCBvZiB0aGUgcGF0Y2g/
IElmIHNvLCBjYW4gSSAKPiBnZXQgeW91ciBhY2tlZC1ieS9yZXZpZXdlZC1ieT8KClllcywgZWl0
aGVyIHdheQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
