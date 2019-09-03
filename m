Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96508A68C8
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 14:43:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i586X-00074h-Nj; Tue, 03 Sep 2019 12:40:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i586W-00074Y-B6
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 12:40:12 +0000
X-Inumbo-ID: f7cb0266-ce47-11e9-ad82-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7cb0266-ce47-11e9-ad82-bc764e2007e4;
 Tue, 03 Sep 2019 12:40:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 348C0B03D;
 Tue,  3 Sep 2019 12:40:10 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190828080028.18205-1-jgross@suse.com>
 <20190828080028.18205-2-jgross@suse.com>
 <393f2e3f-d15c-270b-9938-4ebcc251b482@suse.com>
 <f5bd649c-1dc2-080b-df0c-ef06d59da35b@suse.com>
 <f373132d-ba9c-45b2-8b2d-d1833f43870c@suse.com>
 <45f2bc1b-571d-d780-961c-64b73bf26c3b@suse.com>
 <089c061c-74cf-e390-34a9-3c65900d1e93@suse.com>
 <afa878a5-e04f-8ff0-f50f-230cc9332115@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cb980a6c-bc85-c794-9fc3-836e64779eaa@suse.com>
Date: Tue, 3 Sep 2019 14:40:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <afa878a5-e04f-8ff0-f50f-230cc9332115@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/4] xen: use common output function in
 debugtrace
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxNDoyMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwMy4wOS4xOSAx
NDowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDAzLjA5LjIwMTkgMTM6NTgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAwMy4wOS4xOSAxMzo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMDMuMDkuMjAxOSAxMjoyMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gT24gMDMu
MDkuMTkgMTI6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjguMDguMjAxOSAxMDow
MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+PiBUb2RheSBkdW1waW5nIHRoZSBkZWJ1Z3Ry
YWNlIGJ1ZmZlcnMgaXMgZG9uZSB2aWEgc2VyY29uX3B1dHMoKSwgd2hpbGUKPj4+Pj4+PiBkaXJl
Y3QgcHJpbnRpbmcgb2YgdHJhY2UgZW50cmllcyAoYWZ0ZXIgdG9nZ2xpbmcgb3V0cHV0IHRvIHRo
ZSBjb25zb2xlKQo+Pj4+Pj4+IGlzIHVzaW5nIHNlcmlhbF9wdXRzKCkuCj4+Pj4+Pj4KPj4+Pj4+
PiBVc2Ugc2VyY29uX3B1dHMoKSBpbiBib3RoIGNhc2VzLCBhcyB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIGJvdGggaXMgbm90Cj4+Pj4+Pj4gcmVhbGx5IG1ha2luZyBzZW5zZS4KPj4+Pj4+Cj4+Pj4+
PiBObyBtYXR0ZXIgdGhhdCBJIGxpa2UgdGhpcyBjaGFuZ2UsIEknbSBub3QgY29udmluY2VkIGl0
J3MgY29ycmVjdDoKPj4+Pj4+IFRoZXJlIGFyZSB0d28gZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUg
ZnVuY3Rpb25zLCBuZWl0aGVyIG9mIHdoaWNoCj4+Pj4+PiBJIGNvdWxkIHF1YWxpZnkgYXMgIm5v
dCByZWFsbHkgbWFraW5nIHNlbnNlIjogV2h5IGlzIGl0IG9idmlvdXMKPj4+Pj4+IHRoYXQgaXQg
bWFrZXMgbm8gc2Vuc2UgZm9yIHRoZSBkZWJ1Z3RyYWNlIG91dHB1dCB0byBieXBhc3Mgb25lIG9y
Cj4+Pj4+PiBib3RoIG9mIHNlcmlhbF9zdGVhbF9mbigpIGFuZCBwdl9jb25zb2xlX3B1dHMoKT8g
SWYgeW91J3JlCj4+Pj4+PiBjb252aW5jZWQgb2YgdGhpcywgcGxlYXNlIHByb3ZpZGUgdGhlICJ3
aHkiLXMgYmVoaW5kIHRoZSBzZW50ZW5jZQo+Pj4+Pj4gYWJvdmUuCj4+Pj4+Cj4+Pj4+IE9rYXks
IEknbGwgdXNlOgo+Pj4+Pgo+Pj4+PiBVc2Ugc2VyY29uX3B1dHMoKSBpbiBib3RoIGNhc2VzLCB0
byBiZSBjb25zaXN0ZW50IGJldHdlZW4gZHVtcGluZyB0aGUKPj4+Pj4gYnVmZmVyIHdoZW4gc3dp
dGNoaW5nIGRlYnVndHJhY2UgdG8gY29uc29sZSBvdXRwdXQgYW5kIHdoZW4gcHJpbnRpbmcKPj4+
Pj4gYSBkZWJ1Z3RyYWNlIGVudHJ5IGRpcmVjdGx5IHRvIGNvbnNvbGUuCj4+Pj4KPj4+PiBXZWxs
LCB0aGlzIGlzIGJldHRlciBhcyBhbiBleHBsYW5hdGlvbiBpbmRlZWQsIGJ1dCBpdCBzdGlsbCBk
b2Vzbid0Cj4+Pj4gbWFrZSBjbGVhciB3aGV0aGVyIGl0IHdhc24ndCBpbiBmYWN0IHdhbnRlZCBm
b3IgdGhlcmUgdG8gYmUgYQo+Pj4+IGRpZmZlcmVuY2UgaW4gd2hlcmUgb3V0cHV0IGdldHMgc2Vu
dC4gSSBtYXkgYmVsaWV2ZSB0aGF0IGJ5cGFzc2luZwo+Pj4+IHB2X2NvbnNvbGVfcHV0cygpIHdh
c24ndCBpbnRlbmRlZCwgYnV0IHRoZSBzdGVhbCBmdW5jdGlvbiBieXBhc3MKPj4+PiBoYWQgYmVl
biB0aGVyZSBpbiAzLjIgYWxyZWFkeSwgc28gbWF5IHdlbGwgaGF2ZSBiZWVuIG9uIHB1cnBvc2Uu
Cj4+Pgo+Pj4gVGhlcmUgYXJlIHR3byB1c2VycyBvZiBjb25zb2xlX3N0ZWFsKCk6Cj4+Pgo+Pj4g
c3VzcGVuZCBoYW5kbGluZyAtIEkgYmVsaWV2ZSBpdCBpcyBhIGdvb2QgaWRlYSB0byBub3QgdXNl
IHRoZSBzZXJpYWwKPj4+IGludGVyZmFjZSB3aGlsZSBpdCBpcyBwb3RlbnRpYWxseSB1bmluaXRp
YWxpemVkLgo+Pgo+PiBJIGFncmVlIGhlcmUuCj4+Cj4+PiBnZGIgc3VwcG9ydCAtIFdoeSBzaG91
bGQgdGhhdCBiZSBzcGVjaWFsPyBOb3QgdHJlYXRpbmcgdGhlIG91dHB1dCBkYXRhCj4+PiBhcHBy
b3ByaWF0ZSB0byB0aGUgYXR0YWNoZWQgZGVidWdnZXIgd2lsbCBiZSB3b3JzZSB0aGFuIGVuY2Fw
c3VsYXRpbmcKPj4+IGl0IGluIGEgd2F5IHRoZSBkZWJ1Z2dlciBjYW4gaGFuZGxlLgo+Pgo+PiBJ
J20gbm90IHN1cmUgaGVyZSAtIGl0IG1heSB3ZWxsIGhhdmUgYmVlbiBpbnRlbnRpb25hbCB0byBh
dm9pZAo+PiBjbHV0dGVyaW5nIHRoZSBkZWJ1Z2dlciBjb25zb2xlLgo+IAo+IEJ1dCB3b24ndCB1
c2luZyBzZXJpYWxfcHV0cygpIGNsdXR0ZXIgdGhlIGRlYnVnZ2VyIGNvbnNvbGU/ICJub3JtYWwi
Cj4gcHJpbnRrKCkgb3V0cHV0IHNlZW0gdG8gYmUgaGFuZGxlZCBpbiBhIHNwZWNpYWwgd2F5IHdp
dGggZ2RiIGFjdGl2ZSwKPiB3aGlsZSBqdXN0IHVzaW5nIHNlcmlhbF9wdXRzKCkgd2l0aCBhdHRh
Y2hlZCBnZGIgaXMgbG9va2luZyBhdCBsZWFzdAo+IHN1c3BpY2lvdXMgdG8gbWUuIFRoZXJlIHNl
ZW1zIHRvIGJlIGEgc3BlY2lhbCBmb3JtYXQsIGUuZy4gdGV4dCBvdXRwdXQKPiBvZiB0aGUgaHlw
ZXJ2aXNvciBpcyBwcmVwZW5kZWQgd2l0aCAnTycgYW5kIHRoZSBkYXRhIGlzIHNlbnQgaW4gaGV4
Cj4gcmVwcmVzZW50YXRpb24uIEkgY2FuJ3QgaW1hZ2luZSBqdXN0IHNlbmRpbmcgc29tZSBBU0NJ
SSB0ZXh0IGlzIHRoZQo+IGRlc2lyZWQgYXBwcm9hY2ggZm9yIGRlYnVndHJhY2Ugb3V0cHV0LgoK
T2gsIGRpZCBJIGdldCBpdCBiYWNrd2FyZHMsIEknbSBzb3JyeS4gWWVzLCBJIGFncmVlLiBXaXRo
IHRoZSBzbGlnaHRseQphZGp1c3RlZCBkZXNjcmlwdGlvbgpSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
