Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C900210C245
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 03:28:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia9UO-0007yk-Ip; Thu, 28 Nov 2019 02:25:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ia9UM-0007yf-Lz
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 02:25:02 +0000
X-Inumbo-ID: 474cbe0c-1186-11ea-a3c4-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 474cbe0c-1186-11ea-a3c4-12813bfff9fa;
 Thu, 28 Nov 2019 02:25:01 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AF622158A;
 Thu, 28 Nov 2019 02:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574907900;
 bh=tk8j4Ysai55R6RgR9CzIi4LtogjbEdt1GnJcC9zWv+s=;
 h=From:To:Cc:Subject:Date:From;
 b=eBv6XjI7i9FtmSEdJ1Fge2wEFNhmNXVyAkinS6tN7z/8qy6XCbnxFWzq3spULgvQb
 bblXFMGE01EBQcfH7e9OYB8EAGu86srd5mrPQcJ2Sox3oU/AVcrljFAmQuJvl9pMtN
 Dc55hLrlxGzyIqNyZEAT5iwKKAVpFyNIr4W57ZA8=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Wed, 27 Nov 2019 18:24:58 -0800
Message-Id: <20191128022458.4428-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] tools/arm: include xen-tools/libs.h from
 libxl_arm_acpi.c
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 ian.jackson@eu.citrix.com, anthony.perard@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bGlieGxfYXJtX2FjcGkuYyBpcyB1c2luZyBCVUlMRF9CVUdfT04gYnV0IGl0IGlzIG5vdCBpbmNs
dWRpbmcKeGVuLXRvb2xzL2xpYnMuaCB0aGF0IGRlZmluZXMgaXQuCgpTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPgotLS0KIHRv
b2xzL2xpYnhsL2xpYnhsX2FybV9hY3BpLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2FybV9hY3BpLmMgYi90b29s
cy9saWJ4bC9saWJ4bF9hcm1fYWNwaS5jCmluZGV4IGJhODc0YzNkMzIuLjUyYzQ3NmZmNjUgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2FybV9hY3BpLmMKKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfYXJtX2FjcGkuYwpAQCAtMTksNiArMTksNyBAQAogI2luY2x1ZGUgImxpYnhsX2FybS5o
IgogCiAjaW5jbHVkZSA8c3RkaW50Lmg+CisjaW5jbHVkZSA8eGVuLXRvb2xzL2xpYnMuaD4KIAog
LyogQmVsb3cgdHlwZWRlZnMgYXJlIHVzZWZ1bCBmb3IgdGhlIGhlYWRlcnMgdW5kZXIgYWNwaS8g
Ki8KIHR5cGVkZWYgdWludDhfdCB1ODsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
