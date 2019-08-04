Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C480E28
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:53:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPKP-0004y0-7k; Sun, 04 Aug 2019 22:50:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPKN-0004tP-H7
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:50:11 +0000
X-Inumbo-ID: 367641e9-b70a-11e9-8980-bc764e045a96
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 367641e9-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:50:10 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id m9so35552225pls.8
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46lxAY1z81U+mrrESVpVIrQ+fWJc6iHl4OExj8KwBEA=;
 b=TnoFvHk+U9GlniOKiXvWmHaHCeiVRyFhspf1Ucco3Opb6Zsra5EKt4aW1VdCEHOoOL
 B19ZrZSjdl4XOLjhMd/tz/suTkdRby0Q/hj5CJZSGF/pCKAPl5af/u3ds9o4NJugQJUH
 wah7eFEy+LBD8ieXrf5M4ghNwdqYF47d1zgnqfS2OWPzozoT/nJvTGXUM3ZYObcV1Nod
 /B+8RZc6MysuCMtgdDFKXIhBZ1vxh5KoYsW/S+ERZyza2fEF3JOhoez0XL3hqg3QsNHf
 A2vrE2EWhCkc/+2Bi4Qkus+K6o78OOjPZC/JIdc8d4G2oWHuj6EfQ91Jku0EJ0FsNSHa
 w9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46lxAY1z81U+mrrESVpVIrQ+fWJc6iHl4OExj8KwBEA=;
 b=hweA30hNRLUZsTlyTjs0YKISnkLbRc/+1TC/h8BnnKbvKLP/eZwhuN0W9QUEeI38RW
 b5PH68Fzs8xExTZI4jULTAwHfjwOYus1hsgGG7g823+5AfxNMsAPi/qYloWY1a+QkByg
 5CQzxtN3m8j6xp1Ve59wSqj1NKJ/PWoCooYSr7Ynse47f77VK6kCHIkMnTgSXKCW34Gb
 9kjFMuKaCWc0hlgHxMTNJP7SILAzpa0O+Bh6AiTBREiE8xeCEj3139zApv327TMb1vDm
 fXOXsIuEJyQIVdcSnX5ATBm7Rn4JFsBDmqyc+UryiJN7V7YDF4p0TPClggz0wUq6wTNk
 l0VA==
X-Gm-Message-State: APjAAAXLfcJNi2V1uLiM8uUS3+uKqH7IOy/zrMct/9Gju59hEkhcHi5B
 jQi0uJra/k4Q/LNCheJWzA4=
X-Google-Smtp-Source: APXvYqzB7V+habp3I96Q8m7XMJqRYvky1QL0M1s1kWUjAVtyhhVWp0HvJtmcLDTq9kGGDNeFtLuO/Q==
X-Received: by 2002:a17:902:9a84:: with SMTP id
 w4mr21647219plp.160.1564959010056; 
 Sun, 04 Aug 2019 15:50:10 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.50.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:09 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:49:13 -0700
Message-Id: <20190804224915.28669-33-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 32/34] goldfish_pipe: convert put_page() to
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
YXRlLgoKQXMgQ2hyaXN0b3BoIEhlbGx3aWcgcHV0IGl0LCAic2V0X3BhZ2VfZGlydHkoKSBpcyBv
bmx5IHNhZmUgaWYgd2UgYXJlCmRlYWxpbmcgd2l0aCBhIGZpbGUgYmFja2VkIHBhZ2Ugd2hlcmUg
d2UgaGF2ZSByZWZlcmVuY2Ugb24gdGhlIGlub2RlIGl0CmhhbmdzIG9mZi4iIFsxXQoKWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTA3MjMxNTM2NDAuR0I3MjBAbHN0LmRlCgpDYzog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IFJvbWFu
IEtpcnlhbm92IDxya2lyQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8
amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRm
aXNoX3BpcGUuYyB8IDkgKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gv
Z29sZGZpc2hfcGlwZS5jIGIvZHJpdmVycy9wbGF0Zm9ybS9nb2xkZmlzaC9nb2xkZmlzaF9waXBl
LmMKaW5kZXggY2VmMDEzM2FhNDdhLi4yYmQyMTAyMGUyODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
cGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0v
Z29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jCkBAIC0yODgsMTUgKzI4OCwxMiBAQCBzdGF0aWMgaW50
IHBpbl91c2VyX3BhZ2VzKHVuc2lnbmVkIGxvbmcgZmlyc3RfcGFnZSwKIHN0YXRpYyB2b2lkIHJl
bGVhc2VfdXNlcl9wYWdlcyhzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgcGFnZXNfY291bnQsCiAJ
CQkgICAgICAgaW50IGlzX3dyaXRlLCBzMzIgY29uc3VtZWRfc2l6ZSkKIHsKLQlpbnQgaTsKKwli
b29sIGRpcnR5ID0gIWlzX3dyaXRlICYmIGNvbnN1bWVkX3NpemUgPiAwOwogCi0JZm9yIChpID0g
MDsgaSA8IHBhZ2VzX2NvdW50OyBpKyspIHsKLQkJaWYgKCFpc193cml0ZSAmJiBjb25zdW1lZF9z
aXplID4gMCkKLQkJCXNldF9wYWdlX2RpcnR5KHBhZ2VzW2ldKTsKLQkJcHV0X3BhZ2UocGFnZXNb
aV0pOwotCX0KKwlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHBhZ2VzLCBwYWdlc19jb3VudCwg
ZGlydHkpOwogfQogCisKIC8qIFBvcHVsYXRlIHRoZSBjYWxsIHBhcmFtZXRlcnMsIG1lcmdpbmcg
YWRqYWNlbnQgcGFnZXMgdG9nZXRoZXIgKi8KIHN0YXRpYyB2b2lkIHBvcHVsYXRlX3J3X3BhcmFt
cyhzdHJ1Y3QgcGFnZSAqKnBhZ2VzLAogCQkJICAgICAgIGludCBwYWdlc19jb3VudCwKLS0gCjIu
MjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
