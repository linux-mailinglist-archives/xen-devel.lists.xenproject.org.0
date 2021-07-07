Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49CD3BEB21
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:42:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152452.281663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19gY-0008WB-I7; Wed, 07 Jul 2021 15:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152452.281663; Wed, 07 Jul 2021 15:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19gY-0008UF-Ce; Wed, 07 Jul 2021 15:42:02 +0000
Received: by outflank-mailman (input) for mailman id 152452;
 Wed, 07 Jul 2021 15:42:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hxnL=L7=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m19ax-0000vf-Lv
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:36:15 +0000
Received: from mail-pj1-x1036.google.com (unknown [2607:f8b0:4864:20::1036])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f5343a9-2fb4-4ad6-b29d-8d5430575569;
 Wed, 07 Jul 2021 15:35:35 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso1899662pjp.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jul 2021 08:35:35 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:0:6b7f:cf3e:bbf2:d229])
 by smtp.gmail.com with ESMTPSA id y11sm21096877pfo.160.2021.07.07.08.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:35:34 -0700 (PDT)
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
X-Inumbo-ID: 9f5343a9-2fb4-4ad6-b29d-8d5430575569
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TDHZQgnHR8D2Lbss+oxbhfWYDj9fVT4IV0q165q+scY=;
        b=jlhWksTt9ZXMQ3V5VZdagp4ykYr1NEm+E0/uwOYCfTgwiWHndiHvF1l07h0g10O76p
         /1E2rtwwZ9f1CUV+vUiBNbbCbTCtaahPxUZ7tRHr/nHBT2W6v86oKAwn8ZCCNPMumLn2
         0rXBqE/jPPwXQxXwuI41eD0/HivvOqDW6houVOHuI1fZVGi2I+zpMwIEd/ablG8Mh+Xd
         5CUPqxt1iAquu91aga4I00EZPhCMpR6UmUQsadux88HjkMINPdMyFaX59QQ6qLR52QGu
         HmmUFOOXJe8oM/DULJDYHJsB1MTWsYHfYYloQags21tXXhIuF7MvwEDioPNBthxVDBiR
         2eeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TDHZQgnHR8D2Lbss+oxbhfWYDj9fVT4IV0q165q+scY=;
        b=nl9NlruuMTZiYa3yLhfWSsyBL0isgQBHN/XqeDsrTEOtiWOvvWZHb9HlP4ztukMHCx
         XPCn64nl5QqZsnhUJZwwgO9TYc84ENOscAaWlnZ3I4SzZSkuv0CKp+Y3Monil8a/DvSJ
         AS/MJwVsX3FgLim1CRUwkl/IWtXOXLsIWSGNhjWEkc8Gq5NQVXBIgSY5QCBvdALtJscp
         9Z7o5p46sara2d+klY+7P4gijo29KqswabrYVX2YzI0aS4FHi4WLJTkTs4ENknQu/ypY
         6dfTuytlShYgwijwyeGmUJb9g4g8EKu+FvolU8buVfCJ8Ii54qFm1bMHsndIlVAyJiH/
         G93g==
X-Gm-Message-State: AOAM533dy9ByfWTMMeYjqEne0IjcbPYNNRVtdP8vtHafcOnlK0UpiAau
	jLdnv5GcT9ZM7KWCpcjYHgQ=
X-Google-Smtp-Source: ABdhPJxmKhX5fK2x5od9d5gvzBUJ0Dcm3yqb9eF3Fi8VSAbfNgyMwfqdNVErf+9OlaGCHUhH+iCf7g==
X-Received: by 2002:a17:902:b604:b029:128:bfa5:3c4c with SMTP id b4-20020a170902b604b0290128bfa53c4cmr21695343pls.29.1625672135173;
        Wed, 07 Jul 2021 08:35:35 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	rppt@kernel.org,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	ardb@kernel.org,
	nramas@linux.microsoft.com,
	robh@kernel.org,
	keescook@chromium.org,
	rientjes@google.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	hannes@cmpxchg.org,
	saravanand@fb.com,
	krish.sadhukhan@oracle.com,
	xen-devel@lists.xenproject.org,
	tj@kernel.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	brijesh.singh@amd.com,
	anparri@microsoft.com
Subject: [RFC PATCH V4 12/12] x86/HV: Not set memory decrypted/encrypted during kexec alloc/free page in IVM
Date: Wed,  7 Jul 2021 11:34:53 -0400
Message-Id: <20210707153456.3976348-13-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707153456.3976348-1-ltykernel@gmail.com>
References: <20210707153456.3976348-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V Isolation VM reuses set_memory_decrypted/encrypted function
and not needs to decrypt/encrypt memory in arch_kexec_post_alloc(pre_free)
_pages() just likes AMD SEV VM. So skip them.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 arch/x86/kernel/machine_kexec_64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index c078b0d3ab0e..0cadc64b6873 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -26,6 +26,7 @@
 #include <asm/kexec-bzimage64.h>
 #include <asm/setup.h>
 #include <asm/set_memory.h>
+#include <asm/mshyperv.h>
 
 #ifdef CONFIG_ACPI
 /*
@@ -598,7 +599,7 @@ void arch_kexec_unprotect_crashkres(void)
  */
 int arch_kexec_post_alloc_pages(void *vaddr, unsigned int pages, gfp_t gfp)
 {
-	if (sev_active())
+	if (sev_active() || hv_is_isolation_supported())
 		return 0;
 
 	/*
@@ -611,7 +612,7 @@ int arch_kexec_post_alloc_pages(void *vaddr, unsigned int pages, gfp_t gfp)
 
 void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages)
 {
-	if (sev_active())
+	if (sev_active() || hv_is_isolation_supported())
 		return;
 
 	/*
-- 
2.25.1


