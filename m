Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F8A17A259
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 10:39:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9mvy-0006lo-1X; Thu, 05 Mar 2020 09:36:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9mvw-0006lj-4E
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 09:36:48 +0000
X-Inumbo-ID: d4e46a7c-5ec4-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4e46a7c-5ec4-11ea-b52f-bc764e2007e4;
 Thu, 05 Mar 2020 09:36:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 28AFFAC2C;
 Thu,  5 Mar 2020 09:36:46 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Varad Gautam <vrd@amazon.de>
References: <1580290087-20636-1-git-send-email-vrd@amazon.de>
 <20200129103050.GV57924@desktop-tdan49n.eng.citrite.net>
 <9bb58eaf-bb85-f0f2-b626-3442532305ac@suse.com>
Message-ID: <708d6906-455f-108f-3733-e8cf5367deec@suse.com>
Date: Thu, 5 Mar 2020 10:36:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9bb58eaf-bb85-f0f2-b626-3442532305ac@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86: irq: Do not BUG_ON multiple unbind
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAxMjo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMDEuMjAyMCAx
MTozMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gSGVsbG8sCj4+Cj4+IFRoYW5rcyBmb3Ig
dGhlIHBhdGNoISBOZXh0IHRpbWUgY291bGQgeW91IHBsZWFzZSB0cnkgdG8gcmVwbHkgdG8gdGhl
Cj4+IHByZXZpb3VzIHF1ZXN0aW9ucyBiZWZvcmUgc2VuZGluZyBhIG5ldyB2ZXJzaW9uOgo+Pgo+
PiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIw
MTktMDcvbXNnMDAyNTcuaHRtbAo+Pgo+PiBPbiBXZWQsIEphbiAyOSwgMjAyMCBhdCAxMDoyODow
N0FNICswMTAwLCBWYXJhZCBHYXV0YW0gd3JvdGU6Cj4+PiBYRU5fRE9NQ1RMX2Rlc3Ryb3lkb21h
aW4gY3JlYXRlcyBhIGNvbnRpbnVhdGlvbiBpZiBkb21haW5fa2lsbCAtRVJFU1RBUlRTLgo+Pj4g
SW4gdGhhdCBzY2VuYXJpbywgaXQgaXMgcG9zc2libGUgdG8gcmVjZWl2ZSBtdWx0aXBsZSBfcGly
cV9ndWVzdF91bmJpbmQKPj4+IGNhbGxzIGZvciB0aGUgc2FtZSBwaXJxIGZyb20gZG9tYWluX2tp
bGwsIGlmIHRoZSBwaXJxIGhhcyBub3QgeWV0IGJlZW4KPj4+IHJlbW92ZWQgZnJvbSB0aGUgZG9t
YWluJ3MgcGlycV90cmVlLCBhczoKPj4+ICAgZG9tYWluX2tpbGwoKQo+Pj4gICAgIC0+IGRvbWFp
bl9yZWxpbnF1aXNoX3Jlc291cmNlcygpCj4+PiAgICAgICAtPiBwY2lfcmVsZWFzZV9kZXZpY2Vz
KCkKPj4+ICAgICAgICAgLT4gcGNpX2NsZWFuX2RwY2lfaXJxKCkKPj4+ICAgICAgICAgICAtPiBw
aXJxX2d1ZXN0X3VuYmluZCgpCj4+PiAgICAgICAgICAgICAtPiBfX3BpcnFfZ3Vlc3RfdW5iaW5k
KCkKPj4+Cj4+PiBGb3IgYSBzaGFyZWQgcGlycSAobnJfZ3Vlc3RzID4gMSksIHRoZSBmaXJzdCBj
YWxsIHdvdWxkIHphcCB0aGUgY3VycmVudAo+Pj4gZG9tYWluIGZyb20gdGhlIHBpcnEncyBndWVz
dHNbXSBsaXN0LCBidXQgdGhlIGFjdGlvbiBoYW5kbGVyIGlzIG5ldmVyIGZyZWVkCj4+PiBhcyB0
aGVyZSBhcmUgb3RoZXIgZ3Vlc3RzIHVzaW5nIHRoaXMgcGlycS4gQXMgYSByZXN1bHQsIG9uIHRo
ZSBzZWNvbmQgY2FsbCwKPj4+IF9fcGlycV9ndWVzdF91bmJpbmQgc2VhcmNoZXMgZm9yIHRoZSBj
dXJyZW50IGRvbWFpbiB3aGljaCBoYXMgYmVlbiByZW1vdmVkCj4+PiBmcm9tIHRoZSBndWVzdHNb
XSBsaXN0LCBhbmQgaGl0cyBhIEJVR19PTi4KPj4+Cj4+PiBNYWtlIF9fcGlycV9ndWVzdF91bmJp
bmQgc2FmZSB0byBiZSBjYWxsZWQgbXVsdGlwbGUgdGltZXMgYnkgbGV0dGluZyB4ZW4KPj4+IGNv
bnRpbnVlIGlmIGEgc2hhcmVkIHBpcnEgaGFzIGFscmVhZHkgYmVlbiB1bmJvdW5kIGZyb20gdGhp
cyBndWVzdC4gVGhlCj4+PiBQSVJRIHdpbGwgYmUgY2xlYW5lZCB1cCBmcm9tIHRoZSBkb21haW4n
cyBwaXJxX3RyZWUgZHVyaW5nIHRoZSBkZXN0cnVjdGlvbgo+Pj4gaW4gY29tcGxldGVfZG9tYWlu
X2Rlc3Ryb3kgYW55d2F5cy4KPj4KPj4gU28gQUZBSUNUIHRoaXMgaXMgYmVjYXVzZSBwdF9waXJx
X3NvZnRpcnFfYWN0aXZlKCkgcmV0dXJucyB0cnVlIGluCj4+IHBjaV9jbGVhbl9kcGNpX2lycSgp
IGFuZCBoZW5jZSB0aGUgaXRlcmF0aW9uIGlzIHN0b3BwZWQgYW5kCj4+IGh2bV9kb21haW5faXJx
KGQpLT5kcGNpIGlzIG5vdCBzZXQgdG8gTlVMTC4KPj4KPj4gV291bGQgaXQgYmUgcG9zc2libGUg
dG8gY2xlYW4gdGhlIGFscmVhZHkgcHJvY2Vzc2VkIElSUXMgZnJvbSB0aGUKPj4gZG9tYWluIHBp
cnFfdHJlZT8KPiAKPiBUaGlzIG1pZ2h0IHdvcmssIHBlcmhhcHMgYnkgd2F5IG9mIGludm9raW5n
IHVubWFwX2RvbWFpbl9waXJxKCkKPiByaWdodCBhZnRlciBwaXJxX2d1ZXN0X3VuYmluZCgpLCBh
cyBsb25nIGFzIGh2bV9kaXJxX2Fzc2lzdCgpIChhcwo+IGNhbGxlZCBmcm9tIGRwY2lfc29mdGly
cSgpKSBjYW4gYmUgbWFkZSBza2lwIGFsbCBhY3R1YWwgd29yayBpdAo+IG1lYW5zIHRvIGRvIGlu
IHN1Y2ggYSBjYXNlLiBVbmZvcnR1bmF0ZWx5IHRoZSB0d28gLT5tYXNrZWQgZmllbGRzCj4gYWN0
ZWQgdXBvbiBhcmUgZGlmZmVyZW50IGJldHdlZW4gX19waXJxX2d1ZXN0X3VuYmluZCgpIGFuZAo+
IGh2bV9kaXJxX2Fzc2lzdCgpLgoKUGluZz8gVW5sZXNzIEkgaGVhciBiYWNrIHNvb24sIEknbSBh
ZnJhaWQgSSdtIGdvaW5nIHRvIGRyb3AgdGhpcwpwYXRjaCBmcm9tIG15ICJwZW5kaW5nIiBtYWls
IGZvbGRlciwgYXMgbm90IGJlaW5nIGFncmVlZCB3aGV0aGVyCnRvIHN0aWNrIHRvIHRoZSBjdXJy
ZW50IHZlcnNpb24gb3Igd2hldGhlciB0byBnbyB0aGlzIGFsdGVybmF0aXZlCnJvdXRlLiBBIG1v
cmUgIm5hdHVyYWwiIGFwcHJvYWNoIHRvIGZpeGluZyB0aGUgaXNzdWUgd291bGQgYmUKcXVpdGUg
bmljZSwgYWZ0ZXIgYWxsLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
