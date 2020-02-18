Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2AE162196
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 08:43:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3xV9-0005QI-VW; Tue, 18 Feb 2020 07:41:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LnEJ=4G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j3xV9-0005QD-0u
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 07:41:03 +0000
X-Inumbo-ID: 027efa24-5222-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 027efa24-5222-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 07:41:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9302CB269;
 Tue, 18 Feb 2020 07:41:00 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200217184324.73762-1-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cec31639-00ce-8ef1-4a7e-1d85a92b820e@suse.com>
Date: Tue, 18 Feb 2020 08:40:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217184324.73762-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/6] x86: fixes/improvements for scratch
 cpumask
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDIuMjAgMTk6NDMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBIZWxsbywKPiAKPiBD
b21taXQ6Cj4gCj4gNTUwMGQyNjVhMmE4ZmE2M2Q2MGMwOGJlYjU0OWRlOGVjODJmZjdhNQo+IHg4
Ni9zbXA6IHVzZSBBUElDIEFMTEJVVCBkZXN0aW5hdGlvbiBzaG9ydGhhbmQgd2hlbiBwb3NzaWJs
ZQo+IAo+IEludHJvZHVjZWQgYSBib2d1cyB1c2FnZSBvZiB0aGUgc2NyYXRjaCBjcHVtYXNrOiBp
dCB3YXMgdXNlZCBpbiBhCj4gZnVuY3Rpb24gdGhhdCBjb3VsZCBiZSBjYWxsZWQgZnJvbSBpbnRl
cnJ1cHQgY29udGV4dCwgYW5kIGhlbmNlIHVzaW5nCj4gdGhlIHNjcmF0Y2ggY3B1bWFzayB0aGVy
ZSBpcyBub3Qgc2FmZS4gUGF0Y2ggIzUgaXMgYSBmaXggZm9yIHRoYXQgdXNhZ2UsCj4gdG9nZXRo
ZXIgd2l0aCBhbHNvIHByZXZlbnRpbmcgdGhlIHVzYWdlIG9mIGFueSBwZXItQ1BVIHZhcmlhYmxl
cyB3aGVuCj4gc2VuZF9JUElfbWFzayBpcyBjYWxsZWQgZnJvbSAjTUMgb3IgI05NSSBjb250ZXh0
LiBQcmV2aW91cyBwYXRjaGVzIGFyZQo+IHByZXBhcmF0b3J5IGNoYW5nZXMuCj4gCj4gUGF0Y2gg
IzYgYWRkcyBzb21lIGRlYnVnIGluZnJhc3RydWN0dXJlIHRvIG1ha2Ugc3VyZSB0aGUgc2NyYXRj
aCBjcHVtYXNrCj4gaXMgdXNlZCBpbiB0aGUgcmlnaHQgY29udGV4dCwgYW5kIGhlbmNlIHNob3Vs
ZCBwcmV2ZW50IGZ1cnRoZXIgbWlzc3VzZXMuCgpJIHdvbmRlciB3aGV0aGVyIGl0IHdvdWxkbid0
IGJlIGJldHRlciB0byBoYXZlIGEgY29tbW9uIHBlcmNwdSBzY3JhdGNoCmNwdW1hc2sgaGFuZGxp
bmcgaW5zdGVhZCBvZiBpbnRyb2R1Y2luZyBsb2NhbCBvbmVzIGFsbCBvdmVyIHRoZQpoeXBlcnZp
c29yLgoKU28gYmFzaWNhbGx5IGFuIGFycmF5IG9mIHBlcmNwdSBjcHVtYXNrcyBhbGxvY2F0ZWQg
d2hlbiBicmluZ2luZyB1cCBhCmNwdSAodGhpcyBzcGFyZXMgbWVtb3J5IGFzIHRoZSBtYXNrcyB3
b3VsZG4ndCBuZWVkIHRvIGNvdmVyIE5SX0NQVVMKY3B1cyksIGEgcGVyY3B1IGNvdW50ZXIgb2Yg
dGhlIG5leHQgZnJlZSBpbmRleCBhbmQgZ2V0XyBhbmQgcHV0XwpmdW5jdGlvbnMgYWN0aW5nIGlu
IGEgbGlmbyBtYW5uZXIuCgpUaGlzIHdvdWxkIGhlbHAgcmVtb3ZpbmcgYWxsIHRoZSBzdGlsbCBl
eGlzdGluZyBjcHVtYXNrcyBvbiB0aGUgc3RhY2sKYW5kIGFueSBpbGxlZ2FsIG5lc3Rpbmcgd291
bGQgYmUgYXZvaWRlZC4gVGhlIG9ubHkgcmVtYWluaW5nIHF1ZXN0aW9uCndvdWxkIGJlIHRoZSBz
aXplIG9mIHRoZSBhcnJheS4KClRob3VnaHRzPwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
