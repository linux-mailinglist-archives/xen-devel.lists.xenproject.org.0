Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E88C83FD1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:36:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAq8-0000WY-Oa; Wed, 07 Aug 2019 01:34:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAq7-0000VD-Du
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:07 +0000
X-Inumbo-ID: 718d3aee-b8b3-11e9-8980-bc764e045a96
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 718d3aee-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:05 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id r1so42490152pfq.12
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=34zW6BJN89MycamN6XZc+aPi3iIpUXsyW4mngm2d11Q=;
 b=o1iMd41+ccZkK09IMPd2AYRK2nxxj4luxr/oXYf1r5zvl1rB+5Njvw5+yOF9jzdNKW
 0sOvnAPF3Qav8GrCrICbMqDOV9qASg1Kx51KsLT3kM/WuvVdMW7XrY8CvDI8Q5dEWx12
 oQbwqpjSWiFbIsNFbcpYcVrmKluAqCipM9FxALoNB6s3X2SZRLlz53JQRsVYPh0pH9nV
 Kc9qcjAV7p7rTzqe2/MHBF1cE8sJ8msPeJl3VFMqaq2A+nfaaBpGi8bFHG/baDlwWEny
 MHNVdhC+ELal559VaRapllf9o6PzvZgYyIKj0wGmpTTu6N66MHuYIC1lBVMp4ydMH/rt
 +u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=34zW6BJN89MycamN6XZc+aPi3iIpUXsyW4mngm2d11Q=;
 b=ds7kWuDs5luW8bxssx2BWNAXiHYbtH5elrN53+42kN8ahmzZDDdvZLPM9nN9TJPtGV
 80s7eMMEQd2PtV0nYBtuU0q//m8icVgm4C5Kxb7R567D9ynAEwAYriNzpFQLpt3nsDVM
 1OQL+xd8OEdjeogkEXwArHQ2Y4O8rRQYP04Jx2CLy+xxuHbDXON2YTr9cSmnHSeYSiNE
 7Mk5iphoz5SH0nStB2SMV9bF6q4pn+jz+Qd3d7DoBut+7Qr9qBUl0fUqDXwUBP+3qlIe
 0TJUqbAjNwITtlcPw7L9fxMSbOe+ElW3CdyGX7EcLZFaXNsIc228iA0d8VqpzhdWzqFZ
 rnSQ==
X-Gm-Message-State: APjAAAX/4yKRaeOsXBxPO8nhJWfNGLrFcmSDfMrElQaJ9hDVGHuvaSQY
 BIErFo06Af1ew8P7FadMPSc=
X-Google-Smtp-Source: APXvYqwDlo4CFJorDrBurduwUa2oSyS2Jx2b29d9K5TbsKnQqNAY6ckzALOmtrds4Hd5oSsH/O3vaA==
X-Received: by 2002:a17:90a:1b0c:: with SMTP id
 q12mr6044962pjq.76.1565141645264; 
 Tue, 06 Aug 2019 18:34:05 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:04 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:12 -0700
Message-Id: <20190807013340.9706-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 13/41] scif: convert put_page() to
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
 Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogU3VkZWVw
IER1dHQgPHN1ZGVlcC5kdXR0QGludGVsLmNvbT4KQ2M6IEFzaHV0b3NoIERpeGl0IDxhc2h1dG9z
aC5kaXhpdEBpbnRlbC5jb20+CkNjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgpDYzog
Sm9lcmcgUm9lZGVsIDxqcm9lZGVsQHN1c2UuZGU+CkNjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11
cnBoeUBhcm0uY29tPgpDYzogWmhlbiBMZWkgPHRodW5kZXIubGVpemhlbkBodWF3ZWkuY29tPgpT
aWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJp
dmVycy9taXNjL21pYy9zY2lmL3NjaWZfcm1hLmMgfCAxNyArKysrKysrKy0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21pc2MvbWljL3NjaWYvc2NpZl9ybWEuYyBiL2RyaXZlcnMvbWlzYy9taWMvc2Np
Zi9zY2lmX3JtYS5jCmluZGV4IDAxZTI3NjgyZWEzMC4uZDg0ZWQ5NDY2OTIwIDEwMDY0NAotLS0g
YS9kcml2ZXJzL21pc2MvbWljL3NjaWYvc2NpZl9ybWEuYworKysgYi9kcml2ZXJzL21pc2MvbWlj
L3NjaWYvc2NpZl9ybWEuYwpAQCAtMTEzLDEzICsxMTMsMTQgQEAgc3RhdGljIGludCBzY2lmX2Rl
c3Ryb3lfcGlubmVkX3BhZ2VzKHN0cnVjdCBzY2lmX3Bpbm5lZF9wYWdlcyAqcGluKQogCWludCB3
cml0ZWFibGUgPSBwaW4tPnByb3QgJiBTQ0lGX1BST1RfV1JJVEU7CiAJaW50IGtlcm5lbCA9IFND
SUZfTUFQX0tFUk5FTCAmIHBpbi0+bWFwX2ZsYWdzOwogCi0JZm9yIChqID0gMDsgaiA8IHBpbi0+
bnJfcGFnZXM7IGorKykgewotCQlpZiAocGluLT5wYWdlc1tqXSAmJiAha2VybmVsKSB7CisJaWYg
KGtlcm5lbCkgeworCQlmb3IgKGogPSAwOyBqIDwgcGluLT5ucl9wYWdlczsgaisrKSB7CiAJCQlp
ZiAod3JpdGVhYmxlKQotCQkJCVNldFBhZ2VEaXJ0eShwaW4tPnBhZ2VzW2pdKTsKKwkJCQlzZXRf
cGFnZV9kaXJ0eV9sb2NrKHBpbi0+cGFnZXNbal0pOwogCQkJcHV0X3BhZ2UocGluLT5wYWdlc1tq
XSk7CiAJCX0KLQl9CisJfSBlbHNlCisJCXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2socGluLT5w
YWdlcywgcGluLT5ucl9wYWdlcywgd3JpdGVhYmxlKTsKIAogCXNjaWZfZnJlZShwaW4tPnBhZ2Vz
LAogCQkgIHBpbi0+bnJfcGFnZXMgKiBzaXplb2YoKnBpbi0+cGFnZXMpKTsKQEAgLTEzODUsMTEg
KzEzODYsOSBAQCBpbnQgX19zY2lmX3Bpbl9wYWdlcyh2b2lkICphZGRyLCBzaXplX3QgbGVuLCBp
bnQgKm91dF9wcm90LAogCQkJCWlmICh1bGltaXQpCiAJCQkJCV9fc2NpZl9kZWNfcGlubmVkX3Zt
X2xvY2sobW0sIG5yX3BhZ2VzKTsKIAkJCQkvKiBSb2xsIGJhY2sgYW55IHBpbm5lZCBwYWdlcyAq
LwotCQkJCWZvciAoaSA9IDA7IGkgPCBwaW5uZWRfcGFnZXMtPm5yX3BhZ2VzOyBpKyspIHsKLQkJ
CQkJaWYgKHBpbm5lZF9wYWdlcy0+cGFnZXNbaV0pCi0JCQkJCQlwdXRfcGFnZSgKLQkJCQkJCXBp
bm5lZF9wYWdlcy0+cGFnZXNbaV0pOwotCQkJCX0KKwkJCQlwdXRfdXNlcl9wYWdlcyhwaW5uZWRf
cGFnZXMtPnBhZ2VzLAorCQkJCQkgICAgICAgcGlubmVkX3BhZ2VzLT5ucl9wYWdlcyk7CisKIAkJ
CQlwcm90ICY9IH5TQ0lGX1BST1RfV1JJVEU7CiAJCQkJdHJ5X3VwZ3JhZGUgPSBmYWxzZTsKIAkJ
CQlnb3RvIHJldHJ5OwotLSAKMi4yMi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
