Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4619A6BA0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 16:36:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i59qb-0000mj-5D; Tue, 03 Sep 2019 14:31:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i59qZ-0000me-AN
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 14:31:51 +0000
X-Inumbo-ID: 902b8530-ce57-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 902b8530-ce57-11e9-b76c-bc764e2007e4;
 Tue, 03 Sep 2019 14:31:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 458D7AE49;
 Tue,  3 Sep 2019 14:31:48 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-2-jgross@suse.com>
 <6ece6c17-362b-f2ec-eedd-6b2a57dc7d56@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <ec7e18d1-6041-3476-1509-6c150eb6f87a@suse.com>
Date: Tue, 3 Sep 2019 16:31:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6ece6c17-362b-f2ec-eedd-6b2a57dc7d56@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 1/5] xen/spinlocks: in debug builds store
 cpu holding the lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMTkgMTY6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI5LjA4LjIwMTkgMTI6
MTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zcGlubG9j
ay5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oCj4+IEBAIC02LDE0ICs2LDIx
IEBACj4+ICAgI2luY2x1ZGUgPGFzbS90eXBlcy5oPgo+PiAgIAo+PiAgICNpZm5kZWYgTkRFQlVH
Cj4+IC1zdHJ1Y3QgbG9ja19kZWJ1ZyB7Cj4+IC0gICAgczE2IGlycV9zYWZlOyAvKiArMTogSVJR
LXNhZmU7IDA6IG5vdCBJUlEtc2FmZTsgLTE6IGRvbid0IGtub3cgeWV0ICovCj4+ICt1bmlvbiBs
b2NrX2RlYnVnIHsKPj4gKyAgICB1aW50MTZfdCB2YWw7Cj4+ICsjZGVmaW5lIExPQ0tfREVCVUdf
SU5JVFZBTCAweGZmZmYKPj4gKyAgICBzdHJ1Y3Qgewo+PiArICAgICAgICB1aW50MTZfdCBjcHU6
MTI7Cj4gCj4gSSdtIGFmcmFpZCBJIGhhdmUgb25lIG1vcmUgcmVxdWVzdDogVGhlIGxpdGVyYWwg
MTIgaW4gc3RydWN0IHNwaW5sb2NrIGlzCj4gc2l0dGluZyByaWdodCBuZXh0IHRvIHRoZSBTUElO
TE9DS19OT19DUFUgZGVmaW5pdGlvbiwgbWFraW5nIGl0IHByZXR0eQo+IHVubGlrZWx5IHRoYXQg
Ym90aCBhdXRob3IgYW5kIHJldmlld2VyIG9mIGEgY2hhbmdlIHdvdWxkbid0IG5vdGljZSBvbmUK
PiBnZXR0aW5nIGNoYW5nZWQgd2l0aG91dCBhZGp1c3RtZW50IHRvIHRoZSBvdGhlci4gVGhlIGxp
dGVyYWwgMTIgaGVyZSwKPiB0aG91Z2gsIGlzIHN1ZmZpY2llbnRseSByZW1vdGUgdG8gdGhhdCBv
dGhlciBwbGFjZSwgc28gdGhlcmUgbmVlZHMgdG8gYmUKPiBhIGNvbm5lY3Rpb24gZXN0YWJsaXNo
ZWQuIEJlc3QgSSBjYW4gdGhpbmsgb2YgcmlnaHQgYXdheSBpcyB0byBoYXZlIGEKPiAjZGVmaW5l
IGZvciB0aGUgMTIsIG1vdmUgU1BJTkxPQ0tfTk9fQ1BVJ3MgZGVmaW5pdGlvbiBuZXh0IHRvIGl0
LCBhbmQKPiB1c2UgdGhlIG5ldyBjb25zdGFudCBpbiBib3RoIHBsYWNlcy4KCkNhbiBkby4KCj4g
Cj4+ICsgICAgICAgIHVpbnQxNl90IHBhZDoyOwo+IAo+IFdoaWxlIGF0IGl0LCB3b3VsZCB5b3Ug
bWluZCBtYWtpbmcgdGhpcyBhbiB1bm5hbWVkIGZpZWxkPwoKTlAuIEkgZ3Vlc3MgdGhlICIyIiBz
aG91bGQgdGhlbiBiZSByZXBsYWNlZCB0byBkZXBlbmQgb24gdGhlIGFkZGVkCiNkZWZpbmUgYWJv
dmUuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
