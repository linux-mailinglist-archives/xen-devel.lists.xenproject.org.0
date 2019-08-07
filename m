Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9465A8517E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:54:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvP7o-0007HA-8o; Wed, 07 Aug 2019 16:49:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PRvR=WD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hvP7l-0007H1-Tr
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 16:49:17 +0000
X-Inumbo-ID: 4ac3e3d2-b933-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4ac3e3d2-b933-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 16:49:16 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A59A2229C;
 Wed,  7 Aug 2019 16:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565196555;
 bh=44PYsWGCqETOMJ0ipTggdvBTvhlwEFkJIxoLSe6BBg4=;
 h=Date:From:To:cc:Subject:From;
 b=UQpcXohvpR9Ywx9yerec1YSIr6fHnH1FOGpsDJHq5d/agM7i3zB8JkWdDZJptc/bM
 Tyyo4U2SOSrvX46ud2YvYQpgQxL2VqBe7fvPxTvS7UHXgyxGwHGuOGSAwgRoUjFjlk
 VsrmqJlI2LnIDMfdkEzkLuiEodGkLcvE0Gao6f8A=
Date: Wed, 7 Aug 2019 09:49:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1908070942410.2451@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] xen/arm: unbreak arm64 build for older
 toolchains
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
Cc: julien.grall@arm.com, sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDQ5NDFiZmIgInhlbi9hcm02NDogbWFjcm9zOiBJbnRyb2R1Y2UgYW4gYXNzZW1ibHkg
bWFjcm8gdG8gYWxpYXMKeDMwIiBtb3ZlZAoKICBsciAgICAgIC5yZXEgICAgeDMwCgp0byBtYWNy
b3MuaC4gQSBsYXRlciBwYXRjaCAoMTM5NmRhYiAieGVuL2FybTY0OiBoZWFkOiBEb24ndCBjbG9i
YmVyCngzMC9sciBpbiB0aGUgbWFjcm8gUFJJTlQiKSBzdGFydGVkIHRvIHVzZSAibHIiIGluIGhl
YWQuUywgaG93ZXZlciwgaXQKZGlkbid0IGFkZCBhbiAjaW5jbHVkZSBtYWNyb3MuaCB0byBoZWFk
LlMuIFRoaXMgY29tbWl0IGZpeGVzIGl0LgoKVGhlIGxhY2sgb2YgYWxpYXMgYnJlYWtzIHRoZSBi
dWlsZCB3aXRoCmdjYy1saW5hcm8tNS4zLjEtMjAxNi4wNS14ODZfNjRfYWFyY2g2NC1saW51eC1n
bnUuIFRoZSBhbGlhcyB3YXMgYWRkZWQKbGF0ZXIgdG8gYmludXRpbGVzIDIuMjkgaW4gMjAxNy4K
ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4K
LS0tCkNoYW5nZXMgaW4gdjI6Ci0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCmlu
ZGV4IDI4ZWZlOTIzMGMuLjUwY2ZmMDg3NTYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02
NC9oZWFkLlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwpAQCAtMjUsNiArMjUsNyBA
QAogI2luY2x1ZGUgPGFzbS9lYXJseV9wcmludGsuaD4KICNpbmNsdWRlIDxlZmkvZWZpZXJyLmg+
CiAjaW5jbHVkZSA8YXNtL2FybTY0L2VmaWJpbmQuaD4KKyNpbmNsdWRlIDxhc20vYXJtNjQvbWFj
cm9zLmg+CiAKICNkZWZpbmUgUFRfUFQgICAgIDB4ZjdmIC8qIG5HPTEgQUY9MSBTSD0xMSBBUD0w
MSBOUz0xIEFUVFI9MTExIFQ9MSBQPTEgKi8KICNkZWZpbmUgUFRfTUVNICAgIDB4ZjdkIC8qIG5H
PTEgQUY9MSBTSD0xMSBBUD0wMSBOUz0xIEFUVFI9MTExIFQ9MCBQPTEgKi8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
