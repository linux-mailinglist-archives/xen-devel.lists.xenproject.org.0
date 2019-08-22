Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C1499AC5
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 19:17:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0qgY-0001tQ-V1; Thu, 22 Aug 2019 17:15:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gXwC=WS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i0qgX-0001tK-KB
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 17:15:41 +0000
X-Inumbo-ID: 7761da8d-c500-11e9-addb-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7761da8d-c500-11e9-addb-12813bfff9fa;
 Thu, 22 Aug 2019 17:15:41 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 542EF23402;
 Thu, 22 Aug 2019 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566494140;
 bh=pAuGrP2ixeCzrvTAU6CT3lAShdtkTcIKiZQmcLoaUkY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=LjuHwfh85e4/HjDF9CMwWAU905SjHlw0dhlkurcA1hMHuK9v2DAHsIvgRumES7elj
 2XDMnkkuklDQhAuMlTxSaXUbcJQ1NC3uFXmLEvtbIjfUcaAitTXywClklYPmjZC31P
 4uOTdoHAcEZwZUe2yoNwyYPBDvVQPOM19ksV3yfw=
Date: Thu, 22 Aug 2019 10:15:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190812173019.11956-24-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1908221015310.22783@sstabellini-ThinkPad-T480s>
References: <20190812173019.11956-1-julien.grall@arm.com>
 <20190812173019.11956-24-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 23/28] xen/arm32: head: Setup HTTBR in
 enable_mmu() and add missing isb
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMiBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IEhUVEJSIGlzIHNldHVwIGluIGNyZWF0ZV9wYWdlX3RhYmxlcygpLiBUaGlzIGlzIGZpbmUgYXMK
PiBpdCBpcyBjYWxsZWQgYnkgZXZlcnkgQ1BVcy4KPiAKPiBIb3dldmVyLCBzdWNoIGFzc3VtcHRp
b24gbWF5IG5vdCBob2xkIGluIHRoZSBmdXR1cmUuIFRvIG1ha2UgY2hhbmdlCj4gZWFzaWVyLCB0
aGUgSFRUQlIgaXMgbm90IHNldHVwIGluIGVuYWJsZV9tbXUoKS4KPiAKPiBUYWtlIHRoZSBvcHBv
cnR1bml0eSB0byBhZGQgdGhlIG1pc3NpbmcgaXNiKCkgdG8gZW5zdXJlIHRoZSBIVFRCUiBpcwo+
IHNlZW4gYmVmb3JlIHRoZSBNTVUgaXMgdHVybmVkIG9uLgo+IAo+IExhc3RseSwgdGhlIG9ubHkg
dXNlIG9mIHI1IGluIGNyZWF0ZV9wYWdlX3RhYmxlcygpIGlzIG5vdyByZW1vdmVkLiBTbwo+IHRo
ZSByZWdpc3RlciBjYW4gYmUgcmVtb3ZlZCBmcm9tIHRoZSBjbG9iYmVyIGxpc3Qgb2YgdGhlIGZ1
bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+CgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgoKCj4gLS0tCj4gICAgIENoYW5nZXMgaW4gdjM6Cj4gICAgICAgICAtIE1vdmUgdGhl
IGNvbW1lbnQgaW4gdGhlIGNvcnJlY3QgcGxhY2UKPiAgICAgICAgIC0gcjUgaXMgbm90IGNsb2Jl
cnJlZCBhbnltb3JlCj4gCj4gICAgIENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAtIFBhdGNoIGFk
ZGVkCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCAxMiArKysrKysrKy0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0z
Mi9oZWFkLlMKPiBpbmRleCAzYzE4MDM3NTc1Li4yMzE3ZmI4ODU1IDEwMDY0NAo+IC0tLSBhL3hl
bi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5T
Cj4gQEAgLTM1OSw3ICszNTksNyBAQCBFTkRQUk9DKGNwdV9pbml0KQo+ICAgKiAgIHI5IDogcGFk
ZHIoc3RhcnQpCj4gICAqICAgcjEwOiBwaHlzIG9mZnNldAo+ICAgKgo+IC0gKiBDbG9iYmVycyBy
MCAtIHI2Cj4gKyAqIENsb2JiZXJzIHIwIC0gcjQsIHI2Cj4gICAqCj4gICAqIFJlZ2lzdGVyIHVz
YWdlIHdpdGhpbiB0aGlzIGZ1bmN0aW9uOgo+ICAgKiAgIHI2IDogSWRlbnRpdHkgbWFwIGluIHBs
YWNlCj4gQEAgLTM3NCwxMSArMzc0LDggQEAgY3JlYXRlX3BhZ2VfdGFibGVzOgo+ICAgICAgICAg
IG1vdmVxIHI2LCAjMSAgICAgICAgICAgICAgICAgLyogcjYgOj0gaWRlbnRpdHkgbWFwIG5vdyBp
biBwbGFjZSAqLwo+ICAgICAgICAgIG1vdm5lIHI2LCAjMCAgICAgICAgICAgICAgICAgLyogcjYg
Oj0gaWRlbnRpdHkgbWFwIG5vdCB5ZXQgaW4gcGxhY2UgKi8KPiAgCj4gLSAgICAgICAgLyogV3Jp
dGUgWGVuJ3MgUFQncyBwYWRkciBpbnRvIHRoZSBIVFRCUiAqLwo+ICAgICAgICAgIGxkciAgIHI0
LCA9Ym9vdF9wZ3RhYmxlCj4gICAgICAgICAgYWRkICAgcjQsIHI0LCByMTAgICAgICAgICAgICAv
KiByNCA6PSBwYWRkciAoYm9vdF9wYWdldGFibGUpICovCj4gLSAgICAgICAgbW92ICAgcjUsICMw
ICAgICAgICAgICAgICAgICAvKiByNDpyNSBpcyBwYWRkciAoYm9vdF9wYWdldGFibGUpICovCj4g
LSAgICAgICAgbWNyciAgQ1A2NChyNCwgcjUsIEhUVEJSKQo+ICAKPiAgICAgICAgICAvKiBTZXR1
cCBib290X3BndGFibGU6ICovCj4gICAgICAgICAgbGRyICAgcjEsID1ib290X3NlY29uZAo+IEBA
IC00ODQsNiArNDgxLDEzIEBAIGVuYWJsZV9tbXU6Cj4gICAgICAgICAgbWNyICAgQ1AzMihyMCwg
VExCSUFMTEgpICAgICAvKiBGbHVzaCBoeXBlcnZpc29yIFRMQnMgKi8KPiAgICAgICAgICBkc2Ig
ICBuc2gKPiAgCj4gKyAgICAgICAgLyogV3JpdGUgWGVuJ3MgUFQncyBwYWRkciBpbnRvIHRoZSBI
VFRCUiAqLwo+ICsgICAgICAgIGxkciAgIHIwLCA9Ym9vdF9wZ3RhYmxlCj4gKyAgICAgICAgYWRk
ICAgcjAsIHIwLCByMTAgICAgICAgICAgICAvKiByMCA6PSBwYWRkciAoYm9vdF9wYWdldGFibGUp
ICovCj4gKyAgICAgICAgbW92ICAgcjEsICMwICAgICAgICAgICAgICAgICAvKiByMDpyMSBpcyBw
YWRkciAoYm9vdF9wYWdldGFibGUpICovCj4gKyAgICAgICAgbWNyciAgQ1A2NChyMCwgcjEsIEhU
VEJSKQo+ICsgICAgICAgIGlzYgo+ICsKPiAgICAgICAgICBtcmMgICBDUDMyKHIwLCBIU0NUTFIp
Cj4gICAgICAgICAgLyogRW5hYmxlIE1NVSBhbmQgRC1jYWNoZSAqLwo+ICAgICAgICAgIG9yciAg
IHIwLCByMCwgIyhTQ1RMUl9BeHhfRUx4X018U0NUTFJfQXh4X0VMeF9DKQo+IC0tIAo+IDIuMTEu
MAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
