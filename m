Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87A3AD366
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 09:09:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Djs-0002bc-CF; Mon, 09 Sep 2019 07:05:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7Djq-0002bX-9d
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 07:05:26 +0000
X-Inumbo-ID: 320ca5c4-d2d0-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 320ca5c4-d2d0-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 07:05:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27FD0AFFC;
 Mon,  9 Sep 2019 07:05:24 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-10-jgross@suse.com>
 <3c6b8789-fa9a-8590-dc74-100c275e08eb@suse.com>
 <e8216a93-ec8d-6e91-a21a-96d3b1d33151@suse.com>
 <de415ad3-d6a4-2bc9-240b-8e1765cbcb4c@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <a3d2491f-03a8-6c8a-655f-2921aa329504@suse.com>
Date: Mon, 9 Sep 2019 09:05:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <de415ad3-d6a4-2bc9-240b-8e1765cbcb4c@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 09/48] xen/sched: move some per-vcpu
 items to struct sched_unit
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMTkgMDg6NTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA5LjIwMTkgMDg6
MzksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA0LjA5LjE5IDE2OjE2LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA5LjA4LjIwMTkgMTY6NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gVjI6Cj4+Pj4gLSBtb3ZlIGFmZmluaXR5X2Jyb2tlbiBiYWNrIHRvIHN0cnVjdCB2Y3B1IChK
YW4gQmV1bGljaCkKPj4+Cj4+PiBCdXQgdGhpcyBhbG9uZSB3b24ndCB3b3JrOiBOb3cgYSAybmQg
dkNQVSBpbiBhIHVuaXQgd2lsbCBjbG9iYmVyCj4+PiB3aGF0IGEgMXN0IG9uZSBtYXkgaGF2ZSBz
ZXQgYXMgYW4gYWZmaW5pdHkgb3ZlcnJpZGUuIEkgZG9uJ3QKPj4+IHRoaW5rIHlvdSBjYW4gZ2V0
IGF3YXkgd2l0aG91dCBhIHBlci12Q1BVIENQVSBtYXNrLCBvciBhCj4+PiBjb21iaW5hdGlvbiBv
ZiBwZXItdkNQVSBhbmQgcGVyLXVuaXQgc3RhdGUgZmxhZ3MuCj4+Cj4+IFNlZSBwYXRjaCAyNDog
dGhpcyBvbmUgYWRkcyBhIGhlbHBlciBzY2hlZF9jaGVja19hZmZpbml0eV9icm9rZW4oKSBmb3IK
Pj4gdGhhdCBwdXJwb3NlIGl0ZXJhdGluZyBvdmVyIHRoZSB2Y3B1cyBjaGVja2luZyB0aGUgYWZm
aW5pdHlfYnJva2VuIGZsYWdzCj4+IGFuZCByZXR1cm5pbmcgdHJ1ZSBpZiBhbnkgb2YgdGhlIHZj
cHVzIGhhcyBpdHMgZmxhZyBzZXQuCj4gCj4gT2theSwgcGF0Y2ggMjQgaXMgc3RpbGwgYmVmb3Jl
IG11bHRpcGxlIHZDUFUtcyBwZXIgdW5pdCBiZWNvbWUKPiBwb3NzaWJsZSwgc28gbm8gaW50ZXJt
ZWRpYXRlIGJyZWFrYWdlLiBCdXQgY291bGQgeW91IHBsZWFzZQo+IG1ha2UgdGhpcyBleHBsaWNp
dCBieSBzbGlnaHRseSBleHRlbmRpbmcgdGhlIGRlc2NyaXB0aW9uIG9mIHRoZQo+IGNoYW5nZSBo
ZXJlPwoKWWVzLiBXaWxsIGV4dGVuZCB0aGUgY29tbWl0IG1lc3NhZ2Ugd2l0aDoKCiAgIFdoZW4g
c3VwcG9ydCBvZiBtdWx0aXBsZSB2Y3B1cyBwZXIgc2NoZWRfdW5pdCBpcyBiZWluZyBhZGRlZCwg
YSB1bml0CiAgIGlzIHJlZ2FyZGVkIGFzIGJlaW5nIHN1YmplY3QgdG8gImJyb2tlbiBhZmZpbml0
eSIgd2hlbiBhbnkgb2YgaXRzCiAgIHZjcHVzIGhhcyB0aGUgYWZmaW5pdHlfYnJva2VuIGZsYWcg
c2V0LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
