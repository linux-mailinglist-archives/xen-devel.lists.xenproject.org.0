Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C6CD8788
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 06:35:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKayF-0005Bf-5Q; Wed, 16 Oct 2019 04:31:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eWLc=YJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iKayD-0005Ba-I9
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 04:31:33 +0000
X-Inumbo-ID: d48cd7a0-efcd-11e9-8aca-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d48cd7a0-efcd-11e9-8aca-bc764e2007e4;
 Wed, 16 Oct 2019 04:31:32 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78CDE20854;
 Wed, 16 Oct 2019 04:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571200292;
 bh=QSX6RFRDHKn5eXUq2HUptoRVfAy5jbe69rBUm94ONlY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=VkwHAc8ukQcsCLwQbgveWeIdiU7C8tdCwjkppQ4CAIS+hJm4f9L6z9A1Gj6/e8hg2
 AYe5/InaPzuyzBj7Wduz3FvBNbw+pmSXEYYZdmndW3RYlWOBRgVzWtulXVG4e4nMzJ
 QHUhhj+Iju97TxsnCB2bhA9z7fxaY5Ck9Wbw/1MU=
Date: Tue, 15 Oct 2019 21:31:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <9520fef5-a21b-e4cc-12d1-97794b979883@arm.com>
Message-ID: <alpine.DEB.2.21.1910152124170.30080@sstabellini-ThinkPad-T480s>
References: <20191015181802.21957-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910151221270.30080@sstabellini-ThinkPad-T480s>
 <bfb3ac7c-19bc-90f0-381b-32a1491a967c@arm.com>
 <alpine.DEB.2.21.1910151249160.30080@sstabellini-ThinkPad-T480s>
 <9520fef5-a21b-e4cc-12d1-97794b979883@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Don't use _end in
 is_xen_fixed_mfn()
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNSBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDE1LzEwLzIwMTkg
MjE6MzgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFR1ZSwgMTUgT2N0IDIwMTks
IEp1bGllbiBHcmFsbCB3cm90ZToKPiA+PiBIaSwKPiA+Pgo+ID4+IE9uIDE1LzEwLzIwMTkgMjA6
MjgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+Pj4gT24gVHVlLCAxNSBPY3QgMjAxOSwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4+Pj4gdmlydF90b19tYWRkcigpIGlzIHVzaW5nIHRoZSBo
YXJkd2FyZSBwYWdlLXRhYmxlIHdhbGsgaW5zdHJ1Y3Rpb25zIHRvCj4gPj4+PiB0cmFuc2xhdGUg
YSB2aXJ0dWFsIGFkZHJlc3MgdG8gcGh5c2ljYWwgYWRkcmVzcy4gVGhlIGZ1bmN0aW9uIHNob3Vs
ZAo+ID4+Pj4gb25seSBiZSBjYWxsZWQgb24gdmlydHVhbCBhZGRyZXNzIG1hcHBlZC4KPiA+Pj4+
Cj4gPj4+PiBfZW5kIHBvaW50cyBwYXN0IHRoZSBlbmQgb2YgWGVuIGJpbmFyeSBhbmQgbWF5IG5v
dCBiZSBtYXBwZWQgd2hlbiB0aGUKPiA+Pj4+IGJpbmFyeSBzaXplIGlzIHBhZ2UtYWxpZ25lZC4g
VGhpcyBtZWFucyB2aXJ0X3RvX21hZGRyKCkgd2lsbCBub3QgYmUgYWJsZQo+ID4+Pj4gdG8gZG8g
dGhlIHRyYW5zbGF0aW9uIGFuZCB0aGVyZWZvcmUgY3Jhc2ggWGVuLgo+ID4+Pj4KPiA+Pj4+IE5v
dGUgdGhlcmUgaXMgYWxzbyBhbiBvZmYtYnktb25lIGlzc3VlIGluIHRoaXMgY29kZSwgYnV0IHRo
ZSBwYW5pYyB3aWxsCj4gPj4+PiB0cnVtcCB0aGF0Lgo+ID4+Pj4KPiA+Pj4+IEJvdGggaXNzdWVz
IGNhbiBiZSBmaXhlZCBieSB1c2luZyBfZW5kIC0gMSBpbiB0aGUgY2hlY2suCj4gPj4+Pgo+ID4+
Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiA+
Pj4+Cj4gPj4+PiAtLS0KPiA+Pj4+Cj4gPj4+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KPiA+Pj4+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFw
QGV1LmNpdHJpeC5jb20+Cj4gPj4+PiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNp
dHJpeC5jb20+Cj4gPj4+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4+
Pj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4gPj4+PiBDYzogS29ucmFkIFJ6
ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+ID4+Pj4gQ2M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiA+Pj4+IENjOiBUaW0gRGVlZ2Fu
IDx0aW1AeGVuLm9yZz4KPiA+Pj4+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4+Pj4gQ2M6
IGpncm9zc0BzdXNlLmNvbQo+ID4+Pj4KPiA+Pj4+IHg4NiBzZWVtcyB0byBiZSBhZmZlY3RlZCBi
eSB0aGUgb2ZmLWJ5LW9uZSBpc3N1ZS4gSmFuLCBBbmRyZXc/Cj4gPj4+Pgo+ID4+Pj4gVGhpcyBj
b3VsZCBiZSByZWFjaGVkIGJ5IGEgZG9tYWluIHZpYSBYRU5fU1lTQ1RMX3BhZ2Vfb2ZmbGluZV9v
cC4KPiA+Pj4+IEhvd2V2ZXIsIHRoZSBvcGVyYXRpb24gaXMgbm90IHNlY3VyaXR5IHN1cHBvcnRl
ZCAoc2VlIFhTQS03NykuIFNvIHdlIGFyZQo+ID4+Pj4gZmluZSBoZXJlLgo+ID4+Pj4gLS0tCj4g
Pj4+PiAgICB4ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggfCAyICstCj4gPj4+PiAgICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Pj4+Cj4gPj4+PiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9t
bS5oCj4gPj4+PiBpbmRleCAyNjJkOTJmMThkLi4xNzRhY2Q4ODU5IDEwMDY0NAo+ID4+Pj4gLS0t
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCj4gPj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20t
YXJtL21tLmgKPiA+Pj4+IEBAIC0xNTMsNyArMTUzLDcgQEAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcg
eGVuaGVhcF9iYXNlX3BkeDsKPiA+Pj4+ICAgIAo+ID4+Pj4gICAgI2RlZmluZSBpc194ZW5fZml4
ZWRfbWZuKG1mbikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+Pj4+ICAg
ICAgICAoKG1mbl90b19tYWRkcihtZm4pID49IHZpcnRfdG9fbWFkZHIoJl9zdGFydCkpICYmICAg
ICAgICAgICBcCj4gPj4+PiAtICAgICAobWZuX3RvX21hZGRyKG1mbikgPD0gdmlydF90b19tYWRk
cigmX2VuZCkpKQo+ID4+Pj4gKyAgICAgKG1mbl90b19tYWRkcihtZm4pIDw9IHZpcnRfdG9fbWFk
ZHIoX2VuZCAtIDEpKSkKPiA+Pj4KPiA+Pj4gVGhhbmsgeW91IGZvciBzZW5kaW5nIHRoZSBwYXRj
aCBhbmQgSSB0aGluayB0aGF0ICJfZW5kIC0gMSIgaXMgdGhlIHJpZ2h0Cj4gPj4+IGZpeC4gSSBh
bSBqdXN0IHdvbmRlcmluZyB3aGV0aGVyIHdlIHdhbnQvbmVlZCBhbiBleHBsaWNpdCBjYXN0IG9m
IHNvbWUKPiA+Pj4gc29ydCBoZXJlLCBiZWNhdXNlIHRlY2huaWNhbGx5IF9lbmQgaXMgYSBjaGFy
W10gYW5kIDEgaXMgYSBpbnRlZ2VyLgo+ID4+PiBNYXliZToKPiA+Pj4KPiA+Pj4gICAgICgodmFk
ZHJfdClfZW5kIC0gMSkKPiA+Pj4KPiA+Pj4gPwo+ID4+Cj4gPj4gSSB2YWd1ZWx5IHJlbWVtYmVy
IGEgbGVuZ3RoeSBkaXNjdXNzaW9uIGFib3V0IGl0IGxhc3QgeWVhci4gQnV0IEkgZG9uJ3QKPiA+
PiB0aGluayB0aGVyZSB3YXMgYW55IGNvbmNsdXNpb24gaW4gaXQuCj4gPj4KPiA+PiBJbiB0aGlz
IGNhc2UsIHdoYXQgYXJlIHlvdSB0cnlpbmcgdG8gcHJldmVudCB3aXRoIHRoZSBjYXN0PyBJcyBp
dAo+ID4+IHVuZGVyZmxvdyBvZiBhbiBhcnJheT8gSWYgc28sIGhvdyB0aGUgY2FzdCBpcyBhY3R1
YWxseSBnb2luZyB0byBwcmV2ZW50Cj4gPj4gdGhlIGNvbXBpbGVyIHRvIGRvIHRoZSB3cm9uZyB0
aGluZz8KPiA+IAo+ID4gWWVzLCB0aGVyZSB3YXMgYSBsb25nIGRpc2N1c3Npb24gYXQgdGhlIGJl
Z2lubmluZyBvZiB0aGUgeWVhcjsgaXQgd2FzCj4gPiBhYm91dCBob3cgdG8gZGVmaW5lIF9zdGFy
dCBhbmQgX2VuZCBzbyB0aGF0IHdlIGNvdWxkIGF2b2lkIGNvbXBpbGVycwo+ID4gdW5kZWZpbmVk
IGJlaGF2aW9yLiBUaGUgbWFpbiB1bmRlcmx5aW5nIGlzc3VlIGlzIHRoYXQgY29tcGFyaXNvbnMK
PiA+IGJldHdlZW4gcG9pbnRlcnMgdG8gZGlmZmVyZW50IG9iamVjdHMgYXJlIHVuZGVmaW5lZCBb
MV0gKF9zdGFydCBhbmQgX2VuZAo+ID4gY2FuIGJlIGludGVycHJldGVkIGFzIHBvaW50ZXJzIHRv
IGRpZmZlcmVudCBvYmplY3RzKS4KPiA+IAo+ID4gVGhpcyBjYXNlIGlzIGEgYml0IGRpZmZlcmVu
dCwgYW5kIGVhc2llci4gVGhlIGlzc3VlIGlzIHRoYXQsIGJlY2F1c2UgdGhlCj4gPiByZXN1bHQg
b2YgIl9lbmQgLSAxIiBpcyBub3Qgd2l0aGluIHRoZSBib3VuZGFyaWVzIG9mIHRoZSBfZW5kIGFy
cmF5LAo+ID4gdGhlbiB0aGUgb3BlcmF0aW9uIGlzICJ1bmRlZmluZWQiIGJ5IHRoZSBDIHNwZWNp
ZmljYXRpb24gKEM5OSA2LjUuNikuCj4gPiBVbmRlZmluZWQgaXMgbm90IGdvb2QuCj4gPiAKPiA+
IFNvLCBJIGFtIG5vdCByZWFsbHkgYXNraW5nIGZvciBhbnkgY29tcGxleCBmaXgsIG9yIGh5cGVy
dmlzb3Itd2lkZQo+ID4gcmV3b3JrLiBJIGFtIG9ubHkgYXNraW5nIHRvIGF2b2lkIGludHJvZHVj
aW5nIG5ldyB1bmRlZmluZWQgYmVoYXZpb3IuCj4gPiBDYXN0aW5nIHRvIHZhZGRyX3Qgc2hvdWxk
IHNvbHZlIGl0IEkgdGhpbmsuCj4gCj4gSSBhZ3JlZSB0aGF0IHdlIHNob3VsZCBub3QgYWRkIG1v
cmUgdW5kZWZpbmVkIGJlaGF2aW9yIGluIFhlbi4gSG93ZXZlciwKPiBJIGRvbid0IGxpa2UgY2Fz
dCBpZiB0aGV5IGNhbid0IGJlIGp1c3RpZmllZC4KPiAKPiBJbiB0aGlzIHBhcnRpY3VsYXIgY2Fz
ZSwgeW91IHNlZW0gdG8gYmUgdW5zdXJlIHRoaXMgaXMgZ29pbmcgdG8gcmVtb3ZlIAo+IGFuIHVu
ZGVmaW5lZCBiZWhhdmlvci4gSUlSQywgSSBwb2ludGVkIG91dCBpbiB0aGUgcGFzdCB0aGF0IGNv
bXBpbGVyIGNhbiAKPiBzZWUgdGhyb3VnaCBjYXN0Lgo+IAo+IFNvIGNhbiB3ZSBoYXZlIHNvbWUg
Y2VydGFpbnR5IHRoYXQgeW91ciBzdWdnZXN0aW9uIGlzIGdvaW5nIHRvIHdvcms/CgpNeSBzdWdn
ZXN0aW9uIGlzIGdvaW5nIHRvIHdvcms6ICJ0aGUgY29tcGlsZXIgc2VlcyB0aHJvdWdoIGNhc3Rz
IgpyZWZlcnJlZCB0byBjb21wYXJpc29ucyBiZXR3ZWVuIHBvaW50ZXJzLCB3aGVyZSB3ZSB0ZW1w
b3JhcmlseSBjYXN0ZWQKYm90aCBwb2ludGVycyB0byBpbnRlZ2VycyBhbmQgYmFjayB0byBwb2lu
dGVycyB2aWEgYSBNQUNSTy4gVGhhdCBjYXNlCndhcyBpZmZ5IGJlY2F1c2UgdGhlIE1BQ1JPIHdh
cyBjbGVhcmx5IGEgd29ya2Fyb3VuZCB0aGUgc3BlYy4KCkhlcmUgdGhlIHNpdHVhdGlvbiBpcyBk
aWZmZXJlbnQuIEZvciBvbmUsIHdlIGFyZSBkb2luZyBhcml0aG1ldGljLiBBbHNvCnZpcnRfdG9f
bWFkZHIgYWxyZWFkeSB0YWtlcyBhIHZhZGRyX3QgYXMgYXJndW1lbnQuIFNvIGluc3RlYWQgb2Yg
ZG9pbmcKcG9pbnRlcnMgYXJpdGhtZXRpYywgdGhlbiBjb252ZXJ0aW5nIHRvIHZhZGRyX3QsIHdl
IGFyZSBjb252ZXJ0aW5nIHRvCnZhZGRyX3QgZmlyc3QsIHRoZW4gZG9pbmcgYXJpdGhtZXRpY3Ms
IHdoaWNoIGlzIGZpbmUgYm90aCBmcm9tIGEgQzk5CnBvaW50IG9mIHZpZXcgYW5kIGV2ZW4gYSBN
SVNSQSBDIHBvaW50IG9mIHZpZXcuIEkgY2FuJ3Qgc2VlIGEgcHJvYmxlbQp3aXRoIHRoYXQuIEkg
YW0gc3VyZSBhcyBJIHJlYXNvbmFibGUgY2FuIGJlIDotKQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
