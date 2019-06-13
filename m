Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB13433FA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 10:11:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbKlc-0000FC-Vv; Thu, 13 Jun 2019 08:07:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xsGU=UM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbKlb-0000F7-OH
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 08:07:27 +0000
X-Inumbo-ID: 475ffae2-8db2-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 475ffae2-8db2-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 08:07:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 087E2367;
 Thu, 13 Jun 2019 01:07:25 -0700 (PDT)
Received: from [10.37.12.54] (unknown [10.37.12.54])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA9973F557;
 Thu, 13 Jun 2019 01:07:23 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-10-julien.grall@arm.com>
 <alpine.DEB.2.21.1906121523550.13737@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c791b221-a809-6d56-4137-055fd0ffa604@arm.com>
Date: Thu, 13 Jun 2019 09:07:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906121523550.13737@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 09/12] xen/arm: mm: Use {,
 un}map_domain_page() to map/unmap Xen page-tables
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
Cc: xen-devel@lists.xenproject.org, Andrii Anisov <Andrii_Anisov@epam.com>,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMTIvMTkgMTE6MjUgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDE0IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEN1cnJlbnRs
eSwgdGhlIHZpcnR1YWwgYWRkcmVzcyBvZiB0aGUgM3JkIGxldmVsIHBhZ2UtdGFibGVzIGlzIG9i
dGFpbmVkCj4+IHVzaW5nIG1mbl90b192aXJ0KCkuCj4+Cj4+IE9uIEFybTMyLCBtZm5fdG9fdmly
dCBjYW4gb25seSB3b3JrIG9uIHhlbmhlYXAgcGFnZS4gV2hpbGUgaW4gcHJhY3RpY2UKPj4gYWxs
IHRoZSBwYWdlLXRhYmxlcyB1cGRhdGVkIHdpbGwgcmVzaWRlIGluIHhlbmhlYXAsIGluIHByYWN0
aXZlIHRoZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF4gaW4gdGhlb3J5ID8KClRoZSBmaXJzdCBvbmUgc2hvdWxkIHRvIGJlICJ0aGVv
cnkiIGFuZCB0aGUgc2Vjb25kICJwcmFjdGljZSIuIEJlY2F1c2UgCnNvbWUgb2YgdGhlIGJvb3Rz
dHJhcCBwYWdlLXRhYmxlcyAoZS5nIHhlbl9maXhtYXAveGVuX21hcHBpbmcpIGFyZSBwYXJ0IApv
ZiBYZW4gYmluYXJ5LgoKPiAKPiAKPj4gcGFnZS10YWJsZXMgY292ZXJpbmcgWGVuIG1lbW9yeSAo
ZS5nIHhlbl9tYXBwaW5nKSBpcyBwYXJ0IG9mIFhlbiBiaW5hcnkuCj4+Cj4+IEZ1cnRoZXJtb3Jl
LCBhIGZvbGxvdy11cCBjaGFuZ2Ugd2lsbCB1cGRhdGUgeGVuX3B0X3VwZGF0ZV9lbnRyeSgpIHRv
Cj4+IHdhbGsgYWxsIHRoZSBsZXZlbHMgYW5kIHRoZXJlZm9yZSBiZSBtb3JlIGdlbmVyaWMuIFNv
bWUgb2YgdGhlCj4+IHBhZ2UtdGFibGVzIHdpbGwgYWxzbyBwYXJ0IG9mIFhlbiBtZW1vcnkgYW5k
IHRoZXJlZm9yZSB3aWxsIG5vdCBiZQo+PiByZWFjaGFibGUgdXNpbmcgbWZuX3RvX3ZpcnQoKS4K
Pj4KPj4gVGhlIGVhc2llc3Qgd2F5IHRvIHJlYWNoIHRob3NlIHBhZ2VzIGlzIHRvIHVzZSB7LCB1
bn1tYXBfZG9tYWluX3BhZ2UoKS4KPj4gV2hpbGUgb24gYXJtMzIgdGhpcyBtZWFucyBhbiBleHRy
YSBtYXBwaW5nIGluIHRoZSBub3JtYWwgY2FzZXMsIHRoaXMgaXMgbm90Cj4+IHZlcnkgaW1wb3J0
YW50IGFzIHhlbiBwYWdlLXRhYmxlcyBhcmUgbm90IHVwZGF0ZWQgb2Z0ZW4uCj4+Cj4+IEluIG9y
ZGVyIHRvIGFsbG93IGZ1dHVyZSBjaGFuZ2UgaW4gdGhlIHdheSBYZW4gcGFnZS10YWJsZXMgYXJl
IG1hcHBlZCwKPj4gdHdvIG5ldyBoZWxwZXJzIGFyZSBpbnRyb2R1Y2VkIHRvIG1hcC91bm1hcCB0
aGUgcGFnZS10YWJsZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Cj4+IFJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5p
c292QGVwYW0uY29tPgo+IAo+IGFzaWRlIGZyb20gdGhlIHR5cG8gYWJvdmU6CgpMZXQgbWUga25v
dyBpZiBteSBzdWdnZXN0aW9uIG1ha2VzIHNlbnNlIGFib3ZlLgoKPiAKPiBBY2tlZC1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKVGhhbmsgeW91LgoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
