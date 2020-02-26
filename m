Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A449416FBA0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 11:09:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6tbT-0001Gm-Ut; Wed, 26 Feb 2020 10:07:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6tbS-0001Gh-L7
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 10:07:42 +0000
X-Inumbo-ID: d2f01c2a-587f-11ea-a490-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2f01c2a-587f-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 10:07:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2DC6FABE9;
 Wed, 26 Feb 2020 10:07:38 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200224104645.96381-1-roger.pau@citrix.com>
 <20200224104645.96381-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cae27b7b-1690-7273-635e-95584a474fa5@suse.com>
Date: Wed, 26 Feb 2020 11:07:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224104645.96381-5-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/5] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
Cc: xen-devel@lists.xenproject.org, Sander Eikelenboom <linux@eikelenboom.it>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAyMCAxMTo0NiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFVzaW5nIHNjcmF0
Y2hfY3B1bWFzayBpbiBzZW5kX0lQSV9tYXNrIGlzIG5vdCBzYWZlIGJlY2F1c2UgaXQgY2FuIGJl
Cj4gY2FsbGVkIGZyb20gaW50ZXJydXB0IGNvbnRleHQsIGFuZCBoZW5jZSBYZW4gd291bGQgaGF2
ZSB0byBtYWtlIHN1cmUKPiBhbGwgdGhlIHVzZXJzIG9mIHRoZSBzY3JhdGNoIGNwdW1hc2sgZGlz
YWJsZSBpbnRlcnJ1cHRzIHdoaWxlIHVzaW5nCj4gaXQuCj4gCj4gSW5zdGVhZCBpbnRyb2R1Y2Ug
YSBuZXcgY3B1bWFzayB0byBiZSB1c2VkIGJ5IHNlbmRfSVBJX21hc2ssIGFuZAo+IGRpc2FibGUg
aW50ZXJydXB0cyB3aGlsZSB1c2luZyBpdC4KClRoZSBhbHRlcm5hdGl2ZSBvZiBhbHNvIGFkZGlu
ZyAuLi4KCj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3Nt
cC5jCj4gQEAgLTU5LDYgKzU5LDcgQEAgc3RhdGljIHZvaWQgc2VuZF9JUElfc2hvcnRjdXQodW5z
aWduZWQgaW50IHNob3J0Y3V0LCBpbnQgdmVjdG9yLAo+ICAgICAgYXBpY193cml0ZShBUElDX0lD
UiwgY2ZnKTsKPiAgfQo+ICAKPiArREVDTEFSRV9QRVJfQ1BVKGNwdW1hc2tfdmFyX3QsIHNlbmRf
aXBpX2NwdW1hc2spOwo+ICAvKgo+ICAgKiBzZW5kX0lQSV9tYXNrKGNwdW1hc2ssIHZlY3Rvcik6
IHNlbmRzIEB2ZWN0b3IgSVBJIHRvIENQVXMgaW4gQGNwdW1hc2ssCj4gICAqIGV4Y2x1ZGluZyB0
aGUgbG9jYWwgQ1BVLiBAY3B1bWFzayBtYXkgYmUgZW1wdHkuCj4gQEAgLTY3LDcgKzY4LDIxIEBA
IHN0YXRpYyB2b2lkIHNlbmRfSVBJX3Nob3J0Y3V0KHVuc2lnbmVkIGludCBzaG9ydGN1dCwgaW50
IHZlY3RvciwKPiAgdm9pZCBzZW5kX0lQSV9tYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgaW50
IHZlY3RvcikKPiAgewo+ICAgICAgYm9vbCBjcHVzX2xvY2tlZCA9IGZhbHNlOwo+IC0gICAgY3B1
bWFza190ICpzY3JhdGNoID0gdGhpc19jcHUoc2NyYXRjaF9jcHVtYXNrKTsKPiArICAgIGNwdW1h
c2tfdCAqc2NyYXRjaCA9IHRoaXNfY3B1KHNlbmRfaXBpX2NwdW1hc2spOwo+ICsgICAgdW5zaWdu
ZWQgbG9uZyBmbGFnczsKPiArCj4gKyAgICBpZiAoIGluX21jKCkgfHwgaW5fbm1pKCkgKQoKLi4u
IGluX2lycSgpIGhlcmUgd2FzIGNvbnNpZGVyZWQsIGFuZCBkaXNjYXJkZWQgYmVjYXVzZSBvZj8g
V2l0aAp0aGlzIHlvdSdkIG5vdCBuZWVkIHRoZSBzZWNvbmQgQ1BVIG1hc2sgYW5kIHlvdSdkIGFs
c28gYmUgYWJsZQp0byBhdm9pZCBkaXNhYmxpbmcgYW4gcmUtZW5hYmxpbmcgSVJRcy4KCkluIG9y
ZGVyIHRvIG5vdCBkaXN0dXJiIHRoZSBwYXJ0aWFsIHNlbnRlbmNlLCBhIHNtYWxsIHJlcXVlc3Qg
b24KdGhlIHByZXZpb3VzIGh1bmsgYXMgd2VsbDogQ291bGQgeW91IGFkZCBhIGJsYW5rIGxpbmUg
YWZ0ZXIgdGhlCm5ldyBkZWZpbml0aW9uLCBwbGVhc2U/Cgo+ICsgICAgewo+ICsgICAgICAgIC8q
Cj4gKyAgICAgICAgICogV2hlbiBpbiAjTk1JIG9yICNNQyBjb250ZXh0IGZhbGxiYWNrIHRvIHRo
ZSBvbGQgKGFuZCBzaW1wbGVyKSBJUEkKCk5vdGUgdGhhdCBjb252ZW50aW9uYWwgbm90YXRpb24g
aW5kZWVkIGlzICNNQyBidXQganVzdCBOTUkgKGFwcGxpZXMKaGVyZSwgaW4gdGhlIGRlc2NyaXB0
aW9uLCBhbmQgYWxzbyBlbHNld2hlcmUgaW4gdGhlIHNlcmllcykuCgo+IEBAIC04MSw3ICs5Niwx
NSBAQCB2b2lkIHNlbmRfSVBJX21hc2soY29uc3QgY3B1bWFza190ICptYXNrLCBpbnQgdmVjdG9y
KQo+ICAgICAgICAgICBsb2NhbF9pcnFfaXNfZW5hYmxlZCgpICYmIChjcHVzX2xvY2tlZCA9IGdl
dF9jcHVfbWFwcygpKSAmJgo+ICAgICAgICAgICAocGFya19vZmZsaW5lX2NwdXMgfHwKPiAgICAg
ICAgICAgIGNwdW1hc2tfZXF1YWwoJmNwdV9vbmxpbmVfbWFwLCAmY3B1X3ByZXNlbnRfbWFwKSkg
KQo+ICsgICAgewo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICogc2VuZF9JUElfbWFzayBjYW4g
YmUgY2FsbGVkIGZyb20gaW50ZXJydXB0IGNvbnRleHQsIGFuZCBoZW5jZSB3ZQo+ICsgICAgICAg
ICAqIG5lZWQgdG8gZGlzYWJsZSBpbnRlcnJ1cHRzIGluIG9yZGVyIHRvIHByb3RlY3QgdGhlIHBl
ci1jcHUKPiArICAgICAgICAgKiBzZW5kX2lwaV9jcHVtYXNrIHdoaWxlIGJlaW5nIHVzZWQuCj4g
KyAgICAgICAgICovCj4gKyAgICAgICAgbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOwo+ICAgICAgICAg
IGNwdW1hc2tfb3Ioc2NyYXRjaCwgbWFzaywgY3B1bWFza19vZihzbXBfcHJvY2Vzc29yX2lkKCkp
KTsKPiArICAgIH0KPiAgICAgIGVsc2UKPiAgICAgIHsKPiAgICAgICAgICBpZiAoIGNwdXNfbG9j
a2VkICkKPiBAQCAtODksNiArMTEyLDcgQEAgdm9pZCBzZW5kX0lQSV9tYXNrKGNvbnN0IGNwdW1h
c2tfdCAqbWFzaywgaW50IHZlY3RvcikKPiAgICAgICAgICAgICAgcHV0X2NwdV9tYXBzKCk7Cj4g
ICAgICAgICAgICAgIGNwdXNfbG9ja2VkID0gZmFsc2U7Cj4gICAgICAgICAgfQo+ICsgICAgICAg
IGxvY2FsX2lycV9zYXZlKGZsYWdzKTsKPiAgICAgICAgICBjcHVtYXNrX2NsZWFyKHNjcmF0Y2gp
Owo+ICAgICAgfQo+ICAKPiBAQCAtOTcsNiArMTIxLDcgQEAgdm9pZCBzZW5kX0lQSV9tYXNrKGNv
bnN0IGNwdW1hc2tfdCAqbWFzaywgaW50IHZlY3RvcikKPiAgICAgIGVsc2UKPiAgICAgICAgICBh
bHRlcm5hdGl2ZV92Y2FsbChnZW5hcGljLnNlbmRfSVBJX21hc2ssIG1hc2ssIHZlY3Rvcik7Cj4g
IAo+ICsgICAgbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOwoKV291bGRuJ3QgaXQgYmUgYmV0dGVy
IHRvIHJlLWVuYWJsZSBpbnRlcnJ1cHRzIGluIHRoZSAiZWxzZSIgYnJhbmNoCnZpc2libGUgaW4g
Y29udGV4dCBhaGVhZCBvZiB0aGUgY2FsbD8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
