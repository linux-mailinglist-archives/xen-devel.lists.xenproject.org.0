Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF26FDFCD
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:12:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVcIl-0003RL-VD; Fri, 15 Nov 2019 14:10:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bLue=ZH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iVcIk-0003RF-6G
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:10:18 +0000
X-Inumbo-ID: a66479cc-07b1-11ea-b678-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a66479cc-07b1-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 14:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573827018;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6yaJF8OEpVbK/jKkGnhiKgGYeKUbfOR62Soiqc5s7m8=;
 b=Vtm07164hTSTt5E/Zeg94F1iG4TNK2E+8Us4JH4bJK3AB7NxgXKyosvk
 kK1C96B/KVdnW+CA49XhKU8bipXjAf0gLPtsHe01QhpOY8/UFdFydhU9M
 DsX4N1rk+bCK0SRVkODM6kXLmoLvr//gR7n4CzXTc2oYUfcidvhl7P6X3 U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LiOsAmFZkhON8LVrB/ReXLpPgks13yYSCEMlJijRMMOYs0D2wFrb3tv4jfRb/VeHwH3PpHaPbt
 Y/WhIlAgZqoyTUzuEjn3xn8qrslgM3bsKfAin0mX6stegL6IhfpW0Mslyl/hh4cFKPjMvBgMS8
 UyeMdh+4DKDmyC5oRN0L2zSK6JVjWyTIBQcLHhRjlq0cO1D4ruIqs5X+WE8CQLj4tJa/4Cp6SK
 kP4gMSZlocWlLug6QT7HkCwgwjKOGxe7AePdPKSvwkR/XayIwtk9yGsTVpDjit3FFe1yOvSQ4z
 BJ8=
X-SBRS: 2.7
X-MesageID: 8385916
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8385916"
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <ec3be412-f0a1-6e04-ba62-5f27a06ab8ad@suse.com>
 <5751f0af-610b-a21d-9a6a-8c64e38140ac@citrix.com>
 <c1b1424f-382d-ffb3-6123-131312b2851c@suse.com>
 <607854b0-00a2-df11-d977-af6498050c40@citrix.com>
 <f9c4d160-1567-d622-e056-f61b7085198e@citrix.com>
 <b6bf2826-eb8f-4e3c-42ce-a9923d3af1c3@citrix.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <380e865b-3092-6a85-0d77-dc99e33678e4@citrix.com>
Date: Fri, 15 Nov 2019 14:10:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b6bf2826-eb8f-4e3c-42ce-a9923d3af1c3@citrix.com>
Content-Language: en-US
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

T24gMTEvMTUvMTkgMjowNiBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNS8xMS8yMDE5
IDE0OjA0LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4+IEl0J3Mgbm90IGVudGlyZWx5IHVuY29t
bW9uIHRvIChhbHNvKSBjb25zaWRlciBob3cgdGhlIHJlc3VsdGluZwo+Pj4+IGRpZmYgd291bGQg
bG9vayBsaWtlIHdoZW4gcHV0dGluZyB0b2dldGhlciBhIGNoYW5nZS4gQW5kIGJlc2lkZXMKPj4+
PiB0aGUgcmV2aWV3IGFzcGVjdCwgdGhlcmUncyBhbHNvIHRoZSBhcmNoZW9sb2d5IG9uZSAtICJn
aXQgYmxhbWUiCj4+Pj4geWllbGRzIG11Y2ggbW9yZSBoZWxwZnVsIHJlc3VsdHMgd2hlbiBjb2Rl
IGRvZXNuJ3QgZ2V0IG1vdmVkCj4+Pj4gYXJvdW5kIG1vcmUgdGhhbiBuZWNlc3NhcnkuIEJ1dCB5
ZXMsIHRoZXJlJ3Mgbm8gdmVyeSBjbGVhciAidGhpcwo+Pj4+IGlzIHRoZSBiZXR0ZXIgb3B0aW9u
IiBoZXJlLiBJJ3ZlIHRha2VuIGFub3RoZXIgbG9vayBhdCB0aGUgY29kZQo+Pj4+IGJlZm9yZSB5
b3VyIGNoYW5nZSB0aG91Z2ggLSBldmVyeXRoaW5nIGlzIGFscmVhZHkgbmljZWx5IGluIG9uZQo+
Pj4+IHBsYWNlIHdpdGggQW5kcmV3J3MgbW9zdCByZWNlbnQgY29kZSByZW9yZy4gU28gSSdtIG5v
dyBoYXZpbmcgYW4KPj4+PiBldmVuIGhhcmRlciB0aW1lIHNlZWluZyB3aHkgeW91IHdhbnQgdG8g
bW92ZSB0aGluZ3MgYXJvdW5kIGFnYWluLgo+Pj4gV2UgZG9uJ3QuwqAgSSd2ZSByZWNvbW1lbmQg
dHdpY2Ugbm93IHRvIGhhdmUgYSBzaW5nbGUgImVsc2UgaWYiIGh1bmsKPj4+IHdoaWNoIGlzIG5l
YXJseSBlbXB0eSwgYW5kIG11Y2ggbW9yZSBvYnZpb3VzbHkgYSBncm9zcyAibWFrZSBpdCB3b3Jr
IGZvcgo+Pj4gNC4xMyIgYm9kZ2UuCj4+IFRoZSByZXN1bHRzIGFyZSBhIHRpbnkgYml0IGJldHRl
ciwgYnV0IG5vdCBtdWNoIHJlYWxseSAoc2VlIGF0dGFjaGVkKS4KPiAKPiBXaGF0IEkgbWVhbnQg
d2FzOgo+IAo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgYi90b29s
cy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+PiBpbmRleCAzMTJjNDgxZjFlLi5iYzA4OGU0NWYwIDEw
MDY0NAo+PiAtLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+PiArKysgYi90b29scy9s
aWJ4Yy94Y19jcHVpZF94ODYuYwo+PiBAQCAtNTc5LDUyICs1NzksNzEgQEAgaW50IHhjX2NwdWlk
X2FwcGx5X3BvbGljeSh4Y19pbnRlcmZhY2UgKnhjaCwgdWludDMyX3QgZG9taWQsCj4+ICAgICAg
fQo+IAo+IGVsc2UgaWYgKCBnZXRlbnYoKSApCj4gewo+IMKgwqDCoCAuLi4KPiB9Cj4gCj4+ICAg
ICAgZWxzZQo+PiAgICAgIHsKPiAKPiBXaXRoIG5vIGRlbHRhIHRvIHRoaXMgYmxvY2sgYXQgYWxs
LgoKVGhlbiB3ZSBoYXZlIHRvIGR1cGxpY2F0ZSB0aGlzIGNvZGUgaW4gYm90aCBibG9ja3M6Cgog
ICAgICAgIC8qCiAgICAgICAgICogVGhlc2Ugc2V0dGluZ3MgYXJlIG5lY2Vzc2FyeSB0byBjYXVz
ZSBlYXJsaWVyCkhWTV9QQVJBTV9ORVNURURIVk0gLwogICAgICAgICAqIFhFTl9ET01DVExfZGlz
YWJsZV9taWdyYXRlIHNldHRpbmdzIHRvIGJlIHJlZmxlY3RlZCBjb3JyZWN0bHkgaW4KICAgICAg
ICAgKiBDUFVJRC4gIFhlbiB3aWxsIGRpc2NhcmQgdGhlc2UgYml0cyBpZiBjb25maWd1cmF0aW9u
IGhhc24ndCBiZWVuCiAgICAgICAgICogc2V0IGZvciB0aGUgZG9tYWluLgogICAgICAgICAqLwog
ICAgICAgIHAtPmV4dGQuaXRzYyA9IHRydWU7CiAgICAgICAgcC0+YmFzaWMudm14ID0gdHJ1ZTsK
ICAgICAgICBwLT5leHRkLnN2bSA9IHRydWU7CgpJIHdvbid0IG9iamVjdCBpZiB0aGF0J3Mgd2hh
dCB5b3UgZ3V5cyByZWFsbHkgd2FudC4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
