Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D36CFDFD3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:16:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVcMe-0003ha-I3; Fri, 15 Nov 2019 14:14:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qjfG=ZH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iVcMd-0003gn-Et
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:14:19 +0000
X-Inumbo-ID: 35f2bcac-07b2-11ea-a26f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35f2bcac-07b2-11ea-a26f-12813bfff9fa;
 Fri, 15 Nov 2019 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573827258;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=jWp6toQskf2wsfbDVK95vfLtEGoEjtIcvC8g5XBXBgg=;
 b=K0SbOB5elUvpmAtPN6FpZB3iP6xawgdF6X/mENjOPq2lFuJXCujMZSRq
 PDhh2jG264ATi7DXLDks71dcFU4EnDUzBucrQCUHqMeHTLPM1225VL6yL
 8rrPFwLznwLWSIVHm2i4HzDlqNUURogIxuiDYiNsXruSiACyNUrEwPHkq I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Z2+xnVWr9LbDaVeqs4KRs9VdPHovIEDZ3dkiMxdhQnSHlsmjCLpZoMcAzR35YKy8cv3T/ulRI3
 O9171TD8gYtSTNiVc4OpESuG5006H41WUK0InGRg/ZZ2o3/2YN1KOpiJhra0K39aPNqse3VE7f
 tSsYs/iBfKmUnV9YrkzS/sayVtDgPkyg/2glDw1bSiXgu7nVlZEcs3My80NXy3z2HelbTwy+Er
 ogLtvKJrJ7u9hBbFvo+nYxvlVO6kbL9RUCCrff96GSh0SGuTHo6wXJxsJB7fInCtyejO2A+Q6E
 UKc=
X-SBRS: 2.7
X-MesageID: 8383709
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8383709"
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <ec3be412-f0a1-6e04-ba62-5f27a06ab8ad@suse.com>
 <5751f0af-610b-a21d-9a6a-8c64e38140ac@citrix.com>
 <c1b1424f-382d-ffb3-6123-131312b2851c@suse.com>
 <607854b0-00a2-df11-d977-af6498050c40@citrix.com>
 <f9c4d160-1567-d622-e056-f61b7085198e@citrix.com>
 <b6bf2826-eb8f-4e3c-42ce-a9923d3af1c3@citrix.com>
 <380e865b-3092-6a85-0d77-dc99e33678e4@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <be1f75d1-7cdb-4beb-2486-61dc514739ce@citrix.com>
Date: Fri, 15 Nov 2019 14:14:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <380e865b-3092-6a85-0d77-dc99e33678e4@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 IanJackson <ian.jackson@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Andreas Kinzler <hfp@posteo.de>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMTEvMjAxOSAxNDoxMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNS8xOSAy
OjA2IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxNS8xMS8yMDE5IDE0OjA0LCBHZW9y
Z2UgRHVubGFwIHdyb3RlOgo+Pj4+PiBJdCdzIG5vdCBlbnRpcmVseSB1bmNvbW1vbiB0byAoYWxz
bykgY29uc2lkZXIgaG93IHRoZSByZXN1bHRpbmcKPj4+Pj4gZGlmZiB3b3VsZCBsb29rIGxpa2Ug
d2hlbiBwdXR0aW5nIHRvZ2V0aGVyIGEgY2hhbmdlLiBBbmQgYmVzaWRlcwo+Pj4+PiB0aGUgcmV2
aWV3IGFzcGVjdCwgdGhlcmUncyBhbHNvIHRoZSBhcmNoZW9sb2d5IG9uZSAtICJnaXQgYmxhbWUi
Cj4+Pj4+IHlpZWxkcyBtdWNoIG1vcmUgaGVscGZ1bCByZXN1bHRzIHdoZW4gY29kZSBkb2Vzbid0
IGdldCBtb3ZlZAo+Pj4+PiBhcm91bmQgbW9yZSB0aGFuIG5lY2Vzc2FyeS4gQnV0IHllcywgdGhl
cmUncyBubyB2ZXJ5IGNsZWFyICJ0aGlzCj4+Pj4+IGlzIHRoZSBiZXR0ZXIgb3B0aW9uIiBoZXJl
LiBJJ3ZlIHRha2VuIGFub3RoZXIgbG9vayBhdCB0aGUgY29kZQo+Pj4+PiBiZWZvcmUgeW91ciBj
aGFuZ2UgdGhvdWdoIC0gZXZlcnl0aGluZyBpcyBhbHJlYWR5IG5pY2VseSBpbiBvbmUKPj4+Pj4g
cGxhY2Ugd2l0aCBBbmRyZXcncyBtb3N0IHJlY2VudCBjb2RlIHJlb3JnLiBTbyBJJ20gbm93IGhh
dmluZyBhbgo+Pj4+PiBldmVuIGhhcmRlciB0aW1lIHNlZWluZyB3aHkgeW91IHdhbnQgdG8gbW92
ZSB0aGluZ3MgYXJvdW5kIGFnYWluLgo+Pj4+IFdlIGRvbid0LsKgIEkndmUgcmVjb21tZW5kIHR3
aWNlIG5vdyB0byBoYXZlIGEgc2luZ2xlICJlbHNlIGlmIiBodW5rCj4+Pj4gd2hpY2ggaXMgbmVh
cmx5IGVtcHR5LCBhbmQgbXVjaCBtb3JlIG9idmlvdXNseSBhIGdyb3NzICJtYWtlIGl0IHdvcmsg
Zm9yCj4+Pj4gNC4xMyIgYm9kZ2UuCj4+PiBUaGUgcmVzdWx0cyBhcmUgYSB0aW55IGJpdCBiZXR0
ZXIsIGJ1dCBub3QgbXVjaCByZWFsbHkgKHNlZSBhdHRhY2hlZCkuCj4+IFdoYXQgSSBtZWFudCB3
YXM6Cj4+Cj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgYi90b29s
cy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+Pj4gaW5kZXggMzEyYzQ4MWYxZS4uYmMwODhlNDVmMCAx
MDA2NDQKPj4+IC0tLSBhL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj4+PiArKysgYi90b29s
cy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+Pj4gQEAgLTU3OSw1MiArNTc5LDcxIEBAIGludCB4Y19j
cHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJmYWNlICp4Y2gsIHVpbnQzMl90IGRvbWlkLAo+Pj4g
ICAgICB9Cj4+IGVsc2UgaWYgKCBnZXRlbnYoKSApCj4+IHsKPj4gwqDCoMKgIC4uLgo+PiB9Cj4+
Cj4+PiAgICAgIGVsc2UKPj4+ICAgICAgewo+PiBXaXRoIG5vIGRlbHRhIHRvIHRoaXMgYmxvY2sg
YXQgYWxsLgo+IFRoZW4gd2UgaGF2ZSB0byBkdXBsaWNhdGUgdGhpcyBjb2RlIGluIGJvdGggYmxv
Y2tzOgo+Cj4gICAgICAgICAvKgo+ICAgICAgICAgICogVGhlc2Ugc2V0dGluZ3MgYXJlIG5lY2Vz
c2FyeSB0byBjYXVzZSBlYXJsaWVyCj4gSFZNX1BBUkFNX05FU1RFREhWTSAvCj4gICAgICAgICAg
KiBYRU5fRE9NQ1RMX2Rpc2FibGVfbWlncmF0ZSBzZXR0aW5ncyB0byBiZSByZWZsZWN0ZWQgY29y
cmVjdGx5IGluCj4gICAgICAgICAgKiBDUFVJRC4gIFhlbiB3aWxsIGRpc2NhcmQgdGhlc2UgYml0
cyBpZiBjb25maWd1cmF0aW9uIGhhc24ndCBiZWVuCj4gICAgICAgICAgKiBzZXQgZm9yIHRoZSBk
b21haW4uCj4gICAgICAgICAgKi8KPiAgICAgICAgIHAtPmV4dGQuaXRzYyA9IHRydWU7Cj4gICAg
ICAgICBwLT5iYXNpYy52bXggPSB0cnVlOwo+ICAgICAgICAgcC0+ZXh0ZC5zdm0gPSB0cnVlOwo+
Cj4gSSB3b24ndCBvYmplY3QgaWYgdGhhdCdzIHdoYXQgeW91IGd1eXMgcmVhbGx5IHdhbnQuCgpJ
J2QgYWxzbyBiZSBoYXBweSB3aXRoIGEgc2luZ2xlICJnb3RvIGh2bV9jb21tb247Ii7CoCBUaGVz
ZSB0d2Vha3MgYXJlCmFscmVhZHkgYXQgdGhlIGVuZCBvZiB0aGUgYmxvY2ssIHNvIHN1aXRhYmx5
IHBvc2l0aW9uZWQuCgpOb25lIG9mIHRoaXMgY29kZSBpcyBnb2luZyB0byBzdXJ2aXZlIGZvciBs
b25nLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
