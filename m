Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115EF468A0A
	for <lists+xen-devel@lfdr.de>; Sun,  5 Dec 2021 09:19:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238265.413000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtmj2-0006i2-Ls; Sun, 05 Dec 2021 08:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238265.413000; Sun, 05 Dec 2021 08:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtmj2-0006cV-GJ; Sun, 05 Dec 2021 08:18:24 +0000
Received: by outflank-mailman (input) for mailman id 238265;
 Sun, 05 Dec 2021 08:18:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p5+j=QW=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mtmj1-0006TA-Jm
 for xen-devel@lists.xenproject.org; Sun, 05 Dec 2021 08:18:23 +0000
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [2607:f8b0:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8c7b142-55a3-11ec-8a4d-196798b21f7b;
 Sun, 05 Dec 2021 09:18:22 +0100 (CET)
Received: by mail-pg1-x52d.google.com with SMTP id l64so1868917pgl.9
 for <xen-devel@lists.xenproject.org>; Sun, 05 Dec 2021 00:18:22 -0800 (PST)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:7:87aa:e334:f070:ebca])
 by smtp.gmail.com with ESMTPSA id s8sm6439905pgl.77.2021.12.05.00.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 00:18:20 -0800 (PST)
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
X-Inumbo-ID: e8c7b142-55a3-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4R1/x5dPl8v2bhM1Wqw8GMKwcXKdEyhlm+eRit5majU=;
        b=a199mwwb41SK+3g5nwV1xKmU5gwizT35AAVUi8EUk8s8aLOnPfOSMZ+DMLR46xQuuT
         MqpKzZctmq0YmBBHMP3tAH2eroIBBD8cjLj9PwaEnB2C+snyDUEO0j82lTDGHRmYP/Ig
         bOlyN98YpBfGN+bx8S2gYeEnhpOJjbcYfo8JrVl6Zu9l3rXzJxaFYHM8Fh6XecuDTX9k
         5k2jwAETpzg9EPf0K2t1k+SG8YOophQYDcE2OtnxPueV/d+iE6faWflgKeHhF2CU0RAD
         qzeN6hrSJXIMDWCljoYMoMo+3fsMt5kyd2hroMZAspPvmtkNm8//oYiJKnc/mtxPyMW4
         vQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4R1/x5dPl8v2bhM1Wqw8GMKwcXKdEyhlm+eRit5majU=;
        b=GxsDgmhHcGdqVyr2Pzq+O2qHoo9qE3pXjtAV433DYH9ZQPn7t86PpTLOjLoUtpc4SZ
         UM9e5HU9Sa0x/eiWGGU8J+cvSOjamYZCgrKSzD99sRdiTs4I9HPv5V3aRApJzFGen99b
         Ihqc/uIURxnQqqB3Ac+Y0CifJFhRNDvF+a0HRKz2CN/3j8kH+ASMl/weDw0xMM5FC45b
         BOhesMhIZrRLwBClCjVY4tKjfj/TgC78E+ZJctWceKQ6+C21OAG0IKiQ7dD9kWKwaR9F
         0iWIkxPML/7rEvwS9xOVATvm4NTh9mThObYj1/iJOmbsHmKGtUEOOq6W03wmgRdfNo4n
         XfjA==
X-Gm-Message-State: AOAM531I0ClI/PAjivLNj/8b9ykEWZbJqSaLrEgxiJJk3/SN6dclOQcp
	Z8/YJrb5wXDcyEtG+TRJo9o=
X-Google-Smtp-Source: ABdhPJwjVr/PR4pWsnzxcrhE9ySNvBZumxc7tiGS3XuTHA+biQhguZE4c/ixNuJ3guQaZnB9mhHD+w==
X-Received: by 2002:a05:6a00:1741:b0:4ad:55e0:55b with SMTP id j1-20020a056a00174100b004ad55e0055bmr3973425pfc.58.1638692301062;
        Sun, 05 Dec 2021 00:18:21 -0800 (PST)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	joro@8bytes.org,
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	arnd@arndb.de,
	hch@infradead.org,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	thomas.lendacky@amd.com,
	Tianyu.Lan@microsoft.com,
	xen-devel@lists.xenproject.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	brijesh.singh@amd.com,
	konrad.wilk@oracle.com,
	hch@lst.de,
	parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: [PATCH V4 2/5] x86/hyper-v: Add hyperv Isolation VM check in the cc_platform_has()
Date: Sun,  5 Dec 2021 03:18:10 -0500
Message-Id: <20211205081815.129276-3-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205081815.129276-1-ltykernel@gmail.com>
References: <20211205081815.129276-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V provides Isolation VM which has memory encrypt support. Add
hyperv_cc_platform_has() and return true for check of GUEST_MEM_ENCRYPT
attribute.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v3:
	* Change code style of checking GUEST_MEM attribute in the
	  hyperv_cc_platform_has().
---
 arch/x86/kernel/cc_platform.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/x86/kernel/cc_platform.c b/arch/x86/kernel/cc_platform.c
index 03bb2f343ddb..27c06b32e7c4 100644
--- a/arch/x86/kernel/cc_platform.c
+++ b/arch/x86/kernel/cc_platform.c
@@ -11,6 +11,7 @@
 #include <linux/cc_platform.h>
 #include <linux/mem_encrypt.h>
 
+#include <asm/mshyperv.h>
 #include <asm/processor.h>
 
 static bool __maybe_unused intel_cc_platform_has(enum cc_attr attr)
@@ -58,9 +59,20 @@ static bool amd_cc_platform_has(enum cc_attr attr)
 #endif
 }
 
+static bool hyperv_cc_platform_has(enum cc_attr attr)
+{
+#ifdef CONFIG_HYPERV
+	return attr == CC_ATTR_GUEST_MEM_ENCRYPT;
+#else
+	return false;
+#endif
+}
 
 bool cc_platform_has(enum cc_attr attr)
 {
+	if (hv_is_isolation_supported())
+		return hyperv_cc_platform_has(attr);
+
 	if (sme_me_mask)
 		return amd_cc_platform_has(attr);
 
-- 
2.25.1


