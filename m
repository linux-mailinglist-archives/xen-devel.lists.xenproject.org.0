Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP17JltXcmkpiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:59:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE36A6A885
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211533.1523078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viy1K-0002UI-7c; Thu, 22 Jan 2026 16:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211533.1523078; Thu, 22 Jan 2026 16:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viy1K-0002RK-4p; Thu, 22 Jan 2026 16:58:58 +0000
Received: by outflank-mailman (input) for mailman id 1211533;
 Thu, 22 Jan 2026 16:58:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqi-0007Ij-4j
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:48:00 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 194c7e37-f7b2-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 17:47:55 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-655af782859so2338396a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:55 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:53 -0800 (PST)
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
X-Inumbo-ID: 194c7e37-f7b2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100474; x=1769705274; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wg7KIGfayug5C3vvvCUGP++rm9Fv8txuX7xpHEfh2s=;
        b=ZoiSw9nTLb0T4wBpp903Ds8wqM9o9Sm6Dh9J6DPgxS4HinulO1QXcmEMb4C9DuLpmM
         OagYuVHY3Bw79Y+iYCiqXVxHL+uJXw5KltzBwL0/6ajdr8O/4Om/E97LjTiXUCgGRJ8x
         Xrt9LOHfh0ZQTSp1SHWEJpDqtA5L46y38EGfxyn+HcU365obe1lUHxnh8yOj40Qoit/E
         PC7EeXrZYvBHVlwxvvHz6CFRsYxBPy3zgXtD/MjAz+jYAmfzaDjLB72Q+TVaJ2ekWyTH
         dWGrveeHMnqruGNGVXxvtoDmeHY8hgxNlijOpRaUOBN2oT9u1fGwpomrrKs/hZfP+my/
         qiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100474; x=1769705274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0wg7KIGfayug5C3vvvCUGP++rm9Fv8txuX7xpHEfh2s=;
        b=MdquETWtRmvFtj/w1Lh07SHWTDKrLSvmPc1zdjts6ltXPTcdRJ9f4Dda+9zXnxwFpz
         l0+F0dpuBCKyzIq858Ict9rZT5yBSjaHmMGVzFwi54S1fC3zvIMl0nujFLYYL8q17+SR
         t2EDGkXMHs663EPq7RGBft91HlOjvjNxk7HfcrDKFBqDKNW8fZcbGvbz/SDz1fn6OjcP
         j+2IomucNPUR+BdKsM0RgNqDuO6CI3sWC5yl5VFM4IXT5owzIar3nZj1bkACO+DBVKBF
         56SwDbbucCNRYYaV6RnqUVK8VTaTwXSiVA6bpbICrAov3nXPA4x915/C1XNqsWj1erFH
         RzOg==
X-Gm-Message-State: AOJu0YyCEibiH7J3YuE90+ESyuMd/1Pwh2XkqBk0fJYHDFdcr3AOcjdY
	kCYr0h89zmMS/2gdMOj4CdJ0zBskIDgsp+RD5tvuVYJEEONSTl40S0GJNSIB5w==
X-Gm-Gg: AZuq6aI7JuB/+qF93qa1HDoozSwJz+6PtQzW5xMpnb8OOjowY1a2MkPRsrX4BgVt1de
	Zjbt8stWPhktl/r+0ToCq6SotJVxvALsasyefzgxTOfQjqezUoUSJMNMo9hk2cz6OLJ9A2f8WPE
	BxeQta2NUe6AsAtsztzwSvlhahGEyZYaP8Zbqd2pcSzBXXL5vzJZb5xUcgS2fC9ZTWmvIwp9LW4
	XQ8mHGhd4cxat2X2x2eHyvzjAmIa/ebEV0ZAjX/bNWnr6/5U+0D97k5X2+dyWHsnSoetDgWCu+r
	PdyXu7MxtPCqN8ydt3/k9EJfeKV1OaEY2C8n/ytON9/EZpZTMKA202VzHj98wLTy/O9biQBE2RY
	iQHQDW1jLip2wh4NJ+F3d2nJeaLflm3uOjFSM5q9KsyFgPL8RvYT/cha2+iE6KlZYsQ5bbIrqo8
	rTQ3nBac3Jc5UvpBbLWPIAlYGuVSYHgGT2qnBDrS4YNdHRQqVIlFXjbA==
X-Received: by 2002:a17:907:c07:b0:b88:4b1f:5b1f with SMTP id a640c23a62f3a-b884b1f64c2mr111863966b.38.1769100473895;
        Thu, 22 Jan 2026 08:47:53 -0800 (PST)
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
Subject: [PATCH v2 12/16] xen/riscv: introduce sbi_set_timer()
Date: Thu, 22 Jan 2026 17:47:27 +0100
Message-ID: <2fd4da2ad7c4af2241368edba739b24d0e976552.1769099885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769099883.git.oleksii.kurochko@gmail.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: CE36A6A885
X-Rspamd-Action: no action

Introduce a function pointer for sbi_set_timer(), since different OpenSBI
versions may implement the TIME extension with different extension IDs
and/or function IDs.

If the TIME extension is not available, fall back to the legacy timer
mechanism. This is useful when Xen runs as a guest under another Xen,
because the TIME extension is not currently virtualised and therefore
will not appear as available.

The sbi_set_timer() pointer will be used by reprogram_timer() to program
Xen’s physical timer as without SSTC extension there is no any other
option except SBI call to do that as only M-timer is available for us.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Move up defintion of SBI_EXT_TIME_SET_TIMER and use the same padding as
   defintions around it.
 - Add an extra comment about stime_value granuality above declaration of
   sbi_set_timer function pointer.
 - Refactor implemetation of sbi_set_timer_v02().
 - Provide fallback for sbi_set_timer_v01().
 - Update the commit message.
---
 xen/arch/riscv/include/asm/sbi.h | 18 ++++++++++++++
 xen/arch/riscv/sbi.c             | 40 ++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 79f7ff5c5501..e0e31d7afa20 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -29,6 +29,10 @@
 
 #define SBI_EXT_BASE                    0x10
 #define SBI_EXT_RFENCE                  0x52464E43
+#define SBI_EXT_TIME                    0x54494D45
+
+/* SBI function IDs for TIME extension */
+#define SBI_EXT_TIME_SET_TIMER          0x0
 
 /* SBI function IDs for BASE extension */
 #define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
@@ -134,6 +138,20 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
 int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
                                 size_t size, unsigned long vmid);
 
+/*
+ * Programs the clock for next event after stime_value time. This function also
+ * clears the pending timer interrupt bit.
+ * If the supervisor wishes to clear the timer interrupt without scheduling the
+ * next timer event, it can either request a timer interrupt infinitely far
+ * into the future (i.e., (uint64_t)-1), or it can instead mask the timer
+ * interrupt by clearing sie.STIE CSR bit.
+ * The stime_value parameter represents absolute time measured in ticks.
+ *
+ * This SBI call returns 0 upon success or an implementation specific negative
+ * error code.
+ */
+extern int (*sbi_set_timer)(uint64_t stime_value);
+
 /*
  * Initialize SBI library
  *
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
index 425dce44c679..2c7757c8839f 100644
--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -249,6 +249,38 @@ static int (* __ro_after_init sbi_rfence)(unsigned long fid,
                                           unsigned long arg4,
                                           unsigned long arg5);
 
+static int cf_check sbi_set_timer_v02(uint64_t stime_value)
+{
+    struct sbiret ret;
+
+    ret = sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value,
+#ifdef CONFIG_RISCV_32
+                    stime_value >> 32,
+#else
+                    0,
+#endif
+                    0, 0, 0, 0);
+
+    return sbi_err_map_xen_errno(ret.error);
+}
+
+static int cf_check sbi_set_timer_v01(uint64_t stime_value)
+{
+    struct sbiret ret;
+
+    ret = sbi_ecall(SBI_EXT_0_1_SET_TIMER, 0, stime_value,
+#ifdef CONFIG_RISCV_32
+                    stime_value >> 32,
+#else
+                    0,
+#endif
+                    0, 0, 0, 0);
+
+    return sbi_err_map_xen_errno(ret.error);
+}
+
+int (* __ro_after_init sbi_set_timer)(uint64_t stime_value);
+
 int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
                           size_t size)
 {
@@ -326,6 +358,14 @@ int __init sbi_init(void)
             sbi_rfence = sbi_rfence_v02;
             printk("SBI v0.2 RFENCE extension detected\n");
         }
+
+        if ( sbi_probe_extension(SBI_EXT_TIME) > 0 )
+        {
+            sbi_set_timer = sbi_set_timer_v02;
+            printk("SBI v0.2 TIME extension detected\n");
+        }
+        else
+            sbi_set_timer = sbi_set_timer_v01;
     }
     else
         panic("Ooops. SBI spec version 0.1 detected. Need to add support");
-- 
2.52.0


