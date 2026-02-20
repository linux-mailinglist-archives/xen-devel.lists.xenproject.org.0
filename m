Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBF8JaCJmGlvJgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB5F16945C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237343.1539779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTE6-0002ue-VL; Fri, 20 Feb 2026 16:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237343.1539779; Fri, 20 Feb 2026 16:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTE6-0002oQ-H1; Fri, 20 Feb 2026 16:19:34 +0000
Received: by outflank-mailman (input) for mailman id 1237343;
 Fri, 20 Feb 2026 16:19:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vtTE3-0000Q4-V6
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 16:19:31 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef079b3d-0e77-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 17:19:30 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso17009375e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 08:19:30 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm56991068f8f.13.2026.02.20.08.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:19:28 -0800 (PST)
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
X-Inumbo-ID: ef079b3d-0e77-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771604369; x=1772209169; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VAMf5wEbjWTV3qUp1H5TFWR6XdnKzjzMGvNMq2GKmE=;
        b=jGNQpjWrU8VIWmAKD9uYAFQLk2GxEGlPr1fjj5Fa6R6W1u9daTFnAjeDioKbVmflc4
         XZvUi+TlN2CGSn+MVAXrEfdHESZSNfR9PIuOvKjaWqLtTiU6SC0yQI0Ke2q2WOqjPhd/
         a1VePKAtukASbG1Srz+Akr1iHq+YWPDDMgvgh0u5GCoYC1zqun0rNVzfX0x9atsnwKii
         fv3ds78ZVww1leIDwfeuWq6rQOtG405bUVOz4KC8thrmOF7G7cPDdqapbkB1+EYCkdpA
         rBm+PqAzRnBLAA8NNvjO6Nn/pvFxo/kVB2nqM5YAYaaV9oqHgtPIbmzcZ2xAptGLm5PT
         tK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771604369; x=1772209169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3VAMf5wEbjWTV3qUp1H5TFWR6XdnKzjzMGvNMq2GKmE=;
        b=uge/Gyr9Bpe0KpqNFDTsX9hoRuW6mxhzja7FAFrGxX8iNlP/rhEE4zkDZWxHcNuhtR
         fKeHdLsQiuOOSeKwgKouJL1Tfaojzhdspz9LvhVYK9eUB5rlY9cHMPtPCkW8KSOfiHuI
         Jg0ZP1rZRkgy+KtJdTbcwSlY3bWBl0MQ+hCWfD95G9Dp3S4puZipR1JNA/mDKDp9A34U
         7gUNh+hYvaUyN9R4fbw03G08HjC1EpdxZNMCKHt9muvcjOBkjIhrjlXYWxR8urKilwtY
         irP98bCiXkH0mvSvlFkZyLn2Rfao31+h5oMJwtp4xxF+Sq6EgoT7+v3sdC3uzrpahuK/
         2RNg==
X-Gm-Message-State: AOJu0Yw2rrnFunofG5yJtLPR8fSz9KRla0V2chWgz10GDRjoStipmjvJ
	PO/wlrR2GbOLDhV53VW1GUIJts6qJdBmMJQ9qjY+xqbhznJb1/6euYwtoWS+fA==
X-Gm-Gg: AZuq6aIstN+Pihplvy8hQ5iTcROzoCMvHPCve15BFO0JJe2bZP8sCmnitYGA/qyOdW+
	pmMurzj0LUFZdSZHyqilQQ3QZSPkrH4osjTu9KBYVmADIPaPC9WAPjaxh429slrl1jvMZH6Wwd8
	BViUin8VEoBbakuRELaDBrehP8HwhvKB/STCvWSuahpku8xLi4C4x3aohFEvvtS45IK0NOSI6er
	df9Xj5BOv/rQHM4/aE7NmO6w4rJoBJhFXQKCWZ/uTsz9gF8kT+oHlRHNWEWuvQVoRW+jdhN3aOB
	2OanJK1CGHiPWUJcvsGHX93/cyt+Z7q+0zuK0FPlmjeYJCvgBnKqWscVC3m091q5j8UKj0F4IVB
	Jg8P1pqzdhEZn9SouOsJ/i5XSwZD9BKT+twiL0IB/mcQHy2OVnMAHpJQ7l0uiiMG9CHST7AL39W
	iC64zZoIywofviQ7AWNQwMp64POu/uokohiRMIdzLk1FieORYOousbmCOulBCb0MbPlc+Heg==
X-Received: by 2002:a05:600c:1f8f:b0:483:6d4e:9811 with SMTP id 5b1f17b1804b1-483a95ee3f2mr1262605e9.31.1771604369073;
        Fri, 20 Feb 2026 08:19:29 -0800 (PST)
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
Subject: [PATCH v5 10/14] xen/riscv: introduce sbi_set_timer()
Date: Fri, 20 Feb 2026 17:19:05 +0100
Message-ID: <8f3a1ea2d841ce9f184583cdb9915bd39d760825.1771590794.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1771590794.git.oleksii.kurochko@gmail.com>
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4BB5F16945C
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
- Add inclusion of <xen/sections.h> to <asm/sbi.h> to deal with the compilation issue:
    ./arch/riscv/include/asm/sbi.h:156:30: error: expected ')' before 'sbi_set_timer'
    156 | extern int (* __ro_after_init sbi_set_timer)(uint64_t stime_value);
- Rephrase the first sentence of the comment above declaration of sbi_set_timer
  pointer to function.
---
Changes in v4:
 - Add "stime_value is in absolute time" to the comment above declaration
   of sbi_set_timer() function pointer.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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
 xen/arch/riscv/include/asm/sbi.h | 22 ++++++++++++++++++
 xen/arch/riscv/sbi.c             | 40 +++++++++++++++++++++++++++++++-
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 79f7ff5c5501..ed7af200288f 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -13,6 +13,7 @@
 #define ASM__RISCV__SBI_H
 
 #include <xen/cpumask.h>
+#include <xen/sections.h>
 
 /* SBI-defined implementation ID */
 #define SBI_XEN_IMPID 7
@@ -29,6 +30,7 @@
 
 #define SBI_EXT_BASE                    0x10
 #define SBI_EXT_RFENCE                  0x52464E43
+#define SBI_EXT_TIME                    0x54494D45
 
 /* SBI function IDs for BASE extension */
 #define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
@@ -48,6 +50,9 @@
 #define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA       0x5
 #define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID  0x6
 
+/* SBI function IDs for TIME extension */
+#define SBI_EXT_TIME_SET_TIMER          0x0
+
 #define SBI_SPEC_VERSION_MAJOR_MASK     0x7f000000
 #define SBI_SPEC_VERSION_MINOR_MASK     0x00ffffff
 
@@ -134,6 +139,23 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
 int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
                                 size_t size, unsigned long vmid);
 
+/*
+ * Programs the clock for next event at (or after) stime_value. stime_value is
+ * in absolute time. This function must clear the pending timer interrupt bit
+ * as well.
+ *
+ * If the supervisor wishes to clear the timer interrupt without scheduling the
+ * next timer event, it can either request a timer interrupt infinitely far
+ * into the future (i.e., (uint64_t)-1), or it can instead mask the timer
+ * interrupt by clearing sie.STIE CSR bit.
+ *
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
2.53.0


