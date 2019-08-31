Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15019A41C3
	for <lists+xen-devel@lfdr.de>; Sat, 31 Aug 2019 04:45:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3tJu-0000cP-IR; Sat, 31 Aug 2019 02:40:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wYOR=W3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i3tJs-0000cK-R9
 for xen-devel@lists.xenproject.org; Sat, 31 Aug 2019 02:40:52 +0000
X-Inumbo-ID: bee13292-cb98-11e9-ae94-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bee13292-cb98-11e9-ae94-12813bfff9fa;
 Sat, 31 Aug 2019 02:40:51 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0870A2342E;
 Sat, 31 Aug 2019 02:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567219250;
 bh=JMKsqnwwgnBGpJ8VeH9x8cWpA1gtiIBeSZVZl27H2DQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=gvmwFq3pY5ccH5CCkB4Ugbg/tMcPSx94oSmxQjeR09qKdawAweVRy+ftYilt0NgBa
 usG1q3SgGfitAHlFFq20MSlmtok8sJZq49uKbGwenqoZdqTJJdUl/hesQArj/MGDX0
 DKmKFaMvUjziQw1oQYuf5m++yBZbQ7qW8Hm8+CYQ=
Date: Fri, 30 Aug 2019 19:40:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@infradead.org>
In-Reply-To: <20190830085807.GA15771@infradead.org>
Message-ID: <alpine.DEB.2.21.1908301926500.21347@sstabellini-ThinkPad-T480s>
References: <1567175255-1798-1-git-send-email-peng.fan@nxp.com>
 <d7477406-a8a0-5c3c-13dc-2c84e27b8afa@arm.com>
 <20190830085807.GA15771@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH V2] arm: xen: mm: use __GPF_DMA32 for arm64
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
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Julien Grall <Julien.Grall@arm.com>, dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 boris.ostrovsky@oracle.com, nd <nd@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <Robin.Murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KyBKdWVyZ2VuLCBCb3JpcwoKT24gRnJpLCAzMCBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcg
d3JvdGU6Cj4gQ2FuIHdlIHRha2UgYSBzdGVwIGJhY2sgYW5kIGZpZ3VyZSBvdXQgd2hhdCB3ZSB3
YW50IHRvIGRvIGhlcmU/Cj4gCj4gQUZBSUNTIHRoaXMgZnVuY3Rpb24gYWxsb2NhdGVzIG1lbW9y
eSBmb3IgdGhlIHN3aW90bGIteGVuIGJ1ZmZlciwKPiBhbmQgdGhhdCBtZWFucyBpdCBtdXN0IGJl
IDw9IDMyLWJpdCBhZGRyZXNzYWJsZSB0byBzYXRpc2Z5IHRoZSBETUEgQVBJCj4gZ3VhcmFudGVl
cy4gIFRoYXQgbWVhbnMgd2UgZ2VuZXJhbGx5IHdhbnQgdG8gdXNlIEdGUF9ETUEzMiBldmVyeXdo
ZXJlCj4gdGhhdCBleGlzdHMsIGJ1dCBvbiBzeXN0ZW1zIHdpdGggb2RkIHpvbmVzIHdlIG1pZ2h0
IHdhbnQgdG8gZGlwIGludG8KPiBHRlBfRE1BLiAgVGhpcyBhbHNvIG1lYW5zIHN3aW90bGIteGVu
IGRvZXNuJ3QgYWN0dWFsbHkgZG8gdGhlIHJpZ2h0Cj4gdGhpbmcgb24geDg2IGF0IHRoZSBtb21l
bnQuICBTbyBzaG91bGRuJ3Qgd2UganVzdCBoYXZlIG9uZSBjb21tb24KPiByb3V0aW5lIGluIHN3
aW90bGIteGVuLmMgdGhhdCBjaGVja3MgaWYgd2UgaGF2ZSBDT05GSUdfWk9ORV9ETUEzMgo+IHNl
dCwgdGhlbiB0cnkgR0ZQX0RNQTMyLCBhbmQgaWYgbm90IGNoZWNrIGlmIENPTkZJR19aT05FX0RN
QSBpcyBzZXQKPiBhbmQgdGhlbiB0cnkgdGhhdCwgZWxzZSBkZWZhdWx0IHRvIEdGUF9LRVJORUw/
CgpZZXMsIGZvciBBUk0vQVJNNjQgaXQgbWFrZXMgYSBsb3Qgb2Ygc2Vuc2UgZ2l2ZW4gdGhhdCBk
b20wIGlzIDE6MSBtYXBwZWQKKHBzZXVkby1waHlzaWNhbCA9PSBwaHlzaWNhbCkuICBJJ2xsIGxl
dCBKdWVyZ2VuIGFuZCBCb3JpcyBjb21tZW50IG9uCnRoZSB4ODYgc2lkZSBvZiB0aGluZ3MsIGJ1
dCBvbiB4ODYgUFYgRG9tMCBpcyBub3QgMToxIG1hcHBlZCBzbwpHRlBfRE1BMzIgaXMgcHJvYmFi
bHkgbm90IG1lYW5pbmdmdWwuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
