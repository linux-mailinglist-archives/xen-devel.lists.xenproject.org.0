Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A638014A91E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 18:37:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw8Ho-0004Pw-Vt; Mon, 27 Jan 2020 17:34:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x5IB=3Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iw8Hn-0004Pr-Ub
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 17:34:55 +0000
X-Inumbo-ID: 54676fc2-412b-11ea-9fd7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54676fc2-412b-11ea-9fd7-bc764e2007e4;
 Mon, 27 Jan 2020 17:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580146494;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=20xtC8x0Bi4/rP4KDXiksiQyJjT1ui09hTn2ZE+piC0=;
 b=WwgNn8KJeUI12tFTXlM0sEaHGbZ7MgUbFTrvjtj+qgAXdUoofReWicAd
 s5rF6NxsJDP7rYBMxgYpzGWzbIy6BXWwGHfqI9SjbcXD2gdYs/wvMFoVY
 JhxcFbLRc9hwcHolxA/ZYWGobQzwcM7OtTjg+PEfbZJaRe2xbicE+j0H9 E=;
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
IronPort-SDR: JHYsplaqwVk9FTUD0Ilh7tV4zrUs0KL8iqlZ5q12mKK3MlyBDPHa1vzqGTvqgG69dmqlUKmU98
 r6SVzVlyRHNosYyO0lwrsE5ci/Xx8rrToCKhIxGPikYjqB5xg5MwWiiVzApGkBaB7Vyiu+7iCu
 E1dtBtQnLJA/4KXUZy7yi0sKrHpnhZa9iKtX4AIOz+YopdAUzsZCoB+2fvicS0vGRioKPk/gi4
 dc7tUE/iym9wRBCTI2Ga8yCzeMD2j61BkHJ0gKFUGjFxttC7jwJ6wb6Xw1/6xltCZMW4eY6GMA
 3kc=
X-SBRS: 2.7
X-MesageID: 11943459
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11943459"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200123180615.69370-1-roger.pau@citrix.com>
 <20200123180615.69370-3-roger.pau@citrix.com>
 <db22cea4-47cf-14b8-8ebf-6f65104920a4@suse.com>
 <1bd1ffed-709a-469d-d7e0-ccef16035f88@citrix.com>
 <20200127172133.GI57924@desktop-tdan49n.eng.citrite.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6f62cba1-d068-c924-9327-8589a68b0f5a@citrix.com>
Date: Mon, 27 Jan 2020 17:34:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200127172133.GI57924@desktop-tdan49n.eng.citrite.net>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/apic: simplify
 disconnect_bsp_APIC setup of LVT{0/1}
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDEvMjAyMCAxNzoyMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIEph
biAyNywgMjAyMCBhdCAwNDo0Nzo0OFBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBP
biAyNy8wMS8yMDIwIDE2OjQzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDIzLjAxLjIwMjAg
MTk6MDYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+PiBUaGVyZSdzIG5vIG5lZWQgdG8gcmVh
ZCB0aGUgY3VycmVudCB2YWx1ZXMgb2YgTFZUezAvMX0gZm9yIHRoZQo+Pj4+IHB1cnBvc2VzIG9m
IHRoZSBmdW5jdGlvbiwgd2hpY2ggc2VlbSB0byBiZSB0byBzYXZlIHRoZSBjdXJyZW50bHkKPj4+
PiBzZWxlY3RlZCB2ZWN0b3I6IGluIHRoZSBkZXN0aW5hdGlvbiBtb2RlcyB1c2VkIChFeHRJTlQg
YW5kIE5NSSkgdGhlCj4+Pj4gdmVjdG9yIGZpZWxkIGlzIGlnbm9yZWQgYW5kIGhlbmNlIGNhbiBi
ZSBzZXQgdG8gMC4KPj4+IFRoZSBxdWVzdGlvbiBpcyAtIGlzIHRoZXJlIGZpcm13YXJlIHB1dHRp
bmcgZGF0YSBpbiB0aGVzZSBmaWVsZHMKPj4+IHRoYXQgaXQgZXhwZWN0cyB0byBzdXJ2aXZlIHVu
bW9kaWZpZWQ/IFN1Y2ggYmVoYXZpb3Igd291bGQgYmUKPj4+IGhpZ2hseSBzdXNwZWN0ICh0byBt
ZSBhdCBsZWFzdCksIGJ1dCB5b3UgbmV2ZXIga25vdy4gVGhlcmUgb3VnaHQKPj4+IHRvIGJlIGEg
cmVhc29uIGl0J3MgYmVlbiBkb25lIHRoaXMgd2F5IG5vdCBqdXN0IGluIFhlbiwgYnV0IGFsc28K
Pj4+IGluIExpbnV4LiBJT1cgbWF5IEkgYXNrIHRoYXQgeW91IGF0IGxlYXN0IG1ha2UgYW4gYXR0
ZW1wdCB0bwo+Pj4gc3VibWl0IHRoZSBzYW1lIGNoYW5nZSBmb3IgTGludXgsIHRvIHNlZSB3aGF0
IHRoZSBmZWVkYmFjayBpcz8KPj4gSSBjYW4gdGVsbCB5b3Ugd2hhdCB0aGUgTGludXggZmVlZGJh
Y2sgd2lsbCBiZS4KPj4KPj4gVGhpcyBpcyBub3QgYSBmYXN0cGF0aC7CoCBBbHdheXMgZG8gUk1X
LCBiZWNhdXNlIGxpZmUgaXMgdG9vIHNob3J0IHRvCj4+IGtlZXAgb24gdW5icmVha2luZyBoYXJk
d2FyZSB3aGljaCBtYWtlcyBzdWNoIGFzc3VtcHRpb25zLgo+IFdlIGFscmVhZHkgZG8gc3VjaCBr
aW5kcyBvZiBkaXJlY3Qgd3JpdGVzIHRvIExWVHswLzF9LCBzZWUKPiBjbGVhcl9sb2NhbF9BUElD
IHdoZXJlIFhlbiBjbGVhcnMgdGhlIHJlZ2lzdGVycyBieSBkaXJlY3RseSB3cml0aW5nCj4gQVBJ
Q19MVlRfTUFTS0VEIHRvIHRoZW0gKG5vIFJNVykuIEFzIHRoZSBtb2RpZmllZCBjb2RlIGZvbGxv
d3MgYSBjYWxsCj4gdG8gY2xlYXJfbG9jYWxfQVBJQyB0aGVyZSdzIG5vdGhpbmcgdG8gcHJlc2Vy
dmUgYXQgdGhpcyBwb2ludC4KPgo+IE5vdGUgdGhhdCBpbml0X2JzcF9BUElDIGFuZCBzbXBfY2Fs
bGluIGFsc28gY2FsbCBjbGVhcl9sb2NhbF9BUElDLCBzbwo+IHRoZXJlJ3Mgbm8gZGF0YSBpbiB0
aG9zZSByZWdpc3RlcnMgdGhhdCBjb3VsZCBzdXJ2aXZlIChyZWdhcmRsZXNzIG9mCj4gbXkgYWRk
ZWQgY2FsbCB0byBjbGVhcl9sb2NhbF9BUElDIGluIHRoZSBwcmV2aW91cyBwYXRjaCkuCj4KPiBJ
J20gbm90IGFyZ3VpbmcgdGhpcyBpcyBjb3JyZWN0IChub3Qgc3VyZSBpdCdzIGluY29ycmVjdCBl
aXRoZXIpLCBidXQKPiBnaXZlbiBob3cgdGhpbmdzIGFyZSBoYW5kbGVkIEFUTSBpdCBzZWVtcyBx
dWl0ZSBkdW1iIHRvIGRvIGEgUk1XIGluCj4gZGlzY29ubmVjdF9ic3BfQVBJQzogaXQgZ2l2ZXMg
dGhlIGZhbHNlIGltcHJlc3Npb24gWGVuIGlzIHByZXNlcnZpbmcKPiBzb21ldGhpbmcsIHdoZW4g
dGhlIHJlZ2lzdGVyIGhhcyBhbHJlYWR5IGJlZW4gd2lwZWQgYXQgc3RhcnR1cC4KClRoZSBwcm9i
bGVtIGlzbid0IHdpdGggdGhlIGN1cnJlbnRseSBkZWZpbmVkIGZpZWxkcyAod2hlbiB3ZSdyZSB0
cnlpbmcKdG8gY2xlYXIgdGhlbSkuwqAgSXQgaXMgd2l0aCBpbXBsZW1lbnRhdGlvbnMgd2hpY2gg
ZGVwZW5kIG9uIHNldCByZXNlcnZlZApiaXRzIG5vdCBjaGFuZ2luZywgYW5kL29yIG5ldyBmaWVs
ZHMgZGVmaW5lZCBhdCBzb21lIGZ1dHVyZSBwb2ludC4KCklmIHdlIGFscmVhZHkgaGF2ZSBhIG1p
eCwgdGhlbiBzb21lIG1vcmUgcHJvYmFibHkgaXNuJ3QgYSBwcm9ibGVtLCBidXQKeW91IGRpZCBh
c2sgd2hhdCB0aGUgTGludXggZmVlZGJhY2sgd291bGQgYmUuLi4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
