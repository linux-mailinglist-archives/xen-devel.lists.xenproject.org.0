Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6A857252
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 22:10:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgECa-0005iN-1G; Wed, 26 Jun 2019 20:07:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hgECY-0005iI-H7
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 20:07:30 +0000
X-Inumbo-ID: 0582533a-984e-11e9-9e4f-9febe22790a5
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0582533a-984e-11e9-9e4f-9febe22790a5;
 Wed, 26 Jun 2019 20:07:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D3FD360;
 Wed, 26 Jun 2019 13:07:27 -0700 (PDT)
Received: from [10.37.12.58] (unknown [10.37.12.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB3233F718;
 Wed, 26 Jun 2019 13:07:26 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-18-julien.grall@arm.com>
 <alpine.DEB.2.21.1906261224240.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7c8f54c5-29e1-8296-4dd5-401ef1406e2a@arm.com>
Date: Wed, 26 Jun 2019 21:07:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906261224240.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 17/17] xen/arm64: Zero BSS after the MMU and
 D-cache is turned on
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMjYvMTkgODoyOSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIE1vbiwgMTAgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gQXQgdGhlIG1v
bWVudCBCU1MgaXMgemVyb2VkIGJlZm9yZSB0aGUgTU1VIGFuZCBELUNhY2hlIGlzIHR1cm5lZCBv
bi4KPj4gSW4gb3RoZXIgd29yZHMsIHRoZSBjYWNoZSB3aWxsIGJlIGJ5cGFzc2VkIHdoZW4gemVy
b2luZyB0aGUgQlNTIHNlY3Rpb24uCj4+Cj4+IFBlciB0aGUgSW1hZ2UgcHJvdG9jb2wgWzFdLCB0
aGUgc3RhdGUgb2YgdGhlIGNhY2hlIGZvciBCU1MgcmVnaW9uIGlzIG5vdAo+PiBrbm93biBiZWNh
dXNlIGl0IGlzIG5vdCBwYXJ0IG9mIHRoZSAibG9hZGVkIGtlcm5lbCBpbWFnZSIuCj4+Cj4+IFRo
aXMgbWVhbnMgdGhhdCB0aGUgY2FjaGUgd2lsbCBuZWVkIHRvIGJlIGludmFsaWRhdGVkIHR3aWNl
IGZvciB0aGUgQlNTCj4+IHJlZ2lvbjoKPj4gICAgICAxKSBCZWZvcmUgemVyb2luZyB0byByZW1v
dmUgYW55IGRpcnR5IGNhY2hlIGxpbmUuIE90aGVyd2lzZSB0aGV5IG1heQo+PiAgICAgIGdldCBl
dmljdGVkIHdoaWxlIHplcm9pbmcgYW5kIHRoZXJlZm9yZSBvdmVycmlkaW5nIHRoZSB2YWx1ZS4K
Pj4gICAgICAyKSBBZnRlciB6ZXJvaW5nIHRvIHJlbW92ZSBhbnkgY2FjaGUgbGluZSB0aGF0IG1h
eSBoYXZlIGJlZW4KPj4gICAgICBzcGVjdWxhdGVkLiBPdGhlcndpc2Ugd2hlbiB0dXJuaW5nIG9u
IE1NVSBhbmQgRC1DYWNoZSwgdGhlIENQVSBtYXkKPj4gICAgICBzZWUgb2xkIHZhbHVlcy4KPj4K
Pj4gSG93ZXZlciwgdGhlIG9ubHkgcmVhc29uIHRvIGhhdmUgdGhlIEJTUyB6ZXJvZWQgZWFybHkg
aXMgYmVjYXVzZSB0aGUKPj4gYm9vdCBwYWdlIHRhYmxlcyBhcmUgcGFydCBvZiBCU1MuIFRvIGF2
b2lkIHRoZSB0d28gY2FjaGUgaW52YWxpZGF0aW9ucywKPj4gaXQgaXMgcG9zc2libGUgdG8gbW92
ZSB0aGUgcGFnZSB0YWJsZXMgaW4gdGhlIHNlY3Rpb24gLmRhdGEucGFnZV9hbGlnbmVkLgo+IAo+
IEkgYW0gbm90IGZvbGxvd2luZyB0aGUgbGFzdCBwYXJ0LiBIb3cgaXMgbW92aW5nIHRoZSBib290
IHBhZ2UgdGFibGVzIHRvCj4gLmRhdGEucGFnZV9hbGlnbmVkIHNvbHZpbmcgdGhlIHByb2JsZW0/
IERvIHdlIG5lZWQgdG8gemVybwo+IC5kYXRhLnBhZ2VfYWxpZ25lZCBlYXJseSBvciBjYW4gd2Ug
c2tpcCBpdCBiZWNhdXNlIGl0IGlzIGd1YXJhbnRlZWQgdG8KPiBhbHJlYWR5IGJlIHplcm8/CgpH
bG9iYWwgdmFyaWFibGVzIGFyZSBpbml0aWFsaXplZCB0byB6ZXJvIGJ5IGRlZmF1bHQgcmVnYXJk
bGVzcyB0aGUgCnNlY3Rpb24gdGhleSByZXNpZGUuIFVzdWFsbHkgdGhleSBhcmUgc3RvcmVkIGlu
IEJTUyBiZWNhdXNlIGl0IHNhdmVzIApzcGFjZSBpbiB0aGUgYmluYXJ5LgoKV2l0aCB0aGUgSW1h
Z2UgcHJvdG9jb2wsIEJTUyBpcyBub3QgaW5pdGlhbGl6ZWQgYnkgdGhlIGJvb3Rsb2FkZXIgc28g
d2UgCmhhdmUgdG8gZG8gb3Vyc2VsZi4KClRoZSBzZWN0aW9uIC5kYXRhLnBhZ2VfYWxpZ25lZCBp
cyBhbHdheXMgcGFydCBvZiB0aGUgYmluYXJ5LiBTbyB0aGUgCmNvbXBpbGVyIHdpbGwgd3JpdGUg
emVybyBpbiB0aGUgYmluYXJ5IGZvciBhbnkgZ2xvYmFsIHZhcmlhYmxlcyBwYXJ0IG9mIAp0aGF0
IHNlY3Rpb24gYW5kIHRoZXJlZm9yZSB0aGUgY29ycmVzcG9uZGluZyBtZW1vcnkgd2lsbCBiZSB6
ZXJvZWQgd2hlbiAKbG9hZGluZyB0aGUgYmluYXJ5LgoKSWYgaXQgbWFrZXMgc2Vuc2UsIEkgY2Fu
IHRyeSB0byBpbmNvcnBvcmF0ZSB0aGF0IGluIHRoZSBjb21taXQgbWVzc2FnZS4KCj4gCj4gCj4+
IEEgbmV3IG1hY3JvIERFRklORV9CT09UX1BBR0VfVEFCTEUgaXMgaW50cm9kdWNlZCB0byBjcmVh
dGUgYW5kIG1hcmsKPj4gcGFnZS10YWJsZXMgdXNlZCBiZWZvcmUgQlNTIGlzIHplcm9lZC4gVGhp
cyBpbmNsdWRlcyBhbGwgYm9vdF8qIGJ1dCBhbHNvCj4+IHhlbl9maXhtYXAgYXMgemVyb19ic3Mo
KSB3aWxsIHByaW50IGEgbWVzc2FnZSB3aGVuIGVhcmx5cHJpbnRrIGlzCj4+IGVuYWJsZWQuCj4g
Cj4gT24gYSBzaW1pbGFyIG5vdGUsIGFuZCBjb250aW51aW5nIGZyb20gd2hhdCBJIHdyb3RlIGFi
b3ZlLCBkbyB3ZSBuZWVkIHRvCj4gbWFrZSBzdXJlIHRvIHplcm8gdGhlIHhlbl9maXhtYXAgYmVm
b3JlIGhvb2tpbmcgaXQgdXAgc2V0dXBfZml4bWFwPwoKU2VlIGFib3ZlLgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
