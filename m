Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E59FB332
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 16:06:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUuAs-00034g-27; Wed, 13 Nov 2019 15:03:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZSCI=ZF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iUuAp-00034a-Tv
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 15:03:11 +0000
X-Inumbo-ID: b525c77c-0626-11ea-b678-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b525c77c-0626-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 15:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573657391;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=/wiUinn4NLDbvrn//1echXIZHtzGGlask09BwjFsuH0=;
 b=bhdomY1RpHFFHvzJxk4tEjw+NKtZI4pM8/fyUDWacduEApJ6SbZ0HIrE
 SWlvGPf+ffodOx6b7DsuOAlnJ5h3sRUwzeNuaj/3M8pgR3CLfWEyTCTGp
 Xu9NNBjTfcGQz2lET4wZjCdJFVruUiJFjtdOyPjcW6kK68iW5DDnv/QTW s=;
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
IronPort-SDR: wmfZ74pETGQ+nPDqFAlQfHwhQ8GgkuMBtzOe2c5cHtMlyMH9lyOikjCzzkWNwYfeXdJWP85Raz
 tMK33YmVkO7/02Rt1KbdeVrdlOhdHXCnkxBAG4N7f1lZ+Hb2iaH4d4O3YUoR8gvx1496Zw8Vej
 TWSjEc7P+Da/tEkN7hZe6Mu0q73ilkSQbDq2Q8P7qQJQSJKgdxFjQ15HGjSX46NnducNMqspnl
 SlLI7FEedrLWbUjPHsgzMC/+NIt526HaxDTSgsrZClN6vEnP44PO4pRMFr/iC95S6zc/t907sA
 tlU=
X-SBRS: 2.7
X-MesageID: 8679889
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,300,1569297600"; 
   d="scan'208";a="8679889"
To: Jan Beulich <jbeulich@suse.com>, osstest service owner
 <osstest-admin@xenproject.org>, <xen-devel@lists.xenproject.org>
References: <osstest-144059-mainreport@xen.org>
 <22a5f661-0b8a-45dd-3129-2be4a6c3764b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <cef6be72-ada7-c263-a109-305e6bc8b3c9@citrix.com>
Date: Wed, 13 Nov 2019 15:03:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <22a5f661-0b8a-45dd-3129-2be4a6c3764b@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [xen-4.12-testing test] 144059: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMTEvMjAxOSAxNDo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTMuMTEuMjAxOSAx
Mjo1NSwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+PiBmbGlnaHQgMTQ0MDU5IHhlbi00
LjEyLXRlc3RpbmcgcmVhbCBbcmVhbF0KPj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVj
dC5vcmcvb3NzdGVzdC9sb2dzLzE0NDA1OS8KPj4KPj4gUmVncmVzc2lvbnMgOi0oCj4+Cj4+IFRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+PiBpbmNsdWRpbmcg
dGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPj4gIHRlc3QtYW1kNjQtYW1kNjQtcWVtdXUt
bmVzdGVkLWludGVsIDE3IGRlYmlhbi1odm0taW5zdGFsbC9sMS9sMiBmYWlsIFJFR1IuIHZzLiAx
NDQwMzUKPiBGcm9tIGxvb2tpbmcgYXQgdGhpcyBzb21lIEkgZ2V0IHRoZSBpbXByZXNzaW9uIHRo
YXQgdGhlIEwyIGd1ZXN0Cj4gaXMgYnVzeS13YWl0aW5nIGluIGl0cyBib290IGxvYWRlci4gU2Vl
aW5nIHRoYXQgdGhlIHNhbWUgdGVzdAo+IGFsc28gZmFpbGVkIGZvciA0LjExLCBpdCBkb2Vzbid0
IHNlZW0gZW50aXJlbHkgaW1wb3NzaWJsZSB0aGF0Cj4gdGhlIGZpeGVzIGZvciB0aGUgdHdvIFhT
QXMgaGF2ZSBjYXVzZWQgYSByZWdyZXNzaW9uIGhlcmUuIEFueQo+IG90aGVyIHRob3VnaHRzIC8g
aW5zaWdodHMgYW55b25lPwoKT1NTVGVzdCBoYXMgbm8gaGFyZHdhcmUgd2hpY2ggaXMgaW1wYWN0
ZWQgYnkgMzA1LCBzbyBJJ20gZmFpcmx5CmNvbmZpZGVudCBydWxpbmcgdGhhdCBvdXQuwqAgKEZv
ciBhZmZlY3RlZCBoYXJkd2FyZSwgaXQgaXMgb25seSBib290LXRpbWUKY2hhbmdlcy4pCgooWEVO
KSBDUFUgVmVuZG9yOiBJbnRlbCwgRmFtaWx5IDYgKDB4NiksIE1vZGVsIDYwICgweDNjKSwgU3Rl
cHBpbmcgMwoocmF3IDAwMDMwNmMzKQoKVGhpcyBpcyBhIEhhc3dlbGwgYm94LCBzbyBpcyBpbXBh
Y3RlZCBieSAzMDQuwqAgKEl0cyBhY3R1YWxseSB0aGUgc2FtZQpDUFUgYXMgbXkgbWFpbiBkZXYg
Ym94IHNvIGhhcyBoYWQgYSAqbG90KiBvZiB0ZXN0aW5nIGluIHRoaXMgYXJlYS4uLikKCkwwIHJl
cG9ydHM6CgooWEVOKSBWTVg6IERpc2FibGluZyBleGVjdXRhYmxlIEVQVCBzdXBlcnBhZ2VzIGR1
ZSB0byBDVkUtMjAxOC0xMjIwNwoKYXMgZXhwZWN0ZWQuCgpMMSBzaG91bGQgZmluZCB0aGF0IGl0
IGlzIHZpcnR1YWxpc2VkIGFuZCB0dXJuIG9mZiB0aGUgbWl0aWdhdGlvbiwgYnV0CndlIGRvbid0
IGdldCB0aGF0IGZhciBkdXJpbmcgYm9vdC7CoCBJIGNhbid0IHNlZSBob3cgdGhlIG5lc3RlZC12
aXJ0CmFzcGVjdCB3b3VsZCBiZSByZWxldmFudCBhdCB0aGlzIHBvaW50LCBzbyBJIGNhbid0IHJl
YXNvbiBhYm91dCB3aGF0Cm1pZ2h0IGhhdmUgZ29uZSB3cm9uZy4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
