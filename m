Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDAB5F5310
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 13:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416066.660698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og2BF-0007Bd-MZ; Wed, 05 Oct 2022 11:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416066.660698; Wed, 05 Oct 2022 11:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og2BF-000792-JZ; Wed, 05 Oct 2022 11:03:13 +0000
Received: by outflank-mailman (input) for mailman id 416066;
 Wed, 05 Oct 2022 11:03:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1og2BD-0006sU-P6
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 11:03:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cd77590-449d-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 13:03:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B584C1F8A3;
 Wed,  5 Oct 2022 11:03:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6FD9713345;
 Wed,  5 Oct 2022 11:03:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tT8WGm5kPWPmQgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Oct 2022 11:03:10 +0000
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
X-Inumbo-ID: 4cd77590-449d-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664967790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjfiyOlyqF25zTBDZULVk0UdTR16lW+0ZSJokbWtjEI=;
	b=mybiJLJXqY902Vp/rd3sqvMwiEKnCTgtRLXgK5oq+rrLSTp2pFMmn6YH/hWAdU//eFxwAp
	cdVcSzknEyIofxPePN/tqIyJAEP6E22WM5xXlKVfwA0Q8zmPaXg0b3Wv1hPWQl8M5Methq
	bflyIfbkTWugKokBYTizibEOrCLw1Jo=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 1/4] xen/pv: add fault recovery control to pmu msr accesses
Date: Wed,  5 Oct 2022 13:02:59 +0200
Message-Id: <20221005110302.13455-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221005110302.13455-1-jgross@suse.com>
References: <20221005110302.13455-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today pmu_msr_read() and pmu_msr_write() fall back to the safe variants
of read/write MSR in case the MSR access isn't emulated via Xen. Allow
the caller to select that faults should not be recovered from by passing
NULL for the error pointer.

Restructure the code to make it more readable.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- do some restructuring (Jan Beulich, Boris Ostrovsky)
V3:
- commit message rephrasing (Jan Beulich)
- more restructuring (Boris Ostrovsky)
---
 arch/x86/xen/pmu.c | 66 ++++++++++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 28 deletions(-)

diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 21ecbe754cb2..0f98cb1077e3 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -131,6 +131,9 @@ static inline uint32_t get_fam15h_addr(u32 addr)
 
 static inline bool is_amd_pmu_msr(unsigned int msr)
 {
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL)
+		return false;
+
 	if ((msr >= MSR_F15H_PERF_CTL &&
 	     msr < MSR_F15H_PERF_CTR + (amd_num_counters * 2)) ||
 	    (msr >= MSR_K7_EVNTSEL0 &&
@@ -144,6 +147,9 @@ static int is_intel_pmu_msr(u32 msr_index, int *type, int *index)
 {
 	u32 msr_index_pmc;
 
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
+		return false;
+
 	switch (msr_index) {
 	case MSR_CORE_PERF_FIXED_CTR_CTRL:
 	case MSR_IA32_DS_AREA:
@@ -290,48 +296,52 @@ static bool xen_amd_pmu_emulate(unsigned int msr, u64 *val, bool is_read)
 	return false;
 }
 
+static bool pmu_msr_chk_emulated(unsigned int msr, uint64_t *val, bool is_read,
+				 bool *emul)
+{
+	int type, index;
+
+	if (is_amd_pmu_msr(msr))
+		*emul = xen_amd_pmu_emulate(msr, val, is_read);
+	else if (is_intel_pmu_msr(msr, &type, &index))
+		*emul = xen_intel_pmu_emulate(msr, val, type, index, is_read);
+	else
+		return false;
+
+	return true;
+}
+
 bool pmu_msr_read(unsigned int msr, uint64_t *val, int *err)
 {
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL) {
-		if (is_amd_pmu_msr(msr)) {
-			if (!xen_amd_pmu_emulate(msr, val, 1))
-				*val = native_read_msr_safe(msr, err);
-			return true;
-		}
-	} else {
-		int type, index;
+	bool emulated;
 
-		if (is_intel_pmu_msr(msr, &type, &index)) {
-			if (!xen_intel_pmu_emulate(msr, val, type, index, 1))
-				*val = native_read_msr_safe(msr, err);
-			return true;
-		}
+	if (!pmu_msr_chk_emulated(msr, val, true, &emulated))
+		return false;
+
+	if (!emulated) {
+		*val = err ? native_read_msr_safe(msr, err)
+			   : native_read_msr(msr);
 	}
 
-	return false;
+	return true;
 }
 
 bool pmu_msr_write(unsigned int msr, uint32_t low, uint32_t high, int *err)
 {
 	uint64_t val = ((uint64_t)high << 32) | low;
+	bool emulated;
 
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL) {
-		if (is_amd_pmu_msr(msr)) {
-			if (!xen_amd_pmu_emulate(msr, &val, 0))
-				*err = native_write_msr_safe(msr, low, high);
-			return true;
-		}
-	} else {
-		int type, index;
+	if (!pmu_msr_chk_emulated(msr, &val, false, &emulated))
+		return false;
 
-		if (is_intel_pmu_msr(msr, &type, &index)) {
-			if (!xen_intel_pmu_emulate(msr, &val, type, index, 0))
-				*err = native_write_msr_safe(msr, low, high);
-			return true;
-		}
+	if (!emulated) {
+		if (err)
+			*err = native_write_msr_safe(msr, low, high);
+		else
+			native_write_msr(msr, low, high);
 	}
 
-	return false;
+	return true;
 }
 
 static unsigned long long xen_amd_read_pmc(int counter)
-- 
2.35.3


