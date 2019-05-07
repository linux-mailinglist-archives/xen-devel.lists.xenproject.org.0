Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA1216039
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 11:13:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNw74-0006Uz-0C; Tue, 07 May 2019 09:10:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNw72-0006Uu-Ex
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 09:10:12 +0000
X-Inumbo-ID: ea6413ad-70a7-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ea6413ad-70a7-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 09:10:11 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 03:10:10 -0600
Message-Id: <5CD14B6E020000780022C646@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 03:10:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Marek Marczykowski" <marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
 <7c7a7dcc-ff17-feb7-1e88-96c31b0e72a7@suse.com>
 <20190506153211.GV1502@mail-itl>
In-Reply-To: <20190506153211.GV1502@mail-itl>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/5] xen: fix handling framebuffer located
 above 4GB
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA1LjE5IGF0IDE3OjMyLCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gT24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDU6MTU6MTlQTSArMDIwMCwgSnVl
cmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMDYvMDUvMjAxOSAxNjo1MCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+PiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMv
eGVuLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgKPj4gPiBpbmRleCBjY2RmZmMwLi5iMGYw
ZjdlIDEwMDY0NAo+PiA+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaAo+PiA+ICsrKyBi
L3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaAo+PiA+IEBAIC05MjMsNiArOTIzLDggQEAgdHlwZWRl
ZiBzdHJ1Y3QgZG9tMF92Z2FfY29uc29sZV9pbmZvIHsKPj4gPiAgICAgICAgICAgICAgLyogTW9k
ZSBhdHRyaWJ1dGVzIChvZmZzZXQgMHgwLCBWRVNBIGNvbW1hbmQgMHg0ZjAxKS4gKi8KPj4gPiAg
ICAgICAgICAgICAgdWludDE2X3QgbW9kZV9hdHRyczsKPj4gPiAgI2VuZGlmCj4+ID4gKyAgICAg
ICAgICAgIC8qIGhpZ2ggMzIgYml0cyBvZiBsZmJfYmFzZSAqLwo+PiA+ICsgICAgICAgICAgICB1
aW50MzJfdCBleHRfbGZiX2Jhc2U7Cj4+IAo+PiBZb3Ugd2lsbCBuZWVkIHRvIHB1dCB0aGlzIGFk
ZGl0aW9uIGludG8gYW46Cj4+IAo+PiAjaWYgX19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXyA+PSAw
eDAwMDQwZDAwCj4+IC4uLgo+PiAjZW5kaWYKPj4gCj4+IHNlY3Rpb24gKG9ubHkgYXZhaWxhYmxl
IGZyb20gWGVuIDQuMTMgb253YXJkcykuCj4gCj4gV2h5IGV4YWN0bHk/IEkgZG9uJ3Qgc2VlIHRo
aXMgc3RydWN0dXJlIHVzZWQgaW4gYW55IGh5cGVyY2FsbCBhcmd1bWVudC4KPiBUaGUgb25seSBl
eHRlcm5hbGx5IGFjY2Vzc2libGUgcGxhY2UgaXMgc3RhcnRfaW5mbyBzdHJ1Y3R1cmUsIHdoZXJl
IGl0Cj4gaGFzIGV4cGxpY2l0IHN0cnVjdCBzaXplIGFscmVhZHkuCgpJbiBhZGRpdGlvbiB0byBK
w7xyZ2VuJ3MgcmVwbHk6IFdoaWxlIHRoZSBzdHJ1Y3R1cmUgaXNuJ3QgbWVhbnQgdG8KYmUgdXNl
ZCB0aGF0IHdheSwgYW55IGNvbnN1bWVyIG9mIHRoZSBYZW4gaGVhZGVycyBjb3VsZCBpbgpwcmlu
Y2lwbGUgY3JlYXRlIGluc3RhbmNlcyBvZiBpdCAocmF0aGVyIHRoYW4ganVzdCB1c2luZyBwb2lu
dGVycwp0byB0aGUgWGVuLXByb3ZpZGVkIGluc3RhbmNlKSwgYW5kIHdpdGhvdXQgdGhlIGNvbnN1
bWluZyBjb2RlCnNpZ25hbGluZyBpdHMgYXdhcmVuZXNzIHN1Y2ggc3RydWN0dXJlIHNpemVzIG1h
eSBub3QgY2hhbmdlLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
