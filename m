Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800BB80DFF
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:52:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPJw-0003ey-Rk; Sun, 04 Aug 2019 22:49:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPJv-0003bZ-8o
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:49:43 +0000
X-Inumbo-ID: 257c2864-b70a-11e9-8980-bc764e045a96
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 257c2864-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:49:42 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id r26so2707875pgl.10
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6zqhiQUR/t5HSZML/x55nFGZKGW5GK1LULKEmO0k7kA=;
 b=hu5YrExV2sbaBMNc30Tq7LBcjGDWN6fA4XsdWSIq37Gwal4TYkzXoLBSc1aN7i+AE1
 bVIm03I7zSnUPoNc0DrhbAQOAdTqkzN/WZ5+3xyT5kplICRjLk7gnM7AiECUFxJQtYf8
 l/vpyueUrdUTa6ElP3ExxKx8ue3ogMcet3zTMrly4eFXGYC31urxAGlYkrOSMCRCSnIc
 Arzc564JY6ON2HabMEPBcS/dFGMN4ODa4koUgN5YXXQfy4c5GL3kiXmJTl6qra2xMUY4
 X0U+ntdMZNCalKgfycF+64XZ+c1uJzhUDj8x9G9dxye9pgPlZzglleDcPGTS1gL3JdjR
 +zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6zqhiQUR/t5HSZML/x55nFGZKGW5GK1LULKEmO0k7kA=;
 b=Kv6JEens9ZjEd5YAQ6haWYsUA0shcBp51hmRChbzc028Vfk6+Ju7ir3ivUpLkSerFN
 OL78fsIDBF1G9zPWnpXKhqrccQW/wSqoX+DLRwLbzXqQwJDfIJXAZdSY+zmR7tMkRxaw
 Dh045uji4PdecVjvij7ELwTmK5StXHP7kAr/iYWykJ6DhIqdEcIvjte+q8W39ReXTyck
 UJEPviXJhtcl4bas6xHu9PvIJm4fLTkEd/E4EWbZ0baA5Y6Vgzrv075m3pyZGjX1Zkpv
 Av9+DtO3tT1BWXainwTsLJ5P9kOqtK+xsEXZLLFKgOwo2uLhJvcKQW3CLTznJeS0y2Zu
 XLtA==
X-Gm-Message-State: APjAAAVQeA75sgHlh5hd5zz9seo+QuP7wo9glGXrNxce1m+06oI/2Ht4
 G4VdUsuZ1texpEjQ5MshkAA=
X-Google-Smtp-Source: APXvYqzKlxaRYSDqTrQ5Buu3RAMAQLfm5nyXOzRFCQZdRK9SX2nPkzOnWKnTtQrduQ4tH9q8VfqmlA==
X-Received: by 2002:a62:b408:: with SMTP id h8mr68625605pfn.46.1564958981600; 
 Sun, 04 Aug 2019 15:49:41 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:41 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:48:55 -0700
Message-Id: <20190804224915.28669-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 14/34] oradax: convert put_page() to
 put_user_page*()
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
Cc: linux-fbdev@vger.kernel.org, Rob Gardner <rob.gardner@oracle.com>,
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Wei Yongjun <weiyongjun1@huawei.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Jonathan Helman <jonathan.helman@oracle.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogRGF2aWQg
Uy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0PgpDYzogSm9uYXRoYW4gSGVsbWFuIDxqb25h
dGhhbi5oZWxtYW5Ab3JhY2xlLmNvbT4KQ2M6IFJvYiBHYXJkbmVyIDxyb2IuZ2FyZG5lckBvcmFj
bGUuY29tPgpDYzogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgpD
YzogSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD4KQ2M6IFdlaSBZb25nanVuIDx3ZWl5
b25nanVuMUBodWF3ZWkuY29tPgpDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3Nh
bXN1bmdAa2VybmVsLm9yZz4KQ2M6IHNwYXJjbGludXhAdmdlci5rZXJuZWwub3JnClNpZ25lZC1v
ZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL3Ni
dXMvY2hhci9vcmFkYXguYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc2J1cy9jaGFyL29yYWRheC5jIGIv
ZHJpdmVycy9zYnVzL2NoYXIvb3JhZGF4LmMKaW5kZXggOGFmMjE2Mjg3YTg0Li4wMjllNjE5OTky
ZmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc2J1cy9jaGFyL29yYWRheC5jCisrKyBiL2RyaXZlcnMv
c2J1cy9jaGFyL29yYWRheC5jCkBAIC00MTIsNyArNDEyLDcgQEAgc3RhdGljIHZvaWQgZGF4X3Vu
bG9ja19wYWdlcyhzdHJ1Y3QgZGF4X2N0eCAqY3R4LCBpbnQgY2NiX2luZGV4LCBpbnQgbmVsZW0p
CiAJCQkJZGF4X2RiZygiZnJlZWluZyBwYWdlICVwIiwgcCk7CiAJCQkJaWYgKGogPT0gT1VUKQog
CQkJCQlzZXRfcGFnZV9kaXJ0eShwKTsKLQkJCQlwdXRfcGFnZShwKTsKKwkJCQlwdXRfdXNlcl9w
YWdlKHApOwogCQkJCWN0eC0+cGFnZXNbaV1bal0gPSBOVUxMOwogCQkJfQogCQl9Ci0tIAoyLjIy
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
