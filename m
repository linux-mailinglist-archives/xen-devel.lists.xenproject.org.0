Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C20A9C126
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 10:35:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967322.1357235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EX7-0005Uc-H8; Fri, 25 Apr 2025 08:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967322.1357235; Fri, 25 Apr 2025 08:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EX7-0005Rf-7o; Fri, 25 Apr 2025 08:35:41 +0000
Received: by outflank-mailman (input) for mailman id 967322;
 Fri, 25 Apr 2025 08:35:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tuhi=XL=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u8EX5-0002sz-BK
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 08:35:39 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dc309f1-21b0-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 10:35:29 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53P8Yg5Z2390085
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 25 Apr 2025 01:35:10 -0700
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
X-Inumbo-ID: 3dc309f1-21b0-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53P8Yg5Z2390085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745570112;
	bh=SuVfHs5/TqhTttnO9xmll8hvX7BRznt+kmoVGtMiUw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K8lOKuIh/D/j7rZL7AQL6SMyVvbSw9/XmzjWLxTZwYLNpA2genobdKLYetW7RYAaM
	 m75xsxgTEDLfOAGlGi3upnHxzwttxJ+hLtCW+XnAV2rRY5NBOrQFoS1yMuSVsXajKJ
	 5Hv2+0oeUl2dnVryDTNH5G++Q9r1jBoT5LZ46QreyIe/CCPPS2/e+BYkoG5UaWrW5Y
	 Rbog+y9zcYaFw/P9uDuQ8WIuXo2rc2EWkr+5pwlFccp1Ul29yTTsAZ6GltMI+YV+pn
	 hqOgyl4nWc7UW1d/lG8P54j5O9rvp2FzQzg9jmXJaBHgkcB/fLPFsOTZ8K0cJsme38
	 /2r7j9uqSpAZQ==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, linux-pm@vger.kernel.org,
        linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
        netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        acme@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com,
        peterz@infradead.org, namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
        pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
        luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
        haiyangz@microsoft.com, decui@microsoft.com,
        dapeng1.mi@linux.intel.com
Subject: [PATCH v3 11/14] x86/xen/msr: Remove the error pointer argument from set_seg()
Date: Fri, 25 Apr 2025 01:34:34 -0700
Message-ID: <20250425083442.2390017-12-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425083442.2390017-1-xin@zytor.com>
References: <20250425083442.2390017-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_seg() is used to write the following MSRs on Xen:

    MSR_FS_BASE
    MSR_KERNEL_GS_BASE
    MSR_GS_BASE

But none of these MSRs are written using any MSR write safe API.
Therefore there is no need to pass an error pointer argument to
set_seg() for returning an error code to be used in MSR safe APIs.

Remove the error pointer argument.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---

Change in v3:
*) Fix a typo: set_reg() => set_seg() (Juergen Gross).
---
 arch/x86/xen/enlighten_pv.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 528a2f4df050..c247e7689bc3 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1110,17 +1110,11 @@ static u64 xen_do_read_msr(unsigned int msr, int *err)
 	return val;
 }
 
-static void set_seg(unsigned int which, unsigned int low, unsigned int high,
-		    int *err)
+static void set_seg(u32 which, u32 low, u32 high)
 {
 	u64 base = ((u64)high << 32) | low;
 
-	if (HYPERVISOR_set_segment_base(which, base) == 0)
-		return;
-
-	if (err)
-		*err = -EIO;
-	else
+	if (HYPERVISOR_set_segment_base(which, base))
 		WARN(1, "Xen set_segment_base(%u, %llx) failed\n", which, base);
 }
 
@@ -1136,15 +1130,15 @@ static void xen_do_write_msr(unsigned int msr, unsigned int low,
 
 	switch (msr) {
 	case MSR_FS_BASE:
-		set_seg(SEGBASE_FS, low, high, err);
+		set_seg(SEGBASE_FS, low, high);
 		break;
 
 	case MSR_KERNEL_GS_BASE:
-		set_seg(SEGBASE_GS_USER, low, high, err);
+		set_seg(SEGBASE_GS_USER, low, high);
 		break;
 
 	case MSR_GS_BASE:
-		set_seg(SEGBASE_GS_KERNEL, low, high, err);
+		set_seg(SEGBASE_GS_KERNEL, low, high);
 		break;
 
 	case MSR_STAR:
-- 
2.49.0


