Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B56BBA7EA7
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 11:01:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5R83-0008SB-LW; Wed, 04 Sep 2019 08:59:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zWnQ=W7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i5R81-0008RW-Sc
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 08:59:01 +0000
X-Inumbo-ID: 3c3c7fe2-cef2-11e9-abad-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c3c7fe2-cef2-11e9-abad-12813bfff9fa;
 Wed, 04 Sep 2019 08:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567587540;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ZCkY3+jSQ4aiwEdHzyUnTySuAA1miwF32M770lddJgQ=;
 b=XoN2coTsO+rDF/RuEgFZi8NJd1mIlJaqfiVEWY0SRaMnqNZ6NYXEwqU6
 GSp0b1ARArq4UF6LUArpKzTSG9ugDFdT3NZ7oEbZTXrbHphkgEoWgpS7X
 cJPVLnEyA8KFEC+VbfGpmyWvfD+QTrRhU5tlu65PXqKmHxb1iijepYE3P o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xD1kUaZcARTWstXIlnYEgUK4fGhG+T/4huPRugqtCAHk7Q4nWdT+jQCWvdkB1gsqj+U3RhiqnC
 eOMpxvw8n5PzIjg8HzaZ+EIqIx7ht5sWenwLA9dzjaYug/ojycdMFz5Xh8xKbAPNFECmMHitLq
 xYXKFT4v9lsFvhGCGAvOZOKBbWPswChvwoI/m1ozhGI3Ga3oaFQOFpB720k21O+YvwOymyOYAK
 rDhaujpJYuosxOs9Gk5Pye2iepi+hDjV2lpC+IPPnUQ0anJ0d16GQk7vESeExlkSRRWpIvIf3+
 ANE=
X-SBRS: 2.7
X-MesageID: 5290655
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,465,1559534400"; 
   d="scan'208";a="5290655"
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-6-jgross@suse.com>
 <87905a2d-acd5-90b7-1c40-bf81f5ac005b@suse.com>
 <75a52d2d-a482-c62d-8d30-b02aba00d349@suse.com>
 <2a7b100c-2403-6bf2-7a73-3f2b0a2461a4@suse.com>
 <2ff6e052-9e29-b121-800d-6fe0a0f14ee4@suse.com>
 <213ff1eb-1ced-5530-b46c-0e82cb8164a7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <eea8cf6b-ff96-765f-d9a4-2064a75979a3@citrix.com>
Date: Wed, 4 Sep 2019 09:58:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <213ff1eb-1ced-5530-b46c-0e82cb8164a7@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 5/5] xen: modify several static locks to
 unique names
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
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDkvMjAxOSAwOTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQuMDkuMjAxOSAx
MDoyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMDMuMDkuMTkgMTc6MDksIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gT24gMDMuMDkuMjAxOSAxNzowMywgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+PiBPbiAwMy4wOS4xOSAxNjo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI5LjA4
LjIwMTkgMTI6MTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+PiBJbiBvcmRlciB0byBoYXZl
IHVuaXF1ZSBuYW1lcyB3aGVuIGRvaW5nIGxvY2sgcHJvZmlsaW5nIHNldmVyYWwgbG9jYWwKPj4+
Pj4+IGxvY2tzICJsb2NrIiBuZWVkIHRvIGJlIHJlbmFtZWQuCj4+Pj4+IEJ1dCB0aGVzZSBhcmUg
YWxsIG5hbWVkIHNpbXBseSAibG9jayIgZm9yIGEgZ29vZCByZWFzb24sIGluY2x1ZGluZwo+Pj4+
PiBiZWNhdXNlIHRoZXkncmUgYWxsIGZ1bmN0aW9uIHNjb3BlIHN5bWJvbHMgKGFuZCB0eXBpY2Fs
bHkgdGhlCj4+Pj4+IGZ1bmN0aW9ucyBhcmUgYWxsIHN1ZmZpY2llbnRseSBzaG9ydCkuIFRoZSBp
c3N1ZSBzdGVtcyBmcm9tIHRoZQo+Pj4+PiBkdWFsIHVzZSBvZiAibmFtZSIgaW4KPj4+Pj4KPj4+
Pj4gI2RlZmluZSBfTE9DS19QUk9GSUxFKG5hbWUpIHsgMCwgI25hbWUsICZuYW1lLCAwLCAwLCAw
LCAwLCAwIH0KPj4+Pj4KPj4+Pj4gc28gSSdkIHJhdGhlciBzdWdnZXN0IG1ha2luZyB0aGlzIGEg
ZGVyaXZhdGlvbiBvZiBhIG5ldwo+Pj4+Pgo+Pj4+PiAjZGVmaW5lIF9MT0NLX1BST0ZJTEVfTkFN
RShsb2NrLCBuYW1lKSB7IDAsICNuYW1lLCAmbG9jaywgMCwgMCwgMCwgMCwgMCB9Cj4+Pj4+Cj4+
Pj4+IGlmIHRoZXJlJ3Mgbm8gb3RoZXIgKHRyYW5zcGFyZW50KSB3YXkgb2YgZGlzYW1iaWd1YXRp
bmcgdGhlIG5hbWVzLgo+Pj4+IFRoaXMgd2lsbCByZXF1aXJlIHRvIHVzZSBhIGRpZmZlcmVudCBE
RUZJTkVfU1BJTkxPQ0soKSB2YXJpYW50LCBzbyBlLmcuCj4+Pj4gREVGSU5FX1NQSU5MT0NLX0xP
Q0FMKCksIHdoaWNoIHdpbGwgdGhlbiBpbmNsdWRlIHRoZSBuZWVkZWQgInN0YXRpYyIgYW5kCj4+
Pj4gYWRkICJAPGZ1bmM+IiB0byB0aGUgbG9jayBwcm9maWxpbmcgbmFtZS4gSXMgdGhpcyBva2F5
Pwo+Pj4gVG8gYmUgZnJhbmsgLSBub3QgcmVhbGx5LiBJIGRpc2xpa2UgYm90aCwgYW5kIHdvdWxk
IGhlbmNlIHByZWZlciB0bwo+Pj4gc3RpY2sgdG8gd2hhdCB0aGVyZSBpcyBjdXJyZW50bHksIHVu
dGlsIHNvbWVvbmUgaW52ZW50cyBhIHRyYW5zcGFyZW50Cj4+PiB3YXkgdG8gZGlzYW1iaWd1YXRl
IHRoZXNlLiBJJ20gc29ycnkgZm9yIGJlaW5nIHVuaGVscGZ1bCBoZXJlLgo+PiBJIHRoaW5rIEkg
aGF2ZSBmb3VuZCBhIHdheTogSSBjb3VsZCBhZGQgX19GSUxFX18gYW5kIF9fTElORV9fIGRhdGEg
dG8KPj4gc3RydWN0IGxvY2tfcHJvZmlsZS4gSW4gbG9ja19wcm9mX2luaXQoKSBJIGNvdWxkIGxv
b2sgZm9yIG5vbi11bmlxdWUKPj4gbG9jayBuYW1lcyBhbmQgbWFyayB0aG9zZSB0byBiZSBwcmlu
dGVkIHdpdGggdGhlIF9fRklMRV9fIGFuZCBfX0xJTkVfXwo+PiBkYXRhIGFkZGVkIHRvIHRoZSBu
YW1lcy4KPj4KPj4gV291bGQgeW91IGJlIGZpbmUgd2l0aCB0aGlzIGFwcHJvYWNoPwo+IEkgd291
bGQgYmUsIGJ1dCBJJ20gYWZyYWlkIEFuZHJldyB3b24ndCAoYXMgd2l0aCBhbnkgbmV3IHVzZXMg
b2YgX19MSU5FX18pLgoKVGhlIG9rLW5lc3Mgb2YgdXNpbmcgX19MSU5FX18gaXMgaW52ZXJzZWx5
IHByb3BvcnRpb25hbCB0byB0aGUKbGlrZWxpaG9vZCBvZiBkZXZlbG9waW5nIGEgbGl2ZXBhdGNo
IGZvciB0aGlzIHBhcnRpY3VsYXIgYnVpbGQgb2YgWGVuLAphbmQgd2hhdCBhZGRpdGlvbmFsIHBh
dGNoaW5nIGRlbHRhIGl0IHdvdWxkIGNhdXNlIHRocm91Z2ggdW5yZWxhdGVkIGNoYW5nZXMuCgpX
ZSBzdGlsbCBoYXZlIF9fTElORV9fIGluIGEgZmV3IGNhc2VzIGluIHJlbGVhc2UgYnVpbGRzIGJl
Y2F1c2UgdGhlCnV0aWxpdHkgaGFzIGJlZW4gZGVlbWVkIHRvIG91dHdlaWdoIHRoZSBhZGRpdGlv
bmFsIGxpdmVwYXRjaCBvdmVyaGVhZC7CoApBIHNwZWNpZmljIGV4YW1wbGUgaXMgeDg2X2VtdWxh
dGUoKSwgd2hlcmUgdGhlIGV4dHJhIHBhdGNoaW5nIGRlbHRhIGlzIDAKZ2l2ZW4gdGhhdCBpdCBp
cyBhIHNpbmdsZSBmdW5jdGlvbi4KCkZvciBzdHVmZiB3aGljaCB3b3VsZG4ndCBiZSBhY3RpdmUg
aW4gcHJvZHVjdGlvbiBidWlsZHMsIGFuZCB1bmxpa2VseSB0bwpiZSBvbiB0aGUgbWFqb3JpdHkg
b2YgZGVidWcgYnVpbGRzLCB0aGVuIGl0IHNob3VsZCBiZSBmaW5lIHRvIHVzZS4KClRoZSBvbmUg
cmVtYWluaW5nIHByb2JsZW1hdGljIHVzZSBvZiBfX0xJTkVfXyBpcyBpbiBkb21haW5fY3Jhc2go
KSBhbmQKaXQgbmVlZHMgdG8gZGlzYXBwZWFyIGJlY2F1c2UgaXQgdGVuZHMgdG8gaGF2ZSBhIG1h
c3NpdmUKdW5yZWxhdGVkLXBhdGNoLWRlbHRhIGZvciByZWxlYXNlIGJ1aWxkcy4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
