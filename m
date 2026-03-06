Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD/xKPUBq2m4ZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175DD224F93
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247972.1546318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7U-00036r-Ol; Fri, 06 Mar 2026 16:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247972.1546318; Fri, 06 Mar 2026 16:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7U-00033o-LX; Fri, 06 Mar 2026 16:33:44 +0000
Received: by outflank-mailman (input) for mailman id 1247972;
 Fri, 06 Mar 2026 16:33:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vyY7T-00030j-Ew
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:33:43 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c87ec6e-197a-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 17:33:41 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439aa2f8ebaso4138738f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 08:33:41 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm4406550f8f.39.2026.03.06.08.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:40 -0800 (PST)
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
X-Inumbo-ID: 3c87ec6e-197a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814821; x=1773419621; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmbbmA8PgeTF4OMY1R9mkMVOPj+EWhxjWMhkhMqQixw=;
        b=mt6XOoSBpqL5RjnQGdAQcigJHrRF2kgeuKl1kMY1nKq2adZ4nI4MHD8DQma9xxve3y
         Jrs4UVCdZfFBwi275d2Zq2CBhglHblYmDRQxSOMR/9WbkpYitLp1XPk2SVh93AO8btX3
         F4uCr77wt67dhNyO5oIPdmgGELQoa5xc7fqnVX9DlwdQpzuF++55gypKVMMm5VKrG8O0
         /wot/Dk6AjO8lt6Ous9KxQNuaRA53AuLxyBwsL7t+KOSSlnLgYOCCgX4nKmnnALKOroN
         rg3XpSi/pMmwnVdarLHhiEkxhRYj0phnqHvLd2H0G7hkjT5xTxEdXLUoWxLDLYhVailz
         CnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814821; x=1773419621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CmbbmA8PgeTF4OMY1R9mkMVOPj+EWhxjWMhkhMqQixw=;
        b=qv1/AGNTx+r9gmJQYBIkb8u8FYGoC/sSeCr8JCy9zd9AYku3b3Eq1/Ke+dCyxhnU6X
         jKM8u6j5MqEBcAnnhV8Qki1qGpmGbd7CTBYVIeSF0mgK6RCId1OSnJx3DXSH2Ar9tr23
         LN2k/J2qC0+XDglcdCB5RjWT9xjDFTxd9BWRaokeXj90YFADNi/rdPAGHl9wD+ZNyACW
         QRBzxjyS//L+BHD7uNaO6ezFWeIRYp/qXJZyPOgg+hOL8yukgVuCWm+5EiarlKDfJwtp
         e0qa416kuLq72jxk8SCsSBpaT0DOAk0EE6BDwr9bS+IGhXHeeBW+kjkeEvejp5581pcC
         Th8w==
X-Gm-Message-State: AOJu0YzoFswGwjb+vOJXKacpXyf0kLcoVC8Gr9gJl3uIfHTCY4ijvhdr
	laE0N0neh8AKuLhhF2kuj1A6iyC0n01qbe2yNFMBsLRByUaM57g/Ni/OHuiglQ==
X-Gm-Gg: ATEYQzxtB0P+cHXbMSF5ksOoiBkK1wU163U21kmRQw34f3MzATz34o9eAqLAqXGLDUG
	7dnfoK9M7P1vjhAHbLVCG5Us5sxRKaWHwxcfY+y4nt+4sZrT+zRaSMUVUz7JgPE3u3ZwwCqAIxo
	2FkmKonT2WabknwieQoexAwgGPboHlCKcfwnu+jBtG7w55aggSISV/2oDuN7ep1uHd1Iw29v8lx
	lr8hHA7FbNBcYeqA8HYZlZGMQjQ4Om5vlMkkAv7fNb1RFDxpZEzGmUs07KXl969vyPiMD4RW7Sh
	JwXW0wh9AnZqCYN8+el5uVjVGetheNBwd/fqpxAXNKpJiZRtjKfjo7ijrRBiXhVyEkQwxy/6MtY
	scyrWEWkqmTs//0nPuIFdbeyvfv7shbt4Pyy4zZOnoPDnytFN+CYavw5YWDt5HClWjz7aAHUmGD
	UI0/OaKFBCjYO9fR8pc5fUTX2orwDXkhUdUuHZwxuBLV0BHWBwoSbDmZsVODXwKLRMkgKF8AYrn
	6m4
X-Received: by 2002:a05:6000:2313:b0:431:808:2d58 with SMTP id ffacd0b85a97d-439da8a147bmr5202646f8f.51.1772814820844;
        Fri, 06 Mar 2026 08:33:40 -0800 (PST)
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
Subject: [PATCH v7 01/14] xen/riscv: detect and store supported hypervisor CSR bits at boot
Date: Fri,  6 Mar 2026 17:33:18 +0100
Message-ID: <3201951150104f17593e16c7ba00ada51ac1e10f.1772814110.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772814110.git.oleksii.kurochko@gmail.com>
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 175DD224F93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
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

Some hypervisor CSRs expose optional functionality and may not implement
all architectural bits. Writing unsupported bits can either be ignored
or raise an exception depending on the platform.

Detect the set of writable bits for selected hypervisor CSRs at boot and
store the resulting masks for later use. This allows safely programming
these CSRs during vCPU context switching and avoids relying on hardcoded
architectural assumptions.

Use csr_read()&csr_write() instead of csr_swap()+all ones mask as some
CSR registers have WPRI fields which should be preserved during write
operation.

Also, ro_one struct is introduced to cover the cases when a bit in CSR
register (at the momemnt, it is only hstateen0) may be r/o-one to have
hypervisor view of register seen by guest correct.

Masks are calculated at the moment only for hedeleg, henvcfg, hideleg,
hstateen0 registers as only them are going to be used in the follow up
patch.

If the Smstateen extension is not implemented, hstateen0 cannot be read
because the register is considered non-existent. Instructions that attempt
to access a CSR that is not implemented or not visible in the current mode
are reserved and will raise an illegal-instruction exception.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - Use csr_read_set() in INIT_CSR_MASK() instead of csr_read()+csr_write().
 - Add undef of INIT_CSR_MASK().
 - Move local variable old above INIT_CSR_MASK().
 - Introduce INIT_RO_ONE_MASK() to init csr_masks.ro_one.* fields.
 - Introduce defines for masks intead of constants.
 - Move old variable inside macros INIT_CSR_MASK() and INIT_RO_ONE_MASK().
---
Changes in V6:
 - Introduce sub-struct ro_one inside csr_masks to cover the case that
   hstateen0 could have read-only-one bits.
 - Refacotr init_csr_masks() to handle hstateen0 case when a bit is r/o-one
   and handle WPRI fields properly.
 - Update the commit message.
---
Changes in V5:
 - Move everything related to csr_masks to domain.c and make it static.
 - Move declaration of old variable in init_csr_masks() inside INIT_CSR_MASK.
 - Use csr_swap() in INIT_CSR_MASK().
---
Changes in V4:
 - Move csr_masks defintion to domain.c. Make it static as at the moment
   it is going to be used only in domain.c.
 - Rename and refactor X macros inside init_csr_masks().
---
Changes in V3:
 - New patch.
---
 xen/arch/riscv/domain.c            | 57 ++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/setup.h |  2 ++
 xen/arch/riscv/setup.c             |  2 ++
 3 files changed, 61 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index b60320b90def..32974cb48929 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -2,9 +2,66 @@
 
 #include <xen/init.h>
 #include <xen/mm.h>
+#include <xen/sections.h>
 #include <xen/sched.h>
 #include <xen/vmap.h>
 
+#include <asm/cpufeature.h>
+#include <asm/csr.h>
+
+struct csr_masks {
+    register_t hedeleg;
+    register_t henvcfg;
+    register_t hideleg;
+    register_t hstateen0;
+
+    struct {
+        register_t hstateen0;
+    } ro_one;
+};
+
+static struct csr_masks __ro_after_init csr_masks;
+
+#define HEDELEG_AVAIL_MASK ULONG_MAX
+#define HIDELEG_AVAIL_MASK ULONG_MAX
+#define HENVCFG_AVAIL_MASK _UL(0xE0000003000000FF)
+#define HSTATEEN0_AVAIL_MASK _UL(0xDE00000000000007)
+
+void __init init_csr_masks(void)
+{
+    /*
+     * The mask specifies the bits that may be safely modified without
+     * causing side effects.
+     *
+     * For example, registers such as henvcfg or hstateen0 contain WPRI
+     * fields that must be preserved. Any write to the full register must
+     * therefore retain the original values of those fields.
+     */
+#define INIT_CSR_MASK(csr, field, mask) do { \
+        register_t old = csr_read_set(CSR_##csr, mask); \
+        csr_masks.field = csr_swap(CSR_##csr, old); \
+    } while (0)
+
+#define INIT_RO_ONE_MASK(csr, field, mask) do { \
+        register_t old = csr_read_clear(CSR_HSTATEEN0, mask); \
+        csr_masks.ro_one.field = csr_swap(CSR_##csr, old) & mask; \
+    } while (0)
+
+    INIT_CSR_MASK(HEDELEG, hedeleg, HEDELEG_AVAIL_MASK);
+    INIT_CSR_MASK(HIDELEG, hideleg, HIDELEG_AVAIL_MASK);
+
+    INIT_CSR_MASK(HENVCFG, henvcfg, HENVCFG_AVAIL_MASK);
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+    {
+        INIT_CSR_MASK(HSTATEEN0, hstateen0, HSTATEEN0_AVAIL_MASK);
+        INIT_RO_ONE_MASK(HSTATEEN0, hstateen0, HSTATEEN0_AVAIL_MASK);
+    }
+
+#undef INIT_CSR_MASK
+#undef INIT_RO_ONE_MASK
+}
+
 static void continue_new_vcpu(struct vcpu *prev)
 {
     BUG_ON("unimplemented\n");
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index c9d69cdf5166..2215894cfbb1 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -11,6 +11,8 @@ void setup_mm(void);
 
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
+void init_csr_masks(void);
+
 #endif /* ASM__RISCV__SETUP_H */
 
 /*
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 9b4835960d20..bca6ca09eddd 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -137,6 +137,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     riscv_fill_hwcap();
 
+    init_csr_masks();
+
     preinit_xen_time();
 
     intc_preinit();
-- 
2.53.0


