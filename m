Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C45244FB5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 00:58:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbYd0-0006Mn-Mt; Thu, 13 Jun 2019 22:55:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fP4x=UM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hbYcy-0006Mi-W0
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 22:55:29 +0000
X-Inumbo-ID: 559491c7-8e2e-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 559491c7-8e2e-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 22:55:27 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1211F2147A;
 Thu, 13 Jun 2019 22:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560466526;
 bh=/5bQFJj8+RiQwApPR2Utu4Uta0rqtdvhX1StVvxVdwU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=WkBIa6fdGD9Fvc2xzPsk/+WmzEaukzuMfedkr+wMjVKpryPTt+b0YLpMJqQ8tszIl
 ffmrZvEwFi68Icq6gwGVU4JWgKvVsueDHPNGW9LKOMitpOgPpOitY+cjVo4hYeuAzJ
 1MgE6oEDyYFOuqTf8G+ESLa5evDMKOZDbaAKJKx8=
Date: Thu, 13 Jun 2019 15:55:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <7aaa0b13-9960-7204-dcd1-78e08964fc5b@arm.com>
Message-ID: <alpine.DEB.2.21.1906131554570.2072@sstabellini-ThinkPad-T480s>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-12-julien.grall@arm.com>
 <alpine.DEB.2.21.1906121528260.13737@sstabellini-ThinkPad-T480s>
 <a7874b6c-08b4-28a0-cb5f-ea7f7b23e2e7@arm.com>
 <alpine.DEB.2.21.1906131140290.13737@sstabellini-ThinkPad-T480s>
 <7aaa0b13-9960-7204-dcd1-78e08964fc5b@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 11/12] xen/arm: mm: Don't
 open-code Xen PT update in {set, clear}_fixmap()
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
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxMyBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMTMvMDYvMjAxOSAxOTo1MSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
VGh1LCAxMyBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4+IE9uIDYvMTIvMTkgMTE6
MzMgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+Pj4gT24gVHVlLCAxNCBNYXkgMjAx
OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gSSB0aGluayB0aGUgYmFzaWMgcHJpbmNpcGxlIGlz
IHRoYXQgd2l0aCBCVUdfT04gaXMgImVhc3kiIGZvciBhIGd1ZXN0IHRvCj4gPiBiZSBhYmxlIHRv
IHRyaWdnZXIgaXQsIHBvdGVudGlhbGx5IGNhdXNpbmcgYSBET1MuIFdpdGhvdXQgdGhlIEJVR19P
TiwKPiA+IHRoZSBndWVzdCBpcyB1bmxpa2VseSB0byBiZSBhYmxlIHRvIHRyaWdnZXIgYSBjcmFz
aC4gSG93ZXZlciwgaWYgYWxsIHRoZQo+ID4gY2FsbHMgaGFwcGVuIGR1cmluZyBib290IGluIHJl
Z2FyZHMgdG8gb3BlcmF0aW9ucyB0aGF0IGhhdmUgbm90aGluZyB0bwo+ID4gZG8gd2l0aCBndWVz
dHMgYmVoYXZpb3IsIHRoZW4gaXQgaXMgZmluZS4KPiAKPiBTYWRseSwgd2UgZG9uJ3Qgc2VlbSB0
byBoYXZlIHVzZWQgdGhhdCBhcHByb2FjaCBvbiBBcm0gc28gZmFyLiBXZSBoYXZlIAo+IHF1aXRl
IGEgZmV3IEJVR19PTigpIHRoYXQgY291bGQgYmUgdHJpZ2dlcmVkIGJ5IHRoZSBndWVzdC4gRm9y
IGluc3RhbmNlLCAKPiB3ZSB1c2VkIGl0IHRvIGNvbmZpcm0gdGhhdCB3ZSBpbnRlcnByZXRlZCBj
b3JyZWN0bHkgdGhlIHNwZWMuLi4gKHNlZSAKPiBHVUVTVF9CVUdfT04pLiBUaGUgcmF0aW9uYWxl
IHdhcyB0aGF0IGEgRE9TIGlzIGJldHRlciB0aGFuIGRhdGEgbGVhay4KPiAKPiBJIGhhdmUgYSBz
ZXJpZXMgdG8gdHJ5IHRvIHJlZHVjZSBzdWNoIEJVR19PTi4KCkdvb2QhCgoKPiA+IAo+ID4gSSBj
aGVja2VkIGFsbCB0aGUgY2FsbCBzaXRlcyBhbmQgSSBhZ3JlZSB0aGF0IGluIHRoaXMgY2FzZSB0
aGV5IGFyZSBhbGwKPiA+IGRvbmUgZHVyaW5nIGJvb3Qgb25seS4gU28gaW4gdGhpcyBjYXNlIGl0
IGlzIE9LIHRvIGhhdmUgdGhlCj4gPiBwYW5pYy9CVUdfT04uCj4gCj4gQ2FuIEkgY29uc2lkZXIg
dGhpcyBhcyBhbiBhY2tlZC1ieS9yZXZpZXdlZC1ieT8KClllcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
