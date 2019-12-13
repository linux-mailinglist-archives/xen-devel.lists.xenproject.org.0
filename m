Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5925211E244
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 11:46:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifiQT-0007Fa-M1; Fri, 13 Dec 2019 10:44:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifiQS-0007FV-St
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 10:44:00 +0000
X-Inumbo-ID: 780b19d8-1d95-11ea-8ed5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 780b19d8-1d95-11ea-8ed5-12813bfff9fa;
 Fri, 13 Dec 2019 10:43:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6AAA6B08C;
 Fri, 13 Dec 2019 10:43:58 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191212173203.1692762-1-george.dunlap@citrix.com>
 <20191212173203.1692762-3-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a5fd3532-8a70-506e-3b56-ab3506132dbe@suse.com>
Date: Fri, 13 Dec 2019 11:44:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191212173203.1692762-3-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] x86/mm: Implement common put_data_pages
 for put_page_from_l[23]e
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMjAxOSAxODozMiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBCb3RoIHB1dF9wYWdl
X2Zyb21fbDJlIGFuZCBwdXRfcGFnZV9mcm9tX2wzZSBoYW5kbGUgaGF2aW5nIHN1cGVycGFnZQo+
IGVudHJpZXMgYnkgbG9vcGluZyBvdmVyIGVhY2ggcGFnZSBhbmQgInB1dCItaW5nIGVhY2ggb25l
IGluZGl2aWR1YWxseS4KPiBBcyB3aXRoIHB1dHRpbmcgcGFnZSB0YWJsZSBlbnRyaWVzLCB0aGlz
IGNvZGUgaXMgZnVuY3Rpb25hbGx5Cj4gaWRlbnRpY2FsLCBidXQgZm9yIHNvbWUgcmVhc29uIGRp
ZmZlcmVudC4gIE1vcmVvdmVyLCB0aGVyZSBpcyBhbHJlYWR5Cj4gYSBjb21tb24gZnVuY3Rpb24s
IHB1dF9kYXRhX3BhZ2UoKSwgdG8gaGFuZGxlIGF1dG9tYXRpY2FsbHkgc3dhcHBpbmcKPiBiZXR3
ZWVuIHB1dF9wYWdlKCkgKGZvciByZWFkLW9ubHkgcGFnZXMpIG9yIHB1dF9wYWdlX2FuZF90eXBl
KCkgKGZvcgo+IHJlYWQtd3JpdGUgcGFnZXMpLgo+IAo+IFJlcGxhY2UgdGhpcyB3aXRoIHB1dF9k
YXRhX3BhZ2VzKCkgKHBsdXJhbCksIHdoaWNoIGRvZXMgdGhlIGVudGlyZQo+IGxvb3AsIGFzIHdl
bGwgYXMgdGhlIHB1dF9wYWdlIC8gcHV0X3BhZ2VfYW5kX3R5cGUgc3dpdGNoLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiAtLS0K
PiBOQiB0aGF0IEkndmUgdXNlZCB0aGUgInNpbXBsZSBmb3IgbG9vcCIgdmVyc2lvbiB0byBtYWtl
IGl0IGVhc3kgdG8gc2VlCj4gd2hhdCdzIGdvaW5nIG9uLCByYXRoZXIgdGhhbiB0aGUgImRvIHsg
fSB3aGlsZSgpIiB2ZXJzaW9uIHdoaWNoIHVzZXMgJgo+IGFuZCBjb21wYXJlIHRvIHplcm8gcmF0
aGVyIHRoYW4gY29tcGFyaW5nIHRvIHRoZSBtYXguCj4gCj4gQ0M6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L21tLmMgfCA1MiArKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9t
bS5jIGIveGVuL2FyY2gveDg2L21tLmMKPiBpbmRleCBkOGEwZWIyYWE1Li5jMDUwMzlhYjIxIDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMK
PiBAQCAtMTI4OSwxNCArMTI4OSw2IEBAIHZvaWQgcHV0X3BhZ2VfZnJvbV9sMWUobDFfcGdlbnRy
eV90IGwxZSwgc3RydWN0IGRvbWFpbiAqbDFlX293bmVyKQo+ICB9Cj4gIAo+ICAjaWZkZWYgQ09O
RklHX1BWCj4gLXN0YXRpYyB2b2lkIHB1dF9kYXRhX3BhZ2Uoc3RydWN0IHBhZ2VfaW5mbyAqcGFn
ZSwgYm9vbCB3cml0ZWFibGUpCj4gLXsKPiAtICAgIGlmICggd3JpdGVhYmxlICkKPiAtICAgICAg
ICBwdXRfcGFnZV9hbmRfdHlwZShwYWdlKTsKPiAtICAgIGVsc2UKPiAtICAgICAgICBwdXRfcGFn
ZShwYWdlKTsKPiAtfQo+IC0KPiAgc3RhdGljIGludCBwdXRfcHRfcGFnZShzdHJ1Y3QgcGFnZV9p
bmZvICpwZywgc3RydWN0IHBhZ2VfaW5mbyAqcHRwZywKPiAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4gIHsKPiBAQCAtMTMxOSw2ICsxMzExLDIwIEBAIHN0YXRp
YyBpbnQgcHV0X3B0X3BhZ2Uoc3RydWN0IHBhZ2VfaW5mbyAqcGcsIHN0cnVjdCBwYWdlX2luZm8g
KnB0cGcsCj4gICAgICByZXR1cm4gcmM7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgcHV0X2RhdGFf
cGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwgYm9vbCB3cml0ZWFibGUsIGludCBwdF9zaGlm
dCkKPiArewo+ICsgICAgaW50IGksIGNvdW50ID0gMSA8PCAocHRfc2hpZnQgLSBQQUdFX1NISUZU
KTsKCldpdGggYm90aCAiaW50IiBoZXJlIGNoYW5nZWQgdG8gInVuc2lnbmVkIGludCIKUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQnV0IG9mIGNvdXJzZSBBbmRy
ZXcncyBvYmplY3Rpb24gbmVlZHMgYWRkcmVzc2luZyBvbmUgd2F5IG9yIGFub3RoZXIuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
