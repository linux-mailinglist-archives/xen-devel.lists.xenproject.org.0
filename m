Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6298FA66
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 07:28:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyUk9-0000Ix-30; Fri, 16 Aug 2019 05:25:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eEcF=WM=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1hyUk7-0000Is-Ot
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 05:25:39 +0000
X-Inumbo-ID: 454a62ea-bfe6-11e9-813a-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 454a62ea-bfe6-11e9-813a-bc764e2007e4;
 Fri, 16 Aug 2019 05:25:36 +0000 (UTC)
Received: from lamp.crc.id.au (lamp.crc.id.au [IPv6:2407:e400:b000:200::8e8e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 20FE32000C2;
 Fri, 16 Aug 2019 15:25:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1565933135; bh=R3itwYmhidaAv9bNebEDXXBdNPy57aQsgtno8hbaMjM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=n2GhnaXCXnNtIYFaQt8bDLU22G+HCPLkpCKnn376puk/BWaJwbiNUhtML41V8U8mS
 nW+kFqvNU47NZqmEnjNzdb+U1uq1EKcJ806CkiQJTjGKaTfX5lvdiX7Mod8EaqFe69
 0G78H5WJDfpNiUfj0o1CdzUHt+CMAmxgbRtIVYs4=
MIME-Version: 1.0
Date: Fri, 16 Aug 2019 15:25:32 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
In-Reply-To: <alpine.LFD.2.21.1908151959060.2715@austen3.home>
References: <alpine.LFD.2.21.1908150030150.2807@austen3.home>
 <alpine.LFD.2.21.1908150055060.2807@austen3.home>
 <18fb961102e8da16d1ad9576742bccf2@crc.id.au>
 <alpine.LFD.2.21.1908151959060.2715@austen3.home>
User-Agent: Roundcube Webmail/1.4-rc1
Message-ID: <114550b6cd3e7936e055a63ebbb2c7a6@crc.id.au>
X-Sender: netwiz@crc.id.au
Subject: Re: [Xen-devel] [PATCH] read grubenv and set default from
 saved_entry or next_entry
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wOC0xNiAwNTowNSwgWU9VTkcsIE1JQ0hBRUwgQS4gd3JvdGU6Cj4gT24gVGh1LCAx
NSBBdWcgMjAxOSwgU3RldmVuIEhhaWdoIHdyb3RlOgo+IAo+PiBIYXZpbmcgYSBiaXQgb2YgYSBs
b29rIGhlcmUuLi4uCj4+IAo+PiBNeSB0ZXN0IHN5c3RlbSBncnViZW52IGZpbGUgaGFzOgo+PiAj
IEdSVUIgRW52aXJvbm1lbnQgQmxvY2sKPj4gc2F2ZWRfZW50cnk9MAo+PiBrZXJuZWxvcHRzPXJv
b3Q9VVVJRD01MzQ2YjRkOS04ODVmLTQ2NzMtOGFmZi0wNGExNmJmMTk3MWEgcm8KPj4gcm9vdGZs
YWdzPXN1YnZvbD1yb290IHNlbGludXg9MCByaGdiIHF1aWV0Cj4+IGJvb3Rfc3VjY2Vzcz0xCj4+
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiAKPiBJIGhhdmUgYXR0YWNoZWQgYSByZXZpc2lvbiBvZiB0aGUgZmlyc3Qg
cGF0Y2ggd2hpY2ggc2hvdWxkIGhhbmRsZSBhCj4gbnVtZXJpYyBzYXZlZF9lbnRyeS4KCkhpIE1p
Y2hhZWwsCgpJIHRyaWVkIHRoaXMgLSBhbmQgaXQgc3VjY2Vzc2Z1bGx5IHdvcmtzIGZvciBzeXN0
ZW1zIHRoYXQgaGF2ZSAKc2F2ZWRfZW50cnk9MC4KCkkgbm90aWNlZCB0aGF0IHN0b2NrIGluc3Rh
bGxzIHN0aWxsIGhhdmUgcHJvYmxlbXMgd2l0aCB1cGRhdGluZyBncnViZW52IApmcm9tIG5ldyBr
ZXJuZWwgaW5zdGFsbHMuIEkgaGFkIHRvIG1hbnVhbGx5IHJlZ2VuZXJhdGUgZ3J1Yi5jZmcgYWZ0
ZXIgCnVwZ3JhZGluZyB0byBrZXJuZWwgNS4yLjguIGdydWJlbnYgZG9lc24ndCBzZWVtIHRvIGdl
dCBjaGFuZ2VkIGF0IGFsbCAKdW5sZXNzIHlvdSBtYW51YWxseSB1c2UgJ2dydWIyLXNldC1kZWZh
dWx0IDAnCgokIHJwbSAtcWEgfCBncmVwIGtlcm5lbCB8IHNvcnQKa2VybmVsLTUuMS4xNS0zMDAu
ZmMzMC54ODZfNjQKa2VybmVsLTUuMi44LTIwMC5mYzMwLng4Nl82NAprZXJuZWwtY29yZS01LjEu
MTUtMzAwLmZjMzAueDg2XzY0Cmtlcm5lbC1jb3JlLTUuMi44LTIwMC5mYzMwLng4Nl82NAprZXJu
ZWwtaGVhZGVycy01LjIuOC0yMDAuZmMzMC54ODZfNjQKa2VybmVsLW1vZHVsZXMtNS4xLjE1LTMw
MC5mYzMwLng4Nl82NAprZXJuZWwtbW9kdWxlcy01LjIuOC0yMDAuZmMzMC54ODZfNjQKCiQgcnBt
IC1xYSB8IGdyZXAgZ3J1YiB8IHNvcnQKZ3J1YjItY29tbW9uLTIuMDItODEuZmMzMC5ub2FyY2gK
Z3J1YjItcGMtMi4wMi04MS5mYzMwLng4Nl82NApncnViMi1wYy1tb2R1bGVzLTIuMDItODEuZmMz
MC5ub2FyY2gKZ3J1YjItdG9vbHMtMi4wMi04MS5mYzMwLng4Nl82NApncnViMi10b29scy1lZmkt
Mi4wMi04MS5mYzMwLng4Nl82NApncnViMi10b29scy1leHRyYS0yLjAyLTgxLmZjMzAueDg2XzY0
CmdydWIyLXRvb2xzLW1pbmltYWwtMi4wMi04MS5mYzMwLng4Nl82NApncnViYnktOC40MC0zMS5m
YzMwLng4Nl82NApncnViYnktZGVwcmVjYXRlZC04LjQwLTMxLmZjMzAueDg2XzY0CgokIGNhdCAv
ZXRjL2RlZmF1bHQvZ3J1YgpHUlVCX1RJTUVPVVQ9MQpHUlVCX0RFRkFVTFQ9c2F2ZWQKR1JVQl9E
SVNBQkxFX1NVQk1FTlU9dHJ1ZQpHUlVCX1RFUk1JTkFMX09VVFBVVD0iY29uc29sZSIKR1JVQl9D
TURMSU5FX0xJTlVYPSJhdWRpdD0wIHNlbGludXg9MCBjb25zb2xlPWh2YzAiCkdSVUJfRElTQUJM
RV9SRUNPVkVSWT0idHJ1ZSIKR1JVQl9FTkFCTEVfQkxTQ0ZHPWZhbHNlCgpJdCBzZWVtcyB3ZSBz
dGlsbCBoYXZlIGlzc3VlcyB3aXRoIHRoaXMgY29uZmlndXJhdGlvbiAtIGJ1dCB0aGlzIGlzIGEg
CkZlZG9yYSAzMCBwcm9ibGVtIC0gIG5vdCBYZW4uCgotLSAKU3RldmVuIEhhaWdoCgo/IG5ldHdp
ekBjcmMuaWQuYXUgICAgID8gaHR0cDovL3d3dy5jcmMuaWQuYXUKPyArNjEgKDMpIDkwMDEgNjA5
MCAgICA/IDA0MTIgOTM1IDg5NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
