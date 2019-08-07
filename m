Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DFD84039
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:37:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAql-0001eS-40; Wed, 07 Aug 2019 01:34:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAqh-0001Xs-Pl
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:43 +0000
X-Inumbo-ID: 879d38ef-b8b3-11e9-8980-bc764e045a96
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 879d38ef-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:42 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c3so19359237pfa.13
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cegKTIaYJ+tSle0YiC1yJpybmvJrVZXG5Xryw9OToL0=;
 b=gZINIBPpiSlkU+80KFQT2S/tbeKnfN8Fqd69WGW6s9PoHlp7eF6XztSLcUxuW4oRoZ
 aif7qo6403jD2jU7LBsHpubuYdPGQryF8kiw1ZTc3iFqoyXR++oshdcjJ7vxHU3SStmv
 hRrnv/6QnmfU9YFS9vFfR/LY5o8S7tCbaokKkpmJCmaCQPMpBAUHfIH7veXkFUWyuI/D
 QxXzz4jXTjDqbca8hg8XrnqAJ/u2yXOWeQAohMq1NTArxvWPC4Z+YJ1UfdhghSe68uD6
 jg98gaM28Wf1Jgr/YOooV8Oz8uSBvPGIEINpe+ifSuk1KD3Z7HL09IvdAtxhoavy3yVQ
 XT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cegKTIaYJ+tSle0YiC1yJpybmvJrVZXG5Xryw9OToL0=;
 b=tnGLynu8IOHnuhTlFrmPtcw+beHBBrDIGoz4X7AwZ1w9+6ylF5VBKo8vMIGZcwC2Yd
 CHI8G9L+yziN57bIq2R3k/rRM7+x6AuUdEJY1SuZDS9Vd+0ki6q7LeuAs1iy7WT7uQfZ
 3dpEi423U9NNpJcqTZ3ZV1ik4hoxD88ZUpItdQ8CDsM/IBSZE1FWPH/mSxZYa8diqiaj
 ivqjhPwgTmOAxZNCQzF4iuKRIfjwCNKljyP+BEMDlTGoxbHwoaZLVjPkAa06jyGowFBr
 toGr8szvS7QQDQBe0SQQ/qH4ys9pHfUC/RRh946XZaPslLkUxEAJg3JA90nP3ohPlrNY
 ZJjA==
X-Gm-Message-State: APjAAAV5kFFr4HqdIT78TCiDv77Q2QlurNUYb7vmw8dkJf3T0yMfQmHx
 YvhujzcgoeNWYOTnxOmu+g0=
X-Google-Smtp-Source: APXvYqzSNe/bSKcNensRQ/IJ84TBXlUJvFYUKsvrq7/hKNH55OC+L+xYYWdqI5nDZFgfOlgeKmaOXw==
X-Received: by 2002:a65:6256:: with SMTP id q22mr5554856pgv.408.1565141682238; 
 Tue, 06 Aug 2019 18:34:42 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:41 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:35 -0700
Message-Id: <20190807013340.9706-37-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 36/41] fs/binfmt_elf: convert put_page() to
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
