Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02D135301
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 01:15:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYIbe-0008Vp-TB; Tue, 04 Jun 2019 23:12:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cmcs=UD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hYIbe-0008Ve-6U
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 23:12:38 +0000
X-Inumbo-ID: 3db5048c-871e-11e9-a9ee-e3cff54a8b83
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3db5048c-871e-11e9-a9ee-e3cff54a8b83;
 Tue, 04 Jun 2019 23:12:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23F3C2067C;
 Tue,  4 Jun 2019 23:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559689956;
 bh=3hki/JcFwF4J6ls3PEQ9t0Ssb2nveTYxu3fs0Ip2zec=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=N7KNTByFU3kBa7zO/BV/4y90HGIjNDykAREf1kALMnfGHO5QSW+vOntHa5HGv4oDL
 fUtXWaBfMW3T49NYjaE1OTnGVhYNTLE0G7Haj6eR4TrF4n23I+NvCD2K0/5aitZflo
 UftyS5tFMSe9ySjJ5OqKB5Xu3xEX/z3cchrIXhVM=
Date: Tue, 4 Jun 2019 16:12:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <7ca0ad84-1f84-96f4-40e2-1b911eadd2bb@arm.com>
Message-ID: <alpine.DEB.2.21.1906041518570.14041@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-20-julien.grall@arm.com>
 <alpine.DEB.2.21.1906041055180.14041@sstabellini-ThinkPad-T480s>
 <7ca0ad84-1f84-96f4-40e2-1b911eadd2bb@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 19/19] xen/arm: Pair call
 to set_fixmap with call to clear_fixmap in copy_from_paddr
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
 Andrii Anisov <Andrii_Anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCA0IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gNi80LzE5IDY6NTkg
UE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFR1ZSwgMTQgTWF5IDIwMTksIEp1
bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gQXQgdGhlIG1vbWVudCwgc2V0X2ZpeG1hcCBtYXkgcmVw
bGFjZSBhIHZhbGlkIGVudHJ5IHdpdGhvdXQgZm9sbG93aW5nCj4gPiA+IHRoZSBicmVhay1iZWZv
cmUtbWFrZSBzZXF1ZW5jZS4gVGhpcyBtYXkgcmVzdWx0IHRvIFRMQiBjb25mbGljdCBhYm9ydC4K
PiA+ID4gCj4gPiA+IFJhdGhlciB0aGFuIGRlYWxpbmcgd2l0aCBCcmVhay1CZWZvcmUtTWFrZSBp
biBzZXRfZml4bWFwLCBldmVyeSBjYWxsIHRvCj4gPiA+IHNldF9maXhtYXAgaXMgcGFpcmVkIHdp
dGggYSBjYWxsIHRvIGNsZWFyX2ZpeG1hcC4KPiA+IAo+ID4gSXQgaXMgbm90IGV2ZXJ5IGNhbGwg
dG8gc2V0X2ZpeG1hcDogaXQgaXMgZXZlcnkgY2FsbCB0bwo+ID4gc2V0X2ZpeG1hcChGSVhNQVBf
TUlTQywgLi4uCj4gCj4gSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgcmVxdWVzdC4uLiBUaGUgdGl0
bGUgZXhwbGljaXQgbWVudGlvbgo+ICJjb3B5X2Zyb21fcGFkZHIiIGFuZCBmaXhtYXAgaXMgb25s
eSBjYWxsZWQgd2l0aCBGSVhNQVBfTUlTQy4KPiAKPiBTbyB3aHkgc2hvdWxkIEkgbmVlZCB0byBz
cGVjaWZ5IHRoZSBhcmd1bWVudD8KCkkgd2Fzbid0IGFza2luZyB0byBtZW50aW9uIEZJWE1BUF9N
SVNDIGV4cGxpY2l0ZWx5LCBJIGRvbid0IHRoaW5rIGl0IGlzCnBhcnRpY3VsYXJseSB1c2VmdWwu
IEkgd2FzIG9ubHkgdHJ5aW5nIHRvIG1ha2UgdGhlIHdvcmRpbmcgbW9yZQpzcGVjaWZpYyB0byB3
aGF0IHRoZSBwYXRjaCBkb2VzLgoKVGhlIHN0YXRlbWVudCAiZXZlcnkgY2FsbCB0byBzZXRfZml4
bWFwIGlzIHBhaXJlZCB3aXRoIGEgY2FsbCB0bwpjbGVhcl9maXhtYXAiIGlzIHRvbyBnZW5lcmlj
IGFuZCBJIHdvdWxkIHByZWZlciBpZiBpdCB3YXMgbGltaXRlZCBpbgpzY29wZSBieSBzb21ldGhp
bmcgbGlrZQoKICAiaW4gY29weV9mcm9tX3BhZGRyIgoKTGlrZSB5b3UgaGF2ZSBkb25lIGluIHRo
ZSBzdWJqZWN0LiBSZXN1bHRpbmcgaW46CiAgCiAgZXZlcnkgY2FsbCB0byBzZXRfZml4bWFwIGlu
IGNvcHlfZnJvbV9wYWRkciBpcyBwYWlyZWQgd2l0aCBhIGNhbGwgdG8KICBjbGVhcl9maXhtYXAK
Cgo+ID4gUGxlYXNlIGNsYXJpZnksIHRoZW4geW91IGNhbiBhZGQKPiA+IAo+ID4gUmV2aWV3ZWQt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
