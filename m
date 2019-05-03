Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4721A13318
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 19:22:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMbqH-0002JY-Pd; Fri, 03 May 2019 17:19:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMbqG-0002JT-3q
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:19:24 +0000
X-Inumbo-ID: 97d1f803-6dc7-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 97d1f803-6dc7-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 17:19:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 296C215A2;
 Fri,  3 May 2019 10:19:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3115F3F557;
 Fri,  3 May 2019 10:19:21 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-17-julien.grall@arm.com>
 <13fdc8c8-5dba-7b21-067e-e54e9531bf73@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4bd14bff-9689-7943-9319-908b74139617@arm.com>
Date: Fri, 3 May 2019 18:19:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <13fdc8c8-5dba-7b21-067e-e54e9531bf73@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 16/20] xen/arm: mm: Protect Xen page-table
 update with a spinlock
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMy8wNS8yMDE5IDE2OjU5LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKCkhpLAoKPiAKPiBPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBU
aGUgZnVuY3Rpb24gY3JlYXRlX3hlbl9lbnRyaWVzIG1heSBiZSBjb25jdXJyZW50bHkgY2FsbGVk
LiBTbyB3ZSBuZWVkCj4+IHRvIHByb3RlY3Qgd2l0aCBhIHNwaW5sb2NrIHRvIGF2b2lkIGNvcnJ1
cHRpb24gdGhlIHBhZ2UtdGFibGVzLgo+IAo+IFRoZSBxdWVzdGlvbiBmcm9tIG1lIGlzIHdoeSBk
aWRuJ3Qgd2Ugc3RlcCBpbnRvIHRoaXMgaXNzdWUgYmVmb3JlPwoKVExEUjsgYmVjYXVzZSB4ZW4g
cGFnZS10YWJsZXMgYXJlIG5vdCB0aGF0IG9mdGVuIG1vZGlmaWVkIGFmdGVyIGJvb3QuIFlldCBp
dCBpcyAKc3RpbGwgcG9zc2libGUgdG8gcmFjZS4KCkF0IHRoZSBtb21lbnQsIGNyZWF0ZV94ZW5f
ZW50cmllcygpIGNhbiBvbmx5IG1vZGlmeSB0aGUgVkEgcmFuZ2UgMCAtIDJHQi4gSW4gCnRoYXQg
cmFuZ2UsIHdlIGNhbiBtb2RpZnkgYXQgcnVudGltZSB0aGUgVk1BUCBhcmVhLiBPbmUgcG90ZW50
aWFsIGlzc3VlIGlzCmEgdm1hcCBpc3N1ZWQgYXQgdGhlIHNhbWUgdGltZS4KCldoaWxlIHRoZSBy
YW5nZSBhbGxvY2F0aW9uIGlzIHByb3RlY3RlZCBieSBhIGxvY2sgKHNlZSB2bV9hbGxvYyksIHRo
ZSBtYXBwaW5nIGlzIApub3QuIFNvIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIGVuZCB1cCBtb2Rp
ZnlpbmcgdGhlIHBhZ2UtdGFibGUgYXQgdGhlIHNhbWUuIApUaGF0IGNvdWxkIGJsb3cgdXAgaWYg
Zm9yIGluc3RhbmNlLCB0aGUgc2Vjb25kLWxldmVsIGVudHJ5IGlzIGludmFsaWQgYXMgd2UgCndv
dWxkIG5lZWQgdG8gYWxsb2NhdGUgbWVtb3J5IChvbmx5IG9uZSBjYW4gd2luIHRoYXQgcmFjZSku
CgpJbiBnZW5lcmFsLCBpdCBpcyBhIHNhbmVyIGFwcHJvYWNoIHRvIHRyeSB0byBzZXJpYWxpemUg
dGhlIG1vZGlmaWNhdGlvbnMgaW4gdGhlIApwYWdlLXRhYmxlcy4gU28geW91IGNhbiBzYWZlbHkg
cmVhZCBhbiBlbnRyeSwgY2hlY2sgaXQgYW5kIHRoZW4gdXBkYXRlIGl0LgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
