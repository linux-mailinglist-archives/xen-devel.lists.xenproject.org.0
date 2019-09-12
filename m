Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634D2B101C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 15:38:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8PGZ-0007C1-9E; Thu, 12 Sep 2019 13:36:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8PGX-0007Bw-ER
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 13:36:05 +0000
X-Inumbo-ID: 43faa288-d562-11e9-9599-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43faa288-d562-11e9-9599-12813bfff9fa;
 Thu, 12 Sep 2019 13:36:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D9AA5AF89;
 Thu, 12 Sep 2019 13:36:02 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20190912132813.6509-1-jgross@suse.com>
 <20190912132813.6509-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b9eb9cc-38b2-7454-c97b-fec01d796102@suse.com>
Date: Thu, 12 Sep 2019 15:36:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912132813.6509-2-jgross@suse.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxNToyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBAQCAtMjY3LDYgKzI4
OCw3IEBAIGludCBfc3Bpbl90cnlsb2NrX3JlY3Vyc2l2ZShzcGlubG9ja190ICpsb2NrKQo+ICAK
PiAgICAgIC8qIERvbid0IGFsbG93IG92ZXJmbG93IG9mIHJlY3Vyc2VfY3B1IGZpZWxkLiAqLwo+
ICAgICAgQlVJTERfQlVHX09OKE5SX0NQVVMgPiBTUElOTE9DS19OT19DUFUpOwo+ICsgICAgQlVJ
TERfQlVHX09OKFNQSU5MT0NLX1JFQ1VSU0VfQklUUyA8PSAwKTsKClRoaXMgaXMgdG9vIHdlYWs6
IFdoaWxlIEkgZG9uJ3QgdGhpbmsgd2Ugc3RyaWN0bHkgbmVlZCAxNSBsZXZlbHMgb2YKcmVjdXJz
aW9uLCBJIGFsc28gZG9uJ3QgdGhpbmsgd2UnbGwgZ2V0IGF3YXkgd2l0aCBqdXN0IDEuIEkgdGhp
bmsKdGhpcyBtaW5pbWFsbHkgbmVlZHMgdG8gYmUgIjw9IDEiLCBwZXJoYXBzIGJldHRlciAiPD0g
MiIuIE90aGVyCnRob3VnaHRzIChhbHNvIGJ5IG90aGVycykgb24gdGhlIHByZWNpc2UgdmFsdWUg
dG8gdXNlIGhlcmUKYXBwcmVjaWF0ZWQuIFdpdGggdGhpcyBzdWl0YWJseSB0YWtlbiBjYXJlIG9m
ICh3aGljaCBjYW4gaGFwcGVuCndoaWxlIGNvbW1pdHRpbmcsIGJ1dCBtdXN0IG5vdCBiZSBmb3Jn
b3R0ZW4pClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
