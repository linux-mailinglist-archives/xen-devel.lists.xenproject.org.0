Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079F440AF35
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 15:39:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186649.335401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ8et-0002c4-HD; Tue, 14 Sep 2021 13:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186649.335401; Tue, 14 Sep 2021 13:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ8et-0002Yo-D0; Tue, 14 Sep 2021 13:39:35 +0000
Received: by outflank-mailman (input) for mailman id 186649;
 Tue, 14 Sep 2021 13:39:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2lzK=OE=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mQ8es-0001wz-Qw
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 13:39:34 +0000
Received: from mail-pl1-x62c.google.com (unknown [2607:f8b0:4864:20::62c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3789e736-6a54-4fee-bbb4-fa76cd6f82cf;
 Tue, 14 Sep 2021 13:39:29 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id w6so8208421pll.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Sep 2021 06:39:29 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:7:6ea2:a529:4af3:5057])
 by smtp.gmail.com with ESMTPSA id v13sm10461234pfm.16.2021.09.14.06.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 06:39:28 -0700 (PDT)
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
X-Inumbo-ID: 3789e736-6a54-4fee-bbb4-fa76cd6f82cf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YUwTqwYZOOkMzYqyDRP5u7DXlTVFM/o7xmj81RyBU+U=;
        b=Zy+W6lLKWmt7luEwpTRuKO/55L+1pJhM+U2Y08JCjUl/Sx3GrJY7QhjVoeYU8XS0sZ
         VYkNN1yYSgJpcM/oeMCO+0ImLroJ2E6tKqOy3G3BQc+A+XteLhWOhUNt04iKCz4oLukL
         ZXdeQ2jx1nvY0B/yoIhbppgpWtNXrdn1B8PukHkeaXer6DbeBQQ6LMeN6zIn0UbmFUqA
         XFkU1p/3fDU6Rv88cbsucwIK2FeuA5bSFEOuD0P01iDmKeSieEZM0MwidbNyW+kC5LvM
         reTUrry6bD4yBiSWg+2gSNkw7hmnvgvjy6KZtQZkdkIbi9CfdzA5mje9Mgsm1Myh/rpm
         yczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YUwTqwYZOOkMzYqyDRP5u7DXlTVFM/o7xmj81RyBU+U=;
        b=fkTE9sCk7UZIaOE3Fkrq0YAxUSmzjn4SFyIT/099Rs+ezUmQIun/5Xi7NrwpWEMfJL
         ALOo/HBwPk6F6Znat5AJsHwKIqabMfs/CkqJlOgPVLUnb1Er18cKW8tGQAIoKkBX4CF4
         Q1vaRIQG6wlF9u7w/rLCfisrGRvLboTcvCMrDHh1BvZVuzKMJwLCsYunrlukI23bgyWX
         R7ZTvZxNHDvrFpPJj5EnW2GSurbI2bf4usDqBqO3X286gbsBlVUw5wzF01oRV5zj++pZ
         PLfu2HSefoHUqeteO1IWGlecZZAdj23Z3smPTzlNxO5YM5zxNE2ThDivbEGFH4eH64Tb
         uWmw==
X-Gm-Message-State: AOAM533nR4jru6DD1asRxM1+8dY2cYvaB9PPWfl1btuftbU3tlnubJJ8
	wJ9CEmr7EVQz749XF2X7jJ0=
X-Google-Smtp-Source: ABdhPJx44lS4Ai2yXXn8V591ghM4am9GxTdD+xMKN2ARZV8UrnEqqpomOlRQvCNWc6041rvSAnTYOg==
X-Received: by 2002:a17:90a:9404:: with SMTP id r4mr2180743pjo.240.1631626769029;
        Tue, 14 Sep 2021 06:39:29 -0700 (PDT)
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
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	brijesh.singh@amd.com,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	pgonda@google.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	sfr@canb.auug.org.au,
	aneesh.kumar@linux.ibm.com,
	saravanand@fb.com,
	krish.sadhukhan@oracle.com,
	xen-devel@lists.xenproject.org,
	tj@kernel.org,
	rientjes@google.com,
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
Subject: [PATCH V5 02/12] x86/hyperv: Initialize shared memory boundary in the Isolation VM.
Date: Tue, 14 Sep 2021 09:39:03 -0400
Message-Id: <20210914133916.1440931-3-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914133916.1440931-1-ltykernel@gmail.com>
References: <20210914133916.1440931-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V exposes shared memory boundary via cpuid
HYPERV_CPUID_ISOLATION_CONFIG and store it in the
shared_gpa_boundary of ms_hyperv struct. This prepares
to share memory with host for SNP guest.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v4:
	* Rename reserve field.

Change since v3:
	* user BIT_ULL to get shared_gpa_boundary
	* Rename field Reserved* to reserved
---
 arch/x86/kernel/cpu/mshyperv.c |  2 ++
 include/asm-generic/mshyperv.h | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index b09ade389040..4794b716ec79 100644
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
index 0924bbd8458e..e04efb87fee5 100644
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
+			u32 reserved1 : 1;
+			u32 shared_gpa_boundary_active : 1;
+			u32 shared_gpa_boundary_bits : 6;
+			u32 reserved2 : 20;
+		};
+	};
+	u64 shared_gpa_boundary;
 };
 extern struct ms_hyperv_info ms_hyperv;
 
-- 
2.25.1


