Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 381CC8408A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:38:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAqA-0000Xn-4j; Wed, 07 Aug 2019 01:34:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAq8-0000WA-5h
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:08 +0000
X-Inumbo-ID: 72735be6-b8b3-11e9-8980-bc764e045a96
Received: from mail-pl1-x643.google.com (unknown [2607:f8b0:4864:20::643])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 72735be6-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:07 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id w24so38588793plp.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j5bjFl/k0oxV1FIP4HazX0NuQurNmMvZSnaBil5PKNk=;
 b=abC7vf0m4NHfC38BFCAMKWrCml8VHI8/tyJOz6tyKPGPsXxu0DOdz37V6xN3Thg1Zd
 UpeVYry5AG+h4scE5ih6O8+arLoECywsGCioTsrKWxm7sB389EG9oJuSV29/gE7h0LS0
 y5iguaVXKirIQlusYbxFmgE9r3+yptBAJLiq272v0Sl/QhyMLH3XCxKVguovo2yydY/e
 hPsoqdmsX1oREmKqBP2kENq5c26aaO0nlO2uQS585/gxX2DEptCDorR5OVzgCXwYNt2m
 opAr5jpbK/bXJNfg691sG72tAWDskEyT8B3AWzTTbwOCvmhfW6ETVYtk14IOwNSue0Fc
 R2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j5bjFl/k0oxV1FIP4HazX0NuQurNmMvZSnaBil5PKNk=;
 b=XCd5HymjhlTn4gcnBqENiw5dHr1Z65eXIR94rvJ2LLSUYvWE3JP963JCNffBTznBO8
 V6Eo1G4m0CVb8Jty4ZwohSUyQP82jlfyuyCvJI/IdpOGCTpr6qNgxk5VWzt5+4yYxmFO
 3F7A26XrAaoq8JAQq2/QM0fDEJhu7yblgMbL2ZK9ebshp1yrc4s/s54K3u8J/La5BuWp
 K48nrqeARUkqfUTlg54uOW/4nDB8d2wMCodCaR7hGYiTtSxFFiTA/FnhHn3trHKOgcr3
 mlxPeb+RjoBEfqjZ2A6vxZ4bB8KOlTDlLXo7nZLt7HpyIlQrTDJysRn4rQ3jsvb8dXE6
 ivyg==
X-Gm-Message-State: APjAAAW4oYDJS86Ntxl4p4RC2evOToMgWxNu8jUkJ2Nj02kPfZFKEE1e
 q1bSFoUKg7sIsQvnId8aEoQ=
X-Google-Smtp-Source: APXvYqw7+dnuyU0Y8q/AKeAaMraB2bbAgVOsWO8V26J8bDVfSW5vhARN1nLU2+DyCWOsFFzTtXKGNQ==
X-Received: by 2002:a17:902:e2:: with SMTP id
 a89mr5940458pla.210.1565141646808; 
 Tue, 06 Aug 2019 18:34:06 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:06 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:13 -0700
Message-Id: <20190807013340.9706-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 14/41] vmci: convert put_page() to
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
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
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
QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KQ2M6IEFsIFZpcm8gPHZpcm9AemVuaXYubGlu
dXgub3JnLnVrPgpDYzogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNv
bT4KQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBK
b2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9taXNjL3Ztd192
bWNpL3ZtY2lfY29udGV4dC5jICAgIHwgIDIgKy0KIGRyaXZlcnMvbWlzYy92bXdfdm1jaS92bWNp
X3F1ZXVlX3BhaXIuYyB8IDExICsrLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL3Ztd192
bWNpL3ZtY2lfY29udGV4dC5jIGIvZHJpdmVycy9taXNjL3Ztd192bWNpL3ZtY2lfY29udGV4dC5j
CmluZGV4IDE2Njk1MzY2ZWM5Mi4uOWRhYTUyZWU2M2I3IDEwMDY0NAotLS0gYS9kcml2ZXJzL21p
c2Mvdm13X3ZtY2kvdm1jaV9jb250ZXh0LmMKKysrIGIvZHJpdmVycy9taXNjL3Ztd192bWNpL3Zt
Y2lfY29udGV4dC5jCkBAIC01ODcsNyArNTg3LDcgQEAgdm9pZCB2bWNpX2N0eF91bnNldF9ub3Rp
Znkoc3RydWN0IHZtY2lfY3R4ICpjb250ZXh0KQogCiAJaWYgKG5vdGlmeV9wYWdlKSB7CiAJCWt1
bm1hcChub3RpZnlfcGFnZSk7Ci0JCXB1dF9wYWdlKG5vdGlmeV9wYWdlKTsKKwkJcHV0X3VzZXJf
cGFnZShub3RpZnlfcGFnZSk7CiAJfQogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2Mvdm13
X3ZtY2kvdm1jaV9xdWV1ZV9wYWlyLmMgYi9kcml2ZXJzL21pc2Mvdm13X3ZtY2kvdm1jaV9xdWV1
ZV9wYWlyLmMKaW5kZXggODUzMWFlNzgxMTk1Li5lNTQzNDU1MWQwZWYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbWlzYy92bXdfdm1jaS92bWNpX3F1ZXVlX3BhaXIuYworKysgYi9kcml2ZXJzL21pc2Mv
dm13X3ZtY2kvdm1jaV9xdWV1ZV9wYWlyLmMKQEAgLTYyNiwxNSArNjI2LDggQEAgc3RhdGljIHZv
aWQgcXBfcmVsZWFzZV9xdWV1ZV9tdXRleChzdHJ1Y3Qgdm1jaV9xdWV1ZSAqcXVldWUpCiBzdGF0
aWMgdm9pZCBxcF9yZWxlYXNlX3BhZ2VzKHN0cnVjdCBwYWdlICoqcGFnZXMsCiAJCQkgICAgIHU2
NCBudW1fcGFnZXMsIGJvb2wgZGlydHkpCiB7Ci0JaW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBpIDwg
bnVtX3BhZ2VzOyBpKyspIHsKLQkJaWYgKGRpcnR5KQotCQkJc2V0X3BhZ2VfZGlydHkocGFnZXNb
aV0pOwotCi0JCXB1dF9wYWdlKHBhZ2VzW2ldKTsKLQkJcGFnZXNbaV0gPSBOVUxMOwotCX0KKwlw
dXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHBhZ2VzLCBudW1fcGFnZXMsIGRpcnR5KTsKKwltZW1z
ZXQocGFnZXMsIDAsIG51bV9wYWdlcyAqIHNpemVvZihzdHJ1Y3QgcGFnZSAqKSk7CiB9CiAKIC8q
Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
