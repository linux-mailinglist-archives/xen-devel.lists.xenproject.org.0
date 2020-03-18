Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA413189B5A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 12:53:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEXEC-0001U8-54; Wed, 18 Mar 2020 11:51:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEXEA-0001U3-Av
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 11:51:14 +0000
X-Inumbo-ID: c43bcd24-690e-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c43bcd24-690e-11ea-a6c1-bc764e2007e4;
 Wed, 18 Mar 2020 11:51:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 42775AD39;
 Wed, 18 Mar 2020 11:51:12 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <916bbc82cafac74f0a203b48eebfbc711bd33a70.camel@infradead.org>
 <c22d4a40717c7d2fad243c244619d2882ad5baf2.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5fc87ac4-8be9-3881-03af-85faca1e2bf5@suse.com>
Date: Wed, 18 Mar 2020 12:51:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c22d4a40717c7d2fad243c244619d2882ad5baf2.camel@infradead.org>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAxMjo0NiwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IEZyb206IERhdmlk
IFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gCj4gUmVtb3ZlIGEgdGVybmFyeSBvcGVy
YXRvciB0aGF0IG1hZGUgbXkgYnJhaW4gaHVydC4KCk15IHBvc2l0aW9uIHRvd2FyZHMgdGhpcyBo
YXNuJ3QgY2hhbmdlZCwganVzdCBmdHIuCgo+IFJlcGxhY2UgaXQgd2l0aCBzb21ldGhpbmcgc2lt
cGxlciB0aGF0IG1ha2VzIGl0IHNvbWV3aGF0IGNsZWFyZXIgdGhhdAo+IHRoZSBjaGVjayBmb3Ig
aW5pdHJkaWR4IDwgbWJpLT5tb2RzX2NvdW50IGlzIGJlY2F1c2UgbGFyZ2VyIHZhbHVlcyBhcmUK
PiB3aGF0IGZpbmRfZmlyc3RfYml0KCkgd2lsbCByZXR1cm4gd2hlbiBpdCBkb2Vzbid0IGZpbmQg
YW55dGhpbmcuCj4gCj4gQWxzbyBkcm9wIHRoZSBleHBsaWNpdCBjaGVjayBmb3IgbW9kdWxlICMw
IHNpbmNlIHRoYXQgd291bGQgYmUgdGhlCj4gZG9tMCBrZXJuZWwgYW5kIHRoZSBjb3JyZXNwb25k
aW5nIGJpdCBpcyBhbHdheXMgY2xlYXIgaW4gbW9kdWxlX21hcC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgo+IEFja2VkLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKU3RyaWN0bHkgc3BlYWtpbmcgdGhpcyBpcyBub3QgYSB2
YWxpZCB0YWcgaGVyZSwgb25seSBSLWIgd291bGQgYmUuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
