Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9003180E19
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:52:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPKO-0004xB-NA; Sun, 04 Aug 2019 22:50:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPKM-0004qB-8I
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:50:10 +0000
X-Inumbo-ID: 35971286-b70a-11e9-8980-bc764e045a96
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 35971286-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:50:09 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id i18so38664420pgl.11
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sx0x91HVjVXCVkLMMHrdncyqT4rW2sU28Vf+3l+oloA=;
 b=M7iDvAmPBRpGJcJpcoqgvaoi3nLFkyQK4dkSIj4ojX3FvseJtfjnZyfckr18kI2oDa
 LHzSPof56TngxWHSp0ym44XehwQNp0Dvit6wm4Dt65OPXwL2baR6+4zLMuIAexRHFzmx
 ZFMgjeYMSC1sErMdOV/WNMAc2Iu4rRWK81eLPAWfZwZdfeXx16tZd5680zs185LTKzUq
 VYv2LHkMnMPv4yg/Pui3fxt3Z+TxPOd1GexxLj8LbBhnNpT3XVb8jW9mQwG5C5+4ClkN
 g/MAUKuZK56HuoBkHT35BiifdFKR3pPYOWepAjU+8QcCzdVYmtG3jMaPBQTkt/nS1dsZ
 WZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sx0x91HVjVXCVkLMMHrdncyqT4rW2sU28Vf+3l+oloA=;
 b=QTMXyW5Gw7XCBdvx23TyGp1TpCnXLTzPUCszj2s9mlhLyG2W9A2DeLBp5y4nrcLVfN
 jxN6JVyOLoIa5UMZQe6Eh+a3I+Sc6OegBk07jDSgiT3Iz6j7VwOqhdsOZ5tmsRcI58an
 nDt0SJtVTNQAkFKjvV2htBB+vKBaQt4RxE3dSmBE5NUxKStBbR4r8EP+OXWsI1/diQ1B
 D59o4CX0Z9W97/fdzIq9io46WicC8Uj/VfOdj6/cGDtII5pqmcjAB8ujmMicbI+3RJ68
 pXVxeKlbAPjj6HktXzvdszbKPBH+mH2UwjbAyxXXw1kVM/z5Kdd90H5fgAl05GmLDS/e
 LPEA==
X-Gm-Message-State: APjAAAVOylzV7k4oooUU4ec0N3agq++6qdivupCtuChTcYkqg5ooRqII
 4CWBG/hljVfnKXsRkdQ550I=
X-Google-Smtp-Source: APXvYqzdBAOi64WyR4vf0DFOxQNVALmaSa46GoCIBIpjxflBtAErOscOmlieUmCz4Qhdah1mimse2w==
X-Received: by 2002:a63:7358:: with SMTP id
 d24mr133542074pgn.224.1564959008549; 
 Sun, 04 Aug 2019 15:50:08 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.50.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:08 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:49:12 -0700
Message-Id: <20190804224915.28669-32-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 31/34] fs/nfs: convert put_page() to
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
Cc: Calum Mackay <calum.mackay@oracle.com>, linux-fbdev@vger.kernel.org,
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
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
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQ2FsdW0g
TWFja2F5IDxjYWx1bS5tYWNrYXlAb3JhY2xlLmNvbT4KQ2M6IFRyb25kIE15a2xlYnVzdCA8dHJv
bmQubXlrbGVidXN0QGhhbW1lcnNwYWNlLmNvbT4KQ2M6IEFubmEgU2NodW1ha2VyIDxhbm5hLnNj
aHVtYWtlckBuZXRhcHAuY29tPgpDYzogbGludXgtbmZzQHZnZXIua2VybmVsLm9yZwpTaWduZWQt
b2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZnMvbmZzL2Rp
cmVjdC5jIHwgMTEgKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvbmZzL2RpcmVjdC5jIGIvZnMvbmZzL2Rp
cmVjdC5jCmluZGV4IDBjYjQ0MjQwNjE2OC4uYzBjMWI5ZjJjMDY5IDEwMDY0NAotLS0gYS9mcy9u
ZnMvZGlyZWN0LmMKKysrIGIvZnMvbmZzL2RpcmVjdC5jCkBAIC0yNzYsMTMgKzI3Niw2IEBAIHNz
aXplX3QgbmZzX2RpcmVjdF9JTyhzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAq
aXRlcikKIAlyZXR1cm4gbmZzX2ZpbGVfZGlyZWN0X3dyaXRlKGlvY2IsIGl0ZXIpOwogfQogCi1z
dGF0aWMgdm9pZCBuZnNfZGlyZWN0X3JlbGVhc2VfcGFnZXMoc3RydWN0IHBhZ2UgKipwYWdlcywg
dW5zaWduZWQgaW50IG5wYWdlcykKLXsKLQl1bnNpZ25lZCBpbnQgaTsKLQlmb3IgKGkgPSAwOyBp
IDwgbnBhZ2VzOyBpKyspCi0JCXB1dF9wYWdlKHBhZ2VzW2ldKTsKLX0KLQogdm9pZCBuZnNfaW5p
dF9jaW5mb19mcm9tX2RyZXEoc3RydWN0IG5mc19jb21taXRfaW5mbyAqY2luZm8sCiAJCQkgICAg
ICBzdHJ1Y3QgbmZzX2RpcmVjdF9yZXEgKmRyZXEpCiB7CkBAIC01MTIsNyArNTA1LDcgQEAgc3Rh
dGljIHNzaXplX3QgbmZzX2RpcmVjdF9yZWFkX3NjaGVkdWxlX2lvdmVjKHN0cnVjdCBuZnNfZGly
ZWN0X3JlcSAqZHJlcSwKIAkJCXBvcyArPSByZXFfbGVuOwogCQkJZHJlcS0+Ynl0ZXNfbGVmdCAt
PSByZXFfbGVuOwogCQl9Ci0JCW5mc19kaXJlY3RfcmVsZWFzZV9wYWdlcyhwYWdldmVjLCBucGFn
ZXMpOworCQlwdXRfdXNlcl9wYWdlcyhwYWdldmVjLCBucGFnZXMpOwogCQlrdmZyZWUocGFnZXZl
Yyk7CiAJCWlmIChyZXN1bHQgPCAwKQogCQkJYnJlYWs7CkBAIC05MzUsNyArOTI4LDcgQEAgc3Rh
dGljIHNzaXplX3QgbmZzX2RpcmVjdF93cml0ZV9zY2hlZHVsZV9pb3ZlYyhzdHJ1Y3QgbmZzX2Rp
cmVjdF9yZXEgKmRyZXEsCiAJCQlwb3MgKz0gcmVxX2xlbjsKIAkJCWRyZXEtPmJ5dGVzX2xlZnQg
LT0gcmVxX2xlbjsKIAkJfQotCQluZnNfZGlyZWN0X3JlbGVhc2VfcGFnZXMocGFnZXZlYywgbnBh
Z2VzKTsKKwkJcHV0X3VzZXJfcGFnZXMocGFnZXZlYywgbnBhZ2VzKTsKIAkJa3ZmcmVlKHBhZ2V2
ZWMpOwogCQlpZiAocmVzdWx0IDwgMCkKIAkJCWJyZWFrOwotLSAKMi4yMi4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
