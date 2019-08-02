Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CB57EB16
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:17:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxf-0005vo-0F; Fri, 02 Aug 2019 04:14:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBo-0007CV-7b
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:21:04 +0000
X-Inumbo-ID: 2c65b25a-b4cc-11e9-8980-bc764e045a96
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2c65b25a-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:21:02 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t14so32990511plr.11
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t4E5L+nteFApbv8x9BTzZhAA9CrCHyfc4N+4wDD55sE=;
 b=hrmJ0pEUxxlEVbmnkJiCuXB+z0obVkpM5OAxcIB8ex62qKsRGc8GrJbesoMFhr0ezJ
 BB7gqJEvJ/0j1sMNBYjptk6WEDqh/SuRhAh3YnXCDA+D03E9VD/w0ZTpWsRp/gFtvqDb
 GPSJBQRO2YGZ2n4ciW9tAFCe3EDjB9OuDXHwxqBfuLFzCDYC5sbEZNesZN0XL0xy/T+d
 A/rrSMYh6KaPOeAYQGAhhvKvLVo5NyuQKSBc7dnWcPrp/sW9C+D3tHmYcyJ9WgLD0vU4
 zE+pn4brWMiLPK0lo9h6ZHMbPaOqGStN6e8qWC9iDeImsGRohVaoMFw5HAYT+EunHz7d
 Gu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t4E5L+nteFApbv8x9BTzZhAA9CrCHyfc4N+4wDD55sE=;
 b=W3lRoDxm/lRkVkX7OYD9ftX6W1nISOPpv9BzypcgbXARWpKsjHVMPjioyi80amzX13
 3ODs3XJCMSaNHED+QRcdk24A9ZlV0TJ63Rle2KbbdIUQkKKCeh6nkyvk5lzGKHQ1bZrX
 LmsC3dMWRVRPBgEr9fdeXCC2FJMpTZOg9Cqy7H3do6vBQl3mK0/edDcQF/WwYIFMdPdU
 m/V1s0C4GzEBpSYqjXTMEiefETbMl2R5asy60efvBgdNSF/McYp1nW5iMLWulF8kAuwQ
 upW7tZt+AZz3JuNr3RHXPbpJD2ZZ4yDEEfqzzlqXyzSRHZNFKxEIrr9YGVIfN3J1F75+
 Kp4g==
X-Gm-Message-State: APjAAAUVyn4fusAzPiJkGsknWyJXTWNIckKIwQnb2RWaQpSIQmtIGK+M
 3uZdLGraCsqz/5zF5EADDlQ=
X-Google-Smtp-Source: APXvYqwMLKf8AGC5hDWCQUPLqudyxsaLfy2JXIWmRI5mzRP+HqysSD+VYVGt/11B9bnV5geCVBXglQ==
X-Received: by 2002:a17:902:20ec:: with SMTP id
 v41mr122012162plg.142.1564712462015; 
 Thu, 01 Aug 2019 19:21:02 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.21.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:21:01 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:20:03 -0700
Message-Id: <20190802022005.5117-33-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 32/34] goldfish_pipe: convert put_page() to
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
 Jason Gunthorpe <jgg@ziepe.ca>, Roman Kiryanov <rkir@google.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpOb3RlIHRoYXQg
dGhpcyBlZmZlY3RpdmVseSBjaGFuZ2VzIHRoZSBjb2RlJ3MgYmVoYXZpb3IgaW4KcXBfcmVsZWFz
ZV9wYWdlcygpOiBpdCBub3cgdWx0aW1hdGVseSBjYWxscyBzZXRfcGFnZV9kaXJ0eV9sb2NrKCks
Cmluc3RlYWQgb2Ygc2V0X3BhZ2VfZGlydHkoKS4gVGhpcyBpcyBwcm9iYWJseSBtb3JlIGFjY3Vy
YXRlLgoKQXMgQ2hyaXN0b3BoZSBIZWxsd2lnIHB1dCBpdCwgInNldF9wYWdlX2RpcnR5KCkgaXMg
b25seSBzYWZlIGlmIHdlIGFyZQpkZWFsaW5nIHdpdGggYSBmaWxlIGJhY2tlZCBwYWdlIHdoZXJl
IHdlIGhhdmUgcmVmZXJlbmNlIG9uIHRoZSBpbm9kZSBpdApoYW5ncyBvZmYuIiBbMV0KClsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMTkwNzIzMTUzNjQwLkdCNzIwQGxzdC5kZQoKQ2M6
IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNjOiBSb21h
biBLaXJ5YW5vdiA8cmtpckBnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQg
PGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9wbGF0Zm9ybS9nb2xkZmlzaC9nb2xk
ZmlzaF9waXBlLmMgfCA5ICsrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNo
L2dvbGRmaXNoX3BpcGUuYyBiL2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlw
ZS5jCmluZGV4IGNlZjAxMzNhYTQ3YS4uMmJkMjEwMjBlMjg4IDEwMDY0NAotLS0gYS9kcml2ZXJz
L3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRmaXNoX3BpcGUuYworKysgYi9kcml2ZXJzL3BsYXRmb3Jt
L2dvbGRmaXNoL2dvbGRmaXNoX3BpcGUuYwpAQCAtMjg4LDE1ICsyODgsMTIgQEAgc3RhdGljIGlu
dCBwaW5fdXNlcl9wYWdlcyh1bnNpZ25lZCBsb25nIGZpcnN0X3BhZ2UsCiBzdGF0aWMgdm9pZCBy
ZWxlYXNlX3VzZXJfcGFnZXMoc3RydWN0IHBhZ2UgKipwYWdlcywgaW50IHBhZ2VzX2NvdW50LAog
CQkJICAgICAgIGludCBpc193cml0ZSwgczMyIGNvbnN1bWVkX3NpemUpCiB7Ci0JaW50IGk7CisJ
Ym9vbCBkaXJ0eSA9ICFpc193cml0ZSAmJiBjb25zdW1lZF9zaXplID4gMDsKIAotCWZvciAoaSA9
IDA7IGkgPCBwYWdlc19jb3VudDsgaSsrKSB7Ci0JCWlmICghaXNfd3JpdGUgJiYgY29uc3VtZWRf
c2l6ZSA+IDApCi0JCQlzZXRfcGFnZV9kaXJ0eShwYWdlc1tpXSk7Ci0JCXB1dF9wYWdlKHBhZ2Vz
W2ldKTsKLQl9CisJcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jayhwYWdlcywgcGFnZXNfY291bnQs
IGRpcnR5KTsKIH0KIAorCiAvKiBQb3B1bGF0ZSB0aGUgY2FsbCBwYXJhbWV0ZXJzLCBtZXJnaW5n
IGFkamFjZW50IHBhZ2VzIHRvZ2V0aGVyICovCiBzdGF0aWMgdm9pZCBwb3B1bGF0ZV9yd19wYXJh
bXMoc3RydWN0IHBhZ2UgKipwYWdlcywKIAkJCSAgICAgICBpbnQgcGFnZXNfY291bnQsCi0tIAoy
LjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
