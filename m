Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B5A9A34A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 00:51:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0vtZ-0001bZ-4D; Thu, 22 Aug 2019 22:49:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6mJm=WS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i0vtW-0001bU-Pc
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 22:49:26 +0000
X-Inumbo-ID: 16dd54fa-c52f-11e9-951b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16dd54fa-c52f-11e9-951b-bc764e2007e4;
 Thu, 22 Aug 2019 22:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566514165;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hgWdd5OWK5oXYnKThxJ9dRwSpiJB5GZK60xnH7dD834=;
 b=Yzfe0f+s4qdPmqbduSg3gkFdqHSvq93Jwl31d1cUK6VvBSMnL7PID3CZ
 CSi6NT0QMTTKtAh80dmJtmt0ckla7Uj/hcca69Xi8g8zB0gyxSXm+CzRT
 sBJHeALYiEBNlLMHpOCVphVahkk+Pt7z3wekbr3u1MhxpHc9UP9FFusBo 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: W52U6GfDvZqwAmVOG/gZKzhNGStQUvy6xu/yS9I5Dl0Tb6whRdQvTzTgOO5RQUKaXDH0KWmZiJ
 ASbjQjl6GUEN1hmtd0nwqVP59RvtWoM2o7SUHSob8Zgj4wQC080+4v7aDfBRRM4FUFhaRBEFVU
 sS+Bdj9FUkmKEADWO1qzukozDa/TwDcYrDdDl4m859fEYZ4W0IOYaF9vVgwg7TnSKskDUqT7tx
 3QrEpo03Cd1IIfMfFybpqafy8VZ8Lc8eYxpB+ApNCouYlWXRiPE9ByeFZenPwPF4OQCseD8bg0
 Sv4=
X-SBRS: 2.7
X-MesageID: 4831409
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,418,1559534400"; 
   d="scan'208";a="4831409"
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <15a4c482-1207-1d8a-fd2a-dc4f25956c27@cs.rochester.edu>
 <79c7b71f-0b61-2799-4a79-644536a9c891@citrix.com>
 <d55da430-0d73-8a92-73e7-99e1aa70680c@cs.rochester.edu>
 <5b190182-4938-52b4-eeb2-df77224711c3@citrix.com>
 <CABfawh=DKeQoMoxJ-6sRozzybQm9TriHBmoyE1FeHh50fqiwRQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d6116312-aca1-2eb0-b630-62601d7e39d0@citrix.com>
Date: Thu, 22 Aug 2019 23:49:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABfawh=DKeQoMoxJ-6sRozzybQm9TriHBmoyE1FeHh50fqiwRQ@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] More questions about Xen memory layout/usage,
 access to guest memory
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Johnson,
 Ethan" <ejohns48@cs.rochester.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMDgvMjAxOSAxODozNiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4gSSd2ZSBmb3Vu
ZCBhIG51bWJlciBvZiBmaWxlcyBpbiB0aGUgWGVuIHNvdXJjZSB0cmVlIHdoaWNoIHNlZW0gdG8g
YmUKPj4+IHJlbGF0ZWQgdG8gaW5zdHJ1Y3Rpb24veDg2IHBsYXRmb3JtIGVtdWxhdGlvbjoKPj4+
Cj4+PiBhcmNoL3g4Ni94ODZfZW11bGF0ZS5jCj4+PiBhcmNoL3g4Ni9odm0vZW11bGF0ZS5jCj4+
PiBhcmNoL3g4Ni9odm0vdm14L3JlYWxtb2RlLmMKPj4+IGFyY2gveDg2L2h2bS9zdm0vZW11bGF0
ZS5jCj4+PiBhcmNoL3g4Ni9wdi9lbXVsYXRlLmMKPj4+IGFyY2gveDg2L3B2L2VtdWwtcHJpdi1v
cC5jCj4+PiBhcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4+Pgo+Pj4gVGhlIGxh
c3Qgb2YgdGhlc2UsIGluIHBhcnRpY3VsYXIsIGxvb2tzIGVzcGVjaWFsbHkgaGFpcnkgKGl0IHNl
ZW1zIHRvCj4+PiBzdXBwb3J0IGVtdWxhdGlvbiBvZiBlc3NlbnRpYWxseSB0aGUgZW50aXJlIHg4
NiBpbnN0cnVjdGlvbiBzZXQgdGhyb3VnaAo+Pj4gYSBxdWl0ZSBpbXByZXNzaXZlIGVkaWZpY2Ug
b2Ygc3dpdGNoIHN0YXRlbWVudHMpLgo+PiBMb3ZlbHksIGlzbid0IGl0LiAgRm9yIEludHJvc3Bl
Y3Rpb24sIHdlIG5lZWQgdG8gYmUgYWJsZSB0byBlbXVsYXRlIGFuCj4+IGluc3RydWN0aW9uIHdo
aWNoIHRvb2sgYSBwZXJtaXNzaW9uIGZhdWx0IChpbmNsdWRpbmcgTm8gRXhlY3V0ZSksIHdhcwo+
PiBzZW50IHRvIHRoZSBhbmFseXNpcyBlbmdpbmUsIGFuZCBkZWVtZWQgb2sgdG8gY29udGludWUu
Cj4gVGhhdCdzIG5vdCBhIHJlcXVpcmVtZW50IGZvciBpbnRyb3NwZWN0aW9uIGFuZCBJIGZpbmQg
dGhhdCBraW5kIG9mIHVzZQo+IG9mIHRoZSBlbXVsYXRpb24gdmVyeSBoYWlyeSwgZXNwZWNpYWxs
eSBmb3IgYW55dGhpbmcgc2VjdXJpdHkgcmVsYXRlZC4KPiBJTUhPIGl0J3Mgbm90aGluZyBtb3Jl
IHRoZW4gYSBjb252ZW5pZW50IGhhY2suCgpPayBmaW5lLsKgIEkgd2FzIHNwZWNpYWxpc2luZyB0
byB0aGUgZm9ybSBvZiBpbnRyb3NwZWN0aW9uIHRoYXQgSSBkZWFsCndpdGggcmVndWxhcmx5LsKg
IE5vdGhpbmcgaW4gdGhlIFhlbiBpbnRyb3NwZWN0aW9uIEFQSXMgZm9yY2VzIHlvdSB0bwp0YWtl
IGV4dHJhIGVtdWxhdGlvbi4KCkhvd2V2ZXIsIHdoZW4geW91J3JlIGRvaW5nIGEgcHJvcGVyIHBy
b2R1Y3QgYmFzZWQgb24gaXQsIGN1c3RvbWVycyBjYXJlCmFib3V0IGl0IG5vdCBiZWluZyB1bnVz
YWJsZSBzbG93LsKgIEluIG91ciBjYXNlLCB0aGF0IHJlbGllcyBvbiBub3QKZmFsbGluZyBiYWNr
IHRvIGNvbXBsZXRpbmcgaW5zdHJ1Y3Rpb25zIHVzaW5nIHRoZSAicGF1c2UgYWxsIG90aGVyCnZj
cHVzLCB1bnJlc3RyaWN0ZWQgcGVybWlzc2lvbnMsIHNpbmdsZXN0ZXAgdGhlIHZjcHUsIHJlc3Ry
aWN0wqAKcGVybWlzc2lvbnMgYWdhaW4iIGFwcHJvYWNoLgoKfkFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
