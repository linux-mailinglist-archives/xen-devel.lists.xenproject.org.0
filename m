Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846A989BD4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 12:46:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hx7nj-0004CT-DE; Mon, 12 Aug 2019 10:43:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dIXR=WI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hx7ni-0004CO-Ad
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 10:43:42 +0000
X-Inumbo-ID: 0aaa355f-bcee-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 0aaa355f-bcee-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 10:43:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77E6315AB;
 Mon, 12 Aug 2019 03:43:37 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 061483F706;
 Mon, 12 Aug 2019 03:43:36 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-6-sstabellini@kernel.org> <87pnlfh3dc.fsf@epam.com>
 <alpine.DEB.2.21.1908091524160.7788@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <32e83068-b4ed-0226-5629-d2cab2311873@arm.com>
Date: Mon, 12 Aug 2019 11:43:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908091524160.7788@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 6/7] xen/arm: don't iomem_permit_access
 for reserved-memory regions
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwOS8wOC8yMDE5IDIzOjU2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
VGh1LCA4IEF1ZyAyMDE5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4gSGkgU3RlZmFubywK
Pj4KPj4gU3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlczoKPj4KPj4+IERvbid0IGFsbG93IHJlc2Vy
dmVkLW1lbW9yeSByZWdpb25zIHRvIGJlIHJlbWFwcGVkIGludG8gYW55IGd1ZXN0cywKPj4+IHVu
dGlsIHJlc2VydmVkLW1lbW9yeSByZWdpb25zIGFyZSBwcm9wZXJseSBzdXBwb3J0ZWQgaW4gWGVu
LiBGb3Igbm93LAo+Pj4gZG8gbm90IGNhbGwgaW9tZW1fcGVybWl0X2FjY2VzcyBmb3IgdGhlbS4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlu
eC5jb20+Cj4+PiAtLS0KPj4+Cj4+PiBDaGFuZ2VzIGluIHY0Ogo+Pj4gLSBjb21wYXJlIHRoZSBw
YXJlbnQgbmFtZSB3aXRoIHJlc2VydmVkLW1lbW9yeQo+Pj4gLSB1c2UgZHRfbm9kZV9jbXAKPj4+
Cj4+PiBDaGFuZ2VzIGluIHYzOgo+Pj4gLSBuZXcgcGF0Y2gKPj4+IC0tLQo+Pj4gICB4ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMgfCAyNCArKysrKysrKysrKysrKysrLS0tLS0tLS0KPj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYwo+Pj4gaW5kZXggNGM4NDA0MTU1YS4uMjY3ZTA1NDllMiAxMDA2NDQKPj4+
IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+Pj4gKysrIGIveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jCj4+PiBAQCAtMTE1MywxNyArMTE1MywyNSBAQCBzdGF0aWMgaW50IF9f
aW5pdCBtYXBfcmFuZ2VfdG9fZG9tYWluKGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2
LAo+Pj4gICAgICAgc3RydWN0IG1hcF9yYW5nZV9kYXRhICptcl9kYXRhID0gZGF0YTsKPj4+ICAg
ICAgIHN0cnVjdCBkb21haW4gKmQgPSBtcl9kYXRhLT5kOwo+Pj4gICAgICAgYm9vbCBuZWVkX21h
cHBpbmcgPSAhZHRfZGV2aWNlX2Zvcl9wYXNzdGhyb3VnaChkZXYpOwo+Pj4gKyAgICBjb25zdCBz
dHJ1Y3QgZHRfZGV2aWNlX25vZGUgKnBhcmVudCA9IGR0X2dldF9wYXJlbnQoZGV2KTsKPj4+ICAg
ICAgIGludCByZXM7Cj4+Pgo+Pj4gLSAgICByZXMgPSBpb21lbV9wZXJtaXRfYWNjZXNzKGQsIHBh
ZGRyX3RvX3BmbihhZGRyKSwKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRk
cl90b19wZm4oUEFHRV9BTElHTihhZGRyICsgbGVuIC0gMSkpKTsKPj4+IC0gICAgaWYgKCByZXMg
KQo+Pj4gKyAgICAvKgo+Pj4gKyAgICAgKiBEb24ndCBnaXZlIGlvbWVtIHBlcm1pc3Npb25zIGZv
ciByZXNlcnZlZC1tZW1vcnkgcmFuZ2VzIHVudGlsCj4+PiArICAgICAqIHJlc2VydmVkLW1lbW9y
eSBzdXBwb3J0IGlzIGNvbXBsZXRlLgo+Pj4gKyAgICAgKi8KPj4+ICsgICAgaWYgKCBkdF9ub2Rl
X2NtcChkdF9ub2RlX25hbWUocGFyZW50KSwgInJlc2VydmVkLW1lbW9yeSIpID09IDAgKQo+PiBB
bSBJIG1pc3Npbmcgc29tZXRoaW5nLCBvciB5b3UgYXJlIHBlcm1pdHRpbmcgYWNjZXNzIG9ubHkg
aWYgaXQgZnJvbSBhCj4+ICJyZXNlcnZlZC1tZW1vcnkiIG5vZGU/IFRoaXMgY29udHJhZGljdHMg
d2l0aCBwYXRjaCBkZXNjcmlwdGlvbi4KPiAKPiBXZWxsIHNwb3R0ZWQhIEkgaW52ZXJ0ZWQgdGhl
IGNvbmRpdGlvbiBieSBtaXN0YWtlLgo+IAo+IAo+Pj4gICAgICAgewo+Pj4gLSAgICAgICAgcHJp
bnRrKFhFTkxPR19FUlIgIlVuYWJsZSB0byBwZXJtaXQgdG8gZG9tJWQgYWNjZXNzIHRvIgo+Pj4g
LSAgICAgICAgICAgICAgICIgMHglIlBSSXg2NCIgLSAweCUiUFJJeDY0IlxuIiwKPj4+IC0gICAg
ICAgICAgICAgICBkLT5kb21haW5faWQsCj4+PiAtICAgICAgICAgICAgICAgYWRkciAmIFBBR0Vf
TUFTSywgUEFHRV9BTElHTihhZGRyICsgbGVuKSAtIDEpOwo+Pj4gLSAgICAgICAgcmV0dXJuIHJl
czsKPj4+ICsgICAgICAgIHJlcyA9IGlvbWVtX3Blcm1pdF9hY2Nlc3MoZCwgcGFkZHJfdG9fcGZu
KGFkZHIpLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90b19w
Zm4oUEFHRV9BTElHTihhZGRyICsgbGVuIC0gMSkpKTsKPj4+ICsgICAgICAgIGlmICggcmVzICkK
Pj4+ICsgICAgICAgIHsKPj4+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiVW5hYmxl
IHRvIHBlcm1pdCB0byBkb20lZCBhY2Nlc3MgdG8iCj4+PiArICAgICAgICAgICAgICAgICAgICIg
MHglIlBSSXg2NCIgLSAweCUiUFJJeDY0IlxuIiwKPj4+ICsgICAgICAgICAgICAgICAgICAgZC0+
ZG9tYWluX2lkLAo+Pj4gKyAgICAgICAgICAgICAgICAgICBhZGRyICYgUEFHRV9NQVNLLCBQQUdF
X0FMSUdOKGFkZHIgKyBsZW4pIC0gMSk7Cj4+PiArICAgICAgICAgICAgcmV0dXJuIHJlczsKPj4+
ICsgICAgICAgIH0KPj4+ICAgICAgIH0KPj4+Cj4+PiAgICAgICBpZiAoIG5lZWRfbWFwcGluZyAp
Cj4+IFNvLCB0aGlzIHJlZ2lvbiBjb2xkIGJlIG1hcHBlZCwgYnV0IHdpdGhvdXQgdGhlIGFjY2Vz
cz8KCklPTUVNIGFjY2VzcyBhbmQgbWFwcGluZyBhcmUgdHdvIGRpZmZlcmVudCB0aGluZ3MuIFRo
ZSBmb3JtZXIgZ2l2ZXMgYSBkb21haW4gCmNvbnRyb2wgb3ZlciBtYW5hZ2luZyB0aGUgcmVnaW9u
IChpLmUgbWFwcGluZywgdW5tYXBwaW5nLCBnaXZpbmcgYWNjZXNzIHRvIAphbm90aGVyIGRvbWFp
bikuIFRoZSBsYXR0ZXIgd2lsbCBtYXAgdGhlIHJlZ2lvbiBpbiB0aGUgUDJNIHNvIHRoZSBkb21h
aW4gY2FuIApyZWFkL3dyaXRlIGludG8gaXQuCgo+IAo+IEknbGwgY2hhbmdlIGl0IHRvIHJldHVy
biBlYXJseSBmcm9tIHRoZSBmdW5jdGlvbiBmb3IgcmVzZXJ2ZWQtbWVtb3J5Cj4gcmVnaW9ucy4K
CkkgYW0gbm90IHN1cmUgdG8gdW5kZXJzdGFuZCB5b3Ugc3VnZ2VzdGlvbiBoZXJlLi4uIFlvdSBz
dGlsbCBuZWVkIHRvIGhhdmUgCnJlc2VydmVkLXJlZ2lvbnMgbWFwcGVkIGludG8gdGhlIGhhcmR3
YXJlIGRvbWFpbi4gVGhlIG9ubHkgdGhpbmcgd2Ugd2FudCB0byAKcHJldmVudCBpcyB0aGUgZG9t
YWluIHRvIG1hbmFnZSB0aGUgcmVnaW9uLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
