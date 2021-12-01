Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7038465269
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 17:03:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236086.409491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msS4f-00031j-6O; Wed, 01 Dec 2021 16:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236086.409491; Wed, 01 Dec 2021 16:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msS4f-0002zW-2E; Wed, 01 Dec 2021 16:03:13 +0000
Received: by outflank-mailman (input) for mailman id 236086;
 Wed, 01 Dec 2021 16:03:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kkHa=QS=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1msS4d-0002Sl-6G
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 16:03:11 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d256260-52c0-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 17:03:09 +0100 (CET)
Received: by mail-pj1-x1035.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso2011642pjb.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Dec 2021 08:03:09 -0800 (PST)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:f:7fe9:3f1e:749e:5d26])
 by smtp.gmail.com with ESMTPSA id i193sm260316pfe.87.2021.12.01.08.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 08:03:08 -0800 (PST)
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
X-Inumbo-ID: 2d256260-52c0-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i+xUpMEUxrmLaLZETYGitNsZhfrMVhJB1Bk6Yp08byU=;
        b=br/8rZr5MsJhI8n1irXI1gp9Qy4y2qB0ZN5gBXyv9j4Su5bhkV81nOXq9DGZu89aNd
         1yE59r1UZL97RAiD6x+SXTYEoUeu7G0jCsBQ1cuLrPvmNB9yCPuhglIAjJYi604mfSQh
         gyy1MrYjqf6FuZtwg+yZTOfgs9SEgL6VOT93jo6Lr0hZDIeKaRrkgfgJp35M71zw1HjF
         mCa+7WRc/5GxMq2fBfHGjWIosZhHgGj4pZbJ+Vjey1HAEvVpBkgPAoLT3LqFfLNjLY2o
         qMt8D2/BJNN7vwve4krmx/83c7M5pnGp6HV82Z4b4QIdszQpO2qvXOEgIjSwmrsLY0WX
         XfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i+xUpMEUxrmLaLZETYGitNsZhfrMVhJB1Bk6Yp08byU=;
        b=zR8eEruNpLtsIhFgjN+FOf7aLGPcqh/fUL7GMSV2KaQMDAJK8F3PG++KlQNEge6yMW
         ZLnu+FSd0wHhWmIVrxJw6DAprx6956QvOu3He8ENiGtUVjCccQL5WMq8Ndfaq85Co6nl
         1VxSSaKczV38VO3O1nFTTXswsw5JmULSw74WPHM40UBqf8TqXRi4yDfq28L6g1nxWrOs
         Vvu8j7xYrL1xWLWcnI/olXyy9JsItWR6DikZ+9lukZGkC3kFKVJVxW4k33ZWQOrjuqqV
         tl+7EMlTb1LxCbgh7fvoC/3hwAvM+Lh79ppK9P8SGOX/ygz+g5g602ecllhhYlVPswHh
         /gtg==
X-Gm-Message-State: AOAM5305aPlwQgvE8YGikVLBG9qyQ9PiW03YRVoiDkcQaEdUzB9lB6N1
	/85CLU7pe54674yZ2E6LSdE=
X-Google-Smtp-Source: ABdhPJzYMUML3tqpL7gDFerbs5Ms9xF8HxCcNqwI0mV93rIMF31+44VhoYZsU5gprIBYp9oOrgPvNQ==
X-Received: by 2002:a17:902:748c:b0:142:5f2f:1828 with SMTP id h12-20020a170902748c00b001425f2f1828mr8493620pll.4.1638374588262;
        Wed, 01 Dec 2021 08:03:08 -0800 (PST)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	joro@8bytes.org,
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	arnd@arndb.de,
	hch@infradead.org,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	xen-devel@lists.xenproject.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	brijesh.singh@amd.com,
	konrad.wilk@oracle.com,
	hch@lst.de,
	parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: [PATCH V3 2/5] x86/hyper-v: Add hyperv Isolation VM check in the cc_platform_has()
Date: Wed,  1 Dec 2021 11:02:53 -0500
Message-Id: <20211201160257.1003912-3-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201160257.1003912-1-ltykernel@gmail.com>
References: <20211201160257.1003912-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V provides Isolation VM which has memory encrypt support. Add
hyperv_cc_platform_has() and return true for check of GUEST_MEM_ENCRYPT
attribute.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 arch/x86/kernel/cc_platform.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/kernel/cc_platform.c b/arch/x86/kernel/cc_platform.c
index 03bb2f343ddb..f3bb0431f5c5 100644
--- a/arch/x86/kernel/cc_platform.c
+++ b/arch/x86/kernel/cc_platform.c
@@ -11,6 +11,7 @@
 #include <linux/cc_platform.h>
 #include <linux/mem_encrypt.h>
 
+#include <asm/mshyperv.h>
 #include <asm/processor.h>
 
 static bool __maybe_unused intel_cc_platform_has(enum cc_attr attr)
@@ -58,9 +59,23 @@ static bool amd_cc_platform_has(enum cc_attr attr)
 #endif
 }
 
+static bool hyperv_cc_platform_has(enum cc_attr attr)
+{
+#ifdef CONFIG_HYPERV
+	if (attr == CC_ATTR_GUEST_MEM_ENCRYPT)
+		return true;
+	else
+		return false;
+#else
+	return false;
+#endif
+}
 
 bool cc_platform_has(enum cc_attr attr)
 {
+	if (hv_is_isolation_supported())
+		return hyperv_cc_platform_has(attr);
+
 	if (sme_me_mask)
 		return amd_cc_platform_has(attr);
 
-- 
2.25.1


