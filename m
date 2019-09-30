Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136B8C1EDC
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:22:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEslq-00051Z-Jw; Mon, 30 Sep 2019 10:19:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pKq3=XZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iEslp-00051S-7N
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:19:09 +0000
X-Inumbo-ID: bc6f7718-e36b-11e9-96cc-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id bc6f7718-e36b-11e9-96cc-12813bfff9fa;
 Mon, 30 Sep 2019 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569838747;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=HnfABf8G+k+KTngID/gVwF5GKCOJKDp64EYwd+1N9/0=;
 b=LYl556kBNWJ+StrhAWCT2Wqw5RhcYi0Sz5ZNC8PdVvnNSdKwEhoBgVgu
 XhBPOhcV0CDD1eBrAq+p8CHwv9307NE89CDr0ByQLXDHd6ocPuQD5T310
 uISJ777Xtr3mngo7sGkTZFMtxXIzVlFaOBzsAVwQBV0VapoEQv4g7eIr3 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cNG461UIAzHZLx39NVaeyWCCcjWNIiiLmlaWf1uKTWOBGWtv9XMQUaS9Fv2TPbGScZEmsor57D
 8Jvi6M6EcsaP6dZJxp495bzPXlta+pW6GOy3gCmu4uyTtJQoGYcyH/6PKorvz/2In6Eg3FCBk/
 qk3ng3yV/kMeI4eG6ygA+jJaDPdmJuQBpg4DIS+mjMJ6X2p9drkAxO2bbyPkchXiYvQ76A8VP+
 FyMma/09rLp6O60yCWqrRiah/36UKdIwOxM/44yJBf9I6yPFI0yGi4lfDchOHYfTg1FAWCumVK
 ki0=
X-SBRS: 2.7
X-MesageID: 6593890
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,565,1559534400"; 
   d="scan'208";a="6593890"
To: Roman Shaposhnik <roman@zededa.com>, Jan Beulich <jbeulich@suse.com>
References: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
 <0bc03d80-0696-8c5b-2189-24509c7ea3e6@suse.com>
 <CAMmSBy-41DseRA7MjY=Ux1r99VwFG7B2LHe-Udv+5KxURfbr2A@mail.gmail.com>
 <f23f1805-52fa-7d0f-7423-35bf644277dd@suse.com>
 <CAMmSBy8MGk01ZFF20N21ZWNMJaFhaj0VKomU48YQvvr7ah6v_w@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <11de67f5-076c-0839-0e52-c5e62322c734@citrix.com>
Date: Mon, 30 Sep 2019 11:19:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8MGk01ZFF20N21ZWNMJaFhaj0VKomU48YQvvr7ah6v_w@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Latest development (master) Xen fails to boot on HP
 ProLiant DL20 GEN10
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDkvMjAxOSAwNDowNywgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBPbiBUaHUsIFNl
cCAyNiwgMjAxOSBhdCAxMjo0NCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdy
b3RlOgo+PiBPbiAyNi4wOS4yMDE5IDAwOjMxLCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+Pj4g
SmFuLCBSb2dlciwgdGhhbmsgeW91IHNvIG11Y2ggZm9yIHRoZSBpbml0aWFsIGlkZWFzLiBJIHRy
aWVkIGEgZmV3IG9mCj4+PiB0aG9zZSBhbmQgaGVyZSdzIHdoZXJlIEkgYW0uCj4+Pgo+Pj4gRmly
c3Qgb2YgYWxsLCBpdCBpcyBkZWZpbml0ZWx5IHJlbGF0ZWQgdG8gQ1BVIGJyaW5nIHVwLiBBZGRp
bmcKPj4+IGNwdWlkbGU9MCB0byB4ZW4gY29tbWFuZCBsaW5lIG1hZGUgWGVuIGJvb3QuCj4+Pgo+
Pj4gVGhlbiwgYSBnb29kIGZyaWVuZCBvZiBtaW5lICh3aG8geW91IG1heSBrbm93IGZyb20gYW5j
aWVudCBYZW4gZGF5cwo+Pj4gOy0pKSBzdWdnZXN0ZWQgdGhhdCB0aGlzIGNvdWxkIGJlIHJlbGF0
ZWQgdG8gdGhpczoKPj4+ICAgICAgaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvWGVu
X3Bvd2VyX21hbmFnZW1lbnQKPj4+IHNvIEkgd2VudCB0byB0aGUgQklPUyBzZXR0aW5ncyBhbmQg
cXVpdGUgdG8gbXkgc3VycHJpc2UgYWxsIG9mIHRoZW0KPj4+IHdlcmUgZ3JheWVkIG91dCAobm90
IHR3ZWFrYWJsZSkuCj4+Pgo+Pj4gVGhlIG9ubHkgb25lIHRoYXQgd2Fzbid0IHdhcyAyeEFQSUMg
c3VwcG9ydC4gU28ganVzdCBmb3Iga2lja3MgLS0gSQo+Pj4gZGlzYWJsZWQgdGhhdC4KPj4+Cj4+
PiBUaGF0LCBpbiB0dXJuLCBtYWRlIFhlbiBib290IGV2ZW4gd2l0aG91dCBjcHVpZGxlPTAuIEkn
bSBhdHRhY2hpbmcgdGhhdCBsb2cuCj4+IEludGVyZXN0aW5nLCBidXQgdW5mb3J0dW5hdGVseSB0
aGlzIHBhcnRpY3VsYXIgbG9nIGlzIG9mIG5vIHJlYWwgdXNlCj4+IGZvciBpbnZlc3RpZ2F0aW9u
IG9mIHRoZSBpc3N1ZSAob3RoZXIgdGhhbiBrbm93aW5nIHRoZSBDUFUgbW9kZWwpLiBJCj4+IGFs
c28gbm90aWNlIGl0J3MgYSA0LjEyLjAgbG9nLCB3aGVuIHlvdXIgb3JpZ2luYWwgcmVwb3J0IHdh
cyBhZ2FpbnN0Cj4+IGxhdGVzdCBtYXN0ZXIuCj4+Cj4+PiBTbyBJIGd1ZXNzIGF0IHRoaXMgcG9p
bnQsIHlvdSBjb3VsZCBzYXkgdGhhdCBJIGhhdmUgYSBmdW5jdGlvbmFsCj4+PiBzeXN0ZW0sIGJ1
dCBJJ20gY3VyaW91cyB3aGV0aGVyIHlvdSBndXlzIHdvdWxkIGJlIGludGVyZXN0ZWQgdG8gbG9v
awo+Pj4gaW50byAyeEFQSUMgc2l0dWF0aW9uLgo+PiBPZiBjb3Vyc2Ugd2UgZG8uIEFzIGEgbmV4
dCBzdGVwIEknZCBzdWdnZXN0IHJldmVydGluZyB0aGUgQklPUyBzZXR0aW5ncwo+PiBjaGFuZ2Ug
eW91IGRpZCwgYW5kIGluc3RlYWQgdXNpbmcgdGhlICJ4MmFwaWM9MCIgWGVuIGNvbW1hbmQgbGlu
ZSBvcHRpb24uCj4gSW50ZXJlc3RpbmdseSBlbm91Z2gsIHRoaXMgZG9lc24ndCByZWFsbHkgc29s
dmUgdGhlIHByb2JsZW0gY29tcGxldGVseS4KPiBTcGVjaWZ5aW5nIHgyYXBpYz0wIGNlcnRhaW5s
eSBtYWtlcyBYZW4gZ28gbXVjaCBmdXJ0aGVyIHRvIGEgcG9pbnQKPiB3aGVyZSBpdCB0cmllcyB0
byBsb2FkIERvbTAgYW5kIHRoZW4gdGhlIGNvbnNvbGUgVkdBIHNjcmVlbiBnb2VzCj4gYmxhbmsg
KHRoaXMgaXMgd2hlcmUgdGhhdCBzZXJpYWwgZGVidWcgb3V0cHV0IHdvdWxkIGJlIHZlcnkgdXNl
ZnVsIDotKCkuCgpEbyB5b3Ugbm90IGV2ZW4gaGF2ZSBJUE1JIFNvTD/CoCBJdHMgYmFzaWNhbGx5
IGltcG9zc2libGUgdG8gYnV5IHNlcnZlcnMKd2l0aG91dCB0aGlzIGJhc2UgbGV2ZWwgb2YgZnVu
Y3Rpb25hbGl0eS4KCkl0IHdpbGwgYmUgc29tZXdoZXJlIGluIHRoZSBpTE8gY29uZmlndXJhdGlv
biBvbiBhbiBIUCBzZXJ2ZXIuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
