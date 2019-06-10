Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADCF3BC5D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:02:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haPWq-0005H5-RX; Mon, 10 Jun 2019 19:00:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haPWp-0005H0-II
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:00:23 +0000
X-Inumbo-ID: fdbd6200-8bb1-11e9-a45f-87159f48a5be
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fdbd6200-8bb1-11e9-a45f-87159f48a5be;
 Mon, 10 Jun 2019 19:00:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B372337;
 Mon, 10 Jun 2019 12:00:19 -0700 (PDT)
Received: from [10.37.10.2] (unknown [10.37.10.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 468333F246;
 Mon, 10 Jun 2019 12:00:17 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190602102614.22640-1-julien.grall@arm.com>
 <d39a21d8-12b3-5bb9-9f09-16fba17d0857@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b1b0e507-d9ac-8c3b-7613-494407580ce7@arm.com>
Date: Mon, 10 Jun 2019 20:00:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d39a21d8-12b3-5bb9-9f09-16fba17d0857@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: irq: Don't use _IRQ_PENDING
 when handling host interrupt
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
Cc: andre.przywara@arm.com, sstabellini@kernel.org, andrii_anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA2LzEwLzE5IDEyOjIzIFBNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKCkhpLAoKPiBPbiAwMi4wNi4xOSAxMzoyNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+PiAr
ICogVGhpcyBzaG91bGQgb25seSBiZSBjYWxsZWQgd2l0aCBpbnRlcnJ1cHQgcm91dGVkIHRvIGd1
ZXN0LiBUaGUgZmxvdwo+PiArICogb2YgaW50ZXJydXB0IHJvdXRlZCB0byBYZW4gYW55IHNvZnR3
YXJlIGNoYW5nZSBvZiB0aGUgc3RhdGUuCj4gCj4gU29ycnkgSSBjYW4ndCBwYXJzZSB0aGUgbGFz
dCBzZW50ZW5jZS4gSXQgc2VlbXMgdG8gbWUgeW91IG1pc3NlZCBhIAo+IHdvcmQvd29yZHM/CgpI
bW1tLCBzb3JyeSBmb3IgdGhhdC4gSG93IGFib3V0IHRoZSBmb2xsb3dpbmc6CgoiVGhpcyBzaG91
bGQgb25seSBiZSBjYWxsZWQgd2l0aCBpbnRlcnJ1cHQgcm91dGVkIHRvIGd1ZXN0LiBUaGUgZmxv
dyBvZiAKaW50ZXJydXB0IHJvdXRlZCB0byBYZW4gaXMgbm90IGFibGUgY29wZSB3aXRoIHNvZnR3
YXJlIGNoYW5nZSBvZiB0aGUgCmFjdGl2ZSBzdGF0ZSI/Cgo+IAo+IEZvciB0aGUgcmVzdDoKPiAK
PiBSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRo
YW5rIHlvdSBmb3IgdGhlIHJldmlldyEgSSBhbSBub3QgcGxhbm5pbmcgdG8gcmVzZW5kIHRoZSBw
YXRjaCBhbmQgSSAKd2lsbCB1cGRhdGUgdGhlIGNvbW1lbnQgb24gY29tbWl0IChwZW5kaW5nIFN0
ZWZhbm8ncyByZXZpZXcpLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
