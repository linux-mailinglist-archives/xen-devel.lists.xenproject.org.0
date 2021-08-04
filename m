Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C44B3E07E1
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 20:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163842.300006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBLtV-00062R-Px; Wed, 04 Aug 2021 18:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163842.300006; Wed, 04 Aug 2021 18:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBLtV-0005zY-Ll; Wed, 04 Aug 2021 18:45:33 +0000
Received: by outflank-mailman (input) for mailman id 163842;
 Wed, 04 Aug 2021 18:45:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q0vd=M3=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mBLtT-0005Nn-Vg
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 18:45:32 +0000
Received: from mail-pj1-x1029.google.com (unknown [2607:f8b0:4864:20::1029])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86d95687-ff18-44de-9381-ed5bd6a09bdd;
 Wed, 04 Aug 2021 18:45:28 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id l19so4405015pjz.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Aug 2021 11:45:28 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:f:1947:6842:b8a8:6f83])
 by smtp.gmail.com with ESMTPSA id f5sm3325647pjo.23.2021.08.04.11.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 11:45:27 -0700 (PDT)
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
X-Inumbo-ID: 86d95687-ff18-44de-9381-ed5bd6a09bdd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4UOe5b2fx3Fh6u6Lqilgce/bFIZGpTYCRKnCgcNYEYs=;
        b=NSH/LJRx35rv2Coaect5ebgngqcRbKdFYRhidD5HVV5WQJ6WgjqN12zsAK/Gkyy/7x
         I+8VVT2Mhji0abHf/4jevoNiqwA2z7AmqJJVhMzUjdfoVd85qVx8uMqrxdgmtcLVb8lb
         U81wGAO1FRvQOYHaKxIbPqzzd3/XAOzV0ItIJ6C84F4cFY/LOvV8nCJUAumysIFMIv2f
         ZmUlz8s+pI1p+14JTXmlgoJTnXDIzGQ798aDHtD7uRw0m/ZW+926eQUGYXfO/+c8JHxA
         lwxp04iNL7R8HklDJ+fqB1ltRK00B3Q2EOwhwQpIOQvtt2GkuXmjdei+LviGqNTXKo/P
         QtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4UOe5b2fx3Fh6u6Lqilgce/bFIZGpTYCRKnCgcNYEYs=;
        b=N/CEXBV9dRN9aJHmelvFMWvOzEP/01DIyCaqDxGjQIBN+E72tjyBBzRF8BogVEqiCS
         8kfQpM9rs1FaXvL5VGlLWjHeShNAALebous99JbBR+y6sKUAbxCto8reHwUbsRytz/pU
         NTiv51HB66zMDjS2BwMiL/Iivcvl79O74yajlpTogrHmSXsh/EOEMicN8GmKtlrfpZRU
         gsfPte5mb+3ngxU3YUVBnwJtRNutrqyTdTUxCdj7pLSI15//QONaNGPPN6KLm4Ihh68C
         bsd22TMHl/5lrIsRQCbvgPlXCL95KiUSxknPnmx7VNNtCpFKKAymCq1YnsJi4lN4cD+e
         OvXg==
X-Gm-Message-State: AOAM530+hi/0lXcdaSt9vLatV4CQmwLP27UQw45SuYavzS8gEyywRYA0
	3hniOKN3XQYv9Ferf/SeOQE=
X-Google-Smtp-Source: ABdhPJxPyx87KdC9aGTdRDzgUUm8YpYNF92sxS8SZIEQhtuiHOOQQbprX6PFum9C1CwkqaEKm/aS0w==
X-Received: by 2002:a17:90b:34e:: with SMTP id fh14mr530326pjb.100.1628102728038;
        Wed, 04 Aug 2021 11:45:28 -0700 (PDT)
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
Subject: [PATCH V2 02/14] x86/HV: Initialize shared memory boundary in the Isolation VM.
Date: Wed,  4 Aug 2021 14:44:58 -0400
Message-Id: <20210804184513.512888-3-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804184513.512888-1-ltykernel@gmail.com>
References: <20210804184513.512888-1-ltykernel@gmail.com>
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
index dcfbd2770d7f..773e84e134b3 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -327,6 +327,8 @@ static void __init ms_hyperv_init_platform(void)
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


