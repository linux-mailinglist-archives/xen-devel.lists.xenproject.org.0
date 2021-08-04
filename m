Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5E3E07E7
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 20:45:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163844.300018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBLtg-0006a1-3E; Wed, 04 Aug 2021 18:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163844.300018; Wed, 04 Aug 2021 18:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBLtf-0006Xn-W8; Wed, 04 Aug 2021 18:45:43 +0000
Received: by outflank-mailman (input) for mailman id 163844;
 Wed, 04 Aug 2021 18:45:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q0vd=M3=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mBLte-0005Nn-02
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 18:45:42 +0000
Received: from mail-pl1-x632.google.com (unknown [2607:f8b0:4864:20::632])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7660b7ca-b47a-4e21-b229-077980450e31;
 Wed, 04 Aug 2021 18:45:31 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id t3so3987660plg.9
 for <xen-devel@lists.xenproject.org>; Wed, 04 Aug 2021 11:45:31 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:f:1947:6842:b8a8:6f83])
 by smtp.gmail.com with ESMTPSA id f5sm3325647pjo.23.2021.08.04.11.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 11:45:30 -0700 (PDT)
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
X-Inumbo-ID: 7660b7ca-b47a-4e21-b229-077980450e31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FdFAudmr1+kygb9VLkJoTvdwIA9Vg/qvV4n+6/T0PLM=;
        b=olNy8x8y7DV61QBkuXuMrjl8xyjVV6qI92ML9lui5gV9yaNd+g2yRo8+GAjxd8Shaw
         k/aTAARZG99hTkIBKMYA8AGviCdjwdKUj9zvrSsMRj3YRUG5xnaWS/4qsbqpqwqCDxVq
         thDtttD8qDBBwUgnHLZDfNa4in8fDL5BO/rbvDTdpiDuDEU1/QpqHcaG2k2j/JzClxiS
         J14sR1WMiTvZ9mb8KqscgmQf9kA0OfiyX4uR9IOjwyzY85SR5/dpYBVyd2yQ7Rbd9F94
         JCAgvx+khF5I5ToQJpXoaocqMVIQHlMGBh2ExwSjPQVaypIrNzCxPp5ZbaCkrafC015M
         zj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FdFAudmr1+kygb9VLkJoTvdwIA9Vg/qvV4n+6/T0PLM=;
        b=U9bJfPVG3twFZXlTEIgTTReqyn7wPCWDr2Kpq72Hsr8ZnU/ATr/jdUxqRc5t7T9+Z1
         hDBlkE3jh4YOVwlfZ1kijrs42KBEizMZZbyGqIYHWANorn+CkE7StIiL0Szs+6M7Hgus
         mDHA0FOmGwlfck1VDBL8zi7S9zUm295b+Lbxk4ywB8Axpcr19eyMf9OcARAmAeVc+u90
         p1dFePzJC8BkE+km3NRC+Mp7iTDLr1pJocIicCumx5gOMZcuKRC3WOKMYm6fZR34UXWi
         28f2SSESFZ2ZcBr2vKUm5BN5XoL+tmqP6VQU0YbyOI2PsFPhDfiQC/96bYMEtA0HCTg2
         I0MQ==
X-Gm-Message-State: AOAM530GNVYTWEugqdYI8FBkWUGByJpdmaE+o7SOEtSIiTjh7weuljaI
	RwQYBNrWyQA7PscgZeY6/cU=
X-Google-Smtp-Source: ABdhPJwPmTFefX7A/J1jN8u3n99CGRipE6kjwRUWfraZOYkn2XRufM5MD06moIp1hWSu/z++9TU7ow==
X-Received: by 2002:a17:902:c651:b029:12c:1ec0:a8b8 with SMTP id s17-20020a170902c651b029012c1ec0a8b8mr486766pls.40.1628102730835;
        Wed, 04 Aug 2021 11:45:30 -0700 (PDT)
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
	Tianyu.Lan@microsoft.com,
	rppt@kernel.org,
	kirill.shutemov@linux.intel.com,
	akpm@linux-foundation.org,
	brijesh.singh@amd.com,
	thomas.lendacky@amd.com,
	pgonda@google.com,
	david@redhat.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	aneesh.kumar@linux.ibm.com,
	xen-devel@lists.xenproject.org,
	martin.b.radev@gmail.com,
	ardb@kernel.org,
	rientjes@google.com,
	tj@kernel.org,
	keescook@chromium.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	parri.andrea@gmail.com
Subject: [PATCH V2 03/14] x86/set_memory: Add x86_set_memory_enc static call support
Date: Wed,  4 Aug 2021 14:44:59 -0400
Message-Id: <20210804184513.512888-4-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804184513.512888-1-ltykernel@gmail.com>
References: <20210804184513.512888-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V and other platforms(e.g Intel and AMD) want to override
the __set_memory_enc_dec(). Add x86_set_memory_enc static
call here and platforms can hook their implementation.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 arch/x86/include/asm/set_memory.h | 4 ++++
 arch/x86/mm/pat/set_memory.c      | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 43fa081a1adb..490f2cfc00fa 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -4,6 +4,7 @@
 
 #include <asm/page.h>
 #include <asm-generic/set_memory.h>
+#include <linux/static_call.h>
 
 /*
  * The set_memory_* API can be used to change various attributes of a virtual
@@ -84,6 +85,9 @@ int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 bool kernel_page_present(struct page *page);
 
+int dummy_set_memory_enc(unsigned long addr, int numpages, bool enc);
+DECLARE_STATIC_CALL(x86_set_memory_enc, dummy_set_memory_enc);
+
 extern int kernel_set_to_readonly;
 
 #ifdef CONFIG_X86_64
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index ad8a5c586a35..68e9ab522cea 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -18,6 +18,7 @@
 #include <linux/libnvdimm.h>
 #include <linux/vmstat.h>
 #include <linux/kernel.h>
+#include <linux/static_call.h>
 
 #include <asm/e820/api.h>
 #include <asm/processor.h>
@@ -66,6 +67,9 @@ static const int cpa_warn_level = CPA_PROTECT;
  */
 static DEFINE_SPINLOCK(cpa_lock);
 
+static int default_set_memory_enc(unsigned long addr, int numpages, bool enc);
+DEFINE_STATIC_CALL(x86_set_memory_enc, default_set_memory_enc);
+
 #define CPA_FLUSHTLB 1
 #define CPA_ARRAY 2
 #define CPA_PAGES_ARRAY 4
@@ -1981,6 +1985,11 @@ int set_memory_global(unsigned long addr, int numpages)
 }
 
 static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
+{
+	return static_call(x86_set_memory_enc)(addr, numpages, enc);
+}
+
+static int default_set_memory_enc(unsigned long addr, int numpages, bool enc)
 {
 	struct cpa_data cpa;
 	int ret;
-- 
2.25.1


