Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D997CADAB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 19:55:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG5I3-0007hr-V9; Thu, 03 Oct 2019 17:53:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=leaW=X4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iG5I1-0007hm-LR
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 17:53:21 +0000
X-Inumbo-ID: aef78d8a-e606-11e9-96dc-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id aef78d8a-e606-11e9-96dc-bc764e2007e4;
 Thu, 03 Oct 2019 17:53:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFE021000;
 Thu,  3 Oct 2019 10:53:18 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEB133F739;
 Thu,  3 Oct 2019 10:53:17 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-4-julien.grall@arm.com>
 <alpine.DEB.2.21.1910011312180.20899@sstabellini-ThinkPad-T480s>
 <af8c7f32-699b-7611-495b-575a81361952@arm.com>
 <alpine.DEB.2.21.1910011714570.2943@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1910020541060.26319@sstabellini-ThinkPad-T480s>
 <a34363de-bafe-eb22-472f-4b0f2e0d325d@arm.com>
 <alpine.DEB.2.21.1910021454250.2691@sstabellini-ThinkPad-T480s>
 <080c5cf0-d57b-65a2-a89a-1a6080595a72@arm.com>
 <alpine.DEB.2.21.1910031044260.30844@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f5d16d92-1eed-674c-196d-5b431e363313@arm.com>
Date: Thu, 3 Oct 2019 18:53:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910031044260.30844@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 03/10] xen/arm: traps: Rework
 entry/exit from the guest path
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andre Przywara <Andre.Przywara@arm.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMy8xMC8yMDE5IDE4OjQ4LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
VGh1LCAzIE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIFN0ZWZhbm8sCj4+Cj4+
IE9uIDAyLzEwLzIwMTkgMjM6MjYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE9uIFdl
ZCwgMiBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gVGhhdCB3YXMgbXkgcmVmbGVj
dGlvbiBvbiB3aGV0aGVyIGl0IHdvdWxkIGJlIGEgZ29vZCBpZGVhIG9yIGEgYmFkIGlkZWEKPj4+
IHRvIGhhdmUgYSBTRVJST1IgY2hlY2sgb24gdGhlIGZpcSBoeXBlcnZpc29yIGVudHJpZXMuIE5v
dCBuZWNlc3NhcmVseSBpbgo+Pj4gdGhpcyBwYXRjaC4gUHJvYmFibHkgbm90IGluIHRoaXMgcGF0
Y2guCj4+Cj4+IElmIHlvdSByZWNlaXZlIGEgRklRIGV4Y2VwdGlvbiBvbiBBcm02NCwgdGhlbiB5
b3UgYXJlIGFscmVhZHkgZG9vbWVkIGJlY2F1c2UKPj4gdGhlIGh5cGVydmlzb3Igd2lsbCBjcmFz
aCAoc2VlIGRvX2JhZF9tb2RlKCkpLiBTbyByZWNlaXZpbmcgdGhlIFNFcnJvciBpcwo+PiBnb2lu
ZyB0byBiZSB5b3VyIGxhc3QgY29uY2VybiBoZXJlLgo+IAo+IEkgcmVhbGl6ZSB0aGF0IFhlbiBp
cyBkb29tZWQgYW55d2F5LCBidXQgaWYgSSB3YXMgdGhlIHVzZXIsIEkgd291bGQKPiBzdGlsbCB3
YW50IHRvIGtub3cgYWJvdXQgdGhlIFNFcnJvcjogaXQgaXMgbm90IGdvaW5nIHRvIHNhdmUgdGhl
Cj4gcGxhdGZvcm0gaW4gYW55IHdheSBidXQgaXQgbWlnaHQgbWFrZSBtZSByZWFsaXplIHRoZXJl
IGlzIHNvbWV0aGluZwo+IHdyb25nIHdpdGggdGhlIGd1ZXN0IGNvbmZpZ3VyYXRpb24gKGluIGFk
ZGl0aW9uIHRvIHRoZSBGSVEgcHJvYmxlbS4pCgpUaGlzIGlzIG5vdCBzb21ldGhpbmcgSSBhbSBn
b2luZyB0byBsb29rIGF0IGluIHRoZSBuZWFyIGZ1dHVyZS4gVGhlcmUgYXJlIG1vcmUgCmNvbmNl
cm5pbmcgcHJvYmxlbSBpbiBhcmNoL2FybSovZW50cnkuUy4gQWx0aG91Z2gsIHBhdGNoZXMgYXJl
IHdlbGNvbWVkLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
