Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9343615EE5
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 10:13:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNvBL-0007xO-M6; Tue, 07 May 2019 08:10:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNvBL-0007xJ-05
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 08:10:35 +0000
X-Inumbo-ID: 91042b3a-709f-11e9-bb57-dbfcd751c205
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91042b3a-709f-11e9-bb57-dbfcd751c205;
 Tue, 07 May 2019 08:10:25 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 02:10:23 -0600
Message-Id: <5CD13D6C020000780022C5CA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 02:10:20 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Marek Marczykowski" <marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com><cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <e54979f9ce16c254c78e4a48e3e5c0eb223f6dac.1557154206.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <e54979f9ce16c254c78e4a48e3e5c0eb223f6dac.1557154206.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/5] xen/bitmap: fix bitmap_fill with
 zero-sized bitmap
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
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

Pj4+IE9uIDA2LjA1LjE5IGF0IDE2OjUwLCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gV2hlbiBiaXRtYXBfZmlsbCguLi4sIDApIGlzIGNhbGxlZCwgZG8gbm90IHRy
eSB0byB3cml0ZSBhbnl0aGluZy4gQmVmb3JlCj4gdGhpcyBwYXRjaCwgaXQgdHJpZWQgdG8gd3Jp
dGUgYWxtb3N0IExPTkdfTUFYLCBzdXJlbHkgb3ZlcndyaXRpbmcKPiBzb21ldGhpbmcuCj4gCj4g
U2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZp
c2libGV0aGluZ3NsYWIuY29tPgoKSSdtIGVtYmFycmFzc2VkLCBzZWVpbmcgdGhhdCBjb21taXQg
ZDhhNzY5NGU1YSAoImJpdG1hcF8qKCkgc2hvdWxkCmNvcGUgd2l0aCB6ZXJvIHNpemUgYml0bWFw
cyIpIGNoYW5nZWQgdGhlIGNvZGUgdG8gaXRzIHByZXNlbnQgc2hhcGUsCmJ1dCBsZWZ0IHRoZSBp
c3N1ZSB1bi1hZGRyZXNzZWQgaGVyZSBkZXNwaXRlIGl0cyB0aXRsZS4KClJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgo+IEZvdW5kIHdoaWxlIGRlYnVnZ2luZyBm
cmFtZWJ1ZmZlciBsb2NhdGVkIGFib3ZlIDRHQi4gSW4gdGhhdCBjYXNlIDMyYml0Cj4gdmFyaWFi
bGUgZm9yIGl0IG92ZXJmbG93cyBhbmQgZnJhbWVidWZmZXIgaW5pdGlhbGl6YXRpb24gemVyb2Vk
Cj4gdW5yZWxhdGVkIG1lbW9yeS4gU3BlY2lmaWNhbGx5LCBpdCBoaXQgbWJpLT5tb2RzX2NvdW50
LCBzbyBsYXRlciBvbgo+IGJpdG1hcF9maWxsKG1vZHVsZV9tYXAsIG1iaS0+bW9kc19jb3VudCkg
aW4gX19zdGFydF94ZW4oKSBjcmFzaGVkLgoKVGhlIG9yaWdpbiBvZiB5b3VyIHByb2JsZW0gYmVp
bmcgYSB0cnVuY2F0aW9uIG9uZSwgaXQgc2VlbXMgcHJldHR5CmNsZWFyIHRvIG1lIHRoYXQgaWYg
d2Ugd2FudCB0byBiZSBhYmxlIHRvIGdyYWNlZnVsbHkgaGFuZGxlIHRoYXQsCnRoZW4gd2UgbmVl
ZCB0byBzdG9wIHVzaW5nIHBsYWluIGludCBpbiBhbGwgdGhlIGludm9sdmVkIGZ1bmN0aW9ucy4K
SSdtIGN1cmlvdXMgdGhvdWdoIHdoaWNoIGJpdG1hcF9maWxsKCkgaXQgd2FzIHRoYXQgeW91IHNh
dyBtaXNiZWhhdmU6ClRoZXJlJ3Mgbm8gc3VjaCBjYWxsIGF0IGFsbCBpbiB4ZW4vZHJpdmVycy92
aWRlby8sIGFuZCBJJ20gYWxzbyBoYXZpbmcKYSBoYXJkIHRpbWUgc2VlaW5nIGhvdyB0aGUgYWRk
cmVzcyAocmF0aGVyIHRoYW4gdGhlIHNpemUpIG9mIHRoZQpmcmFtZSBidWZmZXIgY291bGQgYmUg
aW52b2x2ZWQgaGVyZS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
