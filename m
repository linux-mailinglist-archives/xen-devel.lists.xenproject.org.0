Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F518E0F3
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 00:43:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hy1wT-0003E1-E3; Wed, 14 Aug 2019 22:40:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hy1wR-0003Dw-Kj
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 22:40:27 +0000
X-Inumbo-ID: 82ba01b0-bee4-11e9-8524-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82ba01b0-bee4-11e9-8524-bc764e2007e4;
 Wed, 14 Aug 2019 22:40:27 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CADED21721;
 Wed, 14 Aug 2019 22:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565822426;
 bh=v6kCf8/B0R+pjp4g1TyaHDnCyIpz4sRWNH9q+pbC9wA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tfH8pLSnHpOnd8k92s9+7/AEFzbPrqi+4Sun9pvd0i7bWde0jqGKon25AQ3NzFB6k
 yZ0AadpVL9LylueM1KiacrXP9iPXCI9qJK+CE8eZ8LkKFKtYBTX/qLS/uY5llWSXAM
 NkmGMR/5gTwKPRxXytjUKJBZ/MJuxdFL+Y83R4J8=
Date: Wed, 14 Aug 2019 15:40:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <6914df4a-03e3-31fb-9e93-49a018f1e708@arm.com>
Message-ID: <alpine.DEB.2.21.1908141535390.8737@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-6-sstabellini@kernel.org> <87blwtgmma.fsf@epam.com>
 <6914df4a-03e3-31fb-9e93-49a018f1e708@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v5 6/7] xen/arm: don't iomem_permit_access
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxMyBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDgvMTMvMTkgMzoz
NCBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gPiAKPiA+IFN0ZWZhbm8gU3RhYmVsbGlu
aSB3cml0ZXM6Cj4gPiAKPiA+ID4gRG9uJ3QgYWxsb3cgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMg
dG8gYmUgcmVtYXBwZWQgaW50byBhbnkgdW5wcml2aWxlZ2VkCj4gPiA+IGd1ZXN0cywgdW50aWwg
cmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgYXJlIHByb3Blcmx5IHN1cHBvcnRlZCBpbiBYZW4uIEZv
cgo+ID4gPiBub3csIGRvIG5vdCBjYWxsIGlvbWVtX3Blcm1pdF9hY2Nlc3Mgb24gdGhlbSwgYmVj
YXVzZSBnaXZpbmcKPiA+ID4gaW9tZW1fcGVybWl0X2FjY2VzcyB0byBkb20wIG1lYW5zIHRoYXQg
dGhlIHRvb2xzdGFjayB3aWxsIGJlIGFibGUgdG8KPiA+ID4gYXNzaWduIHRoZSByZWdpb24gdG8g
YSBkb21VLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
dGVmYW5vc0B4aWxpbnguY29tPgo+ID4gPiAtLS0KPiA+ID4gCj4gPiA+IENoYW5nZXMgaW4gdjU6
Cj4gPiA+IC0gZml4IGNoZWNrIGNvbmRpdGlvbgo+ID4gPiAtIHVzZSBzdHJuaWNtcAo+ID4gPiAt
IHJldHVybiBlcnJvcgo+ID4gPiAtIGltcHJvdmUgY29tbWl0IG1lc3NhZ2UKPiA+ID4gCj4gPiA+
IENoYW5nZXMgaW4gdjQ6Cj4gPiA+IC0gY29tcGFyZSB0aGUgcGFyZW50IG5hbWUgd2l0aCByZXNl
cnZlZC1tZW1vcnkKPiA+ID4gLSB1c2UgZHRfbm9kZV9jbXAKPiA+ID4gCj4gPiA+IENoYW5nZXMg
aW4gdjM6Cj4gPiA+IC0gbmV3IHBhdGNoCj4gPiA+IC0tLQo+ID4gPiAgIHhlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYyB8IDI0ICsrKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYwo+ID4gPiBpbmRleCA0Yzg0MDQxNTVhLi5lMGMwYzAxYzg4IDEwMDY0NAo+
ID4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+ID4gKysrIGIveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPiA+IEBAIC0xMTU1LDE1ICsxMTU1LDIzIEBAIHN0YXRp
YyBpbnQgX19pbml0IG1hcF9yYW5nZV90b19kb21haW4oY29uc3Qgc3RydWN0Cj4gPiA+IGR0X2Rl
dmljZV9ub2RlICpkZXYsCj4gPiA+ICAgICAgIGJvb2wgbmVlZF9tYXBwaW5nID0gIWR0X2Rldmlj
ZV9mb3JfcGFzc3Rocm91Z2goZGV2KTsKPiA+ID4gICAgICAgaW50IHJlczsKPiA+ID4gICAtICAg
IHJlcyA9IGlvbWVtX3Blcm1pdF9hY2Nlc3MoZCwgcGFkZHJfdG9fcGZuKGFkZHIpLAo+ID4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJfdG9fcGZuKFBBR0VfQUxJR04oYWRk
ciArIGxlbiAtIDEpKSk7Cj4gPiA+IC0gICAgaWYgKCByZXMgKQo+ID4gPiArICAgIC8qCj4gPiA+
ICsgICAgICogRG9uJ3QgZ2l2ZSBpb21lbSBwZXJtaXNzaW9ucyBmb3IgcmVzZXJ2ZWQtbWVtb3J5
IHJhbmdlcyB0byBkb21Vcwo+ID4gPiArICAgICAqIHVudGlsIHJlc2VydmVkLW1lbW9yeSBzdXBw
b3J0IGlzIGNvbXBsZXRlLgo+ID4gPiArICAgICAqLwo+ID4gPiArICAgIGlmICggc3RybmljbXAo
ZHRfbm9kZV9mdWxsX25hbWUoZGV2KSwgIi9yZXNlcnZlZC1tZW1vcnkiLAo+ID4gPiArICAgICAg
ICAgc3RybGVuKCIvcmVzZXJ2ZWQtbWVtb3J5IikpICE9IDAgKQo+ID4gV2h5IGFyZSB5b3UgdXNp
bmcgc3RybmljbXAgdGhlcmU/IFdpdGggc3VjaCB1c2FnZSBpdCBpcyB0aGUgc2FtZSBhcwo+ID4g
c3RyY2FzZWNtcCgpLgo+IAo+IERlZmluaXRlbHkgbm90LCBzdHJjYXNlY21wKCkgd2lsbCBjb21w
YXJlIHRoYXQgdGhlIHR3byBzdHJpbmdzIGV4YWN0bHkgbWF0Y2gKPiAoaWdub3JpbmcgdGhlIGNh
c2Ugb2YgdGhlIGNoYXJhY3RlcnMpLiBIZXJlIHdlIG9ubHkgd2FudCB0byBjaGVjayB0aGUgZmly
c3QKPiBwYXJ0IG9mIHRoZSBwYXRjaCwgc28gd2UgbmVlZCB0byB1c2UgdGhlIGxlbmd0aC1saW1p
dGVkIHZlcnNpb24uCj4gCj4gPiBCdXQsIGlmIHlvdSB3YW50IHRvIGZpbmQgIi9yZXNlcnZlZC1t
ZW1vcnkiIGFueXdoZXJlIGluCj4gPiBkdF9ub2RlX2Z1bGxfbmFtZShkZXYpLCB0aGVuIHlvdSBw
cm9iYWJseSB3YW50IHRvIHVzZSBzdHJjYXNlc3RyKCkKPiAKPiBGb3IgYSBmaXJzdCBzdHJjYXNl
c3RyKCkgaXMgbm90IHByb3ZpZGVkIGJ5IHRoZSBzdHJpbmcgbGliIGluIFhlbi4gU28geW91Cj4g
d291bGQgbmVlZCB0byBpbXBsZW1lbnQgaXQuCj4gCj4gQnV0IHRoZW4gYWxsIHRoZSByZXNlcnZl
ZC1tZW1vcnkgcmVnaW9ucyBhcmUgdW5kZXIgdGhlIG5vZGUgL3Jlc2VydmVkLW1lbW9yeS4KPiBB
IHBhdGggL2EvYi9yZXNlcnZlZC1tZW1vcnkgaXMgbm90IGEgdmFsaWQgbWVtb3J5IHJlZ2lvbi4K
ClllcywgSSB0aGluayBzdHJuaWNtcCBpcyB0aGUgcmlnaHQgb25lIGJ1dC4uLgoKCj4gT24gYSBz
aWRlIG5vdGUsIHRoZSBjaGVjayBpcyBzdGlsbCBpbmNvcnJlY3QgaGVyZSBiZWNhdXNlIHlvdSB3
b3VsZCBhbGxvdwo+IC9yZXNlcnZlZC1tZW1vcnlALi4uIG9yIC9yZXNlcnZlZC1tZW1vcnktdGVz
dCB0byBwYXNzLgoKLi4uYnV0IHlvdSBhcmUgcmlnaHQgdGhhdCB3ZSBzaG91bGQgZGVhbCB3aXRo
IHRoaW5ncyBsaWtlCiIvcmVzZXJ2ZWQtbWVtb3J5LXRlc3QiIHByb3Blcmx5LiBJdCBsb29rcyBs
aWtlIHdlIHNob3VsZCBjb21wYXJlCmFnYWluc3QgIi9yZXNlcnZlZC1tZW1vcnkvIiwgbm90ZSB0
aGUgJy8nIGF0IHRoZSBlbmQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
