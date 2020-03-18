Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9510189CEF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 14:27:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEYhL-0001Dp-46; Wed, 18 Mar 2020 13:25:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEYhK-0001Di-19
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 13:25:26 +0000
X-Inumbo-ID: ed1b7890-691b-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed1b7890-691b-11ea-b34e-bc764e2007e4;
 Wed, 18 Mar 2020 13:25:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5CF4DABEF;
 Wed, 18 Mar 2020 13:25:24 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <916bbc82cafac74f0a203b48eebfbc711bd33a70.camel@infradead.org>
 <c22d4a40717c7d2fad243c244619d2882ad5baf2.camel@infradead.org>
 <5fc87ac4-8be9-3881-03af-85faca1e2bf5@suse.com>
 <70fc2d7cd6c0f5b09607ca8a90c998f3a29019b6.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51a8101f-3b67-c3a9-b6c3-30f81c82c20d@suse.com>
Date: Wed, 18 Mar 2020 14:25:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <70fc2d7cd6c0f5b09607ca8a90c998f3a29019b6.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/setup: simplify handling of
 initrdidx when no initrd present
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
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <xadimgnik@gmail.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAxMzozMywgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIFdlZCwgMjAy
MC0wMy0xOCBhdCAxMjo1MSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE4LjAzLjIw
MjAgMTI6NDYsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4+IEZyb206IERhdmlkIFdvb2Rob3Vz
ZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4+Pgo+Pj4gUmVtb3ZlIGEgdGVybmFyeSBvcGVyYXRvciB0
aGF0IG1hZGUgbXkgYnJhaW4gaHVydC4KPj4KPj4gTXkgcG9zaXRpb24gdG93YXJkcyB0aGlzIGhh
c24ndCBjaGFuZ2VkLCBqdXN0IGZ0ci4KPiAKPiBZb3VyIHBvc2l0aW9uIHdhcyBub3QgY2xlYXJs
eSBzdGF0ZWQuIEluCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDIwLTAyL21zZzAxNjY0Lmh0bWwKPiB5b3UgaW5kaWNhdGVkIHRoYXQgeW91
IHByZWZlcnJlZCBmb3IgaXQgdG8gcmVtYWluIGFzLWlzIGJ1dCB5b3UgZGlkIG5vdAo+IGV2ZW4g
c2VlbSB0byBiZSBkaXNwdXRpbmcgdGhhdCB0aGUgY29kZSBpcyBzaW1wbGVyIGFuZCBlYXNpZXIg
Zm9yIHRoZQo+IHJlYWRlciB0byB1bmRlcnN0YW5kIGFmdGVyIG15IGNsZWFudXAuCj4gCj4gSSB3
YXMgbGVmdCB3b25kZXJpbmcgaWYgeW91ciBwb3NpdGlvbiB3YXMgbWVyZWx5IHRoYXQgeW91ICps
aWtlZCoKPiBtYWtpbmcgbXkgYnJhaW4gaHVydD8gOikKCkVoZW0uIEkgd291bGQgaGF2ZSB0aG91
Z2h0IGluZGljYXRpbmcgdGhhdCB5b3UnZCBuZWVkIEFuZHJldydzCmFjayB3YXMgY2xlYXIgZW5v
dWdoIGEgc2lnbiB0aGF0IEkgd291bGRuJ3Qgd2FudCB0byBnaXZlIG1pbmUuCkknbSBzb3JyeSBp
ZiB0aGlzIHdhc24ndCB0aGUgY2FzZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
