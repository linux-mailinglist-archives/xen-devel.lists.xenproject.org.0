Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B529480E26
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:53:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPJr-0003Xj-ML; Sun, 04 Aug 2019 22:49:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPJq-0003Wu-7m
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:49:38 +0000
X-Inumbo-ID: 22a15ecd-b70a-11e9-8980-bc764e045a96
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 22a15ecd-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:49:37 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id n190so3535649pgn.0
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=34zW6BJN89MycamN6XZc+aPi3iIpUXsyW4mngm2d11Q=;
 b=Vl3ziFlsVP8d5c8y0YmW6fDZsGTWTBWfBuMUsCvUNMfO41hPRu5nz6knOx+9Exr4dm
 faLIZ6PGv5svewcMn6NrpUtC2sVsC+7jyMTiSPQOkMWSlMNBGkEc5Hzdhl1GLUQ+lU00
 s8/u7LPhlwjUp5vP9Cq58ZxyRYaJggFlYisUFFtIS444ycMw8U/APZaIEYWga3Yussps
 tKIhHu6BLxxDR9A3QUeopRp/JQJFEZSB+ASswX2FluN7nR+bVi9w3B9Wm/JRet3KnCM9
 BzOgVm6BdbLPf53jqaXQstPr6PLJxFbgM+ClIPWs4p2Wp5bWVtpTaVjy3ylfOWo6XjbI
 VLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=34zW6BJN89MycamN6XZc+aPi3iIpUXsyW4mngm2d11Q=;
 b=hBRZ2sd3Ye5fxnfWJD8Q8upCv91SGcwg7H/mdyri8KsteD9ZOJHSzb6+zWoXribc2/
 8S2vUKLDg65IZrVffVlB5iIriWagqKP6FccJGZbWn7KBKG1kxYv+BeuZaiSRWXz2yvPh
 J+04D/zID9n232e2E+tue1yXs+Bs7EceNegSoztfG9w5n84adpsKjvyMJQx7WReWePPw
 SfjXvWKSDr8PwSxG5Q8Q+UBY5qO/LnFmBnCeK4/PmqgUihxcCdX9OX7yRGJjll8StxZb
 hINr1b9dDXz/DDpdILInr8Av5SdHWQM8MQ5okFuBVSJa2RzBlFgqlL9+qhYUcyisJZCc
 wFUw==
X-Gm-Message-State: APjAAAUcNM3MtMZnw9DGSCLxflFnYxuKPVOE9lqDa5dpnExWlNtarQCU
 bdZSAD7n67aW5BMPW98oxzLQxFdd
X-Google-Smtp-Source: APXvYqzZzuc1CJxZdFJgWU/FwmUoZ/p878RlqbCeEzJ5+atuTCZn+89D3JrxmbErf1XY9IXgA3NZ2A==
X-Received: by 2002:a17:90a:f498:: with SMTP id
 bx24mr15350312pjb.91.1564958976783; 
 Sun, 04 Aug 2019 15:49:36 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:36 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:48:52 -0700
Message-Id: <20190804224915.28669-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 11/34] scif: convert put_page() to
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
