Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMApLXLWmGl+NQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A2316B0E3
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 22:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237609.1539851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYL5-0008Ti-MX; Fri, 20 Feb 2026 21:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237609.1539851; Fri, 20 Feb 2026 21:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtYL5-0008SW-JL; Fri, 20 Feb 2026 21:47:07 +0000
Received: by outflank-mailman (input) for mailman id 1237609;
 Fri, 20 Feb 2026 21:47:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tad=AY=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vtYL4-0008Ew-An
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 21:47:06 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2a20ada-0ea5-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 22:47:05 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so29346975e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 13:47:05 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a8df83bcsm28940205e9.13.2026.02.20.13.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 13:47:03 -0800 (PST)
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
X-Inumbo-ID: b2a20ada-0ea5-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771624025; x=1772228825; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDPL04AxDc8Xafccu1ZVRQiZUTvtnTnKwY+v0GkBCrE=;
        b=Ji2GEFyPAZ3Ns9pvX2Of+s46mxwkpdcPtoXIxxk0svZSdwXS5RUddD/zEj4LRs7dRd
         LBhVjCn3P1n0gtbIAeNITqJ5rvs7woU453b/TpRZM+xm/tunb1eNfC2t0NAF1KYvH44w
         yTMggrHCWWqn3R/fmHJQs8SXG5H04Kwj7r2Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624025; x=1772228825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jDPL04AxDc8Xafccu1ZVRQiZUTvtnTnKwY+v0GkBCrE=;
        b=eZRnDdXdqskNblg2lNBZT6HTvrjyqzD+H13RDCtizGou2zwx8ULfEw2OBC9AFdGRP3
         M6W9IT3gkPItztdVKlzd18p+X/EywCnSF3p2JgpjMEiy6uIfj6RUdkNiK12hOSfBOvSh
         +r3FugzF3FzfVz1E0lJ7y6C7ExQhCw6rjLV+kGInB6EivBnvYgzsiY2k6a3ZtZTzvmga
         w1Efb2lSFj8vs7TGmrXF8mAKetuAxll2cMbzDO78EjJDf7XnHHwNt76wvA8YcUYE5QFF
         aFJ2lBJMLch88vWWU/pjxsalpNipVNKyFUt/3ALsl52WnBVdFR/bWPBFwCKZTG64yf2c
         ORzQ==
X-Gm-Message-State: AOJu0Yz7Hmi6JQFPVS8EoMT5XlkAEZ71SuRu9DTD0PXlyIWtosB9mo3Q
	HDG/7dSLZjJcqQrMidD4N9LOPhZiWvCFAwb604Hhf3vZAi8xzo6hpLfhCumSFx2OvFdd7LKvWhs
	oMEz+Ef/1zQ==
X-Gm-Gg: AZuq6aIX95OOjm//yzhFosaDE7YGnn4F1uwh/Q7xbtZyYnulaOIi6ibCSaRo6Aoh8CD
	kFWTPYs/sENDCzGeCtqWwWvu4MD3NSExDwqatJpJ9qEHBASwjVivuBkikd4FPc6Dzlli8SHjZnJ
	iSZYpNk8a/EimAy4B2v2rB6H2mzkWFisUcMGmQZJdnYLjzvSXGXRL9DxKU7gTU3/MPBOik+ybtW
	T+8qGFcuy0t/fR4kBS312ePqx1jOxj5kPTFtZbou2GdMnxbxC57W56xwLQmSLVDa4GiSyQ4UhFY
	v5FWNEeRhgDWlDee69KjSKp2IBJuEfs7M4k4UGGHCHiZSCHZQbQG1G393ghRLGTz1rA/YWI2jLU
	xNqpSxgT44YP5UMYEuqdZeu5pix/w3zTwr3MWzPWD9eKMCEgID9Pxlgv5T6jNizGkBVZ4k5+sH2
	ka2cH1gMC2KB+/wFwTgO6z7FaehMOGA+abq/zxjUjElaOQe2PEovihXl4iifyx0jUuFwgFD4Q=
X-Received: by 2002:a05:600c:6291:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-483a95b5975mr16770775e9.5.1771624024597;
        Fri, 20 Feb 2026 13:47:04 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 02/12] xen/treewide: Adjust suffixes on integer literals
Date: Fri, 20 Feb 2026 21:46:43 +0000
Message-Id: <20260220214653.3497384-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 60A2316B0E3
X-Rspamd-Action: no action

Use U where necessary (Misra Rule 7.2) and uppercase L (Misra Rule 7.3).

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/gic-v3-its.c                |  2 +-
 xen/arch/arm/include/asm/tee/optee_msg.h | 16 ++++++++--------
 xen/arch/arm/include/asm/tee/optee_smc.h |  8 ++++----
 xen/arch/arm/tee/optee.c                 |  6 +++---
 xen/arch/x86/guest/xen/xen.c             |  2 +-
 xen/arch/x86/include/asm/config.h        |  2 +-
 xen/arch/x86/include/asm/guest/hyperv.h  |  2 +-
 xen/arch/x86/pv/emul-gate-op.c           |  2 +-
 xen/arch/x86/tboot.c                     |  4 ++--
 xen/drivers/char/xhci-dbc.c              | 14 +++++++-------
 10 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 34833166adcc..9ba068c46fcb 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -76,7 +76,7 @@ static const struct its_quirk its_quirks[] = {
     {
         .desc	= "R-Car Gen4",
         .iidr	= 0x0201743b,
-        .mask	= 0xffffffff,
+        .mask	= 0xffffffffU,
         .init	= gicv3_its_enable_quirk_gen4,
     },
     {
diff --git a/xen/arch/arm/include/asm/tee/optee_msg.h b/xen/arch/arm/include/asm/tee/optee_msg.h
index fe743dbde3c8..09820ff8638c 100644
--- a/xen/arch/arm/include/asm/tee/optee_msg.h
+++ b/xen/arch/arm/include/asm/tee/optee_msg.h
@@ -222,10 +222,10 @@ struct optee_msg_arg {
  * Represented in 4 32-bit words in OPTEE_MSG_UID_0, OPTEE_MSG_UID_1,
  * OPTEE_MSG_UID_2, OPTEE_MSG_UID_3.
  */
-#define OPTEE_MSG_UID_0			0x384fb3e0
-#define OPTEE_MSG_UID_1			0xe7f811e3
-#define OPTEE_MSG_UID_2			0xaf630002
-#define OPTEE_MSG_UID_3			0xa5d5c51b
+#define OPTEE_MSG_UID_0			0x384fb3e0U
+#define OPTEE_MSG_UID_1			0xe7f811e3U
+#define OPTEE_MSG_UID_2			0xaf630002U
+#define OPTEE_MSG_UID_3			0xa5d5c51bU
 #define OPTEE_MSG_FUNCID_CALLS_UID	0xFF01
 
 /*
@@ -246,10 +246,10 @@ struct optee_msg_arg {
  * Returns UUID in 4 32-bit words in the same way as
  * OPTEE_MSG_FUNCID_CALLS_UID described above.
  */
-#define OPTEE_MSG_OS_OPTEE_UUID_0	0x486178e0
-#define OPTEE_MSG_OS_OPTEE_UUID_1	0xe7f811e3
-#define OPTEE_MSG_OS_OPTEE_UUID_2	0xbc5e0002
-#define OPTEE_MSG_OS_OPTEE_UUID_3	0xa5d5c51b
+#define OPTEE_MSG_OS_OPTEE_UUID_0	0x486178e0U
+#define OPTEE_MSG_OS_OPTEE_UUID_1	0xe7f811e3U
+#define OPTEE_MSG_OS_OPTEE_UUID_2	0xbc5e0002U
+#define OPTEE_MSG_OS_OPTEE_UUID_3	0xa5d5c51bU
 #define OPTEE_MSG_FUNCID_GET_OS_UUID	0x0000
 
 /*
diff --git a/xen/arch/arm/include/asm/tee/optee_smc.h b/xen/arch/arm/include/asm/tee/optee_smc.h
index 2f5c702326f7..39c04eb5ad1b 100644
--- a/xen/arch/arm/include/asm/tee/optee_smc.h
+++ b/xen/arch/arm/include/asm/tee/optee_smc.h
@@ -443,9 +443,9 @@
 #define OPTEE_SMC_CALL_RETURN_FROM_RPC \
 	OPTEE_SMC_STD_CALL_VAL(OPTEE_SMC_FUNCID_RETURN_FROM_RPC)
 
-#define OPTEE_SMC_RETURN_RPC_PREFIX_MASK	0xFFFF0000
-#define OPTEE_SMC_RETURN_RPC_PREFIX		0xFFFF0000
-#define OPTEE_SMC_RETURN_RPC_FUNC_MASK		0x0000FFFF
+#define OPTEE_SMC_RETURN_RPC_PREFIX_MASK	0xFFFF0000U
+#define OPTEE_SMC_RETURN_RPC_PREFIX		0xFFFF0000U
+#define OPTEE_SMC_RETURN_RPC_FUNC_MASK		0x0000FFFFU
 
 #define OPTEE_SMC_RETURN_GET_RPC_FUNC(ret) \
 	((ret) & OPTEE_SMC_RETURN_RPC_FUNC_MASK)
@@ -548,7 +548,7 @@
 	OPTEE_SMC_RPC_VAL(OPTEE_SMC_RPC_FUNC_CMD)
 
 /* Returned in a0 */
-#define OPTEE_SMC_RETURN_UNKNOWN_FUNCTION 0xFFFFFFFF
+#define OPTEE_SMC_RETURN_UNKNOWN_FUNCTION 0xFFFFFFFFU
 
 /* Returned in a0 only from Trusted OS functions */
 #define OPTEE_SMC_RETURN_OK		0x0
diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 5151bd90ed02..699e8d536862 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -49,16 +49,16 @@
 #define TEEC_ORIGIN_COMMS 0x00000002
 
 /* "Non-specific cause" as in GP TEE Client API Specification */
-#define TEEC_ERROR_GENERIC 0xFFFF0000
+#define TEEC_ERROR_GENERIC 0xFFFF0000U
 
 /*
  * "Input parameters were invalid" as described
  * in GP TEE Client API Specification.
  */
-#define TEEC_ERROR_BAD_PARAMETERS 0xFFFF0006
+#define TEEC_ERROR_BAD_PARAMETERS 0xFFFF0006U
 
 /* "System ran out of resources" as in GP TEE Client API Specification */
-#define TEEC_ERROR_OUT_OF_MEMORY 0xFFFF000C
+#define TEEC_ERROR_OUT_OF_MEMORY 0xFFFF000CU
 
 /* Client ID 0 is reserved for the hypervisor itself */
 #define OPTEE_CLIENT_ID(domain) ((domain)->domain_id + 1)
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index 77a3a8742a3e..315e5ded05ab 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -120,7 +120,7 @@ static void map_shared_info(void)
 
     /* Mask all upcalls */
     for ( i = 0; i < ARRAY_SIZE(XEN_shared_info->evtchn_mask); i++ )
-        write_atomic(&XEN_shared_info->evtchn_mask[i], ~0ul);
+        write_atomic(&XEN_shared_info->evtchn_mask[i], ~0UL);
 }
 
 static int map_vcpuinfo(void)
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index cc80f2c62310..1b28349a427b 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -200,7 +200,7 @@
 #ifdef CONFIG_PV32
 
 /* This is not a fixed value, just a lower limit. */
-#define __HYPERVISOR_COMPAT_VIRT_START 0xF5800000
+#define __HYPERVISOR_COMPAT_VIRT_START 0xF5800000U
 #define HYPERVISOR_COMPAT_VIRT_START(d) ((d)->arch.pv.hv_compat_vstart)
 
 #else /* !CONFIG_PV32 */
diff --git a/xen/arch/x86/include/asm/guest/hyperv.h b/xen/arch/x86/include/asm/guest/hyperv.h
index c05efdce71a4..dabc62727b44 100644
--- a/xen/arch/x86/include/asm/guest/hyperv.h
+++ b/xen/arch/x86/include/asm/guest/hyperv.h
@@ -11,7 +11,7 @@
 #include <xen/types.h>
 
 /* Use top-most MFN for hypercall page */
-#define HV_HCALL_MFN   (((1ull << paddr_bits) - 1) >> HV_HYP_PAGE_SHIFT)
+#define HV_HCALL_MFN   (((1ULL << paddr_bits) - 1) >> HV_HYP_PAGE_SHIFT)
 
 /*
  * The specification says: "The partition reference time is computed
diff --git a/xen/arch/x86/pv/emul-gate-op.c b/xen/arch/x86/pv/emul-gate-op.c
index dcac0a04015b..1faf13b962b1 100644
--- a/xen/arch/x86/pv/emul-gate-op.c
+++ b/xen/arch/x86/pv/emul-gate-op.c
@@ -32,7 +32,7 @@ static int read_gate_descriptor(unsigned int gate_sel,
         return 0;
 
     *sel = (desc.a >> 16) & 0x0000fffc;
-    *off = (desc.a & 0x0000ffff) | (desc.b & 0xffff0000);
+    *off = (desc.a & 0x0000ffff) | (desc.b & 0xffff0000U);
     *ar = desc.b & 0x0000ffff;
 
     /*
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index 9d9bb6e7cf6d..0b3d596690cc 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -41,8 +41,8 @@ static bool __ro_after_init is_vtd;
  * TXT configuration registers (offsets from TXT_{PUB, PRIV}_CONFIG_REGS_BASE)
  */
 
-#define TXT_PUB_CONFIG_REGS_BASE       0xfed30000
-#define TXT_PRIV_CONFIG_REGS_BASE      0xfed20000
+#define TXT_PUB_CONFIG_REGS_BASE       0xfed30000U
+#define TXT_PRIV_CONFIG_REGS_BASE      0xfed20000U
 
 /* # pages for each config regs space - used by fixmap */
 #define NR_TXT_CONFIG_PAGES     ((TXT_PUB_CONFIG_REGS_BASE -                \
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 1f7d4395dc9d..c1ff528de62f 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -353,8 +353,8 @@ static bool __init dbc_init_xhc(struct dbc *dbc)
     cmd = pci_conf_read16(dbc->sbdf, PCI_COMMAND);
     pci_conf_write16(dbc->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
 
-    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_0, 0xFFFFFFFF);
-    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_1, 0xFFFFFFFF);
+    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_0, 0xFFFFFFFFU);
+    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_1, 0xFFFFFFFFU);
     bar_size = pci_conf_read32(dbc->sbdf, PCI_BASE_ADDRESS_0);
     bar_size |= (uint64_t)pci_conf_read32(dbc->sbdf, PCI_BASE_ADDRESS_1) << 32;
     xhc_mmio_size = ~(bar_size & PCI_BASE_ADDRESS_MEM_MASK) + 1;
@@ -398,7 +398,7 @@ static struct dbc_reg __iomem *xhci_find_dbc(struct dbc *dbc)
      * This is initially an offset to the first capability. All the offsets
      * (both in HCCP1 and then next capability pointer) are dword-based.
      */
-    next = (readl(hccp1) & 0xFFFF0000) >> 16;
+    next = readl(hccp1) >> 16;
 
     while ( id != DBC_ID && next && ttl-- )
     {
@@ -735,7 +735,7 @@ static void dbc_init_ep(uint32_t *ep, uint64_t mbs, uint32_t type,
     memset(ep, 0, DBC_CTX_BYTES);
 
     ep[1] = (1024 << 16) | ((uint32_t)mbs << 8) | (type << 3);
-    ep[2] = (ring_dma & 0xFFFFFFFF) | 1;
+    ep[2] = (uint32_t)ring_dma | 1;
     ep[3] = ring_dma >> 32;
     ep[4] = 3 * 1024;
 }
@@ -816,7 +816,7 @@ static void dbc_reset_debug_port(struct dbc *dbc)
      * This is initially an offset to the first capability. All the offsets
      * (both in HCCP1 and then next capability pointer are dword-based.
      */
-    next = (readl(hccp1) & 0xFFFF0000) >> 16;
+    next = readl(hccp1) >> 16;
 
     /*
      * Look for "supported protocol" capability, major revision 3.
@@ -1094,7 +1094,7 @@ static void dbc_enqueue_in(struct dbc *dbc, struct xhci_trb_ring *trb,
                            struct dbc_work_ring *wrk)
 {
     struct dbc_reg *reg = dbc->dbc_reg;
-    uint32_t db = (readl(&reg->db) & 0xFFFF00FF) | (trb->db << 8);
+    uint32_t db = (readl(&reg->db) & 0xFFFF00FFU) | (trb->db << 8);
 
     /* Check if there is already queued TRB */
     if ( xhci_trb_ring_size(trb) >= 1 )
@@ -1289,7 +1289,7 @@ static void cf_check dbc_uart_resume(struct serial_port *port)
     struct dbc_uart *uart = port->uart;
     struct dbc *dbc = &uart->dbc;
 
-    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_0, dbc->bar_val & 0xFFFFFFFF);
+    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_0, dbc->bar_val);
     pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_1, dbc->bar_val >> 32);
     pci_conf_write16(dbc->sbdf, PCI_COMMAND, dbc->pci_cr);
 
-- 
2.39.5


