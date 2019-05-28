Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 032172C8E1
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 16:35:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVd96-00078A-Vz; Tue, 28 May 2019 14:32:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVd94-000785-UK
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 14:32:06 +0000
X-Inumbo-ID: 5d35be41-8155-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5d35be41-8155-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 14:32:05 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 28 May 2019 08:32:04 -0600
Message-Id: <5CED46600200007800233274@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 28 May 2019 08:32:00 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190528130811.26480-1-jgross@suse.com>
In-Reply-To: <20190528130811.26480-1-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen: remove on-stack cpumask from
 stop_machine_run()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI4LjA1LjE5IGF0IDE1OjA4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vY29tbW9uL3N0b3BfbWFjaGluZS5jCj4gKysrIGIveGVuL2NvbW1vbi9zdG9wX21hY2hp
bmUuYwo+IEBAIC02OSw4ICs2OSw4IEBAIHN0YXRpYyB2b2lkIHN0b3BtYWNoaW5lX3dhaXRfc3Rh
dGUodm9pZCkKPiAgCj4gIGludCBzdG9wX21hY2hpbmVfcnVuKGludCAoKmZuKSh2b2lkICopLCB2
b2lkICpkYXRhLCB1bnNpZ25lZCBpbnQgY3B1KQo+ICB7Cj4gLSAgICBjcHVtYXNrX3QgYWxsYnV0
c2VsZjsKPiAgICAgIHVuc2lnbmVkIGludCBpLCBucl9jcHVzOwo+ICsgICAgdW5zaWduZWQgaW50
IG15X2NwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKClZhcmlhYmxlcyBzdGFydGluZyB3aXRoIG15
XyBiZWluZyBjb21tb25seSB1c2VkIGluIGludHJvZHVjdG9yeQpleGFtcGxlcywgSSdkIHByZWZl
ciB0byBhdm9pZCBzdWNoIG5hbWVzLiBFbHNld2hlcmUgd2UgdXNlCiJ0aGlzX2NwdSIsICJtZSIs
IG9yIG1heWJlICJ0aGlzIiBpZiBwbGFpbiAiY3B1IiBpcyBhbHJlYWR5IHRha2VuLgoKPiBAQCAt
NzksOSArNzksNyBAQCBpbnQgc3RvcF9tYWNoaW5lX3J1bihpbnQgKCpmbikodm9pZCAqKSwgdm9p
ZCAqZGF0YSwgdW5zaWduZWQgaW50IGNwdSkKPiAgICAgIGlmICggIWdldF9jcHVfbWFwcygpICkK
PiAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+ICAKPiAtICAgIGNwdW1hc2tfYW5kbm90KCZhbGxi
dXRzZWxmLCAmY3B1X29ubGluZV9tYXAsCj4gLSAgICAgICAgICAgICAgICAgICBjcHVtYXNrX29m
KHNtcF9wcm9jZXNzb3JfaWQoKSkpOwo+IC0gICAgbnJfY3B1cyA9IGNwdW1hc2tfd2VpZ2h0KCZh
bGxidXRzZWxmKTsKPiArICAgIG5yX2NwdXMgPSBjcHVtYXNrX3dlaWdodCgmY3B1X29ubGluZV9t
YXApIC0gMTsKCkhhdmluZyBsb29rZWQgYXQgYSBsb3Qgb2YgQ1BVIG9mZmxpbmluZyBjb2RlIHJl
Y2VudGx5LCBJIG5vdGljZSB0aGlzCmlzbid0IHN0cmljdGx5IGNvcnJlY3Q6IFlvdSBpbXBseSBj
cHVfb25saW5lKG15X2NwdSkgdG8gcHJvZHVjZQoidHJ1ZSIuIEkgdGhpbmsgYXQgcHJlc2VudCB0
aGlzIHdpbGwgYWx3YXlzIGhvbGQsIGJ1dCBJJ2QgcHJlZmVyIGlmIHdlCmNvdWxkIGF2b2lkIGdh
aW5pbmcgc3VjaCBhIGRlcGVuZGVuY3kuIEFuZCBpdCBkb2Vzbid0IGxvb2sgb3Zlcmx5CmRpZmZp
Y3VsdCB0byBhdm9pZCBpdC4KCkFsc28gcGxlYXNlIGRvbid0IG9wZW4tY29kZSBudW1fb25saW5l
X2NwdXMoKS4KCj4gQEAgLTEwMCw4ICs5OCw5IEBAIGludCBzdG9wX21hY2hpbmVfcnVuKGludCAo
KmZuKSh2b2lkICopLCB2b2lkICpkYXRhLCB1bnNpZ25lZCBpbnQgY3B1KQo+ICAKPiAgICAgIHNt
cF93bWIoKTsKPiAgCj4gLSAgICBmb3JfZWFjaF9jcHUgKCBpLCAmYWxsYnV0c2VsZiApCj4gLSAg
ICAgICAgdGFza2xldF9zY2hlZHVsZV9vbl9jcHUoJnBlcl9jcHUoc3RvcG1hY2hpbmVfdGFza2xl
dCwgaSksIGkpOwo+ICsgICAgZm9yX2VhY2hfY3B1ICggaSwgJmNwdV9vbmxpbmVfbWFwICkKClNh
bWUgaGVyZSBmb3IgZm9yX2VhY2hfb25saW5lX2NwdSgpLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
