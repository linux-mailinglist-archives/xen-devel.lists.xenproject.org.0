Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8256A669984
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 15:06:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477369.740061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKhF-0001Ym-4r; Fri, 13 Jan 2023 14:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477369.740061; Fri, 13 Jan 2023 14:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKhF-0001Vy-2C; Fri, 13 Jan 2023 14:06:17 +0000
Received: by outflank-mailman (input) for mailman id 477369;
 Fri, 13 Jan 2023 14:06:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O/z9=5K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pGKhE-0001Vp-4C
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 14:06:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f8e0808-934b-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 15:06:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B856E256B8;
 Fri, 13 Jan 2023 14:06:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F2591358A;
 Fri, 13 Jan 2023 14:06:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bXH8EVNlwWPnDQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 Jan 2023 14:06:11 +0000
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
X-Inumbo-ID: 6f8e0808-934b-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673618771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qerTG7yVEdATebY6zaKCk2qNuAQ7K4by6XyL0WSCPFo=;
	b=mlMz7tpaDKH5ON0g3Sl4mmBovvApom2MngsecURVvLNhBb2UjbPkYxhetfIhGhxNoH0ZBB
	Z8F0qUptHNhmYOLMOX7rYBaAOAWfUUHinRaV/sD4EEA2d5dDZF+YutajoQc1DwcLPCLOU8
	TEZAJnoIvy9o4hrjiLIPqIQCjVeXCZk=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-pm@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] x86/acpi: fix suspend with Xen
Date: Fri, 13 Jan 2023 15:06:10 +0100
Message-Id: <20230113140610.7132-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit f1e525009493 ("x86/boot: Skip realmode init code when running as
Xen PV guest") missed one code path accessing real_mode_header, leading
to dereferencing NULL when suspending the system under Xen:

    [  348.284004] PM: suspend entry (deep)
    [  348.289532] Filesystems sync: 0.005 seconds
    [  348.291545] Freezing user space processes ... (elapsed 0.000 seconds) done.
    [  348.292457] OOM killer disabled.
    [  348.292462] Freezing remaining freezable tasks ... (elapsed 0.104 seconds) done.
    [  348.396612] printk: Suspending console(s) (use no_console_suspend to debug)
    [  348.749228] PM: suspend devices took 0.352 seconds
    [  348.769713] ACPI: EC: interrupt blocked
    [  348.816077] BUG: kernel NULL pointer dereference, address: 000000000000001c
    [  348.816080] #PF: supervisor read access in kernel mode
    [  348.816081] #PF: error_code(0x0000) - not-present page
    [  348.816083] PGD 0 P4D 0
    [  348.816086] Oops: 0000 [#1] PREEMPT SMP NOPTI
    [  348.816089] CPU: 0 PID: 6764 Comm: systemd-sleep Not tainted 6.1.3-1.fc32.qubes.x86_64 #1
    [  348.816092] Hardware name: Star Labs StarBook/StarBook, BIOS 8.01 07/03/2022
    [  348.816093] RIP: e030:acpi_get_wakeup_address+0xc/0x20

Fix that by adding an indirection for acpi_get_wakeup_address() which
Xen PV dom0 can use to return a dummy non-zero wakeup address (this
address won't ever be used, as the real suspend handling is done by the
hypervisor).

Fixes: f1e525009493 ("x86/boot: Skip realmode init code when running as Xen PV guest")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/acpi.h  | 2 +-
 arch/x86/kernel/acpi/sleep.c | 3 ++-
 include/xen/acpi.h           | 9 +++++++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
index 65064d9f7fa6..137259ff8f03 100644
--- a/arch/x86/include/asm/acpi.h
+++ b/arch/x86/include/asm/acpi.h
@@ -61,7 +61,7 @@ static inline void acpi_disable_pci(void)
 extern int (*acpi_suspend_lowlevel)(void);
 
 /* Physical address to resume after wakeup */
-unsigned long acpi_get_wakeup_address(void);
+extern unsigned long (*acpi_get_wakeup_address)(void);
 
 /*
  * Check if the CPU can handle C2 and deeper
diff --git a/arch/x86/kernel/acpi/sleep.c b/arch/x86/kernel/acpi/sleep.c
index 3b7f4cdbf2e0..1a3cd5e24cd0 100644
--- a/arch/x86/kernel/acpi/sleep.c
+++ b/arch/x86/kernel/acpi/sleep.c
@@ -33,10 +33,11 @@ static char temp_stack[4096];
  * Returns the physical address where the kernel should be resumed after the
  * system awakes from S3, e.g. for programming into the firmware waking vector.
  */
-unsigned long acpi_get_wakeup_address(void)
+static unsigned long x86_acpi_get_wakeup_address(void)
 {
 	return ((unsigned long)(real_mode_header->wakeup_start));
 }
+unsigned long (*acpi_get_wakeup_address)(void) = x86_acpi_get_wakeup_address;
 
 /**
  * x86_acpi_enter_sleep_state - enter sleep state
diff --git a/include/xen/acpi.h b/include/xen/acpi.h
index b1e11863144d..7e1e5dbfb77c 100644
--- a/include/xen/acpi.h
+++ b/include/xen/acpi.h
@@ -56,6 +56,12 @@ static inline int xen_acpi_suspend_lowlevel(void)
 	return 0;
 }
 
+static inline unsigned long xen_acpi_get_wakeup_address(void)
+{
+	/* Just return a dummy non-zero value, it will never be used. */
+	return 1;
+}
+
 static inline void xen_acpi_sleep_register(void)
 {
 	if (xen_initial_domain()) {
@@ -65,6 +71,9 @@ static inline void xen_acpi_sleep_register(void)
 			&xen_acpi_notify_hypervisor_extended_sleep);
 
 		acpi_suspend_lowlevel = xen_acpi_suspend_lowlevel;
+#ifdef CONFIG_ACPI_SLEEP
+		acpi_get_wakeup_address = xen_acpi_get_wakeup_address;
+#endif
 	}
 }
 #else
-- 
2.35.3


