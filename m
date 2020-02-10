Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E32E157EAB
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 16:22:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Aqq-00027Y-7p; Mon, 10 Feb 2020 15:19:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qaH/=36=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j1Aqo-00027T-UY
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 15:19:54 +0000
X-Inumbo-ID: c94b45c8-4c18-11ea-b472-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c94b45c8-4c18-11ea-b472-bc764e2007e4;
 Mon, 10 Feb 2020 15:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581347993;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=szTXlfLamh5qky5Z0SvVXKMytzNO5vAc2o8PeJSyZDo=;
 b=dLT3l3dR265b5ERufqzVsTnZXEltZoTgsQJps7e+zAfvBJWdbIc0mTs5
 6ls5Y2kaKQj4WR0u2OWHn7bDc88trUGq8q/JpIv4OzRORdhrelBYM+x36
 m2a09XV3dOO3dekL2n9ZmM9xrUaL5V2tI5HFlNGJaqzfs3VhIcvw9F5vo c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hJeJlg3qHRWx4LzAIdLBQjrgvjaDqGm3nTHjgkynKm93q8sE9/vUV4c6m5pMG7BejoKVkEU5P2
 6lTuAD35IQgXVAfvzH7nMtFEqlGVoyOn/R1i2u2pwDIr55Fb5cDTgRuR5nLTkMU5ByqdAYwZjy
 CQ22q7xVFbYqQH6dytFtmV0Q2oyUpos0p8Xd8o4ABVf4L1M4sGgK+nwpJvJ4MYF6GToJZdOA0g
 ejX071Rt3gLtwlH8U8lT6s38Zw86arOXcsm30cMXzl2fSJwIRqJei5Wqrt3dLal1E9xZZRSHfq
 h60=
X-SBRS: 2.7
X-MesageID: 12829718
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12829718"
To: Jan Beulich <jbeulich@suse.com>
References: <20200203144340.4614-1-andrew.cooper3@citrix.com>
 <20200203144340.4614-5-andrew.cooper3@citrix.com>
 <76961409-b553-0ccc-6cd1-33ccf5cc75a0@suse.com>
 <cf596ea9-f9dd-b938-9666-34165edb8a0c@citrix.com>
 <afeace96-6c2d-207e-1ed7-f7f70d909072@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <30ddc44a-a915-5183-74a8-4dd149bcadf1@citrix.com>
Date: Mon, 10 Feb 2020 15:19:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <afeace96-6c2d-207e-1ed7-f7f70d909072@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 4/4] AMD/IOMMU: Treat head/tail pointers as
 byte offsets
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDIvMjAyMCAxNTowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTAuMDIuMjAyMCAx
NTo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDUvMDIvMjAyMCAxMDozNiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwMy4wMi4yMDIwIDE1OjQzLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9jbWQuYwo+Pj4+
ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9jbWQuYwo+Pj4+IEBAIC0y
NCwxNiArMjQsMTQgQEAgc3RhdGljIGludCBxdWV1ZV9pb21tdV9jb21tYW5kKHN0cnVjdCBhbWRf
aW9tbXUgKmlvbW11LCB1MzIgY21kW10pCj4+Pj4gIHsKPj4+PiAgICAgIHVpbnQzMl90IHRhaWws
IGhlYWQ7Cj4+Pj4gIAo+Pj4+IC0gICAgdGFpbCA9IGlvbW11LT5jbWRfYnVmZmVyLnRhaWw7Cj4+
Pj4gLSAgICBpZiAoICsrdGFpbCA9PSBpb21tdS0+Y21kX2J1ZmZlci5lbnRyaWVzICkKPj4+PiAr
ICAgIHRhaWwgPSBpb21tdS0+Y21kX2J1ZmZlci50YWlsICsgSU9NTVVfQ01EX0JVRkZFUl9FTlRS
WV9TSVpFOwo+Pj4+ICsgICAgaWYgKCB0YWlsID09IGlvbW11LT5jbWRfYnVmZmVyLnNpemUgKQo+
Pj4+ICAgICAgICAgIHRhaWwgPSAwOwo+Pj4+ICAKPj4+PiAtICAgIGhlYWQgPSBpb21tdV9nZXRf
cmJfcG9pbnRlcihyZWFkbChpb21tdS0+bW1pb19iYXNlICsKPj4+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9DTURfQlVGRkVSX0hFQURfT0ZGU0VUKSk7Cj4+
Pj4gKyAgICBoZWFkID0gcmVhZGwoaW9tbXUtPm1taW9fYmFzZSArIElPTU1VX0NNRF9CVUZGRVJf
SEVBRF9PRkZTRVQpOwo+Pj4+ICAgICAgaWYgKCBoZWFkICE9IHRhaWwgKQo+Pj4gU3VyZWx5IHlv
dSB3YW50IHRvIG1hc2sgb2ZmIHJlc2VydmVkIChvciBtb3JlIGdlbmVyYWxseQo+Pj4gdW5yZWxh
dGVkKSBiaXRzLCBiZWZvcmUgY29uc3VtaW5nIHRoZSB2YWx1ZSBmb3IgdGhlIHB1cnBvc2UKPj4+
IGhlcmUgKGFuZCBlbHNld2hlcmUgYmVsb3cpPwo+PiBSZXNlcnZlZCBiaXRzIGFyZSBkZWZpbmVk
IGluIHRoZSBJT01NVSBzcGVjIHRvIGJlIHJlYWQtb25seSB6ZXJvLgo+Pgo+PiBJdCBpcyBhbHNv
IHVuZGVmaW5lZCBiZWhhdmlvdXIgZm9yIHRoaXMgdmFsdWUgdG8gZXZlciBiZSBvdXRzaWRlIG9m
IHRoZQo+PiBzaXplIGNvbmZpZ3VyZWQgZm9yIGNvbW1hbmQgYnVmZmVyLCBzbyB1c2luZyB0aGUg
dmFsdWUgbGlrZSB0aGlzIGlzIHNwZWMKPj4gY29tcGxpYW50Lgo+Pgo+PiBBcyBmb3IgYWN0dWFs
bHkgbWFza2luZyB0aGUgdmFsdWVzLCB0aGF0IGJyZWFrcyB0aGUgb3B0aW1pc2VycyBhYmlsaXR5
Cj4+IHRvIGNvbnN0cnVjdCBjb21tYW5kcyBpbiB0aGUgY29tbWFuZCByaW5nLsKgIFRoaXMgYXNw
ZWN0IGNhbiBiZSB3b3JrZWQKPj4gYXJvdW5kIHdpdGggb3RoZXIgY29kZSBjaGFuZ2VzLCBidXQg
SSBhbHNvIHRoaW5rIGl0IGlzIGltcGxhdXNpYmxlIHRoYXQKPj4gdGhlIHJlbWFpbmluZyByZXNl
cnZlZCBiaXRzIGhlcmUgYXJlIGdvaW5nIHRvIHNwcm91dCBpbmNvbXBhdGlibGUgZnV0dXJlCj4+
IHVzZXMuCj4gSW1wbGF1c2libGUgLSBwZXJoYXBzLiBCdXQgaW1wb3NzaWJsZSAtIG5vLiBUaGVy
ZSBjb3VsZCBiZSBhIHNpbXBsZQo+IGZsYWcgYml0IGFwcGVhcmluZyBzb21ld2hlcmUgaW4gdGhl
c2UgcmVnaXN0ZXJzLiBJIHNpbXBseSBkb24ndCBpdAo+IGlzIGEgZ29vZCBpZGVhIHRvIHNldCBh
IHByZWNlZGVudCBvZiBub3QgaG9ub3JpbmcgcmVzZXJ2ZWQgYml0IGFzCj4gYmVpbmcgcmVzZXJ2
ZWQuIFRoZSBzcGVjIHNheWluZyAicmVhZC1vbmx5IHplcm8iIGNhbiBvbmx5IGJlIHZpZXdlZAo+
IGFzIGNvcnJlY3QgZm9yIHRoZSBjdXJyZW50IHZlcnNpb24gb2YgdGhlIHNwZWMsCgpJdHMgcGVy
ZmVjdGx5IGVhc3kgdG8gZG8gZm9yd2FyZCBjb21wYXRpYmxlIGNoYW5nZXMgd2l0aCBhIHNwZWMg
d3JpdHRlbgppbiB0aGlzIHdheS4KCkl0IG1lYW5zIHRoYXQgbmV3IGJlaGF2aW91cnMgaGF2ZSB0
byBiZSBvcHRlZCBpbiB0bywgYW5kIHRoaXMgaXMgaG93IHRoZQpBTUQgSU9NTVUgc3BlYyBoYXMg
ZXZvbHZlZC7CoCBOb3RpY2UgaG93IGV2ZXJ5IG5ldyBmZWF0dXJlIGRlY2xhcmVzICJ0aGlzCmJp
dCBpcyByZXNlcnZlZCB1bmxlc3MgJE9USEVSX1RISU5HIGlzIGVuYWJsZWQuIgoKSXQgaXMgYWxz
byBhIHZlcnkgc2FuZSB3YXkgb2YgZG9pbmcgZm9yd2FyZCBjb21wYXRpYmlsaXR5LCBmcm9tCnNv
ZnR3YXJlJ3MgcG9pbnQgb2Ygdmlldy4KCj4gb3IgZWxzZSB3aHkgd291bGQKPiB0aGUgYml0cyBi
ZSBjYWxsZWQgInJlc2VydmVkIiByYXRoZXIgdGhhbiBlLmcuICJyZWFkLWFzLXplcm8iPwoKUmVh
ZCBUYWJsZSAxLCBidXQgaXQgYWxzbyBvdWdodCB0byBiZSBvYnZpb3VzLsKgICJSZXNlcnZlZCIs
ICJSZXN2IiBhbmQKIlJlcyIgYXJlIGFsbCBzaG9ydGVyIHRvIHdyaXRlIHRoYW4gInJlYWQtYXMt
emVybyIsIGVzcGVjaWFsbHkgaW4gdGhlCmRpYWdyYW1zIG9mIGEgZmV3IGluZGl2aWR1YWwgYml0
cyBpbiBhIHJlZ2lzdGVyLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
