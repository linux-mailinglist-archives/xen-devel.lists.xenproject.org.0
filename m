Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DED264A13E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 14:58:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdDeW-0002kx-Ud; Tue, 18 Jun 2019 12:55:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdDeV-0002kq-Re
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 12:55:55 +0000
X-Inumbo-ID: 68227fe5-91c8-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 68227fe5-91c8-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 12:55:54 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 06:55:53 -0600
Message-Id: <5D08DF56020000780023946C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 06:55:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D024E3E0200007800237E03@prv1-mh.provo.novell.com>
 <7a2cfbe7-32d3-4349-66a3-84b4d1ecf6f6@citrix.com>
 <5D08D0D302000078002393C5@prv1-mh.provo.novell.com>
 <bdecb55a-7381-5537-2786-db7bbf2b3eee@citrix.com>
In-Reply-To: <bdecb55a-7381-5537-2786-db7bbf2b3eee@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/9] AMD/IOMMU: use bit field for IRTE
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE4LjA2LjE5IGF0IDE0OjE2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTgvMDYvMjAxOSAxMjo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE4
LjA2LjE5IGF0IDEyOjM3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBP
biAxMy8wNi8yMDE5IDE0OjIzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jCj4+Pj4gKysrIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwo+Pj4+IEBAIC0yMyw2ICsyMywyMyBAQAo+Pj4+
ICAjaW5jbHVkZSA8YXNtL2lvX2FwaWMuaD4KPj4+PiAgI2luY2x1ZGUgPHhlbi9rZXloYW5kbGVy
Lmg+Cj4+Pj4gIAo+Pj4+ICtzdHJ1Y3QgaXJ0ZV9iYXNpYyB7Cj4+PiBJJ2Qgc3VnZ2VzdCBpcnRl
XzMyLCB0byBnbyB3aXRoIGlydGVfMTI4IGluIHRoZSBmb2xsb3dpbmcgcGF0Y2guIAo+Pj4KPj4+
IFRoZSAxMjhiaXQgZm9ybWF0IGlzIGFsc28gdXNlZCBmb3IgcG9zdGVkIGludGVycnVwdHMsIGFu
ZCBpc24ndCBzcGVjaWZpYwo+Pj4gdG8geDJhcGljIHN1cHBvcnQuCj4+IFRoZXJlIGFyZSBzdGls
bCB0d28gZm9ybXMgb2YgMTI4LWJpdCBlbnRyaWVzLCBhbmQgdGhlIGludGVudGlvbiB3aXRoCj4+
IHRoZSBjaG9zZW4gbmFtZXMgd2FzIGZvciB0aGUgb3RoZXIgb25lIHRvIGJlY29tZSBpcnRlX2d1
ZXN0Lgo+IAo+IFRoZXkgYXJlIG5vdCBmb3JtcyBvZiB3aGljaCBjYW4gYmUgZGVsaW5lYXRlZCBi
eSBpcnRlX21vZGUsIGJlY2F1c2UgdGhlCj4gZ3Vlc3RfbW9kZSBzZXR0aW5nIGlzICgvd2lsbCBi
ZSkgcGVyLWRvbWFpbiwgbm90IGdsb2JhbCAod2hpY2ggaXMKPiBuZWNlc3NhcnkgZm9yIHNhbmUg
dGVzdGFiaWxpdHksIGFuZCBmb3IgbmVzdGVkLXZpcnQgc3VwcG9ydCB3aGVyZSB0aGUKPiBndWVz
dCBWTUNCIGNvbnRyb2xzIGFyZW4ndCBzZXQgdXAgYnkgWGVuKS4KClRydWUgYW5kIC4uLgoKPj4+
IEZ1cnRoZXJtb3JlLCBjYWxsaW5nIGl0IGlydGVfZnVsbCBpc24ndCBhIHRlcm0gSSBjYW4gc2Vl
IGluIHRoZSBtYW51YWwsCj4+PiBhbmQgaXMgZmFsbGluZyBpbnRvIHRoZSBuYW1pbmcgdHJhcCB0
aGF0IFVTQiBjdXJyZW50bHkgbGl2ZXMgaW4uCj4+IEV4Y2VwdCB0aGF0IG90aGVyIHRoYW4gZm9y
IFVTQidzIHRyYW5zZmVyIHNwZWVkcyBJIGNhbid0IHJlYWxseSBzZWUKPj4gdGhpcyBnZXR0aW5n
IHdpZGVyIGFuZCB3aWRlci4KPiAKPiBJdCBkb2Vzbid0IG1ha2UgdGhlIG5hbWVzICJiYXNpYyIg
YW5kICJmdWxsIiBhbnkgbW9yZSBkZXNjcmlwdGl2ZS4KCi4uLiBhbHNvIHRydWUsIGJ1dCBpcnRl
XzEyOCBzdGlsbCB3b24ndCBmbHkgd2l0aCB0aGUgb3RoZXIgKGd1ZXN0KSBsYXlvdXQuCgo+Pj4+
IEBAIC0xMDEsNDcgKzExOCw0NCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGFsbG9jX2ludHJlbWFw
X2VudHJ5Cj4+Pj4gICAgICByZXR1cm4gc2xvdDsKPj4+PiAgfQo+Pj4+ICAKPj4+PiAtc3RhdGlj
IHUzMiAqZ2V0X2ludHJlbWFwX2VudHJ5KGludCBzZWcsIGludCBiZGYsIGludCBvZmZzZXQpCj4+
Pj4gK3N0YXRpYyB1bmlvbiBpcnRlX3B0ciBnZXRfaW50cmVtYXBfZW50cnkodW5zaWduZWQgaW50
IHNlZywgdW5zaWduZWQgaW50IGJkZiwKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0KQo+Pj4gQXMgdGhpcyBpcyBjaGFuZ2lu
Zywgcy9vZmZzZXQvZW50cnkvIHRvIGF2b2lkIGFueSBjb25mdXNpb24gd2hlcmUgb2Zmc2V0Cj4+
PiBtaWdodCBiZSBpbiB1bml0cyBvZiBieXRlcy4KPj4gSSBkb24ndCByZWFsbHkgbWluZCAtIEkg
dGhpbmsgYm90aCBuYW1lcyBhcmUgc3VmZmljaWVudGx5IGNsZWFyLCBidXQKPj4gSSdsbCBzd2l0
Y2ggc2luY2UgeW91IHRoaW5rIHRoZSBvdGhlciBuYW1lIGlzIGJldHRlci4KPiAKPiBMb29raW5n
IHRocm91Z2ggdGhlIG90aGVyIGNvZGUsIGlkeCBvciBpbmRleCB3b3VsZCBhbHNvIGRvIGZpbmUs
IGJ1dCBJCj4gdGhpbmsgYWxsIG9mIHRoZXNlIGFyZSBjbGVhcmVyIHRoYW4gdXNpbmcgb2Zmc2V0
LgoKImluZGV4IiBpdCBpcyB0aGVuLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
