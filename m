Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E825395252
	for <lists+xen-devel@lfdr.de>; Sun, 30 May 2021 19:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134294.249947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnPE5-0005h1-3J; Sun, 30 May 2021 17:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134294.249947; Sun, 30 May 2021 17:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnPE4-0005ZH-UJ; Sun, 30 May 2021 17:27:48 +0000
Received: by outflank-mailman (input) for mailman id 134294;
 Sun, 30 May 2021 15:06:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GvOc=KZ=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lnN1d-0000PC-0Q
 for xen-devel@lists.xenproject.org; Sun, 30 May 2021 15:06:49 +0000
Received: from mail-pj1-x102e.google.com (unknown [2607:f8b0:4864:20::102e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 715a7924-f9c2-431e-a015-efffa53ebaf7;
 Sun, 30 May 2021 15:06:41 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id k5so5198069pjj.1
 for <xen-devel@lists.xenproject.org>; Sun, 30 May 2021 08:06:41 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:9:dc2d:80ab:c3f3:1524])
 by smtp.gmail.com with ESMTPSA id b15sm8679688pfi.100.2021.05.30.08.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 08:06:39 -0700 (PDT)
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
X-Inumbo-ID: 715a7924-f9c2-431e-a015-efffa53ebaf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TDI4PXumIZgxBePNd+ivE0VBcCC0VeGNDBRFqyds1eM=;
        b=UAse3Bpl0FAVPqqhfAnA0zSsTcxrZbreVrQAzodtanCUm4szgJIEyR5+ecqtW5IpAX
         wvxV8auZOSKfuO8TZ4M8rO/crEbVTyzAM6eyp3NoWTLuD78xXlOdpNL1GTvOv05hTOvw
         IJKNjFYyz12ZXEp+aAdaQoUfunooYgNvY+tYgiYWzR7jphXnzg+LZ0lYvuQrvoitNAPI
         3dFo+NHKOib8S6vhPQHgJFZuloR8beErGmtrAztyIobPte+3TQ3S9eDUgC3gZiqCjgrA
         2cjMlhmbzneoHRsMOP9QRH/YU9YL8UrYLz+ibUTPFCQMKMdfS1dZjF7iQIxOaa2us5Nb
         DDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TDI4PXumIZgxBePNd+ivE0VBcCC0VeGNDBRFqyds1eM=;
        b=NFXKSE1A9WyATGna6I4J8ZtmQHef2NiMzsJyAuTKidFy5e11/6PSD40hmoHI293QbK
         TcyK/9vBWQqNyJ4JyFmOEPVpGNz1hDCrzpwRsFjffIdHWBenupEACjo9uYWIOIHelH+S
         nnJbg5jCGItedIR9S5JFNquxISDMyO8iWnuRX3kLacu4RwLcfvAI7XSoPFJEm0Ba+GSU
         m0qN+ZDZG1VxiEof+gdiYi081awFvK5fLlirQuGND8YEWUlEtmbvrFPSd8hakbM2A+Vs
         ONUM2NjzmW9q5p5NljIAF3CBOGGAJbWgLJpVD8iNcW8A4hLY79We3E5rX+IYb9w4BnHN
         BKdg==
X-Gm-Message-State: AOAM53101X46OeU2MBrv8EDhqq6yCe7XZTsO+xPELCFCnfuhJncLMhfn
	MAdNFK2qIhE8YPOIL7zQHAk=
X-Google-Smtp-Source: ABdhPJw6VTPU9WI3kHLEFrQaIMTpdWgtR9lc2XZhC9GhjxtOkcyL5lpx/QGe3K50jPAfDu6vcR2b5Q==
X-Received: by 2002:a17:90a:80c5:: with SMTP id k5mr6957940pjw.129.1622387200366;
        Sun, 30 May 2021 08:06:40 -0700 (PDT)
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
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	hannes@cmpxchg.org,
	cai@lca.pw,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	Tianyu.Lan@microsoft.com,
	konrad.wilk@oracle.com,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	xen-devel@lists.xenproject.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	thomas.lendacky@amd.com,
	brijesh.singh@amd.com,
	sunilmut@microsoft.com
Subject: [RFC PATCH V3 02/11] x86/HV: Initialize shared memory boundary in the Isolation VM.
Date: Sun, 30 May 2021 11:06:19 -0400
Message-Id: <20210530150628.2063957-3-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210530150628.2063957-1-ltykernel@gmail.com>
References: <20210530150628.2063957-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V also exposes shared memory boundary via cpuid
HYPERV_CPUID_ISOLATION_CONFIG and store it in the
shared_gpa_boundary of ms_hyperv struct. This prepares
to share memory with host for SNP guest.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 arch/x86/kernel/cpu/mshyperv.c |  2 ++
 include/asm-generic/mshyperv.h | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 22f13343b5da..d1ca36224657 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -320,6 +320,8 @@ static void __init ms_hyperv_init_platform(void)
 	if (ms_hyperv.priv_high & HV_ISOLATION) {
 		ms_hyperv.isolation_config_a = cpuid_eax(HYPERV_CPUID_ISOLATION_CONFIG);
 		ms_hyperv.isolation_config_b = cpuid_ebx(HYPERV_CPUID_ISOLATION_CONFIG);
+		ms_hyperv.shared_gpa_boundary =
+			(u64)1 << ms_hyperv.shared_gpa_boundary_bits;
 
 		pr_info("Hyper-V: Isolation Config: Group A 0x%x, Group B 0x%x\n",
 			ms_hyperv.isolation_config_a, ms_hyperv.isolation_config_b);
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 3ae56a29594f..2914e27b0429 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -34,8 +34,18 @@ struct ms_hyperv_info {
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


