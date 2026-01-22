Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH5DLcZUcmkIiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2846A443
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211359.1522989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqh-0001sz-6A; Thu, 22 Jan 2026 16:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211359.1522989; Thu, 22 Jan 2026 16:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqg-0001l5-Nj; Thu, 22 Jan 2026 16:47:58 +0000
Received: by outflank-mailman (input) for mailman id 1211359;
 Thu, 22 Jan 2026 16:47:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqe-0007Id-MB
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:47:56 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19f3d528-f7b2-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 17:47:56 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b884ad1026cso100380366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:56 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:54 -0800 (PST)
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
X-Inumbo-ID: 19f3d528-f7b2-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100475; x=1769705275; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mbSVBQ+1aSN6DFc+pj8xuW2JrsfZRnVra8JiKBPkJ4=;
        b=ezhrY/ovYEQzxYAmZDG4qvkObWVczVuGVDemzRpF0LFHcxXuCNJZiu8DD7wunJ1sLL
         gpGup3A0FzEZsJQjBJnOviFCpbYp+tOeRmq1C5i5gFsK3VAmYKFHbMtTYxeM/oUCjZN6
         NA/I43pcupB/+dikZrXJNI8Jfe9aBbO/PjBLA+6NbcRGXya/HCqK4xYu1hdQyWw7bDzT
         pwCqNlRdmQvLenozUdZzimWjTgsqBCY/kk0FyaX+7b0F2RHC7tEW4KG4v30OhKetgYQW
         JpSc+yS3ahlQgEY3fRYOPohWXuK6iO//r3eKcwfnqMOcZYK1Z+bOkjP9eZR3AIANQ4oW
         M2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100475; x=1769705275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7mbSVBQ+1aSN6DFc+pj8xuW2JrsfZRnVra8JiKBPkJ4=;
        b=GFQbunULDnRiZibAqSyAdpxNy/5FH4QJlPBhb6y0UfF7t+cAl2UvcYoZ0x8ehoZYB4
         QZSwFMOchhlCzANzAIYAjm3UWqOH7kG83yidcib6lDD5zdv3l83yihy65jXGZOGkNhux
         LntmqehzuEzpnawPFYnzaTm6q01l1AoJV16UmiVYjNoz5aSuIJs4Q9kcHyUYj8G20OkS
         6lGXtCZXXMS8j2HLv9yUF4xhv2mnyvkgXqL5uGQG8PosEuvIlrQ7yeHuaw15xiFKqkiU
         6Q1ovr0sUEzXPsSpMTttAxKCgcAqefb3XKH8/7E0o5OGIeWtvAoBHKF5P1ACmdfWhP1t
         ynBQ==
X-Gm-Message-State: AOJu0YyN9kkke2EnF/d+4z+k5oitrrvfTJ8Ekpk9R7WmILgLEAHngZXD
	vakzueRZ9n3Novb9icntRB/5BYYJJdGxLkVjdSirmukvw62a2uXdE5zarqkNaA==
X-Gm-Gg: AZuq6aIvp4VXgmtU1woZ9uqsg1euElExR0wo0E/Nw+YKybnpWRzgfvv3xVJ5aeQImW0
	yA6KuRJbIN+sqb3M4lXItDWyeRgDbqbu66qKOmCU9jQ8XInmEzoQ/VUR5iN6euMl7bVPxAELoD3
	wte2waGOkMonGkDOVc8aFczkdqwDVne5gV7doBEDzslWFalcis5Ip1PDb7oOBqDqy4rRQMtMJrf
	jvMLd2w11M6UKlq1L0hEDmJNxHmO6TJT5K4DSVIL9q+10m+PBeIZiiIjdcDmeVXBHgPnHNWpaP2
	/a5ajNL/vMJUiT/1RLa8512kdIaBin8bruGVybHovu5marHQ6eL/Qq8xgRZR7BKfIQn7le9Rl34
	sxZbqS+vAj3o2t+gQpo+VTPPGOarJb8WS17CrziUrlajShNMEUzlzCwqRYYuNkLDKDmtnNAZdu7
	1JcN4OhznPviXs9SWkXMGDJbbNPqCyavg2tdo9M8ZUO25raD3gnUNHEw==
X-Received: by 2002:a17:907:9805:b0:b83:6e2b:890d with SMTP id a640c23a62f3a-b8800434127mr752883766b.25.1769100475180;
        Thu, 22 Jan 2026 08:47:55 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v2 13/16] xen/riscv: implement reprogram_timer() via SBI
Date: Thu, 22 Jan 2026 17:47:28 +0100
Message-ID: <732635f43fb80daec332f78d4442b56bf5dfda98.1769099885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769099883.git.oleksii.kurochko@gmail.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6F2846A443
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
index 2c7af0a5d63b..f021ceab8ec4 100644
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
+        /* Disable timers */
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
+    /* Enable timer */
+    csr_set(CSR_SIE, BIT(IRQ_S_TIMER, UL));
+
+    /*
+     * TODO: When the SSTC extension is supported, it would be preferable to
+     *       use the supervisor timer registers directly here for better
+     *       performance, since an SBI call and context switch would no longer
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
+    return 1;
+}
+
 void __init preinit_xen_time(void)
 {
     if ( acpi_disabled )
-- 
2.52.0


