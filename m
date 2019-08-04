Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDA280E29
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:53:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPKB-00040r-1f; Sun, 04 Aug 2019 22:49:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPK9-0003yB-2z
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:49:57 +0000
X-Inumbo-ID: 2dd09e26-b70a-11e9-8980-bc764e045a96
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2dd09e26-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:49:56 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id i2so35707623plt.1
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lKIFYbXGeRFczJ7GPuSawhtMV9YIx2+MYUTps7oOTAE=;
 b=TDggbkgRiGIAFGZg+jjgHpzcEiYccMBQ6jptVLtuAINCBCAa7tBLSYJdtzRqQAkVQq
 tQ08R+kd1zAphQz9pkaaBX/hg9RvlkTaePPnO2E1bu2f/76JhzKynqi5fDXQgm3u+sje
 C80KY3nOvFeOz/PfxhVfGvol35idNxGJp30wpqdrZCtYSNKWJHD3OZzPkmpz9TZ2iydK
 zGtAdXJa7uyuK2GhTVtmCk46eJaIXB31IST9V3s1VEcpQHy9Y1uuVubQ/wNf6EoCYZeE
 iY7ztWwDS8B1eHyY4QnXS4dvWcICmGOtU1XZ3uVoXugfKVLMqqSM2fvbIrY7TrJ6h/xd
 OTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKIFYbXGeRFczJ7GPuSawhtMV9YIx2+MYUTps7oOTAE=;
 b=FMuuX9lPALb0vL15X8p4sZO24pqk1zFWxY/tWq3VEH/pG69vzj8oxfMdEghfVDuLZN
 uvVIECX1Kt/dCG/CihuzzwQ+StwzX7lff6H8llJFj5lFAL4oqvZjAvA5RBeasSq59zK6
 dJ2u3HaoK+tlfsnQg5iKvzkSkuCWy/HHy59zClWk7iLrnM0xhiIWpC1gUwJurqTEkDal
 SIpINSji6etin9IF4cCKRKW1GJ/fqg1nSGQq/qtRj98jYFdlbkFDCGUf8lgi/gVx2Nyy
 rIYs0wCDqnq3BVxFyFR8SEJThlV9RwRrsRfSx9cq9XWRg4A4ku/5O7PF+GgKsjgSQf7B
 7mkA==
X-Gm-Message-State: APjAAAVQWfKQSoOfWwtkgHv8WLF1V+dTFWWEEEf8O2kvDn+02OEtPL1i
 CaC+qGGPxzFYSKG+s9gyBFE=
X-Google-Smtp-Source: APXvYqxpyFBswVwCpmbWWUYW5zokWhx2pCk/sdTQw8977867DfmKTOqoiHBx6Glc/HUCem3kZHec6Q==
X-Received: by 2002:a17:902:8689:: with SMTP id
 g9mr131877551plo.252.1564958995585; 
 Sun, 04 Aug 2019 15:49:55 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:55 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:49:04 -0700
Message-Id: <20190804224915.28669-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 23/34] uprobes: convert put_page() to
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
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Namhyung Kim <namhyung@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogUGV0ZXIg
WmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJl
ZGhhdC5jb20+CkNjOiBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8gPGFjbWVAa2VybmVsLm9yZz4K
Q2M6IEFsZXhhbmRlciBTaGlzaGtpbiA8YWxleGFuZGVyLnNoaXNoa2luQGxpbnV4LmludGVsLmNv
bT4KQ2M6IEppcmkgT2xzYSA8am9sc2FAcmVkaGF0LmNvbT4KQ2M6IE5hbWh5dW5nIEtpbSA8bmFt
aHl1bmdAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgotLS0KIGtlcm5lbC9ldmVudHMvdXByb2Jlcy5jIHwgNiArKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
a2VybmVsL2V2ZW50cy91cHJvYmVzLmMgYi9rZXJuZWwvZXZlbnRzL3Vwcm9iZXMuYwppbmRleCA4
NGZhMDA0OTdjNDkuLjRhNTc1ZGU4Y2VjOCAxMDA2NDQKLS0tIGEva2VybmVsL2V2ZW50cy91cHJv
YmVzLmMKKysrIGIva2VybmVsL2V2ZW50cy91cHJvYmVzLmMKQEAgLTM5Nyw3ICszOTcsNyBAQCBf
X3VwZGF0ZV9yZWZfY3RyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHZhZGRy
LCBzaG9ydCBkKQogCXJldCA9IDA7CiBvdXQ6CiAJa3VubWFwX2F0b21pYyhrYWRkcik7Ci0JcHV0
X3BhZ2UocGFnZSk7CisJcHV0X3VzZXJfcGFnZShwYWdlKTsKIAlyZXR1cm4gcmV0OwogfQogCkBA
IC01MDQsNyArNTA0LDcgQEAgaW50IHVwcm9iZV93cml0ZV9vcGNvZGUoc3RydWN0IGFyY2hfdXBy
b2JlICphdXByb2JlLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAlyZXQgPSBfX3JlcGxhY2VfcGFn
ZSh2bWEsIHZhZGRyLCBvbGRfcGFnZSwgbmV3X3BhZ2UpOwogCXB1dF9wYWdlKG5ld19wYWdlKTsK
IHB1dF9vbGQ6Ci0JcHV0X3BhZ2Uob2xkX3BhZ2UpOworCXB1dF91c2VyX3BhZ2Uob2xkX3BhZ2Up
OwogCiAJaWYgKHVubGlrZWx5KHJldCA9PSAtRUFHQUlOKSkKIAkJZ290byByZXRyeTsKQEAgLTE5
ODEsNyArMTk4MSw3IEBAIHN0YXRpYyBpbnQgaXNfdHJhcF9hdF9hZGRyKHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHZhZGRyKQogCQlyZXR1cm4gcmVzdWx0OwogCiAJY29weV9m
cm9tX3BhZ2UocGFnZSwgdmFkZHIsICZvcGNvZGUsIFVQUk9CRV9TV0JQX0lOU05fU0laRSk7Ci0J
cHV0X3BhZ2UocGFnZSk7CisJcHV0X3VzZXJfcGFnZShwYWdlKTsKICBvdXQ6CiAJLyogVGhpcyBu
ZWVkcyB0byByZXR1cm4gdHJ1ZSBmb3IgYW55IHZhcmlhbnQgb2YgdGhlIHRyYXAgaW5zbiAqLwog
CXJldHVybiBpc190cmFwX2luc24oJm9wY29kZSk7Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
