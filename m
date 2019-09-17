Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBD2B5083
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 16:36:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAEXG-0002nL-Vc; Tue, 17 Sep 2019 14:32:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAEXE-0002nA-OG
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 14:32:52 +0000
X-Inumbo-ID: 06a59614-d958-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06a59614-d958-11e9-b76c-bc764e2007e4;
 Tue, 17 Sep 2019 14:32:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BACC9B668;
 Tue, 17 Sep 2019 14:32:49 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190916081024.20931-1-aisaila@bitdefender.com>
 <18854b5e-8e1a-298f-672f-ccc93b5b3a2a@suse.com>
 <3f252f60-6f72-6025-d4dc-d82077e43691@bitdefender.com>
 <f791ad24-a106-1cf6-2ff8-53adca03b1d5@suse.com>
 <65dcce1f-e73a-230d-83bd-271b6312bc48@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a5adec2-4134-9617-555c-3dd2adf140ac@suse.com>
Date: Tue, 17 Sep 2019 16:32:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <65dcce1f-e73a-230d-83bd-271b6312bc48@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAxNjoxMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4g
Cj4gT24gMTcuMDkuMjAxOSAxMTowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE3LjA5LjIw
MTkgMDk6NTIsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gT24gMTYuMDkuMjAx
OSAxODo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTYuMDkuMjAxOSAxMDoxMCwgQWxl
eGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
aHZtLmMKPj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+Pj4+PiBAQCAtMzIyNCw2
ICszMjI0LDE0IEBAIHN0YXRpYyBlbnVtIGh2bV90cmFuc2xhdGlvbl9yZXN1bHQgX19odm1fY29w
eSgKPj4+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIEhWTVRSQU5TX2JhZF9nZm5fdG9fbWZuOwo+
Pj4+PiAgICAgICAgICAgIH0KPj4+Pj4gICAgCj4+Pj4+ICsgICAgICAgIGlmICggdW5saWtlbHko
di0+YXJjaC52bV9ldmVudCkgJiYKPj4+Pj4gKyAgICAgICAgICAgICB2LT5hcmNoLnZtX2V2ZW50
LT5zZW5kX2V2ZW50ICYmCj4+Pj4+ICsgICAgICAgICAgICAgaHZtX21vbml0b3JfY2hlY2tfcDJt
KGFkZHIsIGdmbiwgcGZlYywgbnBmZWNfa2luZF93aXRoX2dsYSkgKQo+Pj4+PiArICAgICAgICB7
Cj4+Pj4+ICsgICAgICAgICAgICBwdXRfcGFnZShwYWdlKTsKPj4+Pj4gKyAgICAgICAgICAgIHJl
dHVybiBIVk1UUkFOU19nZm5fcGFnZWRfb3V0Owo+Pj4+Cj4+Pj4gSSdtIHNvcnJ5LCBidXQgdGhl
cmUgaXMgX3N0aWxsXyBubyBjb21tZW50IG5leHQgdG8gdGhpcyBhcHBhcmVudAo+Pj4+IG1pcy11
c2Ugb2YgSFZNVFJBTlNfZ2ZuX3BhZ2VkX291dC4KPj4+Cj4+PiBJIHdpbGwgYWRkIHRoaXMgY29t
bWVudCBoZXJlOgo+Pj4KPj4+ICIvKgo+Pj4gICAgICogSW4gY2FzZSBhIHZtIGV2ZW50IHdhcyBz
ZW50IHJldHVybiBwYWdlZF9vdXQgc28gdGhlIGVtdWxhdGlvbiB3aWxsCj4+PiAgICAgKiBzdG9w
IHdpdGggbm8gc2lkZSBlZmZlY3QKPj4+ICAgICAqLyIKPj4KPj4gRmlyc3Qgb2YgYWxsIC0gd2h5
ICJ3YXMgc2VudCI/IFRoZSBldmVudCBpcyB5ZXQgdG8gYmUgc2VudCwgaXNuJ3QgaXQ/Cj4gCj4g
WWVzIGl0IHNob3VsZCBzdGF0ZSAiaWYgdGhlIGV2ZW50IGlzIHNlbnQiLgoKImlzIHNlbnQiIGlz
IHN0aWxsIG5vdCBpbmRpY2F0aW5nIHRoaXMgaXMgc29tZXRoaW5nIHlldCB0byBoYXBwZW4uCiJp
cyB0byBiZSBzZW50IiB3b3VsZCBiZSB0byBtZSAoY2F2ZWF0IC0gSSdtIG5vdCBhIG5hdGl2ZSBz
cGVha2VyKS4KCj4+IEFuZCB0aGVuIEknbSBhZnJhaWQgdGhpcyBzdGlsbCBpc24ndCBlbm91Z2gu
IF9faHZtX2NvcHkoKSBnZXRzIHVzZWQKPj4gZm9yIG1hbnkgcHVycG9zZXMuIEZvciBleGFtcGxl
LCB3aGlsZSBsb29raW5nIGludG8gdGhpcyBhZ2FpbiB3aGVuCj4+IHByZXBhcmluZyB0aGUgcmVw
bHkgaGVyZSwgSSd2ZSBub3RpY2VkIHRoYXQgYWJvdmUgeW91IG1heSB3cm9uZ2x5Cj4+IGNhbGwg
aHZtX21vbml0b3JfY2hlY2tfcDJtKCkgd2l0aCBucGZlY19raW5kX3dpdGhfZ2xhIC0gdGhlcmUn
cyBubwo+PiBsaW5lYXIgYWRkcmVzcyB3aGVuIEhWTUNPUFlfbGluZWFyIGlzIG5vdCBzZXQuIElm
LCB3aGlsZSBwdXR0aW5nCj4gCj4gWW91IGFyZSByaWdodCwgYSBjaGVjayBmb3IgSFZNQ09QWV9s
aW5lYXIgc2hvdWxkIGdvIGluIHRoZSBpZiBzbyB3ZSBhcmUgCj4gc3VyZSB0aGF0IGl0IGlzIGNh
bGxlZCB3aXRoIGEgbGluZWFyIGFkZHJlc3Mgb25seS4KPiAKPj4gdG9nZXRoZXIgd2hhdCB0aGUg
Y29tbWVudCBuZWVkcyB0byBleHBsYWluIChpLmUuIGV2ZXJ5dGhpbmcgdGhhdAo+PiBjYW4ndCBi
ZSBpbXBsaWVkIGZyb20gdGhlIGNvZGUgeW91IGFkZCksIHlvdSBjb25zaWRlcmVkIGFsbCBjYXNl
cwo+PiB5b3Ugc2hvdWxkIGhhdmUgbm90aWNlZCB0aGlzIHlvdXJzZWxmLgo+IAo+IFdpdGggdGhp
cyBuZXcgY2hlY2sgaW4gcGxhY2UgKEhWTUNPUFlfbGluZWFyKSBfX2h2bV9jb3B5KCkgd2lsbCBi
ZSAKPiBjYWxsZWQgZnJvbSBsaW5lYXJfcmVhZCgpIGxpbmVhcl93cml0ZSgpIHdoZXJlIGl0IHdp
bGwgcGFzcyBkb3duIAo+IFg4NkVNVUxfUkVUUlkuCj4gCj4gVGhlIGNvbW1lbnQgY2FuIGNoYW5n
ZSB0bzoKPiAiSWYgYSBldmVudCBpcyBzZW50IHJldHVybiBwYWdlZF9vdXQuIFRoZSBlbXVsYXRp
b24gd2lsbCBoYXZlIG5vIHNpZGUgCj4gZWZmZWN0IGFuZCB3aWxsIHJldHVybiBYODZFTVVMX1JF
VFJZIgoKSSdtIHNvcnJ5IHRvIGJlIGEgcGFpbiBpbiB5b3VyIG5lY2ssIGJ1dCBubywgdGhpcyBz
dGlsbCBpcyBub3QKc3VmZmljaWVudCBpbW8uIFRoZSBjb21tZW50LCB3aGF0ZXZlciB3b3JkaW5n
IHlvdSBjaG9vc2UsCnNob3VsZCBtYWtlIGNsZWFyIHRoYXQgeW91IGhhdmUgdW5kZXJzdG9vZCB0
aGUgcG9zc2libGUgZWZmZWN0cwpvZiB1c2luZyBhIHN1c3BpY2lvdXMgcmV0dXJuIHZhbHVlLCBh
bmQgaXQgc2hvdWxkIGFsc28gbWFrZQpjbGVhciB0byByZWFkZXJzIHRoYXQgdGhpcyBpcyBpbiBm
YWN0IG5vdCBnb2luZyB0byBjYXVzZSBhCnByb2JsZW0gX2ZvciBhbnkgY2FsbGVyXy4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
