Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653A033BD0
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 01:17:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXwAa-0002A4-GZ; Mon, 03 Jun 2019 23:15:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hXwAY-00029y-NF
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 23:15:10 +0000
X-Inumbo-ID: 6e086c74-8655-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6e086c74-8655-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 23:15:09 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5FCCA26431;
 Mon,  3 Jun 2019 23:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559603708;
 bh=Osv1IoNvkC+U786l3CN26H6aSA2ahpq80D3a+CJgEwA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tKHq6bKNYn3iCG0/krmBd94DIzD93Kdng67PjOvJYLZnqRqENq5dMaOvPayjMLznL
 sdSLphsGPbouu3dKg2/Wi9/ifi8cUx4y5dmpbWgVVVZKkb7T/AB02JzruY3byhwnUf
 E0boXifAlXz8b+q05PYhsAtD/wG4BG2QyfB48ahs=
Date: Mon, 3 Jun 2019 16:15:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-13-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906031615000.14041@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-13-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 12/19] xen/arm32: head:
 Always zero r3 before update a page-table entry
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
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBib290IGNvZGUg
aXMgdXNpbmcgcjIgYW5kIHIzIHRvIGhvbGQgdGhlIHBhZ2UtdGFibGUgZW50cnkgdmFsdWUuCj4g
V2hpbGUgcjIgaXMgYWx3YXlzIHVwZGF0ZWQgYmVmb3JlIHN0b3JpbmcgdGhlIHZhbHVlLCB0aGlz
IGlzIG5vdCBhbHdheXMKPiB0aGUgY2FzZSBmb3IgcjMuCj4gCj4gVGhhbmtmdWxseSB0b2RheSwg
cjMgd2lsbCBhbHdheXMgYmUgemVybyB3aGVuIHdlIGNhcmUuIEJ1dCB0aGlzIGlzCj4gZGlmZmlj
dWx0IHRvIHRyYWNrIGFuZCBlcnJvci1wcm9uZS4KPiAKPiBTbyBhbHdheXMgemVybyByMyB3aXRo
aW4gdGhlIGZldyBpbnN0cnVjdGlvbnMgYmVmb3JlIHRoZSB3cml0ZSB0aGUKPiBwYWdlLXRhYmxl
IGVudHJ5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+CgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgoKCj4gLS0tCj4gICAgIENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAtIFVzZSAweDAg
aW5zdGVhZCBvZiAwCj4gICAgICAgICAtIFJlbW92ZSBhIGR1cGxpY2F0ZSBtb3YgcjMsICMwCj4g
LS0tCj4gIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+IGluZGV4
IDM0NDg4MTdhYWIuLjE4ZGVkNDlhMDQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTMy
L2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiBAQCAtMjcwLDYgKzI3
MCw3IEBAIGNwdV9pbml0X2RvbmU6Cj4gICAgICAgICAgb3JyICAgcjIsIHIyLCAjUFRfVVBQRVIo
TUVNKSAvKiByMjpyMyA6PSBzZWN0aW9uIG1hcCAqLwo+ICAgICAgICAgIG9yciAgIHIyLCByMiwg
I1BUX0xPV0VSKE1FTSkKPiAgICAgICAgICBsc2wgICByMSwgcjEsICMzICAgICAgICAgICAgIC8q
IHIxIDo9IFNsb3Qgb2Zmc2V0ICovCj4gKyAgICAgICAgbW92ICAgcjMsICMweDAKPiAgICAgICAg
ICBzdHJkICByMiwgcjMsIFtyNCwgcjFdICAgICAgIC8qIE1hcHBpbmcgb2YgcGFkZHIoc3RhcnQp
ICovCj4gICAgICAgICAgbW92ICAgcjYsICMxICAgICAgICAgICAgICAgICAvKiByNiA6PSBpZGVu
dGl0eSBtYXAgbm93IGluIHBsYWNlICovCj4gIAo+IEBAIC0zNzIsMTEgKzM3MywxMSBAQCBwYWdp
bmc6Cj4gIAo+ICAgICAgICAgIC8qIEFkZCBVQVJUIHRvIHRoZSBmaXhtYXAgdGFibGUgKi8KPiAg
ICAgICAgICBsZHIgICByMSwgPXhlbl9maXhtYXAgICAgICAgIC8qIHIxIDo9IHZhZGRyICh4ZW5f
Zml4bWFwKSAqLwo+IC0gICAgICAgIG1vdiAgIHIzLCAjMAo+ICAgICAgICAgIGxzciAgIHIyLCBy
MTEsICNUSElSRF9TSElGVAo+ICAgICAgICAgIGxzbCAgIHIyLCByMiwgI1RISVJEX1NISUZUICAg
LyogNEsgYWxpZ25lZCBwYWRkciBvZiBVQVJUICovCj4gICAgICAgICAgb3JyICAgcjIsIHIyLCAj
UFRfVVBQRVIoREVWX0wzKQo+ICAgICAgICAgIG9yciAgIHIyLCByMiwgI1BUX0xPV0VSKERFVl9M
MykgLyogcjI6cjMgOj0gNEsgZGV2IG1hcCBpbmNsdWRpbmcgVUFSVCAqLwo+ICsgICAgICAgIG1v
diAgIHIzLCAjMHgwCj4gICAgICAgICAgc3RyZCAgcjIsIHIzLCBbcjEsICMoRklYTUFQX0NPTlNP
TEUqOCldIC8qIE1hcCBpdCBpbiB0aGUgZmlyc3QgZml4bWFwJ3Mgc2xvdCAqLwo+ICAxOgo+ICAK
PiBAQCAtMzg4LDYgKzM4OSw3IEBAIHBhZ2luZzoKPiAgICAgICAgICBvcnIgICByMiwgcjIsICNQ
VF9MT1dFUihQVCkgIC8qIHIyOnIzIDo9IHRhYmxlIG1hcCBvZiB4ZW5fZml4bWFwICovCj4gICAg
ICAgICAgbGRyICAgcjQsID1GSVhNQVBfQUREUigwKQo+ICAgICAgICAgIG1vdiAgIHI0LCByNCwg
bHNyICMoU0VDT05EX1NISUZUIC0gMykgICAvKiByNCA6PSBTbG90IGZvciBGSVhNQVAoMCkgKi8K
PiArICAgICAgICBtb3YgICByMywgIzB4MAo+ICAgICAgICAgIHN0cmQgIHIyLCByMywgW3IxLCBy
NF0gICAgICAgLyogTWFwIGl0IGluIHRoZSBmaXhtYXAncyBzbG90ICovCj4gIAo+ICAgICAgICAg
IC8qIFVzZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBhY2Nlc3MgdGhlIFVBUlQuICovCj4gLS0gCj4g
Mi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
