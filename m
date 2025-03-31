Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7577A76177
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931993.1334185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARB-000236-AS; Mon, 31 Mar 2025 08:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931993.1334185; Mon, 31 Mar 2025 08:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARB-0001wJ-52; Mon, 31 Mar 2025 08:24:05 +0000
Received: by outflank-mailman (input) for mailman id 931993;
 Mon, 31 Mar 2025 08:24:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=orDG=WS=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1tzAR9-0001u1-WE
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:24:04 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fd110f3-0e09-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 10:24:02 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52V8Mp063171319
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 31 Mar 2025 01:23:10 -0700
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
X-Inumbo-ID: 7fd110f3-0e09-11f0-9ea7-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52V8Mp063171319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743409392;
	bh=VWVlHnRAQ/URpBmLS0sboRyyUviRP0Ft54tlbnwKLbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LmuvsR6JU0wFg45aoeU1BmH+vTdjhSivLbBzn3nlmIbxQ1T8sqwq82VC74O3yYItX
	 S9sFYj9ZngvuYrNW7sHGljfyh5Gqzhf6VwZ/aRtGB720vFbJ9EDDOtQ9E0xXh2PU0+
	 7FTWRNpDPjfEZWo0yQCIVXmiHAQ6gMo2/Xgl8on4LA7UNyUv6fE4T91P+HIZpg7iX1
	 KkWnpYwKYYQj9Ur2Oo6+kBlMb0LDXwYZNWNFnRncQNe82SMqi3NRZs9EH5QHNmpSzd
	 3/S95C0un5h+YfWI71+I8tTNlrvTtz2S7X75vWWrxF52F7m0pJIvPFhhq4Yw7MnVfu
	 weMHDHw5OzZNA==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
        linux-edac@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-ide@vger.kernel.org,
        linux-pm@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        jgross@suse.com, andrew.cooper3@citrix.com, peterz@infradead.org,
        acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        alexey.amakhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
        seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
        kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com
Subject: [RFC PATCH v1 06/15] x86/msr: Remove MSR write APIs that take the MSR value in two u32 arguments
Date: Mon, 31 Mar 2025 01:22:42 -0700
Message-ID: <20250331082251.3171276-7-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331082251.3171276-1-xin@zytor.com>
References: <20250331082251.3171276-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/msr.h | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 121597fc5d41..da4f2f6d127f 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -111,9 +111,6 @@ static __always_inline u64 native_rdmsrl(const u32 msr)
 	return __rdmsr(msr);
 }
 
-#define native_wrmsr(msr, low, high)			\
-	__wrmsr((msr), ((u64)(high) << 32) | (low))
-
 #define native_wrmsrl(msr, val)				\
 	__wrmsr((msr), (val))
 
@@ -253,11 +250,6 @@ do {								\
 	(void)((high) = (u32)(__val >> 32));			\
 } while (0)
 
-static inline void wrmsr(u32 msr, u32 low, u32 high)
-{
-	native_write_msr(msr, (u64)high << 32 | low);
-}
-
 #define rdmsrl(msr, val)			\
 	((val) = native_read_msr((msr)))
 
@@ -266,12 +258,6 @@ static inline void wrmsrl(u32 msr, u64 val)
 	native_write_msr(msr, val);
 }
 
-/* wrmsr with exception handling */
-static inline int wrmsr_safe(u32 msr, u32 low, u32 high)
-{
-	return native_write_msr_safe(msr, (u64)high << 32 | low);
-}
-
 /* rdmsr with exception handling */
 #define rdmsr_safe(msr, low, high)				\
 ({								\
@@ -321,7 +307,7 @@ static __always_inline void wrmsrns(u32 msr, u64 val)
  */
 static inline int wrmsrl_safe(u32 msr, u64 val)
 {
-	return wrmsr_safe(msr, (u32)val,  (u32)(val >> 32));
+	return native_write_msr_safe(msr, val);
 }
 
 struct msr __percpu *msrs_alloc(void);
@@ -380,7 +366,7 @@ static inline int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no,
 }
 static inline int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
 {
-	return wrmsr_safe(msr_no, l, h);
+	return wrmsrl_safe(msr_no, (u64)h << 32 | l);
 }
 static inline int rdmsrl_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
 {
-- 
2.49.0


