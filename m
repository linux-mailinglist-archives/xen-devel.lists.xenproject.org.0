Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B3E5735B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 23:11:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgF9c-0002KW-4l; Wed, 26 Jun 2019 21:08:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hgF9a-0002KR-8C
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 21:08:30 +0000
X-Inumbo-ID: 8b3474e2-9856-11e9-8a42-eb5fd5dfaa7c
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b3474e2-9856-11e9-8a42-eb5fd5dfaa7c;
 Wed, 26 Jun 2019 21:08:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 890CF2085A;
 Wed, 26 Jun 2019 21:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561583307;
 bh=cO40vgTFxRBPrTNDhg0Sn51yI0QvJClXgry2ISh9vKM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=XrSONPVICGes41/v/Rp8qc1ZNSCNsq3dkivFsBKyk+Gg48G7SXidLrujuJk8CBiO3
 gHSPIwX5HfGb4j9VBkJZDAlnmHowDBXm7Reu72t18J+kVF6Hx7wU2wpOuXKO0y15AG
 KJmowZ+kAs5cDh4xv+PpqKGr8uS07XUj3KnatbSU=
Date: Wed, 26 Jun 2019 14:08:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <7c8f54c5-29e1-8296-4dd5-401ef1406e2a@arm.com>
Message-ID: <alpine.DEB.2.21.1906261407150.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-18-julien.grall@arm.com>
 <alpine.DEB.2.21.1906261224240.5851@sstabellini-ThinkPad-T480s>
 <7c8f54c5-29e1-8296-4dd5-401ef1406e2a@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 17/17] xen/arm64: Zero BSS after the MMU and
 D-cache is turned on
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
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNiBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gNi8yNi8xOSA4OjI5IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBN
b24sIDEwIEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IEF0IHRoZSBtb21lbnQg
QlNTIGlzIHplcm9lZCBiZWZvcmUgdGhlIE1NVSBhbmQgRC1DYWNoZSBpcyB0dXJuZWQgb24uCj4g
PiA+IEluIG90aGVyIHdvcmRzLCB0aGUgY2FjaGUgd2lsbCBiZSBieXBhc3NlZCB3aGVuIHplcm9p
bmcgdGhlIEJTUyBzZWN0aW9uLgo+ID4gPiAKPiA+ID4gUGVyIHRoZSBJbWFnZSBwcm90b2NvbCBb
MV0sIHRoZSBzdGF0ZSBvZiB0aGUgY2FjaGUgZm9yIEJTUyByZWdpb24gaXMgbm90Cj4gPiA+IGtu
b3duIGJlY2F1c2UgaXQgaXMgbm90IHBhcnQgb2YgdGhlICJsb2FkZWQga2VybmVsIGltYWdlIi4K
PiA+ID4gCj4gPiA+IFRoaXMgbWVhbnMgdGhhdCB0aGUgY2FjaGUgd2lsbCBuZWVkIHRvIGJlIGlu
dmFsaWRhdGVkIHR3aWNlIGZvciB0aGUgQlNTCj4gPiA+IHJlZ2lvbjoKPiA+ID4gICAgICAxKSBC
ZWZvcmUgemVyb2luZyB0byByZW1vdmUgYW55IGRpcnR5IGNhY2hlIGxpbmUuIE90aGVyd2lzZSB0
aGV5IG1heQo+ID4gPiAgICAgIGdldCBldmljdGVkIHdoaWxlIHplcm9pbmcgYW5kIHRoZXJlZm9y
ZSBvdmVycmlkaW5nIHRoZSB2YWx1ZS4KPiA+ID4gICAgICAyKSBBZnRlciB6ZXJvaW5nIHRvIHJl
bW92ZSBhbnkgY2FjaGUgbGluZSB0aGF0IG1heSBoYXZlIGJlZW4KPiA+ID4gICAgICBzcGVjdWxh
dGVkLiBPdGhlcndpc2Ugd2hlbiB0dXJuaW5nIG9uIE1NVSBhbmQgRC1DYWNoZSwgdGhlIENQVSBt
YXkKPiA+ID4gICAgICBzZWUgb2xkIHZhbHVlcy4KPiA+ID4gCj4gPiA+IEhvd2V2ZXIsIHRoZSBv
bmx5IHJlYXNvbiB0byBoYXZlIHRoZSBCU1MgemVyb2VkIGVhcmx5IGlzIGJlY2F1c2UgdGhlCj4g
PiA+IGJvb3QgcGFnZSB0YWJsZXMgYXJlIHBhcnQgb2YgQlNTLiBUbyBhdm9pZCB0aGUgdHdvIGNh
Y2hlIGludmFsaWRhdGlvbnMsCj4gPiA+IGl0IGlzIHBvc3NpYmxlIHRvIG1vdmUgdGhlIHBhZ2Ug
dGFibGVzIGluIHRoZSBzZWN0aW9uIC5kYXRhLnBhZ2VfYWxpZ25lZC4KPiA+IAo+ID4gSSBhbSBu
b3QgZm9sbG93aW5nIHRoZSBsYXN0IHBhcnQuIEhvdyBpcyBtb3ZpbmcgdGhlIGJvb3QgcGFnZSB0
YWJsZXMgdG8KPiA+IC5kYXRhLnBhZ2VfYWxpZ25lZCBzb2x2aW5nIHRoZSBwcm9ibGVtPyBEbyB3
ZSBuZWVkIHRvIHplcm8KPiA+IC5kYXRhLnBhZ2VfYWxpZ25lZCBlYXJseSBvciBjYW4gd2Ugc2tp
cCBpdCBiZWNhdXNlIGl0IGlzIGd1YXJhbnRlZWQgdG8KPiA+IGFscmVhZHkgYmUgemVybz8KPiAK
PiBHbG9iYWwgdmFyaWFibGVzIGFyZSBpbml0aWFsaXplZCB0byB6ZXJvIGJ5IGRlZmF1bHQgcmVn
YXJkbGVzcyB0aGUgc2VjdGlvbgo+IHRoZXkgcmVzaWRlLiBVc3VhbGx5IHRoZXkgYXJlIHN0b3Jl
ZCBpbiBCU1MgYmVjYXVzZSBpdCBzYXZlcyBzcGFjZSBpbiB0aGUKPiBiaW5hcnkuCj4gCj4gV2l0
aCB0aGUgSW1hZ2UgcHJvdG9jb2wsIEJTUyBpcyBub3QgaW5pdGlhbGl6ZWQgYnkgdGhlIGJvb3Rs
b2FkZXIgc28gd2UgaGF2ZQo+IHRvIGRvIG91cnNlbGYuCj4gCj4gVGhlIHNlY3Rpb24gLmRhdGEu
cGFnZV9hbGlnbmVkIGlzIGFsd2F5cyBwYXJ0IG9mIHRoZSBiaW5hcnkuIFNvIHRoZSBjb21waWxl
cgo+IHdpbGwgd3JpdGUgemVybyBpbiB0aGUgYmluYXJ5IGZvciBhbnkgZ2xvYmFsIHZhcmlhYmxl
cyBwYXJ0IG9mIHRoYXQgc2VjdGlvbgo+IGFuZCB0aGVyZWZvcmUgdGhlIGNvcnJlc3BvbmRpbmcg
bWVtb3J5IHdpbGwgYmUgemVyb2VkIHdoZW4gbG9hZGluZyB0aGUgYmluYXJ5Lgo+IAo+IElmIGl0
IG1ha2VzIHNlbnNlLCBJIGNhbiB0cnkgdG8gaW5jb3Jwb3JhdGUgdGhhdCBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UuCgpTbyBiYXNpY2FsbHkgaXQgaXMgcmVhbGx5IG9ubHkgQlNTIHRoZSBwcm9ibGVt
LiBBbGwgcmlnaHQsIGxvb2tzIGdvb2QgdG8KbWUuCgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gPiA+IEEgbmV3IG1hY3JvIERFRklORV9C
T09UX1BBR0VfVEFCTEUgaXMgaW50cm9kdWNlZCB0byBjcmVhdGUgYW5kIG1hcmsKPiA+ID4gcGFn
ZS10YWJsZXMgdXNlZCBiZWZvcmUgQlNTIGlzIHplcm9lZC4gVGhpcyBpbmNsdWRlcyBhbGwgYm9v
dF8qIGJ1dCBhbHNvCj4gPiA+IHhlbl9maXhtYXAgYXMgemVyb19ic3MoKSB3aWxsIHByaW50IGEg
bWVzc2FnZSB3aGVuIGVhcmx5cHJpbnRrIGlzCj4gPiA+IGVuYWJsZWQuCj4gPiAKPiA+IE9uIGEg
c2ltaWxhciBub3RlLCBhbmQgY29udGludWluZyBmcm9tIHdoYXQgSSB3cm90ZSBhYm92ZSwgZG8g
d2UgbmVlZCB0bwo+ID4gbWFrZSBzdXJlIHRvIHplcm8gdGhlIHhlbl9maXhtYXAgYmVmb3JlIGhv
b2tpbmcgaXQgdXAgc2V0dXBfZml4bWFwPwo+IAo+IFNlZSBhYm92ZS4KPiAKPiBDaGVlcnMsCj4g
Cj4gLS0gCj4gSnVsaWVuIEdyYWxsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
