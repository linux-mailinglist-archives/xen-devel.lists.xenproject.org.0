Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68117EB1D
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:17:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxe-0005vG-6e; Fri, 02 Aug 2019 04:14:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBk-0007Bd-Av
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:21:00 +0000
X-Inumbo-ID: 2a91c47d-b4cc-11e9-8980-bc764e045a96
Received: from mail-pl1-x643.google.com (unknown [2607:f8b0:4864:20::643])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2a91c47d-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:59 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id 4so26014038pld.10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4iYkOl3aeyTERThJenFq1/3UwJx4Onl0nTT+k7YLDaI=;
 b=elfpTxMe1/6j0BhX2ft/28omzWdU5w7mpxF5KS6Ry8a8zkGJScYbqAJ2NTQjOpA+gX
 oQX8NO2qfr8fQYzhkmlI2m44i8n5UA95IshiSsHQfSaUB55LfEMP8Nf6Bwly/9Em6O/v
 kb75MLzprl0H6ilua+Tsx9/J/pL9/kQBkbd23F8nfmf7/S2UoqNko9rQth0i8PtjUyLH
 QNhM+JJQO3CxcyAMQTRjV2IrQz9Ukzpv3t7kO6uUD4p+f92uGnc2g/qdEf6YIu13QPQ3
 M8XRiksoxntjoSZ9RhVKNzEdpCIwtT4CToNN39nu0gxIxKKgNM9/D3+uDvkH0PFa7iEb
 mOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4iYkOl3aeyTERThJenFq1/3UwJx4Onl0nTT+k7YLDaI=;
 b=Ak2Nw2g14NFWWfQ6pqcKWlAs4ZBS9qr4T28yal2q7lK5fg+5QpqXf2Vnrs/c1VzWe8
 Uxk5DED5UuYyEUw4ewYOONv+DgIqdE6OtZMmrmY2zYY38gI/ahi03JDEoTrWq1Kf/oIB
 +C6Zh/XpFa6a/L+aOaJdnxu1VbH2iB4QFQ39GG3tWMd9/IVdvPX578KagSxa2dvT3Yuq
 oQToJvBEcAN0qmpsiFtS41S3Fhpi0IvRTmxeCdz711K1hmO94MUcN0BiPtc5ZvFaUIkM
 eDQoMez/3/WbclaQ87ubmRCp6P19kdIZD0XAgrmi0QybHFU0DLDvpnnMauLzXiizEg6T
 lH8Q==
X-Gm-Message-State: APjAAAWtPlSbHrG+unvW+XFC0PiRhWyrF9d5Bv7+ZBtPSy96wD9h8R9B
 X2Rth1iM6Zwd2p1ZiVozgSE=
X-Google-Smtp-Source: APXvYqzzllbFm5p1RJ6Hv9sdYEOY7jdZkiYuzxv4vZdIzU4+gyWXMgDLOAREt7Tj2iCCice8+nHYSA==
X-Received: by 2002:a17:902:24b:: with SMTP id
 69mr123385473plc.250.1564712458970; 
 Thu, 01 Aug 2019 19:20:58 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:58 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:20:01 -0700
Message-Id: <20190802022005.5117-31-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 30/34] crypt: convert put_page() to
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
 rds-devel@oss.oracle.com, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogSGVyYmVy
dCBYdSA8aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1PgpDYzogRGF2aWQgUy4gTWlsbGVyIDxk
YXZlbUBkYXZlbWxvZnQubmV0PgpDYzogbGludXgtY3J5cHRvQHZnZXIua2VybmVsLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogY3J5cHRv
L2FmX2FsZy5jIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NyeXB0by9hZl9hbGcuYyBiL2NyeXB0by9hZl9h
bGcuYwppbmRleCA4NzljZjIzZjc0ODkuLmVkZDM1OGVhNjRkYSAxMDA2NDQKLS0tIGEvY3J5cHRv
L2FmX2FsZy5jCisrKyBiL2NyeXB0by9hZl9hbGcuYwpAQCAtNDI4LDEwICs0MjgsNyBAQCBzdGF0
aWMgdm9pZCBhZl9hbGdfbGlua19zZyhzdHJ1Y3QgYWZfYWxnX3NnbCAqc2dsX3ByZXYsCiAKIHZv
aWQgYWZfYWxnX2ZyZWVfc2coc3RydWN0IGFmX2FsZ19zZ2wgKnNnbCkKIHsKLQlpbnQgaTsKLQot
CWZvciAoaSA9IDA7IGkgPCBzZ2wtPm5wYWdlczsgaSsrKQotCQlwdXRfcGFnZShzZ2wtPnBhZ2Vz
W2ldKTsKKwlwdXRfdXNlcl9wYWdlcyhzZ2wtPnBhZ2VzLCBzZ2wtPm5wYWdlcyk7CiB9CiBFWFBP
UlRfU1lNQk9MX0dQTChhZl9hbGdfZnJlZV9zZyk7CiAKQEAgLTY2OCw3ICs2NjUsNyBAQCBzdGF0
aWMgdm9pZCBhZl9hbGdfZnJlZV9hcmVxX3NnbHMoc3RydWN0IGFmX2FsZ19hc3luY19yZXEgKmFy
ZXEpCiAJCWZvcl9lYWNoX3NnKHRzZ2wsIHNnLCBhcmVxLT50c2dsX2VudHJpZXMsIGkpIHsKIAkJ
CWlmICghc2dfcGFnZShzZykpCiAJCQkJY29udGludWU7Ci0JCQlwdXRfcGFnZShzZ19wYWdlKHNn
KSk7CisJCQlwdXRfdXNlcl9wYWdlKHNnX3BhZ2Uoc2cpKTsKIAkJfQogCiAJCXNvY2tfa2ZyZWVf
cyhzaywgdHNnbCwgYXJlcS0+dHNnbF9lbnRyaWVzICogc2l6ZW9mKCp0c2dsKSk7Ci0tIAoyLjIy
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
