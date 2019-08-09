Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901C48865A
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2019 00:59:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwDo5-00072B-Kd; Fri, 09 Aug 2019 22:56:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gc9A=WF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hwDo4-000723-IE
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 22:56:20 +0000
X-Inumbo-ID: e62d2e56-baf8-11e9-9acd-cbb15a2511a2
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e62d2e56-baf8-11e9-9acd-cbb15a2511a2;
 Fri, 09 Aug 2019 22:56:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F41320B7C;
 Fri,  9 Aug 2019 22:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565391378;
 bh=4NP5jANKWFdhQPoxR5FVBQMUypbV/ygbxLghju13RoU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=zoNNeMCArgkg6vDtb7DhJ9khByEZpkoGCBEqIa3YGIL7eNQp5NnywafN1/+ts9Px6
 T3R0SBer8chRaBN1iKkzpFLOgy3xbrSq0GIqCnxaj3qGMh718e9AnPZ5eYJADnujrO
 PVT0AjIFABFPb4rIQMYq6sfXuHPoqp2lM9HuBUAk=
Date: Fri, 9 Aug 2019 15:56:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <87pnlfh3dc.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1908091524160.7788@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-6-sstabellini@kernel.org> <87pnlfh3dc.fsf@epam.com>
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
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA4IEF1ZyAyMDE5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBIaSBTdGVmYW5v
LAo+IAo+IFN0ZWZhbm8gU3RhYmVsbGluaSB3cml0ZXM6Cj4gCj4gPiBEb24ndCBhbGxvdyByZXNl
cnZlZC1tZW1vcnkgcmVnaW9ucyB0byBiZSByZW1hcHBlZCBpbnRvIGFueSBndWVzdHMsCj4gPiB1
bnRpbCByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyBhcmUgcHJvcGVybHkgc3VwcG9ydGVkIGluIFhl
bi4gRm9yIG5vdywKPiA+IGRvIG5vdCBjYWxsIGlvbWVtX3Blcm1pdF9hY2Nlc3MgZm9yIHRoZW0u
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxp
bnguY29tPgo+ID4gLS0tCj4gPgo+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+IC0gY29tcGFyZSB0aGUg
cGFyZW50IG5hbWUgd2l0aCByZXNlcnZlZC1tZW1vcnkKPiA+IC0gdXNlIGR0X25vZGVfY21wCj4g
Pgo+ID4gQ2hhbmdlcyBpbiB2MzoKPiA+IC0gbmV3IHBhdGNoCj4gPiAtLS0KPiA+ICB4ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMgfCAyNCArKysrKysrKysrKysrKysrLS0tLS0tLS0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jCj4gPiBpbmRleCA0Yzg0MDQxNTVhLi4yNjdlMDU0OWUyIDEwMDY0NAo+ID4g
LS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPiArKysgYi94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMKPiA+IEBAIC0xMTUzLDE3ICsxMTUzLDI1IEBAIHN0YXRpYyBpbnQgX19p
bml0IG1hcF9yYW5nZV90b19kb21haW4oY29uc3Qgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYs
Cj4gPiAgICAgIHN0cnVjdCBtYXBfcmFuZ2VfZGF0YSAqbXJfZGF0YSA9IGRhdGE7Cj4gPiAgICAg
IHN0cnVjdCBkb21haW4gKmQgPSBtcl9kYXRhLT5kOwo+ID4gICAgICBib29sIG5lZWRfbWFwcGlu
ZyA9ICFkdF9kZXZpY2VfZm9yX3Bhc3N0aHJvdWdoKGRldik7Cj4gPiArICAgIGNvbnN0IHN0cnVj
dCBkdF9kZXZpY2Vfbm9kZSAqcGFyZW50ID0gZHRfZ2V0X3BhcmVudChkZXYpOwo+ID4gICAgICBp
bnQgcmVzOwo+ID4KPiA+IC0gICAgcmVzID0gaW9tZW1fcGVybWl0X2FjY2VzcyhkLCBwYWRkcl90
b19wZm4oYWRkciksCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJfdG9f
cGZuKFBBR0VfQUxJR04oYWRkciArIGxlbiAtIDEpKSk7Cj4gPiAtICAgIGlmICggcmVzICkKPiA+
ICsgICAgLyoKPiA+ICsgICAgICogRG9uJ3QgZ2l2ZSBpb21lbSBwZXJtaXNzaW9ucyBmb3IgcmVz
ZXJ2ZWQtbWVtb3J5IHJhbmdlcyB1bnRpbAo+ID4gKyAgICAgKiByZXNlcnZlZC1tZW1vcnkgc3Vw
cG9ydCBpcyBjb21wbGV0ZS4KPiA+ICsgICAgICovCj4gPiArICAgIGlmICggZHRfbm9kZV9jbXAo
ZHRfbm9kZV9uYW1lKHBhcmVudCksICJyZXNlcnZlZC1tZW1vcnkiKSA9PSAwICkKPiBBbSBJIG1p
c3Npbmcgc29tZXRoaW5nLCBvciB5b3UgYXJlIHBlcm1pdHRpbmcgYWNjZXNzIG9ubHkgaWYgaXQg
ZnJvbSBhCj4gInJlc2VydmVkLW1lbW9yeSIgbm9kZT8gVGhpcyBjb250cmFkaWN0cyB3aXRoIHBh
dGNoIGRlc2NyaXB0aW9uLgoKV2VsbCBzcG90dGVkISBJIGludmVydGVkIHRoZSBjb25kaXRpb24g
YnkgbWlzdGFrZS4KCgo+ID4gICAgICB7Cj4gPiAtICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAi
VW5hYmxlIHRvIHBlcm1pdCB0byBkb20lZCBhY2Nlc3MgdG8iCj4gPiAtICAgICAgICAgICAgICAg
IiAweCUiUFJJeDY0IiAtIDB4JSJQUkl4NjQiXG4iLAo+ID4gLSAgICAgICAgICAgICAgIGQtPmRv
bWFpbl9pZCwKPiA+IC0gICAgICAgICAgICAgICBhZGRyICYgUEFHRV9NQVNLLCBQQUdFX0FMSUdO
KGFkZHIgKyBsZW4pIC0gMSk7Cj4gPiAtICAgICAgICByZXR1cm4gcmVzOwo+ID4gKyAgICAgICAg
cmVzID0gaW9tZW1fcGVybWl0X2FjY2VzcyhkLCBwYWRkcl90b19wZm4oYWRkciksCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3RvX3BmbihQQUdFX0FMSUdOKGFk
ZHIgKyBsZW4gLSAxKSkpOwo+ID4gKyAgICAgICAgaWYgKCByZXMgKQo+ID4gKyAgICAgICAgewo+
ID4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJVbmFibGUgdG8gcGVybWl0IHRvIGRv
bSVkIGFjY2VzcyB0byIKPiA+ICsgICAgICAgICAgICAgICAgICAgIiAweCUiUFJJeDY0IiAtIDB4
JSJQUkl4NjQiXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICBkLT5kb21haW5faWQsCj4gPiAr
ICAgICAgICAgICAgICAgICAgIGFkZHIgJiBQQUdFX01BU0ssIFBBR0VfQUxJR04oYWRkciArIGxl
bikgLSAxKTsKPiA+ICsgICAgICAgICAgICByZXR1cm4gcmVzOwo+ID4gKyAgICAgICAgfQo+ID4g
ICAgICB9Cj4gPgo+ID4gICAgICBpZiAoIG5lZWRfbWFwcGluZyApCj4gU28sIHRoaXMgcmVnaW9u
IGNvbGQgYmUgbWFwcGVkLCBidXQgd2l0aG91dCB0aGUgYWNjZXNzPwoKSSdsbCBjaGFuZ2UgaXQg
dG8gcmV0dXJuIGVhcmx5IGZyb20gdGhlIGZ1bmN0aW9uIGZvciByZXNlcnZlZC1tZW1vcnkKcmVn
aW9ucy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
