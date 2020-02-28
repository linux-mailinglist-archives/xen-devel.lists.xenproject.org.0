Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C33C173FF3
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 19:53:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7kin-00041V-HB; Fri, 28 Feb 2020 18:50:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sa46=4Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j7kim-00041Q-C3
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 18:50:48 +0000
X-Inumbo-ID: 3b50a848-5a5b-11ea-9a04-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b50a848-5a5b-11ea-9a04-12813bfff9fa;
 Fri, 28 Feb 2020 18:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582915847;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=LVZ3hwVQ5OdklgIDdMBx5V0ryGCmAnkPYHO/qvBvKiE=;
 b=J264Hs0Hy8nTwjiwLdPqfzqPciX3RSwwjBqeeAXiHL4/s4zmod/wKjg/
 Sx4bin4XNiSPIq+4X/bqxG1z29yECD6Gwa3AQ2IAehuiMN4uGto6bPwJq
 SSWrYUdMr4kfFHmGePdQ+QSVS0SlhLsDsObA9U6a0sO/5cwC38uNJ2Vnn c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +fpH3ewMfsyF9LnO1D3uGt5nYiU4nTnj2P8hQBt8oXijaPJO4RfnldtCLoApCTAPOhHhb6CoxN
 KGiMKGkC0PgMyA2JXzFWXV2V2vKr9AneE0ReBOBi9wET1ahtrgXn1Cf2GX1v5mPtlRM6iHzgSn
 psiG/u0tOw4EwkGAkftYXUWbG2E+FUqSrHPQxQ4t4URrNfmbFRQMaLyua3Ux7R32XOYQTtyhKt
 kwc0pHX6+CcOLEdKVrYIMhOYMSwfkwxXhShpyJCos/3Rd5SF2j+MyK/bCG3iXxisgkJk2T5wVd
 YEc=
X-SBRS: 2.7
X-MesageID: 13620341
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,497,1574139600"; d="scan'208";a="13620341"
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-11-andrew.cooper3@citrix.com>
 <24148.2649.756710.728091@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6b8d1199-cd89-ca6c-719b-bb898842d542@citrix.com>
Date: Fri, 28 Feb 2020 18:50:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <24148.2649.756710.728091@mariner.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 10/17] tools/libxl: Plumb a restore
 boolean down into libxl__build_pre()
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQvMDIvMjAyMCAxNzozOSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gQW5kcmV3IENvb3BlciB3
cml0ZXMgKCJbUEFUQ0ggdjIgMTAvMTddIHRvb2xzL2xpYnhsOiBQbHVtYiBhIHJlc3RvcmUgYm9v
bGVhbiBkb3duIGludG8gbGlieGxfX2J1aWxkX3ByZSgpIik6Cj4+IFRvIGZpeCBDUFVJRCBoYW5k
bGluZywgbGlieGxfX2J1aWxkX3ByZSgpIGlzIGdvaW5nIHRvIGhhdmUgdG8gZGlzdGluZ3Vpc2gK
Pj4gYmV0d2VlbiBhIGJyYW5kIG5ldyBWTSB2cyBvbmUgd2hpY2ggaXMgYmVpbmcgbWlncmF0ZWQt
aW4vcmVzdW1lZC4KPiBUaGUgZGlzdGluY3Rpb24gYmV0d2VlbiBsaWJ4bF9fYnVpbGRfcHJlIGFu
ZCB0aGVzZSBvdGhlciBmdW5jdGlvbnMgaXMKPiBub3QgcGFydGljdWxhcmx5IHByaW5jaXBsZWQu
ICBJdCBpcyBhIGxlZ2FjeSBmcm9tIGFuIG9sZCBBUEkgKHByaW9yIHRvCj4gdGhlIGV4aXN0aW5j
ZSBvZiAqY3JlYXRlKSB3aGVyZSBsaWJ4bCBjYWxsZXJzIHdlcmUgZXhwZWN0ZWQgdG8gImJ1aWxk
Igo+IGEgZG9tYWluIGZpcnN0IGFuZCB0aGVuIGRvIG90aGVyIHRoaW5ncyB0byBpdC4KPgo+IE1h
eWJlIGl0IHdvdWxkIGJlIGJldHRlciB0byBwYXNzIHRoaXMgdmlhIGxpYnhsX19kb21haW5fYnVp
bGRfc3RhdGUKPiByYXRoZXIgdGhhbiBhcyBhbiBhZGRpdGlvbmFsIHBhcmFtZXRlciA/CgpXZWxs
IC0gSSB0cmllZCBhIHNpbWlsYXIgYXBwcm9hY2ggdGhlIGZpcnN0IHRpbWUgYXJvdW5kLCBhbmQg
aXQgYnJva2UKc3R1YmRvbXMgc28gYmFkbHkgaXQgbmVlZGVkIHJldmVydGluZy4KCihVbnRyaW0g
dGhlIGNvbW1pdCBkZXRhaWxzKQoKPiB2MjoKPiAgKiBOZXcuICBUaGlzIGlzIGMvcyBhYWNjMTQz
MDA2NCAidG9vbHMvbGlieGw6IFBsdW1iIGRvbWFpbl9jcmVhdGVfc3RhdGUgZG93bgo+ICAgIGlu
dG8gbGlieGxfX2J1aWxkX3ByZSgpIiB0YWtlLTIsIHdpdGhvdXQgYW55IGNvbGxhdGVyYWwgZGFt
YWdlIHRvIHN0dWJkb21zLgoKVGhlIGFjdHVhbCBpbmZvcm1hdGlvbiB3ZSB3YW50IGlzIGluIGxp
YnhsX19kb21haW5fY3JlYXRlX3N0YXRlCihzcGVjaWZpY2FsbHksIHJlc3RvcmVfZmQgPj0gLTEp
LsKgIEkgZmlyc3QgdHJpZWQgcGx1bWJpbmcgZGNzIGRvd24sIHRvCmF2b2lkIHN0YXNoaW5nIHRo
ZSBzYW1lIGluZm9ybWF0aW9uIGluIHR3byBkaWZmZXJlbnQgc3RydWN0dXJlcyBhdApkaWZmZXJl
bnQgdGltZXMuCgpTYWRseSwgcGx1bWJpbmcgZGNzIGRpZG4ndCB3b3JrIGJlY2F1c2UgaXQgaXMg
Y29tbW9uIGJldHdlZW4gdGhlIHJlYWwKZG9tYWluIGFuZCB0aGUgc3R1YmRvbSAoYW5kIHRoaXMg
bGVhZCB0byB0aGUgc3R1YmRvbSBnZXR0aW5nIG5vIHNldHRpbmdzCmF0IGFsbCkuwqAgV2hhdCB3
ZSB3YW50IHRvIGRvIGlzIG9ubHkgaW5mbHVlbmNlIHRoZSBDUFVJRCBjb25zdHJ1Y3Rpb24gb2YK
dGhlIG1haW4gZG9tYWluICh3aGljaCBtYXkgYmUgbWlncmF0aW5nIGluKSwgd2hlcmVhcyB0aGUg
c3R1YmRvbSBhbHdheXMKd2FudHMgZnJlc2ggc2V0dGluZ3MuCgpJIGNvdWxkIGR1cGxpY2F0ZSBp
dCBpbnRvIGRicywgYW5kIGF0IGEgZ3Vlc3MgdGhhdCB3b3VsZCBwcm9iYWJseSB3b3JrLApidXQg
aXNuJ3QgaXQgdGFraW5nIGEgYmFkIHByb2JsZW0gYW5kIG1ha2luZyBpdCB3b3JzZT8KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
