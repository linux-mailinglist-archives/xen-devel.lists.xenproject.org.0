Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC6980E17
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:52:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPK7-0003uL-40; Sun, 04 Aug 2019 22:49:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPK5-0003se-J9
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:49:53 +0000
X-Inumbo-ID: 2bfe0102-b70a-11e9-8980-bc764e045a96
Received: from mail-pf1-x441.google.com (unknown [2607:f8b0:4864:20::441])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2bfe0102-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:49:53 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id f17so34607360pfn.6
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6GC3vp7Kgk6wrS2t1aIFSliRmKpmpPmHRVTf1Sq+2hE=;
 b=dM/IGJPKx3vHMSaH2jjH8cddB9IjzpJgXXKkO7CuRXnxMJrRMmXVqwBAlQ88WzjX5h
 dPH11zKs16Cup5MqaIdJ1qgQ5dnUSJO3TyirSMdWy1ehRY6u0fAfZaZVJnTvSLI1QoSZ
 1OPtp46Njt0JJnUOBtfou4qDlL/RKFcmnKhvrMMghCphBN24qaIVDJrBrmeB7g2Z62x7
 9z4wjKe5TgqpPsxN1F6MtFwbERWIIYczU3Vlcoi9Bn6Io4pS8zl9BxvD7OfIkvOk2DHe
 bKWOTx3ItGlZJtYz9ERx5/QSr4d6lkRb9ThyPESwSqEPXbfdWPFzLZ85HYqnnwwoanPc
 GvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6GC3vp7Kgk6wrS2t1aIFSliRmKpmpPmHRVTf1Sq+2hE=;
 b=s+yGwX/qpIXr1hq70NuQIvHxVYEqQGRQQnssk3GqwtlDlXG+jZCj/kytr04TfdgJzG
 08d0kLyH/lwzKbddpvAHKRrhEh5AXnJTfNCDWU3pKgaHiMclRIYt8q9M+HTMjCNqUM+a
 UQox6AUNIhpdAkGW1WA0H+DK1e0JyM61Jmi/kGJJ5H/jV3SoPtfSk7iWuzr3xPLRHAHA
 UwuZ51efHjkfz7/dS9ibW2VAjgZgUWGU78/TKPCGfYlOlcy5+DMmmW1D9SdiTvsR64Ai
 pYpvYX856aeMVixmoDrXQVqLDOmblDTG3tEfQMCAbXqDamgPW+ZWb1v+iqKJEqMr7/1r
 J92w==
X-Gm-Message-State: APjAAAWWCPCG7YyrFt0I0JE8BHpz1t8LCNugDS5yu/GsF0v0oMtW0Rpl
 csV0ZJFWecn7vwoxsD4OAgA=
X-Google-Smtp-Source: APXvYqwq/YfHOhrmZHkD7vjJE2TMWCM5ZcaZGqo7qwngyLyrDMEmQDpJGD3vf7HiLmlT/OfJiu4DXA==
X-Received: by 2002:a17:90a:360c:: with SMTP id
 s12mr15495527pjb.30.1564958992495; 
 Sun, 04 Aug 2019 15:49:52 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:52 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:49:02 -0700
Message-Id: <20190804224915.28669-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 21/34] fs/exec.c: convert put_page() to
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
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQWxleGFu
ZGVyIFZpcm8gPHZpcm9AemVuaXYubGludXgub3JnLnVrPgpDYzogbGludXgtZnNkZXZlbEB2Z2Vy
Lmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEu
Y29tPgotLS0KIGZzL2V4ZWMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2ZzL2V4ZWMuYyBiL2ZzL2V4ZWMuYwppbmRl
eCBmN2Y2YTE0MDg1NmEuLmVlNDQyMTUxNTgyZiAxMDA2NDQKLS0tIGEvZnMvZXhlYy5jCisrKyBi
L2ZzL2V4ZWMuYwpAQCAtMjI3LDcgKzIyNyw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqZ2V0X2Fy
Z19wYWdlKHN0cnVjdCBsaW51eF9iaW5wcm0gKmJwcm0sIHVuc2lnbmVkIGxvbmcgcG9zLAogCiBz
dGF0aWMgdm9pZCBwdXRfYXJnX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiB7Ci0JcHV0X3BhZ2Uo
cGFnZSk7CisJcHV0X3VzZXJfcGFnZShwYWdlKTsKIH0KIAogc3RhdGljIHZvaWQgZnJlZV9hcmdf
cGFnZXMoc3RydWN0IGxpbnV4X2JpbnBybSAqYnBybSkKLS0gCjIuMjIuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
