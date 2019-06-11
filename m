Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8D13CCFF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 15:31:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hagqG-0003Km-CM; Tue, 11 Jun 2019 13:29:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SowN=UK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hagqF-0003Kh-8A
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 13:29:35 +0000
X-Inumbo-ID: f33b24ff-8c4c-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f33b24ff-8c4c-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 13:29:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A74DB344;
 Tue, 11 Jun 2019 06:29:33 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B9563F557;
 Tue, 11 Jun 2019 06:29:33 -0700 (PDT)
To: chenbaodong <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
References: <0fe17c1570db4930b80f0b13d3b785a8@sslemail.net>
 <fd6f7662-2da9-a4a8-feba-cd80e94c449a@arm.com>
 <b7c64d49-05a4-23b1-7b00-a68adf4ec9c0@mxnavi.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6330547a-135f-e348-40cc-ab33392e70d3@arm.com>
Date: Tue, 11 Jun 2019 14:29:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b7c64d49-05a4-23b1-7b00-a68adf4ec9c0@mxnavi.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: vtimer: fix return value to void
 for virt_timer_[save|restore]
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMS8wNi8yMDE5IDAxOjA2LCBjaGVuYmFvZG9uZyB3cm90ZToKPiAKPiBPbiA2LzExLzE5
IDA0OjE2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBOSVQ6IEkgd291bGQgdXNl
ICJjaGFuZ2UiIGluc3RlYWQgb2YgImZpeCIuIEkgZmVlbCAiZml4IiBpcyBtb3JlIHdoZW4gdGhl
cmUgCj4+IGFyZSBhbiBhY3R1YWwgYnVnLgo+IFNvdW5kIGdvb2QgdG8gbWUuCj4+Cj4+IE9uIDYv
MTAvMTkgNjowNyBBTSwgQmFvZG9uZyBDaGVuIHdyb3RlOgo+Pj4gVGhlIG9yaWdpbmFsIHR5cGUg
aXMgaW50IGFuZCBub3QgdXNlZCBhdCBhbGwgc28gZml4IHRvIHZvaWQuCj4+Cj4+IFRoZSBjb21t
aXQgbWVzc2FnZSBpcyBhIGJpdCB1bmNsZWFyLCB5b3UgbWVudGlvbiB0aGUgdHlwZSB3aGVyZWFz
IHRoZSBrZXkgCj4+IHBvaW50IGlzIG5vbmUgb2YgdGhlIGNhbGxlcnMgYXJlIHVzaW5nIHRoZSBy
ZXR1cm4gdmFsdWUuIFNvIGhvdyBhYm91dDoKPj4KPj4gInZpcnRfdGltZXJfe3NhdmUsIHJldHVy
bn0gYWx3YXlzIHJldHVybiAwIGFuZCBub25lIG9mIHRoZSBjYWxsZXIgYWN0dWFsbHkgCj4+IGNo
ZWNrIGl0LiBTbyBjaGFuZ2UgdGhlIHJldHVybiB0eXBlIHRvIHZvaWQuIgo+Pgo+PiBJZiB5b3Ug
YXJlIGhhcHB5IHdpdGggaXQsIEkgY2FuIG1ha2UgdGhlIG1vZGlmaWNhdGlvbnMgdGhlbSBvbiBj
b21taXQuCj4gaGFwcHkgd2l0aCBpdCwgcGxlYXNlLgoKQ29tbWl0dGVkLCB0aGFuayB5b3UhCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
