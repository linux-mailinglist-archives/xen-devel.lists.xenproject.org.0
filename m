Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2409E10AC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 02:09:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847163.1262305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIHPa-0000jO-9W; Tue, 03 Dec 2024 01:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847163.1262305; Tue, 03 Dec 2024 01:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIHPa-0000cb-1I; Tue, 03 Dec 2024 01:09:10 +0000
Received: by outflank-mailman (input) for mailman id 847163;
 Tue, 03 Dec 2024 01:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MryK=S4=flex--kevinloughlin.bounces.google.com=3LVhOZw0KAFgA4L8DBEK67B8D6EE6B4.2EC@srs-se1.protection.inumbo.net>)
 id 1tIHHD-0004Oy-5G
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 01:00:31 +0000
Received: from mail-io1-xd4a.google.com (mail-io1-xd4a.google.com
 [2607:f8b0:4864:20::d4a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd7b6d15-b111-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 02:00:30 +0100 (CET)
Received: by mail-io1-xd4a.google.com with SMTP id
 ca18e2360f4ac-84181aad98aso517753739f.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 17:00:30 -0800 (PST)
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
X-Inumbo-ID: fd7b6d15-b111-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733187629; x=1733792429; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HXZpw0j64Kx8pQRMw/cVhgPa64V3XlxKoRy53BFPQ2Y=;
        b=dYfBRqIC0SuFrs+EPrdxIKKbBydHZMZGxayarUNAHSbr48upFSmbr3PQqROgEUNuaX
         N2xm+AhreBsc2/UC7cm2aro53oRYUbDcpN1XBw4FD29rjfo+ju711p0Lubj0E/L0+rh8
         zSj5z5+mcp4CCdfLCBPczGT0KQ4NUOUqxuzZ1/Xdrz3ecplPfYOLvLKdvXI6LXkzKpSO
         AkAGU9OMeMVQbTf1BbT+2aYvAXbwc+j+DD3nekk1lhrokOHEQ4hsTZOqX2zVrdfzvA58
         pUDmgFh5qwxsnafoXjG3tn95VZC1AKeL3JEw1fFpIVcLP+SLgX4GO65wnEnHmzB/1Q+e
         7WwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733187629; x=1733792429;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HXZpw0j64Kx8pQRMw/cVhgPa64V3XlxKoRy53BFPQ2Y=;
        b=i373KBaECP1DN1FvWVS+ZZRLxX5FbD5iLS9iUilSjnp87lkLQQ05fyOu+MpxUL60c4
         sTvduld4sPGXvtm0GeXJos959v1N3R3q4DwVwmRbAw8aAKCpsqsJZVS+JCuWjzPjmj7P
         ryBJMEt3Z2jzZr/sjvERWz6nVXlNXIEch6FkZ/RPKtDfU+etT6EupJFDpQra+BpV4X7W
         5yr0epJkjggdAamOy10Vmg46EvmSSAQ+DOESC1u8HDWxY0Awr3rzlhWrI0GdCb9zEYwI
         eFxO2ExD6+k9gAIJ/aODuNsbai2Y4z1MX6yQdip+wPreDTMtaoNnRo9dRbsa3ZRNCtEN
         M+dA==
X-Forwarded-Encrypted: i=1; AJvYcCXueygk8yJbYIv7dyqsGFUN6PPugVwy3HD3n4XyrQOc5c9vLX7HmGgtua5/XiJdjNauHq0tRTi/CIU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9YM8QG1hnUE80O2i+Kv/UkfJcQyldz92LIUweIgQnTVKl/cqV
	yuybRmGqDRu6yOegVVwrq75uVrSV/jm317N2km7B9N/M6tVLUnWy8hxOAVhUA/Wg6jFGNuSRgDA
	ds5bBGYChoIn+dIeQrX5ndz/I/eka9g==
X-Google-Smtp-Source: AGHT+IEZmspYrC4umegddmCrbePNuN6PHswfr1n3f4QWHFbbvkBj0Jxf86Z77+97glx5zKlFrBkgAIn3Vka01mS0VDUG
X-Received: from iotr20.prod.google.com ([2002:a05:6602:2354:b0:841:8ee4:fc23])
 (user=kevinloughlin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:6422:b0:83a:db84:41a8 with SMTP id ca18e2360f4ac-8445b5ccdddmr90500239f.10.1733187629246;
 Mon, 02 Dec 2024 17:00:29 -0800 (PST)
Date: Tue,  3 Dec 2024 00:59:21 +0000
In-Reply-To: <20241203005921.1119116-1-kevinloughlin@google.com>
Mime-Version: 1.0
References: <20241203005921.1119116-1-kevinloughlin@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203005921.1119116-3-kevinloughlin@google.com>
Subject: [RFC PATCH 2/2] KVM: SEV: Prefer WBNOINVD over WBINVD for cache
 maintenance efficiency
From: Kevin Loughlin <kevinloughlin@google.com>
To: linux-kernel@vger.kernel.org
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, kvm@vger.kernel.org, thomas.lendacky@amd.com, 
	pgonda@google.com, sidtelang@google.com, mizhang@google.com, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, 
	bcm-kernel-feedback-list@broadcom.com, 
	Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

AMD CPUs currently execute WBINVD in the host when unregistering SEV
guest memory or when deactivating SEV guests. Such cache maintenance is
performed to prevent data corruption, wherein the encrypted (C=1)
version of a dirty cache line might otherwise only be written back
after the memory is written in a different context (ex: C=0), yielding
corruption. However, WBINVD is performance-costly, especially because
it invalidates processor caches.

Strictly-speaking, unless the SEV ASID is being recycled (meaning all
existing cache lines with the recycled ASID must be flushed), the
cache invalidation triggered by WBINVD is unnecessary; only the
writeback is needed to prevent data corruption in remaining scenarios.

To improve performance in these scenarios, use WBNOINVD when available
instead of WBINVD. WBNOINVD still writes back all dirty lines
(preventing host data corruption by SEV guests) but does *not*
invalidate processor caches.

Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
---
 arch/x86/kvm/svm/sev.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 943bd074a5d3..dbe40f728c4b 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -116,6 +116,7 @@ static int sev_flush_asids(unsigned int min_asid, unsigned int max_asid)
 	 */
 	down_write(&sev_deactivate_lock);
 
+	/* SNP firmware expects WBINVD before SNP_DF_FLUSH, so do *not* use WBNOINVD */
 	wbinvd_on_all_cpus();
 
 	if (sev_snp_enabled)
@@ -710,6 +711,14 @@ static void sev_clflush_pages(struct page *pages[], unsigned long npages)
 	}
 }
 
+static void sev_wb_on_all_cpus(void)
+{
+	if (boot_cpu_has(X86_FEATURE_WBNOINVD))
+		wbnoinvd_on_all_cpus();
+	else
+		wbinvd_on_all_cpus();
+}
+
 static unsigned long get_num_contig_pages(unsigned long idx,
 				struct page **inpages, unsigned long npages)
 {
@@ -2774,11 +2783,11 @@ int sev_mem_enc_unregister_region(struct kvm *kvm,
 	}
 
 	/*
-	 * Ensure that all guest tagged cache entries are flushed before
-	 * releasing the pages back to the system for use. CLFLUSH will
-	 * not do this, so issue a WBINVD.
+	 * Ensure that all dirty guest tagged cache entries are written back
+	 * before releasing the pages back to the system for use. CLFLUSH will
+	 * not do this without SME_COHERENT, so issue a WB[NO]INVD.
 	 */
-	wbinvd_on_all_cpus();
+	sev_wb_on_all_cpus();
 
 	__unregister_enc_region_locked(kvm, region);
 
@@ -2900,11 +2909,11 @@ void sev_vm_destroy(struct kvm *kvm)
 	}
 
 	/*
-	 * Ensure that all guest tagged cache entries are flushed before
-	 * releasing the pages back to the system for use. CLFLUSH will
-	 * not do this, so issue a WBINVD.
+	 * Ensure that all dirty guest tagged cache entries are written back
+	 * before releasing the pages back to the system for use. CLFLUSH will
+	 * not do this without SME_COHERENT, so issue a WB[NO]INVD.
 	 */
-	wbinvd_on_all_cpus();
+	sev_wb_on_all_cpus();
 
 	/*
 	 * if userspace was terminated before unregistering the memory regions
@@ -3130,12 +3139,12 @@ static void sev_flush_encrypted_page(struct kvm_vcpu *vcpu, void *va)
 	 * by leaving stale encrypted data in the cache.
 	 */
 	if (WARN_ON_ONCE(wrmsrl_safe(MSR_AMD64_VM_PAGE_FLUSH, addr | asid)))
-		goto do_wbinvd;
+		goto do_wb_on_all_cpus;
 
 	return;
 
-do_wbinvd:
-	wbinvd_on_all_cpus();
+do_wb_on_all_cpus:
+	sev_wb_on_all_cpus();
 }
 
 void sev_guest_memory_reclaimed(struct kvm *kvm)
@@ -3149,7 +3158,7 @@ void sev_guest_memory_reclaimed(struct kvm *kvm)
 	if (!sev_guest(kvm) || sev_snp_guest(kvm))
 		return;
 
-	wbinvd_on_all_cpus();
+	sev_wb_on_all_cpus();
 }
 
 void sev_free_vcpu(struct kvm_vcpu *vcpu)
@@ -3858,7 +3867,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
 		 * guest-mapped page rather than the initial one allocated
 		 * by KVM in svm->sev_es.vmsa. In theory, svm->sev_es.vmsa
 		 * could be free'd and cleaned up here, but that involves
-		 * cleanups like wbinvd_on_all_cpus() which would ideally
+		 * cleanups like sev_wb_on_all_cpus() which would ideally
 		 * be handled during teardown rather than guest boot.
 		 * Deferring that also allows the existing logic for SEV-ES
 		 * VMSAs to be re-used with minimal SNP-specific changes.
-- 
2.47.0.338.g60cca15819-goog


