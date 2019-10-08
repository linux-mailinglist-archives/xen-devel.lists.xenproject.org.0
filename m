Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD21CF3DB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 09:29:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHjsG-0005fw-Nw; Tue, 08 Oct 2019 07:25:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5hjQ=YB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iHjsF-0005fp-Ov
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 07:25:35 +0000
X-Inumbo-ID: d11cc828-e99c-11e9-80e3-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d11cc828-e99c-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 07:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570519534;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=y87NbU50yttgk2C1DcjG5uQNdk5/uAwfSyh21RewwEo=;
 b=RYfYdAeYEKI9ttrUW6qmAYMYWRlL/QWFXWD3dlvZUFby8b9DQYzbYdTu
 McX9kKdfpo0PnoC3EZl1xFoGmEkrEidyCnC3iigPjjmko86qsWaEdxqOH
 kqLaveZCBS87+st3QpZ4cAvGLoUc3MUduzBox+uf/BV02FfteY02PHfmW w=;
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
IronPort-SDR: xQSaAlrsLG8n0dwHmD5DgU1T6dnJy9iAlJKM2gRqE9EkZTyg7n5mkKb5DgrOdL3Luvp34Y581I
 8kVrkmaAyCLlX9xfSifUZcTl6/kroo+hB/2k/a/b6kU63LGFitaFsMJIouEDqXOeB+jGeHTh+9
 pj+qkGj3tDuEs5C3pRRmBzHMZFIsC0zSQcqF5QL7rPeCnQI6EQoMlI0+yuIuM+c+tncKwBHQLX
 46N4SmERqvNZ4nwnbJygU95eszAXNwKI4youaxhGjfwbtt8R1awlYY4b0zOK6VDZdq/Fj3Kouv
 +z4=
X-SBRS: 2.7
X-MesageID: 6848961
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,270,1566878400"; 
   d="scan'208";a="6848961"
To: Roman Shaposhnik <roman@zededa.com>, Jan Beulich <jbeulich@suse.com>
References: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
 <0bc03d80-0696-8c5b-2189-24509c7ea3e6@suse.com>
 <CAMmSBy-41DseRA7MjY=Ux1r99VwFG7B2LHe-Udv+5KxURfbr2A@mail.gmail.com>
 <f23f1805-52fa-7d0f-7423-35bf644277dd@suse.com>
 <CAMmSBy8MGk01ZFF20N21ZWNMJaFhaj0VKomU48YQvvr7ah6v_w@mail.gmail.com>
 <1e875ef2-6093-d1f6-38d6-36093206d36d@suse.com>
 <CAMmSBy_+uGe1QefqUgmhU48=D8V3+g9EKMM==hV4rkAtR1Dx1w@mail.gmail.com>
 <CAMmSBy_ZXrFRHAsLUpnhpLNag+Szn_L-40wOn_r2Xpjrx+akmA@mail.gmail.com>
 <727fc987-e6a0-dda4-1b73-ef864d2e01e3@suse.com>
 <CAMmSBy_unbtBchkZVu+HHjeLp+w1_is75UTyJzKNYd82ai0mog@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <3a9f6ffb-778a-b28a-6c5d-d7e0752abcb4@citrix.com>
Date: Tue, 8 Oct 2019 08:25:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy_unbtBchkZVu+HHjeLp+w1_is75UTyJzKNYd82ai0mog@mail.gmail.com>
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

T24gMDgvMTAvMjAxOSAwNjo1NCwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBTb3JyeSAtLSB3
YXMgdHJhdmVsaW5nIGxhc3Qgd2VlaywgYnV0IEknbSBzdGlsbCB2ZXJ5IGN1cmlvdXMgdG8gZ2V0
IHRvCj4gdGhlIGJvdHRvbSBvZiB0aGlzOgo+Cj4gT24gVHVlLCBPY3QgMSwgMjAxOSBhdCAxOjI1
IEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+IE9uIDAxLjEwLjIw
MTkgMDA6MzgsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4+PiBCdHcsIGZvcmdvdCB0byBhdHRh
Y2ggdGhlIHBhdGNoIHdpdGggbWF4Y3B1cz0yIC0tIGludGVyZXN0aW5nbHkgZW5vdWdoCj4+PiBY
ZW4gc2VlbXMgdG8gaGFuZyBtdWNoIGZ1cnRoZXIgZG93biB0aGFuIGJlZm9yZSAoYmFzaWNhbGx5
IGFmdGVyCj4+PiBhdHRlbXB0aW5nIHRvIGJ1aWxkIG91dCBEb20wKQo+PiBBbGwgMyBsb2dzIGNv
bnRhaW4KPj4KPj4gKFhFTikgVFNDX0RFQURMSU5FIGRpc2FibGVkIGR1ZSB0byBFcnJhdGE7IHBs
ZWFzZSB1cGRhdGUgbWljcm9jb2RlIHRvIHZlcnNpb24gMHg1MiAob3IgbGF0ZXIpCj4gT2suIFRo
aXMgbWFrZXMgc29tZSBzZW5zZS4gQnR3LCBpbiBhIHNpdHVhdGlvbiBsaWtlIHRoaXMsIGRvIHdl
IGV4cGVjdAo+IFhlbiB0byBjb3BlIHdpdGggYSBicm9rZW4gbWljcm9jb2RlIG9yIHdlIGFsd2F5
cyBleHBlY3QgbWljcm9jb2RlIHRvCj4gYmUgdXBkYXRlZD8KCkludGVsIGNvbnNpZGVyIHlvdSB0
byBiZSBydW5uaW5nIG91dC1vZi1zcGVjIGlmIHlvdSBkb24ndCBoYXZlCnVwLXRvLWRhdGUgbWlj
cm9jb2RlLsKgIEFzIGZvciBmdW5jdGlvbmluZyBjb3JyZWN0bHksIGFsbCBiZXRzIGFyZSBvZmYu
CgpJdCBpcyBxdWl0ZSBwb3NzaWJsZSB0aGUgdXBkYXRlZCBtaWNyb2NvZGUgZG9lc24ndCBoYXZl
IGFuIGltcGFjdCBoZXJlLApidXQgaXQgaXMgbm90IHdvcnRoIHlvdXIgdGltZSBvciBvdXJzIHRy
eWluZyB0byBkaWFnbm9zZSBpc3N1ZXMgaW4gdGhlCmZhY2Ugb2YgYW4gb3V0LW9mLXNwZWMgc3lz
dGVtLgoKPgo+PiBQbGVhc2UgbG9hZCB1cC10by1kYXRlIG1pY3JvY29kZSBvbiB0aGUgc3lzdGVt
IGFuZCwKPiBJIGNvdWxkbid0IGZpbmQgYW55IGtpbmQgb2YgSFAgZ3VpZGUgb24gaG93IHRvIGRv
IHRoaXMgb24gdGhpcyBib3guCj4gQW55IGNoYW5jZSBzb21lb25lIGhlcmUgbWF5IGhhdmUgYSBw
b2ludGVyIGZvciBtZT8KCkhlcmUgaXMgc29tZSBkb2N1bWVudGF0aW9uIEkgcHJlcGFyZWQgZWFy
bGllcjoKCmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2RvY3Mvc3BoaW54LXVuc3RhYmxlL2FkbWlu
LWd1aWRlL21pY3JvY29kZS1sb2FkaW5nLmh0bWwKClRvIGEgZmlyc3QgYXBwcm94aW1hdGlvbiwg
aW5zdGFsbCB0aGUgaW50ZWwtdWNvZGUgcGFja2FnZSBpbnRvIGRvbTAsIGFuZAppdCBzaG91bGQg
RFRSVC4KCklmIGl0IGRvZXNuJ3QsCmh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9JbnRlbC1MaW51
eC1Qcm9jZXNzb3ItTWljcm9jb2RlLURhdGEtRmlsZXMgaXMKdXBzdHJlYW0gZm9yIEludGVsJ3Mg
bWljcm9jb2RlLCBhbmQgeW91IGNhbiBtYW51YWxseSBhcnJhbmdlIGZvciBYZW4gdG8KZmluZCBh
bmQgdXNlIGl0LgoKfkFuZHJldwoKUC5TLiBJJ2QgYWxzbyBhcHByZWNpYXRlIGFueSBmZWVkYmFj
ayB5b3UgaGF2ZSBvbiB0aGUgbWljcm9jb2RlCmRvY3VtZW50YXRpb24sIGJlY2F1c2UgdGhhdCBp
cyB0aGUgc3R5bGUvcXVhbGl0eSBJJ20gYWltaW5nIGZvciBhY3Jvc3MKdGhlIGJvYXJkIGluIHRo
ZSBTcGhpbnggZG9jcywgYW5kIHlvdSBhcmUgcG9zc2libHkgdGhlIGZpcnN0IHVzZXIgdG8gdXNl
Cml0IGluIGFuZ2VyLsKgIEluIHBhcnRpY3VsYXIsIGlmIHRoaW5ncyBhcmUgbm90IGNsZWFyLCBJ
J2QgbGlrZSB0byBzZWUKYWJvdXQgZml4aW5nIHRoYXQuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
