Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 933317EB19
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:17:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxc-0005uT-Sb; Fri, 02 Aug 2019 04:14:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBe-0007AP-80
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:54 +0000
X-Inumbo-ID: 26b263bb-b4cc-11e9-8980-bc764e045a96
Received: from mail-pl1-x643.google.com (unknown [2607:f8b0:4864:20::643])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 26b263bb-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:53 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id a93so32956801pla.7
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8Q8kE8hzW/DwKrVVZh1taN77rkNxpuim/5zYvIGd0I=;
 b=SN9JCWjRa62SDUJKkHaVdcwHX85kw/BYyJx1Oz6MKq1tPWuA+R+kvOX6gTDvC/TGzM
 WuYG+JBQhglp5JUL5bE3kcONL91y/gVNfG1/TEEmXEUkwsc3IV9ZwlZo4fZZ39RQbUrI
 einldN97i3VjPzZmNrk7Gi70UVvHdYeVSXiOY7z0rmJg1OD2RJX0hB2kTyBbOVlbD4F/
 wFv0bPm5s1TrbkD6/tFvn6bnIJfGHM4gcvzjJiA5o2aPM4xOIDqOY4iccbO2F7+VYayI
 O0zTQo6na3+rAYAFM80xDRcL3DANvgDbjQbLbpyWsZCgQEzyIKagAyXZm1uNkiwXdu5u
 s1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8Q8kE8hzW/DwKrVVZh1taN77rkNxpuim/5zYvIGd0I=;
 b=sPc6ucdPk2EFS3IV8r19lAqoVz0Rn899cL1TdRgONsCdg9avVox4/JL3IqG5LDvd2o
 fJ1tIyx827ltB7iJw5mnI1wjjuu1fX0r+TMueNv+rISKFfKaEV4+neODXKXm9OfVpFhE
 oLLmtBQp3PCKtGYGWjHVDUENF9Ndq7yU6W91y+eki2WAfMGOgKBSdVRSE88qkFz/i5p1
 UM/LVkPBmJE366GcX+hZPTnOrLTuQ8k/5cBiXCMxkx73/iZUNYqzl78hn3VV/fG+4Ft/
 97WF2m4S2sByuMF+APiIqWSLtJ2GtlHf9jnZhDTqMrBU19HBfaMm0QAHbPKFtHxrpTZE
 CSuw==
X-Gm-Message-State: APjAAAXdOqftEtZZ32h27UOzAuoBDhwEs5hJBN0cxNwItWE5yN2I8mRK
 gekExUj/ga8hEyeVy20bI8E=
X-Google-Smtp-Source: APXvYqz1YTjVZYS+LesWuf1AG7NOEG7XNcFlAKVjP+75gMoI5m//7o/WseaBl+rAw+Wa9I/u7wQNfg==
X-Received: by 2002:a17:902:740a:: with SMTP id
 g10mr129917590pll.82.1564712452476; 
 Thu, 01 Aug 2019 19:20:52 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:51 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:57 -0700
Message-Id: <20190802022005.5117-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 26/34] mm/gup_benchmark.c: convert put_page() to
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, Keith Busch <keith.busch@intel.com>,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogRGFuIENh
cnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgpDYzogR3JlZyBLcm9haC1IYXJ0bWFu
IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IEtlaXRoIEJ1c2NoIDxrZWl0aC5idXNj
aEBpbnRlbC5jb20+CkNjOiBLaXJpbGwgQS4gU2h1dGVtb3YgPGtpcmlsbC5zaHV0ZW1vdkBsaW51
eC5pbnRlbC5jb20+CkNjOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgpDYzog
WXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogbW0vZ3VwX2JlbmNobWFyay5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvbW0vZ3VwX2JlbmNobWFyay5jIGIvbW0vZ3VwX2JlbmNobWFyay5jCmluZGV4IDdkZDYw
MmQ3ZjhkYi4uNTE1YWM4ZWViNmVlIDEwMDY0NAotLS0gYS9tbS9ndXBfYmVuY2htYXJrLmMKKysr
IGIvbW0vZ3VwX2JlbmNobWFyay5jCkBAIC03OSw3ICs3OSw3IEBAIHN0YXRpYyBpbnQgX19ndXBf
YmVuY2htYXJrX2lvY3RsKHVuc2lnbmVkIGludCBjbWQsCiAJZm9yIChpID0gMDsgaSA8IG5yX3Bh
Z2VzOyBpKyspIHsKIAkJaWYgKCFwYWdlc1tpXSkKIAkJCWJyZWFrOwotCQlwdXRfcGFnZShwYWdl
c1tpXSk7CisJCXB1dF91c2VyX3BhZ2UocGFnZXNbaV0pOwogCX0KIAllbmRfdGltZSA9IGt0aW1l
X2dldCgpOwogCWd1cC0+cHV0X2RlbHRhX3VzZWMgPSBrdGltZV91c19kZWx0YShlbmRfdGltZSwg
c3RhcnRfdGltZSk7Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
