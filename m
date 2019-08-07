Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E436883FD3
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:36:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAqj-0001Zp-8R; Wed, 07 Aug 2019 01:34:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAqg-0001VB-Ds
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:42 +0000
X-Inumbo-ID: 86bd49b1-b8b3-11e9-8980-bc764e045a96
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 86bd49b1-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:41 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n4so813211pgv.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rv0dCo+fqAQ13SgPxACDlFOa16RsKjSPlFe+eBoZNRU=;
 b=qHcz60oQ83bzms/yVUcFaJau5DPrqarhSsDZyTTm0aO7LPLndWEmnFBY1sB89Xkiaw
 Ci5ELNET2QWDN41lDa72vOKuXFO7msQrNQNCW1tufAtPZ+zmR4yxxt0Pj/OC6oGA7iex
 3PC5yUmc2AVOKzZpAx9HhCU3diYcJOxr4dArt0xaN3xcKrvJPt718EmEODcL7rIiZeeH
 s/ExfBknzqo4fU4jgwTtrXK+8yIatr5xd5LIRucVBNPseWxbqe9SNtY40agI2WekCzaT
 jqwlI490o0ssAFzKQmdqp0Jn6NCj4NXSf6medXNB8StHKBNUjeQuhT+5EwaqcfdTeEZ0
 IJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rv0dCo+fqAQ13SgPxACDlFOa16RsKjSPlFe+eBoZNRU=;
 b=RQIv/WOyzPZRUpCjW5SNETMl/GP40EhPzZRoQQtRpo8ywkjxMA71sGEonHonIbdgnm
 BrEhLYY9IGfSCVwAw8uD6DWdtA6jp0G4iE0tlSk0TYfufSVoqVtsZXmyUFzjiAnb/fYJ
 ng62svkM0URf8ymzhdEXbF73qqbyssB3B8/gJTw8YXp8J3IvXSBLniGGVJJB95zH6rmT
 0oUDPr0bOmNt69aJQG1h59y5jSQEmoMYChVNyM09Faw8nMVg+dTsaFVUSgPsSq+lx2RK
 fVMTqm6cX1Cx+0l8YDVztVadsZSE/GnBTLRsXRltkbGx3lKYRdQ0jAWMMjk/Oll8FUwh
 hRJg==
X-Gm-Message-State: APjAAAXXkM3cyqXZJJaPXPgRlOnC6/fsknQ0gETouP05IGoiFQa4GCO9
 +Imqj+7UheP94ERA35C1dMs=
X-Google-Smtp-Source: APXvYqwi1XftPUxFaKwB1e+PTjWB5bVcONCYmxHiCc+kjqKz2w944/jyq9w+bhKvdiZQur9bBkceuw==
X-Received: by 2002:a62:3283:: with SMTP id y125mr6853502pfy.83.1565141680836; 
 Tue, 06 Aug 2019 18:34:40 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:40 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:34 -0700
Message-Id: <20190807013340.9706-36-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 35/41] kernel/events/core.c: convert
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
dmlkaWEuY29tPgotLS0KIGtlcm5lbC9ldmVudHMvY29yZS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVsL2V2
ZW50cy9jb3JlLmMgYi9rZXJuZWwvZXZlbnRzL2NvcmUuYwppbmRleCAwNDYzYzExNTFiYWUuLjdi
ZTUyYmJiZmU4NyAxMDA2NDQKLS0tIGEva2VybmVsL2V2ZW50cy9jb3JlLmMKKysrIGIva2VybmVs
L2V2ZW50cy9jb3JlLmMKQEAgLTY0MjYsNyArNjQyNiw3IEBAIHN0YXRpYyB1NjQgcGVyZl92aXJ0
X3RvX3BoeXModTY0IHZpcnQpCiAJCQlwaHlzX2FkZHIgPSBwYWdlX3RvX3BoeXMocCkgKyB2aXJ0
ICUgUEFHRV9TSVpFOwogCiAJCWlmIChwKQotCQkJcHV0X3BhZ2UocCk7CisJCQlwdXRfdXNlcl9w
YWdlKHApOwogCX0KIAogCXJldHVybiBwaHlzX2FkZHI7Ci0tIAoyLjIyLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
