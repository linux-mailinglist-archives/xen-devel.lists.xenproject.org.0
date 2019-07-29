Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F9378CEB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 15:34:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs5jb-0006Nz-Km; Mon, 29 Jul 2019 13:30:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uQHP=V2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hs5ja-0006Nu-8w
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 13:30:38 +0000
X-Inumbo-ID: 0c0ef259-b205-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0c0ef259-b205-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 13:30:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0DFC4AE84;
 Mon, 29 Jul 2019 13:30:35 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190728084100.13071-1-jgross@suse.com>
 <20190728084100.13071-2-jgross@suse.com>
 <014a658d-c2d5-0497-a2b3-793997f952ad@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <1895d2d8-db34-8c93-09c2-56f11b890cd6@suse.com>
Date: Mon, 29 Jul 2019 15:30:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <014a658d-c2d5-0497-a2b3-793997f952ad@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] xen: move debugtrace coding to
 common/debugtrace.c
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMTkgMTQ6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI4LjA3LjIwMTkgMTA6
NDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0jZW5kaWYgLyogIUNPTkZJR19ERUJVR19UUkFD
RSAqLwo+PiAtCj4+IC0KPj4gICAgLyoKPj4gICAgICogKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPj4gICAgICogKioqKioqKioq
KioqKioqIERlYnVnZ2luZy90cmFjaW5nL2Vycm9yLXJlcG9ydCAqKioqKioqKioqKioqKioKPiAK
PiAuLi4gd2hhdCBhYm91dCB0aGlzIG9uZT8gVGhlcmUncyBvbmx5IHBhbmljKCkgYmV0d2VlbiBp
dCBhbmQgdGhlIG5leHQKPiBzdWNoIGNvbW1lbnQsIGFuZCBJIGRvbid0IHRoaW5rIHRoZSAiRGVi
dWdnaW5nL3RyYWNpbmciIHBhcnQgb2YgaXQKPiBhcmUgYXBwbGljYWJsZSAoYW55bW9yZSkuCgpU
cnVlLiBJJ2xsIHJlbW92ZSB0aGUgIkRlYnVnZ2luZy90cmFjaW5nIiBwYXJ0LgoKPiAKPj4gLS0t
IGEveGVuL2luY2x1ZGUveGVuL2NvbnNvbGUuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vY29u
c29sZS5oCj4+IEBAIC00OCw0ICs0OCw4IEBAIGludCBjb25zb2xlX3Jlc3VtZSh2b2lkKTsKPj4g
ICAgCj4+ICAgIGV4dGVybiBpbnQ4X3Qgb3B0X2NvbnNvbGVfeGVuOwo+PiAgICAKPj4gKy8qIElz
c3VlIHN0cmluZyB2aWEgc2VyaWFsIGxpbmUuICovCj4+ICtleHRlcm4gaW50IHNlcmNvbl9oYW5k
bGU7Cj4+ICt2b2lkIHNlcmNvbl9wdXRzKGNvbnN0IGNoYXIgKnMpOwo+IAo+IEkgZ3Vlc3MgYXZv
aWRpbmcgdGhlaXIgZXhwb3N1cmUgd2FzIG9uZSBvZiB0aGUgcmVhc29ucyB0aGUgZGVidWcgdHJh
Y2UKPiBjb2RlIGxpdmVkIGluIHRoZSBwbGFjZSB5b3UgbW92ZSBpdCBmcm9tLiBJJ20gdW5jb252
aW5jZWQgbm9uLWNvbnNvbGUKPiBjb2RlIGlzIGFjdHVhbGx5IHN1cHBvc2VkIHRvIG1ha2UgdXNl
IG9mIGVpdGhlciwgYnV0IEknbSBub3Qgb3Bwb3NlZAo+IGVub3VnaCB0byBuYWsgdGhlIGNoYW5n
ZS4gSSBkb24ndCB0aGluayB0aG91Z2ggdGhlIGNvbW1lbnQgZml0cyB3ZWxsCj4gd2l0aCB0aGUg
dmFyaWFibGUgZGVjbGFyYXRpb24uCgpzZXJjb25faGFuZGxlIGlzIHVzZWQgZm9yIGNhbGxpbmcg
c2VyaWFsX3B1dHMoKSwgc28gbWF5YmUgaW5zdGVhZCBvZgpkaXJlY3RseSB1c2luZyBzZXJpYWxf
cHV0cygpIHdpdGggc2VyY29uX2hhbmRsZSBJIHNob3VsZCBhZGQgYSB3cmFwcGVyCnRvIGNvbnNv
bGUuYyAoZS5nLiBjb25zb2xlX3NlcmlhbF9wdXRzKCkpPyBJdCBzaG91bGQgYmUgbm90ZWQgdGhh
dApzZXJpYWxfcHV0cygpIGlzIGNhbGxlZCBvbmx5IGluIGNhc2Ugb2YgZGVidWd0cmFjZSBvdXRw
dXQgdG9nZ2xlZCB0byBnbwp0byB0aGUgY29uc29sZS4gSSBndWVzcyB1c2luZyBzZXJpYWxfcHV0
cygpIGluIHRoYXQgY2FzZSBpcyBtZWFudCB0bwphdm9pZCB0b28gbWFueSBzb2Z0d2FyZSBsYXll
cnMgd2hlbiBkb2luZyB0aGUgb3V0cHV0LiBJdCB3b3VsZCBiZQpwb3NzaWJsZSB0byB1c2Ugc2Vy
Y29uX3B1dHMoKSBmb3IgdGhhdCBjYXNlLCB0b28sIHJlc3VsdGluZyBpbiB0aGUKaW5hYmlsaXR5
IHRvIHVzZSBkZWJ1Z3RyYWNlX3ByaW50aygpIGluIHRoZSB0aGVuIGFkZGl0aW9uYWxseSBuZWVk
ZWQKcGF0aHMgKG9yIGJldHRlcjogdG8gdXNlIGl0IHdpdGggb3V0cHV0IHJlZGlyZWN0ZWQgdG8g
Y29uc29sZSkuCgpzZXJjb25fcHV0cygpIGNvdWxkIHVzZSBhbm90aGVyIHdyYXBwZXIsIGUuZy4g
Y29uc29sZV9kZWJ1Z19wdXRzKCkuCgpXb3VsZCB5b3UgbGlrZSB0aGF0IGJldHRlcj8KCgpKdWVy
Z2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
