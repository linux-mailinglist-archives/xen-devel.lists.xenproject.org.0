Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5322412715B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 00:23:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii55d-00030h-7i; Thu, 19 Dec 2019 23:20:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tNyU=2J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ii55b-00030c-Qq
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 23:20:15 +0000
X-Inumbo-ID: 1c8119c0-22b6-11ea-92c0-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c8119c0-22b6-11ea-92c0-12813bfff9fa;
 Thu, 19 Dec 2019 23:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576797614;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=dSQoTW6iborudtaixfHO/fM1OsgPMYXG2p7MKB/sIj0=;
 b=E2BxdGfUxkemtzrxNXoapae/m7/vJrlU5hIoHYo20P1p2KndTEqSciJz
 Rh0oIhFW6IyY9Ue5jbJ5gS7snBKK9KVARel6FsgJbKgqjq8INHf8hHfOM
 25Nh+XXmq80Cfb0f3lqfLrdvg5lcHwm0hf5EOHwdXC4nwSkoN8j9LK1Nl A=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aSUqhlFxDdTtLhpFp+alVbPQcjl2WyoY5DtQt2/kN7L0snpWqfJtd+o6b0fefii+SHuNY5jXCS
 3cqEM66xiR1nAMm1ESCoqj91IFPvPuK7zxEfc0pkMTatb27alYJPsKoweZGBjqF6BpNPPr5Awj
 yRKd/YXxz0t2qFlMcPwetuWRvhVAtRLpFUwPr53ndjbVLOl52j73aLuohXCibd3TlNvmdkMoHY
 I+0wfzQOWvZFRaJlU+OXwiVNh43T5Cv2cpSHEd2pdP/Z8/j4GZ/73pCn5oD7JspXBpFu+odOYh
 MFU=
X-SBRS: 2.7
X-MesageID: 10552373
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,333,1571716800"; d="scan'208";a="10552373"
To: <xen-devel@lists.xenproject.org>
References: <20191217154625.31561-1-sergey.dyasli@citrix.com>
 <a5e3c4b7-40f4-017b-1154-d75f92075597@suse.com>
 <65aecab1-a1b0-f02e-be92-cda3cd37b9e5@citrix.com>
 <e997ff3e-4260-c872-0166-3885ce1a4ee1@suse.com>
 <2e8bc256-6e7f-ff3d-0917-c744a92cc6ac@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <57c18dc3-f901-6177-5f29-240c41cd7a9b@citrix.com>
Date: Thu, 19 Dec 2019 23:20:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2e8bc256-6e7f-ff3d-0917-c744a92cc6ac@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xsm: hide detailed Xen version from
 unprivileged guests
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMTIvMjAxOSAyMzoxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOS8xMi8yMDE5
IDExOjM1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gICAgIFhFTlZFUl9jaGFuZ2VzZXQKPj4+
Pj4gICAgIFhFTlZFUl9jb21tYW5kbGluZQo+Pj4+PiAgICAgWEVOVkVSX2J1aWxkX2lkCj4+Pj4+
Cj4+Pj4+IFJldHVybiBhIG1vcmUgY3VzdG9tZXIgZnJpZW5kbHkgZW1wdHkgc3RyaW5nIGluc3Rl
YWQgb2YgIjxkZW5pZWQ+Igo+Pj4+PiB3aGljaCB3b3VsZCBiZSBzaG93biBpbiB0b29scyBsaWtl
IGRtaWRlY29kZS4+Cj4+Pj4gSSB0aGluayAiPGRlbmllZD4iIGlzIHF1aXRlIGZpbmUgZm9yIG1h
bnkgb2YgdGhlIG9yaWdpbmFsIHB1cnBvc2VzLgo+Pj4+IE1heWJlIGl0IHdvdWxkIGJlIGJldHRl
ciB0byBmaWx0ZXIgZm9yIHRoaXMgd2hlbiBwb3B1bGF0aW5nIGd1ZXN0Cj4+Pj4gRE1JIHRhYmxl
cz8KPj4+IEkgZG9uJ3Qga25vdyBob3cgRE1JIHRhYmxlcyBhcmUgcG9wdWxhdGVkLCBidXQgbm90
aGluZyBzdG9wcyBhIGd1ZXN0Cj4+PiBmcm9tIHVzaW5nIHRoZXNlIGh5cGVyY2FsbHMgZGlyZWN0
bHkuCj4+IEFuZCB0aGlzIGlzIHByZWNpc2VseSB0aGUgY2FzZSB3aGVyZSBJIHRoaW5rICI8ZGVu
aWVkPiIgaXMgYmV0dGVyCj4+IHRoYW4gYW4gZW1wdHkgc3RyaW5nLgo+ICI8ZGVuaWVkPiIgd2Fz
IGEgdGVycmlibGUgY2hvaWNlIGJhY2sgd2hlbiBpdCB3YXMgaW50cm9kdWNlZCwgYW5kIGl0cwo+
IHN0aWxsIGEgdGVycmlibGUgY2hvaWNlIHRvZGF5Lgo+Cj4gVGhlc2UgYXJlIEFTQ0lJIHN0cmlu
ZyBmaWVsZHMsIGFuZCB0aGUgZW1wdHkgc3RyaW5nIGlzIGEgcGVyZmVjdGx5IGdvb2QKPiBzdHJp
bmcuwqAgTm90aGluZyBpcyBnb2luZyB0byBicmVhaywgYmVjYXVzZSBpdCB3b3VsZCBoYXZlIGJy
b2tlbiB0aGUKPiBmaXJzdCB0aW1lIGFyb3VuZC4KClNvcnJ5IC0gc2VuZCBqdXN0IHRvbyBlYXJs
eS4KClRoaXMgaGFzIHNoaXBwZWQgaW4gc2V2ZXJhbCB2ZXJzaW9ucyBvZiBYZW5TZXJ2ZXIgYWxy
ZWFkeS7CoCBJdCBpcyBwYXJ0Cm9mIGEgZWZmb3J0IHRvIHByZXZlbnQgZWFzeSBmaW5nZXJwcmlu
dGluZyBvZiB0aGUgYmluYXJ5IGh5cGVydmlzb3IgLSBhCnNlY3VyaXR5IG1lYXN1cmUgd2hpY2gg
d2FzIHJlcXVlc3RlZCBzcGVjaWZpY2FsbHkgYnkgYSBudW1iZXIgb2YgY3VzdG9tZXJzLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
