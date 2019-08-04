Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C18380E2C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:53:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPJn-0003VN-JR; Sun, 04 Aug 2019 22:49:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPJm-0003V2-LN
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:49:34 +0000
X-Inumbo-ID: 20a351d4-b70a-11e9-8980-bc764e045a96
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 20a351d4-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:49:34 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id t132so38659644pgb.9
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5vxuyadJL7U7uLaLdbmi0wM48++CcjfxvCZKqh2vh4A=;
 b=SmLYPFHmKN1uE643ZHBnB9dNk1rkYQS38le9bhNsjkuijth7hTQM++IPMv3pLW0TEI
 7/x46VCEIatXmkV3w2KshE0imX/kUzrth+ucng6DZOKNE0opT13YpOAAUVZVUjGyDlRy
 PB2Ml2hj6K3sDNS5iK8QIe0u19usMs5R4F7ygDzoCAKAQPcQlfC/e9zMHKVg/PGP6KNH
 jH8S8rBi9/AhB/tXE8C3wWfrNrkZfmcdnxjHGl0d8mZOAczH5is/McK+cj5KFruHwe2c
 MlwNgBe4BfI2d4CuM85b0u6u4v6w/IVsnWdV3/DEzbLrJ3+c49m+Mf//mO5waQdOc/o0
 4mBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5vxuyadJL7U7uLaLdbmi0wM48++CcjfxvCZKqh2vh4A=;
 b=gdVWi3f+b5FqNUT8btDt8uQS2kuYmCMqxF95XrLAS/Il8m2hygf62ZF8Rev+xj5Z4D
 WVYB/Td+j09+UiassybVKeTVSZzYLxhTnjJn+/HdYTy+F54jtUT6aQDMI4aZb3hoL/BA
 dRmeTJ52nJuxD2KlQ4nGi0apYIblSTQ19mA6QqjYd8Z/eU9yDGc5s9bwsS2zvK9OMuJS
 kMdvYgZQfVtJunX2jmsEcU0A9GXcmyGm9WSIpRcgnG85aJ/+NqvBoxEzdgpqshEPEMrp
 bgkAG6Gp0tYcpeLqstmC1WpYw/3GcO1hX/H8mjQb/LyabwMbJ8bQFuImTE6ZJT97cB0P
 z3XQ==
X-Gm-Message-State: APjAAAWxpeXcs102CVeX3BNedeITH/tiiqpI0dzfQrgcDO/IhI8yr+AF
 DHuJC5094vmG9BxI2Mp7X8o=
X-Google-Smtp-Source: APXvYqx8ZWVr6MlzhqOcGh2E3H/RsN7D9i6b3t0CUjOfGBvpDNUsLBn0LfDPCNpJqri3cJedM4xZQw==
X-Received: by 2002:a63:1b56:: with SMTP id b22mr16835931pgm.265.1564958973404; 
 Sun, 04 Aug 2019 15:49:33 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:32 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:48:50 -0700
Message-Id: <20190804224915.28669-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 09/34] media/v4l2-core/mm: convert put_page()
 to put_user_page*()
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Hans Verkuil <hans.verkuil@cisco.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogTWF1cm8g
Q2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+CkNjOiBLZWVzIENvb2sgPGtlZXNj
b29rQGNocm9taXVtLm9yZz4KQ2M6IEhhbnMgVmVya3VpbCA8aGFucy52ZXJrdWlsQGNpc2NvLmNv
bT4KQ2M6IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4KQ2M6IEph
biBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0u
Y29tPgpDYzogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+CkNjOiBEYW4g
V2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IGxpbnV4LW1lZGlhQHZnZXIu
a2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5j
b20+Ci0tLQogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLXNnLmMgfCAzICst
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jIGIvZHJpdmVy
cy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLXNnLmMKaW5kZXggNjZhNmM2YzIzNmE3Li5k
NmVlYjQzN2VjMTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVm
LWRtYS1zZy5jCisrKyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5j
CkBAIC0zNDksOCArMzQ5LDcgQEAgaW50IHZpZGVvYnVmX2RtYV9mcmVlKHN0cnVjdCB2aWRlb2J1
Zl9kbWFidWYgKmRtYSkKIAlCVUdfT04oZG1hLT5zZ2xlbik7CiAKIAlpZiAoZG1hLT5wYWdlcykg
ewotCQlmb3IgKGkgPSAwOyBpIDwgZG1hLT5ucl9wYWdlczsgaSsrKQotCQkJcHV0X3BhZ2UoZG1h
LT5wYWdlc1tpXSk7CisJCXB1dF91c2VyX3BhZ2VzKGRtYS0+cGFnZXMsIGRtYS0+bnJfcGFnZXMp
OwogCQlrZnJlZShkbWEtPnBhZ2VzKTsKIAkJZG1hLT5wYWdlcyA9IE5VTEw7CiAJfQotLSAKMi4y
Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
