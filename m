Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7738C7EB26
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:17:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxW-0005qZ-5W; Fri, 02 Aug 2019 04:14:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNB5-00073V-Oa
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:19 +0000
X-Inumbo-ID: 122d20c9-b4cc-11e9-8980-bc764e045a96
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 122d20c9-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:18 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y15so35161985pfn.5
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8SOviSW3O4erJ4o/T7vOdTDRu8uyyXM9kIDmKsHyj7c=;
 b=fX9VH11/xtmCZY5ktyfRXv+8oFT24qnzRAke9R5fEGSeD2IzOy84ZG8im/eaEUg8Lt
 YkXZtAgFC41AXSsr/ysnzaRAFRybM7sVVSGjTeMscCtwe6TgKQtIwxVTNVhX+CyOlaHj
 zyT65gbiAfpxTAt1YaJp886/lI6PgypiCjw7omXplGhR0qwXivcLAeNmtsNmtXQS2+4w
 xqKa+JcZGRrR5eWJB589WBbm/hXzKEauxkOa/UURNDAyCoi6UPYtZRE7atesr45WwiIq
 ErXdMxUJmMSia9/QMT7Nme9zP4x0BmIDxW3018QpZobBFVGv7P1VjjU6MaObsA2EybjP
 VU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8SOviSW3O4erJ4o/T7vOdTDRu8uyyXM9kIDmKsHyj7c=;
 b=sluyxTb3AoQNTz2Nonuu0KxB0eEkNGcYuOv8sQaDF6CPhgREzGm9evcQvdZBbMQF4S
 Yf/B3zDvEM3lhW78E245sFARNXtTtDX0Afv1YyaceAPS1UnkkU+2e0v52vYXPfsT2FHZ
 ypdodBRoyxVih5RS5+U4emOcbhx6J2GRsyZk5t8uPN1wxoiMsAUVM751pWVWJtaIj4M0
 HXma2uXIo4FHOR8TxzWxdoeFYwmjeLr+JDH3VOp6WfGH5nBTKYIasECed0sN22MslrzM
 BlVcqCz9a/N0UCPiiDc7WqsWbMU7zoUYfYVW2Fc4r5iva8Ze2X4/Ok0E7aXnOLoLY+B1
 NwtA==
X-Gm-Message-State: APjAAAXwbFTbEGVVhO69olhm/juJ5ts21OpWUT2/rpsevotcFj+F44Fw
 EYvUnCX0dtmFjQseHmxrPzg=
X-Google-Smtp-Source: APXvYqy6SxWBaLdRR2vg6Lx/woJAETS/7eDG5dTzML6C7DLLIiEKJ1wWpgVv8K7hxMNjNoQ+Y+s8Dw==
X-Received: by 2002:a17:90a:8c92:: with SMTP id
 b18mr1836391pjo.97.1564712418017; 
 Thu, 01 Aug 2019 19:20:18 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:17 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:35 -0700
Message-Id: <20190802022005.5117-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 04/34] x86/kvm: convert put_page() to
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
 =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKS4KClRoaXMgaXMgcGFydCBhIHRyZWUtd2lkZSBjb252ZXJzaW9uLCBhcyBkZXNjcmli
ZWQgaW4gY29tbWl0IGZjMWQ4ZTdjY2EyZAooIm1tOiBpbnRyb2R1Y2UgcHV0X3VzZXJfcGFnZSoo
KSwgcGxhY2Vob2xkZXIgdmVyc2lvbnMiKS4KCkNjOiBKb2VyZyBSb2VkZWwgPGpvcm9AOGJ5dGVz
Lm9yZz4KQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+CkNjOiAiUmFkaW0g
S3LEjW3DocWZIiA8cmtyY21hckByZWRoYXQuY29tPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4
QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KQ2M6ICJI
LiBQZXRlciBBbnZpbiIgPGhwYUB6eXRvci5jb20+CkNjOiB4ODZAa2VybmVsLm9yZwpDYzoga3Zt
QHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+Ci0tLQogYXJjaC94ODYva3ZtL3N2bS5jICB8IDQgKystLQogdmlydC9rdm0va3Zt
X21haW4uYyB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS5jIGIvYXJjaC94ODYva3Zt
L3N2bS5jCmluZGV4IDdlYWZjNjkwNzg2MS4uZmY5M2M5MjNlZDM2IDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9rdm0vc3ZtLmMKKysrIGIvYXJjaC94ODYva3ZtL3N2bS5jCkBAIC0xODI3LDcgKzE4Mjcs
NyBAQCBzdGF0aWMgc3RydWN0IHBhZ2UgKipzZXZfcGluX21lbW9yeShzdHJ1Y3Qga3ZtICprdm0s
IHVuc2lnbmVkIGxvbmcgdWFkZHIsCiAKIGVycjoKIAlpZiAobnBpbm5lZCA+IDApCi0JCXJlbGVh
c2VfcGFnZXMocGFnZXMsIG5waW5uZWQpOworCQlwdXRfdXNlcl9wYWdlcyhwYWdlcywgbnBpbm5l
ZCk7CiAKIAlrdmZyZWUocGFnZXMpOwogCXJldHVybiBOVUxMOwpAQCAtMTgzOCw3ICsxODM4LDcg
QEAgc3RhdGljIHZvaWQgc2V2X3VucGluX21lbW9yeShzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBw
YWdlICoqcGFnZXMsCiB7CiAJc3RydWN0IGt2bV9zZXZfaW5mbyAqc2V2ID0gJnRvX2t2bV9zdm0o
a3ZtKS0+c2V2X2luZm87CiAKLQlyZWxlYXNlX3BhZ2VzKHBhZ2VzLCBucGFnZXMpOworCXB1dF91
c2VyX3BhZ2VzKHBhZ2VzLCBucGFnZXMpOwogCWt2ZnJlZShwYWdlcyk7CiAJc2V2LT5wYWdlc19s
b2NrZWQgLT0gbnBhZ2VzOwogfQpkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3Zp
cnQva3ZtL2t2bV9tYWluLmMKaW5kZXggODg3ZjNiMGMyYjYwLi40YjZhNTk2ZWE4ZTkgMTAwNjQ0
Ci0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwpAQCAt
MTQ5OSw3ICsxNDk5LDcgQEAgc3RhdGljIGludCBodmFfdG9fcGZuX3Nsb3codW5zaWduZWQgbG9u
ZyBhZGRyLCBib29sICphc3luYywgYm9vbCB3cml0ZV9mYXVsdCwKIAogCQlpZiAoX19nZXRfdXNl
cl9wYWdlc19mYXN0KGFkZHIsIDEsIDEsICZ3cGFnZSkgPT0gMSkgewogCQkJKndyaXRhYmxlID0g
dHJ1ZTsKLQkJCXB1dF9wYWdlKHBhZ2UpOworCQkJcHV0X3VzZXJfcGFnZShwYWdlKTsKIAkJCXBh
Z2UgPSB3cGFnZTsKIAkJfQogCX0KQEAgLTE4MzEsNyArMTgzMSw3IEBAIEVYUE9SVF9TWU1CT0xf
R1BMKGt2bV9yZWxlYXNlX3BhZ2VfY2xlYW4pOwogdm9pZCBrdm1fcmVsZWFzZV9wZm5fY2xlYW4o
a3ZtX3Bmbl90IHBmbikKIHsKIAlpZiAoIWlzX2Vycm9yX25vc2xvdF9wZm4ocGZuKSAmJiAha3Zt
X2lzX3Jlc2VydmVkX3BmbihwZm4pKQotCQlwdXRfcGFnZShwZm5fdG9fcGFnZShwZm4pKTsKKwkJ
cHV0X3VzZXJfcGFnZShwZm5fdG9fcGFnZShwZm4pKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGt2
bV9yZWxlYXNlX3Bmbl9jbGVhbik7CiAKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
