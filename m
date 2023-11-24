Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EA77F6D2C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 08:49:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640192.998096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Qvs-0001R7-H5; Fri, 24 Nov 2023 07:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640192.998096; Fri, 24 Nov 2023 07:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Qvs-0001Np-DY; Fri, 24 Nov 2023 07:49:00 +0000
Received: by outflank-mailman (input) for mailman id 640192;
 Fri, 24 Nov 2023 07:48:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUjn=HF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r6Qvq-0001Nf-Rx
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 07:48:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebb62b90-8a9d-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 08:48:56 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C91F421BBD;
 Fri, 24 Nov 2023 07:48:55 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 84287139E8;
 Fri, 24 Nov 2023 07:48:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id ulviHmdVYGWPOgAAn2gu4w
 (envelope-from <jgross@suse.com>); Fri, 24 Nov 2023 07:48:55 +0000
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
X-Inumbo-ID: ebb62b90-8a9d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700812135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sU+C0vHoKvhJD4Uv4mnBRoNOjRD+hZerlysfHrSpe9E=;
	b=hs+esi5z6A1UQFAQsb44lAYtBT60iEkaYuqK6zOtFyidKvF0snqJbnVAxj+nSCOAtVllD6
	EicbiDWUM7hdk11Ioxdq/ZcbXZ8QWMhvjVVrTeuGBHr5CVB3Ym4NWE5oPfcMrOMCR3niL4
	1OIAzZvzyUSLvcaLJEtdjsNhwxcGR7E=
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
Subject: [PATCH] x86/xen: fix percpu vcpu_info allocation
Date: Fri, 24 Nov 2023 08:48:52 +0100
Message-Id: <20231124074852.25161-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spam-Score: 4.70
X-Spamd-Result: default: False [4.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[40.20%]

Today the percpu struct vcpu_info is allocated via DEFINE_PER_CPU(),
meaning that it could cross a page boundary. In this case registering
it with the hypervisor will fail, resulting in a panic().

This can easily be fixed by using DEFINE_PER_CPU_ALIGNED() instead,
as struct vcpu_info is guaranteed to have a size of 64 bytes, matching
the cache line size of x86 64-bit processors (Xen doesn't support
32-bit processors).

Fixes: 5ead97c84fa7 ("xen: Core Xen implementation")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten.c | 6 +++++-
 arch/x86/xen/xen-ops.h   | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 0337392a3121..3c61bb98c10e 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -33,9 +33,12 @@ EXPORT_SYMBOL_GPL(hypercall_page);
  * and xen_vcpu_setup for details. By default it points to share_info->vcpu_info
  * but during boot it is switched to point to xen_vcpu_info.
  * The pointer is used in xen_evtchn_do_upcall to acknowledge pending events.
+ * Make sure that xen_vcpu_info doesn't cross a page boundary by making it
+ * cache-line aligned (the struct is guaranteed to have a size of 64 bytes,
+ * which matches the cache line size of 64-bit x86 processors).
  */
 DEFINE_PER_CPU(struct vcpu_info *, xen_vcpu);
-DEFINE_PER_CPU(struct vcpu_info, xen_vcpu_info);
+DEFINE_PER_CPU_ALIGNED(struct vcpu_info, xen_vcpu_info);
 
 /* Linux <-> Xen vCPU id mapping */
 DEFINE_PER_CPU(uint32_t, xen_vcpu_id);
@@ -160,6 +163,7 @@ void xen_vcpu_setup(int cpu)
 	int err;
 	struct vcpu_info *vcpup;
 
+	BUILD_BUG_ON(sizeof(*vcpup) > SMP_CACHE_BYTES);
 	BUG_ON(HYPERVISOR_shared_info == &xen_dummy_shared_info);
 
 	/*
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 408a2aa66c69..a87ab36889e7 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -21,7 +21,7 @@ extern void *xen_initial_gdt;
 struct trap_info;
 void xen_copy_trap_info(struct trap_info *traps);
 
-DECLARE_PER_CPU(struct vcpu_info, xen_vcpu_info);
+DECLARE_PER_CPU_ALIGNED(struct vcpu_info, xen_vcpu_info);
 DECLARE_PER_CPU(unsigned long, xen_cr3);
 DECLARE_PER_CPU(unsigned long, xen_current_cr3);
 
-- 
2.35.3


