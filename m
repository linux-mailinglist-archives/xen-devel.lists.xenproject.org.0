Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33513D911E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 16:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161584.296601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8kvs-00038p-Ub; Wed, 28 Jul 2021 14:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161584.296601; Wed, 28 Jul 2021 14:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8kvs-00036r-QC; Wed, 28 Jul 2021 14:53:16 +0000
Received: by outflank-mailman (input) for mailman id 161584;
 Wed, 28 Jul 2021 14:53:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=si+Y=MU=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m8kvr-0002W0-Ov
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 14:53:15 +0000
Received: from mail-pj1-x1035.google.com (unknown [2607:f8b0:4864:20::1035])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f5c277f-66a6-4317-8763-05643c208ad8;
 Wed, 28 Jul 2021 14:53:12 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso10454369pjb.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jul 2021 07:53:12 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:0:3823:141e:6d51:f0ad])
 by smtp.gmail.com with ESMTPSA id n134sm277558pfd.89.2021.07.28.07.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:53:11 -0700 (PDT)
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
X-Inumbo-ID: 7f5c277f-66a6-4317-8763-05643c208ad8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4UOe5b2fx3Fh6u6Lqilgce/bFIZGpTYCRKnCgcNYEYs=;
        b=WDKkQI+4pFS1qUeyUk57PY1MjkBYohzBWIb2Shmz+3ikDL79tSqwvQaiBZIwR19VSV
         dtuCv7UwmkIiIpSVydgmRXsq4SXT58K1jkHIDA+Ja2eNYeQ+JfYhBSLGJgIqMWT+bc9u
         jn9DFsvsJFVEm/mT3Qd5QMUaScTC2c6I0EcwfuMOiA09m8OnLuDcKGustBEmOhByCNCb
         UdKibxAfAhQ0GVglWURs6ArttH3DtZw4RGMYEuyymQ5OdshzupJ3JETzCcjFbONxafd0
         wu37AbNCS4KyX/8swZ0UP0x5U0PV56Djw2JcQAFar7BoDTk/eaysFTu3H9fIm7n1xXs5
         FvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4UOe5b2fx3Fh6u6Lqilgce/bFIZGpTYCRKnCgcNYEYs=;
        b=mSBp0J3XGj/vLfDjnXNAVCOfGzGwl547PgIm0nAyRAIH4+6+/PfIoJO3Yt2hl3xQ2i
         4RfUjfb5345SFHkKKbsMzLo72m/Zfuccgp6o0yrw9oboCKsd0+GuwUjKlwZVJ8M6jrDl
         NK8/8Ik9Z21LXW+bndSH5fRqcXoYBjQGmIN0TgCp3BrsbEd/CsKLV7djFG4A/EFkhJnm
         Cei24hDcuya4t8/kK1M5uKEsIH+Ty9QO1QmB//Te96LXMaQrgpVbUi+E524nTVSlBkHl
         wGAqR37BN9FVY/52/5lX97+h92CQm3q46l6LvbfYUknMqFy8JA5xoq6Ou9IDXmCi8+1I
         spmg==
X-Gm-Message-State: AOAM5338Tjj4o0kG6M60EC2bF48XcfzWklVOF3jm+MfSUGcVLPXcFFuh
	/fvty/kHySRpCE2/j6OIRSM=
X-Google-Smtp-Source: ABdhPJyc8/U4Ariizb4QvY5nGICIcZLhQ4VEvgrpEwjxD9fWyR7o9OBbxbMiUCjC06cPGD3+3H7lLQ==
X-Received: by 2002:a65:610c:: with SMTP id z12mr151324pgu.453.1627483991403;
        Wed, 28 Jul 2021 07:53:11 -0700 (PDT)
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
	rientjes@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	kirill.shutemov@linux.intel.com,
	aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	xen-devel@lists.xenproject.org,
	pgonda@google.com,
	david@redhat.com,
	keescook@chromium.org,
	hannes@cmpxchg.org,
	sfr@canb.auug.org.au,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	anparri@microsoft.com
Subject: [PATCH 02/13] x86/HV: Initialize shared memory boundary in the Isolation VM.
Date: Wed, 28 Jul 2021 10:52:17 -0400
Message-Id: <20210728145232.285861-3-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728145232.285861-1-ltykernel@gmail.com>
References: <20210728145232.285861-1-ltykernel@gmail.com>
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


