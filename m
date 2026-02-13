Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ+hBHNRj2kJQQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B81B4138044
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231326.1536614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2s-0000VD-UB; Fri, 13 Feb 2026 16:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231326.1536614; Fri, 13 Feb 2026 16:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2s-0000Op-D1; Fri, 13 Feb 2026 16:29:30 +0000
Received: by outflank-mailman (input) for mailman id 1231326;
 Fri, 13 Feb 2026 16:29:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw2p-0005Wn-7Z
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:29:27 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 291e1003-08f9-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 17:29:25 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso8778525e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:25 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm303288185e9.6.2026.02.13.08.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:24 -0800 (PST)
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
X-Inumbo-ID: 291e1003-08f9-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000165; x=1771604965; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5shaKaLaj3PbsgiRISlWhSdddD1d/VOeFOR/4Kyrmqo=;
        b=WVwJyaSl4liyWVAePxTkCH+8vgRE8k0PDKiXxQtQwuWMFjX3lwgrEkLiVrsRE2Zdlm
         hWHKTHzfOg9dE5/NvetjIjtlT4Ca76RdIq/vAdvxgCFuYlfxiAZ4CytK+zDMGNBl1Z4x
         Uhhr5TuTBYSV5kA0H5Ek1DBGe7GGvZFIISf9ioPDG4slDSujJl2OubkeOdFMW7iCTKuf
         2zdMK/clNe8Dc9YnvP4wNaJg/U6gxujxkUifg40z9KSrzcsrt0VE4jTOHaWNdqSsob8g
         Y7/z9pAhUyM717uOOjBeL32j4XP04MkJ7PwoSDK2/RHnfTixy9O+Txngfajr14LMriv+
         UprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000165; x=1771604965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5shaKaLaj3PbsgiRISlWhSdddD1d/VOeFOR/4Kyrmqo=;
        b=fHtH4cY6ZiybNktv50po9S/3MGhd3ms6jqFK6xgSoBZJ5c2FMvPprn1SZiXpaNjGMr
         +R8P2y1fojGchuyJDJWqASxQJbG2Zkni5/baQdOeaRUCBPyE3LXalLxlqMh+aM1La/8o
         SPHIu6qfnJ52iSQjZw0qDhL9Q3gx4FPdFxHBJyfqTFjayhwuq/ut5E6suLoJauQZb0Hx
         SsEXOhrDhgRlUYyUIvo4GqLX7EAUUT02Fug9xxrkUwRlC8lz45JaJG16R3FRYB1b7NsB
         MFm51ZQEoqxGhPUrm1f/M4+ZKJIH69bsbzXLQovT6kWc5cVrhAiox36zwuIZ+JSD6i/k
         ZRCQ==
X-Gm-Message-State: AOJu0Yyd97Kvid5siagVfMkJje9dvIMUo1j2VCg5BwWpcIHrju2nLcF4
	R41Dt9vIArmoAUdQEYllLFc63xT0PtNbZZ7ed4jodhFSPK7Ge7hQ5Ib0YhcLPY5W
X-Gm-Gg: AZuq6aIH+EsK8c88nup36dsYr5/C2xok9eb7JvMxHNP9xEng10gqjMBadJv8fn7jBOr
	8ROmk4pDT4s7A6KHf33VA/pc+puoAZJXqIvncCrYHl21FCoKBAvn6VtFykMr7nsJZB4Vg1hgdkB
	YjgNmTvpHULiBqgZMNXpUY5c5C03sMIpHJubAKw+A6LgiyTZyvBeWM1p99TjMo1Phr00wWn+Zu+
	cVSLVw2p8QTMy+D6CkziGkpe3R7ZC/8mOvuMYa+BRMeU6idipwzlW8qcDNIyEQo0PgXYUEXnbmH
	IRGBM9C+fetwxgMalgtqaFnpJNQmedRJlVPTGzib50i197jAHVz+No/N06NYAmvQ+X3Cof1yeLH
	QJv+s7Behoiwjddh7D0L35SVmzJwcWFCgbTHJvD7HGszrpMX/G3gmUAJIeCiuxKmWm88qdUWZFd
	k3gZw38DeyqDrb9xOWYctKtBj7eyn1HOYNkShaVHlVxQF4RIwt4rzPRKOWedzIdXlnT1PYvA==
X-Received: by 2002:a05:600c:64c6:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-48373a2626dmr39747575e9.15.1771000164568;
        Fri, 13 Feb 2026 08:29:24 -0800 (PST)
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
Subject: [PATCH v4 13/16] xen/riscv: implement reprogram_timer() via SBI
Date: Fri, 13 Feb 2026 17:28:59 +0100
Message-ID: <c768ea71f797a92c68690207d5ba0034077b3d42.1770999383.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770999383.git.oleksii.kurochko@gmail.com>
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
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
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B81B4138044
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
index 1f0add97b361..cb7546558b8e 100644
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
2.52.0


