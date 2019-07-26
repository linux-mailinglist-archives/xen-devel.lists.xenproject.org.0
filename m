Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A8376F4C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 18:47:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr3LA-00009B-Ok; Fri, 26 Jul 2019 16:45:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hr3L8-000093-Bo
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 16:45:06 +0000
X-Inumbo-ID: b86f0c1a-afc4-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b86f0c1a-afc4-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 16:45:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4522B337;
 Fri, 26 Jul 2019 09:45:05 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 912673F71F;
 Fri, 26 Jul 2019 09:45:04 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190726135240.21745-1-andrew.cooper3@citrix.com>
 <20190726135240.21745-3-andrew.cooper3@citrix.com>
 <20190726143829.umusp5ox7urpvkrm@Air-de-Roger>
 <19fcb905-ef99-d691-a711-9c9e04896daa@citrix.com>
 <20190726151942.jtwgl7ea5npdh3v7@Air-de-Roger>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c9fe2df4-8965-293f-dad9-3e3f2984c802@arm.com>
Date: Fri, 26 Jul 2019 17:45:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726151942.jtwgl7ea5npdh3v7@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86/xpti: Don't leak TSS-adjacent
 percpu data via Meltdown
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNi8wNy8yMDE5IDE2OjE5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIEZy
aSwgSnVsIDI2LCAyMDE5IGF0IDAzOjQ1OjIyUE0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6
Cj4+IE9uIDI2LzA3LzIwMTkgMTU6MzgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBG
cmksIEp1bCAyNiwgMjAxOSBhdCAwMjo1Mjo0MFBNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+PiBUaGVyZSBpcyBubyB3YXkgdG8gZG8gdGhpcyBpbnNpZGUgREVGSU5FX1BFUl9DUFVfUEFH
RV9BTElHTkVEKCksIGJlY2F1c2UKPj4gd2UgY2FuJ3QgYnJlYWsgdGhlIHR5cGUgYXBhcnQgdG8g
aW5zZXJ0IF9fYWxpZ25lZCgpIGluIHRoZSBtaWRkbGUuCj4gCj4gQW5kIGRvaW5nIHNvbWV0aGlu
ZyBsaWtlOgo+IAo+ICNkZWZpbmUgREVGSU5FX1BFUl9DUFVfUEFHRV9BTElHTkVEKHR5cGUsIG5h
bWUpIFwKPiAgICAgIF9fREVGSU5FX1BFUl9DUFUodHlwZSwgXyMjbmFtZSwgLnBhZ2VfYWxpZ25l
ZCkgX19hbGlnbmVkKFBBR0VfU0laRSkKPiAKPiBXb24ndCB3b3JrIGVpdGhlciBJIGd1ZXNzPwo+
IAo+IEkganVzdCBmaW5kIGl0IHVuY29uZm9ybWFibGUgdG8gaGF2ZSB0byBzcGVjaWZ5IHRoZSBh
bGlnbmVkCj4gYXR0cmlidXRlIGluIGV2ZXJ5IHVzYWdlIG9mIERFRklORV9QRVJfQ1BVX1BBR0Vf
QUxJR05FRC4KCkkgd2FzIGFib3V0IHRvIGNvbW1lbnQgdGhlIHNhbWUgb24gcGF0Y2ggIzEgYW5k
IGRlY2lkZWQgdG8gbG9vayBhdCBvbmUgb2YgdGhlIApjYWxsZXIgZmlyc3QuCgpCZWNhdXNlIG9m
IHRoZSBuYW1lLCBJIHdhcyBleHBlY3RpbmcgdGhlIG1hY3JvIHRvIGFjdHVhbGx5IGRvIHRoZSBh
bGlnbm1lbnQgZm9yIAp5b3UgYXMgd2VsbC4KCklmIGl0IGlzIG5vdCBwb3NzaWJsZSwgdGhlbiBJ
IHRoaW5rIHdlIHNob3VsZCBhZGQgYSBjb21tZW50IHNvIGRldmVsb3BlcnMga25vdyAKdGhleSBo
YXZlIHRvIGFkZCB0aGUgcGFnZS1hbGlnbm1lbnQgdGhlbXNlbHZlcy4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
