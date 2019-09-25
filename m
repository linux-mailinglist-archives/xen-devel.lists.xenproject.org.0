Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7574BDE19
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 14:33:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD6RN-0004O3-9P; Wed, 25 Sep 2019 12:30:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD6RL-0004Nt-9w
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 12:30:39 +0000
X-Inumbo-ID: 470ad6a4-df90-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 470ad6a4-df90-11e9-8628-bc764e2007e4;
 Wed, 25 Sep 2019 12:30:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C035EAE6E;
 Wed, 25 Sep 2019 12:30:36 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190905194909.6811-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0d059668-7e2d-e5ca-4946-7024ec680bb8@suse.com>
Date: Wed, 25 Sep 2019 14:30:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190905194909.6811-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/cpuid: Extend the cpuid= option to
 support all named features
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

T24gMDUuMDkuMjAxOSAyMTo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBGb3IgZ2VuLWNwdWlk
LnB5LCBmaXggYSBjb21tZW50IGRlc2NyaWJpbmcgc2VsZi5uYW1lcywgYW5kIGdlbmVyYXRlIHRo
ZQo+IHJldmVyc2UgbWFwcGluZyBpbiBzZWxmLnZhbHVlcy4gIFdyaXRlIG91dCBJTklUX0ZFQVRV
UkVfTkFNRVMgd2hpY2ggbWFwcyBhCj4gc3RyaW5nIG5hbWUgdG8gYSBiaXQgcG9zaXRpb24uCj4g
Cj4gRm9yIHBhcnNlX2NwdWlkKCksIHVzZSBjbWRsaW5lX3N0cmNtcCgpIGFuZCBwZXJmb3JtIGEg
YmluYXJ5IHNlYXJjaCBvdmVyCj4gSU5JVF9GRUFUVVJFX05BTUVTLiAgQSB0d2VhayB0byBjbWRs
aW5lX3N0cmNtcCgpIGlzIG5lZWRlZCB0byBicmVhayBhdCBlcXVhbHMKPiBzaWducyBhcyB3ZWxs
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Cj4gCj4gdjI6Cj4gICogUmViYXNlIG92ZXIgY21kbGluZV9zdHJjbXAoKQo+IC0t
LQo+ICB4ZW4vYXJjaC94ODYvY3B1aWQuYyAgIHwgNzUgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgeGVuL2NvbW1vbi9rZXJuZWwuYyAgICB8ICA2
ICsrLS0KPiAgeGVuL2luY2x1ZGUveGVuL2xpYi5oICB8ICA0ICstLQo+ICB4ZW4vdG9vbHMvZ2Vu
LWNwdWlkLnB5IHwgMjIgKysrKysrKysrKysrKy0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgNzEgaW5z
ZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCgpJJ3ZlIG5vdGljZWQgdGhpcyBvbmx5IG5vdzog
VGhpcyBjaGFuZ2Ugd291bGQgaGF2ZSB3YW50ZWQgdG8gYmUKYWNjb21wYW5pZWQgYnkgYW4gYWRq
dXN0bWVudCB0byB0aGUgY29tbWFuZCBsaW5lIGRvYy4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
