Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1469CFE0B3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:58:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVd0l-0000hu-FP; Fri, 15 Nov 2019 14:55:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bLue=ZH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iVd0k-0000hp-EA
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:55:46 +0000
X-Inumbo-ID: 002e594a-07b8-11ea-9631-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 002e594a-07b8-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 14:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573829745;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=TOWdpwcd+lJCwyyuBppjVEW0L5aLhAGQK2zNyKTLBmM=;
 b=FYoC+vFPQKralMlJkkBQZ+UI7+bYTdhCPw7+15SaLPR4KrmBoCYTTwFw
 QhGr2LANqncIEHk5TSXMnbDxbvDN8vnahK7j2m3LkAOzLEPlDKWwpbb+R
 hHtrZ8RH0jOlc4lUGARS58V7NqaDIcaKhRmMt+uPeYcUqcGJw4dxgQ7qV E=;
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
IronPort-SDR: 8r0vQ2E06GhdUMuXElwn0gQbbg9HYeI4w5rc9fUZUrMNVv/ms5LqoPt8SLV8P6Uounme39dpm2
 5GtM3PfAA8oLDfYGTGlaR5fvZj7y/BaVdN0Rt+eDUIyjs6XkW5dEIqTNfj9cyW921O66hmoABw
 RDmkp9biuDjZPTOd3dKGTvTp9Zr3VqWJCsUfG/IXnP1BE8V0QIfPfYZfTEYWY+/WELVlpERod/
 UVH34G+gQNrqP1mdEbbK2GpjTPoKjYD0FjSlGRqHkfBgGMctcYFR+tatpiE6Y/RvsVUs6iIt0S
 tt8=
X-SBRS: 2.7
X-MesageID: 8388939
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8388939"
To: Jan Beulich <jbeulich@suse.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <ec3be412-f0a1-6e04-ba62-5f27a06ab8ad@suse.com>
 <5751f0af-610b-a21d-9a6a-8c64e38140ac@citrix.com>
 <c1b1424f-382d-ffb3-6123-131312b2851c@suse.com>
 <607854b0-00a2-df11-d977-af6498050c40@citrix.com>
 <f9c4d160-1567-d622-e056-f61b7085198e@citrix.com>
 <b6bf2826-eb8f-4e3c-42ce-a9923d3af1c3@citrix.com>
 <380e865b-3092-6a85-0d77-dc99e33678e4@citrix.com>
 <0f27d518-e6c4-a728-e59d-237acc92d493@suse.com>
 <0ec711d3-90d4-5fa0-7f16-8bf1ac8dc0ca@citrix.com>
 <f6c3a7dc-e42f-36ab-7905-75e34c5158bf@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <69319c0a-b064-5cb9-664c-7e7fe7eb1c3e@citrix.com>
Date: Fri, 15 Nov 2019 14:55:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f6c3a7dc-e42f-36ab-7905-75e34c5158bf@suse.com>
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
Cc: Steven Haigh <netwiz@crc.id.au>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Andreas Kinzler <hfp@posteo.de>, IanJackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTUvMTkgMjo0MiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTUuMTEuMjAxOSAx
NToyOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMTEvMTUvMTkgMjoxOCBQTSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxNS4xMS4yMDE5IDE1OjEwLCBHZW9yZ2UgRHVubGFwIHdyb3Rl
Ogo+Pj4+IE9uIDExLzE1LzE5IDI6MDYgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IE9u
IDE1LzExLzIwMTkgMTQ6MDQsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+Pj4+Pj4+IEl0J3Mgbm90
IGVudGlyZWx5IHVuY29tbW9uIHRvIChhbHNvKSBjb25zaWRlciBob3cgdGhlIHJlc3VsdGluZwo+
Pj4+Pj4+PiBkaWZmIHdvdWxkIGxvb2sgbGlrZSB3aGVuIHB1dHRpbmcgdG9nZXRoZXIgYSBjaGFu
Z2UuIEFuZCBiZXNpZGVzCj4+Pj4+Pj4+IHRoZSByZXZpZXcgYXNwZWN0LCB0aGVyZSdzIGFsc28g
dGhlIGFyY2hlb2xvZ3kgb25lIC0gImdpdCBibGFtZSIKPj4+Pj4+Pj4geWllbGRzIG11Y2ggbW9y
ZSBoZWxwZnVsIHJlc3VsdHMgd2hlbiBjb2RlIGRvZXNuJ3QgZ2V0IG1vdmVkCj4+Pj4+Pj4+IGFy
b3VuZCBtb3JlIHRoYW4gbmVjZXNzYXJ5LiBCdXQgeWVzLCB0aGVyZSdzIG5vIHZlcnkgY2xlYXIg
InRoaXMKPj4+Pj4+Pj4gaXMgdGhlIGJldHRlciBvcHRpb24iIGhlcmUuIEkndmUgdGFrZW4gYW5v
dGhlciBsb29rIGF0IHRoZSBjb2RlCj4+Pj4+Pj4+IGJlZm9yZSB5b3VyIGNoYW5nZSB0aG91Z2gg
LSBldmVyeXRoaW5nIGlzIGFscmVhZHkgbmljZWx5IGluIG9uZQo+Pj4+Pj4+PiBwbGFjZSB3aXRo
IEFuZHJldydzIG1vc3QgcmVjZW50IGNvZGUgcmVvcmcuIFNvIEknbSBub3cgaGF2aW5nIGFuCj4+
Pj4+Pj4+IGV2ZW4gaGFyZGVyIHRpbWUgc2VlaW5nIHdoeSB5b3Ugd2FudCB0byBtb3ZlIHRoaW5n
cyBhcm91bmQgYWdhaW4uCj4+Pj4+Pj4gV2UgZG9uJ3QuwqAgSSd2ZSByZWNvbW1lbmQgdHdpY2Ug
bm93IHRvIGhhdmUgYSBzaW5nbGUgImVsc2UgaWYiIGh1bmsKPj4+Pj4+PiB3aGljaCBpcyBuZWFy
bHkgZW1wdHksIGFuZCBtdWNoIG1vcmUgb2J2aW91c2x5IGEgZ3Jvc3MgIm1ha2UgaXQgd29yayBm
b3IKPj4+Pj4+PiA0LjEzIiBib2RnZS4KPj4+Pj4+IFRoZSByZXN1bHRzIGFyZSBhIHRpbnkgYml0
IGJldHRlciwgYnV0IG5vdCBtdWNoIHJlYWxseSAoc2VlIGF0dGFjaGVkKS4KPj4+Pj4KPj4+Pj4g
V2hhdCBJIG1lYW50IHdhczoKPj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94
Y19jcHVpZF94ODYuYyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj4+Pj4+PiBpbmRleCAz
MTJjNDgxZjFlLi5iYzA4OGU0NWYwIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvdG9vbHMvbGlieGMveGNf
Y3B1aWRfeDg2LmMKPj4+Pj4+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj4+Pj4+
PiBAQCAtNTc5LDUyICs1NzksNzEgQEAgaW50IHhjX2NwdWlkX2FwcGx5X3BvbGljeSh4Y19pbnRl
cmZhY2UgKnhjaCwgdWludDMyX3QgZG9taWQsCj4+Pj4+PiAgICAgIH0KPj4+Pj4KPj4+Pj4gZWxz
ZSBpZiAoIGdldGVudigpICkKPj4+Pj4gewo+Pj4+PiDCoMKgwqAgLi4uCj4+Pj4+IH0KPj4+Pj4K
Pj4+Pj4+ICAgICAgZWxzZQo+Pj4+Pj4gICAgICB7Cj4+Pj4+Cj4+Pj4+IFdpdGggbm8gZGVsdGEg
dG8gdGhpcyBibG9jayBhdCBhbGwuCj4+Pj4KPj4+PiBUaGVuIHdlIGhhdmUgdG8gZHVwbGljYXRl
IHRoaXMgY29kZSBpbiBib3RoIGJsb2NrczoKPj4+Pgo+Pj4+ICAgICAgICAgLyoKPj4+PiAgICAg
ICAgICAqIFRoZXNlIHNldHRpbmdzIGFyZSBuZWNlc3NhcnkgdG8gY2F1c2UgZWFybGllcgo+Pj4+
IEhWTV9QQVJBTV9ORVNURURIVk0gLwo+Pj4+ICAgICAgICAgICogWEVOX0RPTUNUTF9kaXNhYmxl
X21pZ3JhdGUgc2V0dGluZ3MgdG8gYmUgcmVmbGVjdGVkIGNvcnJlY3RseSBpbgo+Pj4+ICAgICAg
ICAgICogQ1BVSUQuICBYZW4gd2lsbCBkaXNjYXJkIHRoZXNlIGJpdHMgaWYgY29uZmlndXJhdGlv
biBoYXNuJ3QgYmVlbgo+Pj4+ICAgICAgICAgICogc2V0IGZvciB0aGUgZG9tYWluLgo+Pj4+ICAg
ICAgICAgICovCj4+Pj4gICAgICAgICBwLT5leHRkLml0c2MgPSB0cnVlOwo+Pj4+ICAgICAgICAg
cC0+YmFzaWMudm14ID0gdHJ1ZTsKPj4+PiAgICAgICAgIHAtPmV4dGQuc3ZtID0gdHJ1ZTsKPj4+
Pgo+Pj4+IEkgd29uJ3Qgb2JqZWN0IGlmIHRoYXQncyB3aGF0IHlvdSBndXlzIHJlYWxseSB3YW50
Lgo+Pj4KPj4+IFBlcnNvbmFsbHkgSSB0aGluayB0aGUgZHVwbGljYXRpb24gaXMgbGVzcyBiYWQg
dGhhbiB0aGUgZmFyCj4+PiBoZWF2aWVyIG9yaWdpbmFsIGNvZGUgY2h1cm4sIGJ1dCB0byBiZSBo
b25lc3QsIGVzcGVjaWFsbHkgd2l0aAo+Pj4gdGhpcyBpbnRlbmRlZCB0byBnbyBhd2F5IGFnYWlu
IHNvb24gYW55d2F5LCBJJ2Qgbm90IGJlIG9wcG9zZWQKPj4+IGF0IGFsbCB0bwo+Pj4KPj4+ICAg
ICAuLi4KPj4+ICAgICBlbHNlIGlmICggZ2V0ZW52KCkgKQo+Pj4gICAgICAgICBnb3RvIG5vX2Zh
a2VfaHQ7Cj4+Cj4+IFRoaXMgaXNuJ3QgY29ycmVjdCwgYmVjYXVzZSB5b3UgZG8gbmVlZCB0byBj
bGVhciBodHQgYW5kIGNtcF9sZWdhY3ksIGFzCj4+IHdlbGwgYXMgemVyb2luZyBvdXQgY29yZXNf
cGVyX3BhY2thZ2UgYW5kIHRocmVhZHNfcGVyX2NhY2hlIG9uIEludGVsLgo+PiAoQXQgbGVhc3Qs
IHRoYXQncyB3aGF0IFhlblNlcnZlcidzIHBhdGNoIGRvZXMsIGFuZCBpdCdzIHRoZSBiZXN0IHRl
c3RlZC4pCj4+Cj4+PiAgICAgZWxzZQo+Pj4gICAgIHsKPj4+ICAgICAuLi4KPj4+ICBub19mYWtl
X2h0Ogo+Pj4gICAgICAgICAvKgo+Pj4gICAgICAgICAgKiBUaGVzZSBzZXR0aW5ncyBhcmUgbmVj
ZXNzYXJ5IHRvIGNhdXNlIGVhcmxpZXIgSFZNX1BBUkFNX05FU1RFREhWTSAvCj4+PiAgICAgICAg
ICAqIFhFTl9ET01DVExfZGlzYWJsZV9taWdyYXRlIHNldHRpbmdzIHRvIGJlIHJlZmxlY3RlZCBj
b3JyZWN0bHkgaW4KPj4+ICAgICAgICAgICogQ1BVSUQuICBYZW4gd2lsbCBkaXNjYXJkIHRoZXNl
IGJpdHMgaWYgY29uZmlndXJhdGlvbiBoYXNuJ3QgYmVlbgo+Pj4gICAgICAgICAgKiBzZXQgZm9y
IHRoZSBkb21haW4uCj4+PiAgICAgICAgICAqLwo+Pj4gICAgICAgICBwLT5leHRkLml0c2MgPSB0
cnVlOwo+Pj4gICAgICAgICBwLT5iYXNpYy52bXggPSB0cnVlOwo+Pj4gICAgICAgICBwLT5leHRk
LnN2bSA9IHRydWU7Cj4+PiAgICAgfQo+Pj4KPj4+IChkZXNwaXRlIG15IGdlbmVyYWwgZGlzbGlr
ZSBvZiBnb3RvKS4KPj4KPj4gV2VsbCBJIHRoaW5rIGdvdG9zIGludG8gb3RoZXIgYmxvY2tzIGlz
IGV2ZW4gd29yc2UuIDotKQo+Pgo+PiBJIHRoaW5rIHRoZSByZXN1bHQgaXMgYSBsb3QgbmljZXIg
dG8gcmV2aWV3IGZvciBzdXJlLgo+IAo+IFRyeWluZyB0byBjb21tZW50IGRlc3BpdGUgdGhpcyBo
YXZpbmcgYmVlbiBhbiBhdHRhY2htZW50Ogo+IAo+PiAtLS0gYS90b29scy9saWJ4Yy94Y19jcHVp
ZF94ODYuYwo+PiArKysgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+PiBAQCAtNTc5LDYg
KzU3OSwyNiBAQCBpbnQgeGNfY3B1aWRfYXBwbHlfcG9saWN5KHhjX2ludGVyZmFjZSAqeGNoLCB1
aW50MzJfdCBkb21pZCwKPj4gICAgIH0KPj4gICAgIGVsc2UKPj4gICAgIHsKPj4gKyAgICAgICAg
aWYgKCBnZXRlbnYoIlhFTl9MSUJYQ19ESVNBQkxFX0ZBS0VIVCIpICkgewo+IAo+IFRoZSBicmFj
ZSB3YW50cyB0byBtb3ZlIG9udG8gaXRzIG93biBsaW5lLgoKQWNrCgo+IAo+PiArICAgICAgICAg
ICAgcC0+YmFzaWMuaHR0ID0gZmFsc2U7Cj4gCj4gSSB0aGluayBldmVyeXRoaW5nIGJlbG93IGhl
cmUgaW5kZWVkIHNpbXBseSB1bmRvZXMgd2hhdCBzYWlkIG9sZAo+IGNvbW1pdCBkaWQsIGJ1dCBJ
IGNhbid0IG1hdGNoIHVwIHRoaXMgb25lLiBBbmQgdG9nZXRoZXIgd2l0aCB0aGUKPiBxdWVzdGlv
biBvZiB3aGV0aGVyIGluc3RlYWQgbGVhdmluZyBpdCBhbG9uZSwgY21wX2xlZ2FjeSB0aGVuCj4g
d291bGQgaGF2ZSB0aGUgc2FtZSBxdWVzdGlvbiByYWlzZWQuCgpUaGlzIGlzIGJhc2VkIG9uIGEg
WGVuU2VydmVyIHBhdGNoIHdoaWNoIHJldmVydHMgdGhlIGVudGlyZSBjb21taXQsIGFuZApoYXMg
YmVlbiBtYWludGFpbmVkIGluIHRoZSBwYXRjaHF1ZXVlIHNpbmNlIHRoZSBjb21taXQgbWFkZSBp
dCB1cHN0cmVhbSwKQUZBSUNULiAgU28gSSdsbCBsZXQgc29tZW9uZSBmcm9tIHRoYXQgdGVhbSBj
b21tZW50IG9uIHRoZSB3aGVyZWZvcmVzOwpidXQgYXMgSSBzYWlkLCBpdCdzIGJ5IGZhciB0aGUg
YmVzdCB0ZXN0ZWQgb3B0aW9uIHdlJ3JlIGdvaW5nIHRvIGdldC4KCiAtR2VvcmdlCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
