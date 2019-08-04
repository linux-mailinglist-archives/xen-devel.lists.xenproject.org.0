Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA8280E23
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:53:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPKN-0004qn-4n; Sun, 04 Aug 2019 22:50:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPKK-0004l3-Tp
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:50:08 +0000
X-Inumbo-ID: 34a5330b-b70a-11e9-8980-bc764e045a96
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 34a5330b-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:50:07 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id c14so35603801plo.0
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4iYkOl3aeyTERThJenFq1/3UwJx4Onl0nTT+k7YLDaI=;
 b=amp4rnRki7aZFblJwd+WR3AEEzT5jM0SqyuAgEV5CpAXAAopEM+ITm1VpHO/SXfmvR
 bo3NeFkBoHD+nAtlrBJ99G13P743PgNgDEkm2beH5ytNMeAvvksIb5/nFkswd7I26BcB
 Cu1H5Ec5GdgS9K1iSW46QqjiHGOk9ncTBdveqncGI12f820ka+y3wAT0qtpPsphaALcE
 KARWU4xHW0EFsjyrCk3ygT7cspgIvwlFXf07QJTASmi0+CbMzKJ+WTLfULPC2/v9VrXO
 To6FnxsBZLTmhG738lrtTmoKuXplA6aK9GPBNooGQXp1H7hHSJ+TLir+Hjd5setkxK8q
 WV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4iYkOl3aeyTERThJenFq1/3UwJx4Onl0nTT+k7YLDaI=;
 b=feJm7S1F88p4HsPw3TjkhJWLxoihS8Lgy9u0TTGiIEdcgaB2LYo9WTMhCl4zgTTZ6u
 nXdf9o351v8br3gcM7MtLpHGd/dNxB6pgqupV83eOZw8qtlrbDLUPKhi4rlDz6beTMmP
 HI2I5M+iQbVD+h4m9N+/2Qy3EagiPCcv6pW3UEJCSymu5H4qpwVuKeBEJi2wwPtcTH3J
 MUZmyvy023R2+zpZp87vSTFdhnt54SeavD4G5dpySbk/cym1N0C/TEAp98miD/mMO6GA
 5sAkg9n7T9Xr9yWuwlqpeiMQnDRLr/qEa/xD1rV43423rrABTJfVsPOGyGkwzt/Io9XD
 /xbA==
X-Gm-Message-State: APjAAAUzPztcheEbBQMQTAIyfoFZFn3Z2KCPMWKjo1R97hOTlMNWXktr
 KWiYgZvXgygR3s75LN0Vru4=
X-Google-Smtp-Source: APXvYqxMhyr2kFbHr1O04Zbn2AO0Z+HHRdZeT7lsPwl/97dZ/e7++C1RY1spQOQBhYkgPZq+HBfy0Q==
X-Received: by 2002:a17:902:20e9:: with SMTP id
 v38mr45178412plg.62.1564959007040; 
 Sun, 04 Aug 2019 15:50:07 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.50.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:06 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:49:11 -0700
Message-Id: <20190804224915.28669-31-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 30/34] crypt: convert put_page() to
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
