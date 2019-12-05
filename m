Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 331BB1140CC
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 13:25:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icq9F-0007Kz-4l; Thu, 05 Dec 2019 12:22:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7+lP=Z3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1icq9D-0007Ks-RW
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 12:22:19 +0000
X-Inumbo-ID: e133f0b6-1759-11ea-8223-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e133f0b6-1759-11ea-8223-12813bfff9fa;
 Thu, 05 Dec 2019 12:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575548539;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=WscgXcaGA0LBKHaF/jFGyfe90mPTw727QojOVbQvyCw=;
 b=QkTFa6Hvnr6lDnl0AjtHFQGKv9F/+UeC6Ied1rA02JoM/lz7H6g/0KVu
 iv5bVhZCcvGa7ArgBBcrn+VFeoOATx/zUHj9mtwjHarR+S9fcGdC6F7gY
 f2gbgQDAEOsF2pQP9Kt7TWN6lWSBmGLOwN6SgyL42br8YcCeUiZxyHUVc k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kKYMecT2M4Lqq5ZaXPey5pXklEv15s87XKc/B4Y9HNpuZLxpK9VHpoup3H2yrUjVQF6GJMj0EI
 ZD1IZbyqt5rods1pv8rh5z8rhm7Gim6heo9fDVQPCNKEUnL7JFTM/H5T4ax2IUfXChFmgg/gyD
 opJxZ18Rfme9rgrKmvOnJu3VAyfbaIWMm+BFG13jHPbVLHf8KkgBWf/B+KODrm57gz1R/kNLOm
 IZz4GJ0L3scgJQ3CffucOGCYYtciw6hx9D7mU7Db7JyMcVuls9J/cAJqDfLzEwM+LyHnCqwXne
 ZOI=
X-SBRS: 2.7
X-MesageID: 9596335
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,281,1571716800"; 
   d="scan'208";a="9596335"
From: George Dunlap <george.dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>, <xen-devel@lists.xenproject.org>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
 <938dbf7c3a083ec050c16729805f4ce5f3f2891f.1573840474.git.rosbrookn@ainfosec.com>
 <cabd32fd-7c1e-ad7a-c4ce-1ae716894746@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <d4061074-0825-d4ad-4ece-4da0d3c9049c@citrix.com>
Date: Thu, 5 Dec 2019 12:22:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cabd32fd-7c1e-ad7a-c4ce-1ae716894746@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 16/22] golang/xenlight: implement keyed
 union C to Go marshaling
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

T24gMTIvNC8xOSA2OjQwIFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDExLzE1LzE5IDc6
NDQgUE0sIE5pY2sgUm9zYnJvb2sgd3JvdGU6Cj4+IEZyb206IE5pY2sgUm9zYnJvb2sgPHJvc2Jy
b29rbkBhaW5mb3NlYy5jb20+Cj4+Cj4+IFN3aXRjaCBvdmVyIHVuaW9uIGtleSB0byBkZXRlcm1p
bmUgaG93IHRvIHBvcHVsYXRlICd1bmlvbicgaW4gR28gc3RydWN0Lgo+Pgo+PiBTaW5jZSB0aGUg
dW5pb25zIG9mIEMgdHlwZXMgY2Fubm90IGJlIGRpcmVjdGx5IGFjY2Vzc2VkLCBhZGQgQyBzdHJ1
Y3RzIGluCj4+IGNnbyBwcmVhbWJsZSB0byBhc3Npc3QgaW4gbWFyc2hhbGluZyBrZXllZCB1bmlv
bnMuIFRoaXMgYWxsb3dzIHRoZSBDCj4+IHR5cGUgZGVmaW5lZCBpbiB0aGUgcHJlYW1ibGUgdG8g
YmUgcG9wdWxhdGVkIGZpcnN0LCBhbmQgdGhlbiBhY2Nlc3NlZAo+PiBkaXJlY3RseSB0byBwb3B1
bGF0ZSB0aGUgR28gc3RydWN0Lgo+IAo+IEJsZWNoLiA6LSgKPiAKPj4gK2RlZiB4ZW5saWdodF9n
b2xhbmdfdW5pb25fZmllbGRzX2Zyb21fQyh0eSA9IE5vbmUpOgo+PiArICAgIHMgPSAnJwo+PiAr
Cj4+ICsgICAgZm9yIGYgaW4gdHkuZmllbGRzOgo+PiArICAgICAgICBnb3R5cGVuYW1lID0geGVu
bGlnaHRfZ29sYW5nX2ZtdF9uYW1lKGYudHlwZS50eXBlbmFtZSkKPj4gKyAgICAgICAgY3R5cGVu
YW1lICA9IGYudHlwZS50eXBlbmFtZQo+PiArICAgICAgICBnb2ZuYW1lICAgID0geGVubGlnaHRf
Z29sYW5nX2ZtdF9uYW1lKGYubmFtZSkKPj4gKyAgICAgICAgY2ZuYW1lICAgICA9IGYubmFtZQo+
PiArCj4+ICsgICAgICAgIGlzX2Nhc3RhYmxlID0gKGYudHlwZS5qc29uX3BhcnNlX3R5cGUgPT0g
J0pTT05fSU5URUdFUicgb3IKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaXNpbnN0YW5jZShm
LnR5cGUsIGlkbC5FbnVtZXJhdGlvbikgb3IKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290
eXBlbmFtZSBpbiBnb19idWlsdGluX3R5cGVzKQo+PiArCj4+ICsgICAgICAgIGlmIG5vdCBpc19j
YXN0YWJsZToKPj4gKyAgICAgICAgICAgIHMgKz0gJ2lmIGVyciA6PSB4Lnt9LmZyb21DKCZ0bXAu
e30pOycuZm9ybWF0KGdvZm5hbWUsY2ZuYW1lKQo+PiArICAgICAgICAgICAgcyArPSAnZXJyICE9
IG5pbCB7XG4gcmV0dXJuIGVyciBcbn1cbicKPj4gKwo+PiArICAgICAgICAjIFdlIGp1c3QgZGlk
IGFuIHVuc2FmZS5Qb2ludGVyIGNhc3QgZnJvbSBbXWJ5dGUgdG8gdGhlICd1bmlvbicgdHlwZQo+
PiArICAgICAgICAjIHN0cnVjdCwgc28gd2UgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBhbnkgc3Ry
aW5nIGZpZWxkcyBhcmUgYWN0dWFsbHkKPj4gKyAgICAgICAgIyBjb252ZXJ0ZWQgcHJvcGVybHku
Cj4+ICsgICAgICAgIGVsaWYgZ290eXBlbmFtZSA9PSAnc3RyaW5nJzoKPj4gKyAgICAgICAgICAg
IHMgKz0gJ3gue30gPSBDLkdvU3RyaW5nKHRtcC57fSlcbicuZm9ybWF0KGdvZm5hbWUsY2ZuYW1l
KQo+PiArCj4+ICsgICAgICAgIGVsc2U6Cj4+ICsgICAgICAgICAgICBzICs9ICd4Lnt9ID0ge30o
dG1wLnt9KVxuJy5mb3JtYXQoZ29mbmFtZSxnb3R5cGVuYW1lLGNmbmFtZSkKPiAKPiBJdCBsb29r
cyBsaWtlIHRoaXMgaXMgZHVwbGljYXRpbmcgKGRpZmZlcmVudGx5ISkgdGhlIGZpZWxkLWNvcHlp
bmcgY29kZQo+IGZyb20gZ29sYW5nX2RlZmluZV9mcm9tX0MuICBJcyB0aGVyZSBhbnkgcmVhc29u
IHlvdSBjb3VsZG4ndCBoYXZlIGEKPiBzaW5nbGUgZnVuY3Rpb24sIGB4ZW5saWdodF9nb2xhbmdf
ZmllbGRzX2Zyb21fQ2AsIHdoaWNoIHdvdWxkIGJlIHVzZWQKPiBmb3IgYm90aD8KPiAKPiAKPj4g
K3R5cGVkZWYgc3RydWN0IGxpYnhsX2NoYW5uZWxpbmZvX2Nvbm5lY3Rpb25fdW5pb25fcHR5IHsK
Pj4gKwljaGFyICogcGF0aDsKPj4gK30gbGlieGxfY2hhbm5lbGluZm9fY29ubmVjdGlvbl91bmlv
bl9wdHk7Cj4gCj4gSXQgd291bGQgYmUgbmljZSBpZiB0aGVyZSB3ZXJlIHNvbWUgd2F5IHdlIGNv
dWxkIHZlcmlmeSB0aGF0IHRoZQo+IHN0cnVjdHVyZXMgZ2VuZXJhdGVkIGhlcmUgbWF0Y2hlZCB0
aGUgQyB1bmlvbnMgZ2VuZXJhdGVkLiAgSXQgd291bGQKPiBzdGluayBwcmV0dHkgYmFkbHkgaWYg
dGhleSBkcmlmdGVkIGFuZCBub2JvZHkgbm90aWNlZCB1bnRpbCB3ZSBzdGFydGVkCj4gZ2V0dGlu
ZyB3ZWlyZCBlcnJvcnMuCj4gCj4gV2UgZG9uJ3QgaGF2ZSB0byBzb2x2ZSBpdCBub3csIGJ1dCBs
ZXQncyBwdXQgaXQgb24gdGhlIHRvLWRvIGxpc3QgYW5kCj4gaGF2ZSBhIHRoaW5rIGFib3V0IGl0
LgoKQWN0dWFsbHksIGl0IHR1cm5zIG91dCB3ZSBkb24ndCBzdHJpY3RseSBuZWVkIHRvIGR1cGxp
Y2F0ZSB0aGlzIGF0IGFsbCwKaWYgd2UgdXNlIHRoZSBgdHlwZW9mYCBvcGVyYXRvciwgbGlrZSB0
aGlzOgoKLS0tCnR5cGVkZWYgdHlwZW9mKCgoc3RydWN0IGxpYnhsX2NoYW5uZWxpbmZvICopTlVM
TCktPnUucHR5KQpsaWJ4bF9jaGFubmVsaW5mb19jb25uZWN0aW9uX3VuaW9uX3B0eTsKCnR5cGVk
ZWYgdHlwZW9mKCgoc3RydWN0IGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvICopTlVMTCktPnUuaHZt
KQpsaWJ4bF9kb21haW5fYnVpbGRfaW5mb190eXBlX3VuaW9uX2h2bTsKCnR5cGVkZWYgdHlwZW9m
KCgoc3RydWN0IGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvICopTlVMTCktPnUucHYpCmxpYnhsX2Rv
bWFpbl9idWlsZF9pbmZvX3R5cGVfdW5pb25fcHY7Cgp0eXBlZGVmIHR5cGVvZigoKHN0cnVjdCBs
aWJ4bF9kb21haW5fYnVpbGRfaW5mbyAqKU5VTEwpLT51LnB2aCkKbGlieGxfZG9tYWluX2J1aWxk
X2luZm9fdHlwZV91bmlvbl9wdmg7Cgp0eXBlZGVmIHR5cGVvZigoKHN0cnVjdCBsaWJ4bF9kZXZp
Y2VfdXNiZGV2ICopTlVMTCktPnUuaG9zdGRldikKbGlieGxfZGV2aWNlX3VzYmRldl90eXBlX3Vu
aW9uX2hvc3RkZXY7Cgp0eXBlZGVmIHR5cGVvZigoKHN0cnVjdCBsaWJ4bF9kZXZpY2VfY2hhbm5l
bCAqKU5VTEwpLT51LnNvY2tldCkKbGlieGxfZGV2aWNlX2NoYW5uZWxfY29ubmVjdGlvbl91bmlv
bl9zb2NrZXQ7Ci0tLQoKVGhpcyBndWFyYW50ZWVzIHdlJ2xsIGhhdmUgdGhlIGNvcnJlY3QgbGF5
b3V0IGZvciB0aGUgcmVzdWx0aW5nIHR5cGUuCgpJIHRhbGtlZCB0byBJYW4gSmFja3NvbiwgYW5k
IGhlIGFncmVlZCB0aGF0IGxvbmctdGVybSBpdCB3b3VsZCBiZSBnb29kCmZvciB0aGUgQyBnZW5l
cmF0b3IgdG8gZ2VuZXJhdGUgbmFtZWQgdHlwZXMgZm9yIHRoZXNlIHVuaW9uIGVsZW1lbnRzCihs
aWtrZSB5b3UgaGF2ZSBoZXJlKS4gIElmIHlvdSBmZWx0IHJlYWxseSBtb3RpdmF0ZWQgeW91IGNv
dWxkIGRvIHRoYXQKbm93OyBidXQgSSB0aGluayB1c2luZyB0aGUgYHR5cGVvZmAgdHJpY2sgd291
bGQgYmUgc3VpdGFibGUgdG8gZ2V0IHRoaXMKcGF0Y2ggaW4uCgogLUdlb3JnZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
