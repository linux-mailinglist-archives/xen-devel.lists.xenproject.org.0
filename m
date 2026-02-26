Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GS3KuMzoGnwggQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DB31A55CA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241452.1542487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZtx-0006TO-8Y; Thu, 26 Feb 2026 11:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241452.1542487; Thu, 26 Feb 2026 11:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZtx-0006RR-5g; Thu, 26 Feb 2026 11:51:29 +0000
Received: by outflank-mailman (input) for mailman id 1241452;
 Thu, 26 Feb 2026 11:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Tft=A6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vvZtw-0006EH-7n
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 11:51:28 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a857585-1309-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 12:51:25 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so8710625e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 03:51:25 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm220079295e9.0.2026.02.26.03.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 03:51:24 -0800 (PST)
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
X-Inumbo-ID: 7a857585-1309-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772106685; x=1772711485; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hp5eAdCk/2OvwDZTtcjSxeKObwgzunQJOuXOKfijBE4=;
        b=RyWH5bb4yR/tmFBThWdUwaJSlABlzhK/2kDuPqtrd6021Qx0ObfANh6QIHhkegpsdE
         rGDiiZFAiHIhQsUGEA6DMXEoRjuVRD2aXX5QpcQR+Vxt9pqKSobP0fdxgsPJNPB/QLmU
         2O8M9WWSbVVPS6UKeVLO3HNZa1RD8RO+qs2c4qacX7LQSY+quVYz1/4us7mNPrMOclc2
         p2MW5xk9ix7xspqKj84Q8mRzuQYJbiLuI682u0zHRr6BokxvSIZbzotb3h3ux8hkjhtp
         AqlH0/s7uH5eTI2v+7GbCbR8dhsEtpEhaO0klQ4zLaFuZD08g+NQ/jdzQUuRH2UIc0sW
         ZwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106685; x=1772711485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hp5eAdCk/2OvwDZTtcjSxeKObwgzunQJOuXOKfijBE4=;
        b=fGmkA5xGfcCcJXTFfhavJqGnRT7VJpRAGcR/ZzUFhpB/C/SLa3+qJtIwOqG/e3H4RR
         nLXLROjx+Pf0OpRd9oDFf8qDVFQiNyXmU5LhKPCNctydy3Fi7ha2I47YMhiUMtuSWZAB
         dmG+WL02vr+P7E93mszysQcW6f2iKC/IyM1cF3toP4QhLdM/4AC+e+niXlTwgHlp18Ss
         diZGt4WcenmTVTpPMRZAWTwm8iFmMIQN/HGXEW+Xnt41co6sriLo5jgOfePhcROSA9JH
         y5jizuhKeIEk5IuYhZ1lalK2eDoctgosCmdR1KTHFVrrig/Fud6ajAWCAgHpMAziT/jw
         3AQA==
X-Gm-Message-State: AOJu0YwLU7QWkDaJOxz2D8pc1Bwr6X0dmKXl6z/zCHARuQ+tngC89Xe4
	NYrekiTf7D9OSXHAIWuMn+obILLrmE3xGSYmtnrlY30VxQa1XFFBR79bZckA2g==
X-Gm-Gg: ATEYQzyCZ029jCQF+i+3ClRkiuDRMVXszRQsJCpuVx572YfCa1tEubMl/q+nLvUV3fb
	nIC6+a65JviEhsyfaU5Z6VItY6XgISPwL3UiLcKOpgLoeRsaUbPBJBGBzCqzZSodBjcP5PswHQh
	DzcuklLWSCvGJx81V3SSxtIBL62rJ3C9132SvJsARhtmCnq6cwtklt+WNGUdB112ZVzgqcDylRa
	Os9cRmyLOa9dSizZQ6AUoy17820lOwmm6+FLhAKpxa2TpQbwTW8oDjgFuP6E/CvuPAX9anFuzkT
	e1NGB39jeUGV56XeegXDBEZvEXtFy59cciaL0TLZp2x/q8eAyit0iyeuGfQTDmnIKQko/9Yj/MB
	foNdBnBqL+GbsftjFPjZygJcNnc6wTz8fsKpVLsdUN0h9IIjUbSIcHKUxMZk//oEQe6fkXzi4kV
	yjtVL8xDCP64PyqZXmC7rEhstUXwXWu8Mj+FcZoem6reQNxU6f5AmQV1l1W8jqYC5tizN2UJ/sP
	J6n
X-Received: by 2002:a05:600c:1e8f:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-483c3db3198mr31642645e9.3.1772106684538;
        Thu, 26 Feb 2026 03:51:24 -0800 (PST)
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
Subject: [PATCH v6 01/14] xen/riscv: detect and store supported hypervisor CSR bits at boot
Date: Thu, 26 Feb 2026 12:51:01 +0100
Message-ID: <a17b6a117726904a9384dc7d9cc140672d3b0453.1772016457.git.oleksii.kurochko@gmail.com>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.979];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 57DB31A55CA
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
 xen/arch/riscv/domain.c            | 47 ++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/setup.h |  2 ++
 xen/arch/riscv/setup.c             |  2 ++
 3 files changed, 51 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index b60320b90def..902aaac74290 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -2,9 +2,56 @@
 
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
+        old = csr_read(CSR_##csr); \
+        csr_write(CSR_##csr, (old & ~(mask)) | (mask)); \
+        csr_masks.field = csr_swap(CSR_##csr, old); \
+    } while (0)
+
+    register_t old;
+
+    INIT_CSR_MASK(HEDELEG, hedeleg, ULONG_MAX);
+    INIT_CSR_MASK(HIDELEG, hideleg, ULONG_MAX);
+
+    INIT_CSR_MASK(HENVCFG, henvcfg, _UL(0xE0000003000000FF));
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+    {
+        INIT_CSR_MASK(HSTATEEN0, hstateen0, _UL(0xDE00000000000007));
+        csr_masks.ro_one.hstateen0 = old;
+    }
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


