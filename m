Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAOfCfsBq2msZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:34:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22F4224FF1
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:34:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247981.1546399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7e-0005JR-Px; Fri, 06 Mar 2026 16:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247981.1546399; Fri, 06 Mar 2026 16:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7e-0005Cy-C0; Fri, 06 Mar 2026 16:33:54 +0000
Received: by outflank-mailman (input) for mailman id 1247981;
 Fri, 06 Mar 2026 16:33:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vyY7c-00030j-5k
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:33:52 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 420cbc5c-197a-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 17:33:51 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48371119eacso112097795e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 08:33:51 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm4406550f8f.39.2026.03.06.08.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:50 -0800 (PST)
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
X-Inumbo-ID: 420cbc5c-197a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814830; x=1773419630; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYl+zWkW5xPd0n05ltjvtGI8d6PS/n+RbbF8iPoiaOQ=;
        b=mdj3j8LxlURwz5uvn8CZQ4am/ZnPlQHwmX/qxgvT0MDZfFRdOO9guZmt4qc2GfGmn3
         4jjqh/8z4r5stplhNPwy5pUH0dn4LWd5Qe6Pwyjv8Im6m80wgSo85nCwVmIK7WPcRbGu
         IV4ILTUuDb3V/zTjKmveB0biwSD287taBdl2RAR7bhlIOfSowVsGIe5uRWNW5uOlikOI
         isUYGJ7Gv5zg3/njC3hmRUPcpH4wUkczQ2XC9KvP3wCyudWxOvTKVQ6mz1v2FIbkx9P0
         TR7JPF1yAFAqVR9Qr+Za+M0K6lSESD9swCVv8JhtB9gAJZNjEXkKhDNlUcKX2rU5kD+A
         wGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814830; x=1773419630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AYl+zWkW5xPd0n05ltjvtGI8d6PS/n+RbbF8iPoiaOQ=;
        b=TMTdarz0wV044aTaUOgYyMhXO5wYtGey+J2ck+q6g06xKfRfla9n7qRz0GXfhTEj2u
         jAjF90P2LWioEXNeb7FfD5O1ge9ho0qNnu8WslLwMm/jLhUfxiEV1ja5nUunE3QHr9fb
         N6ZIcq1qK4cKVh+1XOEfHpnVgoiVhpiFURg4dPv1qT1Df8o1Y7won2pi9JjdRxflmCJ0
         4RW3UP5jnLmFx+gUK0jGb0yPcT/cBmDeXbZfw+1EDIQd7Vnlm+ngW8Ycn0ftBIwTimTg
         XMQ5WqBXMlMyNdTc3r6hjSbfUWVpKZluT8f2D3+18J2gJKL3M6gtNFUicpLBi+MCWBr7
         jV7w==
X-Gm-Message-State: AOJu0Yy0E+fXhJwH8t35w8WHJOYH9hVGjNGVpeUdQtT/8XVAG/S8nJ03
	h2ZqoScUgqy/MaTuwsaUqdBxJFxpUmzT25n9CyHSENUdOy+F6xpQb7JyPfrTKw==
X-Gm-Gg: ATEYQzzX3RD6CQIKcx+J9ULCEslMYgQDHYNZulAmj1Xb4PD8SpdXThTPIhn/Qv3Cter
	lHLoPdnRWJTZgSAKv9WB6B99RKMB6mgu5TI4XaT119AeocwJYSKVKR58lPTBYCuWm+4seCJ0rsE
	177FH6Gz+G845x7OYHKZx1mUiWalY9PIc9+OVwQ3WvJzrn2lMO3LAlihyKUXiIEKPxg6YfBtnYo
	sfhdeOcQ1gs19CLcfmyIPt3F92H4PZgc+rpkTEti4eAo+OH3lH2uKBFZbbqhvwP/n5xb8le26LY
	r5BFfxG7ik8bE+wmGYggyzEAN1dWynDJ+P6HpoLNIsSjVWBEGMtQYfTNcW6DFN0OckhK0ng9v3V
	0Is1gMx7SuDkoFQj333UK0MHOkfOuRe20KPxoeHhxDO5BBmzxYpFumiojEK68PcrDMOIwDdWCUP
	GyzDu3Aj9N4pYMJk0qoV/XfdBIJLXRl+1KeVl4Si0LdTW91VA+Q6FT8iyWjmqTfkTInA==
X-Received: by 2002:a05:600c:1e2a:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-4852695819cmr44199145e9.20.1772814830199;
        Fri, 06 Mar 2026 08:33:50 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 10/14] xen/riscv: implement reprogram_timer() via SBI
Date: Fri,  6 Mar 2026 17:33:27 +0100
Message-ID: <89884307fb74c534c0ed07afc1443aee4cab9a7b.1772814110.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772814110.git.oleksii.kurochko@gmail.com>
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C22F4224FF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Implement reprogram_timer() on RISC-V using the standard SBI timer call.

The privileged architecture only defines machine-mode timer interrupts
(using mtime/mtimecmp). Therefore, timer services for S/HS/VS mode must
be provided by M-mode via SBI calls. SSTC (Supervisor-mode Timer Control)
is optional and is not supported on the boards available to me, so the
only viable approach today is to program the timer through SBI.

reprogram_timer() enables/disables the supervisor timer interrupt and
programs the next timer deadline using sbi_set_timer(). If the SBI call
fails, the code panics, because sbi_set_timer() is expected to return
either 0 or -ENOSUPP (this has been stable from early OpenSBI versions to
the latest ones). The SBI spec does not define a standard negative error
code for this call, and without SSTC there is no alternative method to
program the timer, so the SBI timer call must be available.

reprogram_timer() currently returns int for compatibility with the
existing prototype. While it might be cleaner to return bool, keeping the
existing signature avoids premature changes in case sbi_set_timer() ever
needs to return other values (based on which we could try to avoid
panic-ing) in the future.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5 - v7:
 - Nothing changed. Only rebase.
---
Changes in v4:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v3:
 - Correct the comments in reprogram_timer().
 - Move enablement of timer interrupt after sbi_set_timer() to avoid
   potentially receiving a timer interrupt between these 2 operations.
---
Changes in v2:
 - Add TODO comment above sbi_set_timer() call.
 - Update the commit message.
---
 xen/arch/riscv/stubs.c |  5 -----
 xen/arch/riscv/time.c  | 43 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index eedf8bf9350a..2f3a0ce76af9 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -21,11 +21,6 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
 /* time.c */
 
-int reprogram_timer(s_time_t timeout)
-{
-    BUG_ON("unimplemented");
-}
-
 void send_timer_event(struct vcpu *v)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
index 2c7af0a5d63b..7efa76fdbcb1 100644
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -7,6 +7,9 @@
 #include <xen/time.h>
 #include <xen/types.h>
 
+#include <asm/csr.h>
+#include <asm/sbi.h>
+
 unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
 uint64_t __ro_after_init boot_clock_cycles;
 
@@ -40,6 +43,46 @@ static void __init preinit_dt_xen_time(void)
     cpu_khz = rate / 1000;
 }
 
+int reprogram_timer(s_time_t timeout)
+{
+    uint64_t deadline, now;
+    int rc;
+
+    if ( timeout == 0 )
+    {
+        /* Disable timer interrupt */
+        csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
+
+        return 1;
+    }
+
+    deadline = ns_to_ticks(timeout) + boot_clock_cycles;
+    now = get_cycles();
+    if ( deadline <= now )
+        return 0;
+
+    /*
+     * TODO: When the SSTC extension is supported, it would be preferable to
+     *       use the supervisor timer registers directly here for better
+     *       performance, since an SBI call and mode switch would no longer
+     *       be required.
+     *
+     *       This would also reduce reliance on a specific SBI implementation.
+     *       For example, it is not ideal to panic() if sbi_set_timer() returns
+     *       a non-zero value. Currently it can return 0 or -ENOSUPP, and
+     *       without SSTC we still need an implementation because only the
+     *       M-mode timer is available, and it can only be programmed in
+     *       M-mode.
+     */
+    if ( (rc = sbi_set_timer(deadline)) )
+        panic("%s: timer wasn't set because: %d\n", __func__, rc);
+
+    /* Enable timer interrupt */
+    csr_set(CSR_SIE, BIT(IRQ_S_TIMER, UL));
+
+    return 1;
+}
+
 void __init preinit_xen_time(void)
 {
     if ( acpi_disabled )
-- 
2.53.0


