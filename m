Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6D884003
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:37:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAqu-0001z3-Kj; Wed, 07 Aug 2019 01:34:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAqq-0001rq-6E
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:52 +0000
X-Inumbo-ID: 8c5140cb-b8b3-11e9-8980-bc764e045a96
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8c5140cb-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:50 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id u17so42544431pgi.6
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iyBF/TunLLNE9m64WGZW5xnvl+XVp1Tkb/4cWK4Q28U=;
 b=eabm6eV7x6nJ3H6jB3OWHKTAjJ5hccshhWRSvyF8YaL4Xb3kcN3FPSj+mrT7hdf1FM
 0MWhm5PqlQFyy6zw76EwLtyOlQEQTOAPUCRq2cKY8d4yFrfincU70ZRfebLbmlijIWR2
 wTENuQ2R1ycfB8EIZdvDLYgUy7fahn8NbpOFjvcP7wPItsW4fy1klzu0bIomS6ZhLV9L
 FATmBTkmPO3bz1bBRYsOrrqOVmLfRrGMChgnyEYGXYwKFOo3GWkjWYe147H72f0kIcVc
 Tr73f17ZMCrLU+eCYt8HTv90LoBSVz+pg0lUMLNh1TQmkPNzI1sbpCYBSoNZ3shE6svq
 cn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iyBF/TunLLNE9m64WGZW5xnvl+XVp1Tkb/4cWK4Q28U=;
 b=mTGU5i2APoRXZCZvN0oL+9tlL8tpVyJWYo5qqXX+8f+BNIwMlZKS+FzMQZWbQJzYRZ
 iebiv88zVTvfoNVmxI++LSXKLi8SXwOdp54iDRXJjd51ra+CLvvljthYFxts65Y/w3kb
 eS2rWoKH1Rodi9MRr9ZXJJVlYaPjOsfaqI0No626xBqRmJH3kv3JQby/TjRvmxXJM4wj
 scAZMaGz0vRAtS/kDb050Bcx0OL7AN9HvCH9JTG7FbZaTmR+4mlpKzb183xVkEBoIgQv
 q4FpEQyuAphh8ikc+pYGYK4y+EnFfLBjraSjfLbaqZtb+uNN3Pc15TKmduJGXbulL/2P
 Y2Lg==
X-Gm-Message-State: APjAAAXaJZhrlgrjtvcXxfEgMI1ss9y2n/6aVITe4w/u0VWibEEYAWut
 D1HYWMn5SgqTwoOGSDNWmTY=
X-Google-Smtp-Source: APXvYqz3mrxPCB1S0CW+dxLuweNihe5G+Md2rLL8K5hOTJIrjMzyu1ZdPrsndXXUg8jjoSZHHVCyxA==
X-Received: by 2002:a62:14c4:: with SMTP id 187mr6515801pfu.241.1565141690166; 
 Tue, 06 Aug 2019 18:34:50 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:49 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:40 -0700
Message-Id: <20190807013340.9706-42-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 41/41] mm/ksm: convert put_page() to
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
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Daniel Black <daniel@linux.ibm.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogRGFuIFdp
bGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNjOiBEYW5pZWwgQmxhY2sgPGRhbmll
bEBsaW51eC5pYm0uY29tPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IErDqXLDtG1l
IEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGlu
ZnJhZGVhZC5vcmc+CkNjOiBNaWtlIEtyYXZldHogPG1pa2Uua3JhdmV0ekBvcmFjbGUuY29tPgpT
aWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogbW0v
a3NtLmMgfCAxNCArKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9rc20uYyBiL21tL2tzbS5jCmluZGV4
IDNkYzQzNDY0MTFlNC4uZTEwZWU0ZDVmZGQ4IDEwMDY0NAotLS0gYS9tbS9rc20uYworKysgYi9t
bS9rc20uYwpAQCAtNDU2LDcgKzQ1Niw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBrc21fdGVzdF9l
eGl0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQogICogV2UgdXNlIGJyZWFrX2tzbSB0byBicmVhayBD
T1cgb24gYSBrc20gcGFnZTogaXQncyBhIHN0cmlwcGVkIGRvd24KICAqCiAgKglpZiAoZ2V0X3Vz
ZXJfcGFnZXMoYWRkciwgMSwgMSwgMSwgJnBhZ2UsIE5VTEwpID09IDEpCi0gKgkJcHV0X3BhZ2Uo
cGFnZSk7CisgKgkJcHV0X3VzZXJfcGFnZShwYWdlKTsKICAqCiAgKiBidXQgdGFraW5nIGdyZWF0
IGNhcmUgb25seSB0byB0b3VjaCBhIGtzbSBwYWdlLCBpbiBhIFZNX01FUkdFQUJMRSB2bWEsCiAg
KiBpbiBjYXNlIHRoZSBhcHBsaWNhdGlvbiBoYXMgdW5tYXBwZWQgYW5kIHJlbWFwcGVkIG1tLGFk
ZHIgbWVhbndoaWxlLgpAQCAtNDgzLDcgKzQ4Myw3IEBAIHN0YXRpYyBpbnQgYnJlYWtfa3NtKHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIpCiAJCQkJCUZBVUxU
X0ZMQUdfV1JJVEUgfCBGQVVMVF9GTEFHX1JFTU9URSk7CiAJCWVsc2UKIAkJCXJldCA9IFZNX0ZB
VUxUX1dSSVRFOwotCQlwdXRfcGFnZShwYWdlKTsKKwkJcHV0X3VzZXJfcGFnZShwYWdlKTsKIAl9
IHdoaWxlICghKHJldCAmIChWTV9GQVVMVF9XUklURSB8IFZNX0ZBVUxUX1NJR0JVUyB8IFZNX0ZB
VUxUX1NJR1NFR1YgfCBWTV9GQVVMVF9PT00pKSk7CiAJLyoKIAkgKiBXZSBtdXN0IGxvb3AgYmVj
YXVzZSBoYW5kbGVfbW1fZmF1bHQoKSBtYXkgYmFjayBvdXQgaWYgdGhlcmUncwpAQCAtNTY4LDcg
KzU2OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqZ2V0X21lcmdlYWJsZV9wYWdlKHN0cnVjdCBy
bWFwX2l0ZW0gKnJtYXBfaXRlbSkKIAkJZmx1c2hfYW5vbl9wYWdlKHZtYSwgcGFnZSwgYWRkcik7
CiAJCWZsdXNoX2RjYWNoZV9wYWdlKHBhZ2UpOwogCX0gZWxzZSB7Ci0JCXB1dF9wYWdlKHBhZ2Up
OworCQlwdXRfdXNlcl9wYWdlKHBhZ2UpOwogb3V0OgogCQlwYWdlID0gTlVMTDsKIAl9CkBAIC0x
OTc0LDEwICsxOTc0LDEwIEBAIHN0cnVjdCBybWFwX2l0ZW0gKnVuc3RhYmxlX3RyZWVfc2VhcmNo
X2luc2VydChzdHJ1Y3Qgcm1hcF9pdGVtICpybWFwX2l0ZW0sCiAKIAkJcGFyZW50ID0gKm5ldzsK
IAkJaWYgKHJldCA8IDApIHsKLQkJCXB1dF9wYWdlKHRyZWVfcGFnZSk7CisJCQlwdXRfdXNlcl9w
YWdlKHRyZWVfcGFnZSk7CiAJCQluZXcgPSAmcGFyZW50LT5yYl9sZWZ0OwogCQl9IGVsc2UgaWYg
KHJldCA+IDApIHsKLQkJCXB1dF9wYWdlKHRyZWVfcGFnZSk7CisJCQlwdXRfdXNlcl9wYWdlKHRy
ZWVfcGFnZSk7CiAJCQluZXcgPSAmcGFyZW50LT5yYl9yaWdodDsKIAkJfSBlbHNlIGlmICgha3Nt
X21lcmdlX2Fjcm9zc19ub2RlcyAmJgogCQkJICAgcGFnZV90b19uaWQodHJlZV9wYWdlKSAhPSBu
aWQpIHsKQEAgLTE5ODYsNyArMTk4Niw3IEBAIHN0cnVjdCBybWFwX2l0ZW0gKnVuc3RhYmxlX3Ry
ZWVfc2VhcmNoX2luc2VydChzdHJ1Y3Qgcm1hcF9pdGVtICpybWFwX2l0ZW0sCiAJCQkgKiBpdCB3
aWxsIGJlIGZsdXNoZWQgb3V0IGFuZCBwdXQgaW4gdGhlIHJpZ2h0IHVuc3RhYmxlCiAJCQkgKiB0
cmVlIG5leHQgdGltZTogb25seSBtZXJnZSB3aXRoIGl0IHdoZW4gYWNyb3NzX25vZGVzLgogCQkJ
ICovCi0JCQlwdXRfcGFnZSh0cmVlX3BhZ2UpOworCQkJcHV0X3VzZXJfcGFnZSh0cmVlX3BhZ2Up
OwogCQkJcmV0dXJuIE5VTEw7CiAJCX0gZWxzZSB7CiAJCQkqdHJlZV9wYWdlcCA9IHRyZWVfcGFn
ZTsKQEAgLTIzMjgsNyArMjMyOCw3IEBAIHN0YXRpYyBzdHJ1Y3Qgcm1hcF9pdGVtICpzY2FuX2dl
dF9uZXh0X3JtYXBfaXRlbShzdHJ1Y3QgcGFnZSAqKnBhZ2UpCiAJCQkJCQkJJnJtYXBfaXRlbS0+
cm1hcF9saXN0OwogCQkJCQlrc21fc2Nhbi5hZGRyZXNzICs9IFBBR0VfU0laRTsKIAkJCQl9IGVs
c2UKLQkJCQkJcHV0X3BhZ2UoKnBhZ2UpOworCQkJCQlwdXRfdXNlcl9wYWdlKCpwYWdlKTsKIAkJ
CQl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOwogCQkJCXJldHVybiBybWFwX2l0ZW07CiAJCQl9Ci0t
IAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
