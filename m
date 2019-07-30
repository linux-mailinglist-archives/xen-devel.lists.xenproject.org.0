Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 620317B4DB
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 23:14:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsZPS-0000KQ-EW; Tue, 30 Jul 2019 21:11:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsZPR-0000KI-8y
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 21:11:49 +0000
X-Inumbo-ID: a43045e8-b30e-11e9-a763-9b0003dc1270
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a43045e8-b30e-11e9-a763-9b0003dc1270;
 Tue, 30 Jul 2019 21:11:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B26C2067D;
 Tue, 30 Jul 2019 21:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564521107;
 bh=l8a+KQoxWPyw4F77ri73xAuTRInHDyhpgMraeNDmpm0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Nh8s8yOD7khZDXSUySAniqRtQuAimVMuq0obNG1nKU7X+gfjOTxrHxheXAkeY2doP
 6c7joexz2uGRdFWVpSQwhTJqAQepK0JqV7KDmfiW8FGTMZsofvEKMH7wrdK3rXcY6j
 Ap7oJzVlNSnA9AHuil3P5SBoIfy5NZlhC+jqX3dc=
Date: Tue, 30 Jul 2019 14:11:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-20-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301327070.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-20-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 19/35] xen/arm32: head: Add a macro to
 move an immediate constant into a 32-bit register
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

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBjdXJyZW50IGJv
b3QgY29kZSBpcyB1c2luZyB0aGUgcGF0dGVybiBsZHIgclgsID0uLi4gdG8gbW92ZSBhbgo+IGlt
bWVkaWF0ZSBjb25zdGFudCBpbnRvIGEgMzItYml0IHJlZ2lzdGVyLgo+IAo+IFRoaXMgcGF0dGVy
biBpbXBsaWVzIHRvIGxvYWQgdGhlIGltbWVkaWF0ZSBjb25zdGFudCBmcm9tIGEgbGl0ZXJhbCBw
b29sLAo+IG1lYW5pbmcgYSBtZW1vcnkgYWNjZXNzIHdpbGwgYmUgcGVyZm9ybWVkLgo+IAo+IFRo
ZSBtZW1vcnkgYWNjZXNzIGNhbiBiZSBhdm9pZGVkIGJ5IHVzaW5nIG1vdncvbW92dCBpbnN0cnVj
dGlvbnMuCj4gCj4gQSBuZXcgbWFjcm8gaXMgaW50cm9kdWNlZCB0byBtb3ZlIGFuIGltbWVkaWF0
ZSBjb25zdGFudCBpbnRvIGEgMzItYml0Cj4gcmVnaXN0ZXIgd2l0aG91dCBhIG1lbW9yeSBsb2Fk
LiBGb2xsb3ctdXAgcGF0Y2hlcyB3aWxsIG1ha2UgdXNlIG9mIGl0Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpUaGF0J3MgaW50ZXJlc3Rp
bmchCgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PgoKCj4gLS0tCj4gICAgIENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAtIFBhdGNoIGFkZGVkCj4g
LS0tCj4gIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9h
cm0zMi9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4gaW5kZXggMThkZWQ0OWEw
NC4uOTlmNGFmMThkOCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4g
KysrIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+IEBAIC0zNyw2ICszNywxNSBAQAo+ICAj
ZW5kaWYKPiAgCj4gIC8qCj4gKyAqIE1vdmUgYW4gaW1tZWRpYXRlIGNvbnN0YW50IGludG8gYSAz
Mi1iaXQgcmVnaXN0ZXIgdXNpbmcgbW92dy9tb3Z0Cj4gKyAqIGluc3RydWN0aW9ucy4KPiArICov
Cj4gKy5tYWNybyBtb3ZfdyByZWcsIHdvcmQKPiArICAgICAgICBtb3Z3ICBccmVnLCAjOmxvd2Vy
MTY6XHdvcmQKPiArICAgICAgICBtb3Z0ICBccmVnLCAjOnVwcGVyMTY6XHdvcmQKPiArLmVuZG0K
PiArCj4gKy8qCj4gICAqIENvbW1vbiByZWdpc3RlciB1c2FnZSBpbiB0aGlzIGZpbGU6Cj4gICAq
ICAgcjAgIC0KPiAgICogICByMSAgLQo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
