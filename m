Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DD2C8C24
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 16:55:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFfzR-0002uP-JB; Wed, 02 Oct 2019 14:52:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFfzQ-0002uK-OH
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 14:52:28 +0000
X-Inumbo-ID: 40acfcee-e524-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 40acfcee-e524-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 14:52:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B5D428;
 Wed,  2 Oct 2019 07:52:27 -0700 (PDT)
Received: from [10.37.10.48] (unknown [10.37.10.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 820803F706;
 Wed,  2 Oct 2019 07:52:25 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20191002144330.21392-1-jgross@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <48cce409-0ec4-a952-a564-f089683b189b@arm.com>
Date: Wed, 2 Oct 2019 15:52:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002144330.21392-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6.1 08/20] xen/sched: make vcpu_wake() and
 vcpu_sleep() core scheduling aware
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC8yLzE5IDM6NDMgUE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gdmNwdV93YWtl
KCkgYW5kIHZjcHVfc2xlZXAoKSBuZWVkIHRvIGJlIG1hZGUgY29yZSBzY2hlZHVsaW5nIGF3YXJl
Ogo+IHRoZXkgbWlnaHQgbmVlZCB0byBzd2l0Y2ggYSBzaW5nbGUgdmNwdSBvZiBhbiBhbHJlYWR5
IHNjaGVkdWxlZCB1bml0Cj4gYmV0d2VlbiBydW5uaW5nIGFuZCBub3QgcnVubmluZy4KPiAKPiBF
c3BlY2lhbGx5IHdoZW4gdmNwdV9zbGVlcCgpIGZvciBhIHZjcHUgaXMgYmVpbmcgY2FsbGVkIGJ5
IGEgdmNwdSBvZgo+IHRoZSBzYW1lIHNjaGVkdWxpbmcgdW5pdCBzcGVjaWFsIGNhcmUgbXVzdCBi
ZSB0YWtlbiBpbiBvcmRlciB0byBhdm9pZAo+IGEgZGVhZGxvY2s6IHRoZSB2Y3B1IHRvIGJlIHB1
dCBhc2xlZXAgbXVzdCBiZSBmb3JjZWQgdGhyb3VnaCBhCj4gY29udGV4dCBzd2l0Y2ggd2l0aG91
dCBkb2luZyBzbyBmb3IgdGhlIGNhbGxpbmcgdmNwdS4gRm9yIHRoaXMKPiBwdXJwb3NlIGFkZCBh
IHZjcHUgZmxhZyBoYW5kbGVkIGluIHNjaGVkX3NsYXZlKCkgYW5kIGluCj4gc2NoZWRfd2FpdF9y
ZW5kZXp2b3VzX2luKCkgYWxsb3dpbmcgYSB2Y3B1IG9mIHRoZSBjdXJyZW50bHkgcnVubmluZwo+
IHVuaXQgdG8gc3dpdGNoIHN0YXRlIGF0IGEgaGlnaGVyIHByaW9yaXR5IHRoYW4gYSBub3JtYWwg
c2NoZWR1bGUKPiBldmVudC4KPiAKPiBVc2UgdGhlIHNhbWUgbWVjaGFuaXNtIHdoZW4gd2FraW5n
IHVwIGEgdmNwdSBvZiBhIGN1cnJlbnRseSBhY3RpdmUKPiB1bml0Lgo+IAo+IFdoaWxlIGF0IGl0
IG1ha2UgdmNwdV9zbGVlcF9ub3N5bmNfbG9ja2VkKCkgc3RhdGljIGFzIGl0IGlzIHVzZWQgaW4K
PiBzY2hlZHVsZS5jIG9ubHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgo+IFJldmlld2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1
c2UuY29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpE
YXJpbywgY2FuIHlvdSBjb25maXJtIHlvdSBhcmUgaGFwcHkgd2l0aCB0aGUgc2xpZ2h0IGNoYW5n
ZXMgdG8gY2F0ZXIgQXJtPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
