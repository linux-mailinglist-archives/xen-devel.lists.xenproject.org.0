Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF607EB21
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:17:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxb-0005to-Ix; Fri, 02 Aug 2019 04:14:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBY-000799-Be
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:48 +0000
X-Inumbo-ID: 230ac59e-b4cc-11e9-8980-bc764e045a96
Received: from mail-pf1-x443.google.com (unknown [2607:f8b0:4864:20::443])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 230ac59e-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:47 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id i189so35157399pfg.10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3zvxFRr3gjg9t3ZKCwZWoMY3PeLUGF9FofBT0j+JfJs=;
 b=bFa24Z5mQSzxC4eOzJ4+7AblweRywqOmLHClqtb5KdjCAjd1PUSEw/ZsQSQOyWjUsC
 1nWyBkhFn3Be02SULNTaYtTCG2J6o3/uRCn091UpjmhLyF7xPQy8wXw/xt4PRY9wiXXM
 V1nMLk4YhEUMXleXPkZw51V9rlN393l9K+gVXIZUF6ECoqP/Y8CZfCnooK6DgUB0tUD4
 eFt7VWtlBH1sk6kipujvSPJHkQR53+eHLV2iAcuMnAVCEWZM24hHRYthkAG8xQ/D08vi
 iFZfyGckqNCA5JtaUEszagJMdsqH6lCds+G1LZm6Cvnsgs6SuhZpo2MKRXwMzsClRxnN
 IVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3zvxFRr3gjg9t3ZKCwZWoMY3PeLUGF9FofBT0j+JfJs=;
 b=mhskpaCTc4FpTSDnfaFxWtC05PIi7WD9bX04t7TRmculGNI389aZhcS01ASDJyrl93
 UxmMO3nzNho3KUIf3nazA36ivxjPit/fq1z//EkSinkG88kbs9bbHEYZR3ndEjB6Ysq0
 fj/eFzx7pBTBY8mU0xxOrxJFRWRhCu1D1QLtUNDUAWJsMkj+8S7eqXmnRfgidpZ/zOiU
 ah12VM4Aule4wRG0glUfycrS9G/Dy2WGVGR6fbxZjCSbhr1eJs2NykwscwXDUriXh9Qc
 1yfw18eF/AVuKA80jjnYTV2BdM3w5O6tATANw2Cn/FeLwfQKXyf8VTw4FapUNttMA0tY
 KZ7w==
X-Gm-Message-State: APjAAAU8ksAtKv3XRKcKMt5t8Zb3Dh+CWw1S/1dRSNhQh+kUXcH+4YEt
 G3lfuJY9kq4Hs8VPmwictLY=
X-Google-Smtp-Source: APXvYqxR/U1dL3txs9pGjSe+FwW9uMtR0k4KNaBNNpf6pbzUbZzBuQi9NPNfHMjGx+8Bx8bZmFuKIw==
X-Received: by 2002:a17:90a:8c18:: with SMTP id
 a24mr1817929pjo.111.1564712446323; 
 Thu, 01 Aug 2019 19:20:46 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:45 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:53 -0700
Message-Id: <20190802022005.5117-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 22/34] orangefs: convert put_page() to
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
Cc: Martin Brandenburg <martin@omnibond.com>, linux-fbdev@vger.kernel.org,
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
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

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogTWlrZSBN
YXJzaGFsbCA8aHViY2FwQG9tbmlib25kLmNvbT4KQ2M6IE1hcnRpbiBCcmFuZGVuYnVyZyA8bWFy
dGluQG9tbmlib25kLmNvbT4KQ2M6IGRldmVsQGxpc3RzLm9yYW5nZWZzLm9yZwpTaWduZWQtb2Zm
LWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZnMvb3JhbmdlZnMv
b3JhbmdlZnMtYnVmbWFwLmMgfCA3ICsrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvb3JhbmdlZnMvb3JhbmdlZnMt
YnVmbWFwLmMgYi9mcy9vcmFuZ2Vmcy9vcmFuZ2Vmcy1idWZtYXAuYwppbmRleCAyYmI5MTZkNjg1
NzYuLmYyZjMzYTE2ZDYwNCAxMDA2NDQKLS0tIGEvZnMvb3JhbmdlZnMvb3JhbmdlZnMtYnVmbWFw
LmMKKysrIGIvZnMvb3JhbmdlZnMvb3JhbmdlZnMtYnVmbWFwLmMKQEAgLTE2OCwxMCArMTY4LDcg
QEAgc3RhdGljIERFRklORV9TUElOTE9DSyhvcmFuZ2Vmc19idWZtYXBfbG9jayk7CiBzdGF0aWMg
dm9pZAogb3JhbmdlZnNfYnVmbWFwX3VubWFwKHN0cnVjdCBvcmFuZ2Vmc19idWZtYXAgKmJ1Zm1h
cCkKIHsKLQlpbnQgaTsKLQotCWZvciAoaSA9IDA7IGkgPCBidWZtYXAtPnBhZ2VfY291bnQ7IGkr
KykKLQkJcHV0X3BhZ2UoYnVmbWFwLT5wYWdlX2FycmF5W2ldKTsKKwlwdXRfdXNlcl9wYWdlcyhi
dWZtYXAtPnBhZ2VfYXJyYXksIGJ1Zm1hcC0+cGFnZV9jb3VudCk7CiB9CiAKIHN0YXRpYyB2b2lk
CkBAIC0yODAsNyArMjc3LDcgQEAgb3JhbmdlZnNfYnVmbWFwX21hcChzdHJ1Y3Qgb3JhbmdlZnNf
YnVmbWFwICpidWZtYXAsCiAKIAkJZm9yIChpID0gMDsgaSA8IHJldDsgaSsrKSB7CiAJCQlTZXRQ
YWdlRXJyb3IoYnVmbWFwLT5wYWdlX2FycmF5W2ldKTsKLQkJCXB1dF9wYWdlKGJ1Zm1hcC0+cGFn
ZV9hcnJheVtpXSk7CisJCQlwdXRfdXNlcl9wYWdlKGJ1Zm1hcC0+cGFnZV9hcnJheVtpXSk7CiAJ
CX0KIAkJcmV0dXJuIC1FTk9NRU07CiAJfQotLSAKMi4yMi4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
