Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACD555C66
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 01:37:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfuy7-0004Me-9g; Tue, 25 Jun 2019 23:35:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qEdm=UY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfuy5-0004MZ-DU
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 23:35:17 +0000
X-Inumbo-ID: e28030ac-97a1-11e9-953e-0b1865271e59
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e28030ac-97a1-11e9-953e-0b1865271e59;
 Tue, 25 Jun 2019 23:35:16 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F48620645;
 Tue, 25 Jun 2019 23:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561505715;
 bh=jMyZlJOxIKoDa7LMpgC+WWjN0Sfy3TF8hMjhLLZJl7o=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Af9Nb9pSFpe8gKEXDNP+lZsfl0g3X8Yn8jviI2kNkfWyDzant6a4CFteblMfm6YGR
 rMGS+P4IENmGmPWFAOof/Hn0Z8ZUXybRQT8nITcUVNWnHDflw3rqheDKDZAWhbGEte
 wNvPgB2aWFTSkVEqIRGoMYdiMczi9XGAeIBMe2Ss=
Date: Tue, 25 Jun 2019 16:35:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-3-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906251627270.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-3-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 02/17] xen/arm64: head: Don't clobber x30/lr
 in the macro PRINT
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

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiAgVGhlIGN1cnJlbnQg
aW1wbGVtZW50YXRpb24gb2YgdGhlIG1hY3JvIFBSSU5UIHdpbGwgY2xvYmJlciB4MzAvbHIuIFRo
aXMKPiBtZWFucyB0aGUgdXNlciBzaG91bGQgc2F2ZSBsciBpZiBpdCBjYXJlcyBhYm91dCBpdC4K
CkJ5IHgzMC9sciwgZG8geW91IG1lYW4geDAteDMgYW5kIGxyPyBJIHdvdWxkIHByZWZlciBhIGNs
ZWFyZXIKZXhwcmVzc2lvbi4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiBGb2xsb3ctdXAgcGF0Y2hlcyB3aWxsIGludHJvZHVjZSBt
b3JlIHVzZSBvZiBQUklOVCBpbiBwbGFjZSB3aGVyZSBscgo+IHNob3VsZCBiZSBwcmVzZXJ2ZWQu
IFJhdGhlciB0aGFuIHJlcXVpcmluZyBhbGwgdGhlIHVzZXJzIHRvIHByZXNlcnZlIGxyLAo+IHRo
ZSBtYWNybyBQUklOVCBpcyBtb2RpZmllZCB0byBzYXZlIGFuZCByZXN0b3JlIGl0Lgo+IAo+IFdo
aWxlIHRoZSBjb21tZW50IHN0YXRlIHgzIHdpbGwgYmUgY2xvYmJlcmVkLCB0aGlzIGlzIG5vdCB0
aGUgY2FzZS4gU28KPiBQUklOVCB3aWxsIHVzZSB4MyB0byBwcmVzZXJ2ZSBsci4KPiAKPiBMYXN0
bHksIHRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIG1vdmUgdGhlIGNvbW1lbnQgb24gdG9wIG9mIFBS
SU5UIGFuZCB1c2UKPiBQUklOVCBpbiBpbml0X3VhcnQuIEJvdGggY2hhbmdlcyB3aWxsIGJlIGhl
bHBmdWwgaW4gYSBmb2xsb3ctdXAgcGF0Y2guCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2FybTY0L2hl
YWQuUyB8IDE0ICsrKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9o
ZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gaW5kZXggYzhiYmRmMDVhNi4uYTUx
NDdjOGQ4MCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gKysrIGIv
eGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IEBAIC03OCwxMiArNzgsMTcgQEAKPiAgICogIHgz
MCAtIGxyCj4gICAqLwo+ICAKPiAtLyogTWFjcm8gdG8gcHJpbnQgYSBzdHJpbmcgdG8gdGhlIFVB
UlQsIGlmIHRoZXJlIGlzIG9uZS4KPiAtICogQ2xvYmJlcnMgeDAteDMuICovCj4gICNpZmRlZiBD
T05GSUdfRUFSTFlfUFJJTlRLCj4gKy8qCj4gKyAqIE1hY3JvIHRvIHByaW50IGEgc3RyaW5nIHRv
IHRoZSBVQVJULCBpZiB0aGVyZSBpcyBvbmUuCj4gKyAqCj4gKyAqIENsb2JiZXJzIHgwIC0geDMK
PiArICovCj4gICNkZWZpbmUgUFJJTlQoX3MpICAgICAgICAgICBcCj4gKyAgICAgICAgbW92ICAg
eDMsIGxyICA7ICAgICBcCj4gICAgICAgICAgYWRyICAgeDAsIDk4ZiA7ICAgICBcCj4gICAgICAg
ICAgYmwgICAgcHV0cyAgICA7ICAgICBcCj4gKyAgICAgICAgbW92ICAgbHIsIHgzICA7ICAgICBc
Cj4gICAgICAgICAgUk9EQVRBX1NUUig5OCwgX3MpCj4gICNlbHNlIC8qIENPTkZJR19FQVJMWV9Q
UklOVEsgKi8KPiAgI2RlZmluZSBQUklOVChzKQo+IEBAIC02MzAsOSArNjM1LDggQEAgaW5pdF91
YXJ0Ogo+ICAjaWZkZWYgRUFSTFlfUFJJTlRLX0lOSVRfVUFSVAo+ICAgICAgICAgIGVhcmx5X3Vh
cnRfaW5pdCB4MjMsIDAKPiAgI2VuZGlmCj4gLSAgICAgICAgYWRyICAgeDAsIDFmCj4gLSAgICAg
ICAgYiAgICAgcHV0cwo+IC1ST0RBVEFfU1RSKDEsICItIFVBUlQgZW5hYmxlZCAtXHJcbiIpCj4g
KyAgICAgICAgUFJJTlQoIi0gVUFSVCBlbmFibGVkIC1cclxuIikKPiArICAgICAgICByZXQKPiAg
Cj4gIC8qIFByaW50IGVhcmx5IGRlYnVnIG1lc3NhZ2VzLgo+ICAgKiB4MDogTnVsLXRlcm1pbmF0
ZWQgc3RyaW5nIHRvIHByaW50Lgo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
