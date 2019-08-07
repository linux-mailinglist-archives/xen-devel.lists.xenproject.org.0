Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1EF83FF9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:37:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAqr-0001r7-4W; Wed, 07 Aug 2019 01:34:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAqm-0001j5-El
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:48 +0000
X-Inumbo-ID: 8a6b6fff-b8b3-11e9-8980-bc764e045a96
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a6b6fff-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:47 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n9so36321737pgc.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H0Etnn7JHR8H7TocLV05oLauZ77NAi3PGTTr9FTaKTw=;
 b=eS3YB7ZT4YXwuCcgQbB/xbD+n10dBypw+iZZVQIUwi66vhDfcSIp39QkGkG7an7OJl
 OiukENJvNGRlLtpSvoOFB7XysgcSlBHri3dSlfLLl2JoybffI8wnImTZeHQEdnORxVLa
 EBXGZhIf+YSKbjfkupoovScD765pOoXW+wmQ3q47Y78G67P4azJFj7Z03p0IlFla0TF0
 WGS9epzDu3lNP0Hir82G8T/Dsucq+VMZQ717BtULEmOp/zZ+HeTgTfaZfag+K5X0r5bl
 +CKlJZyT3xTot1t0x6sX+RloIZlzVtbmPtAqvydRbxbh9+Ay6+ppy+Ss6WRVBPk23UrF
 ZgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H0Etnn7JHR8H7TocLV05oLauZ77NAi3PGTTr9FTaKTw=;
 b=BtHG26hQTCiBmrsMkFUjrSLavHfIITU+pg4Z+tKQVZEnRw+HTvuGI/7jMh6Ukqa6CQ
 D4KRg7Bu1inA/zjLVuY/X66WQiflkIrLIF1FN8A3yEH0EEHT6VcdUuxteWRiaXcBVsWK
 gc2GY9t+kmwVXXa56ITXSysfDTlovcxVoKKR6gWJvNdxyQPpMkW6VWzZOdhiW5wPmyC1
 QP1Hp3k5auU1K1/VKFMc9JjgDBNpXMmMQmLehhHjCRuP1z94H5K+TI9Wli9+NjF055SQ
 8P//CEUgnHgt9Xg1KvqOXngV1i3ylMuN4Tf4bhtwGfM1b9YJkxzD47CLeKw6u1kNX2E/
 MYCw==
X-Gm-Message-State: APjAAAXjnSFczXpmgjk8F+vZSY+X8guEA9wdWF6erCseTKHL+HIf+IGf
 ACramw2zgrZ7u4HJDFF24Pg=
X-Google-Smtp-Source: APXvYqzWWP/A0o9J09jCJjajCJWgGO/EPyZUANiBcpDufZXSuOwgzfu98JYNHWmK3CJ1oF9MD+qnUg==
X-Received: by 2002:aa7:8201:: with SMTP id k1mr6559788pfi.97.1565141687010;
 Tue, 06 Aug 2019 18:34:47 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:46 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:38 -0700
Message-Id: <20190807013340.9706-40-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 39/41] mm/mlock.c: convert put_page() to
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
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Daniel Black <daniel@linux.ibm.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogRGFuIFdp
bGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNjOiBEYW5pZWwgQmxhY2sgPGRhbmll
bEBsaW51eC5pYm0uY29tPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IErDqXLDtG1l
IEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGlu
ZnJhZGVhZC5vcmc+CkNjOiBNaWtlIEtyYXZldHogPG1pa2Uua3JhdmV0ekBvcmFjbGUuY29tPgpT
aWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogbW0v
bWxvY2suYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL21sb2NrLmMgYi9tbS9tbG9jay5jCmluZGV4IGE5
MDA5OWRhNGZiNC4uYjk4MGU2MjcwZThhIDEwMDY0NAotLS0gYS9tbS9tbG9jay5jCisrKyBiL21t
L21sb2NrLmMKQEAgLTM0NSw3ICszNDUsNyBAQCBzdGF0aWMgdm9pZCBfX211bmxvY2tfcGFnZXZl
YyhzdHJ1Y3QgcGFnZXZlYyAqcHZlYywgc3RydWN0IHpvbmUgKnpvbmUpCiAJCQkJZ2V0X3BhZ2Uo
cGFnZSk7IC8qIGZvciBwdXRiYWNrX2xydV9wYWdlKCkgKi8KIAkJCQlfX211bmxvY2tfaXNvbGF0
ZWRfcGFnZShwYWdlKTsKIAkJCQl1bmxvY2tfcGFnZShwYWdlKTsKLQkJCQlwdXRfcGFnZShwYWdl
KTsgLyogZnJvbSBmb2xsb3dfcGFnZV9tYXNrKCkgKi8KKwkJCQlwdXRfdXNlcl9wYWdlKHBhZ2Up
OyAvKiBmcm9tIGZvbGxvd19wYWdlX21hc2soKSAqLwogCQkJfQogCQl9CiAJfQpAQCAtNDY3LDcg
KzQ2Nyw3IEBAIHZvaWQgbXVubG9ja192bWFfcGFnZXNfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEsCiAJCWlmIChwYWdlICYmICFJU19FUlIocGFnZSkpIHsKIAkJCWlmIChQYWdlVHJh
bnNUYWlsKHBhZ2UpKSB7CiAJCQkJVk1fQlVHX09OX1BBR0UoUGFnZU1sb2NrZWQocGFnZSksIHBh
Z2UpOwotCQkJCXB1dF9wYWdlKHBhZ2UpOyAvKiBmb2xsb3dfcGFnZV9tYXNrKCkgKi8KKwkJCQlw
dXRfdXNlcl9wYWdlKHBhZ2UpOyAvKiBmb2xsb3dfcGFnZV9tYXNrKCkgKi8KIAkJCX0gZWxzZSBp
ZiAoUGFnZVRyYW5zSHVnZShwYWdlKSkgewogCQkJCWxvY2tfcGFnZShwYWdlKTsKIAkJCQkvKgpA
QCAtNDc4LDcgKzQ3OCw3IEBAIHZvaWQgbXVubG9ja192bWFfcGFnZXNfcmFuZ2Uoc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEsCiAJCQkJICovCiAJCQkJcGFnZV9tYXNrID0gbXVubG9ja192bWFf
cGFnZShwYWdlKTsKIAkJCQl1bmxvY2tfcGFnZShwYWdlKTsKLQkJCQlwdXRfcGFnZShwYWdlKTsg
LyogZm9sbG93X3BhZ2VfbWFzaygpICovCisJCQkJcHV0X3VzZXJfcGFnZShwYWdlKTsgLyogZm9s
bG93X3BhZ2VfbWFzaygpICovCiAJCQl9IGVsc2UgewogCQkJCS8qCiAJCQkJICogTm9uLWh1Z2Ug
cGFnZXMgYXJlIGhhbmRsZWQgaW4gYmF0Y2hlcyB2aWEKLS0gCjIuMjIuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
