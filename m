Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73C63BEB4B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:47:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152487.281732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19lC-0003Tu-QF; Wed, 07 Jul 2021 15:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152487.281732; Wed, 07 Jul 2021 15:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19lC-0003RP-M1; Wed, 07 Jul 2021 15:46:50 +0000
Received: by outflank-mailman (input) for mailman id 152487;
 Wed, 07 Jul 2021 15:46:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hxnL=L7=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m19lB-0002ed-4D
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:46:49 +0000
Received: from mail-pg1-x530.google.com (unknown [2607:f8b0:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f823c15d-0146-48bb-8c62-e74ba6bc6f20;
 Wed, 07 Jul 2021 15:46:44 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id v7so2681618pgl.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jul 2021 08:46:44 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:38:6b47:cf3e:bbf2:d229])
 by smtp.gmail.com with ESMTPSA id q18sm23093560pgj.8.2021.07.07.08.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:46:43 -0700 (PDT)
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
X-Inumbo-ID: f823c15d-0146-48bb-8c62-e74ba6bc6f20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0MmjMjO7XvUbpBRdqqPG7tGmikUa5z2pWikCp/JzIEY=;
        b=UW7L39XXXA0lFLWgWURoFcPlCEh4S4Z8KGVwXPdNWOZ1uC97xNL/QzrnRe932i5Zpl
         v+us9x+QqUCVOJR7NW0cti8Dlvz3ntW5JBnk3T8mrXTQQXScCfMHjoOC5qWs78n+WXHy
         l0/TBbeXhFNdgxncs8vmuBc0rOiOjaE2C0pPG29QKAwWxzv4x0ZxqdciLaEAszX0ad2L
         rytLK20HtdLSd1w9TyUEPQIWBcbAQAlFIoL9atuDdZLes8JZJ04ezb04sQO7vSDnJg/s
         lgt8L6SFaYrDfbO40RdC74i07ap4lhvqEU/pQl2wDRJfhNq+GPC5XQGz2XIiVhjZjRsT
         5j1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0MmjMjO7XvUbpBRdqqPG7tGmikUa5z2pWikCp/JzIEY=;
        b=PrfrBcqv2sIE69wSNtdovZOmMq5X/Gb+VpbqMn5q0inT6dyKKUqghlBF5HHtfK4BrH
         TwK3oYJSiTSJNrvnycyYeKazLj8crEJcSPo8SzfJPxXgkUc+j//F1r2TensJ2EazWJc9
         08Bg69IJqwfPsqlWC1lwwqxyZX35NzP3LJDb+CeIPsG0W8txYqF48LDIK4hLZalrj4r2
         W4VKL0I2a5DtylM7XEZN3ZL6cosGxsF+2ncgZ5Kw92eyhHCSgLHMZsUe1+ncngwDlHb7
         /sZBh4B2id0BNEpmqh4naaGAYle8M08XupOujr7MD6EyPIB9iStMWkeN20hi3jukzb9r
         ozjg==
X-Gm-Message-State: AOAM5329ORqc7yzOldzgXuO7G6Z9D7SomAnYen74dwLtJc6/lX8+Y3z5
	9gSOJuc2rqlndgqpb5CzuWc=
X-Google-Smtp-Source: ABdhPJyAY8zlw6ShjL9q8KFDuhfqbUuaIuxnQh2fAt/BqNVogHlUsHJh8B4rAjBi+hH2uyVONxd4RA==
X-Received: by 2002:a05:6a00:8c4:b029:2b4:8334:ed4d with SMTP id s4-20020a056a0008c4b02902b48334ed4dmr25950524pfu.36.1625672804218;
        Wed, 07 Jul 2021 08:46:44 -0700 (PDT)
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
	kirill.shutemov@linux.intel.com,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	ardb@kernel.org,
	robh@kernel.org,
	nramas@linux.microsoft.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	david@redhat.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	xen-devel@lists.xenproject.org,
	keescook@chromium.org,
	rientjes@google.com,
	hannes@cmpxchg.org,
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
Subject: [Resend RFC PATCH V4 02/13] x86/HV: Initialize shared memory boundary in the Isolation VM.
Date: Wed,  7 Jul 2021 11:46:16 -0400
Message-Id: <20210707154629.3977369-3-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707154629.3977369-1-ltykernel@gmail.com>
References: <20210707154629.3977369-1-ltykernel@gmail.com>
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


