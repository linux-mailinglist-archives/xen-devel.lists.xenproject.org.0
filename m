Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1528480E32
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:53:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPK9-0003yW-JF; Sun, 04 Aug 2019 22:49:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPK7-0003wK-Qq
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:49:55 +0000
X-Inumbo-ID: 2cd81960-b70a-11e9-8980-bc764e045a96
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2cd81960-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:49:54 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t14so35655448plr.11
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3zvxFRr3gjg9t3ZKCwZWoMY3PeLUGF9FofBT0j+JfJs=;
 b=AoEeK7A3WmgkZN5yC8Z1Jl1RH2bH2yfr/Iui/v9Stf0ZewCCNe6BmkaFiQSbldZriZ
 wW6aM88ICV9MKKVMW7cufc693tFEoxlowWoPmOWeXRs1MOQDftxRpNdG7ZpLAs0zPCzH
 tfODbi7MeStQ2PUxDbHxfxCmnrrt0CpHHVErZgkFlHG1WBD9vc/idnDis+fOVKQL9lLN
 eIKxSh7vqFmdHH8HbCmTpqdNHN/40uH9dLamfPKCEqx0SSFV0Cay/FKPEfRs3UtCWLvV
 asJlUv7lGILmIRMgD+7Ndejmes/P11ltUT9gXu0ECiydPknotiGsbwT49fTUX3pXXK/J
 hBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3zvxFRr3gjg9t3ZKCwZWoMY3PeLUGF9FofBT0j+JfJs=;
 b=pbV6evhwFSJdmYiAvA3MR0hssPUgQ+YudnF6B/cNF30S1FKmrDb0D174oXy1XD44G0
 FQhftnH9wNzGmU5e3yqAVOuiyPVt2SDVVtW7AV0bkJlVALvEBsiz9Kuu90p/+XymP3x2
 PwpEFyRPhDBHjIEHuWjLI6/RbDSKrpVjBJf+C2d7qVtpmBRQNUUf6eXVM9fIYcJvVX05
 epo/giEc3Hofkskz4xElXds8fpNEqWgyim4iL9JKNWp/6iHgyvxx5yYVOhi+LUCv+nqQ
 JToWLg1zWdIUVvGj9f6MXZZ9h3swc6CYfDfgDrmiyvXheT3/tLItU5lBB/0i7TlenMKK
 ukOw==
X-Gm-Message-State: APjAAAVOwtx5J3Y3p2AUGQtakZhbB8zoLC4kR2YwHWN5MUrTsvrp7oT/
 moow9qX+XPxVW+mNTULNszs=
X-Google-Smtp-Source: APXvYqzibwwPUnTUuHH+RVhfMiDAHi4Mt1y6avGQzxyYdtLRtPBxbmwrSqheIPeJWHdiQ7pwZ9ajtA==
X-Received: by 2002:a17:902:9688:: with SMTP id
 n8mr138434091plp.227.1564958993951; 
 Sun, 04 Aug 2019 15:49:53 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:53 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:49:03 -0700
Message-Id: <20190804224915.28669-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 22/34] orangefs: convert put_page() to
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
