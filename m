Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9B11260CB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 12:27:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihtuf-0005x8-BX; Thu, 19 Dec 2019 11:24:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XypX=2J=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1ihtud-0005x3-T9
 for xen-devel@lists.xen.org; Thu, 19 Dec 2019 11:24:11 +0000
X-Inumbo-ID: 0ed2c29c-2252-11ea-88e7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ed2c29c-2252-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 11:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576754642;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pUBgZG5FZUhy6rHAsb4t6reI8i2TSDpGBwqGISdy5bw=;
 b=Qrve2u1UxWnbDYnsMNqG2Jo1Kjzy+9ogfBGjXqzUBSgjpY6q9zbR4NmJ
 asmBa67PVXstFNMn/Kgf+HB2GXpx0s1DoXq4ts3LlP0oM5tBXVyI+gSVT
 0UvaS3igpU9YFbnlhFB0NhwxYWRaqNX9bkgQfYC0BpCIJnX5mPpAe5Y7Y k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: k16zD4NNSObNWCn8p73A824NIFCArc2WW6SnQCz08WcrBM84HCD6zek+jlKt4kPOA9BSF1Im+p
 owsgfEpcco84hruN2Dk2EiOslDkj6NCWujaJnDpSJoc+doJEOPzD6R8gdK0DPMmk0E8hJ1mShH
 ztlXN1NcH19316QYutkFGVQo0es0uV3jQ60YyxbDnW+IOVne8CQYSgDBe/8pdw6VWVlpmFU2Ke
 GiuQ09OeYV6JaHUucaaxcYDc6UeEsteaXDIcTjx8IqXplDwZHf0GlIDJieCxowiovzYZ18quXE
 ufY=
X-SBRS: 2.7
X-MesageID: 9916044
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,331,1571716800"; 
   d="scan'208";a="9916044"
To: Jan Beulich <jbeulich@suse.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>
References: <20191217154625.31561-1-sergey.dyasli@citrix.com>
 <a5e3c4b7-40f4-017b-1154-d75f92075597@suse.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <65aecab1-a1b0-f02e-be92-cda3cd37b9e5@citrix.com>
Date: Thu, 19 Dec 2019 11:23:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a5e3c4b7-40f4-017b-1154-d75f92075597@suse.com>
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
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMTIvMjAxOSAxMTowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcuMTIuMjAxOSAx
Njo0NiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gSGlkZSB0aGUgZm9sbG93aW5nIGluZm9ybWF0
aW9uIHRoYXQgY2FuIGhlbHAgaWRlbnRpZnkgdGhlIHJ1bm5pbmcgWGVuCj4+IGJpbmFyeSB2ZXJz
aW9uOgo+Pgo+PiAgICAgWEVOVkVSX2V4dHJhdmVyc2lvbgo+PiAgICAgWEVOVkVSX2NvbXBpbGVf
aW5mbwo+PiAgICAgWEVOVkVSX2NhcGFiaWxpdGllcwo+IAo+IFdoYXQncyB3cm9uZyB3aXRoIGV4
cG9zaW5nIHRoaXMgb25lPwoKZXh0cmF2ZXJzaW9uIGNhbiBoZWxwIGlkZW50aWZ5IHRoZSBleGFj
dCBydW5uaW5nIFhlbiBiaW5hcnkgKGFuZCBJIG11c3QKc2F5IHRoYXQgYXQgQ2l0cml4IHdlIGFk
ZCBzb21lIGFkZGl0aW9uYWwgdmVyc2lvbiBpbmZvcm1hdGlvbiB0aGVyZSkuCmNvbXBpbGVfaW5m
byB3aWxsIGlkZW50aWZ5IGNvbXBpbGVyIGFuZCBtYW55IHNwZWN1bGF0aXZlIG1pdGlnYXRpb25z
CmFyZSBwcm92aWRlZCBieSBjb21waWxlcnMgdGhlc2UgZGF5cy4gTm90IHN1cmUgaWYgaXQncyB3
b3J0aCBoaWRpbmcKY2FwYWJpbGl0aWVzLCBidXQgT1RPSCBJIGRvbid0IHNlZSBob3cgZ3Vlc3Rz
IGNvdWxkIG1lYW5pbmdmdWxseSB1c2UgaXQuCgo+IAo+PiAgICAgWEVOVkVSX2NoYW5nZXNldAo+
PiAgICAgWEVOVkVSX2NvbW1hbmRsaW5lCj4+ICAgICBYRU5WRVJfYnVpbGRfaWQKPj4KPj4gUmV0
dXJuIGEgbW9yZSBjdXN0b21lciBmcmllbmRseSBlbXB0eSBzdHJpbmcgaW5zdGVhZCBvZiAiPGRl
bmllZD4iCj4+IHdoaWNoIHdvdWxkIGJlIHNob3duIGluIHRvb2xzIGxpa2UgZG1pZGVjb2RlLj4K
PiBJIHRoaW5rICI8ZGVuaWVkPiIgaXMgcXVpdGUgZmluZSBmb3IgbWFueSBvZiB0aGUgb3JpZ2lu
YWwgcHVycG9zZXMuCj4gTWF5YmUgaXQgd291bGQgYmUgYmV0dGVyIHRvIGZpbHRlciBmb3IgdGhp
cyB3aGVuIHBvcHVsYXRpbmcgZ3Vlc3QKPiBETUkgdGFibGVzPwoKSSBkb24ndCBrbm93IGhvdyBE
TUkgdGFibGVzIGFyZSBwb3B1bGF0ZWQsIGJ1dCBub3RoaW5nIHN0b3BzIGEgZ3Vlc3QKZnJvbSB1
c2luZyB0aGVzZSBoeXBlcmNhbGxzIGRpcmVjdGx5LgoKPiAKPj4gQnV0IGFsbG93IGd1ZXN0cyB0
byBzZWUgdGhpcyBpbmZvcm1hdGlvbiBpbiBEZWJ1ZyBidWlsZHMgb2YgWGVuLgo+IAo+IEJlaGF2
aW9yIGxpa2UgdGhpcyB3b3VsZCBpbW8gYmV0dGVyIG5vdCBkaWZmZXIgYmV0d2VlbiBkZWJ1ZyBh
bmQKPiByZWxlYXNlIGJ1aWxkcywgb3IgZWxzZSBndWVzdCBzb2Z0d2FyZSBtYXkgYmVoYXZlIGVu
dGlyZWx5Cj4gZGlmZmVyZW50bHkgb25jZSB5b3UgcHV0IGl0IG9uIGEgcHJvZHVjdGlvbiBidWls
ZC4KCkkgYWdyZWUgb24gdGhpcyBvbmUsIGl0J3Mgbm90IG11Y2ggd29ydGggcHJvdmlkaW5nIHRo
aXMgaW5mb3JtYXRpb24gaW4KZGVidWcgYnVpbGRzLgoKPiAKPj4gLS0tIGEveGVuL2luY2x1ZGUv
eHNtL2R1bW15LmgKPj4gKysrIGIveGVuL2luY2x1ZGUveHNtL2R1bW15LmgKPj4gQEAgLTc1MCwx
NiArNzUwLDIxIEBAIHN0YXRpYyBYU01fSU5MSU5FIGludCB4c21feGVuX3ZlcnNpb24gKFhTTV9E
RUZBVUxUX0FSRyB1aW50MzJfdCBvcCkKPj4gICAgICBjYXNlIFhFTlZFUl9nZXRfZmVhdHVyZXM6
Cj4+ICAgICAgICAgIC8qIFRoZXNlIHN1Yi1vcHMgaWdub3JlIHRoZSBwZXJtaXNzaW9uIGNoZWNr
cyBhbmQgcmV0dXJuIGRhdGEuICovCj4+ICAgICAgICAgIHJldHVybiAwOwo+PiAtICAgIGNhc2Ug
WEVOVkVSX2V4dHJhdmVyc2lvbjoKPj4gLSAgICBjYXNlIFhFTlZFUl9jb21waWxlX2luZm86Cj4+
IC0gICAgY2FzZSBYRU5WRVJfY2FwYWJpbGl0aWVzOgo+PiAtICAgIGNhc2UgWEVOVkVSX2NoYW5n
ZXNldDoKPj4gICAgICBjYXNlIFhFTlZFUl9wYWdlc2l6ZToKPj4gICAgICBjYXNlIFhFTlZFUl9n
dWVzdF9oYW5kbGU6Cj4+ICAgICAgICAgIC8qIFRoZXNlIE1VU1QgYWx3YXlzIGJlIGFjY2Vzc2li
bGUgdG8gYW55IGd1ZXN0IGJ5IGRlZmF1bHQuICovCj4gCj4gVGhpcyBjb21tZW50LCBub3QgdGhl
IGxlYXN0IGJlY2F1c2Ugb2YgaXRzIHVzZSBvZiBjYXBpdGFscywKPiBzdWdnZXN0cyB0byBtZSB0
aGF0IHRoZXJlJ3MgZnVydGhlciBqdXN0aWZpY2F0aW9uIG5lZWRlZCBmb3IKPiB5b3VyIGNoYW5n
ZSwgaW5jbHVkaW5nIGRpc2N1c3Npb24gb2Ygd2h5IHRoZXJlJ3Mgbm8gcmlzayBvZgo+IGJyZWFr
aW5nIGV4aXN0aW5nIGd1ZXN0cy4KCk5vdCBzdXJlIGFib3V0IHRoaXMgY29tbWVudCwgbWF5YmUg
dGhlIGF1dGhvciAoS29ucmFkKSByZW1lbWJlcnM/CldlIGhhZCB0aGlzIGNoYW5nZSBpbiBwcm9k
dWN0aW9uIGZvciB2ZXJ5IGxvbmcgdGltZSBub3cgYW5kIGhhdmVuJ3QKc2VlbiBhbnkgZ3Vlc3Qg
cmVncmVzc2lvbnMuCgo+IAo+PiAgICAgICAgICByZXR1cm4geHNtX2RlZmF1bHRfYWN0aW9uKFhT
TV9IT09LLCBjdXJyZW50LT5kb21haW4sIE5VTEwpOwo+PiArCj4+ICsgICAgY2FzZSBYRU5WRVJf
ZXh0cmF2ZXJzaW9uOgo+PiArICAgIGNhc2UgWEVOVkVSX2NvbXBpbGVfaW5mbzoKPj4gKyAgICBj
YXNlIFhFTlZFUl9jYXBhYmlsaXRpZXM6Cj4+ICsgICAgY2FzZSBYRU5WRVJfY2hhbmdlc2V0Ogo+
PiArICAgIGNhc2UgWEVOVkVSX2NvbW1hbmRsaW5lOgo+PiArICAgIGNhc2UgWEVOVkVSX2J1aWxk
X2lkOgo+PiAgICAgIGRlZmF1bHQ6Cj4gCj4gVGhlcmUncyBubyBuZWVkIHRvIGFkZCBhbGwgb2Yg
dGhlc2UgbmV4dCB0byB0aGUgZGVmYXVsdCBjYXNlLgo+IE5vdGUgaG93IGNvbW1hbmRsaW5lIGFu
ZCBidWlsZF9pZCBoYXZlIGJlZW4gY29taW5nIGhlcmUgYWxyZWFkeQo+IChhbmQgdGhlcmUgd291
bGQgbmVlZCB0byBiZSBmdXJ0aGVyIGp1c3RpZmljYXRpb24gZm9yIGV4cG9zaW5nCj4gdGhlbSBv
biBkZWJ1ZyBidWlsZHMsIHNob3VsZCB0aGlzIHF1ZXN0aW9uYWJsZSBiZWhhdmlvciAtIHNlZQo+
IGFib3ZlIC0gYmUgcmV0YWluZWQpLgoKSSBmaW5kIHRoYXQgZXhwbGljaXRseSBsaXN0aW5nIGFs
bCB0aGUgY2FzZXMgaXMgYmV0dGVyIGZvciBjb2RlCnJlYWRhYmlsaXR5LCBidXQgSSBkb24ndCBo
YXZlIGEgc3Ryb25nIG9waW5pb24gaGVyZS4KCi0tClRoYW5rcywKU2VyZ2V5CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
