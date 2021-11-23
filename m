Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462DE45A5D2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 15:37:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229646.397127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpWus-0006yt-9B; Tue, 23 Nov 2021 14:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229646.397127; Tue, 23 Nov 2021 14:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpWus-0006wm-5v; Tue, 23 Nov 2021 14:37:02 +0000
Received: by outflank-mailman (input) for mailman id 229646;
 Tue, 23 Nov 2021 14:37:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PpN+=QK=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mpWuq-0006bF-Ez
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 14:37:00 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0463d8a-4c6a-11ec-a9d2-d9f7a1cc8784;
 Tue, 23 Nov 2021 15:36:59 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id u11so17250915plf.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Nov 2021 06:36:59 -0800 (PST)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:1:af65:c3d4:6df:5a8b])
 by smtp.gmail.com with ESMTPSA id j13sm11926127pfc.151.2021.11.23.06.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:36:57 -0800 (PST)
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
X-Inumbo-ID: d0463d8a-4c6a-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i+xUpMEUxrmLaLZETYGitNsZhfrMVhJB1Bk6Yp08byU=;
        b=AlKcv7Y4VFkVezS6aJXAds/NWYnLHTHgFDawHsIGURkEQw1ZQprC+xxgttepVcIQUM
         5T5M0RL+DPFTteQFgNGSjajmwgRX1J2Y5QsSwTqvWdVg1A+EWhpdaWNqmbKB24YbhnwY
         VTf6iEPD2bD9xmmRrEK7FLp6gAd4SMfhDEAaTdaySH6ygkl9daOZYS/EkqwnTKSZglAK
         egCsNvtL8/Q16NYzGtBDx6YW50D+dp/CauiDtizCo8lfzW3y900HzjaUttJ2TmSaJV4N
         ShJbzW4YSovU0kpEhKAaY2ps0ZKmQFzKQmxGR0raTUS1hPCogFjcj1BjeQYlXNYc4eIF
         EFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i+xUpMEUxrmLaLZETYGitNsZhfrMVhJB1Bk6Yp08byU=;
        b=FLpIHuiMV997eP8l38CWvgiOR1RBihGoBwZz/dqkEpHHMdyqnUmjSMGGMXUswfFuet
         1RzJOHjOn7GNPECT6Xo7carJSU7p8EVEOyOAGpFzm0m5O1x9ekUcMZI5bOmRyYeKsq+w
         pp226Wo1YpULuSsSWXoJG0meExopUyZfd5fNaLDhYgudY5Spt0/iZxDnn48Yi+SpOCRo
         bUYobx1B+zU752zxYEQ01sl4HV9c9dznmG206+9JfrCL+0Psp8kok0e9x29neW51y2T+
         2OmLU/KQJsv6mtzyOEfR9ZDrcdP/qNY//aZBAH2cCWl5ppp1uEfZX9H0KVSX8aHaufBA
         ygUA==
X-Gm-Message-State: AOAM533SL8YznwinhBbSvwU1ylH+RuCXtd+Lqt8QmnwD8dkpo9Ms/SnV
	KDVifgAmb9ui7e/kPlvqhvsVWKQeTah5ug==
X-Google-Smtp-Source: ABdhPJwRbhdcFhTlrcl5ARyO8E5M5xT/1VQMfqX2FgiEinsxJqYW1NtlXEltffF5Oag+q0rt470N+g==
X-Received: by 2002:a17:90b:180b:: with SMTP id lw11mr3650766pjb.108.1637678218159;
        Tue, 23 Nov 2021 06:36:58 -0800 (PST)
From: Tianyu Lan <ltykernel@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	jgross@suse.com,
	sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	joro@8bytes.org,
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	xen-devel@lists.xenproject.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	brijesh.singh@amd.com,
	konrad.wilk@oracle.com,
	parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: [PATCH V2 3/6] x86/hyper-v: Add hyperv Isolation VM check in the cc_platform_has()
Date: Tue, 23 Nov 2021 09:30:34 -0500
Message-Id: <20211123143039.331929-4-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123143039.331929-1-ltykernel@gmail.com>
References: <20211123143039.331929-1-ltykernel@gmail.com>
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


