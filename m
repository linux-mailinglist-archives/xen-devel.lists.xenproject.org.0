Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4888112F8EF
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 14:46:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inNFh-0008Bs-Kv; Fri, 03 Jan 2020 13:44:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Lau=2Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1inNFg-0008Bn-W7
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 13:44:33 +0000
X-Inumbo-ID: 26a6f800-2e2f-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26a6f800-2e2f-11ea-b6f1-bc764e2007e4;
 Fri, 03 Jan 2020 13:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578059063;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ORzH9He1lAm+Pn6kzVM8GimjNjQLvwAXJU8v0supSfw=;
 b=TGoJj4bVtLHdn3Q2BkdZpdN8xBq0O0CzhNK2/hgnY+pNb5DlbhWGu3Gd
 bFIjB9Jm4c5rsEhu8pD9UkcSkwbppvuCNumKwNS1QsyRcw/xM+7OqwhFy
 isHR3G234ZrXWbBrTrWbisfyxQooTITs8iez6uh2+QG8wA6BWWjAgZTTd Y=;
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
IronPort-SDR: OnlofvAUutTwW0UVXFJoS0qNTxVX32vjKepa+++D4F8akD8H/zIFr3tfecBEr//g9ON626oRtl
 NLgENhbPwl3Rj4c25znvEUq/vD4BdN4WWdMSlEkO0YkkaVQ9WlqV/HYolGE7QRTxSD4Ntcj9Kp
 j59YWoCxt9LZH0B5l7k1V9Uo+kluaf4rrXdvEds9bHmSECQCfzFvEzznDmCEOFTLKWl8Q4awE0
 hI+3htGRZlhGIeQHQ2yqcpCH6aejgTdmhkeZGyksDW7o/KQCA6wqz0TokhP0LWrlnWnJ9GUa0C
 lOw=
X-SBRS: 2.7
X-MesageID: 10846641
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,390,1571716800"; d="scan'208";a="10846641"
To: Jan Beulich <jbeulich@suse.com>
References: <20200102145953.6503-1-andrew.cooper3@citrix.com>
 <d8abd43b-ac91-9eef-3c34-394ed9842342@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d6e7c26b-2233-b1da-d866-d470a5c110e4@citrix.com>
Date: Fri, 3 Jan 2020 13:44:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d8abd43b-ac91-9eef-3c34-394ed9842342@suse.com>
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

T24gMDMvMDEvMjAyMCAxMzozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDIuMDEuMjAyMCAx
NTo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gQEAgLTExMSwyNiArMTA5LDYgQEAgdHJhbXBv
bGluZV9wcm90bW9kZV9lbnRyeToKPj4gIHN0YXJ0NjQ6Cj4+ICAgICAgICAgIC8qIEp1bXAgdG8g
aGlnaCBtYXBwaW5ncy4gKi8KPj4gICAgICAgICAgbW92YWJzICAkX19oaWdoX3N0YXJ0LCAlcmRp
Cj4+IC0KPj4gLSNpZmRlZiBDT05GSUdfSU5ESVJFQ1RfVEhVTksKPj4gLSAgICAgICAgLyoKPj4g
LSAgICAgICAgICogSWYgYm9vdGluZyB2aXJ0dWFsaXNlZCwgb3IgaG90LW9ubGluaW5nIGEgQ1BV
LCBzaWJsaW5nIHRocmVhZHMgY2FuCj4+IC0gICAgICAgICAqIGF0dGVtcHQgQnJhbmNoIFRhcmdl
dCBJbmplY3Rpb24gYWdhaW5zdCB0aGlzIGptcC4KPj4gLSAgICAgICAgICoKPj4gLSAgICAgICAg
ICogV2UndmUgZ290IG5vIHVzYWJsZSBzdGFjayBzbyBjYW4ndCB1c2UgYSBSRVRQT0xJTkUgdGh1
bmssIGFuZCBhcmUKPj4gLSAgICAgICAgICogZnVydGhlciB0aGFuIGRpc3AzMiBmcm9tIHRoZSBo
aWdoIG1hcHBpbmdzIHNvIGNvdWxkbid0IHVzZQo+PiAtICAgICAgICAgKiBKVU1QX1RIVU5LIGV2
ZW4gaWYgaXQgd2FzIGEgbm9uLVJFVFBPTElORSB0aHVuay4gIEZ1cnRoZXJtb3JlLCBhbgo+PiAt
ICAgICAgICAgKiBMRkVOQ0UgaXNuJ3QgbmVjZXNzYXJpbHkgc2FmZSB0byB1c2UgYXQgdGhpcyBw
b2ludC4KPj4gLSAgICAgICAgICoKPj4gLSAgICAgICAgICogQXMgdGhpcyBpc24ndCBhIGhvdHBh
dGgsIHVzZSBhIGZ1bGx5IHNlcmlhbGlzaW5nIGV2ZW50IHRvIHJlZHVjZQo+PiAtICAgICAgICAg
KiB0aGUgc3BlY3VsYXRpb24gd2luZG93IGFzIG11Y2ggYXMgcG9zc2libGUuICAlZWJ4IG5lZWRz
IHByZXNlcnZpbmcKPj4gLSAgICAgICAgICogZm9yIF9faGlnaF9zdGFydC4KPj4gLSAgICAgICAg
ICovCj4+IC0gICAgICAgIG1vdiAgICAgJWVieCwgJWVzaQo+PiAtICAgICAgICBjcHVpZAo+PiAt
ICAgICAgICBtb3YgICAgICVlc2ksICVlYngKPj4gLSNlbmRpZgo+PiAtCj4+ICAgICAgICAgIGpt
cHEgICAgKiVyZGkKPiBJIGNhbiBzZWUgdGhpcyBiZWluZyB1bm5lZWRlZCB3aGVuIHJ1bm5pbmcg
dmlydHVhbGl6ZWQsIGFzIHlvdSBzYWlkCj4gaW4gcmVwbHkgdG8gV2VpLiBIb3dldmVyLCBmb3Ig
aG90LW9ubGluaW5nICh3aGVuIG90aGVyIENQVXMgbWF5IHJ1bgo+IHJhbmRvbSB2Q1BVLXMpIEkg
ZG9uJ3Qgc2VlIGhvdyB0aGlzIGNhbiBzYWZlbHkgYmUgZHJvcHBlZC4gVGhlcmUncwo+IG5vIHNp
bWlsYXIgY29uY2VybiBmb3IgUzMgcmVzdW1lLCBhcyB0aGF3X2RvbWFpbnMoKSBoYXBwZW5zIG9u
bHkKPiBhZnRlciBlbmFibGVfbm9uYm9vdF9jcHVzKCkuCgpJIGNvdmVyZWQgdGhhdCBpbiB0aGUg
c2FtZSByZXBseS7CoCBBbnkgZ3Vlc3Qgd2hpY2ggY2FuIHVzZSBicmFuY2ggdGFyZ2V0CmluamVj
dGlvbiBhZ2FpbnN0IHRoaXMgam1wIGNhbiBhbHNvIHBvaXNvbiB0aGUgcmVndWxhciBicmFuY2gg
cHJlZGljdG9yCmFuZCBnZXQgYXQgZGF0YSB0aGF0IHdheS4KCk9uY2UgYWdhaW4sIHdlIGdldCB0
byBDUFUgSG90cGx1ZyBiZWluZyBhbiB1bnVzZWQgZmVhdHVyZSBpbiBwcmFjdGljZSwKd2hpY2gg
aXMgY29tcGxldGVseSBldmlkZW50IG5vdyB3aXRoIEludGVsIE1DRSBiZWhhdmlvdXIuCgpBIGd1
ZXN0IGNhbid0IGNvbnRyb2wvZ3Vlc3Mgd2hlbiBhIGhvdHBsdWcgZXZlbiBtaWdodCBvY2N1ciwg
b3Igd2hlcmUKZXhhY3RseSB0aGlzIGJyYW5jaCBpcyBpbiBtZW1vcnkgKGFmdGVyIGFsbCAtIGl0
IGlzIHZhcmlhYmxlIGJhc2VkIG9uCnRoZSBwb3NpdGlvbiBvZiB0aGUgdHJhbXBvbGluZSksIGFu
ZCBjb3JlIHNjaGVkdWxpbmcgbWl0aWdhdGVzIHRoZSByaXNrCmVudGlyZWx5LgoKfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
