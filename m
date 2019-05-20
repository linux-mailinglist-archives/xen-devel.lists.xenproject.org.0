Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859882432B
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 23:51:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSq9P-0007PN-FD; Mon, 20 May 2019 21:48:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rume=TU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hSq9O-0007PH-2I
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 21:48:54 +0000
X-Inumbo-ID: 0f5b5aa4-7b49-11e9-8c72-478a533c4f6c
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f5b5aa4-7b49-11e9-8c72-478a533c4f6c;
 Mon, 20 May 2019 21:48:53 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF8072171F;
 Mon, 20 May 2019 21:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558388932;
 bh=szxW1U+pFG1x1NNlefYb+4HoRV6g8ZCp0pGwBVSvfks=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=MdXjCMzF+CqqwBDM7D/BKfj1GpJ+XYqYMXyVENDg7FpMOjYkjcIHY5vb6vNmoAA4f
 hHY7fRQqs+2lucELnbmk+LOwDNSofioclAWZr/wQuotaw5ZrnNtybK6hfnlaTH2yH4
 eclFKa69FzMCSPw13SAlQ3zqlDZuQNDaPXvQOQUM=
Date: Mon, 20 May 2019 14:48:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-4-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1905201447150.16404@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-4-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 03/19] xen/arm:
 processor: Use BIT(.., UL) instead of _AC(1, U) in SCTLR_ defines
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
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFVzZSB0aGUgcGF0dGVy
biBCSVQoLi4uLCBVTCkgdG8gbWFrZSB0aGUgY29kZSBtb3JlIHJlYWRhYmxlLiBOb3RlIHRoYXQK
PiB1bnNpZ25lZCBsb25nIGlzIHVzZWQgaW5zdGVhZCBvZiB1bnNpZ25lZCBiZWNhdXNlIFNDVExS
IGlzIHRlY2huaWNhbGx5Cj4gMzItYml0IG9uIEFybTMyIGFuZCA2NC1iaXQgb24gQXJtNjQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJl
dmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgo+
IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAgLSBSZXdvcmsgdGhlIHBhdGNoIHRv
IHVzZSBCSVQoLi4uLCBVTCkgaW5zdGVhZCBvZiBfQklUVUwoLi4uKS4KPiAtLS0KPiAgeGVuL2lu
Y2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaCB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL3Byb2Nlc3Nvci5oIGIveGVuL2luY2x1ZGUvYXNtLWFy
bS9wcm9jZXNzb3IuaAo+IGluZGV4IGYzYjY4MTg1ZWIuLmJiY2JhMDYxY2EgMTAwNjQ0Cj4gLS0t
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vcHJvY2Vzc29yLmgKPiBAQCAtMTIwLDIwICsxMjAsMjAgQEAKPiAgCj4gIC8qIEJpdHMg
c3BlY2lmaWMgdG8gU0NUTFJfRUwxIGZvciBBcm0zMiAqLwo+ICAKPiAtI2RlZmluZSBTQ1RMUl9B
MzJfRUwxX1YgICAgIChfQUMoMSxVKTw8MTMpCj4gKyNkZWZpbmUgU0NUTFJfQTMyX0VMMV9WICAg
ICBCSVQoMTMsIFVMKQo+ICAKPiAgLyogQ29tbW9uIGJpdHMgZm9yIFNDVExSX0VMeCBmb3IgQXJt
MzIgKi8KPiAgCj4gLSNkZWZpbmUgU0NUTFJfQTMyX0VMeF9URSAgICAoX0FDKDEsVSk8PDMwKQo+
IC0jZGVmaW5lIFNDVExSX0EzMl9FTHhfRkkgICAgKF9BQygxLFUpPDwyMSkKPiArI2RlZmluZSBT
Q1RMUl9BMzJfRUx4X1RFICAgIEJJVCgzMCwgVUwpCj4gKyNkZWZpbmUgU0NUTFJfQTMyX0VMeF9G
SSAgICBCSVQoMjEsIFVMKQo+ICAKPiAgLyogQ29tbW9uIGJpdHMgZm9yIFNDVExSX0VMeCBvbiBh
bGwgYXJjaGl0ZWN0dXJlcyAqLwo+IC0jZGVmaW5lIFNDVExSX0F4eF9FTHhfRUUgICAgKF9BQygx
LFUpPDwyNSkKPiAtI2RlZmluZSBTQ1RMUl9BeHhfRUx4X1dYTiAgIChfQUMoMSxVKTw8MTkpCj4g
LSNkZWZpbmUgU0NUTFJfQXh4X0VMeF9JICAgICAoX0FDKDEsVSk8PDEyKQo+IC0jZGVmaW5lIFND
VExSX0F4eF9FTHhfQyAgICAgKF9BQygxLFUpPDwyKQo+IC0jZGVmaW5lIFNDVExSX0F4eF9FTHhf
QSAgICAgKF9BQygxLFUpPDwxKQo+IC0jZGVmaW5lIFNDVExSX0F4eF9FTHhfTSAgICAgKF9BQygx
LFUpPDwwKQo+ICsjZGVmaW5lIFNDVExSX0F4eF9FTHhfRUUgICAgQklUKDI1LCBVTCkKPiArI2Rl
ZmluZSBTQ1RMUl9BeHhfRUx4X1dYTiAgIEJJVCgxOSwgVUwpCj4gKyNkZWZpbmUgU0NUTFJfQXh4
X0VMeF9JICAgICBCSVQoMTIsIFVMKQo+ICsjZGVmaW5lIFNDVExSX0F4eF9FTHhfQyAgICAgQklU
KDIsIFVMKQo+ICsjZGVmaW5lIFNDVExSX0F4eF9FTHhfQSAgICAgQklUKDEsIFVMKQo+ICsjZGVm
aW5lIFNDVExSX0F4eF9FTHhfTSAgICAgQklUKDAsIFVMKQo+ICAKPiAgI2RlZmluZSBIU0NUTFJf
QkFTRSAgICAgX0FDKDB4MzBjNTE4NzgsVSkKPiAgCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
