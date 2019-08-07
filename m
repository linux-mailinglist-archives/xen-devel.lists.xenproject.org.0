Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1168402B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:37:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAq3-0000Rf-Bg; Wed, 07 Aug 2019 01:34:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAq2-0000RJ-8B
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:02 +0000
X-Inumbo-ID: 6ead98d3-b8b3-11e9-8980-bc764e045a96
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6ead98d3-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:01 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id r26so6586546pgl.10
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=51+On65LrNSvXr2lp5EjmvkWwZiof+VzaE7I05DxrV4=;
 b=HS5hgHLQTuHN2Sn9FeJ7Ry9Shi37CsQ8JBuMgzW+QMGy5IXf/RFsCZt6S1x06XBeQi
 DnjGCaTAaZsljEKwzFgSKCv3YKZyY9LJk5C71dTnu0TTqdIkluqZnGH65tZnImTYNKAd
 2pWlz2fyn5+MKPzhhgK7Nc+MXto5LZw4BYu52Kq3r1UDWXa+Eo9UCDH4MczS5x/pQmnw
 VRUedCXK07PgrjjNVT2/ovRym41o4od9NHcnmASHKSTmbkxw8flhZPB1nOgA8m/sENwh
 Lvo4EfzFR3bHyNsXSJiKXO3OmKyrCfkmolY0a3G9Y5UDT+HZQc4MDN5LW5udmGwvXApo
 r3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=51+On65LrNSvXr2lp5EjmvkWwZiof+VzaE7I05DxrV4=;
 b=IEzUkINLf6saPaJ+QkaNz7WmxSLbPHGujYlAD3mCdYzhwBgMlqJbgue0AtbNqwSzVM
 gfAF3JT7VujavwpMImC9GEqY4fXuCrRw2iGv4DlgO9Z5uh8E7XlFHWtic7m4JCET/bzl
 DBAL38CyW4cNq6h9vsQV2HcwG+7hC4177FPS2jhBAZ29GSlmJpNN3bYW5GG/C2L/LnxF
 V/HR+86CZIysWmZHt+fLn/Npek2+cFQiDpw/abXTmUfhoqL144iTpaiAieRoiTE6rQEV
 nF7IjzDl7YKcCOoXJXS0/VqO4vmSvIJbdTrbnjDb7Vvw5AX5ZLckd4lQqch9qK76CANr
 8lEg==
X-Gm-Message-State: APjAAAX1UcO+EmcTRWux8CDx/fNE7jdQl+0K/M0T2UzLL8v9rq7VtJE7
 OY0+H3rTB0+C2Tt4ol9cyZg=
X-Google-Smtp-Source: APXvYqyf93EQUF5J1TAu6cpDsM1o6JoPpYe+Wwb8uLsZYmcgqFaJy5X85xn6gzZV4mlFfmMiaJJNdA==
X-Received: by 2002:a17:90a:9f4a:: with SMTP id
 q10mr5945834pjv.95.1565141640357; 
 Tue, 06 Aug 2019 18:34:00 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.33.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:33:59 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:09 -0700
Message-Id: <20190807013340.9706-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 10/41] media/ivtv: convert put_page() to
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
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Andy Walls <awalls@md.metrocast.net>, netdev@vger.kernel.org,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQW5keSBX
YWxscyA8YXdhbGxzQG1kLm1ldHJvY2FzdC5uZXQ+CkNjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWJAa2VybmVsLm9yZz4KQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVy
cy9tZWRpYS9wY2kvaXZ0di9pdnR2LXVkbWEuYyB8IDE0ICsrKystLS0tLS0tLS0tCiBkcml2ZXJz
L21lZGlhL3BjaS9pdnR2L2l2dHYteXV2LmMgIHwgMTEgKysrLS0tLS0tLS0KIDIgZmlsZXMgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHYtdWRtYS5jIGIvZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9p
dnR2LXVkbWEuYwppbmRleCA1Zjg4ODMwMzFjOWMuLjdjN2YzM2MyNDEyYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2LXVkbWEuYworKysgYi9kcml2ZXJzL21lZGlhL3Bj
aS9pdnR2L2l2dHYtdWRtYS5jCkBAIC05Miw3ICs5Miw3IEBAIGludCBpdnR2X3VkbWFfc2V0dXAo
c3RydWN0IGl2dHYgKml0diwgdW5zaWduZWQgbG9uZyBpdnR2X2Rlc3RfYWRkciwKIHsKIAlzdHJ1
Y3QgaXZ0dl9kbWFfcGFnZV9pbmZvIHVzZXJfZG1hOwogCXN0cnVjdCBpdnR2X3VzZXJfZG1hICpk
bWEgPSAmaXR2LT51ZG1hOwotCWludCBpLCBlcnI7CisJaW50IGVycjsKIAogCUlWVFZfREVCVUdf
RE1BKCJpdnR2X3VkbWFfc2V0dXAsIGRzdDogMHglMDh4XG4iLCAodW5zaWduZWQgaW50KWl2dHZf
ZGVzdF9hZGRyKTsKIApAQCAtMTE5LDggKzExOSw3IEBAIGludCBpdnR2X3VkbWFfc2V0dXAoc3Ry
dWN0IGl2dHYgKml0diwgdW5zaWduZWQgbG9uZyBpdnR2X2Rlc3RfYWRkciwKIAkJSVZUVl9ERUJV
R19XQVJOKCJmYWlsZWQgdG8gbWFwIHVzZXIgcGFnZXMsIHJldHVybmVkICVkIGluc3RlYWQgb2Yg
JWRcbiIsCiAJCQkgICBlcnIsIHVzZXJfZG1hLnBhZ2VfY291bnQpOwogCQlpZiAoZXJyID49IDAp
IHsKLQkJCWZvciAoaSA9IDA7IGkgPCBlcnI7IGkrKykKLQkJCQlwdXRfcGFnZShkbWEtPm1hcFtp
XSk7CisJCQlwdXRfdXNlcl9wYWdlcyhkbWEtPm1hcCwgZXJyKTsKIAkJCXJldHVybiAtRUlOVkFM
OwogCQl9CiAJCXJldHVybiBlcnI7CkBAIC0xMzAsOSArMTI5LDcgQEAgaW50IGl2dHZfdWRtYV9z
ZXR1cChzdHJ1Y3QgaXZ0diAqaXR2LCB1bnNpZ25lZCBsb25nIGl2dHZfZGVzdF9hZGRyLAogCiAJ
LyogRmlsbCBTRyBMaXN0IHdpdGggbmV3IHZhbHVlcyAqLwogCWlmIChpdnR2X3VkbWFfZmlsbF9z
Z19saXN0KGRtYSwgJnVzZXJfZG1hLCAwKSA8IDApIHsKLQkJZm9yIChpID0gMDsgaSA8IGRtYS0+
cGFnZV9jb3VudDsgaSsrKSB7Ci0JCQlwdXRfcGFnZShkbWEtPm1hcFtpXSk7Ci0JCX0KKwkJcHV0
X3VzZXJfcGFnZXMoZG1hLT5tYXAsIGRtYS0+cGFnZV9jb3VudCk7CiAJCWRtYS0+cGFnZV9jb3Vu
dCA9IDA7CiAJCXJldHVybiAtRU5PTUVNOwogCX0KQEAgLTE1Myw3ICsxNTAsNiBAQCBpbnQgaXZ0
dl91ZG1hX3NldHVwKHN0cnVjdCBpdnR2ICppdHYsIHVuc2lnbmVkIGxvbmcgaXZ0dl9kZXN0X2Fk
ZHIsCiB2b2lkIGl2dHZfdWRtYV91bm1hcChzdHJ1Y3QgaXZ0diAqaXR2KQogewogCXN0cnVjdCBp
dnR2X3VzZXJfZG1hICpkbWEgPSAmaXR2LT51ZG1hOwotCWludCBpOwogCiAJSVZUVl9ERUJVR19J
TkZPKCJpdnR2X3VubWFwX3VzZXJfZG1hXG4iKTsKIApAQCAtMTcwLDkgKzE2Niw3IEBAIHZvaWQg
aXZ0dl91ZG1hX3VubWFwKHN0cnVjdCBpdnR2ICppdHYpCiAJaXZ0dl91ZG1hX3N5bmNfZm9yX2Nw
dShpdHYpOwogCiAJLyogUmVsZWFzZSBVc2VyIFBhZ2VzICovCi0JZm9yIChpID0gMDsgaSA8IGRt
YS0+cGFnZV9jb3VudDsgaSsrKSB7Ci0JCXB1dF9wYWdlKGRtYS0+bWFwW2ldKTsKLQl9CisJcHV0
X3VzZXJfcGFnZXMoZG1hLT5tYXAsIGRtYS0+cGFnZV9jb3VudCk7CiAJZG1hLT5wYWdlX2NvdW50
ID0gMDsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2LXl1di5j
IGIvZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2LXl1di5jCmluZGV4IGNkMmZlMmQ0NDRjMC4u
MmM2MWExMWQzOTFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHYteXV2
LmMKKysrIGIvZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2LXl1di5jCkBAIC0zMCw3ICszMCw2
IEBAIHN0YXRpYyBpbnQgaXZ0dl95dXZfcHJlcF91c2VyX2RtYShzdHJ1Y3QgaXZ0diAqaXR2LCBz
dHJ1Y3QgaXZ0dl91c2VyX2RtYSAqZG1hLAogCXN0cnVjdCB5dXZfcGxheWJhY2tfaW5mbyAqeWkg
PSAmaXR2LT55dXZfaW5mbzsKIAl1OCBmcmFtZSA9IHlpLT5kcmF3X2ZyYW1lOwogCXN0cnVjdCB5
dXZfZnJhbWVfaW5mbyAqZiA9ICZ5aS0+bmV3X2ZyYW1lX2luZm9bZnJhbWVdOwotCWludCBpOwog
CWludCB5X3BhZ2VzLCB1dl9wYWdlczsKIAl1bnNpZ25lZCBsb25nIHlfYnVmZmVyX29mZnNldCwg
dXZfYnVmZmVyX29mZnNldDsKIAlpbnQgeV9kZWNvZGVfaGVpZ2h0LCB1dl9kZWNvZGVfaGVpZ2h0
LCB5X3NpemU7CkBAIC04MSw4ICs4MCw3IEBAIHN0YXRpYyBpbnQgaXZ0dl95dXZfcHJlcF91c2Vy
X2RtYShzdHJ1Y3QgaXZ0diAqaXR2LCBzdHJ1Y3QgaXZ0dl91c2VyX2RtYSAqZG1hLAogCQkJCSB1
dl9wYWdlcywgdXZfZG1hLnBhZ2VfY291bnQpOwogCiAJCQlpZiAodXZfcGFnZXMgPj0gMCkgewot
CQkJCWZvciAoaSA9IDA7IGkgPCB1dl9wYWdlczsgaSsrKQotCQkJCQlwdXRfcGFnZShkbWEtPm1h
cFt5X3BhZ2VzICsgaV0pOworCQkJCXB1dF91c2VyX3BhZ2VzKCZkbWEtPm1hcFt5X3BhZ2VzXSwg
dXZfcGFnZXMpOwogCQkJCXJjID0gLUVGQVVMVDsKIAkJCX0gZWxzZSB7CiAJCQkJcmMgPSB1dl9w
YWdlczsKQEAgLTkzLDggKzkxLDcgQEAgc3RhdGljIGludCBpdnR2X3l1dl9wcmVwX3VzZXJfZG1h
KHN0cnVjdCBpdnR2ICppdHYsIHN0cnVjdCBpdnR2X3VzZXJfZG1hICpkbWEsCiAJCQkJIHlfcGFn
ZXMsIHlfZG1hLnBhZ2VfY291bnQpOwogCQl9CiAJCWlmICh5X3BhZ2VzID49IDApIHsKLQkJCWZv
ciAoaSA9IDA7IGkgPCB5X3BhZ2VzOyBpKyspCi0JCQkJcHV0X3BhZ2UoZG1hLT5tYXBbaV0pOwor
CQkJcHV0X3VzZXJfcGFnZXMoZG1hLT5tYXAsIHlfcGFnZXMpOwogCQkJLyoKIAkJCSAqIEluaGVy
aXQgdGhlIC1FRkFVTFQgZnJvbSByYydzCiAJCQkgKiBpbml0aWFsaXphdGlvbiwgYnV0IGFsbG93
IGl0IHRvIGJlCkBAIC0xMTIsOSArMTA5LDcgQEAgc3RhdGljIGludCBpdnR2X3l1dl9wcmVwX3Vz
ZXJfZG1hKHN0cnVjdCBpdnR2ICppdHYsIHN0cnVjdCBpdnR2X3VzZXJfZG1hICpkbWEsCiAJLyog
RmlsbCAmIG1hcCBTRyBMaXN0ICovCiAJaWYgKGl2dHZfdWRtYV9maWxsX3NnX2xpc3QgKGRtYSwg
JnV2X2RtYSwgaXZ0dl91ZG1hX2ZpbGxfc2dfbGlzdCAoZG1hLCAmeV9kbWEsIDApKSA8IDApIHsK
IAkJSVZUVl9ERUJVR19XQVJOKCJjb3VsZCBub3QgYWxsb2NhdGUgYm91bmNlIGJ1ZmZlcnMgZm9y
IGhpZ2htZW0gdXNlcnNwYWNlIGJ1ZmZlcnNcbiIpOwotCQlmb3IgKGkgPSAwOyBpIDwgZG1hLT5w
YWdlX2NvdW50OyBpKyspIHsKLQkJCXB1dF9wYWdlKGRtYS0+bWFwW2ldKTsKLQkJfQorCQlwdXRf
dXNlcl9wYWdlcyhkbWEtPm1hcCwgZG1hLT5wYWdlX2NvdW50KTsKIAkJZG1hLT5wYWdlX2NvdW50
ID0gMDsKIAkJcmV0dXJuIC1FTk9NRU07CiAJfQotLSAKMi4yMi4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
