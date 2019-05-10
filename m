Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8B219D68
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 14:46:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP4sM-0007yV-2L; Fri, 10 May 2019 12:43:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP4sK-0007xx-9c
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 12:43:44 +0000
X-Inumbo-ID: 3e2b653d-7321-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3e2b653d-7321-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 12:43:42 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 06:43:42 -0600
Message-Id: <5CD571FE020000780022D826@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 06:43:42 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-12-julien.grall@arm.com>
In-Reply-To: <20190507151458.29350-12-julien.grall@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 11/14] xen/x86: mm: Re-implement
 set_gpfn_from_mfn() as a static inline function
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA1LjE5IGF0IDE3OjE0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
ICtzdGF0aWMgaW5saW5lIHZvaWQgc2V0X2dwZm5fZnJvbV9tZm4odW5zaWduZWQgbG9uZyBtZm4s
IHVuc2lnbmVkIGxvbmcgcGZuKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkID0gcGFnZV9n
ZXRfb3duZXIobWZuX3RvX3BhZ2UoX21mbihtZm4pKSk7Cj4gKyAgICB1bnNpZ25lZCBsb25nIGVu
dHJ5ID0gKGQgJiYgKGQgPT0gZG9tX2NvdykpID8gU0hBUkVEX00yUF9FTlRSWSA6IHBmbjsKClRo
ZSAmJiBoZXJlIGxvb2tzLCBlaG0sIGZ1bm55LCBidXQgSSBndWVzcyBpdCdzIG5lZWRlZCBmb3Ig
ZWFybHkgYm9vdD8KQnV0IHRoYXQncyBwZXJoYXBzIGEgc2VwYXJhdGUgdGhpbmcgdG8gY2xlYW4g
dXAuIEhvd2V2ZXIsIGxvb2tpbmcgYXQKdGhpcyAtIHdoeSBpcyBBcm0gc2V0dGluZyB1cCBkb21f
Y293IGluIHRoZSBmaXJzdCBwbGFjZT8KCj4gKyAgICBpZiAoIW1hY2hpbmVfdG9fcGh5c19tYXBw
aW5nX3ZhbGlkKQoKUGxlYXNlIGFkZCB0aGUgbWlzc2luZyBibGFua3MuCgo+ICsgICAgICAgIHJl
dHVybjsKPiArCj4gKyAgICBpZiAoIG1mbiA+PSAoUkRXUl9DT01QQVRfTVBUX1ZJUlRfRU5EIC0g
UkRXUl9DT01QQVRfTVBUX1ZJUlRfU1RBUlQpIC8gNCApCgpZb3UndmUgaW52ZXJ0ZWQgdGhlIG9y
aWdpbmFsIGNvbmRpdGlvbiAoYnkgcmUtdXNpbmcgaXQgdmVyYmF0aW0pIC0gSSdtIHByZXR0eQpz
dXJlIHRoaXMgaXMgZ29pbmcgdG8gY3Jhc2guCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
