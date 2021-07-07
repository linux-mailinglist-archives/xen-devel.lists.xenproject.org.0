Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D28353BEAD1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152390.281550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19Zv-0001Ea-Hp; Wed, 07 Jul 2021 15:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152390.281550; Wed, 07 Jul 2021 15:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19Zv-0001Cf-EE; Wed, 07 Jul 2021 15:35:11 +0000
Received: by outflank-mailman (input) for mailman id 152390;
 Wed, 07 Jul 2021 15:35:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hxnL=L7=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m19Zu-0000vf-J6
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:35:10 +0000
Received: from mail-pf1-x42d.google.com (unknown [2607:f8b0:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7bedf122-7295-4f8a-81d5-13bd4bd70553;
 Wed, 07 Jul 2021 15:35:07 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d12so2527788pfj.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jul 2021 08:35:07 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:0:6b7f:cf3e:bbf2:d229])
 by smtp.gmail.com with ESMTPSA id y11sm21096877pfo.160.2021.07.07.08.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:35:06 -0700 (PDT)
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
X-Inumbo-ID: 7bedf122-7295-4f8a-81d5-13bd4bd70553
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0MmjMjO7XvUbpBRdqqPG7tGmikUa5z2pWikCp/JzIEY=;
        b=NVwj9Iuc5KEhy+VNjKuoKXzwovkub/uFAwYhE0AnnHBmasJim5Egk/ApBPBkeHElpd
         Ip4OV9iRzcuH1M98BYimUE0ATtc9OZzjxhp9kVenh+1g2GC7j0FGlwVlX76/eAv9AUy5
         9BQLpOGq8N2Gl/12RRnCeEgUIV0/g/2A0sPA+EBgMkN3+JMDARX4y7TLbUDo0GsG2/oC
         JKM5rBkRlzM/vVRtQvdfIYDxvguje020NHwrbcvP3/tBkvF9IwOH4Gv8qwl1sFaYA/rf
         CE1zyF098euLk/pqCyShxE6yRwQHIyt8iAJXiqdBMrt+jGjPdOKIVaPjsI5TtBYHsTF2
         b/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0MmjMjO7XvUbpBRdqqPG7tGmikUa5z2pWikCp/JzIEY=;
        b=YNdw12595XiJqgypm+LuNzyjqcxEyU+gyy/VhdwFoL7zm3Sk+Nj2kpCoOGILFebF+J
         Jhfi3GhmvWXRx/920tLxjkBkgkoW60CGfjg1jSC6mA9wEhrRpsSfJgmfYHaOU2CQcaWk
         a8qrPenDVPaoQjwbbGEXd/QUGc97j+S9jqQQEa2iNovt4NfkFG7cJDPL5INREuhMyFW+
         gDGD3pF274gZ0HZEpMTF7NQXa+qvGJ/iR2n291kuvuvuTyqvCBbHt87TWe6rbjQyC1qA
         qlIj2b+AA9G5I94G7+iHCRfbR0Eaq/BHURAXGQ4RtxyZDvCLSCvhAP8errFm7yCmMrNq
         ghkQ==
X-Gm-Message-State: AOAM530DAj+rWufJGtBPofz+n/8+nFl0GmPrU5VgMGDJI9wMfsDjrNXG
	LwEGtucra0R/4Fo1aRMsfpE=
X-Google-Smtp-Source: ABdhPJyEyO7Cyr41C6lgwYWdThy32+NVXiborZ3KnwFy57UZ1FE8H+OlybQRDClF4kF5jUwodhf1Og==
X-Received: by 2002:aa7:8e18:0:b029:2ec:a754:570e with SMTP id c24-20020aa78e180000b02902eca754570emr26014073pfr.38.1625672106748;
        Wed, 07 Jul 2021 08:35:06 -0700 (PDT)
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
Subject: [RFC PATCH V4 01/12] x86/HV: Initialize shared memory boundary in the Isolation VM.
Date: Wed,  7 Jul 2021 11:34:42 -0400
Message-Id: <20210707153456.3976348-2-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707153456.3976348-1-ltykernel@gmail.com>
References: <20210707153456.3976348-1-ltykernel@gmail.com>
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
index 10b2a8c10cb6..8aed689db621 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -334,6 +334,8 @@ static void __init ms_hyperv_init_platform(void)
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


