Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A949517024C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 16:25:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6yWs-0001ZA-T4; Wed, 26 Feb 2020 15:23:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6yWs-0001Z4-4t
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 15:23:18 +0000
X-Inumbo-ID: e99a0824-58ab-11ea-9462-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e99a0824-58ab-11ea-9462-12813bfff9fa;
 Wed, 26 Feb 2020 15:23:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C8701AC61;
 Wed, 26 Feb 2020 15:23:15 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
Date: Wed, 26 Feb 2020 16:23:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxNTowNSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gRnJvbTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBTZW50OiAyNiBGZWJydWFyeSAyMDIwIDEzOjU4
Cj4+Cj4+IE9uIDI1LjAyLjIwMjAgMTA6NTMsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+IFRoZXJl
J3Mgbm8gcGFydGljdWxhciByZWFzb24gc2hhcmVkX2luZm8gbmVlZCB1c2UgYSB4ZW5oZWFwIHBh
Z2UuIEl0J3MKPj4+IG9ubHkgcHVycG9zZSBpcyB0byBiZSBtYXBwZWQgYnkgdGhlIGd1ZXN0IHNv
IHVzZSBhIFBHQ19leHRyYSBkb21oZWFwCj4+IHBhZ2UKPj4+IGluc3RlYWQuCj4+Cj4+IFNpbmNl
IHRoZSBjb3ZlciBsZXR0ZXIgYWxzbyBkb2Vzbid0IGdpdmUgYW55IGJhY2tncm91bmQgLSBpcyB0
aGVyZSBhCj4+IHByb2JsZW0gd2l0aCB0aGUgY3VycmVudCBhcnJhbmdlbWVudHM/IEFyZSB0aGVy
ZSBhbnkgZnVydGhlciBwbGFucwo+PiBkZXBlbmRpbmcgb24gdGhpcyBiZWluZyBjaGFuZ2VkPyBP
ciBpcyB0aGlzIHNpbXBseSAibGV0J3MgZG8gaXQKPj4gYmVjYXVzZSBub3cgd2UgY2FuIj8KPj4K
PiAKPiBUaGUgZ2VuZXJhbCBkaXJlY3Rpb24gaXMgdG8gZ2V0IHJpZCBvZiBzaGFyZWQgeGVuaGVh
cCBwYWdlcy4gS25vd2luZwo+IHRoYXQgYSB4ZW5oZWFwIHBhZ2UgaXMgbm90IHNoYXJlZCB3aXRo
IGEgZ3Vlc3QgbWFrZXMgZGVhbGluZyB3aXRoCj4gbGl2ZSB1cGRhdGUgbXVjaCBlYXNpZXIsCgpJ
IG1heSBub3QgYmUgc2VlaW5nIGVub3VnaCBvZiB0aGUgb3ZlcmFsbCBwaWN0dXJlLCBidXQgaXQg
d291bGQgc2VlbQp0byBtZSB0aGF0IHRoZSBzcGVjaWFsIHRyZWF0bWVudCBvZiBzaGFyZWQgWGVu
IGhlYXAgcGFnZXMgd291bGQgdGhlbgpiZSByZXBsYWNlZCBieSBzcGVjaWFsIHRyZWF0bWVudCBv
ZiBQR0NfZXh0cmEgb25lcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
