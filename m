Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAAJBdR2lWlwRwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 09:22:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ACF153F71
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 09:22:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235316.1538297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vscox-0000Pj-P9; Wed, 18 Feb 2026 08:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235316.1538297; Wed, 18 Feb 2026 08:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vscox-0000Nx-MC; Wed, 18 Feb 2026 08:22:07 +0000
Received: by outflank-mailman (input) for mailman id 1235316;
 Wed, 18 Feb 2026 08:22:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RtAK=AW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vscow-0008T9-I2
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 08:22:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e863b3d7-0ca2-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 09:22:04 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 591283E6F6;
 Wed, 18 Feb 2026 08:22:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6A893EA65;
 Wed, 18 Feb 2026 08:22:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nCpFM6t2lWllHgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 18 Feb 2026 08:22:03 +0000
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
X-Inumbo-ID: e863b3d7-0ca2-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1771402924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmkFHBBGmW1gFmVNGJrsFCQB+9CCXKUbJdAXWGghiNM=;
	b=gPtQAbrJ0W7jHHybeb0/Ufmin0ifKbAt6AzDrXFVFWbzpGlMPQ513v+jLWpWyygbuuKCBW
	zvWvrj/Au4wcSx6zt5y3JgpiB1DHq5jfCdDlc598xegpKWZY05VaShPPyaNUEujUBe8Aoi
	gqO7WjvpxpLP4DNzZVL0nxAEg1zRuAM=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1771402924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmkFHBBGmW1gFmVNGJrsFCQB+9CCXKUbJdAXWGghiNM=;
	b=gPtQAbrJ0W7jHHybeb0/Ufmin0ifKbAt6AzDrXFVFWbzpGlMPQ513v+jLWpWyygbuuKCBW
	zvWvrj/Au4wcSx6zt5y3JgpiB1DHq5jfCdDlc598xegpKWZY05VaShPPyaNUEujUBe8Aoi
	gqO7WjvpxpLP4DNzZVL0nxAEg1zRuAM=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 05/16] x86/msr: Minimize usage of native_*() msr access functions
Date: Wed, 18 Feb 2026 09:21:22 +0100
Message-ID: <20260218082133.400602-6-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218082133.400602-1-jgross@suse.com>
References: <20260218082133.400602-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-hyperv@vger.kernel.org,m:kvm@vger.kernel.org,m:jgross@suse.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:pbonzini@redhat.com,m:vkuznets@redhat.com,m:seanjc@google.com,m:boris.ostrovsky@oracle.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 65ACF153F71
X-Rspamd-Action: no action

In order to prepare for some MSR access function reorg work, switch
most users of native_{read|write}_msr[_safe]() to the more generic
rdmsr*()/wrmsr*() variants.

For now this will have some intermediate performance impact with
paravirtualization configured when running on bare metal, but this
is a prereq change for the planned direct inlining of the rdmsr/wrmsr
instructions with this configuration.

The main reason for this switch is the planned move of the MSR trace
function invocation from the native_*() functions to the generic
rdmsr*()/wrmsr*() variants. Without this switch the users of the
native_*() functions would lose the related tracing entries.

Note that the Xen related MSR access functions will not be switched,
as these will be handled after the move of the trace hooks.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Sean Christopherson <seanjc@google.com>
Acked-by: Wei Liu <wei.liu@kernel.org>
Reviewed-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/hyperv/ivm.c          |  2 +-
 arch/x86/kernel/cpu/mshyperv.c |  7 +++++--
 arch/x86/kernel/kvmclock.c     |  2 +-
 arch/x86/kvm/svm/svm.c         | 16 ++++++++--------
 arch/x86/xen/pmu.c             |  4 ++--
 5 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index 651771534cae..1b2222036a0b 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -327,7 +327,7 @@ int hv_snp_boot_ap(u32 apic_id, unsigned long start_ip, unsigned int cpu)
 	asm volatile("movl %%ds, %%eax;" : "=a" (vmsa->ds.selector));
 	hv_populate_vmcb_seg(vmsa->ds, vmsa->gdtr.base);
 
-	vmsa->efer = native_read_msr(MSR_EFER);
+	rdmsrq(MSR_EFER, vmsa->efer);
 
 	vmsa->cr4 = native_read_cr4();
 	vmsa->cr3 = __native_read_cr3();
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 579fb2c64cfd..9bebb1a1ebee 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -111,9 +111,12 @@ void hv_para_set_sint_proxy(bool enable)
  */
 u64 hv_para_get_synic_register(unsigned int reg)
 {
+	u64 val;
+
 	if (WARN_ON(!ms_hyperv.paravisor_present || !hv_is_synic_msr(reg)))
 		return ~0ULL;
-	return native_read_msr(reg);
+	rdmsrq(reg, val);
+	return val;
 }
 
 /*
@@ -123,7 +126,7 @@ void hv_para_set_synic_register(unsigned int reg, u64 val)
 {
 	if (WARN_ON(!ms_hyperv.paravisor_present || !hv_is_synic_msr(reg)))
 		return;
-	native_write_msr(reg, val);
+	wrmsrq(reg, val);
 }
 
 u64 hv_get_msr(unsigned int reg)
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index b5991d53fc0e..1002bdd45c0f 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -197,7 +197,7 @@ static void kvm_setup_secondary_clock(void)
 void kvmclock_disable(void)
 {
 	if (msr_kvm_system_time)
-		native_write_msr(msr_kvm_system_time, 0);
+		wrmsrq(msr_kvm_system_time, 0);
 }
 
 static void __init kvmclock_init_mem(void)
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 8f8bc863e214..1c0e7cae9e49 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -389,12 +389,12 @@ static void svm_init_erratum_383(void)
 		return;
 
 	/* Use _safe variants to not break nested virtualization */
-	if (native_read_msr_safe(MSR_AMD64_DC_CFG, &val))
+	if (rdmsrq_safe(MSR_AMD64_DC_CFG, &val))
 		return;
 
 	val |= (1ULL << 47);
 
-	native_write_msr_safe(MSR_AMD64_DC_CFG, val);
+	wrmsrq_safe(MSR_AMD64_DC_CFG, val);
 
 	erratum_383_found = true;
 }
@@ -554,9 +554,9 @@ static int svm_enable_virtualization_cpu(void)
 		u64 len, status = 0;
 		int err;
 
-		err = native_read_msr_safe(MSR_AMD64_OSVW_ID_LENGTH, &len);
+		err = rdmsrq_safe(MSR_AMD64_OSVW_ID_LENGTH, &len);
 		if (!err)
-			err = native_read_msr_safe(MSR_AMD64_OSVW_STATUS, &status);
+			err = rdmsrq_safe(MSR_AMD64_OSVW_STATUS, &status);
 
 		if (err)
 			osvw_status = osvw_len = 0;
@@ -2029,7 +2029,7 @@ static bool is_erratum_383(void)
 	if (!erratum_383_found)
 		return false;
 
-	if (native_read_msr_safe(MSR_IA32_MC0_STATUS, &value))
+	if (rdmsrq_safe(MSR_IA32_MC0_STATUS, &value))
 		return false;
 
 	/* Bit 62 may or may not be set for this mce */
@@ -2040,11 +2040,11 @@ static bool is_erratum_383(void)
 
 	/* Clear MCi_STATUS registers */
 	for (i = 0; i < 6; ++i)
-		native_write_msr_safe(MSR_IA32_MCx_STATUS(i), 0);
+		wrmsrq_safe(MSR_IA32_MCx_STATUS(i), 0);
 
-	if (!native_read_msr_safe(MSR_IA32_MCG_STATUS, &value)) {
+	if (!rdmsrq_safe(MSR_IA32_MCG_STATUS, &value)) {
 		value &= ~(1ULL << 2);
-		native_write_msr_safe(MSR_IA32_MCG_STATUS, value);
+		wrmsrq_safe(MSR_IA32_MCG_STATUS, value);
 	}
 
 	/* Flush tlb to evict multi-match entries */
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 8f89ce0b67e3..d49a3bdc448b 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -323,7 +323,7 @@ static u64 xen_amd_read_pmc(int counter)
 		u64 val;
 
 		msr = amd_counters_base + (counter * amd_msr_step);
-		native_read_msr_safe(msr, &val);
+		rdmsrq_safe(msr, &val);
 		return val;
 	}
 
@@ -349,7 +349,7 @@ static u64 xen_intel_read_pmc(int counter)
 		else
 			msr = MSR_IA32_PERFCTR0 + counter;
 
-		native_read_msr_safe(msr, &val);
+		rdmsrq_safe(msr, &val);
 		return val;
 	}
 
-- 
2.53.0


