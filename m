Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F4B103A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 15:45:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8PMr-0007yX-1I; Thu, 12 Sep 2019 13:42:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pap2=XH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8PMq-0007yS-BO
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 13:42:36 +0000
X-Inumbo-ID: 2d177798-d563-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d177798-d563-11e9-b76c-bc764e2007e4;
 Thu, 12 Sep 2019 13:42:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8D143B657;
 Thu, 12 Sep 2019 13:42:33 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
References: <20190912132813.6509-1-jgross@suse.com>
 <20190912132813.6509-2-jgross@suse.com>
 <1b9eb9cc-38b2-7454-c97b-fec01d796102@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <4b0daee9-b9cb-b853-9af7-691bd42537a1@suse.com>
Date: Thu, 12 Sep 2019 15:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1b9eb9cc-38b2-7454-c97b-fec01d796102@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v5 1/5] xen/spinlocks: in debug builds store
 cpu holding the lock
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
 Julien Grall <julien.grall@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMTkgMTU6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEyLjA5LjIwMTkgMTU6
MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEBAIC0yNjcsNiArMjg4LDcgQEAgaW50IF9zcGlu
X3RyeWxvY2tfcmVjdXJzaXZlKHNwaW5sb2NrX3QgKmxvY2spCj4+ICAgCj4+ICAgICAgIC8qIERv
bid0IGFsbG93IG92ZXJmbG93IG9mIHJlY3Vyc2VfY3B1IGZpZWxkLiAqLwo+PiAgICAgICBCVUlM
RF9CVUdfT04oTlJfQ1BVUyA+IFNQSU5MT0NLX05PX0NQVSk7Cj4+ICsgICAgQlVJTERfQlVHX09O
KFNQSU5MT0NLX1JFQ1VSU0VfQklUUyA8PSAwKTsKPiAKPiBUaGlzIGlzIHRvbyB3ZWFrOiBXaGls
ZSBJIGRvbid0IHRoaW5rIHdlIHN0cmljdGx5IG5lZWQgMTUgbGV2ZWxzIG9mCj4gcmVjdXJzaW9u
LCBJIGFsc28gZG9uJ3QgdGhpbmsgd2UnbGwgZ2V0IGF3YXkgd2l0aCBqdXN0IDEuIEkgdGhpbmsK
PiB0aGlzIG1pbmltYWxseSBuZWVkcyB0byBiZSAiPD0gMSIsIHBlcmhhcHMgYmV0dGVyICI8PSAy
Ii4gT3RoZXIKPiB0aG91Z2h0cyAoYWxzbyBieSBvdGhlcnMpIG9uIHRoZSBwcmVjaXNlIHZhbHVl
IHRvIHVzZSBoZXJlCj4gYXBwcmVjaWF0ZWQuIFdpdGggdGhpcyBzdWl0YWJseSB0YWtlbiBjYXJl
IG9mICh3aGljaCBjYW4gaGFwcGVuCj4gd2hpbGUgY29tbWl0dGluZywgYnV0IG11c3Qgbm90IGJl
IGZvcmdvdHRlbikKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKIjIiIHNob3VsZCBiZSBubyBwcm9ibGVtLCBhcyB0aGUgb3RoZXIgYWRkZWQKCkJVSUxEX0JV
R19PTihMT0NLX0RFQlVHX1BBRF9CSVRTwrc8PcK3MCk7CgppcyBpbXBseWluZyB0aGF0IGFscmVh
ZHkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
