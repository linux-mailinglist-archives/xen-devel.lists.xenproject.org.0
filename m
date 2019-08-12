Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3367F8B026
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:52:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQcd-0000aL-Oz; Tue, 13 Aug 2019 06:49:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZmNG=WJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hxQcc-0000a2-Gq
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:49:30 +0000
X-Inumbo-ID: 8d5f054c-bd50-11e9-8922-d7f94c606f10
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d5f054c-bd50-11e9-8922-d7f94c606f10;
 Mon, 12 Aug 2019 22:28:48 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5678420842;
 Mon, 12 Aug 2019 22:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565648927;
 bh=VI05y6ex9i5gksN6QIZvzvo6HHzPFLUgx4BeTPqM1KA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F4Ao5wzxvPhCnR3oHHjNySCQ/Yx8DwbmgelcHv7oaMCjJHcJxUJc/HmIxZDLJ0A+Q
 +wnZGK0lsOXzO27xDE7doqxwfEJDR3K5m/sH10jrlStKlAK0PIIsH4KEuTLACtb2J/
 m8P4uCGCDPnLW7Q45fqWfxTjoiikjiwOw9QrX5FQ=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 15:28:41 -0700
Message-Id: <20190812222844.9636-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v5 4/7] xen/arm: early_print_info print
 reserved_mem
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW1wcm92ZSBlYXJseV9wcmludF9pbmZvIHRvIGFsc28gcHJpbnQgdGhlIGJhbmtzIHNhdmVkIGlu
CmJvb3RpbmZvLnJlc2VydmVkX21lbS4gUHJpbnQgdGhlbSByaWdodCBhZnRlciBSRVNWRCwgaW5j
cmVhc2luZyB0aGUgc2FtZQppbmRleC4KClNpbmNlIHdlIGFyZSBhdCBpdCwgYWxzbyBzd2l0Y2gg
dGhlIGV4aXN0aW5nIFJFU1ZEIHByaW50IHRvIHVzZSB1bnNpZ25lZAppbnQuCgpTaWduZWQtb2Zm
LWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Ci0tLQpDaGFuZ2Vz
IGluIHY1OgotIHN3aXRjaCB0byB1bnNpZ25lZAoKQ2hhbmdlcyBpbiB2NDoKLSBuZXcgcGF0Y2gK
LS0tCiB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIHwgMTEgKysrKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKaW5kZXggMGIwZTIyYTNk
MC4uMzIxNTNlNjIwNyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYworKysgYi94
ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCkBAIC0zMzcsOSArMzM3LDEwIEBAIHN0YXRpYyBpbnQgX19p
bml0IGVhcmx5X3NjYW5fbm9kZShjb25zdCB2b2lkICpmZHQsCiBzdGF0aWMgdm9pZCBfX2luaXQg
ZWFybHlfcHJpbnRfaW5mbyh2b2lkKQogewogICAgIHN0cnVjdCBtZW1pbmZvICptaSA9ICZib290
aW5mby5tZW07CisgICAgc3RydWN0IG1lbWluZm8gKm1lbV9yZXN2ID0gJmJvb3RpbmZvLnJlc2Vy
dmVkX21lbTsKICAgICBzdHJ1Y3QgYm9vdG1vZHVsZXMgKm1vZHMgPSAmYm9vdGluZm8ubW9kdWxl
czsKICAgICBzdHJ1Y3QgYm9vdGNtZGxpbmVzICpjbWRzID0gJmJvb3RpbmZvLmNtZGxpbmVzOwot
ICAgIGludCBpLCBucl9yc3ZkOworICAgIHVuc2lnbmVkIGludCBpLCBqLCBucl9yc3ZkOwogCiAg
ICAgZm9yICggaSA9IDA7IGkgPCBtaS0+bnJfYmFua3M7IGkrKyApCiAgICAgICAgIHByaW50aygi
UkFNOiAlIlBSSXBhZGRyIiAtICUiUFJJcGFkZHIiXG4iLApAQCAtMzYxLDkgKzM2MiwxNSBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgZWFybHlfcHJpbnRfaW5mbyh2b2lkKQogICAgICAgICAgICAgY29u
dGludWU7CiAgICAgICAgIC8qIGZkdF9nZXRfbWVtX3JzdiByZXR1cm5zIGxlbmd0aCAqLwogICAg
ICAgICBlICs9IHM7Ci0gICAgICAgIHByaW50aygiIFJFU1ZEWyVkXTogJSJQUklwYWRkciIgLSAl
IlBSSXBhZGRyIlxuIiwKKyAgICAgICAgcHJpbnRrKCIgUkVTVkRbJXVdOiAlIlBSSXBhZGRyIiAt
ICUiUFJJcGFkZHIiXG4iLAogICAgICAgICAgICAgICAgICAgICAgaSwgcywgZSk7CiAgICAgfQor
ICAgIGZvciAoIGogPSAwOyBqIDwgbWVtX3Jlc3YtPm5yX2JhbmtzOyBqKyssIGkrKyApCisgICAg
eworICAgICAgICBwcmludGsoIiBSRVNWRFsldV06ICUiUFJJcGFkZHIiIC0gJSJQUklwYWRkciJc
biIsIGksCisgICAgICAgICAgICAgICAgICAgICBtZW1fcmVzdi0+YmFua1tqXS5zdGFydCwKKyAg
ICAgICAgICAgICAgICAgICAgIG1lbV9yZXN2LT5iYW5rW2pdLnN0YXJ0ICsgbWVtX3Jlc3YtPmJh
bmtbal0uc2l6ZSAtIDEpOworICAgIH0KICAgICBwcmludGsoIlxuIik7CiAgICAgZm9yICggaSA9
IDAgOyBpIDwgY21kcy0+bnJfbW9kczsgaSsrICkKICAgICAgICAgcHJpbnRrKCJDTURMSU5FWyUi
UFJJcGFkZHIiXTolcyAlc1xuIiwgY21kcy0+Y21kbGluZVtpXS5zdGFydCwKLS0gCjIuMTcuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
