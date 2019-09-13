Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E90DB21B1
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 16:18:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8mMF-0001yU-Dm; Fri, 13 Sep 2019 14:15:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mE8E=XI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8mMD-0001yP-VQ
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 14:15:30 +0000
X-Inumbo-ID: eef96895-d630-11e9-95ad-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eef96895-d630-11e9-95ad-12813bfff9fa;
 Fri, 13 Sep 2019 14:15:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 03F06B716;
 Fri, 13 Sep 2019 14:15:26 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-31-jgross@suse.com>
 <08af44affecf2f635afc0ff1e1f377651866d78b.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <04990a04-9946-4796-66be-6b348d3f28e7@suse.com>
Date: Fri, 13 Sep 2019 16:14:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <08af44affecf2f635afc0ff1e1f377651866d78b.camel@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 30/48] xen/sched: introduce
 unit_runnable_state()
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMTkgMTI6MjQsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIEZyaSwgMjAxOS0w
OC0wOSBhdCAxNjo1OCArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVG9kYXkgdGhlIHZj
cHUgcnVuc3RhdGUgb2YgYSBuZXcgc2NoZWR1bGVkIHZjcHUgaXMgYWx3YXlzIHNldCB0bwo+PiAi
cnVubmluZyIgZXZlbiBpZiBhdCB0aGF0IHRpbWUgdmNwdV9ydW5uYWJsZSgpIGlzIGFscmVhZHkg
cmV0dXJuaW5nCj4+IGZhbHNlIGR1ZSB0byBhIHJhY2UgKGUuZy4gd2l0aCBwYXVzaW5nIHRoZSB2
Y3B1KS4KPj4KPj4gV2l0aCBjb3JlIHNjaGVkdWxpbmcgdGhpcyBjYW4gbm8gbG9uZ2VyIHdvcmsg
YXMgbm90IGFsbCB2Y3B1cyBvZiBhCj4+IHNjaGVkdWxlIHVuaXQgaGF2ZSB0byBiZSAicnVubmlu
ZyIgd2hlbiBiZWluZyBzY2hlZHVsZWQuIFNvIHRoZQo+PiB2Y3B1J3MKPj4gbmV3IHJ1bnN0YXRl
IGhhcyB0byBiZSBzZWxlY3RlZCBhdCB0aGUgc2FtZSB0aW1lIGFzIHRoZSBydW5uYWJpbGl0eQo+
PiBvZgo+PiB0aGUgcmVsYXRlZCBzY2hlZHVsZSB1bml0IGlzIHByb2JlZC4KPj4KPiBTbywgeW91
J3JlIHNheWluZyB0aGF0IHRoaXMgcGF0Y2ggaXMgbWVhbnQgYXQgZml4aW5nIGEgcmFjZS4gQSBy
YWNlCj4gdGhhdCwgaWYgSSB1bmRlcnN0b29kIGNvcnJlY3RseSwgaXQncyBub3QgdGhlcmUvaXQn
cyBub3QgcHJvYmxlbWF0aWMKPiByaWdodCBub3csIGJ1dCB3aWxsIGJlIHdoZW4gd2UgaGF2ZSBt
b3JlIHRoYW4gMSB2Y3B1IGluIGEgdW5pdCBhbmQgd2UKPiBlbmFibGUgY29yZSBzY2hlZHVsaW5n
LiBJcyB0aGlzIHRoZSBjYXNlPwoKQ29ycmVjdC4KCj4gCj4gSWYgeWVzOgo+IC0gdGhpcyB2ZXJ5
IHBhdGNoLCBhdCB0aGlzIHBvaW50IGluIHRoZSBzZXJpZXMsIGlzIGJhc2ljYWxseQo+IGludHJv
ZHVjaW5nIG5vIGZ1bmN0aW9uYWwgKG9yIGF0IGxlYXN0IGJlaGF2aW9yYWwpIGNoYW5nZSwgaXMg
dGhpcwo+IHJpZ2h0IHRvbz8KClllcy4KCj4gLSBjYW4geW91IHByb3ZpZGUgc29tZSBtb3JlIGRl
dGFpbCBhYm91dCB0aGUgcmFjZS4gV2hlbi9ob3cgaXQgb2NjdXJzCj4gYW5kIGhvdyB0aGUgY2hh
bmdlcyBkb25lIGluIGNyZWRpdCBhbmQgcnQgZml4IGl0PwoKVGhlIHByb2JsZW0gaXMgdGhhdCB3
aXRoIG1vcmUgdGhhbiBvbmUgdmNwdSBpbiBhIHVuaXQgeW91IGNhbiBubyBsb25nZXIKdGVsbCB0
aGUgbmV3IHJ1bl9zdGF0ZSBmcm9tIHRoZSBtZXJlIGZhY3QgdGhhdCB0aGUgdW5pdCBoYXMgYmVl
bgpzZWxlY3RlZCB0byBydW4gbmV4dC4gU28gdGVzdGluZyBlLmcuIHZjcHVfcnVubmFibGUoKSBh
ZnRlciBzZWxlY3RpbmcKYSB1bml0IGZvciBydW5uaW5nIGNvdWxkIHJlc3VsdCBpbiBhbGwgdmNw
dXMgbm90IGJlaW5nIHJ1bm5hYmxlIGFueQpsb25nZXIgKGUuZy4gd2hlbiBhIGRvbWFpbiB3YXMg
cGF1c2VkIHZpYSBkb21haW5fcGF1c2Vfbm9zeW5jKCkKYWZ0ZXIgc2VsZWN0aW5nIHRoZSBuZXh0
IHVuaXQsIGJ1dCBiZWZvcmUgc2V0dGluZyBhbnkgdmNwdSdzIHJ1bl9zdGF0ZSkuCgpJbiBvcmRl
ciB0byBhdm9pZCB0aGF0IHByb2JsZW0gdGhlIG5ldyBydW5fc3RhdGUgb2YgdGhlIHZjcHVzIG9m
IGEgdW5pdApuZWVkcyB0byBiZSBkZXRlcm1pbmVkIHdoZW4gZG9pbmcgdGhlIGRlY2lzaW9uIHdo
aWNoIHVuaXQgdG8gc2VsZWN0LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
