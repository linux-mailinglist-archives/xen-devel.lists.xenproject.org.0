Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B4E7AFB4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:22:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsVnN-0007ZM-3I; Tue, 30 Jul 2019 17:20:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsVnM-0007ZH-1R
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:20:16 +0000
X-Inumbo-ID: 4b836bb6-b2ee-11e9-b4b8-bffc05f57780
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b836bb6-b2ee-11e9-b4b8-bffc05f57780;
 Tue, 30 Jul 2019 17:20:15 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BF8A2089E;
 Tue, 30 Jul 2019 17:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564507214;
 bh=pNmVUIdayvl7CRcDYkIXZv+9b5mVwpGOKhhmz8aWbXw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=rl1IBn3nWEMlH3Z1iCxH3eOqOgJnuXXRYQa/StHFRWndUM1yIJqQEn5uz0oYJ6Xs7
 on3j6Fj4btqXFF3V6KQ8VkYdTI9EwC1U7gZtFkLnUnWe5nNUGTy6AUCUhB/mf+dISU
 DKeBFmww97p5WU4DXN6rnCBGSiHJR5bR8mbwt4Fg=
Date: Tue, 30 Jul 2019 10:20:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-12-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301020010.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-12-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 11/35] xen/arm64: head: Document
 enable_mmu()
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

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IERvY3VtZW50IHRoZSBi
ZWhhdmlvciBhbmQgdGhlIG1haW4gcmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiBlbmFibGVfbW11KCku
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
ClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
CgoKPiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgIC0geDIgYW5kIHgzIGFyZSBh
bHNvIGNsb2JiZXJzLiBVcGRhdGUgdGhlIGNvbW1lbnQgYWNjb3JkaW5nbHkKPiAgICAgICAgIC0g
cy9JRC8xOjEvCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCA3ICsrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IGluZGV4
IGVkZGY2NjMwMjEuLjYzNTYzZWY1ZTMgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0
L2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBAQCAtNTc2LDYgKzU3
NiwxMyBAQCB2aXJ0cGh5c19jbGFzaDoKPiAgICAgICAgICByZXQKPiAgRU5EUFJPQyhjcmVhdGVf
cGFnZV90YWJsZXMpCj4gIAo+ICsvKgo+ICsgKiBUdXJuIG9uIHRoZSBEYXRhIENhY2hlIGFuZCB0
aGUgTU1VLiBUaGUgZnVuY3Rpb24gd2lsbCByZXR1cm4gb24gdGhlIDE6MQo+ICsgKiBtYXBwaW5n
LiBJbiBvdGhlciB3b3JkLCB0aGUgY2FsbGVyIGlzIHJlc3BvbnNpYmxlIHRvIHN3aXRjaCB0byB0
aGUgcnVudGltZQo+ICsgKiBtYXBwaW5nLgo+ICsgKgo+ICsgKiBDbG9iYmVycyB4MCAtIHgzCj4g
KyAqLwo+ICBlbmFibGVfbW11Ogo+ICAgICAgICAgIFBSSU5UKCItIFR1cm5pbmcgb24gcGFnaW5n
IC1cclxuIikKPiAgCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
