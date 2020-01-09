Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E44A13619E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 21:16:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipeC4-00067p-GW; Thu, 09 Jan 2020 20:14:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Dp4R=26=kojedz.in=richard@srs-us1.protection.inumbo.net>)
 id 1ipeC2-00067k-C2
 for xen-devel@lists.xen.org; Thu, 09 Jan 2020 20:14:10 +0000
X-Inumbo-ID: 96747f58-331c-11ea-b89f-bc764e2007e4
Received: from pi.kojedz.in (unknown [2a01:be00:10:201:0:80:0:1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96747f58-331c-11ea-b89f-bc764e2007e4;
 Thu, 09 Jan 2020 20:14:07 +0000 (UTC)
Received: from webmail.srv.kojedz.in (pi.kojedz.in
 [IPv6:2a01:be00:10:201:0:80:0:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: richard@kojedz.in)
 by pi.kojedz.in (Postfix) with ESMTPSA id E9565A183;
 Thu,  9 Jan 2020 21:14:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kojedz.in; s=mail;
 t=1578600846; bh=PvqA3IQWC5o711GQAJYeVFvMnO+qw7h61EduB1yWPdc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Is0oTQkcUdzMlwES6FWhslB/BR1zc8gsYVZhoThxJtJNgXMoRKBbXfQD6fmLS6Xae
 Kns4h71MKZ+XZZyKHJGZl5Vi7rw/p420nwTOqgH/tO1VhK+0p/qxuUn5hjfS2+458N
 4CosTkBIklJ6Z1XZIBtYKn3q/Iak+Bo8AiK+0sE0/Urrrva//mtzAUvWw537JeDlDF
 KyqEajA1vfGMY/WjXcOEezLsQtmjJjWtTCLMV6Pm1YEMSVGWvPANi0s/3KMSADoh9K
 Ppga1MLPLGUUv/f1IaK8yNFeR90V39FzWUh7dv/V+VRC20fxfW1gyawdbt3wII+gr7
 F0/JLloxZBUUO4FKK/g/BhsqoOP9TKff4HjNe10Sa0B75nojTADG+6tWwZqXfeUxHo
 gZ+Ql5zYUkbBRQwNgC8aQqbW5Cq14+um6o6IeVsq8xe55WHDcCXjm+4Rs/Hwwzu7Kw
 Z55XrI3lo4ZfO3Yp7nlNEMwuRsXIQRbqYgSSlueg3OvyU3R4S8q/2DNRn7S7cNHfMY
 RKkwdBOlJ+RUUFPwrXkoi34cPFZyDAXTc/80IC0eMZrZZJn6dm8HOTXiV/wDhpP3zv
 OJapyTl2BdBGm5oASCCdqkUqwiG6R5NyWrUAkpHtYMHbncSbW/2Yk/6zVOgzsfzrS5
 i8MRPG9Z3e/u0Q/Dx975bHlU=
MIME-Version: 1.0
Date: Thu, 09 Jan 2020 21:14:05 +0100
From: Richard Kojedzinszky <richard@kojedz.in>
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <fb6f0116-cee6-d966-db99-b4af361eca9c@citrix.com>
References: <58431af1ddf1e33711c9850c715cd9cb@kojedz.in>
 <44c4fb96-6d5a-c10f-9659-06ed48617b91@citrix.com>
 <752a8e49b2d47526f5942d3427a4feb4@kojedz.in>
 <fb6f0116-cee6-d966-db99-b4af361eca9c@citrix.com>
Message-ID: <9ca5e24460fba4e89b4060105885c4d8@kojedz.in>
X-Sender: richard@kojedz.in
User-Agent: Roundcube Webmail/1.3.8
Subject: Re: [Xen-devel] [BUG] xenstat_vcpu_ns returns invalid value
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
Cc: xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MjAyMC0wMS0wOSAyMToxMCBpZMWRcG9udGJhbiBBbmRyZXcgQ29vcGVyIGV6dCDDrXJ0YToKPiBP
biAwOS8wMS8yMDIwIDIwOjA5LCBSaWNoYXJkIEtvamVkemluc3preSB3cm90ZToKPj4gMjAyMC0w
MS0wOSAyMDo1MCBpZMWRcG9udGJhbiBBbmRyZXcgQ29vcGVyIGV6dCDDrXJ0YToKPj4+IE9uIDA5
LzAxLzIwMjAgMTk6NDAsIFJpY2hhcmQgS29qZWR6aW5zemt5IHdyb3RlOgo+Pj4+IERlYXIgWGVu
IERldnMsCj4+Pj4gCj4+Pj4gY29tbWl0IDI1MjljODUwZWE0OGYwMzY3MjdjYTJmMTQ4Y2FlZDg5
MzkxMzExYjggaW50cm9kdWNlcyB0aGUKPj4+PiBYRU5fUlVOU1RBVEVfVVBEQVRFIG1hcmtlciBi
aXQsIHdoaWNoIGlzIG5vdCBoYW5kbGVkIGluCj4+Pj4gdmNwdV9ydW5zdGF0ZV9nZXQoKSBpbiB4
ZW4vY29tbW9uL3NjaGVkdWxlLmMuIFJlbGV2YW50IGNvZGU6Cj4+Pj4gCj4+Pj4gwqDCoMKgIGRl
bHRhID0gTk9XKCkgLSBydW5zdGF0ZS0+c3RhdGVfZW50cnlfdGltZTsKPj4+PiDCoMKgwqAgaWYg
KCBkZWx0YSA+IDAgKQo+Pj4+IMKgwqDCoMKgwqDCoMKgIHJ1bnN0YXRlLT50aW1lW3J1bnN0YXRl
LT5zdGF0ZV0gKz0gZGVsdGE7Cj4+PiAKPj4+IFRoYXQgd2FzIGZvdW5kIGFuZCBmaXhlZCBhIHdo
aWxlIGFnby7CoCBjL3MgZjI4YzRjNGMxMCAic2NoZWQ6IGRvbid0IAo+Pj4gbGV0Cj4+PiBYRU5f
UlVOU1RBVEVfVVBEQVRFIGxlYWsgaW50byB2Y3B1X3J1bnN0YXRlX2dldCgpIi4KPj4+IAo+Pj4g
Tm8gY2hhbmdlcyBpbiB1c2Vyc3BhY2Ugc2hvdWxkIGJlIG5lY2Vzc2FyeSwgYWx0aG91Z2ggeW91
IG1pZ2h0IG5lZWQgCj4+PiB0bwo+Pj4gcGVzdGVyIHlvdXIgZGlzdHJvIGZvciBiYWNrcG9ydHMu
Cj4+PiAKPj4+IH5BbmRyZXcKPj4gCj4+IEhpLAo+PiAKPj4gVGhhbmtzIGZvciB0aGUgcXVpY2sg
cmVwbHksCj4+IAo+PiBUaGVuLCBhcyBpdCBpcyBqdXN0IGEgbGVhaywgdW50aWwgYSBiYWNrcG9y
dCBhcnJpdmVzIHRvIG15IGRpc3RybywgSQo+PiBjYW4gbWFzayBvdXQgdGhhdCBiaXQgZnJvbSB0
aGUgcmVzdWx0cyB3aXRoIG5vIG90aGVyIHNpZGUtZWZmZWN0cywgYW0KPj4gSSByaWdodD8KPiAK
PiBZZXMgLSB0aGF0IHNob3VsZCBiZSBzYWZlLgo+IAo+IH5BbmRyZXcKCkhpLAoKTWFueSB0aGFu
a3MsIEkgd2lsbCBkbyB0aGF0LgoKUmVnYXJkcywKUmljaGFyZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
