Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKR6MeQzoGntggQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF181A55D6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241466.1542582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZuA-0000QR-S4; Thu, 26 Feb 2026 11:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241466.1542582; Thu, 26 Feb 2026 11:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZuA-0000MU-J5; Thu, 26 Feb 2026 11:51:42 +0000
Received: by outflank-mailman (input) for mailman id 1241466;
 Thu, 26 Feb 2026 11:51:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Tft=A6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vvZu8-0006E8-UU
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 11:51:40 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82f5fc2e-1309-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 12:51:39 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so8712995e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 03:51:40 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm220079295e9.0.2026.02.26.03.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 03:51:38 -0800 (PST)
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
X-Inumbo-ID: 82f5fc2e-1309-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772106699; x=1772711499; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lX9hIaB9WTE6h7+Wjpyh48oNfuDqQhQlogYAFoYLY7c=;
        b=lQnyGQpef4bwDXDEq0XlJct/7CAurJ2PUFl+4JIpaOAwYsrR39ruZRSP4Cx/oqS6oZ
         sPtYO+q5aKXvBwXi9giwCJBKl28WcxOFMd/73JBDJ5zjBKjrTMlkgQHFO9CQbah4NQfA
         OBPR13MmC2R4eMBO6tqr9ZU2k7OOsp7oc23m4MnqBJN3p14O1QGwMjBHxDcwtT8KI2Ly
         Gt882zXpKibg3i2ECRX9cupq4IEtqTfksBPTJJFGAkIX2nd4kA1LNe/9gsfXnLd4z+KP
         avEpt8zlCvZ84ZBWDJzRtK8Ja20kIiCJHWmsrzuBO/fmRhgf0UY6auSkDxzSrEvSLVoR
         YvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106699; x=1772711499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lX9hIaB9WTE6h7+Wjpyh48oNfuDqQhQlogYAFoYLY7c=;
        b=rz0VKU17bmmvZu8OBVfP29p7tJENBmpDRjOJyMBD6Z3JlNFZp/rwaAC/knZwgU7b8d
         TQWK0OPvKAjstgRd627eNz0ZRQh7MWtMSkPSyOhbYxBZRpb257AHyrWtC1DgjYS33/mL
         EHzi6gu0tCTt5N4JkCs0VCuJSqxGrVlA1L9Pg1slmhkHXF0di6hi06piDZ7Vd90gEp1N
         U/sS/4OBwRlbdi5EY27vdz1lCeaAMGTATOCI+U4G44siNFT7n69G+ZLJ+tMZd65vm7d/
         2B+D1Rv5LpgQmE5jTBfjk8Lb7ZFCF239CFbZ5HYvfrjrrSsEhGahlEXSLIwtZfLKHpJ+
         ca0w==
X-Gm-Message-State: AOJu0Yz4Hei1+ikQQeAarLbM0EkHvkIS8FvMNiaKDLbxUUmcCnJRbAg1
	QPeZuY1bB5Nq3ULbRDzxaeSCltOspkL4usw7oa21Jw3Gme/LClVFA3zWEhDOTQ==
X-Gm-Gg: ATEYQzw5o556W9VI+sIl4aiSdMUSsRcSL0U84aDF5lGSzi/vyPtpn8V7JKMJk2Umw2w
	09FqC6s7fETIaztD2AeEe11b7zYuCMyfxxbAitNJvXIa1+adZIUdtJU9izkIBb+cQU0IhqoD46i
	1CvFSFu57mR0dIkhmCF2MXYcyeqiDg5vVZ9N+f5BcNs6rZXil3CvxwYLOqPtP2Cs43NvvjuhvTY
	RRnfzF97FPo4CyxeDk4dV1viB9fZXTFUk09WZLbN5C64v8DG6e4zxF6fErduU3vXvqgELCg8DBG
	J0kfQWNcI+bj/3htA+S3+reh0JqVvnuWIG3/PwPTRzroaQlfKALBl6n7TNadNIQWItPLvRp7AWl
	mwjxvBZHTGNE/uXeu/iDKBkpydaWQFSbRxy2mc+YnwPaQAXXRfyshZs7Ypisp7d6c75WrrRMY/E
	PUiuz2SIgh6ERqlm83s1YcdNEtRmxwGntVt4JQD3bGrJeduK0zQOAqDPlzl3akHA0G5Q==
X-Received: by 2002:a05:600c:a009:b0:483:b505:9db4 with SMTP id 5b1f17b1804b1-483c3df45e6mr36295685e9.31.1772106698894;
        Thu, 26 Feb 2026 03:51:38 -0800 (PST)
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
Subject: [PATCH v6 11/14] xen/riscv: implement reprogram_timer() via SBI
Date: Thu, 26 Feb 2026 12:51:11 +0100
Message-ID: <bc30f09d04ae40d84b1b790cc6ca7fba7a6008a8.1772016457.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772016457.git.oleksii.kurochko@gmail.com>
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.975];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7DF181A55D6
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
Changes in v5 - v6:
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


