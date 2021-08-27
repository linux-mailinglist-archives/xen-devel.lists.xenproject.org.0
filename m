Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1373F9D94
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 19:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173802.317114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfXq-0001jH-0T; Fri, 27 Aug 2021 17:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173802.317114; Fri, 27 Aug 2021 17:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfXp-0001hF-TC; Fri, 27 Aug 2021 17:21:33 +0000
Received: by outflank-mailman (input) for mailman id 173802;
 Fri, 27 Aug 2021 17:21:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=brRM=NS=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mJfXo-00016Q-Mo
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 17:21:32 +0000
Received: from mail-pl1-x62f.google.com (unknown [2607:f8b0:4864:20::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 259bc3f0-0fb0-4ef3-b341-af0ee0a5e24d;
 Fri, 27 Aug 2021 17:21:27 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id q21so4358658plq.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 10:21:27 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:36:ef50:8fcd:44d1:eb17])
 by smtp.gmail.com with ESMTPSA id f5sm7155015pjo.23.2021.08.27.10.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 10:21:26 -0700 (PDT)
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
X-Inumbo-ID: 259bc3f0-0fb0-4ef3-b341-af0ee0a5e24d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QeAoBJVxLuEqjhstpPPHRrsV4aYneiblS47oqHVJx+4=;
        b=I7NUV++ybJ+PeLzq7nvmvC/fUa1MzSPBVMWympCWggjJfdGIagT64paurWTr4ufYmh
         iyifKSagK7g0dfWSGenf+VOn1hz4bUmTah6emDjZ7Foz5yleN2+WsDzCIuDF9ckq2p8q
         hFjrwh845yHhH4sTpGEnOYuYp+n6e3PBkeMtpDD2gYyYmLb/pNE98ycigf1ahWeak5Ds
         119NB5Pug3TLpnQ/Feznsq48O//rxAT/a4sTQ52sT7LMmBNKIHmPmUv4Wo2l0yZEYlky
         QLNWAslMK29qAA7pi1dHujT6sJotapiAiz0QzHw0Xdhri/P7a9oV3kQamXq3XVGl03mc
         qYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QeAoBJVxLuEqjhstpPPHRrsV4aYneiblS47oqHVJx+4=;
        b=m61ZOP4K6wqCNbgtxpdvvEKSmHMjfxzb4wrATo/zeL96Bq3hOMdcQ4DTE/AqF6Ll4n
         6KmzqiMKdjlNzLlUaSC64p6cZEVzv7HbST4u+3BlHI4K8prKFcf/vqgXJelfxcqkP5lq
         YMcAiMw8STZsQWqyrvNA/xEGuXQemAiBiIOcP1k12UUWqYeBuH7falfB9IW1ovskMVlU
         hk+2OaMZLsJRjV59gGc/y5EwrmjUAJxbe8JQ07bo/pJJfyJsHeL1bS01EYlsWKpznO8t
         tFeaa1Hji50+pwjLl1gVZxxZMm4Q1vs5KykFhX5IiXShkHl0rbn7rlQawuITtu1YzVop
         mcrQ==
X-Gm-Message-State: AOAM531jZz3Bby98U6HbUZUFehNlIHwwd/LSvg1JF0sXdKtyEEUo5XH8
	b7KfMx7Ymv4JMTcbv/ovAKI=
X-Google-Smtp-Source: ABdhPJygO/uJNLRxEGKep6uevI66uTYM1Cjltj7n7K2J5FM1lDlOoUIpLG2da+nKpVHYkSugQbym8Q==
X-Received: by 2002:a17:902:70cb:b0:132:6a68:af90 with SMTP id l11-20020a17090270cb00b001326a68af90mr9716504plt.56.1630084886558;
        Fri, 27 Aug 2021 10:21:26 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
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
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	brijesh.singh@amd.com,
	thomas.lendacky@amd.com,
	Tianyu.Lan@microsoft.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	hannes@cmpxchg.org,
	aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	rientjes@google.com,
	ardb@kernel.org,
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
Subject: [PATCH V4 02/13] x86/hyperv: Initialize shared memory boundary in the Isolation VM.
Date: Fri, 27 Aug 2021 13:21:00 -0400
Message-Id: <20210827172114.414281-3-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827172114.414281-1-ltykernel@gmail.com>
References: <20210827172114.414281-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V exposes shared memory boundary via cpuid
HYPERV_CPUID_ISOLATION_CONFIG and store it in the
shared_gpa_boundary of ms_hyperv struct. This prepares
to share memory with host for SNP guest.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v3:
	* user BIT_ULL to get shared_gpa_boundary
	* Rename field Reserved* to reserved
---
 arch/x86/kernel/cpu/mshyperv.c |  2 ++
 include/asm-generic/mshyperv.h | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 20557a9d6e25..8bb001198316 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -313,6 +313,8 @@ static void __init ms_hyperv_init_platform(void)
 	if (ms_hyperv.priv_high & HV_ISOLATION) {
 		ms_hyperv.isolation_config_a = cpuid_eax(HYPERV_CPUID_ISOLATION_CONFIG);
 		ms_hyperv.isolation_config_b = cpuid_ebx(HYPERV_CPUID_ISOLATION_CONFIG);
+		ms_hyperv.shared_gpa_boundary =
+			BIT_ULL(ms_hyperv.shared_gpa_boundary_bits);
 
 		pr_info("Hyper-V: Isolation Config: Group A 0x%x, Group B 0x%x\n",
 			ms_hyperv.isolation_config_a, ms_hyperv.isolation_config_b);
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 0924bbd8458e..7537ae1db828 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -35,7 +35,17 @@ struct ms_hyperv_info {
 	u32 max_vp_index;
 	u32 max_lp_index;
 	u32 isolation_config_a;
-	u32 isolation_config_b;
+	union {
+		u32 isolation_config_b;
+		struct {
+			u32 cvm_type : 4;
+			u32 reserved11 : 1;
+			u32 shared_gpa_boundary_active : 1;
+			u32 shared_gpa_boundary_bits : 6;
+			u32 reserved12 : 20;
+		};
+	};
+	u64 shared_gpa_boundary;
 };
 extern struct ms_hyperv_info ms_hyperv;
 
-- 
2.25.1


