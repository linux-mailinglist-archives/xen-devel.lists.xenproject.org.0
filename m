Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E953775D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 17:04:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYtt8-0001Lz-Ef; Thu, 06 Jun 2019 15:01:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYtt6-0001Lh-Oy
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 15:01:08 +0000
X-Inumbo-ID: e9412f0b-886b-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e9412f0b-886b-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 15:01:07 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 09:01:06 -0600
Message-Id: <5CF92AAD0200007800235FE2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 09:01:01 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1559832777-7818-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1559832777-7818-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/pv: Fix undefined behaviour in
 check_descriptor()
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA2LjE5IGF0IDE2OjUyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVUJTQU4gcmVwb3J0czoKPiAKPiAgIChYRU4pIAo+ID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Cj4gPT09Cj4gICAoWEVOKSBVQlNBTjogVW5kZWZpbmVkIGJlaGF2aW91ciBpbiB4ODZfNjQvbW0u
YzoxMTA4OjMxCj4gICAoWEVOKSBsZWZ0IHNoaWZ0IG9mIDI1NSBieSAyNCBwbGFjZXMgY2Fubm90
IGJlIHJlcHJlc2VudGVkIGluIHR5cGUgJ2ludCcKPiAgIChYRU4pIC0tLS1bIFhlbi00LjEzLXVu
c3RhYmxlICB4ODZfNjQgIGRlYnVnPXkgICBUYWludGVkOiAgICBIIF0tLS0tCj4gICAoWEVOKSBD
UFU6ICAgIDYwCj4gICAoWEVOKSBSSVA6ICAgIGUwMDg6WzxmZmZmODJkMDgwMmE1NGNlPl0gdWJz
YW4uYyN1YnNhbl9lcGlsb2d1ZSsweGEvMHhjMgo+ICAgPHNuaXA+Cj4gICAoWEVOKSBYZW4gY2Fs
bCB0cmFjZToKPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDJhNTRjZT5dIHVic2FuLmMjdWJzYW5f
ZXBpbG9ndWUrMHhhLzB4YzIKPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDJhNjAwOT5dIF9fdWJz
YW5faGFuZGxlX3NoaWZ0X291dF9vZl9ib3VuZHMrMHgxNWQvMHgxNmMKPiAgIChYRU4pICAgIFs8
ZmZmZjgyZDA4MDMzYWJkNz5dIGNoZWNrX2Rlc2NyaXB0b3IrMHgxOTEvMHgzZGQKPiAgIChYRU4p
ICAgIFs8ZmZmZjgyZDA4MDRlZjkyMD5dIGRvX3VwZGF0ZV9kZXNjcmlwdG9yKzB4N2YvMHgyYjYK
PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDRlZmI3NT5dIGNvbXBhdF91cGRhdGVfZGVzY3JpcHRv
cisweDFlLzB4MjAKPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDRmYTFjYz5dIHB2X2h5cGVyY2Fs
bCsweDg3Zi8weGE2Zgo+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwNTAxYWNiPl0gZG9fZW50cnlf
aW50ODIrMHg1My8weDU4Cj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODA1MDcwMmI+XSBlbnRyeV9p
bnQ4MisweGJiLzB4YzAKPiAgIChYRU4pCj4gICAoWEVOKSAKPiA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQo+ID09PQo+IAo+IFN3aXRjaCB0byBhbiB1bnNpZ25lZCBzaGlmdC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94
ODZfNjQvbW0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwo+IEBAIC0xMTA1LDcg
KzExMDUsNyBAQCBpbnQgY2hlY2tfZGVzY3JpcHRvcihjb25zdCBzdHJ1Y3QgZG9tYWluICpkb20s
IHNlZ19kZXNjX3QgKmQpCj4gICAgICAgICAgICAgICAqIDB4ZjY4MDAwMDAuIEV4dGVuZCB0aGVz
ZSB0byBhbGxvdyBhY2Nlc3MgdG8gdGhlIGxhcmdlciByZWFkLW9ubHkKPiAgICAgICAgICAgICAg
ICogTTJQIHRhYmxlIGF2YWlsYWJsZSBpbiAzMm9uNjQgbW9kZS4KPiAgICAgICAgICAgICAgICov
Cj4gLSAgICAgICAgICAgIGJhc2UgPSAoYiAmICgweGZmIDw8IDI0KSkgfCAoKGIgJiAweGZmKSA8
PCAxNikgfCAoYSA+PiAxNik7Cj4gKyAgICAgICAgICAgIGJhc2UgPSAoYiAmICgweGZmdSA8PCAy
NCkpIHwgKChiICYgMHhmZikgPDwgMTYpIHwgKGEgPj4gMTYpOwo+ICAKPiAgICAgICAgICAgICAg
bGltaXQgPSAoYiAmIDB4ZjAwMDApIHwgKGEgJiAweGZmZmYpOwoKU2VlaW5nIHRoaXMgdGhlIG90
aGVyIG9uZSBjb3VsZCBhcyB3ZWxsIHVzZSAoYiAmIDB4ZmYwMDAwMDApLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
