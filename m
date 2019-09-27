Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA886C012C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 10:30:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDlax-0000a4-Uc; Fri, 27 Sep 2019 08:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDlaw-0000Zy-LF
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 08:27:18 +0000
X-Inumbo-ID: 9d4d686c-e100-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 9d4d686c-e100-11e9-8628-bc764e2007e4;
 Fri, 27 Sep 2019 08:27:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3A90DAFBB;
 Fri, 27 Sep 2019 08:27:16 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190925070503.13850-1-jgross@suse.com>
 <20190925070503.13850-2-jgross@suse.com>
 <26e09877d338d3801dbb38b881e8890cca2255ab.camel@suse.com>
 <2c63edeb-b8b8-dc4e-4c25-7678bc7776a0@suse.com>
 <545449be-4ecf-3625-8ad3-81487879941a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fc1f9899-a43d-d263-e0e0-25f4499d9e5a@suse.com>
Date: Fri, 27 Sep 2019 10:27:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <545449be-4ecf-3625-8ad3-81487879941a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen/sched: fix locking in
 a653sched_free_vdata()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMTkgMTA6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI3LjA5LjIwMTkgMDk6
MjMsIErDvHJnZW4gR3Jvw58gIHdyb3RlOgo+PiBPbiAyNS4wOS4xOSAxMjo1OSwgRGFyaW8gRmFn
Z2lvbGkgd3JvdGU6Cj4+PiBPbiBXZWQsIDIwMTktMDktMjUgYXQgMDk6MDUgKzAyMDAsIEp1ZXJn
ZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4gVGhlIGFyaW5jNjUzIHNjaGVkdWxlcidzIGZyZWVfdmRhdGEo
KSBmdW5jdGlvbiBpcyBtaXNzaW5nIHByb3Blcgo+Pj4+IGxvY2tpbmc6IGFzIGl0IGlzIG1vZGlm
eWluZyB0aGUgc2NoZWR1bGVyJ3MgcHJpdmF0ZSB2Y3B1IGxpc3QgaXQKPj4+PiBuZWVkcwo+Pj4+
IHRvIHRha2UgdGhlIHNjaGVkdWxlciBsb2NrIGR1cmluZyB0aGF0IG9wZXJhdGlvbi4KPj4+Pgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+Pgo+
Pj4gUmV2aWV3ZWQtYnk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4+Cj4+
IEFzIHRoaXMgcGF0Y2ggaXMgYSBwcmVyZXF1aXNpdGUgZm9yIG15IGNvcmUgc2NoZWR1bGluZyBz
ZXJpZXMgSSdkIHJlYWxseQo+PiBhcHByZWNpYXRlIGlmIGl0IGNvdWxkIGJlIGNvbW1pdHRlZCBy
YXRoZXIgc29vbmVyIHRoYW4gbGF0ZXIuCj4+Cj4+IEpvc2gsIFJvYmVydCwgY291bGQgeW91IHBs
ZWFzZSBjb21tZW50Pwo+Pgo+PiBPciBpcyBEYXJpbydzIFItYiAoYW5kIEphbidzIGFzIHdlbGwp
IGVub3VnaCBpbiB0aGlzIHJhdGhlciBzaW1wbGUgYW5kCj4+IG9idmlvdXMgY2FzZT8KPiAKPiBJ
IHdhcyBtb3JlIG9yIGxlc3MgcGxhbm5pbmcgdG8gdGltZSBvdXQgb24gd2FpdGluZyBmb3IgdGhl
aXIgYWNrCj4gbGF0ZXIgdG9kYXkuCgpUaGFua3MuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
