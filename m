Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553CF10D567
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:06:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaf0E-0002rq-2T; Fri, 29 Nov 2019 12:04:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaf0B-0002ra-NR
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:03:59 +0000
X-Inumbo-ID: 533d1f5c-12a0-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 533d1f5c-12a0-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 12:03:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9EB21AC24;
 Fri, 29 Nov 2019 12:03:58 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191125172213.1904-1-roger.pau@citrix.com>
 <20191125172213.1904-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <832d4778-c524-4fcb-30a8-2027a58b25fd@suse.com>
Date: Fri, 29 Nov 2019 13:04:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191125172213.1904-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/tlbflush: do not toggle the PGE CR4
 bit unless necessary
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMjAxOSAxODoyMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFdoZW4gUENJRCBp
cyBub3QgYXZhaWxhYmxlIFhlbiBkb2VzIGEgZnVsbCB0bGJmbHVzaCBieSB0b2dnbGluZyB0aGUK
PiBQR0UgYml0IGluIENSNC4gVGhpcyBpcyBub3QgbmVjZXNzYXJ5IGlmIFBHRSBpcyBub3QgZW5h
YmxlZCwgc2luY2UgYQo+IGZsdXNoIGNhbiBiZSBwZXJmb3JtZWQgYnkgd3JpdGluZyB0byBDUjMg
aW4gdGhhdCBjYXNlLgo+IAo+IENoYW5nZSB0aGUgY29kZSBpbiBkb190bGJfZmx1c2ggdG8gb25s
eSB0b2dnbGUgdGhlIFBHRSBiaXQgaW4gQ1I0IGlmCj4gaXQncyBhbHJlYWR5IGVuYWJsZWQsIG90
aGVyd2lzZSBkbyB0aGUgdGxiIGZsdXNoIGJ5IHdyaXRpbmcgdG8gQ1IzLgo+IFRoaXMgaXMgcmVs
ZXZhbnQgd2hlbiBydW5uaW5nIHZpcnR1YWxpemVkLCBzaW5jZSBoeXBlcnZpc29ycyBkb24ndAo+
IHVzdWFsbHkgdHJhcCBhY2Nlc3NlcyB0byBDUjMgd2hlbiB1c2luZyBoYXJkd2FyZSBhc3Npc3Rl
ZCBwYWdpbmcsIGJ1dAo+IGRvIHRyYXAgYWNjZXNzZXMgdG8gQ1I0IHNwZWNpYWxseSBvbiBBTUQg
aGFyZHdhcmUsIHdoaWNoIG1ha2VzIHN1Y2gKPiBhY2Nlc3NlcyBtdWNoIG1vcmUgZXhwZW5zaXZl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4Kd2l0aCBv
bmUgcmVtYXJrOgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYwo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9mbHVzaHRsYi5jCj4gQEAgLTg0LDYgKzg0LDcgQEAgc3RhdGljIHZvaWQgcG9zdF9m
bHVzaCh1MzIgdCkKPiAgc3RhdGljIHZvaWQgZG9fdGxiX2ZsdXNoKHZvaWQpCj4gIHsKPiAgICAg
IHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gKyAgICB1bnNpZ25lZCBsb25nIGNyNDsKClRoaXMgd291
bGQgYmV0dGVyIGJlIG1lcmdlZCB3aXRoIHRoZSBhZGphY2VudCBkZWNsYXJhdGlvbi4gQ2FuIHN1
cmVseQpiZSBkb25lIHdoaWxlIGNvbW1pdHRpbmcuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
