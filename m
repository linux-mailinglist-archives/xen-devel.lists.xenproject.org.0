Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FE184084
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:38:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvApr-0000NS-I4; Wed, 07 Aug 2019 01:33:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvApp-0000MX-93
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:33:49 +0000
X-Inumbo-ID: 67485a80-b8b3-11e9-8980-bc764e045a96
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 67485a80-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:33:48 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id a93so38527261pla.7
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SsIRGkPWeq5HvTZzTxF/TGZYHjIKFiRIBMhKcsnvtic=;
 b=oy39nkO9q1zN/Pd7fO3C4Y4Vuneozl9x+qPetN0JbILtppFPMIJXMHmaepq54m3Jyf
 dGw1nmQHR/jSbWupXGSsRUasNJHlcTqjhcU1O3ugIdE2PmE9G2UKn/efT28f7zQkZ/Ek
 6jjzfDGA5QraOK0hXzeRVBVVIV3bR/w8Kh69UQWoMH+W+Rs7nDww5sxmxjDiUlnV+Y3J
 JNNDHJK/Y4qoZIHDRhd8qo6y5WM/sdBlLMt8Tk0CmXA/ZqUqxMK+oSWhp+t1g0ER8Qps
 3F4GSUTyaFhoBkjoAMVyL8y9bOwlhzuxjjb1EKe6sSD4G4rjFtE3kxZ1sD03IRQMEghY
 QO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SsIRGkPWeq5HvTZzTxF/TGZYHjIKFiRIBMhKcsnvtic=;
 b=ZLkwebzBYFmgvcdR5QcLyH6M6A7gexvZBtUtWIXZ5R1PGZ39hIbCntTV9eRKhPknFw
 tyleLdv2wKb2qVco8vDV5MJYk0w1Gpo07o8A4OY1aJCdhbSEte4PC/T3QLgO2zxFVzjr
 vz6w9KXxKfId6fN/0rSC9hBnk9luUMHrnNydFP2QNNhdirYuGD9CC4URI1N0JBWONRLd
 85WoAenUjK+oBv3v/zjANR/zgBs0LvVlGQ9GYSp34MeTW/wTzX2kLa5CTcZQP0A19L30
 3YfvnnHTNCHO5Hu+Ww8n/IhE7qh9R8CsyH2u34IJ+ow8+HC9cD3ASramfNl+dk3k5aGZ
 e4dA==
X-Gm-Message-State: APjAAAUJPNp1KLFeFU6wphfFYVNyPJiLkgq003k7W9YeOUWke4wrpKkj
 LUEZLeRAASmPGDV07mR8xrg=
X-Google-Smtp-Source: APXvYqxzrRdxX4nRlyikVVwrMH2CyIAMqdQl6neWQaDEBd9Z3PCuWH0kRX4lRsXl8HO2TxD71Nthng==
X-Received: by 2002:a17:902:1122:: with SMTP id
 d31mr172269pla.254.1565141627872; 
 Tue, 06 Aug 2019 18:33:47 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.33.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:33:47 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:01 -0700
Message-Id: <20190807013340.9706-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 02/41] drivers/gpu/drm/via: convert
 put_page() to put_user_page*()
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
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
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpBbHNvIHJldmVy
c2UgdGhlIG9yZGVyIG9mIGEgY29tcGFyaXNvbiwgaW4gb3JkZXIgdG8gcGxhY2F0ZQpjaGVja3Bh
dGNoLnBsLgoKQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYyB8IDEwICsrLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZG1hYmxpdC5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpYS92
aWFfZG1hYmxpdC5jCmluZGV4IDA2MjA2NzQzOGYxZC4uYjViNWJmMGJhNjVlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3ZpYS92aWFfZG1hYmxpdC5jCkBAIC0xNzEsNyArMTcxLDYgQEAgdmlhX21hcF9ibGl0X2Zvcl9k
ZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYsCiBzdGF0aWMgdm9pZAogdmlhX2ZyZWVfc2dfaW5m
byhzdHJ1Y3QgcGNpX2RldiAqcGRldiwgZHJtX3ZpYV9zZ19pbmZvX3QgKnZzZykKIHsKLQlzdHJ1
Y3QgcGFnZSAqcGFnZTsKIAlpbnQgaTsKIAogCXN3aXRjaCAodnNnLT5zdGF0ZSkgewpAQCAtMTg2
LDEzICsxODUsOCBAQCB2aWFfZnJlZV9zZ19pbmZvKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBkcm1f
dmlhX3NnX2luZm9fdCAqdnNnKQogCQlrZnJlZSh2c2ctPmRlc2NfcGFnZXMpOwogCQkvKiBmYWxs
IHRocm91Z2ggKi8KIAljYXNlIGRyX3ZpYV9wYWdlc19sb2NrZWQ6Ci0JCWZvciAoaSA9IDA7IGkg
PCB2c2ctPm51bV9wYWdlczsgKytpKSB7Ci0JCQlpZiAoTlVMTCAhPSAocGFnZSA9IHZzZy0+cGFn
ZXNbaV0pKSB7Ci0JCQkJaWYgKCFQYWdlUmVzZXJ2ZWQocGFnZSkgJiYgKERNQV9GUk9NX0RFVklD
RSA9PSB2c2ctPmRpcmVjdGlvbikpCi0JCQkJCVNldFBhZ2VEaXJ0eShwYWdlKTsKLQkJCQlwdXRf
cGFnZShwYWdlKTsKLQkJCX0KLQkJfQorCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHZzZy0+
cGFnZXMsIHZzZy0+bnVtX3BhZ2VzLAorCQkJCQkgICh2c2ctPmRpcmVjdGlvbiA9PSBETUFfRlJP
TV9ERVZJQ0UpKTsKIAkJLyogZmFsbCB0aHJvdWdoICovCiAJY2FzZSBkcl92aWFfcGFnZXNfYWxs
b2M6CiAJCXZmcmVlKHZzZy0+cGFnZXMpOwotLSAKMi4yMi4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
