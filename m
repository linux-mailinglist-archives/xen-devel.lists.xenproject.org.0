Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FA8D8131
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 22:41:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKTai-00021W-VS; Tue, 15 Oct 2019 20:38:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yms0=YI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iKTag-00021R-Qo
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 20:38:46 +0000
X-Inumbo-ID: c888bd62-ef8b-11e9-93a2-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c888bd62-ef8b-11e9-93a2-12813bfff9fa;
 Tue, 15 Oct 2019 20:38:46 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B88220872;
 Tue, 15 Oct 2019 20:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571171925;
 bh=CVrkEqAtBTV/21/+fP22UyqUvunnyeZh3EZI7NFV6D8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=czdl+Kdx28OQLLeP+JC2CIX9jeW/3OtvX8bfnsy6KzZJiBYdesby629b2PQuFjX/b
 fJJmaZMsYD7e3hqkm1bBlNeAU1gEw95FvWWsqEt07EuxNr1B8j2thhVYHNb2lL+Wle
 cAKtVBK0PaCBuffiXlS19gdIaUmHqp/VSfKJ0WwI=
Date: Tue, 15 Oct 2019 13:38:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <bfb3ac7c-19bc-90f0-381b-32a1491a967c@arm.com>
Message-ID: <alpine.DEB.2.21.1910151249160.30080@sstabellini-ThinkPad-T480s>
References: <20191015181802.21957-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910151221270.30080@sstabellini-ThinkPad-T480s>
 <bfb3ac7c-19bc-90f0-381b-32a1491a967c@arm.com>
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

T24gVHVlLCAxNSBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDE1
LzEwLzIwMTkgMjA6MjgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFR1ZSwgMTUg
T2N0IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+PiB2aXJ0X3RvX21hZGRyKCkgaXMgdXNp
bmcgdGhlIGhhcmR3YXJlIHBhZ2UtdGFibGUgd2FsayBpbnN0cnVjdGlvbnMgdG8KPiA+PiB0cmFu
c2xhdGUgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gcGh5c2ljYWwgYWRkcmVzcy4gVGhlIGZ1bmN0aW9u
IHNob3VsZAo+ID4+IG9ubHkgYmUgY2FsbGVkIG9uIHZpcnR1YWwgYWRkcmVzcyBtYXBwZWQuCj4g
Pj4KPiA+PiBfZW5kIHBvaW50cyBwYXN0IHRoZSBlbmQgb2YgWGVuIGJpbmFyeSBhbmQgbWF5IG5v
dCBiZSBtYXBwZWQgd2hlbiB0aGUKPiA+PiBiaW5hcnkgc2l6ZSBpcyBwYWdlLWFsaWduZWQuIFRo
aXMgbWVhbnMgdmlydF90b19tYWRkcigpIHdpbGwgbm90IGJlIGFibGUKPiA+PiB0byBkbyB0aGUg
dHJhbnNsYXRpb24gYW5kIHRoZXJlZm9yZSBjcmFzaCBYZW4uCj4gPj4KPiA+PiBOb3RlIHRoZXJl
IGlzIGFsc28gYW4gb2ZmLWJ5LW9uZSBpc3N1ZSBpbiB0aGlzIGNvZGUsIGJ1dCB0aGUgcGFuaWMg
d2lsbAo+ID4+IHRydW1wIHRoYXQuCj4gPj4KPiA+PiBCb3RoIGlzc3VlcyBjYW4gYmUgZml4ZWQg
YnkgdXNpbmcgX2VuZCAtIDEgaW4gdGhlIGNoZWNrLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiA+Pgo+ID4+IC0tLQo+ID4+Cj4g
Pj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPj4gQ2M6
IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPiA+PiBDYzogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gPj4gQ2M6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+PiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz4KPiA+PiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
Pgo+ID4+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4g
Pj4gQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+ID4+IENjOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgo+ID4+IENjOiBqZ3Jvc3NAc3VzZS5jb20KPiA+Pgo+ID4+IHg4NiBzZWVtcyB0byBiZSBh
ZmZlY3RlZCBieSB0aGUgb2ZmLWJ5LW9uZSBpc3N1ZS4gSmFuLCBBbmRyZXc/Cj4gPj4KPiA+PiBU
aGlzIGNvdWxkIGJlIHJlYWNoZWQgYnkgYSBkb21haW4gdmlhIFhFTl9TWVNDVExfcGFnZV9vZmZs
aW5lX29wLgo+ID4+IEhvd2V2ZXIsIHRoZSBvcGVyYXRpb24gaXMgbm90IHNlY3VyaXR5IHN1cHBv
cnRlZCAoc2VlIFhTQS03NykuIFNvIHdlIGFyZQo+ID4+IGZpbmUgaGVyZS4KPiA+PiAtLS0KPiA+
PiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCB8IDIgKy0KPiA+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+ID4+IGlu
ZGV4IDI2MmQ5MmYxOGQuLjE3NGFjZDg4NTkgMTAwNjQ0Cj4gPj4gLS0tIGEveGVuL2luY2x1ZGUv
YXNtLWFybS9tbS5oCj4gPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCj4gPj4gQEAg
LTE1Myw3ICsxNTMsNyBAQCBleHRlcm4gdW5zaWduZWQgbG9uZyB4ZW5oZWFwX2Jhc2VfcGR4Owo+
ID4+ICAgCj4gPj4gICAjZGVmaW5lIGlzX3hlbl9maXhlZF9tZm4obWZuKSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ID4+ICAgICAgICgobWZuX3RvX21hZGRyKG1mbikgPj0g
dmlydF90b19tYWRkcigmX3N0YXJ0KSkgJiYgICAgICAgICAgIFwKPiA+PiAtICAgICAobWZuX3Rv
X21hZGRyKG1mbikgPD0gdmlydF90b19tYWRkcigmX2VuZCkpKQo+ID4+ICsgICAgIChtZm5fdG9f
bWFkZHIobWZuKSA8PSB2aXJ0X3RvX21hZGRyKF9lbmQgLSAxKSkpCj4gPiAKPiA+IFRoYW5rIHlv
dSBmb3Igc2VuZGluZyB0aGUgcGF0Y2ggYW5kIEkgdGhpbmsgdGhhdCAiX2VuZCAtIDEiIGlzIHRo
ZSByaWdodAo+ID4gZml4LiBJIGFtIGp1c3Qgd29uZGVyaW5nIHdoZXRoZXIgd2Ugd2FudC9uZWVk
IGFuIGV4cGxpY2l0IGNhc3Qgb2Ygc29tZQo+ID4gc29ydCBoZXJlLCBiZWNhdXNlIHRlY2huaWNh
bGx5IF9lbmQgaXMgYSBjaGFyW10gYW5kIDEgaXMgYSBpbnRlZ2VyLgo+ID4gTWF5YmU6Cj4gPiAK
PiA+ICAgICgodmFkZHJfdClfZW5kIC0gMSkKPiA+IAo+ID4gPwo+IAo+IEkgdmFndWVseSByZW1l
bWJlciBhIGxlbmd0aHkgZGlzY3Vzc2lvbiBhYm91dCBpdCBsYXN0IHllYXIuIEJ1dCBJIGRvbid0
IAo+IHRoaW5rIHRoZXJlIHdhcyBhbnkgY29uY2x1c2lvbiBpbiBpdC4KPgo+IEluIHRoaXMgY2Fz
ZSwgd2hhdCBhcmUgeW91IHRyeWluZyB0byBwcmV2ZW50IHdpdGggdGhlIGNhc3Q/IElzIGl0IAo+
IHVuZGVyZmxvdyBvZiBhbiBhcnJheT8gSWYgc28sIGhvdyB0aGUgY2FzdCBpcyBhY3R1YWxseSBn
b2luZyB0byBwcmV2ZW50IAo+IHRoZSBjb21waWxlciB0byBkbyB0aGUgd3JvbmcgdGhpbmc/CgpZ
ZXMsIHRoZXJlIHdhcyBhIGxvbmcgZGlzY3Vzc2lvbiBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSB5
ZWFyOyBpdCB3YXMKYWJvdXQgaG93IHRvIGRlZmluZSBfc3RhcnQgYW5kIF9lbmQgc28gdGhhdCB3
ZSBjb3VsZCBhdm9pZCBjb21waWxlcnMKdW5kZWZpbmVkIGJlaGF2aW9yLiBUaGUgbWFpbiB1bmRl
cmx5aW5nIGlzc3VlIGlzIHRoYXQgY29tcGFyaXNvbnMKYmV0d2VlbiBwb2ludGVycyB0byBkaWZm
ZXJlbnQgb2JqZWN0cyBhcmUgdW5kZWZpbmVkIFsxXSAoX3N0YXJ0IGFuZCBfZW5kCmNhbiBiZSBp
bnRlcnByZXRlZCBhcyBwb2ludGVycyB0byBkaWZmZXJlbnQgb2JqZWN0cykuCgpUaGlzIGNhc2Ug
aXMgYSBiaXQgZGlmZmVyZW50LCBhbmQgZWFzaWVyLiBUaGUgaXNzdWUgaXMgdGhhdCwgYmVjYXVz
ZSB0aGUKcmVzdWx0IG9mICJfZW5kIC0gMSIgaXMgbm90IHdpdGhpbiB0aGUgYm91bmRhcmllcyBv
ZiB0aGUgX2VuZCBhcnJheSwKdGhlbiB0aGUgb3BlcmF0aW9uIGlzICJ1bmRlZmluZWQiIGJ5IHRo
ZSBDIHNwZWNpZmljYXRpb24gKEM5OSA2LjUuNikuClVuZGVmaW5lZCBpcyBub3QgZ29vZC4KClNv
LCBJIGFtIG5vdCByZWFsbHkgYXNraW5nIGZvciBhbnkgY29tcGxleCBmaXgsIG9yIGh5cGVydmlz
b3Itd2lkZQpyZXdvcmsuIEkgYW0gb25seSBhc2tpbmcgdG8gYXZvaWQgaW50cm9kdWNpbmcgbmV3
IHVuZGVmaW5lZCBiZWhhdmlvci4KQ2FzdGluZyB0byB2YWRkcl90IHNob3VsZCBzb2x2ZSBpdCBJ
IHRoaW5rLgoKWzFdIGh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE1NDkwNDcyMjIy
NzMxMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
