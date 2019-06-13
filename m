Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520843426
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 10:35:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbL9O-0002WW-CK; Thu, 13 Jun 2019 08:32:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xsGU=UM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbL9M-0002WR-FV
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 08:32:00 +0000
X-Inumbo-ID: b361904a-8db5-11e9-9fb1-fbafc43f6d5b
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b361904a-8db5-11e9-9fb1-fbafc43f6d5b;
 Thu, 13 Jun 2019 08:31:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9C82367;
 Thu, 13 Jun 2019 01:31:54 -0700 (PDT)
Received: from [10.37.12.54] (unknown [10.37.12.54])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D69353F694;
 Thu, 13 Jun 2019 01:31:53 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-12-julien.grall@arm.com>
 <alpine.DEB.2.21.1906121528260.13737@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a7874b6c-08b4-28a0-cb5f-ea7f7b23e2e7@arm.com>
Date: Thu, 13 Jun 2019 09:31:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906121528260.13737@sstabellini-ThinkPad-T480s>
Content-Language: en-US
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
Cc: xen-devel@lists.xenproject.org, Andrii Anisov <Andrii_Anisov@epam.com>,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMTIvMTkgMTE6MzMgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDE0IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IHtzZXQsIGNs
ZWFyfV9maXhtYXAoKSBhcmUgY3VycmVudGx5IG9wZW4tY29kaW5nIHVwZGF0ZSB0byB0aGUgWGVu
Cj4+IHBhZ2UtdGFibGVzLiBUaGlzIGNhbiBiZSBhdm9pZGVkIGJ5IHVzaW5nIHRoZSBnZW5lcmlj
IGhlbHBlcnMKPj4gbWFwX3BhZ2VzX3RvX3hlbigpIGFuZCBkZXN0cm95X3hlbl9tYXBwaW5ncygp
Lgo+Pgo+PiBCb3RoIGZ1bmN0aW9uIGFyZSBub3QgbWVhbnQgdG8gZmFpbCBmb3IgZml4bWFwLCBo
ZW5jZSB0aGUgQlVHX09OKCkKPj4gY2hlY2tpbmcgdGhlIHJldHVybi4KPiAKPiBCVUdfT04gY3Jh
c2hlcyB0aGUgaHlwZXJ2aXNvciBldmVuIGluIG5vbi1ERUJVRyBidWlsZHMuIFdvdWxkIGFuIEFT
U0VSVAo+IGJlIGEgYmV0dGVyIGNob2ljZT8KVGhlIEFTU0VSVCgpIHdvdWxkIGRpc2FwcGVhciBp
biBub24tZGVidWcgcG90ZW50aWFsbHkgbGVhZGluZyB0byB1bmtub3duIApjb25zZXF1ZW5jZS4K
CklmIHdlIGltYWdpbmUgdGhhdCBtYXBfcGFnZXNfdG9feGVuKCkgZmFpbHMsIHRoZW4gaXQgbGlr
ZWx5IG1lYW5zIHRoYXQgCm1hcHBpbmcgaGFzIG5vdCBiZWVuIGRvbmUvcmVtb3ZlZC4KCkFzIHNl
dF9maXhtYXAoKSBkb2VzIG5vdCByZXR1cm4gYW4gZXJyb3IsIHRoaXMgbWVhbnMgdGhhdCB0aGUg
dXNlciBtYXkgCnRyeSB0byBhY2Nlc3MgYW4gaW52YWxpZCBtYXBwaW5nIGFuZCB0aGVyZWZvcmUg
Y3Jhc2ggdGhlIGh5cGVydmlzb3IuCgpBcyBjbGVhcl9maXhtYXAoKSBkb2VzIG5vdCByZXR1cm4g
YW4gZXJyb3IsIHRoaXMgbWVhbnMgdGhhdCBzdWJzZXF1ZW50IApzZXRfZml4bWFwKCkgbWF5IGZh
aWwgYmVjYXVzZSBtYXBfcGFnZXNfdG9feGVuKCkgZG9lcyBub3QgYWxsb3cgdG8gCnJlcGxhY2Ug
dmFsaWQgbWFwcGluZy4KCklkZWFsbHkgd2Ugd291bGQgd2FudCB0byBwcm9wYWdhdGUgdGhlIGVy
cm9yLCBob3dldmVyIGFsbCB0aGUgY2FsbCB0byAKdGhlIGZ1bmN0aW9ucyBoYXBwZW4gZHVyaW5n
IGJvb3QuIFNvIG1vc3QgbGlrZWx5IHRoZSB1c2VyIHdpbGwgCnBhbmljL0JVR19PTiBhcyB5b3Ug
dGhpcyBoaW50IHNvbWV0aGluZyBoYXMgZ29uZSByZWFsbHkgd3JvbmcgYW5kIHdlIApkb24ndCB3
YW50IHRvIGNvbnRpbnVlIGZ1cnRoZXIuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
