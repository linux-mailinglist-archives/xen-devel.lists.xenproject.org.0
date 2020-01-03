Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E293812F930
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 15:28:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inNtl-0003Na-7j; Fri, 03 Jan 2020 14:25:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Lau=2Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1inNtj-0003NQ-V5
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 14:25:55 +0000
X-Inumbo-ID: eec64b42-2e34-11ea-a1e1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eec64b42-2e34-11ea-a1e1-bc764e2007e4;
 Fri, 03 Jan 2020 14:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578061547;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3hxZxFB9X2JaBIWV4Dwd3jHpfGXDh5OM8AcPDMeMWtg=;
 b=EiYmph9xbtrtRkJZbLRdubecSgMbO57XaVQW3tL8IQXF6eyO0023ne27
 tswYKSjgyMNN6Xcz/kTYza38KzHEzOTMZyg+/zF/oFRRZaJOtx/2NIlTZ
 1gJMJbLZrooBbphZPIBnEhy1mqcwOCJLBXQ89Y8ulxot20Izbwgq075VO E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kxEnq1eO7wB58d0hnYeCfyjgw6/OACdlgWm6Ui5Rm1LlamUpRcH2DTuY+3C7EtMWJ+qATybIBX
 yYBJWmpCV8ZXZg/QegrdNQ4MhKrn77bdrDPxHjVU2Q/vW5yqs2xb//d8wtBghl/NVzD1n6dIyM
 psQhlY8Sfp4Vw2V1WznNn9kAFMA9muTH9OkMayjBUIE92X9uyONxTYp3Zv3g1OR62IJiNQr1kc
 GCeJ/F+Raw89mec8Xbx963RCZlmsZvbwojp8aGng03awexoIRdLi9ej2dpY5GPZYFIxzW4Ou+H
 5P8=
X-SBRS: 2.7
X-MesageID: 10782872
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,390,1571716800"; d="scan'208";a="10782872"
To: Jan Beulich <jbeulich@suse.com>
References: <20200102145953.6503-1-andrew.cooper3@citrix.com>
 <d8abd43b-ac91-9eef-3c34-394ed9842342@suse.com>
 <d6e7c26b-2233-b1da-d866-d470a5c110e4@citrix.com>
 <5f6fff0a-d677-11e5-07ad-7e0250d29477@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <1628e07b-4599-e885-df5b-8b71872ca291@citrix.com>
Date: Fri, 3 Jan 2020 14:25:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5f6fff0a-d677-11e5-07ad-7e0250d29477@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/boot: Clean up the trampoline
 transition into Long mode
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDEvMjAyMCAxMzo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDMuMDEuMjAyMCAx
NDo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDMvMDEvMjAyMCAxMzozNiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwMi4wMS4yMDIwIDE1OjU5LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IEBAIC0xMTEsMjYgKzEwOSw2IEBAIHRyYW1wb2xpbmVfcHJvdG1vZGVfZW50cnk6Cj4+
Pj4gIHN0YXJ0NjQ6Cj4+Pj4gICAgICAgICAgLyogSnVtcCB0byBoaWdoIG1hcHBpbmdzLiAqLwo+
Pj4+ICAgICAgICAgIG1vdmFicyAgJF9faGlnaF9zdGFydCwgJXJkaQo+Pj4+IC0KPj4+PiAtI2lm
ZGVmIENPTkZJR19JTkRJUkVDVF9USFVOSwo+Pj4+IC0gICAgICAgIC8qCj4+Pj4gLSAgICAgICAg
ICogSWYgYm9vdGluZyB2aXJ0dWFsaXNlZCwgb3IgaG90LW9ubGluaW5nIGEgQ1BVLCBzaWJsaW5n
IHRocmVhZHMgY2FuCj4+Pj4gLSAgICAgICAgICogYXR0ZW1wdCBCcmFuY2ggVGFyZ2V0IEluamVj
dGlvbiBhZ2FpbnN0IHRoaXMgam1wLgo+Pj4+IC0gICAgICAgICAqCj4+Pj4gLSAgICAgICAgICog
V2UndmUgZ290IG5vIHVzYWJsZSBzdGFjayBzbyBjYW4ndCB1c2UgYSBSRVRQT0xJTkUgdGh1bmss
IGFuZCBhcmUKPj4+PiAtICAgICAgICAgKiBmdXJ0aGVyIHRoYW4gZGlzcDMyIGZyb20gdGhlIGhp
Z2ggbWFwcGluZ3Mgc28gY291bGRuJ3QgdXNlCj4+Pj4gLSAgICAgICAgICogSlVNUF9USFVOSyBl
dmVuIGlmIGl0IHdhcyBhIG5vbi1SRVRQT0xJTkUgdGh1bmsuICBGdXJ0aGVybW9yZSwgYW4KPj4+
PiAtICAgICAgICAgKiBMRkVOQ0UgaXNuJ3QgbmVjZXNzYXJpbHkgc2FmZSB0byB1c2UgYXQgdGhp
cyBwb2ludC4KPj4+PiAtICAgICAgICAgKgo+Pj4+IC0gICAgICAgICAqIEFzIHRoaXMgaXNuJ3Qg
YSBob3RwYXRoLCB1c2UgYSBmdWxseSBzZXJpYWxpc2luZyBldmVudCB0byByZWR1Y2UKPj4+PiAt
ICAgICAgICAgKiB0aGUgc3BlY3VsYXRpb24gd2luZG93IGFzIG11Y2ggYXMgcG9zc2libGUuICAl
ZWJ4IG5lZWRzIHByZXNlcnZpbmcKPj4+PiAtICAgICAgICAgKiBmb3IgX19oaWdoX3N0YXJ0Lgo+
Pj4+IC0gICAgICAgICAqLwo+Pj4+IC0gICAgICAgIG1vdiAgICAgJWVieCwgJWVzaQo+Pj4+IC0g
ICAgICAgIGNwdWlkCj4+Pj4gLSAgICAgICAgbW92ICAgICAlZXNpLCAlZWJ4Cj4+Pj4gLSNlbmRp
Zgo+Pj4+IC0KPj4+PiAgICAgICAgICBqbXBxICAgIColcmRpCj4+PiBJIGNhbiBzZWUgdGhpcyBi
ZWluZyB1bm5lZWRlZCB3aGVuIHJ1bm5pbmcgdmlydHVhbGl6ZWQsIGFzIHlvdSBzYWlkCj4+PiBp
biByZXBseSB0byBXZWkuIEhvd2V2ZXIsIGZvciBob3Qtb25saW5pbmcgKHdoZW4gb3RoZXIgQ1BV
cyBtYXkgcnVuCj4+PiByYW5kb20gdkNQVS1zKSBJIGRvbid0IHNlZSBob3cgdGhpcyBjYW4gc2Fm
ZWx5IGJlIGRyb3BwZWQuIFRoZXJlJ3MKPj4+IG5vIHNpbWlsYXIgY29uY2VybiBmb3IgUzMgcmVz
dW1lLCBhcyB0aGF3X2RvbWFpbnMoKSBoYXBwZW5zIG9ubHkKPj4+IGFmdGVyIGVuYWJsZV9ub25i
b290X2NwdXMoKS4KPj4gSSBjb3ZlcmVkIHRoYXQgaW4gdGhlIHNhbWUgcmVwbHkuwqAgQW55IGd1
ZXN0IHdoaWNoIGNhbiB1c2UgYnJhbmNoIHRhcmdldAo+PiBpbmplY3Rpb24gYWdhaW5zdCB0aGlz
IGptcCBjYW4gYWxzbyBwb2lzb24gdGhlIHJlZ3VsYXIgYnJhbmNoIHByZWRpY3Rvcgo+PiBhbmQg
Z2V0IGF0IGRhdGEgdGhhdCB3YXkuCj4gQXJlbid0IHlvdSBpbXBseWluZyB0aGVuIHRoYXQgcmV0
cG9saW5lcyBjb3VsZCBhbHNvIGJlIGRyb3BwZWQ/CgpOby7CoCBJdCBpcyBhIHNpbXBsZSByaXNr
IHZzIGNvbXBsZXhpdHkgdHJhZGVvZmYuCgpHdWVzdHMgcnVubmluZyBvbiBhIHNpYmxpbmcgKmNh
biBhbHJlYWR5KiBhdHRhY2sgdGhpcyBicmFuY2ggd2l0aCBCVEksCmJlY2F1c2UgQ1BVSUQgaXNu
J3QgYSBmaXggdG8gYmFkIEJUQiBzcGVjdWxhdGlvbiwgYW5kIHRoZSBsZWFrYWdlIGdhZGdldApu
ZWVkIG9ubHkgYmUgYSBzaW5nbGUgaW5zdHJ1Y3Rpb24uCgpTdWNoIGEgZ3Vlc3QgY2FuIGFsc28g
YXR0YWNrIFhlbiBpbiBnZW5lcmFsIHdpdGggU3BlY3RyZSB2MS4KCkFzIEkgc2FpZCAtIHRoaXMg
d2FzIGludHJvZHVjZWQgYmVjYXVzZSBvZiBwYXJhbm9pYSwgYmFjayB3aGlsZSB0aGUgZmV3CnBl
b3BsZSB3aG8ga25ldyBhYm91dCB0aGUgaXNzdWVzIChvbmx5IHNldmVyYWwgaHVuZHJlZCBhdCB0
aGUgdGltZSkgd2VyZQphdHRlbXB0aW5nIHRvIGZpZ3VyZSBvdXQgd2hhdCBleGFjdGx5IGEgc3Bl
Y3VsYXRpdmUgYXR0YWNrIGxvb2tlZCBsaWtlLAphbmQgd2FzIGFwcGx5aW5nIGR1Y3QgdGFwZSB0
byBldmVyeXRoaW5nIHN1c3BpY2lvdXMgYmVjYXVzZSB3ZSBoYWQgMAp0aW1lIHRvIHJld3JpdGUg
c2V2ZXJhbCBjb3JlIHBpZWNlcyBvZiBzeXN0ZW0gaGFuZGxpbmcuCgo+PiBPbmNlIGFnYWluLCB3
ZSBnZXQgdG8gQ1BVIEhvdHBsdWcgYmVpbmcgYW4gdW51c2VkIGZlYXR1cmUgaW4gcHJhY3RpY2Us
Cj4+IHdoaWNoIGlzIGNvbXBsZXRlbHkgZXZpZGVudCBub3cgd2l0aCBJbnRlbCBNQ0UgYmVoYXZp
b3VyLgo+IFdoYXQgZG9lcyBJbnRlbCdzIE1DRSBiZWhhdmlvciBoYXZlIHRvIGRvIHdpdGggd2hl
dGhlciBDUFUgaG90cGx1Zwo+IChvciBob3Qtb25saW5pbmcpIGlzICh1bil1c2VkIGluIHByYWN0
aWNlPwoKVGhlIGxvZ2ljYWwgY29uc2VxdWVuY2Ugb2YgaG90cGx1ZyBicmVha2luZyBNQ0VzLgoK
SWYgaG90cGx1ZyBoYWQgYmVlbiB1c2VkIGluIHByYWN0aWNlLCB0aGUgTUNFIGJlaGF2aW91ciB3
b3VsZCBoYXZlIGNvbWUKdG8gbGlnaHQgbXVjaCBzb29uZXIsIHdoZW4gTUNFcyBkaWRuJ3Qgd29y
ayBpbiBwcmFjdGljZS4KCkdpdmVuIHRoYXQgTUNFcyByZWFsbHkgZGlkIHdvcmsgaW4gcHJhY3Rp
Y2UgZXZlbiBiZWZvcmUgdGhlIEwxVEYgZGF5cywKaG90cGx1ZyB3YXNuJ3QgaW4gY29tbW9uLWVu
b3VnaCB1c2UgZm9yIGFueW9uZSB0byBub3RpY2UgdGhlIE1DRSBiZWhhdmlvdXIuCgo+PiBBIGd1
ZXN0IGNhbid0IGNvbnRyb2wvZ3Vlc3Mgd2hlbiBhIGhvdHBsdWcgZXZlbiBtaWdodCBvY2N1ciwg
b3Igd2hlcmUKPj4gZXhhY3RseSB0aGlzIGJyYW5jaCBpcyBpbiBtZW1vcnkgKGFmdGVyIGFsbCAt
IGl0IGlzIHZhcmlhYmxlIGJhc2VkIG9uCj4+IHRoZSBwb3NpdGlvbiBvZiB0aGUgdHJhbXBvbGlu
ZSksIGFuZCBjb3JlIHNjaGVkdWxpbmcgbWl0aWdhdGVzIHRoZSByaXNrCj4+IGVudGlyZWx5Lgo+
ICIuLi4gd2lsbCBtaXRpZ2F0ZSAuLi4iIC0gaXQncyBleHBlcmltZW50YWwgdXAgdG8gbm93LCBp
c24ndCBpdD8KCkNvcmUgc2NoZWR1bGluZyBvdWdodCB0byBwcmV2ZW50IHRoZSBwcm9ibGVtIGVu
dGlyZWx5LsKgIFRoZSBjdXJyZW50IGNvZGUKaXMgbm90IHNhZmUgaW4gdGhlIGFic2VuY2Ugb2Yg
Y29yZSBzY2hlZHVsaW5nLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
