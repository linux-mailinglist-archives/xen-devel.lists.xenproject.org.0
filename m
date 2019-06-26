Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9ED56591
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 11:17:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg40g-0000ns-Gj; Wed, 26 Jun 2019 09:14:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hg40e-0000nm-SE
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 09:14:32 +0000
X-Inumbo-ID: ccc06c22-97f2-11e9-b83a-1f4f3ebf2901
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ccc06c22-97f2-11e9-b83a-1f4f3ebf2901;
 Wed, 26 Jun 2019 09:14:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C8902B;
 Wed, 26 Jun 2019 02:14:28 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 857253F718;
 Wed, 26 Jun 2019 02:14:27 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-7-julien.grall@arm.com>
 <alpine.DEB.2.21.1906251727410.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <255dc067-e45f-419a-5e0f-1f64954eda49@arm.com>
Date: Wed, 26 Jun 2019 10:14:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906251727410.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 06/17] xen/arm64: head: Introduce distinct
 paths for the boot CPU and secondary CPUs
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

SGkgU3RlZmFubywKCk9uIDI2LzA2LzIwMTkgMDI6MDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBNb24sIDEwIEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFRoZSBib290
IGNvZGUgaXMgY3VycmVudGx5IHF1aXRlIGRpZmZpY3VsdCB0byBnbyB0aHJvdWdoIGJlY2F1c2Ug
b2YgdGhlCj4+IGxhY2sgb2YgZG9jdW1lbnRhdGlvbiBhbmQgYSBudW1iZXIgb2YgaW5kaXJlY3Rp
b24gdG8gYXZvaWQgZXhlY3V0aW5nCj4+IHNvbWUgcGF0aCBpbiBlaXRoZXIgdGhlIGJvb3QgQ1BV
IG9yIHNlY29uZGFyeSBDUFVzLgo+Pgo+PiBJbiBhbiBhdHRlbXB0IHRvIG1ha2UgdGhlIGJvb3Qg
Y29kZSBlYXNpZXIgdG8gZm9sbG93LCBlYWNoIHBhcnRzIG9mIHRoZQo+PiBib290IGFyZSBub3cg
aW4gc2VwYXJhdGUgZnVuY3Rpb25zLiBGdXJ0aGVybW9yZSwgdGhlIHBhdGhzIGZvciB0aGUgYm9v
dAo+PiBDUFUgYW5kIHNlY29uZGFyeSBDUFVzIGFyZSBub3cgZGlzdGluY3RlZCBhbmQgZm9yIG5v
dyB3aWxsIGNhbGwgZWFjaAoKSSBub3RpY2UgYSBmZXcgdHlwbyBpbiBteSBjb21taXQgbWVzc2Fn
ZToKCnMvZGlzdGluY3RlZC9kaXN0aW5jdC8KCj4+IGZ1bmN0aW9ucy4KPj4KPj4gRm9sbG93LXVw
cyB3aWxsIHJlbW92ZSB1bmVjZXNzYXJ5IGNhbGxzIGFuZCBkbyBmdXJ0aGVyIGltcHJvdmVtZW50
CgpzL3VuZWNlc3NhcnkvdW5uZWNlc3NhcnkvCgo+PiArbGF1bmNoOgo+PiAgICAgICAgICAgUFJJ
TlQoIi0gUmVhZHkgLVxyXG4iKQo+PiAgIAo+PiAgICAgICAgICAgLyogVGhlIGJvb3QgQ1BVIHNo
b3VsZCBnbyBzdHJhaWdodCBpbnRvIEMgbm93ICovCj4+IEBAIC01OTQsNyArNjM1LDYgQEAgcGFn
aW5nOgo+PiAgICAgICAgICAgZHNiICAgc3kgICAgICAgICAgICAgICAgICAgICAvKiBFbnN1cmUg
Y29tcGxldGlvbiBvZiBUTEIgZmx1c2ggKi8KPj4gICAgICAgICAgIGlzYgo+PiAgIAo+PiAtbGF1
bmNoOgo+IAo+IEp1c3QgYmVsb3cgUFJJTlQoIi0gUmVhZHkgLVxyXG4iKSwgdGhlcmUgaXMgc3Rp
bGwgYToKPiAKPiAgICBjYnogICB4MjIsIGxhdW5jaAo+IAo+IG1vdmluZyB0aGUgbGF1bmNoIGxh
YmVsIHVwIGl0IGxvb2tzIGxpa2UgaXQgd2lsbCBjYXVzZSBhbiBpbmZpbml0ZSBsb29wPwoKVXJn
aC4gdGhpcyBsaW5lIGlzIGRyb3BwZWQgaW4gYSBsYXRlciBwYXRjaCwgc28gdGhlIGlzc3VlIG9u
bHkgd291bGQgaGFwcGVuIApkdXJpbmcgYmlzZWN0aW9uLgoKSSB3aWxsIHVwZGF0ZSB0aGUgY29k
ZSB0byBhdm9pZCB0aGUgaW5maW5pdGUgbG9vcCBoZXJlLgoKPiAKPiBFdmVyeXRoaW5nIGVsc2Ug
bG9va3MgZ29vZCwgYW5kIEkgbGlrZSB0aGUgcmVvcmcgb2YgdGhlIGNvZGUuCgpUaGFuayB5b3Uh
IEkgd2lsbCByZXdvcmsgdGhlIGFybTMyIGNvZGUgdGhlIHNhbWUgd2F5IHRoZW4gOikuCgo+IAo+
IAo+PiAgICAgICAgICAgbGRyICAgeDAsID1pbml0X2RhdGEKPj4gICAgICAgICAgIGFkZCAgIHgw
LCB4MCwgI0lOSVRJTkZPX3N0YWNrIC8qIEZpbmQgdGhlIGJvb3QtdGltZSBzdGFjayAqLwo+PiAg
ICAgICAgICAgbGRyICAgeDAsIFt4MF0KPj4gQEAgLTYwOSw2ICs2NDksNyBAQCBsYXVuY2g6Cj4+
ICAgICAgICAgICBiICAgICBzdGFydF94ZW4gICAgICAgICAgICAgIC8qIGFuZCBkaXNhcHBlYXIg
aW50byB0aGUgbGFuZCBvZiBDICovCj4+ICAgMToKPj4gICAgICAgICAgIGIgICAgIHN0YXJ0X3Nl
Y29uZGFyeSAgICAgICAgLyogKHRvIHRoZSBhcHByb3ByaWF0ZSBlbnRyeSBwb2ludCkgKi8KPj4g
K0VORFBST0MobGF1bmNoKQo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
