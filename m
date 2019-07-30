Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7767B4A9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 22:57:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsZ99-0007KI-Ce; Tue, 30 Jul 2019 20:54:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WuyF=V3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsZ98-0007KD-7X
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 20:54:58 +0000
X-Inumbo-ID: 496fb90a-b30c-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 496fb90a-b30c-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 20:54:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47FBC28;
 Tue, 30 Jul 2019 13:54:56 -0700 (PDT)
Received: from [10.37.8.36] (unknown [10.37.8.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79BF23F575;
 Tue, 30 Jul 2019 13:54:55 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-30-julien.grall@arm.com>
 <alpine.DEB.2.21.1907301324310.28600@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6b5e2b3b-9841-8bed-ca55-e973c321f44f@arm.com>
Date: Tue, 30 Jul 2019 21:54:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907301324310.28600@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 29/35] xen/arm32: head: Move assembly
 switch to the runtime PT in secondary CPUs path
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDcvMzAvMTkgOToyNSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIE1vbiwgMjIgSnVsIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gVGhlIGFzc2Vt
Ymx5IHN3aXRjaCB0byB0aGUgcnVudGltZSBQVCBpcyBvbmx5IG5lY2Vzc2FyeSBmb3IgdGhlCj4+
IHNlY29uZGFyeSBDUFVzLiBTbyBtb3ZlIHRoZSBjb2RlIGluIHRoZSBzZWNvbmRhcnkgQ1BVcyBw
YXRoLgo+Pgo+PiBXaGlsZSB0aGlzIGlzIGRlZmluaXRlbHkgbm90IGNvbXBsaWFudCB3aXRoIHRo
ZSBBcm0gQXJtIGFzIHdlIGFyZQo+PiBzd2l0Y2hpbmcgYmV0d2VlbiB0d28gZGlmZmVyZW50cyBz
ZXQgb2YgcGFnZS10YWJsZXMgd2l0aG91dCB0dXJuaW5nIG9mZgo+PiB0aGUgTU1VLiBUdXJuaW5n
IG9mZiB0aGUgTU1VIGlzIGltcG9zc2libGUgaGVyZSBhcyB0aGUgSUQgbWFwIG1heSBjbGFzaAo+
PiB3aXRoIG90aGVyIG1hcHBpbmdzIGluIHRoZSBydW50aW1lIHBhZ2UtdGFibGVzLiBUaGlzIHdp
bGwgcmVxdWlyZSBtb3JlCj4+IHJld29yayB0byBhdm9pZCB0aGUgcHJvYmxlbS4gU28gZm9yIG5v
dyBhZGQgYSBUT0RPIGluIHRoZSBjb2RlLgo+Pgo+PiBGaW5hbGx5LCB0aGUgY29kZSBpcyBjdXJy
ZW50bHkgYXNzdW1lIHRoYXQgcjUgd2lsbCBiZSBwcm9wZXJseSBzZXQgdG8gMAo+PiBiZWZvcmUg
aGFuZC4gVGhpcyBpcyBkb25lIGJ5IGNyZWF0ZV9wYWdlX3RhYmxlcygpIHdoaWNoIGlzIGNhbGxl
ZCBxdWl0ZQo+PiBlYXJseSBpbiB0aGUgYm9vdCBwcm9jZXNzLiBUaGVyZSBhcmUgYSByaXNrIHRo
aXMgbWF5IGJlIG92ZXJzaWdodCBpbiB0aGUKPj4gZnV0dXJlIGFuZCB0aGVyZWZvcmUgYnJlYWtp
bmcgc2Vjb25kYXJ5IENQVXMgYm9vdC4gSW5zdGVhZCwgc2V0IHI1IHRvIDAKPj4ganVzdCBiZWZv
cmUgdXNpbmcgaXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4+Cj4+IC0tLQo+PiAgICAgIENoYW5nZXMgaW4gdjI6Cj4+ICAgICAgICAg
IC0gUGF0Y2ggYWRkZWQKPj4gLS0tCj4+ICAgeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDQy
ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5T
Cj4+IGluZGV4IDQwODFhNTJkZmEuLjZkYzYwMzI0OTggMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNo
L2FybS9hcm0zMi9oZWFkLlMKPj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+PiBA
QCAtMjAxLDYgKzIwMSwyNiBAQCBHTE9CQUwoaW5pdF9zZWNvbmRhcnkpCj4+ICAgICAgICAgICBt
b3YgICBwYywgcjAKPj4gICBzZWNvbmRhcnlfc3dpdGNoZWQ6Cj4+ICAgICAgICAgICBibCAgICBz
ZXR1cF9maXhtYXAKPj4gKwo+PiArICAgICAgICAvKgo+PiArICAgICAgICAgKiBOb24tYm9vdCBD
UFVzIG5lZWQgdG8gbW92ZSBvbiB0byB0aGUgcHJvcGVyIHBhZ2V0YWJsZXMsIHdoaWNoIHdlcmUK
Pj4gKyAgICAgICAgICogc2V0dXAgaW4gaW5pdF9zZWNvbmRhcnlfcGFnZXRhYmxlcy4KPj4gKyAg
ICAgICAgICoKPj4gKyAgICAgICAgICogWFhYOiBUaGlzIGlzIG5vdCBjb21wbGlhbnQgd2l0aCB0
aGUgQXJtIEFybS4KPj4gKyAgICAgICAgICovCj4+ICsgICAgICAgIGxkciAgIHI0LCA9aW5pdF90
dGJyICAgICAgICAgLyogVkEgb2YgSFRUQlIgdmFsdWUgc3Rhc2hlZCBieSBDUFUgMCAqLwo+PiAr
ICAgICAgICBtb3YgICByNSwgIzAKPiAKPiBXaHkgZG8gd2UgbmVlZCB0byB6ZXJvIHI1PyBTaG91
bGRuJ3QgbGRyZCBvdmVyd3JpdGUgcjUgYW55d2F5PwoKSSB3YXMgb24gYXV0by1waWxvdCBtb2Rl
IGFuZCBzYXcgdGhlIHRyYWlsaW5nICJkIiBhbmQgdGhvdWdodCBpdCB3YXMgYSAKInN0cmQiLiBJ
IHdpbGwgcmVtb3ZlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
