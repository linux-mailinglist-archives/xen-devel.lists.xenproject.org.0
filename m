Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE7F91EAED
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 00:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751881.1159977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOPl6-0005TZ-Vq; Mon, 01 Jul 2024 22:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751881.1159977; Mon, 01 Jul 2024 22:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOPl6-0005PF-Qn; Mon, 01 Jul 2024 22:44:28 +0000
Received: by outflank-mailman (input) for mailman id 751881;
 Mon, 01 Jul 2024 22:44:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0KN=OB=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sOPl6-0005NO-3F
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 22:44:28 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77f84e11-37fb-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 00:44:26 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52cf4ca8904so5695733e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 15:44:26 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab2776bsm1553637e87.175.2024.07.01.15.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 15:44:24 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 77f84e11-37fb-11ef-958a-bbd156597b9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719873866; x=1720478666; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7pJOgWYTohoN9bNh+FuLDvV+CzujybNoWiwTHb5R5U=;
        b=PQgXQD7fdD7RCeeMGCqLpoy/QQjYc3NuSmH79e+MYTy5FiVPu/K4iLR2jrR5SwIZy0
         b4O0X8jtdNpTg+K/By4TxL855PDL94CvgKECTnoP5znR3kELMCwBW3cFHgZT7TCYn7NV
         j6febmad97FFeYvjj5p+3Dqwr0nSQBI9QVZi4M2E1I09UuAs3OTQsPMbHPugVhUZQ2xc
         +LstDIuDUVfsO1Gsw04X8mMYZTHelH9SHreyxepS3UPrJfU7IqwEPGzmKw4+Krj34PVi
         SSKpvGnPmPKU9/fTeFGrDXK/Pvhg5ipIx/4GiJ8+BBQxaIh+dSLOsZxk8e101M01UKhs
         yjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719873866; x=1720478666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7pJOgWYTohoN9bNh+FuLDvV+CzujybNoWiwTHb5R5U=;
        b=d5Vgl88Wg3xJFijYE6KyZh4qf5EkiVktqFQfq6ipRB7CDYP4DPD5upB1WAS7wv1o67
         hLy5VF20q7Ci6AcvXMM2lyX7zXnejFU9sF3R9kBV6cUSi5EJ6qHquWUSUnvv1EpOHUhp
         +yrVpIi1Ds/YfrQ14Ce8c+eFSkUhhq0syvtFCcCpXPMeo42CjSmDY9q3lwbgLPKVd+el
         8qfIoe/QjGBdyNUNRapal4d68EHGoKAFrIDmYz+VS/nvcwrZ8JhWDl+CyEwBzSEBbs2n
         3Ehf9qlqL7evB8LyUI7j2v1bIAbhioAFCm3uoZZbG4ECZxvRBW84PIBHZLu/KHieupXG
         rSdw==
X-Forwarded-Encrypted: i=1; AJvYcCWvjHWcMLtGY6+T6W0ZDHdqPUally8jqpeq7HgUNyNtgxbxp5HHfaHNEd2Kr62A0r2rwxgTWUfNX5U0SE/CkHRYxvPWXqyDw9w2LJFuK9E=
X-Gm-Message-State: AOJu0YzVKWq71z0IRdmMUJlBizYJnVhEB6nIAHhFTXb4+beElqn61QE4
	Dx4Lu8KKz5igTZWirsUCk27DGl9V83pA/+ABhFSoO7NAn5cofwFh
X-Google-Smtp-Source: AGHT+IEVWqn6yL477AvOLH/6tDs+0UcgfhXgHVrF+nz3cT7y9bdDM7hCDuZsRYNQLIieDX2+ijBF8Q==
X-Received: by 2002:a05:6512:3b29:b0:52c:d9f8:b033 with SMTP id 2adb3069b0e04-52e8264bcb5mr4335217e87.3.1719873865019;
        Mon, 01 Jul 2024 15:44:25 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v1 1/2] physmem: Bail out qemu_ram_block_from_host() for invalid ram addrs
Date: Tue,  2 Jul 2024 00:44:20 +0200
Message-ID: <20240701224421.1432654-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701224421.1432654-1-edgar.iglesias@gmail.com>
References: <20240701224421.1432654-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Bail out in qemu_ram_block_from_host() when
xen_ram_addr_from_mapcache() does not find an existing
mapping.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 system/physmem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/system/physmem.c b/system/physmem.c
index 33d09f7571..59d1576c2b 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -2277,6 +2277,10 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
         ram_addr_t ram_addr;
         RCU_READ_LOCK_GUARD();
         ram_addr = xen_ram_addr_from_mapcache(ptr);
+        if (ram_addr == RAM_ADDR_INVALID) {
+            return NULL;
+        }
+
         block = qemu_get_ram_block(ram_addr);
         if (block) {
             *offset = ram_addr - block->offset;
-- 
2.43.0


