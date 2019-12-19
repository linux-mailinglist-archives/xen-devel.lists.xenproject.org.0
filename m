Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440FA126E4E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 20:59:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii1v7-0002b4-4W; Thu, 19 Dec 2019 19:57:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tNyU=2J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ii1v5-0002az-FC
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 19:57:11 +0000
X-Inumbo-ID: bdfc53ae-2299-11ea-927b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdfc53ae-2299-11ea-927b-12813bfff9fa;
 Thu, 19 Dec 2019 19:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576785431;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0+pnksLJl7m8zSGrgjy8EGNtLhJ+L0NgKNSMTOcwJvI=;
 b=cedX9hs7/VHEVi5S5qy3LSaHzHCpzFkX2w44LjcjeTBezq2bYYHN/a7y
 fFbOPqy7zIwZhoQfvzv9D7q45UR5M6LCOqgeD0YkVE9k4sCGwpBwRZo7h
 /NhH7zL2x2uXiTCgifhkpr7nqfeS/xNaKCbkSNmy4xhvbCZUt+V2JKRxR w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: e7O7RN5FaRk8YFjUYHpLjwwai7Iy0NIFJ1ZuLTNOaV4fAjjI9TGM5NfI+eHheY+P7tSVO1+pjW
 xsurSaJMVKpoKkEYZ6dDoQzfkkSFhonQD1JzYfqPLOAp+zWYmTYrk9lwI8mLqZ/jPnI91STEeT
 N5i5bld9Sm+xoiz01TAcx6bdkBvmD2SMsvyxwLOU7PvE2sNxb+Q4xRaxWfCD/VILMN07VAfvDo
 +j1hZiyBZRXR4mWphJyBzhfK3VKAp0IXRYZNp5Oqj6hlQWNWir2sq+bN1J/gVddZV3KD5CxO5p
 aHA=
X-SBRS: 2.7
X-MesageID: 10104029
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,333,1571716800"; d="scan'208";a="10104029"
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <04757755-7464-07d6-9a0f-14f78f20bb4d@citrix.com>
 <CABfawhkaLMX9aM0dFP1M7foRUa9fi7ZaoQwXpw0ZXAcjVmYsuw@mail.gmail.com>
 <19a06020-924b-be4c-8015-2093cc8d1a33@citrix.com>
 <CABfawhm_MjH=AgGjqT-EFPS=q=+6TMrnm50Aq_KX-2Wa815qeA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ddd7220d-bbea-c7da-62c3-a82ba5a69744@citrix.com>
Date: Thu, 19 Dec 2019 19:57:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CABfawhm_MjH=AgGjqT-EFPS=q=+6TMrnm50Aq_KX-2Wa815qeA@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMTIvMjAxOSAxOTo0OSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFRodSwgRGVj
IDE5LCAyMDE5IGF0IDEyOjQxIFBNIEFuZHJldyBDb29wZXIKPiA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDE5LzEyLzIwMTkgMTk6MzgsIFRhbWFzIEsgTGVuZ3llbCB3
cm90ZToKPj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKPj4+Pj4gKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKPj4+Pj4gQEAgLTMzNSw2ICszMzUsMTAg
QEAgdW5zaWduZWQgbG9uZyBodm1fY3I0X2d1ZXN0X3ZhbGlkX2JpdHMoY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCwgYm9vbCByZXN0b3JlKTsKPj4+Pj4gIGJvb2wgaHZtX2ZsdXNoX3ZjcHVfdGxiKGJv
b2wgKCpmbHVzaF92Y3B1KSh2b2lkICpjdHh0LCBzdHJ1Y3QgdmNwdSAqdiksCj4+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICB2b2lkICpjdHh0KTsKPj4+Pj4KPj4+Pj4gKy8qIENhbGxlciBt
dXN0IGhvbGQgZG9tYWluIGxvY2tzICovCj4+Pj4gSG93IGFib3V0IGFzc2VydGluZyBzbz8KPj4+
IEFGQUlDVCB0aGVyZSBpcyBubyAiZG9tYWluX2xvY2tlZF9ieV9tZSIgZnVuY3Rpb24sIG9ubHkK
Pj4+IHBhZ2luZy9wMm0vZ2ZuX2xvY2tlZF9ieV9tZS4gU28gYW55IHN1Z2dlc3Rpb24gb24gaG93
IHRvIGFjaGlldmUgdGhhdD8KPj4gc3Bpbl9pc19sb2NrZWQoKSBnZXRzIHlvdSBtb3N0IG9mIHRo
ZSB3YXksIGFuZCB3b3VsZCBiZSBhIHN0YXJ0Lgo+Pgo+PiBCdXQgeWVzIC0gbm93IHlvdSBzYXkg
dGhpcywgSSByZW1lbWJlciB0aGF0IHdlIGRvbid0IGN1cnJlbnRseSBoYXZlCj4+IHN1aXRhYmxl
IGluZnJhc3RydWN0dXJlLgo+IElzIHRoZSBkb21haW4gbG9jayBldmVuIGEgc3BpbiBsb2NrICh0
aGUgb24geW91IHVzZSBieQo+IHJjdV9sb2NrX2xpdmVfcmVtb3RlX2RvbWFpbl9ieV9pZCk/IExv
b2tzIHRvIG1lIGl0IGp1c3QgZ29lcyBkb3duIHRvCj4gInJjdV9yZWFkX2xvY2siIHdoaWNoIG9u
bHkgZG9lcyBhIHByZWVtcHRfZGlzYWJsZSgpIGNhbGwgby5PCgovc2lnaCAtIG9mIGNvdXJzZSB3
ZSBoYXZlIHR3byB0aGluZ3MgY2FsbGVkIHRoZSBkb21haW4gbG9jay4KClRoZSBSQ1Ugb25lIGlz
IHRvIGVuc3VyZSB0aGF0IHRoZSBzdHJ1Y3QgZG9tYWluIGNhbid0IGdldCBmcmVlZCBiZWhpbmQK
b3VyIGJhY2ssIGFuZCBzaG91bGRuJ3QgYmUgaW50ZXJlc3RpbmcgaW4gdGhpcyBjb250ZXh0IChv
YnRhaW5pbmcgdGhlIGQKcG9pbnRlciBpbiB0aGUgZmlyc3QgcGxhY2UgY2F1c2VzIGl0IHRvIGJl
IHNhZmUpLsKgIElmIHRoYXQgaXMgdGhlIG9ubHkKb25lIHdoaWNoIG1hdHRlcnMsIEkgd291bGQg
ZHJvcCB0aGUgY29tbWVudC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
