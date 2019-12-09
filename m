Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E84B116E9C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:08:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieJfx-00069v-Ta; Mon, 09 Dec 2019 14:06:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4FL1=Z7=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ieJfw-00069q-D3
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 14:06:12 +0000
X-Inumbo-ID: 0da32f28-1a8d-11ea-88e7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0da32f28-1a8d-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575900371;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=IW0V+SA40fnSVGPJudeKM7dZJyxNCciur+tZns476kM=;
 b=YeYfqwiV99DNIQGb+VJvLJTfZcgGoJG0XDBOs3ypdjWJ+/994Y0fc0in
 0xbeHAphRBelSZ8Q1N3E0t5VdTAmIzYUM5jDBnuiY5lbm21SqB8SAWa+l
 kt5nCT3CLcFiQONhVW2FTYUMN2kFy+bApNyaq4OoXOwArRbCq4U9K6LEk Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /zq5Hj8V5Y8New1SbzHHWYwneaOHl1UmnEa9hOk/tZhniMaNjKGxpRC1e/06RckYJhyhNhX/PM
 h1mNImFmVyznrnfAwhUTFVL3uBFvZcFMhyD+Ac/JGaRB3CWxcBwCFXdN3NQ+PDgmyTaqtP0Mas
 6ZoLSVR/fhHHZVGIgl+SSiS/rX9Ln3sMCp8yaqPsUWOKf/f56wB6mPLWmchqbbAUgAwObUv8GH
 zxqYY3e5qFwOJ6zi1QUge5onEjbHiAhJpgEPxNtzTF2fofMYaUG6o7fLEMzKn4eAGHFRre9SBX
 D7E=
X-SBRS: 2.7
X-MesageID: 9807340
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,294,1571716800"; 
   d="scan'208";a="9807340"
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <aa92bd0c-f35c-2bf3-d665-4977f83bb0d5@suse.com>
 <8dc4166d-45c3-0a5c-8782-78de1b74ad36@xen.org>
 <271f8148-e74a-3d3b-375d-991d7cb9e475@suse.com>
 <eb8c5538-0a7b-fef5-01b6-6458b3b5d24c@xen.org>
 <dbfdc420-5755-5298-fc9c-7ac21a521d13@suse.com>
 <787c1ac3-a4b2-da01-b444-af030a5a49bc@xen.org>
 <7716910a-b3ee-32f1-cdf7-def1a8f258f4@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <fee3e4ec-213b-c3a9-a509-a125877be6f3@citrix.com>
Date: Mon, 9 Dec 2019 14:06:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7716910a-b3ee-32f1-cdf7-def1a8f258f4@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] cmdline: treat hyphens and underscores the
 same
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvNi8xOSA0OjQyIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwNi4xMi4yMDE5IDE3
OjIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAwNi8xMi8yMDE5IDE2OjA2
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDA2LjEyLjIwMTkgMTU6NDYsIEp1bGllbiBHcmFs
bCB3cm90ZToKPj4+PiBPbiAwNS8xMi8yMDE5IDE2OjUwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+
Pj4gT24gMDUuMTIuMjAxOSAxNzoyNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4gT24gMDUv
MTIvMjAxOSAxNTozMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gKy8qCj4+Pj4+Pj4gKyAq
IFN0cmluZyBjb21wYXJpc29uIGZ1bmN0aW9ucyBtb3N0bHkgbWF0Y2hpbmcgc3RyY21wKCkgLyBz
dHJuY21wKCksCj4+Pj4+Pj4gKyAqIGV4Y2VwdCB0aGF0IHRoZXkgdHJlYXQgJy0nIGFuZCAnXycg
YXMgbWF0Y2hpbmcgb25lIGFub3RoZXIuCj4+Pj4+Pj4gKyAqLwo+Pj4+Pj4+ICtzdGF0aWMgaW50
IF9zdHJjbXAoY29uc3QgY2hhciAqczEsIGNvbnN0IGNoYXIgKnMyKQo+Pj4+Pj4KPj4+Pj4+IEkg
dGhvdWdodCB3ZSB3ZXJlIHRyeWluZyB0byBhdm9pZCBuZXcgZnVuY3Rpb24gbmFtZSB3aXRoIGxl
YWRpbmcgXz8KPj4+Pj4KPj4+Pj4gV2UncmUgdHJ5aW5nIHRvIGF2b2lkIG5ldyBuYW1lIHNwYWNl
IHZpb2xhdGlvbnMuIFN1Y2ggYXJlCj4+Pj4+IC0gaWRlbnRpZmllcnMgc3RhcnRpbmcgd2l0aCB0
d28gdW5kZXJzY29yZXMsCj4+Pj4+IC0gaWRlbnRpZmllcnMgc3RhcnRpbmcgd2l0aCBhbiB1bmRl
cnNjb3JlIGFuZCBhbiB1cHBlciBjYXNlIGxldHRlciwKPj4+Pj4gLSBpZGVudGlmaWVycyBvZiBu
b24tc3RhdGljIHN5bWJvbHMgc3RhcnRpbmcgd2l0aCBhbiB1bmRlcnNjb3JlLgo+Pj4+Cj4+Pj4g
SSBhbSBub3Qgc3VyZSB0byB1bmRlcnN0YW5kIHdoeSBub24tc3RhdGljIHN5bWJvbHMgb25seS4g
VGhpcyB3b3VsZAo+Pj4+IHByZXZlbnQgeW91IHRvIHVzZSB0aGUgdGhlIG5vbi1zdGF0aWMgc3lt
Ym9sIGlmIHlvdSBoYXBwZW4gdG8gcmUtdXNlIHRoZQo+Pj4+IHNhbWUgbmFtZS4KPj4+Cj4+PiBJ
J20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZC4gQW55d2F5IC0gd2hhdCBJJ3ZlIGxpc3RlZCBh
Ym92ZSBpcwo+Pj4gd2hhdCB0aGUgbGFuZ3VhZ2Ugc3RhbmRhcmQgbWFuZGF0ZXMuCj4+IEFGQUlV
LCBmb3IgYSBnaXZlbiB1bml0LCB0aGVyZSBpcyBvbmx5IG9uZSBwb29sIG9mIGlkZW50aWZpZXJz
LiBTbyB5b3UgCj4+IGNvdWxkIG5vdCBoYXZlIGFuIGlkZW50aWZpZXIgdXNlZCBhdCB0aGUgc2Ft
ZSB0aW1lIGJ5IGEgbm9uLXN0YXRpYyBhbmQgYSAKPj4gc3RhdGljIHN5bWJvbCAodGhhdCdzIGV4
Y2x1c2luZyB0aGUgd2VhayBhdHRyaWJ1dGUpLiBTbyBpdCBmZWVscyAKPj4gc2xpZ2h0bHkgc3Ry
YW5nZSB0byBvbmx5IGNvdmVyIHRoZSBub24tc3RhdGljIHN5bWJvbHMuCj4gCj4gSSBndWVzcyBJ
J20gc3RpbGwgbm90IGdldHRpbmcgeW91ciBwb2ludC4gV2hhdCB0aGUgYWJvdmUgdGVsbHMKPiB1
cyBpcyB0aGF0IHN0YXRpYyBzeW1ib2xzIG1heSBzdGFydCB3aXRoIGFuIHVuZGVyc2NvcmUgKGJ1
dAo+IG5vdCBmb2xsb3dlZCBieSBhbm90aGVyIG9uZSBvciBhbiB1cHBlcmNhc2UgbGV0dGVyKS4g
Tm9uLXN0YXRpYwo+IHN5bWJvbHMgbWF5IG5vdC4KPiAKPj4+PiBBbnl3YXksIGhvdyBhYm91dCBj
YWxsaW5nIGl0IGNtZGxpbmVfc3RybmNtcCgpPyBUaGlzIHdvdWxkIGJlIGVhc2llciB0bwo+Pj4+
IHNwb3QgbWlzdXNlIG9uIHJldmlldyAoaS5lIHVzaW5nIHN0cm5jbXAoKSByYXRoZXIgdGhhbiBf
c3RybmNtcCgpKS4KPj4+Cj4+PiBXZSBhbHJlYWR5IGhhdmUgY21kbGluZV9zdHJjbXAoKSwgb3Ig
ZWxzZSBJIHdvdWxkIGluZGVlZCBoYXZlIHVzZWQKPj4+IHRoaXMgcHJlZml4LiBObyBwcmVmaXgg
KG90aGVyIHRoYW4gdGhlIGxvbmUgdW5kZXJzY29yZSkgc2VlbWVkIHRoZQo+Pj4gbmV4dCBiZXN0
IG9wdGlvbi4KPj4KPj4gQXMgd2UgcGFyc2UgYW4gb3B0aW9uLCBob3cgYWJvdXQgb3B0X3N0cm5j
bXAoKT8KPiAKPiBJJ2Qgc3RpbGwgbGlrZSBfc3RybmNtcCgpIGJldHRlciBoZXJlLgoKV2h5PyAg
SXQgZG9lc24ndCB0ZWxsIHlvdSBhbnl0aGluZyBhdCBhbGwgYWJvdXQgd2hhdCdzIHNwZWNpYWwg
YWJvdXQgdGhlCmZ1bmN0aW9uLiAgSW4gZmFjdCwgSSdkIHNheSBpdCdzIGNvbmZ1c2luZyAtLSB0
aGUgIl8iIGRvZXNuJ3Qgbm9ybWFsbHkKbWVhbiwgImRvIHNvbWV0aGluZyBkaWZmZXJlbnQgYW5k
IHNwZWNpYWwiLCBidXQgImRvIHRoZSBjb3JlIG9mCnNvbWV0aGluZyB3aGljaCBvdGhlciB0aGlu
Z3MgbWlnaHQgY2FsbCIuCgpJJ2QgbXVjaCBwcmVmZXIgb3B0X3N0cm5jbXAoKSB0aGFuIF9zdHJu
Y21wKCkuCgogLUdlb3JnZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
