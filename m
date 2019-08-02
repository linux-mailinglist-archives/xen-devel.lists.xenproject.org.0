Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 413AC7EB2D
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:18:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxa-0005tM-MJ; Fri, 02 Aug 2019 04:14:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBT-000784-6U
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:43 +0000
X-Inumbo-ID: 2070ca87-b4cc-11e9-8980-bc764e045a96
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2070ca87-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:42 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id i2so33033126plt.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=py067aGaFWqYQnWW3CrL2Yk9VWIyNl4WEpwUsrZ7LgI=;
 b=lOZaOBHnHG96U7CUpGeMR/TMYtjEa4y/ygakLmz0BtnL+pIOpa3C2toztsy8fW4gwW
 tSTtviLJ7HOi9DtUi5KI4XY0WPu2eSdUBZVMSVezuKPLNyCDQwUs6J0/BBBZ+6xhu24Z
 FFakCBm8lWNZ+G5ej5b+50tyKMtD+b21oulPMq7HB8nLNBdaEf18LO4IyZXO6FYAkAZH
 Gf/avj3rVBNxZL42D+4KJvp1yOXbbtpENzFq10jG7FxODtHOFfbvskOX/bZ+DtIk1XsS
 LtXAfdLjn1YTVqg0w1Z1LAlYkVjy6XQT7mshmHFnFkvQYLq3O8bZzk73cr7CrbSrM5zf
 ODTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=py067aGaFWqYQnWW3CrL2Yk9VWIyNl4WEpwUsrZ7LgI=;
 b=pbBNISYGiEdgDO8NGPCv34yAzUfCJQenUSX7iIpoSeTjdlXZ9LcO+8iwEm01ft8hY4
 esUoh7nT5u2mGuo2ubSB9LE4x6BmocsvjY7wAcOAcpwq2koXfogkPQAyjboWCEOeYIiq
 FFBeKPEUqwIpGq77kekn2zeudU7CL5q5T/Y0sTpg4lQhiquyxYFhzN4eJMfcFtpUWxHS
 x4i3xgyGQU4zYycEUGuyOdvs/MzWlq1xlQ3jST6D/J9yoar+Ahu018UqeunnoQn8oO/T
 W1m3rZveDjcc+cNeXO+tvrm+nbRYt03drwGjTF3rD/GDyvAX4KYgl7NQJacXhGUYVTuA
 o6KQ==
X-Gm-Message-State: APjAAAU7WJo/4Ontk8HJSoWreqwzeA8JNgRvnPj1XI0C+M6yCz3to+U5
 LNzf4m+KRrffBtClzeB6ExU=
X-Google-Smtp-Source: APXvYqxy0BkUtbl8ULTboF2upH0nHFnxM+Cu1b4hTcaSsJxULdUpLCIdwe/mZoVo5hGjgo4EZJg93Q==
X-Received: by 2002:a17:902:f46:: with SMTP id
 64mr130019975ply.235.1564712441986; 
 Thu, 01 Aug 2019 19:20:41 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:41 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:50 -0700
Message-Id: <20190802022005.5117-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 19/34] fsl_hypervisor: convert put_page() to
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
 Rob Herring <robh@kernel.org>, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpUaGlzIGNoYW5n
ZXMgdGhlIHJlbGVhc2UgY29kZSBzbGlnaHRseSwgYmVjYXVzZSBlYWNoIHBhZ2Ugc2xvdCBpbiB0
aGUKcGFnZV9saXN0W10gYXJyYXkgaXMgbm8gbG9uZ2VyIGNoZWNrZWQgZm9yIE5VTEwuIEhvd2V2
ZXIsIHRoYXQgY2hlY2sKd2FzIHdyb25nIGFueXdheSwgYmVjYXVzZSB0aGUgZ2V0X3VzZXJfcGFn
ZXMoKSBwYXR0ZXJuIG9mIHVzYWdlIGhlcmUKbmV2ZXIgYWxsb3dlZCBmb3IgTlVMTCBlbnRyaWVz
IHdpdGhpbiBhIHJhbmdlIG9mIHBpbm5lZCBwYWdlcy4KCkNjOiBBbCBWaXJvIDx2aXJvQHplbml2
LmxpbnV4Lm9yZy51az4KQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpDYzog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJk
IDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5j
IHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5jIGIvZHJpdmVy
cy92aXJ0L2ZzbF9oeXBlcnZpc29yLmMKaW5kZXggOTNkNWJlYmY5NTcyLi5hOGY3OGQ1NzJjNDUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5jCisrKyBiL2RyaXZlcnMv
dmlydC9mc2xfaHlwZXJ2aXNvci5jCkBAIC0yOTIsMTEgKzI5Miw4IEBAIHN0YXRpYyBsb25nIGlv
Y3RsX21lbWNweShzdHJ1Y3QgZnNsX2h2X2lvY3RsX21lbWNweSBfX3VzZXIgKnApCiAJCXZpcnRf
dG9fcGh5cyhzZ19saXN0KSwgbnVtX3BhZ2VzKTsKIAogZXhpdDoKLQlpZiAocGFnZXMpIHsKLQkJ
Zm9yIChpID0gMDsgaSA8IG51bV9wYWdlczsgaSsrKQotCQkJaWYgKHBhZ2VzW2ldKQotCQkJCXB1
dF9wYWdlKHBhZ2VzW2ldKTsKLQl9CisJaWYgKHBhZ2VzKQorCQlwdXRfdXNlcl9wYWdlcyhwYWdl
cywgbnVtX3BhZ2VzKTsKIAogCWtmcmVlKHNnX2xpc3RfdW5hbGlnbmVkKTsKIAlrZnJlZShwYWdl
cyk7Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
