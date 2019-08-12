Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EB889BB2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 12:39:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hx7gN-0003Ip-7q; Mon, 12 Aug 2019 10:36:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gta3=WI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hx7gM-0003Ii-1p
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 10:36:06 +0000
X-Inumbo-ID: fc78e5b9-bcec-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fc78e5b9-bcec-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 10:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565606164;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=nX2a/xQerR2WM1jB2jsq6LZgXlk2DR6xEECWh8sSO58=;
 b=WJDbEDgIU0lD7pR28fsehhLE5ICVuwFWi+Vzr5pSAowk1zj3P9nsZpvD
 8RNNUVnLxb1FWoszajIU9Ne2GjxEplvC5YJzbcBktn3YK/pIdPfjnDp5i
 ++O7am+14PfuASdKcbFJjRVjh+1mybV3F/rSrK1nf6txkSD1wNSExML7e U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CjFGoD01qC35OQ+1AejcV0mtvkuOhpGmdvqRKuZOdhvx8uMfp3HjanQrOlcpnTsKNwqFOihRrZ
 DpBJZD+5mASo9mhT9AnH33LSbxNGt7H7slm0rTQH482C4F539uacjZfloLXOhxkCl1XbvvcIGl
 6REMYtg2l4uSUOWW61q/hJiqQdrHfoE4YeTF/kE+kXQ9SCBcRXFv8eCGZjuOUNpbSj28i6CsNT
 wpNiAswR+BnybbwUhhx01iwmL6OACLgiyX2A3XdJhHFjdU53r0sB4lJcLoGsS35NWtAOAnCJ/S
 fqQ=
X-SBRS: 2.7
X-MesageID: 4291323
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4291323"
To: Jan Beulich <jbeulich@suse.com>
References: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
 <e686a008-1e0f-c82e-e9ab-83e966d11243@suse.com>
 <3b2ad6fb-d39f-e5b5-b35a-fc4ebfc695f3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7c764dc0-9136-b937-feda-c9ce94fbef18@citrix.com>
Date: Mon, 12 Aug 2019 11:36:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3b2ad6fb-d39f-e5b5-b35a-fc4ebfc695f3@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/desc: Build boot_{,
 compat_}gdt[] in C
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDgvMjAxOSAwODozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDkuMDguMjAxOSAx
Mjo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoZXJlIGlzIHBsZW50eSBtb3JlIGNsZWFudXAg
d2hpY2ggY2FuIGJlIGRvbmUgaW4gdGhlIGZ1dHVyZS7CoCBBcyB3ZSBhcmUKPj4gNjQtYml0LCB0
aGVyZSBpcyBubyBuZWVkIGZvciBsb2FkX1RSKCkgdG8ga2VlcCB0aGUgVFNTIGluIHN5bmMKPj4g
YmV0d2VlbiB0aGUgdHdvCj4+IEdEVHMsIHdoaWNoIG1lYW5zIGl0IGNhbiBkcm9wIGFsbCBzZ2R0
L2xnZHQgaW5zdHJ1Y3Rpb25zLgo+Cj4gSSdtIHRyeWluZyB0byBmaWd1cmUgd2hhdCBleGFjdGx5
IHlvdSBtZWFuIGhlcmUuIEFyZSB5b3Ugc3VnZ2VzdGluZwo+IHdlIHJ1biB3aXRoIGEgVFNTIHNl
bGVjdG9yIGxvYWRlZCB3aG9zZSBkZXNjcmlwdG9yJ3MgYnVzeSBiaXQgaXMKPiBjbGVhcj8gSSBh
Z3JlZSB0aGlzIHNob3VsZG4ndCBjYXVzZSBpc3N1ZXMgaW4gdGhlIDY0LWJpdCB3b3JsZCwgYnV0
Cj4gaXQgd291bGQgc3RpbGwgbm90IGZlZWwgcmlnaHQuCgpBdCBhIG1pbmltdW0sIGFsbCB0aGUg
c2dkdC9sZ2R0IGNhbiBkaXNhcHBlYXIgYmVjYXVzZSB3ZSdyZSAoQUZBSUNUKQphbHdheXMgb24g
dGhlIG5hdGl2ZSBwZXItY3B1IEdEVCBhdCB0aGlzIHBvaW50LsKgIChJZiBub3QsIEknbSBzdXJl
IHdlCmNhbiBhcnJhbmdlIHRvIGJlLikKCkFzIGZvciBydW5uaW5nIHdpdGhvdXQgYSB2YWxpZCBH
RFQgcmVmZXJlbmNlLCB0aGUgQ1BVIHdpbGwgZnVuY3Rpb24KZmluZSwgYW5kIGl0IGlzIGEgZGVm
ZW5jZS1pbi1kZXB0aCBzdHJhdGVneSBhZ2FpbnN0IE1lbHRkb3duLCBzZWVpbmcgYXMKYW4gYXR0
YWNrZXIgY2FuIG5vIGxvbmdlciBkbyBzZ2R0OyBzdHIgdG8gbG9jYXRlIHRoZSBUU1MgYW5kIGZp
bmQgUlNQMC4KCj4gUXVlc3Rpb24gaXMgd2h5IHRoZXkndmUgcmV0YWluZWQgdGhlIGF2YWlsL2J1
c3kgZGlzdGluY3Rpb24gaW4gdGhlCj4gZmlyc3QgcGxhY2UuCgpFYXNpZXIgdGhhbiBtYWtpbmcg
YW55IGNoYW5nZXMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
