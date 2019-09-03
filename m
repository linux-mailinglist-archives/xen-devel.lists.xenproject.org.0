Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3D1A685A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 14:12:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i57ck-0002wI-7l; Tue, 03 Sep 2019 12:09:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i57ci-0002wD-Lg
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 12:09:24 +0000
X-Inumbo-ID: aa89bae6-ce43-11e9-a1fa-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa89bae6-ce43-11e9-a1fa-bc764e2007e4;
 Tue, 03 Sep 2019 12:09:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A7217AD3C;
 Tue,  3 Sep 2019 12:09:22 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190828080028.18205-1-jgross@suse.com>
 <20190828080028.18205-2-jgross@suse.com>
 <393f2e3f-d15c-270b-9938-4ebcc251b482@suse.com>
 <f5bd649c-1dc2-080b-df0c-ef06d59da35b@suse.com>
 <f373132d-ba9c-45b2-8b2d-d1833f43870c@suse.com>
 <45f2bc1b-571d-d780-961c-64b73bf26c3b@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <089c061c-74cf-e390-34a9-3c65900d1e93@suse.com>
Date: Tue, 3 Sep 2019 14:09:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <45f2bc1b-571d-d780-961c-64b73bf26c3b@suse.com>
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

T24gMDMuMDkuMjAxOSAxMzo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwMy4wOS4xOSAx
Mzo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDAzLjA5LjIwMTkgMTI6MjIsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAwMy4wOS4xOSAxMjowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMjguMDguMjAxOSAxMDowMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gVG9kYXkg
ZHVtcGluZyB0aGUgZGVidWd0cmFjZSBidWZmZXJzIGlzIGRvbmUgdmlhIHNlcmNvbl9wdXRzKCks
IHdoaWxlCj4+Pj4+IGRpcmVjdCBwcmludGluZyBvZiB0cmFjZSBlbnRyaWVzIChhZnRlciB0b2dn
bGluZyBvdXRwdXQgdG8gdGhlIGNvbnNvbGUpCj4+Pj4+IGlzIHVzaW5nIHNlcmlhbF9wdXRzKCku
Cj4+Pj4+Cj4+Pj4+IFVzZSBzZXJjb25fcHV0cygpIGluIGJvdGggY2FzZXMsIGFzIHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gYm90aCBpcyBub3QKPj4+Pj4gcmVhbGx5IG1ha2luZyBzZW5zZS4KPj4+
Pgo+Pj4+IE5vIG1hdHRlciB0aGF0IEkgbGlrZSB0aGlzIGNoYW5nZSwgSSdtIG5vdCBjb252aW5j
ZWQgaXQncyBjb3JyZWN0Ogo+Pj4+IFRoZXJlIGFyZSB0d28gZGlmZmVyZW5jZXMgYmV0d2VlbiB0
aGUgZnVuY3Rpb25zLCBuZWl0aGVyIG9mIHdoaWNoCj4+Pj4gSSBjb3VsZCBxdWFsaWZ5IGFzICJu
b3QgcmVhbGx5IG1ha2luZyBzZW5zZSI6IFdoeSBpcyBpdCBvYnZpb3VzCj4+Pj4gdGhhdCBpdCBt
YWtlcyBubyBzZW5zZSBmb3IgdGhlIGRlYnVndHJhY2Ugb3V0cHV0IHRvIGJ5cGFzcyBvbmUgb3IK
Pj4+PiBib3RoIG9mIHNlcmlhbF9zdGVhbF9mbigpIGFuZCBwdl9jb25zb2xlX3B1dHMoKT8gSWYg
eW91J3JlCj4+Pj4gY29udmluY2VkIG9mIHRoaXMsIHBsZWFzZSBwcm92aWRlIHRoZSAid2h5Ii1z
IGJlaGluZCB0aGUgc2VudGVuY2UKPj4+PiBhYm92ZS4KPj4+Cj4+PiBPa2F5LCBJJ2xsIHVzZToK
Pj4+Cj4+PiBVc2Ugc2VyY29uX3B1dHMoKSBpbiBib3RoIGNhc2VzLCB0byBiZSBjb25zaXN0ZW50
IGJldHdlZW4gZHVtcGluZyB0aGUKPj4+IGJ1ZmZlciB3aGVuIHN3aXRjaGluZyBkZWJ1Z3RyYWNl
IHRvIGNvbnNvbGUgb3V0cHV0IGFuZCB3aGVuIHByaW50aW5nCj4+PiBhIGRlYnVndHJhY2UgZW50
cnkgZGlyZWN0bHkgdG8gY29uc29sZS4KPj4KPj4gV2VsbCwgdGhpcyBpcyBiZXR0ZXIgYXMgYW4g
ZXhwbGFuYXRpb24gaW5kZWVkLCBidXQgaXQgc3RpbGwgZG9lc24ndAo+PiBtYWtlIGNsZWFyIHdo
ZXRoZXIgaXQgd2Fzbid0IGluIGZhY3Qgd2FudGVkIGZvciB0aGVyZSB0byBiZSBhCj4+IGRpZmZl
cmVuY2UgaW4gd2hlcmUgb3V0cHV0IGdldHMgc2VudC4gSSBtYXkgYmVsaWV2ZSB0aGF0IGJ5cGFz
c2luZwo+PiBwdl9jb25zb2xlX3B1dHMoKSB3YXNuJ3QgaW50ZW5kZWQsIGJ1dCB0aGUgc3RlYWwg
ZnVuY3Rpb24gYnlwYXNzCj4+IGhhZCBiZWVuIHRoZXJlIGluIDMuMiBhbHJlYWR5LCBzbyBtYXkg
d2VsbCBoYXZlIGJlZW4gb24gcHVycG9zZS4KPiAKPiBUaGVyZSBhcmUgdHdvIHVzZXJzIG9mIGNv
bnNvbGVfc3RlYWwoKToKPiAKPiBzdXNwZW5kIGhhbmRsaW5nIC0gSSBiZWxpZXZlIGl0IGlzIGEg
Z29vZCBpZGVhIHRvIG5vdCB1c2UgdGhlIHNlcmlhbAo+IGludGVyZmFjZSB3aGlsZSBpdCBpcyBw
b3RlbnRpYWxseSB1bmluaXRpYWxpemVkLgoKSSBhZ3JlZSBoZXJlLgoKPiBnZGIgc3VwcG9ydCAt
IFdoeSBzaG91bGQgdGhhdCBiZSBzcGVjaWFsPyBOb3QgdHJlYXRpbmcgdGhlIG91dHB1dCBkYXRh
Cj4gYXBwcm9wcmlhdGUgdG8gdGhlIGF0dGFjaGVkIGRlYnVnZ2VyIHdpbGwgYmUgd29yc2UgdGhh
biBlbmNhcHN1bGF0aW5nCj4gaXQgaW4gYSB3YXkgdGhlIGRlYnVnZ2VyIGNhbiBoYW5kbGUuCgpJ
J20gbm90IHN1cmUgaGVyZSAtIGl0IG1heSB3ZWxsIGhhdmUgYmVlbiBpbnRlbnRpb25hbCB0byBh
dm9pZApjbHV0dGVyaW5nIHRoZSBkZWJ1Z2dlciBjb25zb2xlLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
