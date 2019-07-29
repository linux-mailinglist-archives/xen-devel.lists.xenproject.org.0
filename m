Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7028B79CA4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 01:16:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsEoC-0004wA-Ms; Mon, 29 Jul 2019 23:12:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsEoA-0004w4-KT
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 23:11:58 +0000
X-Inumbo-ID: 42b2bd85-b256-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 42b2bd85-b256-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 23:11:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34B18206E0;
 Mon, 29 Jul 2019 23:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564441916;
 bh=QsbLgc9g6RKTguaWVVlRejNfDJEI779O8ilJlGfuyS4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Gd8t8zzRxW020EeLQRWhV+gu5onm3VnplE9uBWzZa8+lG39VFiKMGekJW4LGczrqI
 KWro4pXoHIiGJek0QduX0FSK05Kt8ZScmb19cSivkwbVVx3UEVuUFXqujbStMAdsDw
 KnbNDDDETRjopAGToLXvLSGnPCiWwtlw8a4AKn0Y=
Date: Mon, 29 Jul 2019 16:11:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-2-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907291611440.1237@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-2-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 01/35] xen/arm64: macros: Introduce an
 assembly macro to alias x30
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

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSByZXR1cm4gYWRk
cmVzcyBvZiBhIGZ1bmN0aW9uIGlzIGFsd2F5cyBzdG9yZWQgaW4geDMwLiBGb3IgY29udmVuaWVu
Y2UsCj4gaW50cm9kdWNlIGEgcmVnaXN0ZXIgYWxpYXMgc28gImxyIiBjYW4gYmUgdXNlZCBpbiBh
c3NlbWJseS4KPiAKPiBUaGlzIGlzIGRlZmluZWQgaW4gYXNtLWFybS9hcm02NC9tYWNyb3MuaCB0
byBhbGxvdyBhbGwgYXNzZW1ibHkgZmlsZXMKPiB0byB1c2UgaXQuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgphbmQgY29tbWl0dGVkCgoK
PiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgIC0gUGF0Y2ggYWRkZWQKPiAtLS0K
PiAgeGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMgICAgICAgICB8IDUgLS0tLS0KPiAgeGVuL2lu
Y2x1ZGUvYXNtLWFybS9hcm02NC9tYWNyb3MuaCB8IDUgKysrKysKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9hcm02NC9lbnRyeS5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKPiBpbmRl
eCA5N2IwNWY1M2VhLi4yZDlhMjcxM2ExIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02
NC9lbnRyeS5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKPiBAQCAtNywxMSAr
Nyw2IEBACj4gICNpbmNsdWRlIDxwdWJsaWMveGVuLmg+Cj4gIAo+ICAvKgo+IC0gKiBSZWdpc3Rl
ciBhbGlhc2VzLgo+IC0gKi8KPiAtbHIgICAgICAucmVxICAgIHgzMCAgICAgICAgICAgICAvKiBs
aW5rIHJlZ2lzdGVyICovCj4gLQo+IC0vKgo+ICAgKiBTdGFjayBwdXNoaW5nL3BvcHBpbmcgKHJl
Z2lzdGVyIHBhaXJzIG9ubHkpLiBFcXVpdmFsZW50IHRvIHN0b3JlIGRlY3JlbWVudAo+ICAgKiBi
ZWZvcmUsIGxvYWQgaW5jcmVtZW50IGFmdGVyLgo+ICAgKi8KPiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLWFybS9hcm02NC9tYWNyb3MuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQv
bWFjcm9zLmgKPiBpbmRleCA5YzVlNjc2YjM3Li5mOTgxYjRmNDNlIDEwMDY0NAo+IC0tLSBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvbWFjcm9zLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20t
YXJtL2FybTY0L21hY3Jvcy5oCj4gQEAgLTIxLDUgKzIxLDEwIEBACj4gICAgICBsZHIgICAgIFxk
c3QsIFtcZHN0LCBcdG1wXQo+ICAgICAgLmVuZG0KPiAgCj4gKy8qCj4gKyAqIFJlZ2lzdGVyIGFs
aWFzZXMuCj4gKyAqLwo+ICtsciAgICAgIC5yZXEgICAgeDMwICAgICAgICAgICAgIC8qIGxpbmsg
cmVnaXN0ZXIgKi8KPiArCj4gICNlbmRpZiAvKiBfX0FTTV9BUk1fQVJNNjRfTUFDUk9TX0ggKi8K
PiAgCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
