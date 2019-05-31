Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D30311DE
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 18:02:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWjwU-0005os-OD; Fri, 31 May 2019 15:59:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWjwS-0005on-G0
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 15:59:40 +0000
X-Inumbo-ID: 169b1602-83bd-11e9-86f3-3f73e47780e1
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 169b1602-83bd-11e9-86f3-3f73e47780e1;
 Fri, 31 May 2019 15:59:37 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 31 May 2019 09:59:35 -0600
Message-Id: <5CF14F650200007800234123@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 31 May 2019 09:59:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5460200007800233DA8@prv1-mh.provo.novell.com>
 <a30a6fc9-5c3c-081b-d268-231e89f135be@citrix.com>
In-Reply-To: <a30a6fc9-5c3c-081b-d268-231e89f135be@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/2] adjust special domain creation (and
 call it earlier on x86)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMxLjA1LjE5IGF0IDE3OjMyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzEvMDUvMjAxOSAwMjozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC01MTYs
NiArNTIxLDM2IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUoZG9taWRfdCBkb20KPj4g
ICAgICByZXR1cm4gRVJSX1BUUihlcnIpOwo+PiAgfQo+PiAgCj4+ICt2b2lkIF9faW5pdCBzZXR1
cF9zcGVjaWFsX2RvbWFpbnModm9pZCkKPj4gK3sKPj4gKyAgICAvKgo+PiArICAgICAqIEluaXRp
YWxpc2Ugb3VyIERPTUlEX1hFTiBkb21haW4uCj4+ICsgICAgICogQW55IFhlbi1oZWFwIHBhZ2Vz
IHRoYXQgd2Ugd2lsbCBhbGxvdyB0byBiZSBtYXBwZWQgd2lsbCBoYXZlCj4+ICsgICAgICogdGhl
aXIgZG9tYWluIGZpZWxkIHNldCB0byBkb21feGVuLgo+PiArICAgICAqIEhpZGRlbiBQQ0kgZGV2
aWNlcyB3aWxsIGFsc28gYmUgYXNzb2NpYXRlZCB3aXRoIHRoaXMgZG9tYWluCj4+ICsgICAgICog
KGJ1dCBiZSBbcGFydGx5XSBjb250cm9sbGVkIGJ5IERvbTAgbmV2ZXJ0aGVsZXNzKS4KPj4gKyAg
ICAgKi8KPj4gKyAgICBkb21feGVuID0gZG9tYWluX2NyZWF0ZShET01JRF9YRU4sIE5VTEwsIGZh
bHNlKTsKPj4gKyAgICBCVUdfT04oSVNfRVJSKGRvbV94ZW4pKTsKPiAKPiBJIGtub3cgdGhpcyBp
cyBjb3B5aW5nIGNvZGUgbGlrZS1mb3ItbGlrZSwgYnV0IHRoaXMgZXJyb3IgaGFuZGxpbmcgaXMK
PiB0ZXJyaWJsZSBpbiBwcmFjdGljZS4KPiAKPiBFdmVuIGp1c3Q6Cj4gCj4gaWYgKCBJU19FUlIo
ZG9tX3hlbikgKQo+ICAgICBwYW5pYygiRmFpbGVkIHRvIGNyZWF0ZSBkb21feGVuOiAlZFxuIiwg
UFRSX0VSUihkb21feGVuKSk7Cj4gCj4gd291bGQgYmUgYW4gaW1wcm92ZW1lbnQuCgpJJ2xsIGJl
IGhhcHB5IHRvIGRvIHRoaXM7IEkgZGlkbid0IGp1c3QgYmVjYXVzZSBpdCBkb2Vzbid0IHJlYWxs
eSBiZWxvbmcKaGVyZS4KCj4+ICsjaWZkZWYgQ09ORklHX0hBU19QQ0kKPj4gKyAgICBJTklUX0xJ
U1RfSEVBRCgmZG9tX3hlbi0+YXJjaC5wZGV2X2xpc3QpOwo+PiArI2VuZGlmCj4gCj4gVGhlIHBv
c2l0aW9uIG9mIHRoaXMgaWRlbnRpZmllcyB0aGF0IHdlJ3ZlIGdvdCBvYnZpb3VzbHkgZ290IGJ1
Z3MKPiAocGVyaGFwcyBsYXRlbnQpIGVsc2V3aGVyZSwgc2VlaW5nIGFzIG90aGVyIHNwZWNpYWwg
ZG9tYWlucyBkb24ndCBnZXQKPiB3b3JraW5nIGNvbnN0cnVjdHMgc3VjaCBhcyBsaXN0X2VtcHR5
KCkuCj4gCj4gSW4gdGhlIGNvZGUgd2hpY2ggY3VycmVudGx5IGV4aXN0cywgSSBjYW4ndCBzcG90
IGl0IGV2ZXIgYmVpbmcgdG91Y2hlZAo+IGZvciBBUk0sIGJ1dCBpdCBpcyBjb25zdHJ1Y3RlZCBm
b3IgYWxsIG5vbi1zcGVjaWFsIHg4NiBndWVzdHMgYXQgdGhlIHRvcAo+IG9mIGFyY2hfZG9tYWlu
X2NyZWF0ZSgpLgo+IAo+IEkgdGhpbmsgdGhlIGJlc3Qgb3B0aW9uLCBnaXZlbiB0aGUgI2lmZGVm
IGhlcmUsIGlzIHRvIHJlcG9zaXRpb24gdGhlCj4gcGRldiBmaWVsZHMgaW50byBzdHJ1Y3QgZG9t
YWluLCByYXRoZXIgdGhhbiBhcmNoX2RvbWFpbiwgYW5kIGhhdmUgdGhpcwo+IGNvZGUgZnJhZ21l
bnQgbmVhciB0aGUgdG9wIG9mIGRvbWFpbl9jcmVhdGUoKSB3aGVyZSBzcGVjaWFsIGRvbWFpbnMg
d2lsbAo+IGFsbCBiZSBjb3ZlcmVkLgoKRXhjZXB0IHRoYXQgaWYgSSBkbyB0aGlzLCB0aGVuIG5v
dCBieSBzcGVjaWFsIGNhc2luZyBzcGVjaWFsIGRvbWFpbnMuCiJOb3JtYWwiIGRvbWFpbnMgd2Fu
dCB0aGlzIHRvbyAtIHRoZSBpbml0aWFsaXphdGlvbiBjb3VsZCB0aGVuIGJlCmRyb3BwZWQgKG1v
dmVkIHRoZXJlKSBmcm9tIHg4Ni1zcGVjaWZpYyBjb2RlLiBCdXQgdGhpcyB3aWxsIHdhbnQgdG8K
YmUgYSBzZXBhcmF0ZSBwYXRjaCB0aGVuLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
