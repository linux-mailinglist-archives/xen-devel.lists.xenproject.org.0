Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DECF3A2294
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 19:41:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3OOC-0001Yh-5l; Thu, 29 Aug 2019 17:39:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hG9s=WZ=gmail.com=yefremov.denis@srs-us1.protection.inumbo.net>)
 id 1i3NdM-0006hu-Tc
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 16:50:52 +0000
X-Inumbo-ID: 28595dca-ca7d-11e9-b95f-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28595dca-ca7d-11e9-b95f-bc764e2007e4;
 Thu, 29 Aug 2019 16:50:51 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g207so480848wmg.5
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2019 09:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EAPNXwtNcvomkAv43HK7BcSQSi3ID9bH+hr63tWVdSI=;
 b=TGytwZQV1DIJBWP5nSctRyZeHLxD715P1rKU+KdemBchsazJ4qyLfGwYuZUu8H7HyH
 ASplT4CzQvQG7zxaxCF31kV5J3jxu2a2VtSipf4YUI8zFsy4DxfDGeJKLy/JJpIiy3v8
 6tW1FSiw1pXchBQLSo2rIBKpazt0a4mOddBXfRWRi9fkpoLEjyRd0qtj3nbTE3xFWJBJ
 SLDKY3ii/Ofi+elnCo8+NN65v7SHhSMiMEGGp8Qb0xY/CYhYrz+RuOmt5lRUiAeSYUas
 Ak5kyvAhaV5eT8sRRVUECndkgucnpxExlSd2TQReVLSz3Qlv/EOCAACCps4qBFROIMcy
 lGRw==
X-Gm-Message-State: APjAAAXMov5mTmoyppMVc/dwEbgnUHI0WPivBSyORCbIcFn6wBvoTpZa
 mHvNZfkprlzcv24dkTe/Ydo=
X-Google-Smtp-Source: APXvYqyG8Uv9qqAEzfuwRYVShx38vJV1pUSPq3W7ZBAlPx5+N1oEiU4zijmswr1WDwZJj2S7mhEW8w==
X-Received: by 2002:a1c:f704:: with SMTP id v4mr361727wmh.90.1567097450438;
 Thu, 29 Aug 2019 09:50:50 -0700 (PDT)
Received: from green.intra.ispras.ru (bran.ispras.ru. [83.149.199.196])
 by smtp.googlemail.com with ESMTPSA id o14sm8340770wrg.64.2019.08.29.09.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:50:49 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 29 Aug 2019 19:50:15 +0300
Message-Id: <20190829165025.15750-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Aug 2019 17:39:14 +0000
Subject: [Xen-devel] [PATCH v3 01/11] checkpatch: check for nested
 (un)?likely() calls
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
Cc: dri-devel@lists.freedesktop.org, Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-rdma@vger.kernel.org,
 Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>,
 Saeed Mahameed <saeedm@mellanox.com>, linux-input@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Pismenny <borisp@mellanox.com>,
 linux-arm-msm@vger.kernel.org, Denis Efremov <efremov@linux.com>,
 linux-wimax@intel.com, Joe Perches <joe@perches.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Whitcroft <apw@canonical.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Sean Paul <sean@poorly.run>,
 Anton Altaparmakov <anton@tuxera.com>, Juergen Gross <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-xfs@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SVNfRVJSKCksIElTX0VSUl9PUl9OVUxMKCksIElTX0VSUl9WQUxVRSgpIGFuZCBXQVJOKigpIGFs
cmVhZHkgY29udGFpbgp1bmxpa2VseSgpIG9wdGltaXphdGlvbiBpbnRlcm5hbGx5LiBUaHVzLCB0
aGVyZSBpcyBubyBwb2ludCBpbiBjYWxsaW5nCnRoZXNlIGZ1bmN0aW9ucyBhbmQgZGVmaW5lcyB1
bmRlciBsaWtlbHkoKS91bmxpa2VseSgpLgoKVGhpcyBjaGVjayBpcyBiYXNlZCBvbiB0aGUgY29j
Y2luZWxsZSBydWxlIGRldmVsb3BlZCBieSBFbnJpY28gV2VpZ2VsdApodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzE1NTk3Njc1ODItMTEwODEtMS1naXQtc2VuZC1lbWFpbC1pbmZvQG1ldHV4
Lm5ldC8KClNpZ25lZC1vZmYtYnk6IERlbmlzIEVmcmVtb3YgPGVmcmVtb3ZAbGludXguY29tPgpD
YzogSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1A
bGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBBbmR5IFdoaXRjcm9mdCA8YXB3QGNhbm9uaWNhbC5j
b20+Ci0tLQogc2NyaXB0cy9jaGVja3BhdGNoLnBsIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgYi9z
Y3JpcHRzL2NoZWNrcGF0Y2gucGwKaW5kZXggOTNhN2VkZmUwZjA1Li41Njk2OWNlMDZkZjQgMTAw
NzU1Ci0tLSBhL3NjcmlwdHMvY2hlY2twYXRjaC5wbAorKysgYi9zY3JpcHRzL2NoZWNrcGF0Y2gu
cGwKQEAgLTY0ODAsNiArNjQ4MCwxMiBAQCBzdWIgcHJvY2VzcyB7CiAJCQkgICAgICJVc2luZyAk
MSBzaG91bGQgZ2VuZXJhbGx5IGhhdmUgcGFyZW50aGVzZXMgYXJvdW5kIHRoZSBjb21wYXJpc29u
XG4iIC4gJGhlcmVjdXJyKTsKIAkJfQogCisjIG5lc3RlZCBsaWtlbHkvdW5saWtlbHkgY2FsbHMK
KwkJaWYgKCRsaW5lID1+IC9cYig/Oig/OnVuKT9saWtlbHkpXHMqXChccyohP1xzKihJU19FUlIo
PzpfT1JfTlVMTHxfVkFMVUUpP3xXQVJOKS8pIHsKKwkJCVdBUk4oIkxJS0VMWV9NSVNVU0UiLAor
CQkJICAgICAibmVzdGVkICh1bik/bGlrZWx5KCkgY2FsbHMsICQxIGFscmVhZHkgdXNlcyB1bmxp
a2VseSgpIGludGVybmFsbHlcbiIgLiAkaGVyZWN1cnIpOworCQl9CisKICMgd2hpbmUgbWlnaHRs
eSBhYm91dCBpbl9hdG9taWMKIAkJaWYgKCRsaW5lID1+IC9cYmluX2F0b21pY1xzKlwoLykgewog
CQkJaWYgKCRyZWFsZmlsZSA9fiBtQF5kcml2ZXJzL0ApIHsKLS0gCjIuMjEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
