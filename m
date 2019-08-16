Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB2890B9C
	for <lists+xen-devel@lfdr.de>; Sat, 17 Aug 2019 02:00:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hym5G-0002Ru-EY; Fri, 16 Aug 2019 23:56:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bk2E=WM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hym5E-0002Rk-VN
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 23:56:36 +0000
X-Inumbo-ID: 7a83ad2c-c081-11e9-a661-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a83ad2c-c081-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 23:56:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6461020665;
 Fri, 16 Aug 2019 23:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565999794;
 bh=0x3kU4oaEKzi+/QGyZZh/K+rZNhfeEvZYHJz264ZTAs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=hQLzKavJnxGa2+c0t5wMhMvCdLoTAIex0JZsiEnWjke4ef2HZ+LKesaKnCV8XQ5qi
 CYBylK5JCWqI8jPAy3Bn/Kvd18/UCKyZQu5KJlSpgakhcw5i4i+tqu8MTxJscM0K2f
 0Jk35foSfbV6lN8o3/I8gqTwWg1A0AA0g6atXfo0=
Date: Fri, 16 Aug 2019 16:56:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <63b80e43-f07c-5db7-8aa8-bbf959cb2f3f@arm.com>
Message-ID: <alpine.DEB.2.21.1908161656240.20094@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908151634170.8737@sstabellini-ThinkPad-T480s>
 <20190815233618.31630-7-sstabellini@kernel.org>
 <63b80e43-f07c-5db7-8aa8-bbf959cb2f3f@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 7/8] xen/arm: don't iomem_permit_access
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr_Babchuk@epam.com, Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxNiBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDE2LzA4LzIwMTkg
MDA6MzYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IERvbid0IGFsbG93IHJlc2VydmVk
LW1lbW9yeSByZWdpb25zIHRvIGJlIHJlbWFwcGVkIGludG8gYW55IHVucHJpdmlsZWdlZAo+ID4g
Z3Vlc3RzLCB1bnRpbCByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyBhcmUgcHJvcGVybHkgc3VwcG9y
dGVkIGluIFhlbi4gRm9yCj4gPiBub3csIGRvIG5vdCBjYWxsIGlvbWVtX3Blcm1pdF9hY2Nlc3Mg
b24gdGhlbSwgYmVjYXVzZSBnaXZpbmcKPiA+IGlvbWVtX3Blcm1pdF9hY2Nlc3MgdG8gZG9tMCBt
ZWFucyB0aGF0IHRoZSB0b29sc3RhY2sgd2lsbCBiZSBhYmxlIHRvCj4gPiBhc3NpZ24gdGhlIHJl
Z2lvbiB0byBhIGRvbVUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiA+IC0tLQo+ID4gCj4gPiBDaGFuZ2VzIGluIHY2Ogo+
ID4gLSBjb21wYXJlIGFnYWluc3QgIi9yZXNlcnZlZC1tZW1vcnkvIgo+ID4gCj4gPiBDaGFuZ2Vz
IGluIHY1Ogo+ID4gLSBmaXggY2hlY2sgY29uZGl0aW9uCj4gPiAtIHVzZSBzdHJuaWNtcAo+ID4g
LSByZXR1cm4gZXJyb3IKPiA+IC0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQo+ID4gCj4gPiBDaGFu
Z2VzIGluIHY0Ogo+ID4gLSBjb21wYXJlIHRoZSBwYXJlbnQgbmFtZSB3aXRoIHJlc2VydmVkLW1l
bW9yeQo+ID4gLSB1c2UgZHRfbm9kZV9jbXAKPiA+IAo+ID4gQ2hhbmdlcyBpbiB2MzoKPiA+IC0g
bmV3IHBhdGNoCj4gPiAtLS0KPiA+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMjQg
KysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPiBpbmRleCA0
Yzg0MDQxNTVhLi42NzNmZmE0NTNmIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+IEBAIC0x
MTU1LDE1ICsxMTU1LDIzIEBAIHN0YXRpYyBpbnQgX19pbml0IG1hcF9yYW5nZV90b19kb21haW4o
Y29uc3Qgc3RydWN0Cj4gPiBkdF9kZXZpY2Vfbm9kZSAqZGV2LAo+ID4gICAgICAgYm9vbCBuZWVk
X21hcHBpbmcgPSAhZHRfZGV2aWNlX2Zvcl9wYXNzdGhyb3VnaChkZXYpOwo+ID4gICAgICAgaW50
IHJlczsKPiA+ICAgLSAgICByZXMgPSBpb21lbV9wZXJtaXRfYWNjZXNzKGQsIHBhZGRyX3RvX3Bm
bihhZGRyKSwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90b19wZm4o
UEFHRV9BTElHTihhZGRyICsgbGVuIC0gMSkpKTsKPiA+IC0gICAgaWYgKCByZXMgKQo+ID4gKyAg
ICAvKgo+ID4gKyAgICAgKiBEb24ndCBnaXZlIGlvbWVtIHBlcm1pc3Npb25zIGZvciByZXNlcnZl
ZC1tZW1vcnkgcmFuZ2VzIHRvIGRvbVVzCj4gCj4gSW4gdXBzdHJlYW0gWGVuLCB0aGlzIGlzIG9u
bHkgY2FsbGVkIGZvciBEb20wLiBTbyB3aGF0IGFyZSB5b3UgcmVmZXJyaW5nIHRvPwo+IAo+ID4g
KyAgICAgKiB1bnRpbCByZXNlcnZlZC1tZW1vcnkgc3VwcG9ydCBpcyBjb21wbGV0ZS4KPiAKPiBC
dXQgYXMgSSBwb2ludGVkIG91dCBiZWZvcmUgcmVzZXJ2ZWQtbWVtb3J5IHN1cHBvcnQgaXMgbm90
IGdvaW5nIHRvIGhhcHBlbiB2aWEKPiBpb21lbS4gVGhpcyBpcyBhbiBhYnVzZSBvZiB0aGUgaW50
ZXJmYWNlLgo+IAo+ID4gKyAgICAgKi8KPiAKPiBBIGJldHRlciBjb21tZW50IHdvdWxkIGJlOgo+
IAo+ICJyZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyBhcmUgUkFNIGNhcnZlZCBvdXQgZm9yIHNwZWNp
YWwgcHVycG9zZS4gVGhleSBhcmUgbm90Cj4gTU1JTyBhbmQgdGhlcmVmb3JlIGEgZG9tYWluIHNo
b3VsZCBub3QgYmUgYWJsZSB0byBtYW5hZ2UgdGhlbSB2aWEgdGhlIElPTUVNCj4gaW50ZXJmYWNl
Ii4KClRoYW5rIHlvdSBmb3IgcHJvdmlkaW5nIHRoZSBjb21tZW50LiBJJ2xsIHVzZSB5b3VyIHZl
cnNpb24uCgoKPiA+ICsgICAgaWYgKCBzdHJuaWNtcChkdF9ub2RlX2Z1bGxfbmFtZShkZXYpLCAi
L3Jlc2VydmVkLW1lbW9yeS8iLAo+ID4gKyAgICAgICAgIHN0cmxlbigiL3Jlc2VydmVkLW1lbW9y
eS8iKSkgIT0gMCApCj4gPiAgICAgICB7Cj4gPiAtICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAi
VW5hYmxlIHRvIHBlcm1pdCB0byBkb20lZCBhY2Nlc3MgdG8iCj4gPiAtICAgICAgICAgICAgICAg
IiAweCUiUFJJeDY0IiAtIDB4JSJQUkl4NjQiXG4iLAo+ID4gLSAgICAgICAgICAgICAgIGQtPmRv
bWFpbl9pZCwKPiA+IC0gICAgICAgICAgICAgICBhZGRyICYgUEFHRV9NQVNLLCBQQUdFX0FMSUdO
KGFkZHIgKyBsZW4pIC0gMSk7Cj4gPiAtICAgICAgICByZXR1cm4gcmVzOwo+ID4gKyAgICAgICAg
cmVzID0gaW9tZW1fcGVybWl0X2FjY2VzcyhkLCBwYWRkcl90b19wZm4oYWRkciksCj4gPiArICAg
ICAgICAgICAgICAgIHBhZGRyX3RvX3BmbihQQUdFX0FMSUdOKGFkZHIgKyBsZW4gLSAxKSkpOwo+
ID4gKyAgICAgICAgaWYgKCByZXMgKQo+ID4gKyAgICAgICAgewo+ID4gKyAgICAgICAgICAgIHBy
aW50ayhYRU5MT0dfRVJSICJVbmFibGUgdG8gcGVybWl0IHRvIGRvbSVkIGFjY2VzcyB0byIKPiA+
ICsgICAgICAgICAgICAgICAgICAgICIgMHglIlBSSXg2NCIgLSAweCUiUFJJeDY0IlxuIiwKPiA+
ICsgICAgICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgIGFkZHIgJiBQQUdFX01BU0ssIFBBR0VfQUxJR04oYWRkciArIGxlbikgLSAxKTsKPiA+ICsg
ICAgICAgICAgICByZXR1cm4gcmVzOwo+ID4gKyAgICAgICAgfQo+ID4gICAgICAgfQo+ID4gICAg
ICAgICBpZiAoIG5lZWRfbWFwcGluZyApCj4gPiAKPiAKPiBDaGVlcnMsCj4gCj4gLS0gCj4gSnVs
aWVuIEdyYWxsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
