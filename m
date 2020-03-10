Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C345017F643
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 12:26:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBcyq-0000CZ-Nt; Tue, 10 Mar 2020 11:23:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBcyp-0000CU-Ve
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 11:23:24 +0000
X-Inumbo-ID: 8d3185d8-62c1-11ea-9fd2-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d3185d8-62c1-11ea-9fd2-bc764e2007e4;
 Tue, 10 Mar 2020 11:23:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0402DB1FD;
 Tue, 10 Mar 2020 11:23:21 +0000 (UTC)
To: paul@xen.org
References: <20200306160254.8465-1-paul@xen.org>
 <58f00871-2fff-be69-299e-e2b9911e0723@suse.com>
 <000301d5f63a$df5f04a0$9e1d0de0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e46984e6-9b86-dfb5-9b2b-7772fb700352@suse.com>
Date: Tue, 10 Mar 2020 12:23:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <000301d5f63a$df5f04a0$9e1d0de0$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
Cc: xen-devel@lists.xenproject.org, 'Varad Gautam' <vrd@amazon.de>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Julien Grall' <julien@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDMuMjAyMCAxODo0NywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDA5IE1hcmNoIDIwMjAgMTY6MjkKPj4KPj4gT24gMDYuMDMuMjAyMCAxNzowMiwgcGF1
bEB4ZW4ub3JnIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2lycS5jCj4+PiArKysgYi94
ZW4vYXJjaC94ODYvaXJxLmMKPj4+IEBAIC0xNjgwLDkgKzE2ODAsMjMgQEAgc3RhdGljIGlycV9n
dWVzdF9hY3Rpb25fdCAqX19waXJxX2d1ZXN0X3VuYmluZCgKPj4+Cj4+PiAgICAgIEJVR19PTigh
KGRlc2MtPnN0YXR1cyAmIElSUV9HVUVTVCkpOwo+Pj4KPj4+IC0gICAgZm9yICggaSA9IDA7IChp
IDwgYWN0aW9uLT5ucl9ndWVzdHMpICYmIChhY3Rpb24tPmd1ZXN0W2ldICE9IGQpOyBpKysgKQo+
Pj4gLSAgICAgICAgY29udGludWU7Cj4+PiAtICAgIEJVR19PTihpID09IGFjdGlvbi0+bnJfZ3Vl
c3RzKTsKPj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBhY3Rpb24tPm5yX2d1ZXN0czsgaSsrICkK
Pj4+ICsgICAgICAgIGlmICggYWN0aW9uLT5ndWVzdFtpXSA9PSBkICkKPj4+ICsgICAgICAgICAg
ICBicmVhazsKPj4+ICsKPj4+ICsgICAgaWYgKCBpID09IGFjdGlvbi0+bnJfZ3Vlc3RzICkgLyog
Tm8gbWF0Y2hpbmcgZW50cnkgKi8KPj4+ICsgICAgewo+Pj4gKyAgICAgICAgLyoKPj4+ICsgICAg
ICAgICAqIEluIGNhc2UgdGhlIHBpcnEgd2FzIHNoYXJlZCwgdW5ib3VuZCBmb3IgdGhpcyBkb21h
aW4gaW4gYW4gZWFybGllcgo+Pj4gKyAgICAgICAgICogY2FsbCwgYnV0IHN0aWxsIGV4aXN0ZWQg
b24gdGhlIGRvbWFpbidzIHBpcnFfdHJlZSwgd2Ugc3RpbGwgcmVhY2gKPj4+ICsgICAgICAgICAq
IGhlcmUgaWYgdGhlcmUgYXJlIGFueSBsYXRlciB1bmJpbmQgY2FsbHMgb24gdGhlIHNhbWUgcGly
cS4gUmV0dXJuCj4+PiArICAgICAgICAgKiBpZiBzdWNoIGFuIHVuYmluZCBoYXBwZW5zLgo+Pj4g
KyAgICAgICAgICovCj4+PiArICAgICAgICBBU1NFUlQoYWN0aW9uLT5zaGFyZWFibGUpOwo+Pj4g
KyAgICAgICAgcmV0dXJuIE5VTEw7Cj4+PiArICAgIH0KPj4+ICsKPj4+ICsgICAgQVNTRVJUKGFj
dGlvbi0+bnJfZ3Vlc3RzID4gMCk7Cj4+Cj4+IFRoaXMgc2VlbXMgcG9pbnRsZXNzIHRvIGhhdmUg
aGVyZSAtIHYzIGhhZCBpdCBpbnNpZGUgdGhlIGlmKCksCj4+IHdoZXJlIGl0IHdvdWxkIGFjdHVh
bGx5IGd1YXJkIGFnYWluc3QgY29taW5nIGhlcmUgd2l0aCBucl9ndWVzdHMKPj4gZXF1YWwgdG8g
emVyby4KPiAKPiBXaHkuIFRoZSBjb2RlIGp1c3QgYWZ0ZXIgdGhpcyBkZWNyZW1lbnRzIG5yX2d1
ZXN0cyBzbyBpdCBzZWVtcwo+IGxpa2UgZW50aXJlbHkgdGhlIHJpZ2h0IHBvaW50IHRvIGhhdmUg
dGhlIEFTU0VSVC4gSSBjYW4gbWFrZSBpdAo+IEFTU0VSVCA+PSAwLCBpZiB0aGF0IG1ha2VzIG1v
cmUgc2Vuc2UuCgpUaGVyZSdzIG5vIHdheSB0byBjb21lIGhlcmUgd2hlbiBucl9ndWVzdHMgPT0g
MC4gVGhpcyBpcyBiZWNhdXNlCmluIHRoaXMgY2FzZSB0aGUgbG9vcCB3aWxsIGJlIGV4aXRlZCB3
aXRoIGkgYmVpbmcgemVybywgYW5kIGhlbmNlCnRoZSBlYXJsaWVyIGlmKCkncyBib2R5IHdpbGwg
YmUgZW50ZXJlZC4KCihBbmQgbm8sID49IDAgd291bGRuJ3QgbWFrZSBzZW5zZSB0byBtZSAtIGl0
IHdvdWxkIG1lYW4gd2UgbWlnaHQKaGF2ZSBhIGNvdW50IG9mIC0xIGFmdGVyIHRoZSBkZWNyZW1l
bnQuKQoKPj4gdjMgYWxzbyB1c2VkIGlmKCkgYW5kIEJVRygpIGluc3RlYWQgb2YgQVNTRVJUKCkK
Pj4gaW5zaWRlIHRoaXMgaWYoKSwgd2hpY2ggdG8gbWUgd291bGQgc2VlbSBtb3JlIGluIGxpbmUg
d2l0aCBvdXIKPj4gY3VycmVudCAuL0NPRElOR19TVFlMRSBndWlkZWxpbmVzIG9mIGhhbmRsaW5n
IHVuZXhwZWN0ZWQKPj4gY29uZGl0aW9ucy4gQ291bGQgeW91IGNsYXJpZnkgd2h5IHlvdSBzd2l0
Y2hlZCB0aGluZ3M/Cj4+Cj4gCj4gQmVjYXVzZSBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIG5lZWQg
dG8ga2lsbCB0aGUgaG9zdCBpbiBhCj4gbm9uLWRlYnVnIGNvbnRleHQgaWYgd2UgaGl0IHRoaXMg
Y29uZGl0aW9uOyBpdCBpcyBlbnRpcmVseQo+IHN1cnZpdmFibGUgYXMgZmFyIGFzIEkgY2FuIHRl
bGwgc28gYSBCVUdfT04oKSBkaWQgbm90IHNlZW0KPiBhcHByb3ByaWF0ZS4KCkl0J2xsIG1lYW4g
d2UgaGF2ZSBhIG5vbi1zaGFyYWJsZSBJUlEgaW4gYSBwbGFjZSB3aGVyZSB0aGlzIGlzCm5vdCBz
dXBwb3NlZCB0byBoYXBwZW4uIEhvdyBjYW4gd2UgYmUgc3VyZSB0aGUgc3lzdGVtIGlzIGluIGEK
c3RhdGUgYWxsb3dpbmcgdG8gc2FmZWx5IGNvbnRpbnVlPyBUbyBtZSwgaWYgc2hhcmVhYmxlIC8g
bm9uLQpzaGFyZWFibGUgaXMgb2YgYW55IGNvbmNlcm4gaGVyZSwgdGhlbiBpdCBvdWdodCB0byBi
ZSBCVUcoKS4KSWYgaXQncyBub3QsIHRoZW4gdGhlIEFTU0VSVCgpIG91Z2h0IHRvIGJlIGRyb3Bw
ZWQgYXMgd2VsbC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
