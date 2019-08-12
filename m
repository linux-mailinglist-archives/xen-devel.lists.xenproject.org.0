Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4854D8B046
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:56:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQgp-0002Fi-3P; Tue, 13 Aug 2019 06:53:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZmNG=WJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hxQgn-0002EH-9u
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:53:49 +0000
X-Inumbo-ID: 00dd357a-bd29-11e9-80fd-f785ce8272b3
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00dd357a-bd29-11e9-80fd-f785ce8272b3;
 Mon, 12 Aug 2019 17:45:42 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C350206C2;
 Mon, 12 Aug 2019 17:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565631941;
 bh=FutxyUrwhH/p8Rl5n2AZUIDVl59QpovEvA5mD57kb5M=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=CEQ6DchryWHA50ejw0NCo6t00wFedY7MoGnBWjpZARVwREMSCXtQv2UTD7Nuh7W9M
 mY6FfYg3ypKJHS9xHPLetFY1QEnnTwL0D/PYcrYRGDMAsKNNFMZFbk+KNWTxIPzqBV
 Nwkx1CZ/XG1Yn4ybhPspKW5/8kE6IWUhCDI1aXJo=
Date: Mon, 12 Aug 2019 10:45:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <32e83068-b4ed-0226-5629-d2cab2311873@arm.com>
Message-ID: <alpine.DEB.2.21.1908121036040.7788@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-6-sstabellini@kernel.org> <87pnlfh3dc.fsf@epam.com>
 <alpine.DEB.2.21.1908091524160.7788@sstabellini-ThinkPad-T480s>
 <32e83068-b4ed-0226-5629-d2cab2311873@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMiBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDA5LzA4LzIwMTkg
MjM6NTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFRodSwgOCBBdWcgMjAxOSwg
Vm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gPiA+IEhpIFN0ZWZhbm8sCj4gPiA+IAo+ID4gPiBT
dGVmYW5vIFN0YWJlbGxpbmkgd3JpdGVzOgo+ID4gPiAKPiA+ID4gPiBEb24ndCBhbGxvdyByZXNl
cnZlZC1tZW1vcnkgcmVnaW9ucyB0byBiZSByZW1hcHBlZCBpbnRvIGFueSBndWVzdHMsCj4gPiA+
ID4gdW50aWwgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgYXJlIHByb3Blcmx5IHN1cHBvcnRlZCBp
biBYZW4uIEZvciBub3csCj4gPiA+ID4gZG8gbm90IGNhbGwgaW9tZW1fcGVybWl0X2FjY2VzcyBm
b3IgdGhlbS4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gCj4gPiA+ID4gQ2hh
bmdlcyBpbiB2NDoKPiA+ID4gPiAtIGNvbXBhcmUgdGhlIHBhcmVudCBuYW1lIHdpdGggcmVzZXJ2
ZWQtbWVtb3J5Cj4gPiA+ID4gLSB1c2UgZHRfbm9kZV9jbXAKPiA+ID4gPiAKPiA+ID4gPiBDaGFu
Z2VzIGluIHYzOgo+ID4gPiA+IC0gbmV3IHBhdGNoCj4gPiA+ID4gLS0tCj4gPiA+ID4gICB4ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAyNCArKysrKysrKysrKysrKysrLS0tLS0tLS0KPiA+
ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+
ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+ID4gPiBpbmRleCA0Yzg0MDQxNTVhLi4y
NjdlMDU0OWUyIDEwMDY0NAo+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
Ywo+ID4gPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ID4gPiA+IEBAIC0x
MTUzLDE3ICsxMTUzLDI1IEBAIHN0YXRpYyBpbnQgX19pbml0IG1hcF9yYW5nZV90b19kb21haW4o
Y29uc3QKPiA+ID4gPiBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldiwKPiA+ID4gPiAgICAgICBz
dHJ1Y3QgbWFwX3JhbmdlX2RhdGEgKm1yX2RhdGEgPSBkYXRhOwo+ID4gPiA+ICAgICAgIHN0cnVj
dCBkb21haW4gKmQgPSBtcl9kYXRhLT5kOwo+ID4gPiA+ICAgICAgIGJvb2wgbmVlZF9tYXBwaW5n
ID0gIWR0X2RldmljZV9mb3JfcGFzc3Rocm91Z2goZGV2KTsKPiA+ID4gPiArICAgIGNvbnN0IHN0
cnVjdCBkdF9kZXZpY2Vfbm9kZSAqcGFyZW50ID0gZHRfZ2V0X3BhcmVudChkZXYpOwo+ID4gPiA+
ICAgICAgIGludCByZXM7Cj4gPiA+ID4gCj4gPiA+ID4gLSAgICByZXMgPSBpb21lbV9wZXJtaXRf
YWNjZXNzKGQsIHBhZGRyX3RvX3BmbihhZGRyKSwKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFkZHJfdG9fcGZuKFBBR0VfQUxJR04oYWRkciArIGxlbiAtCj4gPiA+ID4g
MSkpKTsKPiA+ID4gPiAtICAgIGlmICggcmVzICkKPiA+ID4gPiArICAgIC8qCj4gPiA+ID4gKyAg
ICAgKiBEb24ndCBnaXZlIGlvbWVtIHBlcm1pc3Npb25zIGZvciByZXNlcnZlZC1tZW1vcnkgcmFu
Z2VzIHVudGlsCj4gPiA+ID4gKyAgICAgKiByZXNlcnZlZC1tZW1vcnkgc3VwcG9ydCBpcyBjb21w
bGV0ZS4KPiA+ID4gPiArICAgICAqLwo+ID4gPiA+ICsgICAgaWYgKCBkdF9ub2RlX2NtcChkdF9u
b2RlX25hbWUocGFyZW50KSwgInJlc2VydmVkLW1lbW9yeSIpID09IDAgKQo+ID4gPiBBbSBJIG1p
c3Npbmcgc29tZXRoaW5nLCBvciB5b3UgYXJlIHBlcm1pdHRpbmcgYWNjZXNzIG9ubHkgaWYgaXQg
ZnJvbSBhCj4gPiA+ICJyZXNlcnZlZC1tZW1vcnkiIG5vZGU/IFRoaXMgY29udHJhZGljdHMgd2l0
aCBwYXRjaCBkZXNjcmlwdGlvbi4KPiA+IAo+ID4gV2VsbCBzcG90dGVkISBJIGludmVydGVkIHRo
ZSBjb25kaXRpb24gYnkgbWlzdGFrZS4KPiA+IAo+ID4gCj4gPiA+ID4gICAgICAgewo+ID4gPiA+
IC0gICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJVbmFibGUgdG8gcGVybWl0IHRvIGRvbSVkIGFj
Y2VzcyB0byIKPiA+ID4gPiAtICAgICAgICAgICAgICAgIiAweCUiUFJJeDY0IiAtIDB4JSJQUkl4
NjQiXG4iLAo+ID4gPiA+IC0gICAgICAgICAgICAgICBkLT5kb21haW5faWQsCj4gPiA+ID4gLSAg
ICAgICAgICAgICAgIGFkZHIgJiBQQUdFX01BU0ssIFBBR0VfQUxJR04oYWRkciArIGxlbikgLSAx
KTsKPiA+ID4gPiAtICAgICAgICByZXR1cm4gcmVzOwo+ID4gPiA+ICsgICAgICAgIHJlcyA9IGlv
bWVtX3Blcm1pdF9hY2Nlc3MoZCwgcGFkZHJfdG9fcGZuKGFkZHIpLAo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJfdG9fcGZuKFBBR0VfQUxJR04oYWRkciAr
IGxlbiAtCj4gPiA+ID4gMSkpKTsKPiA+ID4gPiArICAgICAgICBpZiAoIHJlcyApCj4gPiA+ID4g
KyAgICAgICAgewo+ID4gPiA+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiVW5hYmxl
IHRvIHBlcm1pdCB0byBkb20lZCBhY2Nlc3MgdG8iCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAiIDB4JSJQUkl4NjQiIC0gMHglIlBSSXg2NCJcbiIsCj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICBkLT5kb21haW5faWQsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICBhZGRyICYgUEFH
RV9NQVNLLCBQQUdFX0FMSUdOKGFkZHIgKyBsZW4pIC0gMSk7Cj4gPiA+ID4gKyAgICAgICAgICAg
IHJldHVybiByZXM7Cj4gPiA+ID4gKyAgICAgICAgfQo+ID4gPiA+ICAgICAgIH0KPiA+ID4gPiAK
PiA+ID4gPiAgICAgICBpZiAoIG5lZWRfbWFwcGluZyApCj4gPiA+IFNvLCB0aGlzIHJlZ2lvbiBj
b2xkIGJlIG1hcHBlZCwgYnV0IHdpdGhvdXQgdGhlIGFjY2Vzcz8KPiAKPiBJT01FTSBhY2Nlc3Mg
YW5kIG1hcHBpbmcgYXJlIHR3byBkaWZmZXJlbnQgdGhpbmdzLiBUaGUgZm9ybWVyIGdpdmVzIGEg
ZG9tYWluCj4gY29udHJvbCBvdmVyIG1hbmFnaW5nIHRoZSByZWdpb24gKGkuZSBtYXBwaW5nLCB1
bm1hcHBpbmcsIGdpdmluZyBhY2Nlc3MgdG8KPiBhbm90aGVyIGRvbWFpbikuIFRoZSBsYXR0ZXIg
d2lsbCBtYXAgdGhlIHJlZ2lvbiBpbiB0aGUgUDJNIHNvIHRoZSBkb21haW4gY2FuCj4gcmVhZC93
cml0ZSBpbnRvIGl0Lgo+IAo+ID4gCj4gPiBJJ2xsIGNoYW5nZSBpdCB0byByZXR1cm4gZWFybHkg
ZnJvbSB0aGUgZnVuY3Rpb24gZm9yIHJlc2VydmVkLW1lbW9yeQo+ID4gcmVnaW9ucy4KPiAKPiBJ
IGFtIG5vdCBzdXJlIHRvIHVuZGVyc3RhbmQgeW91IHN1Z2dlc3Rpb24gaGVyZS4uLiBZb3Ugc3Rp
bGwgbmVlZCB0byBoYXZlCj4gcmVzZXJ2ZWQtcmVnaW9ucyBtYXBwZWQgaW50byB0aGUgaGFyZHdh
cmUgZG9tYWluLiBUaGUgb25seSB0aGluZyB3ZSB3YW50IHRvCj4gcHJldmVudCBpcyB0aGUgZG9t
YWluIHRvIG1hbmFnZSB0aGUgcmVnaW9uLgoKSSBmb3Jnb3QgdGhhdCBnaXZpbmcgaW9tZW0gcGVy
bWlzc2lvbiB0byBkb20wIGF1dG9tYXRpY2FsbHkgbWVhbnMgdGhhdAp0aGUgdG9vbHN0YWNrIGNh
biBnaXZlIGlvbWVtIHBlcm1pc3Npb24gdG8gYSBkb21VIGZvciB0aGUgc2FtZSByZWdpb24uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
