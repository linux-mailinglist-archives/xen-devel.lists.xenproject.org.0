Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4317084032
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:37:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAqN-0000tK-Gt; Wed, 07 Aug 2019 01:34:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAqL-0000qy-Sr
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:21 +0000
X-Inumbo-ID: 7a7954a3-b8b3-11e9-8980-bc764e045a96
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7a7954a3-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:20 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id r26so6586977pgl.10
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PTeNIVNtmjQFCjQxL5R5M/OrbQjiP2mk2OJMaygoDr4=;
 b=BG5A7XtqqH4f15Klc4uU0q4X0R2Yv3wfhImw8oiXt1v6JO5KY1LfJ/FOOlCOXGnxrU
 VariQ4IygIhND6FU5kQCuk9//LCB/lYGlYLJ8TWLMj0IGcKtGZaK7cHMiGMOL9oUoiZc
 YswM2ntpv1sQkIcN3tEUtcv2aNlSoNXxcBOnTcDMk5HYtBIeSLrq5eWXN9nroLrC19Z/
 C0ZG1Pu1hecBjOrW3c3xob4Zs7H7sVar9fXDnKdmBW1H5ACiR9/XADMiFFYI0P1SdPij
 tJqcrXGje17KBWR1RldTVMzhM/TqzNCkMDLzOIHQRTxPFXZrOO5rIe3URKbbtNFMFJkR
 bC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PTeNIVNtmjQFCjQxL5R5M/OrbQjiP2mk2OJMaygoDr4=;
 b=JJ2GpRDP9ZbnpS0Uhx9WFyQDz1mqcXYMTGoms4SqK7hNiyx8P1qa2z1ne5UbzZ6Chp
 BOoPTFVxTIpaOo6MdeS0hWqDCg4HaVu4ntUCDpG7Z2hYUjJ21tRwktRVlZaz7xp48etF
 9r09CbaWw7ld1rE72cBa4CEbcgRgnZPEQNpwiSwbOTsLa7Avekp6Khw1Vm6L5yBBFTRW
 JQSrA7EIA09PifadwtzcSzt6xE6BhMqkZ9EUqUHTREfp445uKxwh2Mn7U+HLlDSJvjVF
 sOaVBBjMoobPwqmgSr4B3kXgt6TMtrpErzJn2LmCY0GCUlbq+8DlGrgensa8no5I1nQl
 Hy5Q==
X-Gm-Message-State: APjAAAXbGl0X4ufgoAVFqna617EAl7uDiGux975Q0jg7Qn3g7OtKDTTV
 4VW9XkqUfLFW6wpaqpzsMX4=
X-Google-Smtp-Source: APXvYqwNS1xrXhm+UjCuzC7PKxoGrXRgWDwKbPmsbF2Yg7VGgKZOnBNXO8oPa1127+JgtcA8HVibPw==
X-Received: by 2002:a63:c055:: with SMTP id z21mr5455551pgi.380.1565141660136; 
 Tue, 06 Aug 2019 18:34:20 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:19 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:21 -0700
Message-Id: <20190807013340.9706-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 22/41] xen: convert put_page() to
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
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
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpUaGlzIGFsc28g
aGFuZGxlcyBwYWdlc1tpXSA9PSBOVUxMIGNhc2VzLCB0aGFua3MgdG8gYW4gYXBwcm9hY2gKdGhh
dCBpcyBhY3R1YWxseSB3cml0dGVuIGJ5IEp1ZXJnZW4gR3Jvc3MuCgpTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jp
cy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQog
ZHJpdmVycy94ZW4vcHJpdmNtZC5jIHwgMzIgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9wcml2Y21kLmMgYi9kcml2ZXJzL3hlbi9wcml2Y21kLmMK
aW5kZXggYzYwNzBlNzBkZDczLi5jN2QwNzYzY2E4YzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVu
L3ByaXZjbWQuYworKysgYi9kcml2ZXJzL3hlbi9wcml2Y21kLmMKQEAgLTU4MiwxMCArNTgyLDEx
IEBAIHN0YXRpYyBsb25nIHByaXZjbWRfaW9jdGxfbW1hcF9iYXRjaCgKIAogc3RhdGljIGludCBs
b2NrX3BhZ2VzKAogCXN0cnVjdCBwcml2Y21kX2RtX29wX2J1ZiBrYnVmc1tdLCB1bnNpZ25lZCBp
bnQgbnVtLAotCXN0cnVjdCBwYWdlICpwYWdlc1tdLCB1bnNpZ25lZCBpbnQgbnJfcGFnZXMpCisJ
c3RydWN0IHBhZ2UgKnBhZ2VzW10sIHVuc2lnbmVkIGludCAqbnJfcGFnZXMpCiB7Ci0JdW5zaWdu
ZWQgaW50IGk7CisJdW5zaWduZWQgaW50IGksIGZyZWUgPSAqbnJfcGFnZXM7CiAKKwkqbnJfcGFn
ZXMgPSAwOwogCWZvciAoaSA9IDA7IGkgPCBudW07IGkrKykgewogCQl1bnNpZ25lZCBpbnQgcmVx
dWVzdGVkOwogCQlpbnQgcGlubmVkOwpAQCAtNTkzLDM1ICs1OTQsMjIgQEAgc3RhdGljIGludCBs
b2NrX3BhZ2VzKAogCQlyZXF1ZXN0ZWQgPSBESVZfUk9VTkRfVVAoCiAJCQlvZmZzZXRfaW5fcGFn
ZShrYnVmc1tpXS51cHRyKSArIGtidWZzW2ldLnNpemUsCiAJCQlQQUdFX1NJWkUpOwotCQlpZiAo
cmVxdWVzdGVkID4gbnJfcGFnZXMpCisJCWlmIChyZXF1ZXN0ZWQgPiBmcmVlKQogCQkJcmV0dXJu
IC1FTk9TUEM7CiAKIAkJcGlubmVkID0gZ2V0X3VzZXJfcGFnZXNfZmFzdCgKIAkJCSh1bnNpZ25l
ZCBsb25nKSBrYnVmc1tpXS51cHRyLAotCQkJcmVxdWVzdGVkLCBGT0xMX1dSSVRFLCBwYWdlcyk7
CisJCQlyZXF1ZXN0ZWQsIEZPTExfV1JJVEUsIHBhZ2VzICsgKm5yX3BhZ2VzKTsKIAkJaWYgKHBp
bm5lZCA8IDApCiAJCQlyZXR1cm4gcGlubmVkOwogCi0JCW5yX3BhZ2VzIC09IHBpbm5lZDsKLQkJ
cGFnZXMgKz0gcGlubmVkOworCQlmcmVlIC09IHBpbm5lZDsKKwkJKm5yX3BhZ2VzICs9IHBpbm5l
ZDsKIAl9CiAKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIHZvaWQgdW5sb2NrX3BhZ2VzKHN0cnVj
dCBwYWdlICpwYWdlc1tdLCB1bnNpZ25lZCBpbnQgbnJfcGFnZXMpCi17Ci0JdW5zaWduZWQgaW50
IGk7Ci0KLQlpZiAoIXBhZ2VzKQotCQlyZXR1cm47Ci0KLQlmb3IgKGkgPSAwOyBpIDwgbnJfcGFn
ZXM7IGkrKykgewotCQlpZiAocGFnZXNbaV0pCi0JCQlwdXRfcGFnZShwYWdlc1tpXSk7Ci0JfQot
fQotCiBzdGF0aWMgbG9uZyBwcml2Y21kX2lvY3RsX2RtX29wKHN0cnVjdCBmaWxlICpmaWxlLCB2
b2lkIF9fdXNlciAqdWRhdGEpCiB7CiAJc3RydWN0IHByaXZjbWRfZGF0YSAqZGF0YSA9IGZpbGUt
PnByaXZhdGVfZGF0YTsKQEAgLTY4MSwxMSArNjY5LDEyIEBAIHN0YXRpYyBsb25nIHByaXZjbWRf
aW9jdGxfZG1fb3Aoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgX191c2VyICp1ZGF0YSkKIAogCXhi
dWZzID0ga2NhbGxvYyhrZGF0YS5udW0sIHNpemVvZigqeGJ1ZnMpLCBHRlBfS0VSTkVMKTsKIAlp
ZiAoIXhidWZzKSB7CisJCW5yX3BhZ2VzID0gMDsKIAkJcmMgPSAtRU5PTUVNOwogCQlnb3RvIG91
dDsKIAl9CiAKLQlyYyA9IGxvY2tfcGFnZXMoa2J1ZnMsIGtkYXRhLm51bSwgcGFnZXMsIG5yX3Bh
Z2VzKTsKKwlyYyA9IGxvY2tfcGFnZXMoa2J1ZnMsIGtkYXRhLm51bSwgcGFnZXMsICZucl9wYWdl
cyk7CiAJaWYgKHJjKQogCQlnb3RvIG91dDsKIApAQCAtNjk5LDcgKzY4OCw4IEBAIHN0YXRpYyBs
b25nIHByaXZjbWRfaW9jdGxfZG1fb3Aoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgX191c2VyICp1
ZGF0YSkKIAl4ZW5fcHJlZW1wdGlibGVfaGNhbGxfZW5kKCk7CiAKIG91dDoKLQl1bmxvY2tfcGFn
ZXMocGFnZXMsIG5yX3BhZ2VzKTsKKwlpZiAocGFnZXMpCisJCXB1dF91c2VyX3BhZ2VzKHBhZ2Vz
LCBucl9wYWdlcyk7CiAJa2ZyZWUoeGJ1ZnMpOwogCWtmcmVlKHBhZ2VzKTsKIAlrZnJlZShrYnVm
cyk7Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
