Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C92A5A49E5
	for <lists+xen-devel@lfdr.de>; Sun,  1 Sep 2019 16:52:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4RAe-000370-7Y; Sun, 01 Sep 2019 14:49:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cmsq=W4=gmail.com=adam.zerella@srs-us1.protection.inumbo.net>)
 id 1i4Jpx-00018G-IV
 for xen-devel@lists.xenproject.org; Sun, 01 Sep 2019 06:59:45 +0000
X-Inumbo-ID: 1405dd66-cc86-11e9-ac23-bc764e2007e4
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1405dd66-cc86-11e9-ac23-bc764e2007e4;
 Sun, 01 Sep 2019 06:59:44 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id n9so5657175pgc.1
 for <xen-devel@lists.xenproject.org>; Sat, 31 Aug 2019 23:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ksunGhRAcBahaT7W6iFOAG/wY/nv2ICL8Nw4My/hTvE=;
 b=MIuk7Q+K0WGao5uA3+VT0F2UNG7iwCxqBSE3s47K4thfifDSTYwyUFGzXF/qoFpSBX
 z3brLVeOyzjpV8s2XT1vH+xfHi3Xk5b/bNVvYDbcL7im++/PERMrJLdfY1eTyGKvxoGa
 9eRAO748Aku/xxXieY04PW/9NSWhsVTk9dDiAesdTlqJ97ky109hWip/JU5/RI0xjc+k
 ccUjrK3gp8td295bQnEGbwoPJf29paBnNDB+dBu3QGBDo80SiWzr2U4V9dc9I5oA5oR4
 xCDChSYDqOBLbqsFNp1Db3FmpOlaJltxDG1YJPiAUxt+YmtWBB9VUPKMar0qExkrvx7D
 HfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ksunGhRAcBahaT7W6iFOAG/wY/nv2ICL8Nw4My/hTvE=;
 b=P1sHCKxw+uwyXRWHxCwbUfcKHxs+fmOuQ8JwqI34W57oaEzRxfu5Mw09kNNSxI4s92
 /SXTNmdZrW8whykynNOVZ07A5sVyu3gTVqMraeqHS+eeqqDxN0Wx2G6Q3UOkLnTM2X1m
 uvlQ1ys+7m5P+ZHxl42rs2IPsxAw6scPt4/nD6YYzYoFdKyABVWnWw5x/R2mvbOu2vwq
 ykgvmdytc2l3RfUmVZKEkhfTaf7G1uPp4LcTQmMwgD9G81UcCV24dZkEoH8Q68v/IFt5
 ICc4UxI1BJAI5nNJN/7XrVHUg8trS4o65aOatr0g2ytcUuo2yaaNW+RUzrL5T9Jt9zdY
 UgaA==
X-Gm-Message-State: APjAAAUSJ5b22snAQt5Pai3zMlNPvVcZ4odOlmG1DijTXvqfpQ7FFbVS
 2G6zmCm9iiNxkLvB4HyGYuU=
X-Google-Smtp-Source: APXvYqyw3yfPJHl7dWO6wj8ONfTdvPpAfPr2Wvs2WIpDI5auHtERzSlOOZc8ng3grq9X4d+6S+qU9g==
X-Received: by 2002:aa7:809a:: with SMTP id v26mr28118651pff.82.1567321184092; 
 Sat, 31 Aug 2019 23:59:44 -0700 (PDT)
Received: from localhost.localdomain (ip-103-85-38-221.syd.xi.com.au.
 [103.85.38.221])
 by smtp.gmail.com with ESMTPSA id i6sm3326055pfq.20.2019.08.31.23.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2019 23:59:43 -0700 (PDT)
From: Adam Zerella <adam.zerella@gmail.com>
To: 
Date: Sun,  1 Sep 2019 16:58:28 +1000
Message-Id: <20190901065828.7762-1-adam.zerella@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 01 Sep 2019 14:49:34 +0000
Subject: [Xen-devel] [PATCH] x86/xen/efi: Fix EFI variable 'name' type
 conversion
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Adam Zerella <adam.zerella@gmail.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyByZXNvbHZlcyBhIHR5cGUgY29udmVyc2lvbiBmcm9tICdjaGFyIConIHRvICd1bnNpZ25l
ZCBzaG9ydCcuCmFuZCBzdGF0aWMgdXNhZ2Ugd2FybmluZyBhcyBoaW50ZWQgYnkgU3BhcnNlLgoK
U2lnbmVkLW9mZi1ieTogQWRhbSBaZXJlbGxhIDxhZGFtLnplcmVsbGFAZ21haWwuY29tPgotLS0K
IGFyY2gveDg2L3hlbi9lZmkuYyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hl
bi9lZmkuYyBiL2FyY2gveDg2L3hlbi9lZmkuYwppbmRleCAwZDMzNjVjYjY0ZGUuLjFkNGVmZjZj
NmYwNiAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2VmaS5jCisrKyBiL2FyY2gveDg2L3hlbi9l
ZmkuYwpAQCAtMTE4LDggKzExOCw4IEBAIHN0YXRpYyBlbnVtIGVmaV9zZWN1cmVib290X21vZGUg
eGVuX2VmaV9nZXRfc2VjdXJlYm9vdCh2b2lkKQogCXVuc2lnbmVkIGxvbmcgc2l6ZTsKIAogCXNp
emUgPSBzaXplb2Yoc2VjYm9vdCk7Ci0Jc3RhdHVzID0gZWZpLmdldF92YXJpYWJsZShMIlNlY3Vy
ZUJvb3QiLCAmZWZpX3ZhcmlhYmxlX2d1aWQsCi0JCQkJICBOVUxMLCAmc2l6ZSwgJnNlY2Jvb3Qp
OworCXN0YXR1cyA9IGVmaS5nZXRfdmFyaWFibGUoKGVmaV9jaGFyMTZfdCAqKUwiU2VjdXJlQm9v
dCIsCisJCQkJICAmZWZpX3ZhcmlhYmxlX2d1aWQsIE5VTEwsICZzaXplLCAmc2VjYm9vdCk7CiAK
IAlpZiAoc3RhdHVzID09IEVGSV9OT1RfRk9VTkQpCiAJCXJldHVybiBlZmlfc2VjdXJlYm9vdF9t
b2RlX2Rpc2FibGVkOwpAQCAtMTI4LDggKzEyOCw4IEBAIHN0YXRpYyBlbnVtIGVmaV9zZWN1cmVi
b290X21vZGUgeGVuX2VmaV9nZXRfc2VjdXJlYm9vdCh2b2lkKQogCQlnb3RvIG91dF9lZmlfZXJy
OwogCiAJc2l6ZSA9IHNpemVvZihzZXR1cG1vZGUpOwotCXN0YXR1cyA9IGVmaS5nZXRfdmFyaWFi
bGUoTCJTZXR1cE1vZGUiLCAmZWZpX3ZhcmlhYmxlX2d1aWQsCi0JCQkJICBOVUxMLCAmc2l6ZSwg
JnNldHVwbW9kZSk7CisJc3RhdHVzID0gZWZpLmdldF92YXJpYWJsZSgoZWZpX2NoYXIxNl90ICop
TCJTZXR1cE1vZGUiLAorCQkJCSAgJmVmaV92YXJpYWJsZV9ndWlkLCBOVUxMLCAmc2l6ZSwgJnNl
dHVwbW9kZSk7CiAKIAlpZiAoc3RhdHVzICE9IEVGSV9TVUNDRVNTKQogCQlnb3RvIG91dF9lZmlf
ZXJyOwpAQCAtMTM5LDggKzEzOSw4IEBAIHN0YXRpYyBlbnVtIGVmaV9zZWN1cmVib290X21vZGUg
eGVuX2VmaV9nZXRfc2VjdXJlYm9vdCh2b2lkKQogCiAJLyogU2VlIGlmIGEgdXNlciBoYXMgcHV0
IHRoZSBzaGltIGludG8gaW5zZWN1cmUgbW9kZS4gKi8KIAlzaXplID0gc2l6ZW9mKG1va3Nic3Rh
dGUpOwotCXN0YXR1cyA9IGVmaS5nZXRfdmFyaWFibGUoTCJNb2tTQlN0YXRlUlQiLCAmc2hpbV9n
dWlkLAotCQkJCSAgTlVMTCwgJnNpemUsICZtb2tzYnN0YXRlKTsKKwlzdGF0dXMgPSBlZmkuZ2V0
X3ZhcmlhYmxlKChlZmlfY2hhcjE2X3QgKilMIk1va1NCU3RhdGVSVCIsCisJCQkJICAmc2hpbV9n
dWlkLCBOVUxMLCAmc2l6ZSwgJm1va3Nic3RhdGUpOwogCiAJLyogSWYgaXQgZmFpbHMsIHdlIGRv
bid0IGNhcmUgd2h5LiBEZWZhdWx0IHRvIHNlY3VyZS4gKi8KIAlpZiAoc3RhdHVzICE9IEVGSV9T
VUNDRVNTKQpAQCAtMTU4LDcgKzE1OCw3IEBAIHN0YXRpYyBlbnVtIGVmaV9zZWN1cmVib290X21v
ZGUgeGVuX2VmaV9nZXRfc2VjdXJlYm9vdCh2b2lkKQogCXJldHVybiBlZmlfc2VjdXJlYm9vdF9t
b2RlX3Vua25vd247CiB9CiAKLXZvaWQgX19pbml0IHhlbl9lZmlfaW5pdChzdHJ1Y3QgYm9vdF9w
YXJhbXMgKmJvb3RfcGFyYW1zKQorc3RhdGljIHZvaWQgX19pbml0IHhlbl9lZmlfaW5pdChzdHJ1
Y3QgYm9vdF9wYXJhbXMgKmJvb3RfcGFyYW1zKQogewogCWVmaV9zeXN0ZW1fdGFibGVfdCAqZWZp
X3N5c3RhYl94ZW47CiAKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
