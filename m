Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3FD132474
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 12:05:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iomdm-00076Y-8X; Tue, 07 Jan 2020 11:03:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tA6r=24=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iomdl-00076T-2t
 for xen-devel@lists.xen.org; Tue, 07 Jan 2020 11:03:13 +0000
X-Inumbo-ID: 46abb4a4-313d-11ea-bf56-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46abb4a4-313d-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 11:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578394984;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wiabzqVjd+dat8xQuGir1saWgotcS+sl2VFld7ZM0Nw=;
 b=hc9OHoRrBRB9wbnHH7pfqtsvMUzlR3ruH+XAOMNkSX7t1uhVzlbHXMKZ
 szSwADsDIQxv/gpHpRl0rz3ZIH57oYLqmvCJLzBgq3AIPM3aqTHwbE9R1
 9pajzsBjrDhigG+4GFE79br/kk5iAir4z6vZAI8Gria5QVSmsZcPwxw0C w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ycTku720NeZzItyWKOFlBMHaRMPWvW0lenQSDzjcCjhB/2DyynXLbCGPZSL3iTxIzDq3OXQrLS
 4T3VNbf27CuFEHCYi9NKxyCzzohiNYdmvESZdlbwmKQakNt0MKHpZE6EJS826PwOsx7mueLACt
 JO1fqnTjQ+haPZda55ylgtKIt/e/UdE0IgtJmyZYFu6wWuAxpQAHnv1xkh7DmmXhJrOEzO2H7G
 fe62n85BUlbewGHUsKjUxHNe9dRyCQWIOi77Vrp24SXv21Y7lfzkuF5A5K7Vk9qupVEk/pcO0R
 C3s=
X-SBRS: 2.7
X-MesageID: 10557511
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,405,1571716800"; d="scan'208";a="10557511"
To: Jan Beulich <jbeulich@suse.com>
References: <20191217154625.31561-1-sergey.dyasli@citrix.com>
 <a5e3c4b7-40f4-017b-1154-d75f92075597@suse.com>
 <65aecab1-a1b0-f02e-be92-cda3cd37b9e5@citrix.com>
 <e997ff3e-4260-c872-0166-3885ce1a4ee1@suse.com>
 <2e8bc256-6e7f-ff3d-0917-c744a92cc6ac@citrix.com>
 <d41c1d28-d582-089a-3c8e-9e7d65edc201@citrix.com>
 <16a4056b-c74a-4fdf-499f-755120edf2d5@citrix.com>
 <8593adbb-cc67-fca1-30e6-555fa9adcb86@suse.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <54d496c3-7a93-af37-d152-1dc31367e1f7@citrix.com>
Date: Tue, 7 Jan 2020 11:02:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <8593adbb-cc67-fca1-30e6-555fa9adcb86@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDEvMjAyMCAxNDo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDYuMDEuMjAyMCAx
NTozNSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gT24gMDYvMDEvMjAyMCAxMToyOCwgR2Vvcmdl
IER1bmxhcCB3cm90ZToKPj4+IE9uIDEyLzE5LzE5IDExOjE1IFBNLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOgo+Pj4+IE9uIDE5LzEyLzIwMTkgMTE6MzUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+
PiAgICAgWEVOVkVSX2NoYW5nZXNldAo+Pj4+Pj4+PiAgICAgWEVOVkVSX2NvbW1hbmRsaW5lCj4+
Pj4+Pj4+ICAgICBYRU5WRVJfYnVpbGRfaWQKPj4+Pj4+Pj4KPj4+Pj4+Pj4gUmV0dXJuIGEgbW9y
ZSBjdXN0b21lciBmcmllbmRseSBlbXB0eSBzdHJpbmcgaW5zdGVhZCBvZiAiPGRlbmllZD4iCj4+
Pj4+Pj4+IHdoaWNoIHdvdWxkIGJlIHNob3duIGluIHRvb2xzIGxpa2UgZG1pZGVjb2RlLj4KPj4+
Pj4+PiBJIHRoaW5rICI8ZGVuaWVkPiIgaXMgcXVpdGUgZmluZSBmb3IgbWFueSBvZiB0aGUgb3Jp
Z2luYWwgcHVycG9zZXMuCj4+Pj4+Pj4gTWF5YmUgaXQgd291bGQgYmUgYmV0dGVyIHRvIGZpbHRl
ciBmb3IgdGhpcyB3aGVuIHBvcHVsYXRpbmcgZ3Vlc3QKPj4+Pj4+PiBETUkgdGFibGVzPwo+Pj4+
Pj4gSSBkb24ndCBrbm93IGhvdyBETUkgdGFibGVzIGFyZSBwb3B1bGF0ZWQsIGJ1dCBub3RoaW5n
IHN0b3BzIGEgZ3Vlc3QKPj4+Pj4+IGZyb20gdXNpbmcgdGhlc2UgaHlwZXJjYWxscyBkaXJlY3Rs
eS4KPj4+Pj4gQW5kIHRoaXMgaXMgcHJlY2lzZWx5IHRoZSBjYXNlIHdoZXJlIEkgdGhpbmsgIjxk
ZW5pZWQ+IiBpcyBiZXR0ZXIKPj4+Pj4gdGhhbiBhbiBlbXB0eSBzdHJpbmcuCj4+Pj4KPj4+PiAi
PGRlbmllZD4iIHdhcyBhIHRlcnJpYmxlIGNob2ljZSBiYWNrIHdoZW4gaXQgd2FzIGludHJvZHVj
ZWQsIGFuZCBpdHMKPj4+PiBzdGlsbCBhIHRlcnJpYmxlIGNob2ljZSB0b2RheS4KPj4+Pgo+Pj4+
IFRoZXNlIGFyZSBBU0NJSSBzdHJpbmcgZmllbGRzLCBhbmQgdGhlIGVtcHR5IHN0cmluZyBpcyBh
IHBlcmZlY3RseSBnb29kCj4+Pj4gc3RyaW5nLiAgTm90aGluZyBpcyBnb2luZyB0byBicmVhaywg
YmVjYXVzZSBpdCB3b3VsZCBoYXZlIGJyb2tlbiB0aGUKPj4+PiBmaXJzdCB0aW1lIGFyb3VuZC4K
Pj4+Pgo+Pj4+IFRoZSBlbmQgcmVzdWx0IHdpdGhvdXQgZGVuaWVkIHNwcmF5ZWQgYWxsIG92ZXIg
dGhpcyBpbnRlcmZhY2UgaXMgbXVjaAo+Pj4+IGNsZWFuZXIgb3ZlcmFsbC4KPj4+Cj4+PiBVbmZv
cnR1bmF0ZWx5IHRoaXMgbWFpbCBkb2Vzbid0IGNvbnRhaW4gYW55IGZhY3RzIG9yIGFyZ3VtZW50
cywganVzdAo+Pj4gdW5zdWJzdGFudGlhdGVkIHZhbHVlIGp1ZGdlbWVudHMuICBXaGF0J3Mgc28g
dGVycmlibGUgYWJvdXQgIjxkZW5pZWQ+Igo+Pj4gLS0gd2hhdCBiYWQgZWZmZWN0IGRvZXMgaXQg
aGF2ZT8gIFdoeSBpcyAiIiBiZXR0ZXIgLyBjbGVhbmVyPwo+Pgo+PiBJdCBjYW4gYmUgZXhwbGFp
bmVkIHdpdGggYSBwaWN0dXJlIChhdHRhY2hlZCkgOykKPgo+IEJ1dCB0aGF0J3Mgc29tZXRoaW5n
IGJldHRlciBhZGRyZXNzZWQgYXQgb3IgY2xvc2UgdG8gdGhlIHByZXNlbnRhdGlvbgo+IGxheWVy
LCBub3QgZGVlcCBkb3duIGluIFhlbi4KCkkgYWdyZWUgd2l0aCB0aGF0LiBBbmQgbG9va3MgbGlr
ZSB0aGUgZm9sbG93aW5nIGRpZmYgZG9lcyB0aGUgdHJpY2s6CgpkaWZmIC0tZ2l0IGEvdG9vbHMv
ZmlybXdhcmUvaHZtbG9hZGVyL3NtYmlvcy5jIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3Nt
Ymlvcy5jCmluZGV4IDk3YTA1NGU5ZTMuLmI0ZDcyYzM3NWYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2Zp
cm13YXJlL2h2bWxvYWRlci9zbWJpb3MuYworKysgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIv
c21iaW9zLmMKQEAgLTI3NSw2ICsyNzUsOCBAQCBodm1fd3JpdGVfc21iaW9zX3RhYmxlcygKICAg
ICB4ZW5fbWlub3JfdmVyc2lvbiA9ICh1aW50MTZfdCkgeGVuX3ZlcnNpb247CgogICAgIGh5cGVy
Y2FsbF94ZW5fdmVyc2lvbihYRU5WRVJfZXh0cmF2ZXJzaW9uLCB4ZW5fZXh0cmFfdmVyc2lvbik7
CisgICAgaWYgKCBzdHJjbXAoeGVuX2V4dHJhX3ZlcnNpb24sICI8ZGVuaWVkPiIpID09IDAgKQor
ICAgICAgICBtZW1zZXQoeGVuX2V4dHJhX3ZlcnNpb24sIDAsIHNpemVvZih4ZW5fZXh0cmFfdmVy
c2lvbikpOwoKICAgICAvKiBidWlsZCB1cCBodW1hbi1yZWFkYWJsZSBYZW4gdmVyc2lvbiBzdHJp
bmcgKi8KICAgICBwID0geGVuX3ZlcnNpb25fc3RyOwoKLS0KVGhhbmtzLApTZXJnZXkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
