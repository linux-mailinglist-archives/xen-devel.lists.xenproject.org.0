Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EEDCF051
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 03:18:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHe5h-0001PP-TW; Tue, 08 Oct 2019 01:15:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M61b=YB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iHe5g-0001Ov-76
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 01:15:04 +0000
X-Inumbo-ID: 0e3ade40-e969-11e9-97c0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e3ade40-e969-11e9-97c0-12813bfff9fa;
 Tue, 08 Oct 2019 01:15:03 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A311A21721;
 Tue,  8 Oct 2019 01:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570497302;
 bh=hiQQh+2Zwz+zNsgQjAOGWyiMN6Jk+cTk9K7Etev5C1o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YkqwjX+ezQJHy4Bizu9etCF1e+NTFbMtIHBWiFnLdl6l6QxTcBdhiwaDOlOmGJ8hf
 E95Bs2aErmMStNRY5Ywk7xvNd1azC98CKG+c+wb/YYSSUUY5BfA5uHO5GzRuPVHZMz
 YyQoGW6HXGAl/weagioW8HRNec8Ok25Ffto73LdI=
From: Stefano Stabellini <sstabellini@kernel.org>
To: Julien.Grall@arm.com
Date: Mon,  7 Oct 2019 18:15:00 -0700
Message-Id: <20191008011501.21038-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1910071811320.13684@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910071811320.13684@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v2 2/3] xen/arm: make_memory_node return error
 on nr_banks == 0
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2FsbCBtYWtlX21lbW9yeV9ub2RlIGZvciByZXNlcnZlZF9tZW1vcnkgb25seSBpZiB3ZSBhY3R1
YWxseSBoYXZlIGFueQpyZXNlcnZlZF9tZW1vcnkgcmVnaW9ucyB0byBoYW5kbGUuCgpBZGQgYSBj
aGVjayBpbiBtYWtlX21lbW9yeV9ub2RlIHRvIHJldHVybiBhbiBlcnJvciBpZiBpdCBoYXMgYmVl
biBjYWxsZWQKd2l0aCBubyBtZW1vcnkgYmFua3MgYXMgYXJndW1lbnQuCgpGaXhlczogMjQ4ZmFh
NjM3ZDIgKHhlbi9hcm06IGFkZCByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyB0byB0aGUgZG9tMCBt
ZW1vcnkgbm9kZSkKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0
YWJlbGxpbmlAeGlsaW54LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gcGF0Y2ggYWRkZWQKLS0t
CiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAxMyArKysrKysrKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwpp
bmRleCA2MDkyM2E3MDUxLi5lYTAxYWFkYTBiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCkBAIC02NTAsNiAr
NjUwLDggQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV9tZW1vcnlfbm9kZShjb25zdCBzdHJ1Y3Qg
ZG9tYWluICpkLAogICAgIF9fYmUzMiAqY2VsbHM7CiAKICAgICBCVUdfT04obnJfY2VsbHMgPj0g
QVJSQVlfU0laRShyZWcpKTsKKyAgICBpZiAoIG1lbS0+bnJfYmFua3MgPT0gMCApCisgICAgICAg
IHJldHVybiAtRU5PRU5UOwogCiAgICAgZHRfZHByaW50aygiQ3JlYXRlIG1lbW9yeSBub2RlIChy
ZWcgc2l6ZSAlZCwgbnIgY2VsbHMgJWQpXG4iLAogICAgICAgICAgICAgICAgcmVnX3NpemUsIG5y
X2NlbGxzKTsKQEAgLTE1NDAsMTAgKzE1NDIsMTMgQEAgc3RhdGljIGludCBfX2luaXQgaGFuZGxl
X25vZGUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKICAgICAg
ICAgICogQ3JlYXRlIGEgc2Vjb25kIG1lbW9yeSBub2RlIHRvIHN0b3JlIHRoZSByYW5nZXMgY292
ZXJpbmcKICAgICAgICAgICogcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMuCiAgICAgICAgICAqLwot
ICAgICAgICByZXMgPSBtYWtlX21lbW9yeV9ub2RlKGQsIGtpbmZvLT5mZHQsIGFkZHJjZWxscywg
c2l6ZWNlbGxzLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZib290aW5mby5yZXNl
cnZlZF9tZW0pOwotICAgICAgICBpZiAoIHJlcyApCi0gICAgICAgICAgICByZXR1cm4gcmVzOwor
ICAgICAgICBpZiAoIGJvb3RpbmZvLnJlc2VydmVkX21lbS5ucl9iYW5rcyA+IDAgKQorICAgICAg
ICB7CisgICAgICAgICAgICByZXMgPSBtYWtlX21lbW9yeV9ub2RlKGQsIGtpbmZvLT5mZHQsIGFk
ZHJjZWxscywgc2l6ZWNlbGxzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
Ym9vdGluZm8ucmVzZXJ2ZWRfbWVtKTsKKyAgICAgICAgICAgIGlmICggcmVzICkKKyAgICAgICAg
ICAgICAgICByZXR1cm4gcmVzOworICAgICAgICB9CiAgICAgfQogCiAgICAgcmVzID0gZmR0X2Vu
ZF9ub2RlKGtpbmZvLT5mZHQpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
