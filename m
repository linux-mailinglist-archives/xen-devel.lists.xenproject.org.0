Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id evriIYOCMmq51AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F6A698F1D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hWz6kQeX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340087.1601126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHa-0001oN-Bd; Wed, 17 Jun 2026 11:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340087.1601126; Wed, 17 Jun 2026 11:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHa-0001hT-2o; Wed, 17 Jun 2026 11:18:10 +0000
Received: by outflank-mailman (input) for mailman id 1340087;
 Wed, 17 Jun 2026 11:18:08 +0000
Received: from [194.145.224.10] (helo=mx.expurgate.net)
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHX-0001Nt-Vw
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHX-008nOJ-Ck
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32826d-5cb7-0a2a0a5109dd-0a2a450abe50-16
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:07 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32826f-56b3-0a2a450a0019-d155dd35ccb3-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:07 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45ef41adbc1so4125840f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:07 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:06 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781695087; x=1782299887; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ch0GvgcfTVIREUJMfYYzdF78jAptI5pBiQNF2XBPBjM=;
        b=hWz6kQeXUSi+6ulbe5Fe2XulHAW5NUCrV0xe009JxBdNgpc0WCm/rjcuxNfgFK9RjA
         t1ZC02UJTsSSJCkfoFMaBPChqeY6y3WMlgozf8U8iiv40suFSK6COjR9lRwsfEsqkUXD
         XBzT85CbF0WoYpoda6voeGw84YrFQl6UUZ/nxs2+ynhKR2oCX3HYrIJv2uEZQG0ZzdXu
         xCD/otYOQ2tYCRToWZqisgHrby6dCXZudnKCVPGCzst4JmO4mPUCTrmYzotUHZXr9R8S
         YrdKXd4dRQnTkDa/e+XmEUKfudqFQHLJbImWw5hzqiUIg7xDe4hUWmxPFrVpYOrHd4l6
         az1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695087; x=1782299887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ch0GvgcfTVIREUJMfYYzdF78jAptI5pBiQNF2XBPBjM=;
        b=PDiyQpeDHNLOqvffTSKsXZmVMDhFla5qYC1DFBkI+DpeHUT9nVYY6oWYnfe2ErG/LR
         4y6BxBv2cXuNAFR17navQPcDL0qFHn4QOSVeKQkVToEbkOAPiueA26aXkAEu1XfU1TAu
         vN5/AF7QASejwG+Rt1hx2wfQFTwuby/ZymABTv1ABnZsm9wgNNJbCeAsNn4aLX/eJLbd
         e3fX7+TJQg+PAWCUpumzEmMXsC3p19HtB7nuW3lrZWdivGDXIDDpA6wpN/1vrK1WcmVh
         LmU8NUo780xncYQIL4a4of2dQz7lwqkYh82wJCsGXRUZRz31ttcSB3Ct/zSOxM4KmoLt
         JB/w==
X-Gm-Message-State: AOJu0YyddL5RUk4XdOyAXiCDdGAD1dmP3n7JOBCqB7/X14xvz2QGYfkP
	HfHMO8czQp9Ae0FlMI/3v+vr4j0yb4Oyu3Qvrh/iNyZT1OGyuB+sSFL0kVdp2g==
X-Gm-Gg: Acq92OF8bKKB+wocIQO//xnodA0N1Q7SLoS3k683T/98g4LTeo/cphVoV+3kHZL94zC
	x0RI6pYde8IiuQV0m3aZoyWln8F0Aw+pJb5ACRQwLM42tQncWIkaVvNcRshhjCNmbKGPe0xWumK
	3ZibLvMyk03AzFkdSIHpj6qnVHJzp5q+QYcvUkPobTrDCzngWd1lzTWObtG3vqvtkb67xsOMJtV
	+DSTPrV/3UdOqjqLIci0q6ESmWTZM2WmiziHVFxhYdswkmDdpjV+LlWIDdw4OIZfJB0+VFGr/2z
	FguF+nZIbSL8C+PS8ZYvjwlF1s9/dlUnCY0kjun/1xJJZZ/LKUKZciZZyUhbSpDejOLRiVyHR0O
	e1L85u4/WoKdGxfpMfGtPgodsz/hjytRuwBTE8pTedAqOuxYPzVh4XkWlqV+0xHnDidDacNWPVe
	UnxnZ7LrLPCERECOyeOHnfw6YeAms4fKxp8zSa8viI8Sv2HdylfonyU9m1kw==
X-Received: by 2002:a05:600c:3b0f:b0:491:731c:892a with SMTP id 5b1f17b1804b1-492333df11bmr57593815e9.35.1781695086510;
        Wed, 17 Jun 2026 04:18:06 -0700 (PDT)
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
Subject: [PATCH v3 06/23] xen/riscv: introduce guest riscv,isa string
Date: Wed, 17 Jun 2026 13:17:34 +0200
Message-ID: <3fb06376e057fa99b0df78e97761b8cff56ca9eb.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1781695087-7C47E8B7-5FA21D51/10/73395122804
X-purgate-type: spam
X-purgate-size: 8053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0F6A698F1D

Introduce generation of the riscv,isa string passed to the guest via the
Device Tree riscv,isa property.

Introduce the per-domain isa string and guest isa bitmap, populated
during domain creation by calling init_guest_isa().

Introduce guest_unsupp to filter out ISA extensions that should not be
exposed to guests:

- f/d/q/v: FPU and vector context save/restore are not yet implemented
  for guests.
- h: Nested virtualisation is not supported.
- sstc: Xen owns the supervisor timer; guests must use SBI.
- svade: Xen manages hardware A/D bit updates in stage-2 page tables.
- svpbmt: Page-based memory types are not yet wired up in stage-2 code.

Drop __initconst for riscv_isa_ext() as it can be used after init stage
by init_guest_isa().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - s/set_bit/__set_bit in init_guest_unsupp() as atomicity isn't needed at
   init time.
 - Drop RISCV_GUEST_ISA_STR_MAX; allocate isa_str dynamically with
   xvmalloc_array().
 - Drop "guest" prefix from d->arch.guest_isa and d->arch.guest_isa_str.
 - Introduce build_guest_isa_str() using snprintf(NULL, 0, ...) to determine
   the needed buffer size; init_guest_isa() calls it once for sizing and once
   to fill, keeping both in a single function so they can't go out of sync.
 - Scope ret inside the loop; initialize total directly from the prefix
   snprintf().
 - Merge "_" separator and extension name into a single snprintf() with
   "%s%s".
 - Replace ASSERT with an explicit error check: if the fill call returns a
   different length, free isa_str and return -EINVAL.
---
Changes in v2:
 - s/guest_unsupp_bmp/guest_unsupp.
 - Drop guest_isa_str.
 - Provide init_guest_isa() instead of polluting match_isa_ext().
 - Drop xlen.
 - Add the comment about guest_unsupp.
 - Update the way how guest_unsupp is init-ed.
 - Drop __initconst for riscv_isa_ext[] as it is used in init_guest_isa()
   which isn't marked as __init as it could be used after init stage.
---
---
 xen/arch/riscv/cpufeature.c             | 85 ++++++++++++++++++++++++-
 xen/arch/riscv/domain.c                 |  3 +
 xen/arch/riscv/include/asm/cpufeature.h |  4 ++
 xen/arch/riscv/include/asm/domain.h     |  4 ++
 4 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 92235fdfd5ab..a56c28b6c99f 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -14,7 +14,9 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/sections.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
@@ -120,7 +122,7 @@ static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
  * and strncmp() is used in match_isa_ext() to compare extension names instead
  * of strncasecmp().
  */
-const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
+const struct riscv_isa_ext_data riscv_isa_ext[] = {
     RISCV_ISA_EXT_DATA(i),
     RISCV_ISA_EXT_DATA(m),
     RISCV_ISA_EXT_DATA(a),
@@ -128,6 +130,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
     RISCV_ISA_EXT_DATA(d),
     RISCV_ISA_EXT_DATA(q),
     RISCV_ISA_EXT_DATA(c),
+    RISCV_ISA_EXT_DATA(v),
     RISCV_ISA_EXT_DATA(h),
     RISCV_ISA_EXT_DATA(zicntr),
     RISCV_ISA_EXT_DATA(zicsr),
@@ -160,6 +163,12 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
     RISCV_ISA_EXT_DATA(svpbmt),
 };
 
+/*
+ * Everything in riscv_isa_ext[] which shouldn't be exposed to guests should
+ * appear here.
+ */
+static __ro_after_init DECLARE_BITMAP(guest_unsupp, RISCV_ISA_EXT_MAX);
+
 static bool __init is_lowercase_extension_name(const char *str)
 {
     /*
@@ -480,6 +489,78 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
     return test_bit(id, isa_bitmap);
 }
 
+static int build_guest_isa_str(char *buf, size_t size,
+                               const unsigned long *isa_bitmap)
+{
+    int total;
+
+#if defined(CONFIG_RISCV_32)
+    total = snprintf(buf, size, "rv32");
+#elif defined(CONFIG_RISCV_64)
+    total = snprintf(buf, size, "rv64");
+#else
+#   error "Unsupported RISC-V bitness"
+#endif
+
+    if ( total < 0 )
+        return total;
+
+    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
+    {
+        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
+        int ret;
+
+        if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
+            continue;
+
+        ret = snprintf(buf ? buf + total : NULL,
+                       buf ? size - total : 0, "%s%s",
+                       ext->id >= RISCV_ISA_EXT_BASE ? "_" : "",
+                       ext->name);
+        if ( ret < 0 )
+            return ret;
+        total += ret;
+    }
+
+    return total;
+}
+
+int init_guest_isa(struct domain *d)
+{
+    int len;
+
+    bitmap_andnot(d->arch.isa, riscv_isa, guest_unsupp,
+                  RISCV_ISA_EXT_MAX);
+
+    len = build_guest_isa_str(NULL, 0, d->arch.isa);
+    if ( len < 0 )
+        return len;
+
+    d->arch.isa_str = xvmalloc_array(char, len + 1);
+    if ( !d->arch.isa_str )
+        return -ENOMEM;
+
+    if ( build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa) != len )
+    {
+        XVFREE(d->arch.isa_str);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static void __init init_guest_unsupp(void)
+{
+    __set_bit(RISCV_ISA_EXT_f, guest_unsupp);
+    __set_bit(RISCV_ISA_EXT_d, guest_unsupp);
+    __set_bit(RISCV_ISA_EXT_q, guest_unsupp);
+    __set_bit(RISCV_ISA_EXT_v, guest_unsupp);
+    __set_bit(RISCV_ISA_EXT_h, guest_unsupp);
+    __set_bit(RISCV_ISA_EXT_sstc, guest_unsupp);
+    __set_bit(RISCV_ISA_EXT_svade, guest_unsupp);
+    __set_bit(RISCV_ISA_EXT_svpbmt, guest_unsupp);
+}
+
 void __init riscv_fill_hwcap(void)
 {
     unsigned int i;
@@ -527,4 +608,6 @@ void __init riscv_fill_hwcap(void)
     if ( !all_extns_available )
         panic("Look why the extensions above are needed in "
               "https://xenbits.xenproject.org/docs/unstable/misc/riscv/booting.txt\n");
+
+    init_guest_unsupp();
 }
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 2819ff4e7c92..e4a8c27ea9cb 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -308,6 +308,9 @@ int arch_domain_create(struct domain *d,
     if ( is_idle_domain(d) )
         return 0;
 
+    if ( (rc = init_guest_isa(d)) != 0 )
+        goto fail;
+
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 0c48d57a03bb..866e0f6e7bb7 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -17,6 +17,7 @@
  */
 #define RISCV_ISA_EXT_BASE  26
 
+
 enum riscv_isa_ext_id {
     RISCV_ISA_EXT_a,
     RISCV_ISA_EXT_c,
@@ -44,7 +45,10 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_MAX
 };
 
+struct domain;
+
 void riscv_fill_hwcap(void);
+int init_guest_isa(struct domain *d);
 
 bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
                                    enum riscv_isa_ext_id id);
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 6044ce0feee0..459896c04b41 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -7,6 +7,7 @@
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
+#include <asm/cpufeature.h>
 #include <asm/guest-layout.h>
 #include <asm/p2m.h>
 #include <asm/vtimer.h>
@@ -94,6 +95,9 @@ struct arch_domain {
     struct p2m_domain p2m;
 
     struct paging_domain paging;
+
+    DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+    char *isa_str;
 };
 
 #include <xen/sched.h>
-- 
2.54.0


