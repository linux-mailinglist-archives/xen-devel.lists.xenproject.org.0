Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4543E4B66
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 19:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165114.301781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD9Vu-0000rJ-J7; Mon, 09 Aug 2021 17:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165114.301781; Mon, 09 Aug 2021 17:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD9Vu-0000pA-FG; Mon, 09 Aug 2021 17:56:38 +0000
Received: by outflank-mailman (input) for mailman id 165114;
 Mon, 09 Aug 2021 17:56:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD4O=NA=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mD9Vt-0000Aq-1J
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 17:56:37 +0000
Received: from mail-pl1-x62e.google.com (unknown [2607:f8b0:4864:20::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da110ea0-bc60-4e7e-a9ca-3b825ff09e61;
 Mon, 09 Aug 2021 17:56:29 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id e19so3789067pla.10
 for <xen-devel@lists.xenproject.org>; Mon, 09 Aug 2021 10:56:29 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:2:106e:6ed1:5da1:2ac4])
 by smtp.gmail.com with ESMTPSA id x14sm20589708pfa.127.2021.08.09.10.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 10:56:28 -0700 (PDT)
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
X-Inumbo-ID: da110ea0-bc60-4e7e-a9ca-3b825ff09e61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WJ8Qj60FdMGjOsTL0G9bdAidXdjqOzX7Q2WO2gNuvy8=;
        b=kCOSzGmSmj2pkcs1y/QfkWI/Rb7FWu5Rt4HurHSycKb+4UJ6Aawe7iIjpLCK57NZvg
         WiKFB2lpA+UNPjQlXnkCjTyoLNfzfD6exWmoaSXwOTH3P5K09H7X97U+U6AERK1MWKDZ
         Uf9gBLdRp3afuP7JcZ7KvCly3MyakdtS0qQtW8YXpaZpP2oaIZuXn8AWr8r0q7m5PL19
         tGreCVJAddF2G7xYeJM4tw24jIsggOxYdQF69HhvqJzxkbw7sa2z7MLBTUyIBYEQNqtI
         yiQt/exmEXhRuDLkVp63WhMYXTqisSEe9mzIC1qRRU8DWNDpsvO5gCpWRZsGVSmFCKkw
         sUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WJ8Qj60FdMGjOsTL0G9bdAidXdjqOzX7Q2WO2gNuvy8=;
        b=Vl4tH/b2ddUQeUamUXKMW+JnG5I9qv3Psv+3HxESFdDQHYn404rDDh/gFyjP5DPkdw
         KI4j9rQdGmpID1mfAFMupZfA+vZEk1B0WQBkuzK3OhyxF7a2+aqrXclH8FC5HiMdizg4
         ICBsFTlz09uwoQw+LfO1dcvFTdb6a4ANy1qjkIKafC82IydhF7Z6TzYGq3npDA5SwbTW
         V1BFWReljR6jqT6Ziq6hkNQ/+V49ZEoJg7iu96iJnm1M6e/mY/RF35Cfa/42SwUQsHip
         Q727jJhvBbBagx//ZEXAJ16JAJis+2o2tsIA0EK/Njj9C8zWKCxkgeYKyPkz+kgBTgix
         T+QA==
X-Gm-Message-State: AOAM532P0+Smwnt7bF7xikahuz6xyP1QNlnvNXXQW/MksF6Sd4m2GGx+
	Uxfd3bhP7qjYcO+mOzjaWbo=
X-Google-Smtp-Source: ABdhPJxmwF3scgEEjXrYinjzLnwHVvcE27E2cso3ne1oTy5d8B/iiqwH78j0wxYg/3jFPvSCO0RgTg==
X-Received: by 2002:a62:1c42:0:b029:3c3:59ee:6068 with SMTP id c63-20020a621c420000b02903c359ee6068mr19584222pfc.72.1628531788936;
        Mon, 09 Aug 2021 10:56:28 -0700 (PDT)
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
	thomas.lendacky@amd.com,
	brijesh.singh@amd.com,
	ardb@kernel.org,
	Tianyu.Lan@microsoft.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	sfr@canb.auug.org.au,
	saravanand@fb.com,
	krish.sadhukhan@oracle.com,
	aneesh.kumar@linux.ibm.com,
	xen-devel@lists.xenproject.org,
	rientjes@google.com,
	hannes@cmpxchg.org,
	tj@kernel.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: [PATCH V3 02/13] x86/HV: Initialize shared memory boundary in the Isolation VM.
Date: Mon,  9 Aug 2021 13:56:06 -0400
Message-Id: <20210809175620.720923-3-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809175620.720923-1-ltykernel@gmail.com>
References: <20210809175620.720923-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V exposes shared memory boundary via cpuid
HYPERV_CPUID_ISOLATION_CONFIG and store it in the
shared_gpa_boundary of ms_hyperv struct. This prepares
to share memory with host for SNP guest.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 arch/x86/kernel/cpu/mshyperv.c |  2 ++
 include/asm-generic/mshyperv.h | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 6b5835a087a3..2b7f396ef1a5 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -313,6 +313,8 @@ static void __init ms_hyperv_init_platform(void)
 	if (ms_hyperv.priv_high & HV_ISOLATION) {
 		ms_hyperv.isolation_config_a = cpuid_eax(HYPERV_CPUID_ISOLATION_CONFIG);
 		ms_hyperv.isolation_config_b = cpuid_ebx(HYPERV_CPUID_ISOLATION_CONFIG);
+		ms_hyperv.shared_gpa_boundary =
+			(u64)1 << ms_hyperv.shared_gpa_boundary_bits;
 
 		pr_info("Hyper-V: Isolation Config: Group A 0x%x, Group B 0x%x\n",
 			ms_hyperv.isolation_config_a, ms_hyperv.isolation_config_b);
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 4269f3174e58..aa26d24a5ca9 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -35,8 +35,18 @@ struct ms_hyperv_info {
 	u32 max_vp_index;
 	u32 max_lp_index;
 	u32 isolation_config_a;
-	u32 isolation_config_b;
+	union {
+		u32 isolation_config_b;
+		struct {
+			u32 cvm_type : 4;
+			u32 Reserved11 : 1;
+			u32 shared_gpa_boundary_active : 1;
+			u32 shared_gpa_boundary_bits : 6;
+			u32 Reserved12 : 20;
+		};
+	};
 	void  __percpu **ghcb_base;
+	u64 shared_gpa_boundary;
 };
 extern struct ms_hyperv_info ms_hyperv;
 
-- 
2.25.1


