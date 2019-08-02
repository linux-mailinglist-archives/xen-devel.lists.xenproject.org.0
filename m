Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5D77EB2A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:17:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxV-0005qT-SX; Fri, 02 Aug 2019 04:14:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNB3-00072y-Ro
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:17 +0000
X-Inumbo-ID: 113b639f-b4cc-11e9-8980-bc764e045a96
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 113b639f-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:17 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t132so35227704pgb.9
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=weSPcOAlMB+nks0BWLOsxsBmAu907UZGrfndvq6oQnc=;
 b=g/PNAVO1jcA7rjmvur5Gi5SyBm+cHCwd0FZu0S4Yd4WKYY8nqKUy+Kjq5L8LbAIDam
 oq+DMw/apiFaV6V9t2AYTvJ0UtZRGdqpPgiFYeIHq5U9A659jHv3iijVBsi80zStn1WW
 yA7d3ZYX2ikKALXpz54vXEPMXgXSlYxT87JksMZBQueD34Vn0QLhvvHOTCuzyirgAxhY
 PS1hXIRKbtV044f7MD5ThhAFxJavcS5DN9nP30sURDOyWv4TACAbp0MhELnCZVrxEr+Y
 L5R1pu68TEBkTXOjXzFMyL79KTHMlgJNcYv+KmIulF31bskwh/7J7wKRv6nstiIy1Eix
 KMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=weSPcOAlMB+nks0BWLOsxsBmAu907UZGrfndvq6oQnc=;
 b=FcUBxPE1PinHcZ6XbJI5UD/V+/Nc6DQI/y38nr8CTe/HJk7qqmbCOxxz49obHW2As0
 45Gwi7JKChjz97aFc0jmmMGn4X+KHEIC70FW2DU501STZKTJTSOV4j3A3AcP2wtinrEn
 n0sIu15jZhTW7f5x7xU/V8jDYUrEt+AoWvfLEcLUL/VPFej2ZmZZ8CHbMGn+Ja1ccGXb
 iKB5FD2Q+TH0IAK9vzVutR9G6sDXt9UwBFGTQi3EjavnApPcUE1TaT8/MrlhLW6IA4vt
 xvFbAbDcpRHQZchWgJlwlj7gRVm5vP+HNhe9ZAV2Xqd0EGU1azBZOGlgLClt9s/v0cGZ
 iKdQ==
X-Gm-Message-State: APjAAAXh+JZGjxNvG+3pqpvvYQCrxSieXU1683Khw/YkczB5mxYb9NP+
 5ZBTJy0ssaICnxSuRvBQixk=
X-Google-Smtp-Source: APXvYqxciGgcMDXcQ3A2dbcQcp1f7eltXWtJvGVKyn0lRu+bq9UEFtA9QCl9A6sNDZqj7/W8XpREEA==
X-Received: by 2002:a17:90a:2385:: with SMTP id
 g5mr1977411pje.12.1564712416439; 
 Thu, 01 Aug 2019 19:20:16 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:16 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:34 -0700
Message-Id: <20190802022005.5117-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 03/34] net/ceph: convert put_page() to
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
 rds-devel@oss.oracle.com, Sage Weil <sage@redhat.com>,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogSWx5YSBE
cnlvbW92IDxpZHJ5b21vdkBnbWFpbC5jb20+CkNjOiBTYWdlIFdlaWwgPHNhZ2VAcmVkaGF0LmNv
bT4KQ2M6IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KQ2M6IGNlcGgtZGV2
ZWxAdmdlci5rZXJuZWwub3JnCkNjOiBuZXRkZXZAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYt
Ynk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBuZXQvY2VwaC9wYWdl
dmVjLmMgfCA4ICstLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDcgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbmV0L2NlcGgvcGFnZXZlYy5jIGIvbmV0L2NlcGgvcGFn
ZXZlYy5jCmluZGV4IDY0MzA1ZTcwNTZhMS4uYzg4ZmZmMmFiOWJkIDEwMDY0NAotLS0gYS9uZXQv
Y2VwaC9wYWdldmVjLmMKKysrIGIvbmV0L2NlcGgvcGFnZXZlYy5jCkBAIC0xMiwxMyArMTIsNyBA
QAogCiB2b2lkIGNlcGhfcHV0X3BhZ2VfdmVjdG9yKHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCBu
dW1fcGFnZXMsIGJvb2wgZGlydHkpCiB7Ci0JaW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBpIDwgbnVt
X3BhZ2VzOyBpKyspIHsKLQkJaWYgKGRpcnR5KQotCQkJc2V0X3BhZ2VfZGlydHlfbG9jayhwYWdl
c1tpXSk7Ci0JCXB1dF9wYWdlKHBhZ2VzW2ldKTsKLQl9CisJcHV0X3VzZXJfcGFnZXNfZGlydHlf
bG9jayhwYWdlcywgbnVtX3BhZ2VzLCBkaXJ0eSk7CiAJa3ZmcmVlKHBhZ2VzKTsKIH0KIEVYUE9S
VF9TWU1CT0woY2VwaF9wdXRfcGFnZV92ZWN0b3IpOwotLSAKMi4yMi4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
