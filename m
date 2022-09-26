Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0569A5EA83D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 16:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411853.654956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocowp-0005Gt-M0; Mon, 26 Sep 2022 14:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411853.654956; Mon, 26 Sep 2022 14:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocowp-0005E4-Gn; Mon, 26 Sep 2022 14:19:03 +0000
Received: by outflank-mailman (input) for mailman id 411853;
 Mon, 26 Sep 2022 14:19:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ba90=Z5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ocown-0005DG-Tk
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 14:19:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29bfadcf-3da6-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 16:18:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 26E0A1F461;
 Mon, 26 Sep 2022 14:18:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFCE7139BD;
 Mon, 26 Sep 2022 14:18:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id L1Z8MdK0MWORBgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 26 Sep 2022 14:18:58 +0000
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
X-Inumbo-ID: 29bfadcf-3da6-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664201939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d2HK44ajp1lbC5d5j3eVVMNpf685PGwbChjA5LVUn8U=;
	b=ri7oOJT3IepK3v9cmd+MT8FhkKA76sA90fa4F+C13EL0MykPKpTmwIbx9q/WgvfWRSURNr
	V9zK8rJK98uspTICV60Ydt/PN3znvEIiAdXmfC6Q8OOFBd3GZEYxdNsivznfEPDS0O6ZB2
	5+es+r5FUNJU+VLRINnrUt5B2l0xrmU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 1/3] xen/pv: allow pmu msr accesses to cause GP
Date: Mon, 26 Sep 2022 16:18:47 +0200
Message-Id: <20220926141849.21805-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220926141849.21805-1-jgross@suse.com>
References: <20220926141849.21805-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today pmu_msr_read() and pmu_msr_write() fall back to the safe variants
of read/write MSR in case the MSR access isn't emulated via Xen. Allow
the caller to select the potentially faulting variant by passing NULL
for the error pointer.

Remove one level of indentation by restructuring the code a little bit.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/pmu.c | 44 ++++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 21ecbe754cb2..34b4144f6041 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -293,22 +293,24 @@ static bool xen_amd_pmu_emulate(unsigned int msr, u64 *val, bool is_read)
 bool pmu_msr_read(unsigned int msr, uint64_t *val, int *err)
 {
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL) {
-		if (is_amd_pmu_msr(msr)) {
-			if (!xen_amd_pmu_emulate(msr, val, 1))
-				*val = native_read_msr_safe(msr, err);
-			return true;
+		if (!is_amd_pmu_msr(msr))
+			return false;
+		if (!xen_amd_pmu_emulate(msr, val, 1)) {
+			*val = err ? native_read_msr_safe(msr, err)
+				   : native_read_msr(msr);
 		}
+		return true;
 	} else {
 		int type, index;
 
-		if (is_intel_pmu_msr(msr, &type, &index)) {
-			if (!xen_intel_pmu_emulate(msr, val, type, index, 1))
-				*val = native_read_msr_safe(msr, err);
-			return true;
+		if (!is_intel_pmu_msr(msr, &type, &index))
+			return false;
+		if (!xen_intel_pmu_emulate(msr, val, type, index, 1)) {
+			*val = err ? native_read_msr_safe(msr, err)
+				   : native_read_msr(msr);
 		}
+		return true;
 	}
-
-	return false;
 }
 
 bool pmu_msr_write(unsigned int msr, uint32_t low, uint32_t high, int *err)
@@ -316,22 +318,28 @@ bool pmu_msr_write(unsigned int msr, uint32_t low, uint32_t high, int *err)
 	uint64_t val = ((uint64_t)high << 32) | low;
 
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL) {
-		if (is_amd_pmu_msr(msr)) {
-			if (!xen_amd_pmu_emulate(msr, &val, 0))
+		if (!is_amd_pmu_msr(msr))
+			return false;
+		if (!xen_amd_pmu_emulate(msr, &val, 0)) {
+			if (err)
 				*err = native_write_msr_safe(msr, low, high);
-			return true;
+			else
+				native_write_msr(msr, low, high);
 		}
+		return true;
 	} else {
 		int type, index;
 
-		if (is_intel_pmu_msr(msr, &type, &index)) {
-			if (!xen_intel_pmu_emulate(msr, &val, type, index, 0))
+		if (!is_intel_pmu_msr(msr, &type, &index))
+			return false;
+		if (!xen_intel_pmu_emulate(msr, &val, type, index, 0)) {
+			if (err)
 				*err = native_write_msr_safe(msr, low, high);
-			return true;
+			else
+				native_write_msr(msr, low, high);
 		}
+		return true;
 	}
-
-	return false;
 }
 
 static unsigned long long xen_amd_read_pmc(int counter)
-- 
2.35.3


