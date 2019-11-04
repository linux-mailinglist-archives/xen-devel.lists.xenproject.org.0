Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C585EF15B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 00:45:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRlzH-0005Gd-T3; Mon, 04 Nov 2019 23:42:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kevs=Y4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iRlzF-0005GV-Pc
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 23:42:17 +0000
X-Inumbo-ID: bb82d0cc-ff5c-11e9-b678-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb82d0cc-ff5c-11e9-b678-bc764e2007e4;
 Mon, 04 Nov 2019 23:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572910936;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=k6Avz7cyl0RDiAKKB4B48BzuaUwuDYziA/pw2B4Gfeg=;
 b=VFhNYZ/P6pfZuoHcvgcYut+CduMAWruvUhtwvyDgvQvMG8J4PKSmJnv+
 XQlHdCgQG4iAP+369+DQ59JCoa/mKWPPmsP08ueotxUJozAkO5/vxE71Z
 NAImQzD7O0dhEiF1nXJ9uZpfWM9ZLCRUGKOMwt9yyg6wQai0/k0CKwFsF 4=;
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
IronPort-SDR: d6TxX/Zj7/r3cJUJBbbXQf9zU2i80HjykHb2gpPCEVPLT24/Y6Z0uu7eC/3uhdeM6Z1ZInHliY
 jTL3JrpljBtmrCVUSkONayF/V31PygGdv8ulSWZKrnOdhnMV1P9bYVKZq3KPTVE0H5lk3E+r+Q
 81ELO3wSi8Nx+Ffuq65rVG+OhagF6htJzvyR+GLJUNjhz50yd6HZhwxJvF/eMPnkWMXFc56wUh
 k6eVFE9pg0NGXs4bAgWZzX8L1/PajhsjiAv40LC4smjqzbATrGjDxf4EK7Qn88OQXQroorZo72
 tX0=
X-SBRS: 2.7
X-MesageID: 8180864
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,268,1569297600"; 
   d="scan'208";a="8180864"
To: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>,
 <xen-devel@lists.xenproject.org>
References: <19c16a0b-514d-8e2b-a2ea-ce35ab3c3952@alstadheim.priv.no>
 <bc0b45b1-be20-e1f2-81dc-cbfec71a6599@citrix.com>
 <b9aad1ea-fae3-047a-3c01-3d00a756aa2f@alstadheim.priv.no>
 <2e25eb60-7f59-d7bf-8f8c-4dc2790c0840@citrix.com>
 <25043c4e-c2ec-c47b-513f-2c0d93c23f26@alstadheim.priv.no>
 <099cb111-cc9b-59da-809a-17ddf896f16d@citrix.com>
 <62c8abc6-5971-7978-b337-44392927a985@citrix.com>
 <550d8bb6-7953-0749-8d32-c0d4820e0e55@alstadheim.priv.no>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <92d3a465-1ee5-c4b5-4376-dea176713836@citrix.com>
Date: Mon, 4 Nov 2019 23:42:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <550d8bb6-7953-0749-8d32-c0d4820e0e55@alstadheim.priv.no>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] Invalid guest state in Xen master,
 dom0 linux-5.3.6, domU windows 10
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

T24gMDQvMTEvMjAxOSAyMzoyMCwgSMOla29uIEFsc3RhZGhlaW0gd3JvdGU6Cj4KPiAoWEVOKSBS
RkxBR1M9MHgwMDAwMDE5MyAoMHgwMDAwMDE5MynCoCBEUjcgPSAweDAwMDAwMDAwMDAwMDA0MDAK
PiA8c25pcD4KPiAoWEVOKSAqKiogSW5zbiBieXRlcyBmcm9tIGZmZmZiODg2OGY2MWQ2OWE6IDQ0
IDAwIDAwIDhjIGQwIDljIDgxIDBjIDI0Cj4gMDAgMDEgMDAgMDAgOWQgOGUgZDAgPGZmZmZmZmYx
PiA5YyA4MSAyNCAyNCBmZiBmZSBmZiBmZiA5ZCBjMyBjYyBjYyBjYwo+IGNjIGNjCgpPay7CoCBP
bmUgcXVlc3Rpb24gYW5zd2VyZWQsIHNldmVyYWwgbW9yZSBXVEYuCgowMDAwMDAwMDAwMDAwMDAw
IDwuZGF0YT46CsKgwqAgMDrCoMKgwqAgNDQgMDAgMDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
wqDCoMKgIGFkZMKgwqDCoCAlcjhiLCglcmF4KQrCoMKgIDM6wqDCoMKgIDhjIGQwwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgwqDCoCBtb3bCoMKgwqAgJXNzLCVlYXgKwqDCoCA1OsKg
wqDCoCA5Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgcHVzaGZx
CsKgwqAgNjrCoMKgwqAgODEgMGMgMjQgMDAgMDEgMDAgMDAgwqDCoMKgIG9ybMKgwqDCoCAkMHgx
MDAsKCVyc3ApCsKgwqAgZDrCoMKgwqAgOWTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgwqDCoMKgIHBvcGZxwqAKwqDCoCBlOsKgwqDCoCA4ZSBkMMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCDCoMKgwqAgbW92wqDCoMKgICVlYXgsJXNzCsKgIDEwOsKgwqDCoCBmMcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgaWNlYnDCoArCoCAxMTrC
oMKgwqAgOWPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIHB1c2hm
cQrCoCAxMjrCoMKgwqAgODEgMjQgMjQgZmYgZmUgZmYgZmYgwqDCoMKgIGFuZGzCoMKgICQweGZm
ZmZmZWZmLCglcnNwKQrCoCAxOTrCoMKgwqAgOWTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgwqDCoMKgIHBvcGZxwqAKwqAgMWE6wqDCoMKgIGMzwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIMKgwqDCoCByZXRxwqDCoArCoCAxYjrCoMKgwqAgY2PCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIGludDPCoMKgCsKgIDFjOsKgwqDC
oCBjY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgaW50M8KgwqAK
wqAgMWQ6wqDCoMKgIGNjwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgwqDC
oCBpbnQzwqDCoArCoCAxZTrCoMKgwqAgY2PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgwqDCoMKgIGludDPCoMKgCsKgIDFmOsKgwqDCoCBjY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgaW50M8KgwqAKCgpUaGlzIGlzIGEgc2VyaW91cyBleGVy
Y2lzaW5nIG9mIGFyY2hpdGVjdHVyYWwgY29ybmVyIGNhc2VzLCBieSBsYXllcmluZwphIHNpbmds
ZSBzdGVwIGV4Y2VwdGlvbiBvbiB0b3Agb2YgYSBNb3ZTUy1kZWZlcnJlZCBJQ0VCUC4KCk5vdyBJ
J3ZlIGxvb2tlZCBjbG9zZXIsIHRoaXMgaXNuJ3QgYSBDVkUtMjAxOC04ODk3IGV4cGxvaXQgYXMg
bm8KYnJlYWtwb2ludHMgYXJlIGNvbmZpZ3VyZWQgaW4gJWRyNywgc28gSSdtIGdvaW5nIHRvIHJl
dmlzZSBteSBndWVzcyBzb21lCm5ldyBkZWJ1Z2dlci1kZXRlY3Rpb24gaW4gRFJNIHNvZnR3YXJl
LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
