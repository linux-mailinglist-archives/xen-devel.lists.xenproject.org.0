Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCFA83CF8
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 23:52:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv7Kl-0000ox-Qh; Tue, 06 Aug 2019 21:49:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hv7Kj-0000mq-QO
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 21:49:29 +0000
X-Inumbo-ID: 1071c9d8-b894-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1071c9d8-b894-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 21:49:28 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6465218A4;
 Tue,  6 Aug 2019 21:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565128168;
 bh=y9qaBrnvPwIqnH9BwbE+aie3cznDazmION0N5Rxo5Nw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Udk/VybBB/xSAxqCY28VAaV+f77tzkYh69Z53aQ7yHQx7+qQP384dqVz8VDv/ia7L
 wL0mhE+Sd8P1lFUmcSRp0qeheiH3CIb4WuX4mx6joNFbYILES7iKk5DjDV2SN1em5T
 3hZmg96Iu+ooeVLzaP+ekUO0IvR/Xzbzcre8g5j0=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Tue,  6 Aug 2019 14:49:22 -0700
Message-Id: <20190806214925.7534-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v4 4/7] xen/arm: early_print_info print
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
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW1wcm92ZSBlYXJseV9wcmludF9pbmZvIHRvIGFsc28gcHJpbnQgdGhlIGJhbmtzIHNhdmVkIGlu
CmJvb3RpbmZvLnJlc2VydmVkX21lbS4gUHJpbnQgdGhlbSByaWdodCBhZnRlciBSRVNWRCwgaW5j
cmVhc2luZyB0aGUgc2FtZQppbmRleC4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3RlZmFub3NAeGlsaW54LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjQ6Ci0gbmV3IHBhdGNoCi0t
LQogeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyB8IDkgKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKaW5kZXggM2U2ZmQ2M2IxNi4uYjhm
MmU1MzEyMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYworKysgYi94ZW4vYXJj
aC9hcm0vYm9vdGZkdC5jCkBAIC0zNTEsOSArMzUxLDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IGVh
cmx5X3NjYW5fbm9kZShjb25zdCB2b2lkICpmZHQsCiBzdGF0aWMgdm9pZCBfX2luaXQgZWFybHlf
cHJpbnRfaW5mbyh2b2lkKQogewogICAgIHN0cnVjdCBtZW1pbmZvICptaSA9ICZib290aW5mby5t
ZW07CisgICAgc3RydWN0IG1lbWluZm8gKm1lbV9yZXN2ID0gJmJvb3RpbmZvLnJlc2VydmVkX21l
bTsKICAgICBzdHJ1Y3QgYm9vdG1vZHVsZXMgKm1vZHMgPSAmYm9vdGluZm8ubW9kdWxlczsKICAg
ICBzdHJ1Y3QgYm9vdGNtZGxpbmVzICpjbWRzID0gJmJvb3RpbmZvLmNtZGxpbmVzOwotICAgIGlu
dCBpLCBucl9yc3ZkOworICAgIGludCBpLCBqLCBucl9yc3ZkOwogCiAgICAgZm9yICggaSA9IDA7
IGkgPCBtaS0+bnJfYmFua3M7IGkrKyApCiAgICAgICAgIHByaW50aygiUkFNOiAlIlBSSXBhZGRy
IiAtICUiUFJJcGFkZHIiXG4iLApAQCAtMzc4LDYgKzM3OSwxMiBAQCBzdGF0aWMgdm9pZCBfX2lu
aXQgZWFybHlfcHJpbnRfaW5mbyh2b2lkKQogICAgICAgICBwcmludGsoIiBSRVNWRFslZF06ICUi
UFJJcGFkZHIiIC0gJSJQUklwYWRkciJcbiIsCiAgICAgICAgICAgICAgICAgICAgICBpLCBzLCBl
KTsKICAgICB9CisgICAgZm9yICggaiA9IDA7IGogPCBtZW1fcmVzdi0+bnJfYmFua3M7IGorKywg
aSsrICkKKyAgICB7CisgICAgICAgIHByaW50aygiIFJFU1ZEWyVkXTogJSJQUklwYWRkciIgLSAl
IlBSSXBhZGRyIlxuIiwgaSwKKyAgICAgICAgICAgICAgICAgICAgIG1lbV9yZXN2LT5iYW5rW2pd
LnN0YXJ0LAorICAgICAgICAgICAgICAgICAgICAgbWVtX3Jlc3YtPmJhbmtbal0uc3RhcnQgKyBt
ZW1fcmVzdi0+YmFua1tqXS5zaXplIC0gMSk7CisgICAgfQogICAgIHByaW50aygiXG4iKTsKICAg
ICBmb3IgKCBpID0gMCA7IGkgPCBjbWRzLT5ucl9tb2RzOyBpKysgKQogICAgICAgICBwcmludGso
IkNNRExJTkVbJSJQUklwYWRkciJdOiVzICVzXG4iLCBjbWRzLT5jbWRsaW5lW2ldLnN0YXJ0LAot
LSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
