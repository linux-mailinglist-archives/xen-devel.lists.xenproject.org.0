Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0696B114392
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 16:30:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ict2h-0006h6-GO; Thu, 05 Dec 2019 15:27:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7+lP=Z3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ict2g-0006h1-FE
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 15:27:46 +0000
X-Inumbo-ID: c913ee22-1773-11ea-822b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c913ee22-1773-11ea-822b-12813bfff9fa;
 Thu, 05 Dec 2019 15:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575559665;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=P5rUpNHUvPBY7WAT0IYVmqwiO5kIekCcEiHIzIcb/rE=;
 b=bdnpNVxE5EaUNdK0/M1LEtmnd5TMukhGoX+Oe3oPte08HjdNq1SRPCTz
 zv3ANl+FhrdSWYCWTwepCHDepdAwmW19TsyZyTAhP7Bu2Q80rtvE5rOBn
 yZD2siZIWzA3saNq8G1ZBYLGsyb4iK5wWLnt4MzzRbNlOMufANea3RcIi c=;
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
IronPort-SDR: B1vsc/68TCsOziYkuEEEpCsYHKjgRTpknE/SeC5FkteBBM/+1OtUOwSLrsLchCWFOraC84bqqB
 uzBb7VGgoOGiLUzIDOTTkLPPtmcTCYENV5ZV6Z50tzU40K6YmEaySm9jabQEXLa3AUnn3BrrRK
 9BdBAeN5qTwHjucE/5z0FB5/qdz6L5rTAertoVHG7MkMyxpCH9OV+sQrz4ZJxwVMy45jADtivJ
 M0zA7ygNQx0KCq0KnDYLmUvreBirQLchpOUaCDTWbX5JXcESRc4GE6uVgaf0Qq6jd0u4s69jjL
 Egs=
X-SBRS: 2.7
X-MesageID: 9666835
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,281,1571716800"; 
   d="scan'208";a="9666835"
To: Nick Rosbrook <rosbrookn@gmail.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
 <1997f553223508247777fb47fce9af3f658c5d74.1573840474.git.rosbrookn@ainfosec.com>
 <a8c4717c-13cd-8061-56a9-006a9aea1913@citrix.com>
 <CAEBZRSf1CCByv_8xmcQwR=Kwr447WHfu1Sp_Kb=_OSjdDJP-hw@mail.gmail.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <85a30738-4c1b-3554-54a7-4f369b1cc2be@citrix.com>
Date: Thu, 5 Dec 2019 15:27:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAEBZRSf1CCByv_8xmcQwR=Kwr447WHfu1Sp_Kb=_OSjdDJP-hw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 02/22] golang/xenlight: define Defbool
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvNS8xOSAzOjIzIFBNLCBOaWNrIFJvc2Jyb29rIHdyb3RlOgo+PiBJIGltcGxlbWVudGVk
IHNvbWUgdGVzdHMgZm9yIHRoZXNlIG1ldGhvZHMgdG8gbWFrZSBzdXJlIGV2ZXJ5dGhpbmcKPj4g
d29ya2VkIGFzIGV4cGVjdGVkICh0aGV5IGRpZCk7IGJ1dCB0aGVyZSdzIGFuIHVuZXhwZWN0ZWQg
c2lkZS1lZmZlY3Q6Cj4+Cj4+IC0gICpfdGVzdC5nbyBmaWxlcyBjYW5ub3QgYGltcG9ydCAiQyJg
Cj4gCj4gWWVhaCwgdGhpcyBpcyB1bmZvcnR1bmF0ZS4KPiAKPj4gLSBUaGUgZnJvbUMgLyB0b0Mg
bWV0aG9kcyBhcmVuJ3QgZXhwb3J0ZWQKPj4KPj4gU28gaXQncyBub3QgcG9zc2libGUgdG8gZG8g
dGhlIGZvbGxvd2luZyBjaGVjazoKPj4KPj4gICB2YXIgYiBEZWZib29sCj4+Cj4+ICAgYi5TZXQo
dHJ1ZSkKPj4gICBjYiwgZXJyIDo9IGIudG9DKCkKPj4gICBpZiAoICFDLmxpYnhsX2RlZmJvb2xf
dmFsKGNiKSApIHsKPj4gICAgIC8vIHJlcG9ydCBhbiBlcnJvcgo+PiAgIH0KPj4KPj4gZGVmYm9v
bF90ZXN0LmdvIGNhbid0IGBpbXBvcnQgIkMiYCwgc28gaXQgY2FuJ3QgY2FsbAo+PiBDLmxpYnhs
X2RlZmJvb2xfdmFsKCkuICBXZSBjb3VsZCBtYWtlIGFuIGV4dGVybmFsIHhlbmxpZ2h0dGVzdCBw
YWNrYWdlLAo+PiBidXQgdGhhdCB3b3VsZG4ndCBiZSBhYmxlIHRvIGNhbGwgdG9DKCkuCj4+Cj4+
IChJIHN1cHBvc2Ugd2UgY291bGQgd3JpdGUgInByb3h5IiBmdW5jdGlvbnMgZm9yIGV2ZXJ5IHN1
Y2ggZnVuY3Rpb24gd2UKPj4gbWlnaHQgd2FudCB0byBjaGVjaywgYnV0IHRoYXQgc2VlbXMgZXhj
ZXNzaXZlLikKPiAKPiBJZiBieSAicHJveHkiIGZ1bmN0aW9ucyB5b3UgbWVhbiBzb21ldGhpbmcg
bGlrZToKPiAKPiBmdW5jIGxpYnhsRGVmYm9vbFZhbChkYiBEZWZib29sKSBib29sIHsKPiAgICAg
ICAgIHJldHVybiBDLmxpYnhsX2RlZmJvb2xfdmFsKEMubGlieGxfZGVmYm9vbChkYikpCj4gfQo+
IAo+IEkgYWdyZWUgaXQgY291bGQgYmUgYSBiaXQgZXhjZXNzaXZlLiBCdXQsIGl0IG1pZ2h0IGJl
IG5lY2Vzc2FyeSBpbgo+IG9yZGVyIHRvIGxldmVyYWdlIGdvIHRlc3QuIEFuZCwgd2UgY291bGQg
bWFrZSBzdXJlIHRoYXQgdGhvc2UgZXh0cmEKPiAicHJveHkiIGZ1bmN0aW9ucyBhcmUgb25seSBp
bmNsdWRlZCBpbiB0ZXN0IGJ1aWxkcyAobWF5YmUgYnkgbWFraW5nCj4gaW50ZXJuYWwgcGFja2Fn
ZSB0byBob3VzZSB0aGVtKS4KPiAKPiBNYXliZSB0aGVyZSBpcyBhIGJldHRlciBzb2x1dGlvbiB0
byB0aGlzLiBJJ2xsIG5lZWQgdG8gdGhpbmsgYWJvdXQgaXQgc29tZSBtb3JlLgoKSSBtZWFuLCB3
ZSBhbHJlYWR5IGNvcHkgdGhlIHNvdXJjZSBmaWxlcyBvdmVyIHNvbWV3aGVyZSBlbHNlLiAgV2Ug
Y291bGQKZ2VuZXJhdGUgY3Rlc3Rwcm94aWVzLmdvLCBhbmQgbWFrZSBhIHhlbmxpZ2h0dGVzdGFi
bGUgcGFja2FnZSB3aGljaAppbmNsdWRlcyB0aGF0IGZpbGUgKGFuZCB0aGUgX3Rlc3QuZ28gZmls
ZXMpLCBhbmQgYSB4ZW5saWdodCBwYWNrYWdlCndoaWNoIGRvZXNuJ3QuCgpCdXQgSSdkIHNheSB0
aGF0J3MgYSBsb3dlciBwcmlvcml0eSBhdCB0aGlzIHBvaW50LgoKIC1HZW9yZ2UKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
