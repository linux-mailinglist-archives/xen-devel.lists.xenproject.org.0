Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A56E9571BE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 21:30:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgDZF-0002KV-IU; Wed, 26 Jun 2019 19:26:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hgDZD-0002KM-6r
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 19:26:51 +0000
X-Inumbo-ID: 589e7d91-9848-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 589e7d91-9848-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 19:26:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4215C360;
 Wed, 26 Jun 2019 12:26:50 -0700 (PDT)
Received: from [10.37.12.58] (unknown [10.37.12.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 378943F718;
 Wed, 26 Jun 2019 12:26:48 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-14-julien.grall@arm.com>
 <alpine.DEB.2.21.1906261139160.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <44a6c373-2aef-7da7-2f2a-538b74f31535@arm.com>
Date: Wed, 26 Jun 2019 20:26:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906261139160.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 13/17] xen/arm64: head: Don't setup the
 fixmap on secondary CPUs
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

SGksCgpPbiA2LzI2LzE5IDc6NTEgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBN
b24sIDEwIEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IHNldHVwX2ZpeG1hcCgpIHdp
bGwgc2V0dXAgdGhlIGZpeG1hcCBpbiB0aGUgYm9vdCBwYWdlIHRhYmxlcyBpbiBvcmRlciB0bwo+
PiB1c2UgZWFybHlwcmludGsgYW5kIGFsc28gdXBkYXRlIHRoZSByZWdpc3RlciB4MjMgaG9sZGlu
ZyB0aGUgYWRkcmVzcyB0bwo+PiB0aGUgVUFSVC4KPj4KPj4gSG93ZXZlciwgc2Vjb25kYXJ5IENQ
VXMgYXJlIHN3aXRjaGluZyB0byB0aGUgcnVudGltZSBwYWdlIHRhYmxlcyBiZWZvcmUKPj4gdXNp
bmcgdGhlIGVhcmx5cHJpbnRrIGFnYWluLiBTbyBzZXR0dGluZyB1cCB0aGUgZml4bWFwIGluIHRo
ZSBib290IHBhZ2VzCj4+IHRhYmxlcyBpcyBwb2ludGxlc3MuCj4gCj4gVHlwbzogc2V0dHRpbmcK
Cm9rLgoKPiAKPiBBbHNvLCB5b3UgY291bGQgYWRkIHRoYXQgaXQgaXMgImltcG9zc2libGUiIHRv
IGZpbmQgb3Vyc2VsdmVzIGluIHRoZQo+IHBvc2l0aW9uIG9mIG5lZWRpbmcgZWFybHlwcmludGsg
Zm9yIHNlY29uZGFyeSBDUFVzIGJlZm9yZSB0aGUgcnVudGltZQo+IHBhZ2UgdGFibGVzIGFyZSB1
cCwgYmVjYXVzZSBpdCBpcyBkb25lIHJpZ2h0IGFmdGVyIGluIHRoZSBib290IHNlcXVlbmNlLgoK
SXQgaXMga2luZCBvZiBpbXBsaWVkIGJ5IHRoZSBjb21tZW50IGFuZCB0aGUgY29kZSBiZWxvdy4g
QnV0IEkgY2FuIApjbGVhcmx5IHN0YXRlIGl0LgoKPiAKPiBSZXZpZXdlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
