Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0217B617A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 08:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611896.951590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZIv-0005oi-I8; Tue, 03 Oct 2023 06:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611896.951590; Tue, 03 Oct 2023 06:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZIv-0005fe-4r; Tue, 03 Oct 2023 06:54:49 +0000
Received: by outflank-mailman (input) for mailman id 611896;
 Tue, 03 Oct 2023 06:54:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwHy=FR=intel.com=xin3.li@srs-se1.protection.inumbo.net>)
 id 1qnZIs-00047B-QR
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 06:54:46 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb899e94-61b9-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 08:54:44 +0200 (CEST)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 23:54:38 -0700
Received: from unknown (HELO fred..) ([172.25.112.68])
 by fmsmga005.fm.intel.com with ESMTP; 02 Oct 2023 23:54:37 -0700
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
X-Inumbo-ID: bb899e94-61b9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696316084; x=1727852084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z2I9XuVKzLs7Gkjt7VvwoncwktLr23Bll2CpTX5dzXE=;
  b=WRGo1LmfTzchv/zGaf1PhdyXLf1nFrZB7pJ1rAQEn4Ec0X7WcZ7tuhE/
   HG3N8WF4pEeG6Hic55H4oit3nlB6eQCzdostElyySJAQEtdo0OloBXPTR
   lPTvc6rC06RoYveEHl7uURKONN5Irh/tTm+sHWO2IuDPKi/8kdV+uNMhX
   p5bPapXu6WHXDpxlY9UMDCWuQ1j6vqb3gPJyjvfE7KL+6cSDLE96ibAsx
   vNW5i18/2RXLJOcczYDXP9zOt7gwMPYLUQ1Rv5TJJWWZzoG33+AeUG5BO
   sfzStAMx8nuNV/omWKY0kppffQToPwQkXb/ypPKNplEAqsoCs1x1omPYH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367857979"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="367857979"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1081900916"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1081900916"
From: Xin Li <xin3.li@intel.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com,
	peterz@infradead.org,
	jgross@suse.com,
	ravi.v.shankar@intel.com,
	mhiramat@kernel.org,
	andrew.cooper3@citrix.com,
	jiangshanlai@gmail.com,
	nik.borisov@suse.com
Subject: [PATCH v12 07/37] x86/fred: Add Kconfig option for FRED (CONFIG_X86_FRED)
Date: Mon,  2 Oct 2023 23:24:28 -0700
Message-Id: <20231003062458.23552-8-xin3.li@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003062458.23552-1-xin3.li@intel.com>
References: <20231003062458.23552-1-xin3.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Add the configuration option CONFIG_X86_FRED to enable FRED.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
Signed-off-by: Xin Li <xin3.li@intel.com>
---
 arch/x86/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 433f5e1906d1..5ef2f6fe0681 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -496,6 +496,15 @@ config X86_CPU_RESCTRL
 
 	  Say N if unsure.
 
+config X86_FRED
+	bool "Flexible Return and Event Delivery"
+	depends on X86_64
+	help
+	  When enabled, try to use Flexible Return and Event Delivery
+	  instead of the legacy SYSCALL/SYSENTER/IDT architecture for
+	  ring transitions and exception/interrupt handling if the
+	  system supports.
+
 if X86_32
 config X86_BIGSMP
 	bool "Support for big SMP systems with more than 8 CPUs"
-- 
2.34.1


