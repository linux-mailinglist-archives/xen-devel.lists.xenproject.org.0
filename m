Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25343DF42C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 19:27:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMbPT-00088Z-3O; Mon, 21 Oct 2019 17:23:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z72a=YO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iMbPR-00088U-EJ
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 17:23:57 +0000
X-Inumbo-ID: 8fca9d88-f427-11e9-9459-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fca9d88-f427-11e9-9459-12813bfff9fa;
 Mon, 21 Oct 2019 17:23:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD9192077C;
 Mon, 21 Oct 2019 17:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571678636;
 bh=y39P4aiiZYfPpJsSsGJjNDqxosDyj1aTi7OH0c88DDM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=gzeS4KMGpOWwkyQq3FATsx8WLZDV/RpfioZf+rzB/WJvWmIUCM4naUAXTAz0JzHL/
 mDaJtkA39Wj9V5C+P4yaoMcr8sly4whZFPqTlirZAJCFi7Dl+MQox45Tb0LEXI9Sk+
 1njWz2rt81IiWxSXDNu4dxrM6j0T3qCrr978NTNo=
Date: Mon, 21 Oct 2019 10:23:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <b126aaaf-eaee-ddee-cb9d-fa791f539913@arm.com>
Message-ID: <alpine.DEB.2.21.1910211014340.30080@sstabellini-ThinkPad-T480s>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-8-julien.grall@arm.com>
 <alpine.DEB.2.21.1910011358180.20899@sstabellini-ThinkPad-T480s>
 <b126aaaf-eaee-ddee-cb9d-fa791f539913@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 07/10] xen/arm: Allow insn.h to
 be called from assembly
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, andrii.anisov@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMSBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMTAvMS8xOSAxMDowMCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
VGh1LCAyNiBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBBIGZvbGxvdy11cCBw
YXRjaCB3aWxsIHJlcXVpcmUgdG8gaW5jbHVkZSBpbnNuLmggZnJvbSBhc3NlbWJseSBjb2RlLiBT
bwo+ID4gPiB3ZWUgbmVlZCB0byBwcm90ZWN0IGFueSBDLXNwZWNpZmljIGRlZmluaXRpb24gdG8g
YXZvaWQgY29tcGlsYXRpb24KPiA+ICAgIF4gd2UgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXiBkZWZpbml0aW9ucwo+ID4gCj4gPiA+IGVycm9yIHdoZW4gdXNlZCBpbiBhc3NlbWJseSBj
b2RlLgo+ID4gICAgXiBlcnJvcnMKPiA+IAo+ID4gCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+ID4gPiAtLS0KPiA+ID4gICB4
ZW4vaW5jbHVkZS9hc20tYXJtL2luc24uaCB8IDggKysrKysrKysKPiA+ID4gICAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvYXNtLWFybS9pbnNuLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2luc24uaAo+ID4gPiBpbmRl
eCAxOTI3NzIxMmUxLi4wMDM5MWY4M2Y5IDEwMDY0NAo+ID4gPiAtLS0gYS94ZW4vaW5jbHVkZS9h
c20tYXJtL2luc24uaAo+ID4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2luc24uaAo+ID4g
PiBAQCAtMSw4ICsxLDE0IEBACj4gPiA+ICAgI2lmbmRlZiBfX0FSQ0hfQVJNX0lOU04KPiA+ID4g
ICAjZGVmaW5lIF9fQVJDSF9BUk1fSU5TTgo+ID4gPiAgICsjaWZuZGVmIF9fQVNTRU1CTFlfXwo+
ID4gPiArCj4gPiA+ICAgI2luY2x1ZGUgPHhlbi90eXBlcy5oPgo+ID4gPiAgICsvKgo+ID4gPiAr
ICogQXQgdGhlIG1vbWVudCwgYXJjaC1zcGVjaWZpYyBoZWFkZXJzIGNvbnRhaW4gb25seSBkZWZp
bml0aW9uIGZvciBDCj4gPiA+ICsgKiBjb2RlLgo+ID4gPiArICovCj4gPiAKPiA+IFBsZWFzZSBy
ZW1vdmUgIkF0IHRoZSBtb21lbnQsICIgYmVjYXVzZSBpbi1jb2RlIGNvbW1lbnQgc2hvdWxkIGFs
d2F5cwo+ID4gcmVmbGVjdCB0aGUgbGF0ZXN0IHN0YXRlIG9mIHRoZSBjb2RlYmFzZS4KPiAKPiBX
ZWxsLCB3ZSBkbyBoYXZlIGEgbG90IG9mICJDdXJyZW50bHkiLyJBdCB0aGUgbW9tZW50Ii8iRm9y
IG5vdyIgaW4gdGhlIGNvZGUuCj4gU29tZSBvZiBteSBwYXRjaGVzIHdlbnQgaW4gcmVjZW50bHkg
d2l0aCBzdWNoIHdvcmRpbmcsIHNvIHdoeSB0aGlzIHBhcnRpY3VsYXIKPiBvbmUgaXMgYSBwcm9i
bGVtPwoKWWVhaCwgSSByZWFsaXplIHRoYXQgYSBsb3Qgb2Ygb3VyIGNvbnZlbnRpb25zIGFyZSBz
dGlsbCB0cmliYWwga25vd2xlZGdlCihpLmUuIG5vdCB3cml0dGVuIGRvd24gYW55d2hlcmUuKQoK
TGV0IG1lIGV4cGxhaW4gbXkgdGFrZSBvbiB0aGlzLiBXaGVuIG9uZSB3cml0ZXMgIkF0IHRoZQpt
b21lbnQiLyJDdXJyZW50bHkiLyJGb3Igbm93IiBoZS9zaGUgaW1wbGllcyB0aGF0IHRoZSBjb2Rl
IGlzIGp1c3QKdGVtcG9yYXJ5LCBvciBhdCBsZWFzdCBzdWItb3B0aW1hbCBhbmQgc29tZXRoaW5n
IHNob3VsZCBiZSBkb3duIGFib3V0Cml0IHRvIGltcHJvdmUuIE1heWJlIG5vdCBpbW1lZGlhdGVs
eSwgYnV0IGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZS4KCkkgdGhpbmsgaXQgaXMgT0sgdG8gd3Jp
dGUgc29tZXRoaW5nIGxpa2UgIkF0IHRoZSBtb21lbnQsIiB0byBleHByZXNzCnRoYXQgbWVhbmlu
Zy4gVGhhdCdzIE9LLgoKSW4gdGhpcyBzcGVjaWZpYyBjYXNlLCB0aGUgcmVhc29uIHdoeSBJIHdy
b3RlIHRoYXQgcmVwbHkgaXMgdGhhdCB3aGVuIEkKcmVhZCB0aGUgaW4tY29kZSBjb21tZW50LCBp
dCBqYXJyZWQgZm9yIGl0ICgiamFycmVkIiBhcyBpbiBzb21ldGhpbmcgd2FzCm9mZiwgb3V0IG9m
IHBsYWNlLikgQW5kIEkgdGhpbmsgdGhlIHJlYXNvbiBpcyB0aGF0IHRoZSBjb2RlIGxvb2tlZCBP
SywKYW5kIEkgZGlkbid0IGdldCB3aGF0IHlvdSB0aGluayB3ZSBzaG91bGQgImltcHJvdmUiIGlu
IHRoZSBjb2RlIGFmdGVyCnRoaXMgcGF0Y2ggaXMgYXBwbGllZC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
