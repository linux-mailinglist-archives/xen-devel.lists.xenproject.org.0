Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNNqM/gQimnUGQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850F4112B4B
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225799.1532483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVM-0002HZ-JP; Mon, 09 Feb 2026 16:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225799.1532483; Mon, 09 Feb 2026 16:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVL-00027E-Uc; Mon, 09 Feb 2026 16:52:55 +0000
Received: by outflank-mailman (input) for mailman id 1225799;
 Mon, 09 Feb 2026 16:52:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUVJ-0007Zd-9A
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:53 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c579a60a-05d7-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:52:51 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6505cac9879so6220421a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:51 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:50 -0800 (PST)
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
X-Inumbo-ID: c579a60a-05d7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655971; x=1771260771; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzoW6oI1pZTCczygZ2TeNSQR2mfIOIpFjPwj3JLnlaQ=;
        b=Hk+aZ0J3Jv4UOB6n36pTG71ju2agjyMRptihvIzxvER5KUv91tmXMRUM3htgcbHsGW
         Czjfin2/dxlM7/Px+IR4RRtX8On15tszrZZ2aBz4ll0b0w3SJxcjrRtyyD2srHiXrdqY
         iRVFbZbYnRWpJxgPoCfRoB28B1HCHcizGYn0j6l9xAOu8eXkO65/hum8eItjK+TADMYH
         8EzCALWx3LaU1gK0S6TPiESpaO/BhpeYt1YsP2PhOqycojMURTtFzvSIJPLd7aQBQ6se
         /ckyVg28sX55OErJZFwMDl9yoSU92wZ/w33FK68TlkpoKGEF8js+6hEh2yirvZZasR+N
         Robg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655971; x=1771260771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rzoW6oI1pZTCczygZ2TeNSQR2mfIOIpFjPwj3JLnlaQ=;
        b=i26V5HqftEpkWMnjuJrIn+hXuf3nBZRkZyQnDO+lMDUWKVQ53A0F1aKACoT5P7fd/8
         g8s/je7Oq24UO/MzVmvCbN0dVx1/J7nVSUb+eP1VVmar4MuMz5khKbrhAoEO1/61yBbA
         nnx8ukq/sJK3N8yQsjfFsC8cuT+wNDpdtH2T4BvGgl2M9TkrfkXqNt9iRPhkM6Fu0eOa
         SOj/jzRMX/qAjVbwt/xSmJaA/RCNJFGXvaqjNjYczcjx5oMaeWUuCexwdyf9y/nBYtOo
         iorPCENyBp6u5/0/sC64McnmwoeUdFRxeczvDmCiUTOPemuMctdUYsPjnHhSWbNaHRDs
         jKXw==
X-Gm-Message-State: AOJu0Ywod3471JMLq/BUO3hDOJ+eQIuEi4DXVW1+UCco7m8aNDI4C650
	DthJ9XqmwF75ziDlG6ZQOMOQuhXviyBI5dUw5ckVlOuv2EQU1wkOop6a9VSiQJCP
X-Gm-Gg: AZuq6aJbOCDP5UfWDk1JjLcTfUP+G+lexZcVbPkFB71wA7GXrAx0OKF9GF4K20giPKD
	mEgBxB3s3PLZXMOEIFe2iePlJmy1nX03XvGLEVQeJ7phDAky+9OK4v+DY5uIA1bodPIXoSVWW89
	5hWSDMzyNXCtvsi5LV1wAR1PZitHAwWnxwmDbEDnRtllv6Googg10KGSReTekbjUCcvtW3n67JM
	+vAj2ts5pXcGJ30XbiwseuTSdqcK5Yqm7BBqK+XgHQ8wXK1nVUTYhAUhdgkBJKl1CktqnNImX8a
	etmJj3t7vrALTLwGjyfQV/ncHGOL6ciYCM6eQ/AWVxqY3YOLIIDmTC8JXozsyxfYoFrqGoovdL6
	S1xZwb5lR1Y0agEw9mSYBgVWMoQXvYpJ9ssqSJOZ6qNRYJdr3rzRimv9fLKd237pcci1Ev34V6l
	nE6+YDqudn9mELB/tlo44x2P1LO9Ry41lcnW/a2nyYgHTMlayzyCVyGw==
X-Received: by 2002:a17:907:3dac:b0:b86:fed0:2b with SMTP id a640c23a62f3a-b8edf307a5emr669724566b.32.1770655970541;
        Mon, 09 Feb 2026 08:52:50 -0800 (PST)
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
Subject: [PATCH v3 12/16] xen/riscv: introduce sbi_set_timer()
Date: Mon,  9 Feb 2026 17:52:25 +0100
Message-ID: <3b102fd2267c629e8505631277efc2eeae5a1a6a.1770650552.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770650552.git.oleksii.kurochko@gmail.com>
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
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
X-Rspamd-Queue-Id: 850F4112B4B
X-Rspamd-Action: no action

Introduce a function pointer for sbi_set_timer(), since different OpenSBI
versions may implement the TIME extension with different extension IDs
and/or function IDs.

If the TIME extension is not available, fall back to the legacy timer
mechanism. This is useful when Xen runs as a guest under another Xen,
because the TIME extension is not currently virtualised and therefore
will not appear as available.
Despite of the fact that sbi_set_timer_v01 is introduced and used as
fall back, SBI v0.1 still isn't fully supported (with the current SBI
calls usage, sbi_rfence_v01 should be introduced too), so panic()
in sbi_init() isn't removed.

The sbi_set_timer() pointer will be used by reprogram_timer() to program
Xen’s physical timer as without SSTC extension there is no any other
option except SBI call to do that as only M-timer is available for us.

Use dprintk() for all the cases to print that a speicifc SBI extension
is available as it isn't really necessary in case of release builds.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Init sbi_set_timer with sbi_set_timer_v01 as fallback value.
 - Sort SBI IDs in the same way as SBI EXT IDs are declared.
 - Add __ro_after_init for sbi_set_timer variable.
 - use dprintk instead of printk to print information if SBI ext is available.
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
 xen/arch/riscv/sbi.c             | 40 +++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 79f7ff5c5501..a237f8b1393c 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -29,6 +29,7 @@
 
 #define SBI_EXT_BASE                    0x10
 #define SBI_EXT_RFENCE                  0x52464E43
+#define SBI_EXT_TIME                    0x54494D45
 
 /* SBI function IDs for BASE extension */
 #define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
@@ -48,6 +49,9 @@
 #define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA       0x5
 #define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID  0x6
 
+/* SBI function IDs for TIME extension */
+#define SBI_EXT_TIME_SET_TIMER          0x0
+
 #define SBI_SPEC_VERSION_MAJOR_MASK     0x7f000000
 #define SBI_SPEC_VERSION_MINOR_MASK     0x00ffffff
 
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
+extern int (* __ro_after_init sbi_set_timer)(uint64_t stime_value);
+
 /*
  * Initialize SBI library
  *
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
index 425dce44c679..b4a7ae6940c1 100644
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
+int (* __ro_after_init sbi_set_timer)(uint64_t stime_value) = sbi_set_timer_v01;
+
 int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
                           size_t size)
 {
@@ -324,7 +356,13 @@ int __init sbi_init(void)
         if ( sbi_probe_extension(SBI_EXT_RFENCE) > 0 )
         {
             sbi_rfence = sbi_rfence_v02;
-            printk("SBI v0.2 RFENCE extension detected\n");
+            dprintk(XENLOG_INFO, "SBI v0.2 RFENCE extension detected\n");
+        }
+
+        if ( sbi_probe_extension(SBI_EXT_TIME) > 0 )
+        {
+            sbi_set_timer = sbi_set_timer_v02;
+            dprintk(XENLOG_INFO, "SBI v0.2 TIME extension detected\n");
         }
     }
     else
-- 
2.52.0


