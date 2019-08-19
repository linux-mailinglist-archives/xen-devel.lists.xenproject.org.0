Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C532794BEA
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 19:45:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzlh2-0007eA-Ey; Mon, 19 Aug 2019 17:43:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TEA=WP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hzlh0-0007ce-VO
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 17:43:42 +0000
X-Inumbo-ID: e27c8ab0-c2a8-11e9-b90c-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e27c8ab0-c2a8-11e9-b90c-bc764e2007e4;
 Mon, 19 Aug 2019 17:43:42 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9D4222CF4;
 Mon, 19 Aug 2019 17:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566236621;
 bh=5thd5wvD5iU/Igcl2ae2AdzNxU2d7IpJYwHOSpzdkK8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j1Yicx2lw05Cdq7NdZrttN2ANagXVLNvWMwYElu5K6vPp57FLnR//C8TUSE9j453y
 co7/3B9AEuNYAJgPQHCXdHLjvNiWvkcDdT7uld1WewCQ6F0PV9AMH7W0mOHkme4TiF
 9Qrpn2AW2DEHdbi4KBUUBBTZWEh2YWZxeyZtYNt4=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 19 Aug 2019 10:43:35 -0700
Message-Id: <20190819174338.10466-5-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908191011060.20094@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908191011060.20094@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v7 5/8] xen/arm: early_print_info print
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
LWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+ClJldmlld2VkLWJ5
OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyLmJhYmNodWtAZXBhbS5jb20+CkFja2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KQ2hhbmdlcyBpbiB2NjoK
LSBhZGQgYWNrZWQtYnkgYW5kIHJldmlld2VkLWJ5Ci0gZml4IGluZGVudGF0aW9uCgpDaGFuZ2Vz
IGluIHY1OgotIHN3aXRjaCB0byB1bnNpZ25lZAoKQ2hhbmdlcyBpbiB2NDoKLSBuZXcgcGF0Y2gK
LS0tCiB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIHwgMTEgKysrKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKaW5kZXggZWIzZGMxM2Iw
Ni4uZGVmZDc5M2Y4ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYworKysgYi94
ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCkBAIC0zNTIsOSArMzUyLDEwIEBAIHN0YXRpYyBpbnQgX19p
bml0IGVhcmx5X3NjYW5fbm9kZShjb25zdCB2b2lkICpmZHQsCiBzdGF0aWMgdm9pZCBfX2luaXQg
ZWFybHlfcHJpbnRfaW5mbyh2b2lkKQogewogICAgIHN0cnVjdCBtZW1pbmZvICptaSA9ICZib290
aW5mby5tZW07CisgICAgc3RydWN0IG1lbWluZm8gKm1lbV9yZXN2ID0gJmJvb3RpbmZvLnJlc2Vy
dmVkX21lbTsKICAgICBzdHJ1Y3QgYm9vdG1vZHVsZXMgKm1vZHMgPSAmYm9vdGluZm8ubW9kdWxl
czsKICAgICBzdHJ1Y3QgYm9vdGNtZGxpbmVzICpjbWRzID0gJmJvb3RpbmZvLmNtZGxpbmVzOwot
ICAgIGludCBpLCBucl9yc3ZkOworICAgIHVuc2lnbmVkIGludCBpLCBqLCBucl9yc3ZkOwogCiAg
ICAgZm9yICggaSA9IDA7IGkgPCBtaS0+bnJfYmFua3M7IGkrKyApCiAgICAgICAgIHByaW50aygi
UkFNOiAlIlBSSXBhZGRyIiAtICUiUFJJcGFkZHIiXG4iLApAQCAtMzc2LDcgKzM3NywxMyBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgZWFybHlfcHJpbnRfaW5mbyh2b2lkKQogICAgICAgICAgICAgY29u
dGludWU7CiAgICAgICAgIC8qIGZkdF9nZXRfbWVtX3JzdiByZXR1cm5zIGxlbmd0aCAqLwogICAg
ICAgICBlICs9IHM7Ci0gICAgICAgIHByaW50aygiIFJFU1ZEWyVkXTogJSJQUklwYWRkciIgLSAl
IlBSSXBhZGRyIlxuIiwgaSwgcywgZSk7CisgICAgICAgIHByaW50aygiIFJFU1ZEWyV1XTogJSJQ
UklwYWRkciIgLSAlIlBSSXBhZGRyIlxuIiwgaSwgcywgZSk7CisgICAgfQorICAgIGZvciAoIGog
PSAwOyBqIDwgbWVtX3Jlc3YtPm5yX2JhbmtzOyBqKyssIGkrKyApCisgICAgeworICAgICAgICBw
cmludGsoIiBSRVNWRFsldV06ICUiUFJJcGFkZHIiIC0gJSJQUklwYWRkciJcbiIsIGksCisgICAg
ICAgICAgICAgICBtZW1fcmVzdi0+YmFua1tqXS5zdGFydCwKKyAgICAgICAgICAgICAgIG1lbV9y
ZXN2LT5iYW5rW2pdLnN0YXJ0ICsgbWVtX3Jlc3YtPmJhbmtbal0uc2l6ZSAtIDEpOwogICAgIH0K
ICAgICBwcmludGsoIlxuIik7CiAgICAgZm9yICggaSA9IDAgOyBpIDwgY21kcy0+bnJfbW9kczsg
aSsrICkKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
