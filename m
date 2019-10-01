Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEFCC3083
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:44:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFEfH-0007cG-4x; Tue, 01 Oct 2019 09:41:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=78uS=X2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFEfG-0007cB-5n
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:41:50 +0000
X-Inumbo-ID: b0a93d1e-e42f-11e9-8628-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id b0a93d1e-e42f-11e9-8628-bc764e2007e4;
 Tue, 01 Oct 2019 09:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569922909;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=mbolkcr6l2+hFsCHvGa7mE9kK5mTqo1ERwdnQHb+7ng=;
 b=bGSoCLlX9Lrz7t5fn6/OyiBQ4jC1IzGM8TApR1eqGVy0CihYUSRm36FA
 jIAaeMnA0EhRzz9O+Kxvdnm3UwhtTHh/egAv6Fb1tnPm9Jtw4BXYvO2iy
 b0MVkWMG7OGhbTcyUY35dY5Z4XUmz8UXnzu1vhl4pBg4YddIIE5xFjSxs Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XS5boLgR0ru7iO8uzfKqHfvwQq83x0bvSrH6Q3ulceU5NKwHFW+YPH0dORv+XF/rYZfjfohxqN
 j7IzaZzb0DKTx4iJ1T0x2z7KPrfiCSWnEczxpoSAfELCUNcjQWFYMGt0ss0Zy2Fjt8NQ676qNH
 lPXFA6mgG/VL6ujdJ8aoot5dwRF21WMcscpOVaFVASe4Gwsr6trbW1IQ96cQAHsFAcGwC8oMNo
 GJJI5griDb39ByGTD98nbYp/qQkcXUvnXTe5EwJhZ5bixJbTwZR1uccFqpsdmQzhKWcLODgGsf
 mtc=
X-SBRS: 2.7
X-MesageID: 6296581
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6296581"
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-3-andrew.cooper3@citrix.com>
 <6121ff6c-f7fb-f766-ffb0-7a5f52ddf997@arm.com>
 <9211e84c-fbf8-5a35-e898-23a58e3bd4cb@citrix.com>
 <2ce8fb9f-d365-cabf-6a98-e61ac525d4e5@arm.com>
 <3c901636-732f-446e-8a64-94149939d175@suse.com>
 <a00e52df-6475-31a8-bfac-844de29b9c72@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a3fb54e1-9296-7016-85c3-4eb2e26506a2@citrix.com>
Date: Tue, 1 Oct 2019 10:41:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a00e52df-6475-31a8-bfac-844de29b9c72@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_BRANCH_HARDEN and disable it
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Norbert Manthey <nmanthey@amazon.de>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMTAvMjAxOSAxMDoyNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEphbiwKPgo+IE9u
IDAxLzEwLzIwMTkgMTA6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwMS4xMC4yMDE5IDEx
OjE3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiAwMS8xMC8yMDE5IDAwOjIxLCBBbmRyZXcg
Q29vcGVyIHdyb3RlOgo+Pj4+IE9uIDMwLzA5LzIwMTkgMjE6MTcsIEp1bGllbiBHcmFsbCB3cm90
ZToKPj4+Pj4gTXkgd29ycnkgaXMgdGhpcyBnYXRlIGNvbmZpZyBnYXRlIG5vdGhpbmcgb24gQXJt
IHNvIHRoZSB1c2VyIG1heSBoYXZlCj4+Pj4+IGEgZmFsc2Ugc2Vuc2UgdGhhdCBpdCBjYW4gYmUg
dXNlZCAoZXZlbiB0aG91Z2ggaXQgaXMgY2xlYXJseSBCUk9LRU4pLgo+Pj4+Pgo+Pj4+PiBBbHNv
IHRoZSBuYW1lIGlzIHF1aXRlIGNsb3NlIHRvIHRoZSBDT05GSUdfSEFSREVOX1BSRURJQ1RPUiBv
biBBcm0KPj4+Pj4gYW5kCj4+Pj4+IG1heSBjb25mdXNlIHVzZXIuIEFsdGhvdWdoLCBJIGRvbid0
IGhhdmUgYSBiZXR0ZXIgbmFtZSBzbyBmYXIgOi8KPj4+Pgo+Pj4+IFRoZSAiZGVwZW5kcyBvbiBC
Uk9LRU4iIG1lYW5zIGl0IHdpbGwgbmV2ZXIgc2hvdyB1cCB0byBhIHVzZXIgaW4KPj4+PiBtZW51
Y29uZmlnLCB3aGljaCBpcyB3aHkgaXQgd2FzIG9ubHkgQ0MgdG8geDg2LCBhbmQgbm90IHRvIHJl
c3QuCj4+Pgo+Pj4gV2hhdCdzIHRoZSBsb25nIHRlcm0gcGxhbiBmb3IgdGhpcyBvcHRpb24/IEFy
ZSB5b3UgcGxhbm5pbmcgdG8KPj4+IHJlbW92ZSBpdAo+Pj4gY29tcGxldGVseSBvciBqdXN0IHRo
ZSBkZXBlbmRlbmNpZXMgb24gQlJPS0VOPwo+Pj4KPj4+IE15IGNvbmNlcm4gaXMgaWYgdGhpcyBv
cHRpb24gd2lsbCBldmVyIGJlY29tZSBzZWxlY3RhYmxlIHRoZW4gaXQKPj4+IHdpbGwgbm90IGRv
aW5nCj4+PiB3aGF0J3MgZXhwZWN0ZWQgb24gQXJtLgo+Pj4KPj4+IFNvLCBldmVuIGlmIGluIHBy
aW5jaXBsZSBpdCBpcyBhcmNoIGFnbm9zdGljLCBpdCBmZWVscyB0byBtZSB0aGlzCj4+PiBvcHRp
b24gc2hvdWxkCj4+PiBiZXR0ZXIgYmUgaW1wbGVtZW50ZWQgaW4geDg2L0tjb25maWcuCj4+Cj4+
IEkgZG9uJ3QgdGhpbmsgc28sIG5vLiBXaGVuIEJST0tFTiBpcyB0byBiZSByZW1vdmVkLCBpdCBv
dWdodCB0byBiZQo+PiByZXBsYWNlZCBieSBhIHN1aXRhYmxlICJkZXBlbmRzIG9uIEhBVkVfKiIs
IHdoaWNoIEFybSBjb3VsZCBjaG9vc2UKPj4gdG8gbm90IHNlbGVjdC4KPgo+IFNvIHRoZXJlIGFy
ZSBhbiBleHBlY3RhdGlvbiB0aGlzIG9wdGlvbiB3aWxsIGJlIHVzZWQgYnkgY29tbW9uIGNvZGUg
aW4KPiB0aGUgZnV0dXJlPwoKSXQgYWxyZWFkeSBpcy7CoCBBUk0gaGFzIHN0dWJzIGZvciBldmFs
dWF0ZV9ub3NwZWMoKSBldGMuCgpNeSBndXQgZmVlbGluZyBpcyB0aGF0IHRoZSBvbmx5IHdheSB0
aGlzIGlzIGdvaW5nIHRvIGJlIHJlc29sdmVkIHNhbmVseQppcyB3aXRoIGEgY29tcGlsZXIgZmVh
dHVyZSBvciBwbHVnaW4sIGF0IHdoaWNoIHBvaW50IGl0IHJlYXNvbmFibHkgY2FuCmJlIGNyb3Nz
LWFyY2guCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
