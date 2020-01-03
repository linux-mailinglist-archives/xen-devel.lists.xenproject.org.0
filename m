Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B732D12F9E0
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 16:35:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inOwT-00025I-GF; Fri, 03 Jan 2020 15:32:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inOwS-00025A-6N
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 15:32:48 +0000
X-Inumbo-ID: 4b0f2866-2e3e-11ea-a4cb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b0f2866-2e3e-11ea-a4cb-12813bfff9fa;
 Fri, 03 Jan 2020 15:32:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AFEA1AE04;
 Fri,  3 Jan 2020 15:32:46 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191217201550.15864-1-andrew.cooper3@citrix.com>
 <20191217201550.15864-5-andrew.cooper3@citrix.com>
 <a954c0a2-7ef0-4cf8-2a67-3972e7368d7e@suse.com>
 <c26cd7d9-1be5-92a2-efe4-16e4c2d747ae@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68b17202-8cd4-1cc5-4561-c71ee505c021@suse.com>
Date: Fri, 3 Jan 2020 16:33:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <c26cd7d9-1be5-92a2-efe4-16e4c2d747ae@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] tools/dombuilder: Don't allocate
 dom->p2m_host[] for translated domains
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDEuMjAyMCAxNjowMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMy8wMS8yMDIw
IDE0OjI1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTcuMTIuMjAxOSAyMToxNSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGNfZG9tLmgKPj4+
ICsrKyBiL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGNfZG9tLmgKPj4+IEBAIC0xMjMsMTYgKzEyMywx
MiBAQCBzdHJ1Y3QgeGNfZG9tX2ltYWdlIHsKPj4+ICAKPj4+ICAgICAgLyogb3RoZXIgc3RhdGUg
aW5mbyAqLwo+Pj4gICAgICB1aW50MzJfdCBmX2FjdGl2ZVtYRU5GRUFUX05SX1NVQk1BUFNdOwo+
Pj4gKwo+Pj4gICAgICAvKgo+Pj4gLSAgICAgKiBwMm1faG9zdCBtYXBzIGd1ZXN0IHBoeXNpY2Fs
IGFkZHJlc3NlcyBhbiBvZmZzZXQgZnJvbQo+Pj4gLSAgICAgKiByYW1iYXNlX3BmbiAoc2VlIGJl
bG93KSBpbnRvIGdmbnMuCj4+IFRoZSByZW1vdmFsIG9mIHRoaXMgcGFydCBvZiB0aGUgY29tbWVu
dCBhbmQgLi4uCj4+Cj4+PiAtICAgICAqIEZvciBhIHB1cmUgUFYgZ3Vlc3QgdGhpcyBtZWFucyB0
aGF0IGl0IG1hcHMgR1BGTnMgaW50byBNRk5zIGZvcgo+Pj4gLSAgICAgKiBhIGh5YnJpZCBndWVz
dCB0aGlzIG1lYW5zIHRoYXQgaXQgbWFwcyBHUEZOcyB0byBHUEZOUy4KPj4+IC0gICAgICoKPj4+
IC0gICAgICogTm90ZSB0aGF0IHRoZSBpbnB1dCBpcyBvZmZzZXQgYnkgcmFtYmFzZS4KPj4+ICsg
ICAgICogcHZfcDJtIGlzIHNwZWNpZmljIHRvIHg4NiBQViBndWVzdHMsIGFuZCBtYXBzIEdGTnMg
dG8gTUZOcy4gIEl0IGlzCj4+PiArICAgICAqIGV2ZW50dWFsbHkgY29waWVkIGludG8gZ3Vlc3Qg
Y29udGV4dC4KPj4+ICAgICAgICovCj4+PiAtICAgIHhlbl9wZm5fdCAqcDJtX2hvc3Q7Cj4+PiAr
ICAgIHhlbl9wZm5fdCAqcHZfcDJtOwo+Pj4gIAo+Pj4gICAgICAvKiBwaHlzaWNhbCBtZW1vcnkK
Pj4+ICAgICAgICoKPj4+IEBAIC00MzMsOSArNDI5LDEyIEBAIHN0YXRpYyBpbmxpbmUgeGVuX3Bm
bl90IHhjX2RvbV9wMm0oc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tLCB4ZW5fcGZuX3QgcGZuKQo+
Pj4gIHsKPj4+ICAgICAgaWYgKCB4Y19kb21fdHJhbnNsYXRlZChkb20pICkKPj4+ICAgICAgICAg
IHJldHVybiBwZm47Cj4+PiAtICAgIGlmIChwZm4gPCBkb20tPnJhbWJhc2VfcGZuIHx8IHBmbiA+
PSBkb20tPnJhbWJhc2VfcGZuICsgZG9tLT50b3RhbF9wYWdlcykKPj4+ICsKPj4+ICsgICAgLyog
eDg2IFBWIG9ubHkgbm93LiAqLwo+Pj4gKyAgICBpZiAoIHBmbiA+PSBkb20tPnRvdGFsX3BhZ2Vz
ICkKPj4+ICAgICAgICAgIHJldHVybiBJTlZBTElEX01GTjsKPj4+IC0gICAgcmV0dXJuIGRvbS0+
cDJtX2hvc3RbcGZuIC0gZG9tLT5yYW1iYXNlX3Bmbl07Cj4+PiArCj4+PiArICAgIHJldHVybiBk
b20tPnB2X3AybVtwZm5dOwo+Pj4gIH0KPj4gLi4uIHRoZSBkcm9wcGluZyBvZiBhbGwgdXNlcyBv
ZiByYW1iYXNlX3BmbiBoZXJlIG1ha2UgaXQgbG9vawo+PiBsaWtlIHlvdSdyZSBkb2luZyBhd2F5
IHdpdGggdGhhdCBjb25jZXB0IGFsdG9nZXRoZXIuIElzIHRoaXMKPj4gcmVhbGx5IGNvcnJlY3Q/
Cj4gCj4gV2VsbCAtIGl0IGlzIGVmZmVjdGl2ZWx5IGRlYWQgY29kZSBoZXJlLCBiZWNhdXNlIG9m
IHRoZQo+IHhjX2RvbV90cmFuc2xhdGVkKCkgaW4gY29udGV4dCBhYm92ZSwgYW5kIGl0IGJlaW5n
IDAgb3V0c2lkZSBvZiBBUk0uCj4gCj4gVGhlIChub256ZXJvKSB2YWx1ZSBpcyB1c2VkIGJ5IG90
aGVyIGJpdHMgb2YgQVJNIGNvZGUuCj4gCj4+ICBJZiBzbywgSSBndWVzcyB5b3Ugd2FudCB0bwo+
PiAtIHNheSBhIHdvcmQgaW4gdGhpcyByZWdhcmQgaW4gdGhlIGRlc2NyaXB0aW9uLCB0aGUgbW9y
ZSB0aGF0Cj4+ICAgeW91IGRvbid0IGZ1bGx5IGdldCByaWQgb2YgdGhpcyAodGhlIHN0cnVjdHVy
ZSBmaWVsZCBhbmQKPj4gICBzb21lIHVzZXMgZWxzZXdoZXJlIHJlbWFpbiksCj4+IC0gZHJvcC9h
ZGp1c3QgdGhlIHJlc3BlY3RpdmUgY29tbWVudCBmcmFnbWVudCBuZXh0IHRvIHRoZQo+PiAgIGZp
ZWxkIGEgbGl0dGxlIGZ1cnRoZXIgZG93biBpbiB0aGUgc3RydWN0dXJlLgo+IAo+IFRoZSBkb21h
aW4gYnVpbGRlciBpcyBtYWRlIGFsbW9zdCBleGNsdXNpdmVseSBvZiBiaXRyb3QsIGJ1dCBJIGRv
bid0Cj4gaGF2ZSBhbiBBUk0gc3lzdGVtIHRvIGRvIGFueSB0ZXN0aW5nIG9uLsKgIEdpdmVuIGhv
dyBmcmFnaWxlIHRoZSBjb2RlIGlzLAo+IEknbSBub3QgY29tZm9ydGFibGUgZG9pbmcgc3BlY3Vs
YXRpdmUgZGVsZXRpb24gb2YgY29kZSBJJ20gbm90IGNlcnRhaW4KPiBpcyB1bnVzZWQuCgpNeSBy
ZW1hcmsgd2FzIGFib3V0IHRoaXMgKG5vbi1Bcm0pIHBhcnQgb2YgdGhlIGNvbW1lbnQ6CgogICAg
ICogQW4geDg2IFBWIGd1ZXN0IGhhcyBvbmUgb3IgbW9yZSBibG9ja3Mgb2YgcGh5c2ljYWwgUkFN
LAogICAgICogY29uc2lzdGluZyBvZiB0b3RhbF9wYWdlcyBzdGFydGluZyBhdCByYW1iYXNlX3Bm
bi4gVGhlIHN0YXJ0CiAgICAgKiBhZGRyZXNzIGFuZCBzaXplIG9mIGVhY2ggYmxvY2sgaXMgY29u
dHJvbGxlZCBieSB2TlVNQQogICAgICogc3RydWN0dXJlcy4KCkkgZGlkIGluIG5vIHdheSBtZWFu
IHRvIGFzayBmb3Igc3BlY3VsYXRpdmUgZGVsZXRpb24gb2YgY29kZS4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
