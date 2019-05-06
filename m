Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CF51523B
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 19:05:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNgzz-0000PJ-K2; Mon, 06 May 2019 17:01:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IX9s=TG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hNgzy-0000PE-8y
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 17:01:54 +0000
X-Inumbo-ID: a523868b-7020-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id a523868b-7020-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 17:01:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E858374;
 Mon,  6 May 2019 10:01:52 -0700 (PDT)
Received: from [10.37.12.89] (unknown [10.37.12.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 319BC3F575;
 Mon,  6 May 2019 10:01:51 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-7-julien.grall@arm.com>
 <7a6cb580-e4d7-7325-7797-d16ca0856c57@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ac720fde-f515-dd69-69d8-761f7f119d74@arm.com>
Date: Mon, 6 May 2019 18:01:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7a6cb580-e4d7-7325-7797-d16ca0856c57@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 06/12] xen/arm: mm: Sanity check any update
 of Xen page tables
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

SGksCgpPbiA1LzYvMTkgMTo0OCBQTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4gK8KgwqDCoCAv
KiBTYW5pdHkgY2hlY2sgd2hlbiByZW1vdmluZyBhIHBhZ2UuICovCj4+ICvCoMKgwqAgZWxzZSBp
ZiAoIChmbGFncyAmIChfUEFHRV9QUkVTRU5UfF9QQUdFX1BPUFVMQVRFKSkgIT0gMCApCj4gCj4g
U2hvdWxkbid0IGl0IGJlIGAoZmxhZ3MgJiAoX1BBR0VfUFJFU0VOVHxfUEFHRV9QT1BVTEFURSkp
ID09IDBgID8gQXMgSSAKPiB1bmRlcnN0YW5kIGZyb20gdGhlIHBhdGNoIDA0LCB3ZSBkbyByZW1v
dmUgYSBwYWdlIHdoZW4gd2UgZG8gdW5zZXQgYm90aCAKPiBmbGFncy4KCkhtbW0sIHllcy4gSSB3
aWxsIHVwZGF0ZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPiAKPiBCVFcsIEkgd291bGQgc3VnZ2Vz
dCBwYXRjaGVzIHJlb3JkZXJpbmcgaW4gdGhpcyBzZXJpZXMuIFRoaXMgcGF0Y2ggCj4gc2hvdWxk
IGdvIHJpZ2h0IGFmdGVyIHRoZSBwYXRjaCAwNCwgd2hlcmUgeW91IGludHJvZHVjZSB0aG9zZSBm
bGFncy4gCj4gQmVjYXVzZSBoZXJlIHlvdSBpbXBsZW1lbnQgdGhlaXIgdXNhZ2UuIEJ1dCBzb21l
d2h5IHlvdSBpbnNlcnRlZCBhbiAKPiB1bnJlbGF0ZWQgY2hhbmdlIGluIGJldHdlZW4uCgpJdCBp
cyBub3QgdW5yZWxhdGVkLCB0aGUgcGF0Y2ggaXMgbmVjZXNzYXJ5IHRvIG1ha2UgdGhpcyBwYXRj
aCB3b3Jrcy4gCk90aGVyd2lzZSB5b3Ugd2lsbCBoaXQgdGhlIEFTU0VSVChtZm5fZXEobWZuLCBJ
TlZBTElEX01GTikpIGFmdGVyIG9uZSAKaXRlcmF0aW9uLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
