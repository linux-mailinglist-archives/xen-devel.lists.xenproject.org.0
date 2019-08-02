Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E177EB1C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:17:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxa-0005tV-VE; Fri, 02 Aug 2019 04:14:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBV-00078g-HM
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:45 +0000
X-Inumbo-ID: 214f2b20-b4cc-11e9-8980-bc764e045a96
Received: from mail-pf1-x441.google.com (unknown [2607:f8b0:4864:20::441])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 214f2b20-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:44 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id r7so35155104pfl.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NpCZQ4VK8hzAbP37Qxye6UhXG/4cH2zDttwN2tDhLJk=;
 b=hA+dHc1dKtzF01UNAT1GCb910It9M6OYeo1UwisVEiPximZ0Uizqhd58Gx7EN+cwqG
 oOXAC9GpXS9cMgyPAFeZsWw6yiG5HTsH6dTfrkzHKXhkxbTehvYO/DkXd3o8uGT1hUxz
 8W3I7PS2I6VpD8By/LG/APt7ortKYREWRihQ/MahJgv1XZqDU9aXSO+0f9WVFU4wcOzF
 PifhANph7r1h1aR2sJtcNbzpatSVDPr8LOmoCCwtkUnv/6xTTuq0KjPRlt5jI5AQn0Bo
 qGRQZk7nx9WeapKs5M+9pdwyKPbEullYlAI/CW2M7lTdWIAU5bo5Tw/OmRhRr64X9QFj
 r+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NpCZQ4VK8hzAbP37Qxye6UhXG/4cH2zDttwN2tDhLJk=;
 b=pyNvTHW0VXEeVwzOMyS9VSCrvMweYKrpqLYGqZkI4CRjkwB/HIiuWr3M/ABVM/bA+Z
 WPEdmpZ1iOoYm3nsx9Xq7SsHbwiQQgi/kqaZaqi1EtW2lXPuauj0DV316QDVk4PvoCYW
 ug4pomvjytHIeu6QiT+WcSNZJXMLCifeRaQ1eTATkwaHnHnYGAmn2Zk2nBacPMcJXyAg
 s7HwdbcYPAZ9jT45Z5BLwymF7vyIz7aLN3Oik2g9uJFlVvcHyTPLwg3DZjKzkw1HxrUd
 XNW0hw3LQOpTw97hiAmm7Y8ia+lrbMPCSElxCWWX7jFImPvjpamhIrgarqzTAcfUId+0
 l9xA==
X-Gm-Message-State: APjAAAX0RtctfgmVCW2cGuYcyp4nwhG0iOW60/4otWuTry+9mnUIWnNN
 M001W+Mbdkl2Tz6Pv9VkhKk=
X-Google-Smtp-Source: APXvYqwoCf/Pdnvn5s1n1tJ64nDODMRXeExgk7vpJhyWgRCwW2Xl8gxjUqSaBtscPD/0WWSuL29y+g==
X-Received: by 2002:a62:fb18:: with SMTP id x24mr55563811pfm.231.1564712443423; 
 Thu, 01 Aug 2019 19:20:43 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:42 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:51 -0700
Message-Id: <20190802022005.5117-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 20/34] xen: convert put_page() to
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
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
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQm9yaXMg
T3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVy
cy94ZW4vZ250ZGV2LmMgIHwgNSArLS0tLQogZHJpdmVycy94ZW4vcHJpdmNtZC5jIHwgNyArLS0t
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vZ250ZGV2LmMgYi9kcml2ZXJzL3hlbi9nbnRkZXYuYwpp
bmRleCA0YzMzOWM3ZTY2ZTUuLjI1ODZiM2RmMmJiNiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4v
Z250ZGV2LmMKKysrIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMKQEAgLTg2NCwxMCArODY0LDcgQEAg
c3RhdGljIGludCBnbnRkZXZfZ2V0X3BhZ2Uoc3RydWN0IGdudGRldl9jb3B5X2JhdGNoICpiYXRj
aCwgdm9pZCBfX3VzZXIgKnZpcnQsCiAKIHN0YXRpYyB2b2lkIGdudGRldl9wdXRfcGFnZXMoc3Ry
dWN0IGdudGRldl9jb3B5X2JhdGNoICpiYXRjaCkKIHsKLQl1bnNpZ25lZCBpbnQgaTsKLQotCWZv
ciAoaSA9IDA7IGkgPCBiYXRjaC0+bnJfcGFnZXM7IGkrKykKLQkJcHV0X3BhZ2UoYmF0Y2gtPnBh
Z2VzW2ldKTsKKwlwdXRfdXNlcl9wYWdlcyhiYXRjaC0+cGFnZXMsIGJhdGNoLT5ucl9wYWdlcyk7
CiAJYmF0Y2gtPm5yX3BhZ2VzID0gMDsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vcHJp
dmNtZC5jIGIvZHJpdmVycy94ZW4vcHJpdmNtZC5jCmluZGV4IDJmNWNlNzIzMGE0My4uMjllNDYx
ZGJlZTJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9wcml2Y21kLmMKKysrIGIvZHJpdmVycy94
ZW4vcHJpdmNtZC5jCkBAIC02MTEsMTUgKzYxMSwxMCBAQCBzdGF0aWMgaW50IGxvY2tfcGFnZXMo
CiAKIHN0YXRpYyB2b2lkIHVubG9ja19wYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZXNbXSwgdW5zaWdu
ZWQgaW50IG5yX3BhZ2VzKQogewotCXVuc2lnbmVkIGludCBpOwotCiAJaWYgKCFwYWdlcykKIAkJ
cmV0dXJuOwogCi0JZm9yIChpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyspIHsKLQkJaWYgKHBhZ2Vz
W2ldKQotCQkJcHV0X3BhZ2UocGFnZXNbaV0pOwotCX0KKwlwdXRfdXNlcl9wYWdlcyhwYWdlcywg
bnJfcGFnZXMpOwogfQogCiBzdGF0aWMgbG9uZyBwcml2Y21kX2lvY3RsX2RtX29wKHN0cnVjdCBm
aWxlICpmaWxlLCB2b2lkIF9fdXNlciAqdWRhdGEpCi0tIAoyLjIyLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
