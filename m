Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D27CC12B4CA
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 14:19:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikpUB-0000fX-Eu; Fri, 27 Dec 2019 13:16:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ikpU9-0000fS-LW
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 13:16:57 +0000
X-Inumbo-ID: 2350a964-28ab-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2350a964-28ab-11ea-b6f1-bc764e2007e4;
 Fri, 27 Dec 2019 13:16:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B7159B20A;
 Fri, 27 Dec 2019 13:16:47 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191224153247.48228-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9e0ddcc-7e7d-25bb-5752-dc73f9c9a365@suse.com>
Date: Fri, 27 Dec 2019 08:37:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191224153247.48228-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: virtualize x2APIC mode and APIC
 accesses can't both be enabled
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTIuMjAxOSAxNjozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEFjY29yZGluZyB0
byB0aGUgSW50ZWwgU0RNLCAidmlydHVhbGl6ZSB4MkFQSUMgbW9kZSIgYW5kICJ2aXJ0dWFsaXpl
Cj4gQVBJQyBhY2Nlc3NlcyIgY2FuJ3QgYmUgZW5hYmxlZCBhdCB0aGUgc2FtZSB0aW1lLCBvciBl
bHNlIGEKPiB2bXtsYXVuY2gvZW50cnl9IGZhaWx1cmUgd2lsbCBoYXBwZW4uIFRoaXMgd2FzIHNl
ZW4gd2hlbiBydW5uaW5nIFhlbgo+IG5lc3RlZCBhbmQgd2l0aCB4MkFQSUMgZW5hYmxlZDoKPiAK
PiBEZWMgMjMgMjA6MDY6NTQuNDQ0MDI1IChYRU4pIGQzdjAgVk1MQVVOQ0ggZXJyb3I6IDB4Nwo+
IFsuLi5dCj4gRGVjIDIzIDIwOjA4OjMzLjAwNDA3OCAoWEVOKSAqKiogQ29udHJvbCBTdGF0ZSAq
KioKPiBEZWMgMjMgMjA6MDg6MzMuMDA0MDg2IChYRU4pIFBpbkJhc2VkPTAwMDAwMDNmIENQVUJh
c2VkPWI2YTA3NWZlIFNlY29uZGFyeUV4ZWM9MDAwMDE0ZmIKPiBbLi4uXQo+IAo+IEZpeCB0aGlz
IGJ5IG1ha2luZyBzdXJlIG52bXhfdXBkYXRlX3NlY29uZGFyeV9leGVjX2NvbnRyb2wgY2xlYXJz
IHRoZQo+IGluY29tcGF0aWJsZSBiaXRzIGZyb20gdGhlIGhvc3Qgdm1jcyBiZWZvcmUgbWVyZ2lu
ZyBpdCB3aXRoIHRoZSBuZXN0ZWQKPiB2bWNzLgo+IAo+IFRoaXMgZml4ZXMgYSByZWdyZXNzaW9u
IHJlcG9ydGVkIGJ5IG9zc3Rlc3QgaW4gdGhlCj4gdGVzdC1hbWQ2NC1hbWQ2NC1xZW11dS1uZXN0
ZWQtaW50ZWwgam9iLgoKSXQgd291bGQgc3VyZWx5IGhhdmUgYmVlbiBuaWNlIHRvIGluY2x1ZGUg
YSByZWZlcmVuY2UgdG8gdGhlCm9mZmVuZGluZyBjb21taXQsIGRlc3BpdGUgdGhlIGJ1ZyBoYXZp
bmcgYmVlbiBsYXRlbnRseSB0aGVyZQpiZWZvcmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
