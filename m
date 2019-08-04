Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9B780E39
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:53:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPKR-00051t-CW; Sun, 04 Aug 2019 22:50:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPKQ-00050I-65
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:50:14 +0000
X-Inumbo-ID: 3834969b-b70a-11e9-8980-bc764e045a96
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3834969b-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:50:13 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id w3so1455498pgt.13
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cegKTIaYJ+tSle0YiC1yJpybmvJrVZXG5Xryw9OToL0=;
 b=aCkaquioWJVgZ9oxi+kgs0xYn9XvezpV99sLT07IcNs8SpVl8RxEWxB8NfzIRBrjBL
 2B4dJHw2cG5TO6qtCk6u4ZcIwavE5x+pbFyHjAA9Gawo5yJz/cR/RN7KLFsBrzcuwVZV
 WP2fTbo7D/YmdMo3LfJiKW1AjSHc3oDEIZmC59HJW1UrPrOWaY8WJXtwgsxilT0195Uq
 ocw3UqvOC5KedpAwMEgqM2mZYVxGq6/tGgBNtuTtcR3B451sP4Bb3FZmj7gUlwzeWEUc
 XzVXXNThe+NP4na45hxvXL3T6bslaXSJNEyIhO73A4aiizrSPKRgEZ7pYwnnfabRC/Y3
 oqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cegKTIaYJ+tSle0YiC1yJpybmvJrVZXG5Xryw9OToL0=;
 b=oC3kz4ZZ4rMjRoOjiBLhGAABCut+RWJmJdKN1A72miJ68fx4ru/AnEVd642CUm7i/R
 8PXC+bJYRYElR69s5hki3ijs3g9XLz1jJHtDAeQe+sqzrHHN87pWwovG4R55h1b2rUyV
 9tqCDIeNgVhj5psLTJZOgN+23LqL32OQ5wpEUCAx1o+8hkz7Sf+tG3c/PDgqVt7EdXvk
 vAo8PfUu8GqmfZV+UN0g3rGmlal6Jwumbk/Dw9kJk0h3js7xZMLTytpTd1eXrezg5L8Z
 iho+NNAETNhuo3B36bjUbec9RhWyER+NrQfpW/DhDWDEiyFsxcUnO1FP3BkCYv/5OLVf
 fKhg==
X-Gm-Message-State: APjAAAVSvaCyLrtG+xJknCIUa/CZr6RpIxMfFwn3T3IfpkXVzPzJ8P18
 RPTlS2uBhxkWN48oVLu4/GU=
X-Google-Smtp-Source: APXvYqwQo0taKdXUQzpI7809Qn44c5UC2qpj3t9n7qUuNadX/5xLSvSBDLCQnHDNoFHPmzlJl8WofQ==
X-Received: by 2002:a17:90a:2767:: with SMTP id
 o94mr14743655pje.25.1564959012976; 
 Sun, 04 Aug 2019 15:50:12 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.50.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:12 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:49:15 -0700
Message-Id: <20190804224915.28669-35-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 34/34] fs/binfmt_elf: convert put_page() to
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgoKRm9yIHBhZ2VzIHRoYXQgd2Vy
ZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMKdmlh
IHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0X3Bh
Z2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29udmVy
c2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9kdWNl
IHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpnZXRfZHVtcF9wYWdl
IGNhbGxzIGdldF91c2VyX3BhZ2Ugc28gcHV0X3VzZXJfcGFnZSBtdXN0IGJlIHVzZWQKdG8gbWF0
Y2guCgpTaWduZWQtb2ZmLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBmcy9iaW5m
bXRfZWxmLmMgICAgICAgfCAyICstCiBmcy9iaW5mbXRfZWxmX2ZkcGljLmMgfCAyICstCiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9mcy9iaW5mbXRfZWxmLmMgYi9mcy9iaW5mbXRfZWxmLmMKaW5kZXggZDRlMTFiMmUwNGY2Li45
MmU0YTVjYTk5ZDggMTAwNjQ0Ci0tLSBhL2ZzL2JpbmZtdF9lbGYuYworKysgYi9mcy9iaW5mbXRf
ZWxmLmMKQEAgLTIzNzcsNyArMjM3Nyw3IEBAIHN0YXRpYyBpbnQgZWxmX2NvcmVfZHVtcChzdHJ1
Y3QgY29yZWR1bXBfcGFyYW1zICpjcHJtKQogCQkJCXZvaWQgKmthZGRyID0ga21hcChwYWdlKTsK
IAkJCQlzdG9wID0gIWR1bXBfZW1pdChjcHJtLCBrYWRkciwgUEFHRV9TSVpFKTsKIAkJCQlrdW5t
YXAocGFnZSk7Ci0JCQkJcHV0X3BhZ2UocGFnZSk7CisJCQkJcHV0X3VzZXJfcGFnZShwYWdlKTsK
IAkJCX0gZWxzZQogCQkJCXN0b3AgPSAhZHVtcF9za2lwKGNwcm0sIFBBR0VfU0laRSk7CiAJCQlp
ZiAoc3RvcCkKZGlmZiAtLWdpdCBhL2ZzL2JpbmZtdF9lbGZfZmRwaWMuYyBiL2ZzL2JpbmZtdF9l
bGZfZmRwaWMuYwppbmRleCBkODZlYmQwZGNjM2QuLjMyMTcyNGIzYmUyMiAxMDA2NDQKLS0tIGEv
ZnMvYmluZm10X2VsZl9mZHBpYy5jCisrKyBiL2ZzL2JpbmZtdF9lbGZfZmRwaWMuYwpAQCAtMTUx
MSw3ICsxNTExLDcgQEAgc3RhdGljIGJvb2wgZWxmX2ZkcGljX2R1bXBfc2VnbWVudHMoc3RydWN0
IGNvcmVkdW1wX3BhcmFtcyAqY3BybSkKIAkJCQl2b2lkICprYWRkciA9IGttYXAocGFnZSk7CiAJ
CQkJcmVzID0gZHVtcF9lbWl0KGNwcm0sIGthZGRyLCBQQUdFX1NJWkUpOwogCQkJCWt1bm1hcChw
YWdlKTsKLQkJCQlwdXRfcGFnZShwYWdlKTsKKwkJCQlwdXRfdXNlcl9wYWdlKHBhZ2UpOwogCQkJ
fSBlbHNlIHsKIAkJCQlyZXMgPSBkdW1wX3NraXAoY3BybSwgUEFHRV9TSVpFKTsKIAkJCX0KLS0g
CjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
