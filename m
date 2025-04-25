Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE37A9C127
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 10:35:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967311.1357130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EWy-0002ve-Vy; Fri, 25 Apr 2025 08:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967311.1357130; Fri, 25 Apr 2025 08:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EWy-0002tf-Q3; Fri, 25 Apr 2025 08:35:32 +0000
Received: by outflank-mailman (input) for mailman id 967311;
 Fri, 25 Apr 2025 08:35:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tuhi=XL=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u8EWx-0002sy-4l
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 08:35:31 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cdda175-21b0-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 10:35:27 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53P8Yg5V2390085
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 25 Apr 2025 01:35:02 -0700
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
X-Inumbo-ID: 3cdda175-21b0-11f0-9eb3-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53P8Yg5V2390085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745570103;
	bh=HGw2nFQL5aKA5RzIm7/QSoWKBl/SarOifRVAMhDF5jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WmynG9wHeRjV+Q3G3LyDwa0t8H2xdLhYQhh0ra6oIC+UKd/vIlwdgrqzDjKdCDec2
	 PnojmoRouq3yIpIiGFGVI2h14sephA3L4z+tUh7+efsj9OhPET2PQZgkHJyaQryO1J
	 HjXROz4i7dHc2FLIHeagMur/3NIya3J9of0PiuZl2K+1kbxBdagDgSqYF6kqkg7o13
	 4Xt2UVPF8/kCortRdwMgreH8vjS20RTFSJPYmFHCcndr+PULwc5WvqeeXBnSMpd0Jj
	 t76O0a/CmAPYaGzPF5p6HEpyekAJYxcBemmDnxV7IEH/jHg/7MdFfLjWdILBqGNFxn
	 IJwSKbRyX0DGw==
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
Subject: [PATCH v3 07/14] x86/msr: Add the native_rdmsrq() helper
Date: Fri, 25 Apr 2025 01:34:30 -0700
Message-ID: <20250425083442.2390017-8-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425083442.2390017-1-xin@zytor.com>
References: <20250425083442.2390017-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__rdmsr() is the lowest-level primitive MSR read API, implemented in
assembly code and returning an MSR value in a u64 integer, on top of
which a convenience wrapper native_rdmsr() is defined to return an MSR
value in two u32 integers.  For some reason, native_rdmsrq() is not
defined and __rdmsr() is directly used when it needs to return an MSR
value in a u64 integer.

Add the native_rdmsrq() helper, which is simply an alias of __rdmsr(),
to make native_rdmsr() and native_rdmsrq() a pair of MSR read APIs.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---

Change in v2:
* Split into two changes and add the native_rdmsrl() helper in the
  first one with a proper explanation (Ingo).
---
 arch/x86/include/asm/msr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 82a908125b20..7b9713a49d59 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -107,6 +107,11 @@ do {							\
 	(void)((val2) = (u32)(__val >> 32));		\
 } while (0)
 
+static __always_inline u64 native_rdmsrq(u32 msr)
+{
+	return __rdmsr(msr);
+}
+
 #define native_wrmsr(msr, low, high)			\
 	__wrmsr(msr, low, high)
 
-- 
2.49.0


