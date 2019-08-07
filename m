Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E04084055
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:38:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAqe-0001Qe-Vb; Wed, 07 Aug 2019 01:34:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAqd-0001Oh-Ji
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:39 +0000
X-Inumbo-ID: 84e8f18f-b8b3-11e9-8980-bc764e045a96
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 84e8f18f-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:38 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id z14so5311309pga.5
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=66nLgLSrAAtLnk7heFQOXwTIycZbzywZGh2gpdUQtHA=;
 b=hGadGekT36tWWF2x+rPXatg5Phju1cJkPhVohpTnvU9xcLgSYz3c/H9JfBuvb/eqpQ
 gJm9ULhd1h25PBFy4ZlpC+tAGAEAzuKiPxwK1X6/dMDelBe1FYe+sUe691h23Hpm09qn
 NtkXw7G9BBhwySB0UzQpKOHO5RlAvdX8JQycevy+XDQPWxcX8dLLfHqYFlfiIf28POCQ
 XQLWbzezNK3qTnHI7eGrMbtyoSKY/W2T3jkcfT5nC0QYcZ+CMjkTw7ZL3pOdyAZGwJLx
 tXBADMMsq1ukRK67JdNPKq0uGvf0IBEzyL0wmcyHhzZLuqxNXwAHA+z0PFrP2wNDYOQy
 6sYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=66nLgLSrAAtLnk7heFQOXwTIycZbzywZGh2gpdUQtHA=;
 b=EdbxL8OLPBfTH0wZPmEhHrLvL4T494ydgM7hiwyZacBTntdme6pj6bq7IPy77sdaTr
 QG8d5enfssebhW4rH1nWO1hRburjfeXCWPdaMoDtsrOPE6vhbavnK+pjzmj4hyRhmSE7
 g/kF6+RzaJYj0sRhVW31Qd+hAi2/KMeKI7NYs5bunZyl4xPxlKd0wFW9W+t2qnQrYaYz
 cDl2SV8KHL9DkBkOpqRERURKkI213AGvOzoOYoWpSqcveH+X32DBhdUqyOB4sj4myvNJ
 0V3a6Esirs4C4c7dGwyeSJ2Sqjt6d4YgB7lpBeXgDMLjLjV8o0H6VlSWvjVylP5eoVYm
 Bi8A==
X-Gm-Message-State: APjAAAVhzMSklythgyV9sgi0LopAmhoACn8IJ9/q3Ah0uvqifFHb+XQU
 H4Hff8xIBYdtJd83+zci7qatwDJF
X-Google-Smtp-Source: APXvYqxVqy6uPNA5pMhiCuVlDYKPDVYd5IZkwA2Cp9U8q1WFZ9BX6VmEjp+QCN9e6zqU7bkXXXxyWA==
X-Received: by 2002:aa7:9197:: with SMTP id x23mr6650509pfa.95.1565141677758; 
 Tue, 06 Aug 2019 18:34:37 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:37 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:32 -0700
Message-Id: <20190807013340.9706-34-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 33/41] fs/nfs: convert put_page() to
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
Cc: Calum Mackay <calum.mackay@oracle.com>, linux-fbdev@vger.kernel.org,
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
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
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpSZXZpZXdlZC1i
eTogQ2FsdW0gTWFja2F5IDxjYWx1bS5tYWNrYXlAb3JhY2xlLmNvbT4KCkNjOiBUcm9uZCBNeWts
ZWJ1c3QgPHRyb25kLm15a2xlYnVzdEBoYW1tZXJzcGFjZS5jb20+CkNjOiBBbm5hIFNjaHVtYWtl
ciA8YW5uYS5zY2h1bWFrZXJAbmV0YXBwLmNvbT4KQ2M6IGxpbnV4LW5mc0B2Z2VyLmtlcm5lbC5v
cmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0K
IGZzL25mcy9kaXJlY3QuYyB8IDExICsrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL25mcy9kaXJlY3QuYyBi
L2ZzL25mcy9kaXJlY3QuYwppbmRleCAwY2I0NDI0MDYxNjguLmMwYzFiOWYyYzA2OSAxMDA2NDQK
LS0tIGEvZnMvbmZzL2RpcmVjdC5jCisrKyBiL2ZzL25mcy9kaXJlY3QuYwpAQCAtMjc2LDEzICsy
NzYsNiBAQCBzc2l6ZV90IG5mc19kaXJlY3RfSU8oc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3Qg
aW92X2l0ZXIgKml0ZXIpCiAJcmV0dXJuIG5mc19maWxlX2RpcmVjdF93cml0ZShpb2NiLCBpdGVy
KTsKIH0KIAotc3RhdGljIHZvaWQgbmZzX2RpcmVjdF9yZWxlYXNlX3BhZ2VzKHN0cnVjdCBwYWdl
ICoqcGFnZXMsIHVuc2lnbmVkIGludCBucGFnZXMpCi17Ci0JdW5zaWduZWQgaW50IGk7Ci0JZm9y
IChpID0gMDsgaSA8IG5wYWdlczsgaSsrKQotCQlwdXRfcGFnZShwYWdlc1tpXSk7Ci19Ci0KIHZv
aWQgbmZzX2luaXRfY2luZm9fZnJvbV9kcmVxKHN0cnVjdCBuZnNfY29tbWl0X2luZm8gKmNpbmZv
LAogCQkJICAgICAgc3RydWN0IG5mc19kaXJlY3RfcmVxICpkcmVxKQogewpAQCAtNTEyLDcgKzUw
NSw3IEBAIHN0YXRpYyBzc2l6ZV90IG5mc19kaXJlY3RfcmVhZF9zY2hlZHVsZV9pb3ZlYyhzdHJ1
Y3QgbmZzX2RpcmVjdF9yZXEgKmRyZXEsCiAJCQlwb3MgKz0gcmVxX2xlbjsKIAkJCWRyZXEtPmJ5
dGVzX2xlZnQgLT0gcmVxX2xlbjsKIAkJfQotCQluZnNfZGlyZWN0X3JlbGVhc2VfcGFnZXMocGFn
ZXZlYywgbnBhZ2VzKTsKKwkJcHV0X3VzZXJfcGFnZXMocGFnZXZlYywgbnBhZ2VzKTsKIAkJa3Zm
cmVlKHBhZ2V2ZWMpOwogCQlpZiAocmVzdWx0IDwgMCkKIAkJCWJyZWFrOwpAQCAtOTM1LDcgKzky
OCw3IEBAIHN0YXRpYyBzc2l6ZV90IG5mc19kaXJlY3Rfd3JpdGVfc2NoZWR1bGVfaW92ZWMoc3Ry
dWN0IG5mc19kaXJlY3RfcmVxICpkcmVxLAogCQkJcG9zICs9IHJlcV9sZW47CiAJCQlkcmVxLT5i
eXRlc19sZWZ0IC09IHJlcV9sZW47CiAJCX0KLQkJbmZzX2RpcmVjdF9yZWxlYXNlX3BhZ2VzKHBh
Z2V2ZWMsIG5wYWdlcyk7CisJCXB1dF91c2VyX3BhZ2VzKHBhZ2V2ZWMsIG5wYWdlcyk7CiAJCWt2
ZnJlZShwYWdldmVjKTsKIAkJaWYgKHJlc3VsdCA8IDApCiAJCQlicmVhazsKLS0gCjIuMjIuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
