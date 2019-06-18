Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B54D49FE5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 13:56:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdCgd-0004sG-Ik; Tue, 18 Jun 2019 11:54:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdCgc-0004sA-NA
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 11:54:02 +0000
X-Inumbo-ID: c3793744-91bf-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c3793744-91bf-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 11:54:01 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 05:54:01 -0600
Message-Id: <5D08D0D302000078002393C5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 05:53:55 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D024E3E0200007800237E03@prv1-mh.provo.novell.com>
 <7a2cfbe7-32d3-4349-66a3-84b4d1ecf6f6@citrix.com>
In-Reply-To: <7a2cfbe7-32d3-4349-66a3-84b4d1ecf6f6@citrix.com>
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

Pj4+IE9uIDE4LjA2LjE5IGF0IDEyOjM3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDYvMjAxOSAxNDoyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEF0IHRoZSBz
YW1lIHRpbWUgcmVzdHJpY3QgaXRzIHNjb3BlIHRvIGp1c3QgdGhlIHNpbmdsZSBzb3VyY2UgZmls
ZQo+PiBhY3R1YWxseSB1c2luZyBpdCwgYW5kIGFic3RyYWN0IGFjY2Vzc2VzIGJ5IGludHJvZHVj
aW5nIGEgdW5pb24gb2YKPj4gcG9pbnRlcnMuIChBIHVuaW9uIG9mIHRoZSBhY3R1YWwgdGFibGUg
ZW50cmllcyBpcyBub3QgdXNlZCB0byBtYWtlIGl0Cj4+IGltcG9zc2libGUgdG8gW3dyb25nbHks
IG9uY2UgdGhlIDEyOC1iaXQgZm9ybSBnZXRzIGFkZGVkXSBwZXJmb3JtCj4+IHBvaW50ZXIgYXJp
dGhtZXRpYyAvIGFycmF5IGFjY2Vzc2VzIG9uIGRlcml2ZWQgdHlwZXMuKQo+Pgo+PiBBbHNvIG1v
dmUgYXdheSBmcm9tIHVwZGF0aW5nIHRoZSBlbnRyaWVzIHBpZWNlbWVhbDogQ29uc3RydWN0IGEg
ZnVsbCBuZXcKPj4gZW50cnksIGFuZCB3cml0ZSBpdCBvdXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gLS0tCj4+IEl0IHdvdWxkIGhhdmUg
YmVlbiBuaWNlIHRvIHVzZSB3cml0ZV9hdG9taWMoKSBvciBBQ0NFU1NfT05DRSgpIGZvciB0aGUK
Pj4gYWN0dWFsIHdyaXRlcywgYnV0IGJvdGggY2FzdCB0aGUgdmFsdWUgdG8gYSBzY2FsYXIgb25l
LCB3aGljaCBkb2Vzbid0Cj4+IHN1aXQgdXMgaGVyZSAoYW5kIEkgYWxzbyBkaWRuJ3Qgd2FudCB0
byBtYWtlIHRoZSBjb21wb3VuZCB0eXBlIGEgdW5pb24KPj4gd2l0aCBhIHJhdyBtZW1iZXIganVz
dCBmb3IgdGhpcykuCj4+Cj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21t
dV9pbnRyLmMKPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIu
Ywo+PiBAQCAtMjMsNiArMjMsMjMgQEAKPj4gICNpbmNsdWRlIDxhc20vaW9fYXBpYy5oPgo+PiAg
I2luY2x1ZGUgPHhlbi9rZXloYW5kbGVyLmg+Cj4+ICAKPj4gK3N0cnVjdCBpcnRlX2Jhc2ljIHsK
PiAKPiBJJ2Qgc3VnZ2VzdCBpcnRlXzMyLCB0byBnbyB3aXRoIGlydGVfMTI4IGluIHRoZSBmb2xs
b3dpbmcgcGF0Y2guIAo+IAo+IFRoZSAxMjhiaXQgZm9ybWF0IGlzIGFsc28gdXNlZCBmb3IgcG9z
dGVkIGludGVycnVwdHMsIGFuZCBpc24ndCBzcGVjaWZpYwo+IHRvIHgyYXBpYyBzdXBwb3J0LgoK
VGhlcmUgYXJlIHN0aWxsIHR3byBmb3JtcyBvZiAxMjgtYml0IGVudHJpZXMsIGFuZCB0aGUgaW50
ZW50aW9uIHdpdGgKdGhlIGNob3NlbiBuYW1lcyB3YXMgZm9yIHRoZSBvdGhlciBvbmUgdG8gYmVj
b21lIGlydGVfZ3Vlc3QuCgo+IEZ1cnRoZXJtb3JlLCBjYWxsaW5nIGl0IGlydGVfZnVsbCBpc24n
dCBhIHRlcm0gSSBjYW4gc2VlIGluIHRoZSBtYW51YWwsCj4gYW5kIGlzIGZhbGxpbmcgaW50byB0
aGUgbmFtaW5nIHRyYXAgdGhhdCBVU0IgY3VycmVudGx5IGxpdmVzIGluLgoKRXhjZXB0IHRoYXQg
b3RoZXIgdGhhbiBmb3IgVVNCJ3MgdHJhbnNmZXIgc3BlZWRzIEkgY2FuJ3QgcmVhbGx5IHNlZQp0
aGlzIGdldHRpbmcgd2lkZXIgYW5kIHdpZGVyLgoKPj4gQEAgLTEwMSw0NyArMTE4LDQ0IEBAIHN0
YXRpYyB1bnNpZ25lZCBpbnQgYWxsb2NfaW50cmVtYXBfZW50cnkKPj4gICAgICByZXR1cm4gc2xv
dDsKPj4gIH0KPj4gIAo+PiAtc3RhdGljIHUzMiAqZ2V0X2ludHJlbWFwX2VudHJ5KGludCBzZWcs
IGludCBiZGYsIGludCBvZmZzZXQpCj4+ICtzdGF0aWMgdW5pb24gaXJ0ZV9wdHIgZ2V0X2ludHJl
bWFwX2VudHJ5KHVuc2lnbmVkIGludCBzZWcsIHVuc2lnbmVkIGludCBiZGYsCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBvZmZzZXQpCj4g
Cj4gQXMgdGhpcyBpcyBjaGFuZ2luZywgcy9vZmZzZXQvZW50cnkvIHRvIGF2b2lkIGFueSBjb25m
dXNpb24gd2hlcmUgb2Zmc2V0Cj4gbWlnaHQgYmUgaW4gdW5pdHMgb2YgYnl0ZXMuCgpJIGRvbid0
IHJlYWxseSBtaW5kIC0gSSB0aGluayBib3RoIG5hbWVzIGFyZSBzdWZmaWNpZW50bHkgY2xlYXIs
IGJ1dApJJ2xsIHN3aXRjaCBzaW5jZSB5b3UgdGhpbmsgdGhlIG90aGVyIG5hbWUgaXMgYmV0dGVy
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
