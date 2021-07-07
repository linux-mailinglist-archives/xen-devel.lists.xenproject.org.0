Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3E83BEB9A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152537.281811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19ps-0000ww-IC; Wed, 07 Jul 2021 15:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152537.281811; Wed, 07 Jul 2021 15:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19ps-0000uP-B5; Wed, 07 Jul 2021 15:51:40 +0000
Received: by outflank-mailman (input) for mailman id 152537;
 Wed, 07 Jul 2021 15:51:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hxnL=L7=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m19md-0002ed-7K
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:48:19 +0000
Received: from mail-pg1-x530.google.com (unknown [2607:f8b0:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebec7393-d1fd-4e30-85c3-7850c9255489;
 Wed, 07 Jul 2021 15:47:16 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id v7so2683332pgl.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jul 2021 08:47:16 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:38:6b47:cf3e:bbf2:d229])
 by smtp.gmail.com with ESMTPSA id q18sm23093560pgj.8.2021.07.07.08.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:47:15 -0700 (PDT)
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
X-Inumbo-ID: ebec7393-d1fd-4e30-85c3-7850c9255489
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=84IEbLNgJNomBqMgxBtrETy72H72EvXAGdQ00eQF2Mc=;
        b=YNnohj4Chb9T3B9ZYxiBv9YVqoi0X5lB74SQ7L1EnVYnuQ7j+Sylm+oTEpclLAr4Rp
         QMdcSRfsEpsNu8h57gAfWgW+S7FmRK+lRz16mOIVQB9v19q7vKIS/3imFU7L8I+a+CoW
         4CZ1ji2QtUkrwbieeV7oza4eciyEFAW2B4m/iegyGFZxo9emMHECDfkYKuchj9BUm6ka
         +lt0qfR+AlSO/jWbQhKgOe0W6mJ6vX8d+oS1VyY2+/m2yXPG+YkyAhEMSZLvHoK3AYA2
         aynhmc1FnAYYAolwJfs0NpD2mwngTXdQQx4mA0KgjhyurE1FSWmq2vOFbfaVKW7EnbvH
         tEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=84IEbLNgJNomBqMgxBtrETy72H72EvXAGdQ00eQF2Mc=;
        b=JmB4NLzV12Grm7dtD1LoKqIrvzNhKP5h7d55VZeKQv9o2+M8fTNwAaEn+m6j9tVJEk
         yDzcGTjNcPMnooHXekaHl9F33auIzsC37ydnP2GkgEmci4LLQg4e6DFu1HiygfmXTdY2
         CznTKX6s+cE4a6Wq37fgUx10/27XqwrLY2nElMl5C+CJb+XWir667vbwcNewZoYI+d0U
         lO31rA36NusXaqSv2GuIX4V1tTnrtURA2mPnO0RcSopTcwyPo6OLXDtd5zxkheDa7yh6
         2GsGbckneV5D1HBwEd/zNNtzT93N/4bKvkLFld1WEj3Xys1DYCGPg5UCj8r2KDMlaLtD
         QAWg==
X-Gm-Message-State: AOAM532wMordziOSdpj/qrFm2KKJ7jsHUIZRECQIWnnWqgjua1HhFqgj
	wQNyaut/bd7v3HdcnC9aF2Y=
X-Google-Smtp-Source: ABdhPJwc0xo238tlV5y9FHemJmnwVdI1QKXmzxerVDS/ZE3a5qm/V6a2aCdYF88RGalmD6tecULCLg==
X-Received: by 2002:a63:1601:: with SMTP id w1mr26556927pgl.116.1625672836292;
        Wed, 07 Jul 2021 08:47:16 -0700 (PDT)
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
Subject: [Resend RFC PATCH V4 13/13] x86/HV: Not set memory decrypted/encrypted during kexec alloc/free page in IVM
Date: Wed,  7 Jul 2021 11:46:27 -0400
Message-Id: <20210707154629.3977369-14-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707154629.3977369-1-ltykernel@gmail.com>
References: <20210707154629.3977369-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V Isolation VM reuses set_memory_decrypted/encrypted function
and not needs to decrypted/encrypted in arch_kexec_post_alloc(pre_free)
_pages just likes AMD SEV VM. So skip them.

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


