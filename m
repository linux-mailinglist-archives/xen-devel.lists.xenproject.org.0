Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D4FB4F0
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 17:23:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUvNk-0002vJ-OV; Wed, 13 Nov 2019 16:20:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4DYf=ZF=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iUvNi-0002vE-La
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 16:20:34 +0000
X-Inumbo-ID: 842aeea8-0631-11ea-adbe-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 842aeea8-0631-11ea-adbe-bc764e2007e4;
 Wed, 13 Nov 2019 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573662034;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=btjFEEsGADTRq6pwYY1pIbDwxX+k+y3/KKkdLpgxkL0=;
 b=Kw1izv1ujIQ0IpLEt1BSmx6nS1VyB8vL71QLzVedOsUi+0vtXH5o25BX
 U/Cow1VEc8En+JPLQPDUbgA7P5uRX3mvnXRo5ZRHS5CJ6ToqfT6zdp9di
 atTrfx/I0MgGIuK+AcW+P8MdHsbVQWrsu0kEnUgYvkRXHDaliO/KGm0Yt M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gAlsaSPKoPKtZNz+5+Sn4MyBB/94dMx6sBT8htMqSqOhfySsLDtl/hSWN6owj01OZ2ADVmrdIj
 GyiNVWetSbqppR5LdidVjZK/aJmn++8vSzbpfY6B73vDydMt8aVSxPpPzd8jO2BSos23jztvTv
 Ljtuov0BeOE9xhZsZiXHICuqHjma4AZ1vHzsDOR7irnXyngzfYW5zkySUMM0i+Oz82TWUvZiGH
 pA7NNKi3mqlCJaXGQP2KmqY2kr+CEPthqAu7rpTtlps1coLIaIJQKvipvYYPHv0V7U/x94+Q3x
 PjY=
X-SBRS: 2.7
X-MesageID: 8385336
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,300,1569297600"; 
   d="scan'208";a="8385336"
To: Nick Rosbrook <rosbrookn@gmail.com>, <xen-devel@lists.xenproject.org>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <87f082bdf06e820e911256138a7380d0cf7019a2.1570456846.git.rosbrookn@ainfosec.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <e0c2d27a-8816-597a-fdc9-b3e10a2abdf9@citrix.com>
Date: Wed, 13 Nov 2019 16:20:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87f082bdf06e820e911256138a7380d0cf7019a2.1570456846.git.rosbrookn@ainfosec.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/24] golang/xenlight: define MsVmGenid
 builtin type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvNy8xOSA0OjEyIFBNLCBOaWNrIFJvc2Jyb29rIHdyb3RlOgo+IEZyb206IE5pY2sgUm9z
YnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+Cj4gCj4gRGVmaW5lIE1zVm1HZW5pZCBhcyBb
aW50KEMuTElCWExfTVNfVk1fR0VOSURfTEVOKV1ieXRlIGFuZCBpbXBsZW1lbnQgZnJvbUMgYW5k
IHRvQyBmdW5jdGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmljayBSb3Nicm9vayA8cm9zYnJv
b2tuQGFpbmZvc2VjLmNvbT4KPiAtLS0KPiBDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxh
cEBjaXRyaXguY29tPgo+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiAKPiAgdG9vbHMvZ29sYW5nL3hlbmxpZ2h0
L3hlbmxpZ2h0LmdvIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDIzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hlbmxp
Z2h0L3hlbmxpZ2h0LmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCj4gaW5k
ZXggM2I3ODI0YjI4NC4uNmFjYTViODljMCAxMDA2NDQKPiAtLS0gYS90b29scy9nb2xhbmcveGVu
bGlnaHQveGVubGlnaHQuZ28KPiArKysgYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQu
Z28KPiBAQCAtMjE2LDYgKzIxNiwyOSBAQCBmdW5jIChtYWMgKk1hYykgdG9DKCkgKEMubGlieGxf
bWFjLCBlcnJvcikgewo+ICAJcmV0dXJuIGNtYWMsIG5pbAo+ICB9Cj4gIAo+ICsvLyBNc1ZtR2Vu
aWQgcmVwcmVzZW50cyBhIGxpYnhsX21zX3ZtX2dlbmlkLgo+ICt0eXBlIE1zVm1HZW5pZCBbaW50
KEMuTElCWExfTVNfVk1fR0VOSURfTEVOKV1ieXRlCj4gKwo+ICtmdW5jIChtdmcgKk1zVm1HZW5p
ZCkgZnJvbUMoY212ZyAqQy5saWJ4bF9tc192bV9nZW5pZCkgZXJyb3Igewo+ICsJYiA6PSAoKltp
bnQoQy5MSUJYTF9NU19WTV9HRU5JRF9MRU4pXUMudWludDhfdCkodW5zYWZlLlBvaW50ZXIoJmNt
dmcuYnl0ZXNbMF0pKQo+ICsKPiArCWZvciBpLCB2IDo9IHJhbmdlIGIgewo+ICsJCW12Z1tpXSA9
IGJ5dGUodikKPiArCX0KCkl0J3Mgc2xpZ2h0bHkgYW5ub3lpbmcgdG8gaGF2ZSB0byBkbyB0aGlz
IGxvb3AsIGJ1dCBJIGd1ZXNzIGdpdmVuIHRoYXQKd2UgaGF2ZSB0byB0ZWNobmljYWxseSBjYXN0
IGVhY2ggZWxlbWVudCBvZiB0aGUgYXJyYXkuICBIb3BlZnVsbHkgdGhlCmNvbXBpbGVyIHdpbGwg
ZXZlbnR1YWxseSBiZSBhYmxlIHRvIGZpZ3VyZSBvdXQgd2hhdCdzIGdvaW5nIG9uIGhlcmUgYW5k
Cmp1c3QgZG8gYSBtZW1jcHkuCgo+ICsKPiArCXJldHVybiBuaWwKPiArfQo+ICsKPiArZnVuYyAo
bXZnICpNc1ZtR2VuaWQpIHRvQygpIChDLmxpYnhsX21zX3ZtX2dlbmlkLCBlcnJvcikgewoKSG1t
LCBJIGd1ZXNzIHdlIHdhbnQgYSBwb2ludGVyIHJlY2VpdmVyIGhlcmUgdG8gbWFrZSBzdXJlIHdl
IGRvbid0IGVuZAp1cCBkb2luZyBhIDE2LWJ5dGUgY29weS4KClJldmlld2VkLWJ5OiBHZW9yZ2Ug
RHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgogLUdlb3JnZQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
