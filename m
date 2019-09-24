Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E77BCADC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:08:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmN8-0004XJ-T2; Tue, 24 Sep 2019 15:04:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCmN7-0004XE-HL
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:04:57 +0000
X-Inumbo-ID: ab680e46-dedc-11e9-961f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ab680e46-dedc-11e9-961f-12813bfff9fa;
 Tue, 24 Sep 2019 15:04:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BFDBFAC52;
 Tue, 24 Sep 2019 15:04:55 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-25-jgross@suse.com>
 <73c41851-cba3-c8aa-b031-dcfb3dcff6a4@suse.com>
 <f91d4df5-5b35-1030-ea13-c99d3ec16157@suse.com>
 <b0ae0c50-a8cb-ffc6-06df-e4c20261aa36@suse.com>
 <6db4ef58-6756-ba8f-7500-acc19ce7c29c@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ddafccd-a245-b9ba-f357-85dbc0cb15b1@suse.com>
Date: Tue, 24 Sep 2019 17:04:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6db4ef58-6756-ba8f-7500-acc19ce7c29c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 24/47] xen: switch from for_each_vcpu()
 to for_each_sched_unit()
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <Robert.VanVossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Joshua Whitehead <josh.whitehead@dornerworks.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAxNzowMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyNC4wOS4xOSAx
NDozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI0LjA5LjIwMTkgMTQ6MTMsIErDvHJnZW4g
R3Jvw58gIHdyb3RlOgo+Pj4gT24gMjAuMDkuMTkgMTc6MDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+
Pj4+IE9uIDE0LjA5LjIwMTkgMTA6NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+IEBAIC04
OTYsMTggKzkyOSwyMiBAQCB2b2lkIHJlc3RvcmVfdmNwdV9hZmZpbml0eShzdHJ1Y3QgZG9tYWlu
ICpkKQo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgIGNwdXBvb2xfZG9tYWluX2NwdW1hc2so
ZCkpOwo+Pj4+PiAgICAgICAgICAgIGlmICggY3B1bWFza19lbXB0eShjcHVtYXNrX3NjcmF0Y2hf
Y3B1KGNwdSkpICkKPj4+Pj4gICAgICAgICAgICB7Cj4+Pj4+IC0gICAgICAgICAgICBpZiAoIHYt
PmFmZmluaXR5X2Jyb2tlbiApCj4+Pj4+ICsgICAgICAgICAgICBpZiAoIHNjaGVkX2NoZWNrX2Fm
ZmluaXR5X2Jyb2tlbih1bml0KSApCj4+Pj4+ICAgICAgICAgICAgICAgIHsKPj4+Pj4gLSAgICAg
ICAgICAgICAgICBzY2hlZF9zZXRfYWZmaW5pdHkodiwgdW5pdC0+Y3B1X2hhcmRfYWZmaW5pdHlf
c2F2ZWQsIE5VTEwpOwo+Pj4+PiAtICAgICAgICAgICAgICAgIHYtPmFmZmluaXR5X2Jyb2tlbiA9
IDA7Cj4+Pj4+ICsgICAgICAgICAgICAgICAgLyogQWZmaW5pdHkgc2V0dGluZ3Mgb2Ygb25lIHZj
cHUgYXJlIGZvciB0aGUgY29tcGxldGUgdW5pdC4gKi8KPj4+Pj4gKyAgICAgICAgICAgICAgICBz
Y2hlZF9zZXRfYWZmaW5pdHkodW5pdC0+dmNwdV9saXN0LAo+Pj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bml0LT5jcHVfaGFyZF9hZmZpbml0eV9zYXZlZCwgTlVMTCk7
Cj4+Pj4KPj4+PiBZZXQgZGVzcGl0ZSB0aGUgY29tbWVudCB0aGUgZnVuY3Rpb24gZ2V0cyBwYXNz
ZWQgYSBzdHJ1Y3QgdmNwdSAqLAo+Pj4+IGFuZCB0aGlzIGRvZXNuJ3QgbG9vayB0byBjaGFuZ2Ug
YnkgdGhlIGVuZCBvZiB0aGUgc2VyaWVzLiBJcyB0aGVyZQo+Pj4+IGEgcmVhc29uIGZvciB0aGlz
Pwo+Pj4KPj4+IFllcy4gc2NoZWRfc2V0X2FmZmluaXR5KCkgaXMgdXNlZCBmcm9tIG91dHNpZGUg
b2Ygc2NoZWR1bGUuYyAoYnkKPj4+IGRvbTBfYnVpbGQuYykuCj4+Cj4+IEhvdyBhYm91dCBjaGFu
Z2luZyB0aGUgY2FsbCB0aGVyZSB0aGVuLCByYXRoZXIgdGhhbiBoYXZpbmcgY29uZnVzaW5nCj4+
IGNvZGUgaGVyZT8KPiAKPiBJJ20gbm90IHN1cmUgdGhhdCB3b3VsZCBiZSBiZXR0ZXIuCj4gCj4g
V2hhdCBhYm91dCBkcm9wcGluZyBkb20wX3NldHVwX3ZjcHUoKSBieSBjYWxsaW5nIHZjcHVfY3Jl
YXRlKCkgaW5zdGVhZAo+IGFuZCBkb2luZyB0aGUgcGlubmluZyB2aWEgYSBjYWxsIHRvIGEgbmV3
IGZ1bmN0aW9uIGluIHNjaGVkdWxlLmMgYWZ0ZXIKPiBoYXZpbmcgY3JlYXRlZCBhbGwgdmNwdXM/
IEluIGZhY3Qgd2UgY291bGQgZXZlbiBkbyBhIGNvbW1vbiBmdW5jdGlvbgo+IGNyZWF0aW5nIGFs
bCBidXQgdmNwdVswXSwgZG9pbmcgdGhlIHBpbm5pbmcgYW5kIHRoZSB1cGRhdGluZyB0aGUgbm9k
ZQo+IGFmZmluaXR5LiBQcm9iYWJseSB0aGlzIHdvdWxkIHdhbnQgdG8gYmUgcGFydCBvZiBwYXRj
aCAyMC4KClNvdW5kcyByZWFzb25hYmxlIGF0IHRoZSBmaXJzdCBnbGFuY2UuCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
