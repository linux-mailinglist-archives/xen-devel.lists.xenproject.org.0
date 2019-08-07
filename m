Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D6283FEC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:36:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAps-0000Nw-1X; Wed, 07 Aug 2019 01:33:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvApq-0000Mc-Hk
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:33:50 +0000
X-Inumbo-ID: 681dee83-b8b3-11e9-8980-bc764e045a96
Received: from mail-pf1-x441.google.com (unknown [2607:f8b0:4864:20::441])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 681dee83-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:33:50 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id c3so19358163pfa.13
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GHzc1obwFKwJgG7nswfPGhmCYytguM8zaNUDmj5ciqU=;
 b=SVC7DSqJ1aViuFyLacSuD9ekUuon1nsbmGXQ+rccZqQD0M5OpWv4FInOJYOUS0zDrw
 iiaUKlpU3oYT6EB+TLC7fde9FCQbqLPjcDOo/pPYr/Dy4w9ZLyTeVh++4NmqxXNEZ0Um
 gS5DfjjL21uHhIzIHJrVsnAGurOzAGDNfpv0OIjYG3RHWT96uJJIGB6LIuNQuZVc7Ym2
 eeEnUQ4CldleB6IB/9Fxp6/W0nXsF/e4MjOETkKBsrMtb7StZJlqXJT9WcIpX7tnyI6X
 9gewZeHtS0mR3vhC08tQKk4aqf3pL5knJE/hrGJP04i1jVNIaCHMRTQVdWFD0VLC/Xeg
 c3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GHzc1obwFKwJgG7nswfPGhmCYytguM8zaNUDmj5ciqU=;
 b=YyRkKM1aPLNX/9wwtLKJOg5jogAqbtZxJX1z0b1VGLxUIgtz+g67m7UCAdtfgfYAGX
 GjaDZVR6+OAV517HYY0VxWxQyKQ8Uyn8EuQHzVyUv1dKPDF9VcciIBzAaiL8+aOV1ok/
 eOGIqf4NXONBLNqxgd4J7GJNncPs325kKJ4Oig3NwtMVcZJuxDzXt17UeZW5c8EOpit5
 1VLG5+qnamrT3WbaruEd7igK81vnQY1Qxf1icKenfitNwgIR8SMqUQpKVo8Q8clNBHqy
 lmeZG6W2sDPcmOx/97qaMX0Y0/UtIWDTJIAzW9EggneptE1tATyqTUcH3PeUvYhYqtO3
 vi3g==
X-Gm-Message-State: APjAAAWn/692DyVpH8YaNuGoDDoxGKiApL48RwGX5BV1PbD8nni6ur78
 1yIRbPQ+2RAp3OK8thA4HIQ=
X-Google-Smtp-Source: APXvYqxeOvPea8wN4/1KbcpbOcv0WCKYw/yUT+8N/xQtvHJFmkBBq3xYGl9YYXdHhoFcN7NXCSJlJw==
X-Received: by 2002:a17:90a:e397:: with SMTP id
 b23mr5992770pjz.117.1565141629443; 
 Tue, 06 Aug 2019 18:33:49 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.33.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:33:48 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:02 -0700
Message-Id: <20190807013340.9706-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 03/41] net/xdp: convert put_page() to
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
 Jason Gunthorpe <jgg@ziepe.ca>, Magnus Karlsson <magnus.karlsson@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpBY2tlZC1ieTog
QmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAaW50ZWwuY29tPgpDYzogTWFnbnVzIEthcmxzc29u
IDxtYWdudXMua2FybHNzb25AaW50ZWwuY29tPgpDYzogRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBk
YXZlbWxvZnQubmV0PgpDYzogbmV0ZGV2QHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBK
b2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogbmV0L3hkcC94ZHBfdW1lbS5j
IHwgOSArLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9uZXQveGRwL3hkcF91bWVtLmMgYi9uZXQveGRwL3hkcF91bWVt
LmMKaW5kZXggODNkZTc0Y2E3MjlhLi4xN2M0YjNkM2RjMzQgMTAwNjQ0Ci0tLSBhL25ldC94ZHAv
eGRwX3VtZW0uYworKysgYi9uZXQveGRwL3hkcF91bWVtLmMKQEAgLTE2NiwxNCArMTY2LDcgQEAg
dm9pZCB4ZHBfdW1lbV9jbGVhcl9kZXYoc3RydWN0IHhkcF91bWVtICp1bWVtKQogCiBzdGF0aWMg
dm9pZCB4ZHBfdW1lbV91bnBpbl9wYWdlcyhzdHJ1Y3QgeGRwX3VtZW0gKnVtZW0pCiB7Ci0JdW5z
aWduZWQgaW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBpIDwgdW1lbS0+bnBnczsgaSsrKSB7Ci0JCXN0
cnVjdCBwYWdlICpwYWdlID0gdW1lbS0+cGdzW2ldOwotCi0JCXNldF9wYWdlX2RpcnR5X2xvY2so
cGFnZSk7Ci0JCXB1dF9wYWdlKHBhZ2UpOwotCX0KKwlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2Nr
KHVtZW0tPnBncywgdW1lbS0+bnBncywgdHJ1ZSk7CiAKIAlrZnJlZSh1bWVtLT5wZ3MpOwogCXVt
ZW0tPnBncyA9IE5VTEw7Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
