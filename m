Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E4C7EB18
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:17:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxZ-0005sK-7O; Fri, 02 Aug 2019 04:14:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBM-00076x-BK
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:36 +0000
X-Inumbo-ID: 1bcae356-b4cc-11e9-8980-bc764e045a96
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1bcae356-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:34 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c3so12016288pfa.13
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6zqhiQUR/t5HSZML/x55nFGZKGW5GK1LULKEmO0k7kA=;
 b=F6zwcO4LIlIH0MhJxHttCJTdvFyVFQT/4arw8VEiUMf3H4eEoUX+759aMNEB4E5yQk
 Nz2fCbsNakzpI2Ix1oQ23cChuh59P2OEpLwWSX6x9IY/wvMOZe6lEWSb2zFdzp0gprdi
 y9rnyWNc6RyhaZMvzhG8ve4bXMhMFks51tm4rHvgstN2tswx5ZOG0+I0UrLn8K8liKz6
 o59abaE04tV7AfXXxMZta+A8VG8S0kkDg1uyI4tR9b3t+a4fVwe1pYra9FjftWzgoUTS
 x4tLp6R3lAg/evT8dl18ZgG3qJOUMIaQFDribAsCQyGjHMfkpuycFyZQ36o14QJqnxy+
 vrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6zqhiQUR/t5HSZML/x55nFGZKGW5GK1LULKEmO0k7kA=;
 b=LpoN0nyIVytRB5ixCfKqjCwTBjFQX/r5jAsGe5ZTjJ+sBcF8IzRs5MuowNnQrOzi3j
 2BohrDicK2yklBY/jJjBusTyWbxIdS+5GicsZO8NiB0RCq84QTFc9Jr3xnI43nG0lTot
 WPDtBD0lhzp+8QqQC9nsbuh4L+MuPdyrg98SAfO0w68xtA+Pelj9Moa3qunrF4drCpC9
 yy5e6fGxaY+jtn6QhC4BWItvqgLXtlMjqNFos/60ZYHA1v2ckkP2rpONb14BwFoDz/1R
 +o89eZPWwHVeRYqF9P67fYw2UC1iJBnSvUpOeh4VjQDI8ZWLU2QZnEjW8/B2qqeWlle4
 nyAQ==
X-Gm-Message-State: APjAAAUURkdo6haMXeddlnl6852C+JPd/43JJwEr1vjCbtbmTj0faEH8
 BJS5bYM5DamTv6L1fh62hIU=
X-Google-Smtp-Source: APXvYqxawjrrBWhVHWqru35UkhsNUwOEktD3Ze9ukSGMVZSHmBDx+KHUyZVGOPhrL6EFpIA4EvvUgw==
X-Received: by 2002:a63:b64:: with SMTP id a36mr113099405pgl.215.1564712434076; 
 Thu, 01 Aug 2019 19:20:34 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:33 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:45 -0700
Message-Id: <20190802022005.5117-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 14/34] oradax: convert put_page() to
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
