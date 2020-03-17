Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD76D187BD4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 10:18:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jE8Kk-00039N-Mv; Tue, 17 Mar 2020 09:16:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bptx=5C=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1jE8Kj-00039H-H5
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 09:16:21 +0000
X-Inumbo-ID: f6d1f41e-682f-11ea-b8f0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6d1f41e-682f-11ea-b8f0-12813bfff9fa;
 Tue, 17 Mar 2020 09:16:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 69A5BAC67;
 Tue, 17 Mar 2020 09:16:19 +0000 (UTC)
Date: Tue, 17 Mar 2020 10:16:18 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Josh Poimboeuf <jpoimboe@redhat.com>
In-Reply-To: <20200316203514.qm7so7b55jbmskgg@treble>
Message-ID: <alpine.LSU.2.21.2003171014470.21109@pobox.suse.cz>
References: <20200312142007.11488-1-mbenes@suse.cz>
 <20200312142007.11488-3-mbenes@suse.cz>
 <75224ad1-f160-802a-9d72-b092ba864fb7@suse.com>
 <alpine.LSU.2.21.2003131048110.30076@pobox.suse.cz>
 <alpine.LSU.2.21.2003161642450.15518@pobox.suse.cz>
 <20200316203514.qm7so7b55jbmskgg@treble>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC PATCH 2/2] x86/xen: Make the secondary CPU
 idle tasks reliable
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
Cc: =?ISO-8859-15?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, sstabellini@kernel.org,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, jslaby@suse.cz, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxNiBNYXIgMjAyMCwgSm9zaCBQb2ltYm9ldWYgd3JvdGU6Cgo+IE9uIE1vbiwgTWFy
IDE2LCAyMDIwIGF0IDA0OjUxOjEyUE0gKzAxMDAsIE1pcm9zbGF2IEJlbmVzIHdyb3RlOgo+ID4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3NtcF9wdi5jIGIvYXJjaC94ODYveGVuL3NtcF9w
di5jCj4gPiA+IGluZGV4IDZiODhjZGNiZWY4Zi4uMzlhZmQ4ODMwOWNiIDEwMDY0NAo+ID4gPiAt
LS0gYS9hcmNoL3g4Ni94ZW4vc21wX3B2LmMKPiA+ID4gKysrIGIvYXJjaC94ODYveGVuL3NtcF9w
di5jCj4gPiA+IEBAIC05Miw2ICs5Miw3IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQgY3B1
X2JyaW5ndXBfYW5kX2lkbGUodm9pZCkKPiA+ID4gIHsKPiA+ID4gICAgICAgICBjcHVfYnJpbmd1
cCgpOwo+ID4gPiAgICAgICAgIGJvb3RfaW5pdF9zdGFja19jYW5hcnkoKTsKPiA+ID4gKyAgICAg
ICBhc20gdm9sYXRpbGUgKFVOV0lORF9ISU5UKE9SQ19SRUdfVU5ERUZJTkVELCAwLCBPUkNfVFlQ
RV9DQUxMLCAxKSk7Cj4gPiA+ICAgICAgICAgY3B1X3N0YXJ0dXBfZW50cnkoQ1BVSFBfQVBfT05M
SU5FX0lETEUpOwo+ID4gPiAgfQo+ID4gPiAKPiA+ID4gYW5kIHRoYXQgc2VlbXMgdG8gd29yay4g
SSBuZWVkIHRvIHByb3Blcmx5IHZlcmlmeSBhbmQgdGVzdCwgYnV0IHRoZSAKPiA+ID4gZXhwbGFu
YXRpb24gaXMgdGhhdCBhcyBvcHBvc2VkIHRvIHRoZSBhYm92ZSwgY3B1X3N0YXJ0dXBfZW50cnko
KSBpcyBvbiB0aGUgCj4gPiA+IGlkbGUgdGFzaydzIHN0YWNrIGFuZCB0aGUgaGludCBpcyB0aGVu
IHRha2VuIGludG8gYWNjb3VudC4gVGhlIHVud291bmQgCj4gPiA+IHN0YWNrIHNlZW1zIHRvIGJl
IGNvbXBsZXRlLCBzbyBpdCBjb3VsZCBpbmRlZWQgYmUgdGhlIGZpeC4KPiA+IAo+ID4gTm90IHRo
ZSBjb3JyZWN0IG9uZSB0aG91Z2guIE9ianRvb2wgcmlnaHRmdWxseSBjb21wbGFpbnMgd2l0aAo+
ID4gCj4gPiBhcmNoL3g4Ni94ZW4vc21wX3B2Lm86IHdhcm5pbmc6IG9ianRvb2w6IGNwdV9icmlu
Z3VwX2FuZF9pZGxlKCkrMHg2YTogdW5kZWZpbmVkIHN0YWNrIHN0YXRlCj4gPiAKPiA+IGFuZCBh
bGwgdGhlIG90aGVyIGhhY2tzIEkgdHJpZWQgZW5kZWQgdXAgaW4gdGhlIHNhbWUgZGVhZCBhbGxl
eS4gSXQgc2VlbXMgCj4gPiB0byBtZSB0aGUgY29ycmVjdCBmaXggaXMgdGhhdCBhbGwgb3JjIGVu
dHJpZXMgZm9yIGNwdV9icmluZ3VwX2FuZF9pZGxlKCkgCj4gPiBzaG91bGQgaGF2ZSAiZW5kIiBw
cm9wZXJ0eSBzZXQgdG8gMSwgc2luY2UgaXQgaXMgdGhlIGZpcnN0IGZ1bmN0aW9uIG9uIHRoZSAK
PiA+IHN0YWNrLiBJIGRvbid0IGtub3cgaG93IHRvIGFjaGlldmUgdGhhdCB3aXRob3V0IHRoZSBh
c3NlbWJseSBoYWNrIGluIHRoZSAKPiA+IHBhdGNoIEkgc2VudC4gSWYgSSBhbSBub3QgbWlzc2lu
ZyBzb21ldGhpbmcsIG9mIGNvdXJzZS4KPiA+IAo+ID4gSm9zaCwgYW55IGlkZWE/Cj4gCj4gWWVh
aCwgSSB0aGluayBtdWNraW5nIHdpdGggdGhlIHVud2luZCBoaW50cyBpbiBDIGNvZGUgaXMgZ29p
bmcgdG8gYmUKPiBwcmVjYXJpb3VzLiAgWW91IGNvdWxkIG1heWJlIGhhdmUgc29tZXRoaW5nIGxp
a2UKPiAKPiAJYXNtKCIKPiAJICBVTldJTkRfSElOVF9FTVBUWVxuCj4gCSAgbW92ICRDUFVIUF9B
UF9PTkxJTkVfSURMRSwgJXJkaVxuCj4gCSAgY2FsbCBjcHVfc3RhcnR1cF9lbnRyeVxuCj4gCSki
Cj4gCXVucmVhY2hhYmxlKCk7Cj4gCj4gYnV0IHRoYXQncyBwcmV0dHkgdWdseSAoYW5kIGl0IG1p
Z2h0IG5vdCB3b3JrIGFueXdheSkuCj4gCj4gSSBzdXBwb3NlIHdlIGNvdWxkIGFkZCBhIG5ldyBm
YWNpbGl0eSB0byBtYXJrIGFuIGVudGlyZSBDIGZ1bmN0aW9uIGFzIGFuCj4gImVuZCIgcG9pbnQu
CgpJIHRoaW5rIGl0IHdvdWxkIGJlIGFuIG92ZXJraWxsIGZvciB3aGF0IEkgcGVyY2VpdmUgYXMg
b25lLW9mZiBzY2VuYXJpby4gCk1heWJlIGlmIHRoZXJlIGFyZSBtb3JlIHVzZSBjYXNlcyBpbiB0
aGUgZnV0dXJlLCBidXQgSSBkb3VidCBpdC4KIAo+IEJ1dCBJIHRoaW5rIGl0IHdvdWxkIGJlIGNs
ZWFuZXN0IHRvIGp1c3QgZG8gc29tZXRoaW5nIGxpa2UgeW91ciBwYXRjaAo+IGFuZCBoYXZlIHRo
ZSBlbnRyeSBjb2RlIGJlIGFzbSB3aGljaCB0aGVuIGNhbGxzIGNwdV9icmluZ3VwX2FuZF9pZGxl
KCkuCj4gVGhhdCB3b3VsZCBtYWtlIGl0IGNvbnNpc3RlbnQgd2l0aCBhbGwgb3RoZXIgZW50cnkg
Y29kZSwgd2hpY2ggYWxsIGxpdmVzCj4gaW4gYXNtLgoKQWNrLgoKVGhhbmtzCk1pcm9zbGF2Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
