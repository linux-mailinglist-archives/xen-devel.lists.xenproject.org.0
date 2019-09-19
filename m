Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECC1B87D3
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 00:53:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB5FI-0001GG-Ap; Thu, 19 Sep 2019 22:49:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u4d+=XO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iB5FG-0001G9-Ge
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 22:49:50 +0000
X-Inumbo-ID: c7d1e365-db2f-11e9-9678-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7d1e365-db2f-11e9-9678-12813bfff9fa;
 Thu, 19 Sep 2019 22:49:49 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48340206C2;
 Thu, 19 Sep 2019 22:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568933388;
 bh=KtacklXhWqf+xMnkrF7ynodFWZq5TP4yNXEthCcvro4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=hdf1YuCw/r0vokqSRI9q4yuu+U5+SrVRfS991SFb2jkI3iyDQm4xS4vY8SVpojdrg
 Lmd+R4h3rMK70JtH5Ivmz0kNaeu/ZIda8HYH/aRPswRMP+Yu7ydIWI477m9C9arcBK
 ts5LvSUtUn5TRgniNKuxKWgz2fswVQKvA2wYOwhg=
Date: Thu, 19 Sep 2019 15:49:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190917132125.13033-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1909191542330.19418@sstabellini-ThinkPad-T480s>
References: <20190917132125.13033-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm32: setup: Give a xenheap page to
 the boot allocator
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

T24gVHVlLCAxNyBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFmdGVyIGNvbW1pdCA2
ZTNlNzcxMjAzICJ4ZW4vYXJtOiBzZXR1cDogUmVsb2NhdGUgdGhlIERldmljZS1UcmVlIGxhdGVy
IG9uCj4gaW4gdGhlIGJvb3QiLCB0aGUgYm9vdCBhbGxvY2F0b3Igd2lsbCBub3QgcmVjZWl2ZSBh
bnkgeGVuaGVhcCBwYWdlIChpLmUuCj4gbWFwcGVkIHBhZ2UpIG9uIEFybTMyLgo+IAo+IEhvd2V2
ZXIsIHRoZSBib290IGFsbG9jYXRvciBpbXBsaWNpdGVseSByZWx5IG9uIGhhdmluZyB0aGUgZmly
c3QgcGFnZQo+IGFscmVhZHkgbWFwcGVkIGFuZCB0aGVyZWZvcmUgcmVzdWx0IHRvIGJyZWFrIGJv
b3Qgb24gQXJtMzIuCj4gCj4gVGhlIGVhc2llc3Qgd2F5IGZvciBub3cgaXMgdG8gZ2l2ZSBhIHhl
bmhlYXAgcGFnZSB0byB0aGUgYm9vdCBhbGxvY2F0b3IuCj4gV2UgbWF5IHdhbnQgdG8gcmV0aGlu
ayB0aGUgaW50ZXJmYWNlIGluIHRoZSBmdXR1cmUuCj4gCj4gRml4ZXM6IDZlM2U3NzEyMDMgKCd4
ZW4vYXJtOiBzZXR1cDogUmVsb2NhdGUgdGhlIERldmljZS1UcmVlIGxhdGVyIG9uIGluIHRoZSBi
b290JykKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
Pgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vc2V0dXAuYyB8IDggKysrKysrKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gaW5kZXggZWJiZmFk
OTRlNC4uZTZkZGVmYjVjZiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+ICsr
KyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gQEAgLTU5Myw2ICs1OTMsNyBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgc2V0dXBfbW0odm9pZCkKPiAgICAgIHVuc2lnbmVkIGxvbmcgaGVhcF9wYWdlcywg
eGVuaGVhcF9wYWdlcywgZG9taGVhcF9wYWdlczsKPiAgICAgIGludCBpOwo+ICAgICAgY29uc3Qg
dWludDMyX3QgY3RyID0gUkVBRF9DUDMyKENUUik7Cj4gKyAgICBtZm5fdCBib290X21mbl9zdGFy
dCwgYm9vdF9tZm5fZW5kOwo+ICAKPiAgICAgIGlmICggIWJvb3RpbmZvLm1lbS5ucl9iYW5rcyAp
Cj4gICAgICAgICAgcGFuaWMoIk5vIG1lbW9yeSBiYW5rXG4iKTsKPiBAQCAtNjY1LDYgKzY2Niwx
MSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbW0odm9pZCkKPiAgCj4gICAgICBzZXR1cF94
ZW5oZWFwX21hcHBpbmdzKChlID4+IFBBR0VfU0hJRlQpIC0geGVuaGVhcF9wYWdlcywgeGVuaGVh
cF9wYWdlcyk7Cj4gIAo+ICsgICAgLyogV2UgbmVlZCBhIHNpbmdsZSBtYXBwZWQgcGFnZSBmb3Ig
cG9wdWxhdGluZyBib290bWVtX3JlZ2lvbl9saXN0LiAqLwo+ICsgICAgYm9vdF9tZm5fc3RhcnQg
PSBtZm5fYWRkKHhlbmhlYXBfbWZuX2VuZCwgLTEpOwo+ICsgICAgYm9vdF9tZm5fZW5kID0geGVu
aGVhcF9tZm5fZW5kOwo+ICsgICAgaW5pdF9ib290X3BhZ2VzKG1mbl90b19tYWRkcihib290X21m
bl9zdGFydCksIG1mbl90b19tYWRkcihib290X21mbl9lbmQpKTsKPiArCj4gICAgICAvKiBBZGQg
bm9uLXhlbmhlYXAgbWVtb3J5ICovCj4gICAgICBmb3IgKCBpID0gMDsgaSA8IGJvb3RpbmZvLm1l
bS5ucl9iYW5rczsgaSsrICkKPiAgICAgIHsKPiBAQCAtNzEwLDcgKzcxNiw3IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBzZXR1cF9tbSh2b2lkKQo+ICAKPiAgICAgIC8qIEFkZCB4ZW5oZWFwIG1lbW9y
eSB0aGF0IHdhcyBub3QgYWxyZWFkeSBhZGRlZCB0byB0aGUgYm9vdCBhbGxvY2F0b3IuICovCj4g
ICAgICBpbml0X3hlbmhlYXBfcGFnZXMobWZuX3RvX21hZGRyKHhlbmhlYXBfbWZuX3N0YXJ0KSwK
PiAtICAgICAgICAgICAgICAgICAgICAgICBtZm5fdG9fbWFkZHIoeGVuaGVhcF9tZm5fZW5kKSk7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWZuX3RvX21hZGRyKGJvb3RfbWZuX2VuZCkpOwoK
SSBjYW4gc2VlIHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gZG8gd2l0aCB0aGlzIHBhdGNoIGFuZCBp
dCBsb29rcyBsaWtlCnRoZSByaWdodCBmaXggYXQgdGhlIG1vbWVudC4gSG93ZXZlciwgc2hvdWxk
bid0IHRoaXMgbGFzdCBjaGFuZ2U6CgogIG1mbl90b19tYWRkcihib290X21mbl9zdGFydCkKCgo+
ICB9Cj4gICNlbHNlIC8qIENPTkZJR19BUk1fNjQgKi8KPiAgc3RhdGljIHZvaWQgX19pbml0IHNl
dHVwX21tKHZvaWQpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
