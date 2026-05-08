Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOtbBK/2/WlilQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:43:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943E74F7F7B
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:43:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303739.1577031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQe-0005sO-GA; Fri, 08 May 2026 14:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303739.1577031; Fri, 08 May 2026 14:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQe-0005od-9n; Fri, 08 May 2026 14:43:48 +0000
Received: by outflank-mailman (input) for mailman id 1303739;
 Fri, 08 May 2026 14:43:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQc-0005Xa-OM
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:43:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQc-007XVC-50
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:43:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf689-2eae-0a2a0a5409dd-0a2a45028638-42
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:46 +0200
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a2-af86-0a2a45020019-d155da34ac9a-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:46 +0200
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-bc264a50e7fso393112866b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:43:46 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778251425; x=1778856225; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xB7Os2MChM3TR6KXilRQ9GrrVvrhO9KwN/leWcO7waQ=;
        b=ZTcXv4As0mhUaqbZ/HCiD4KCkNRCRLOq6m8vItlSOxVdh7axaljw69rd4bBoNx9fcX
         d8nz+qwhshOSN0ssUUnupXbPGxSqbLV5J0slMxfEKMMSRGQDaQ4AQKAsB9YGw48E46tG
         GLEiC6bkOcgBqHrHZQu3lI97yCVsdZYU8Gp4gT/lNdgsYHr3xGsPxoaqnHZLh5a+cTeJ
         nc0nh9c37EycI3l9LjVqBq+Ipf2eEJ8F0GG9BZzAixykNcnEhZqXTs4DEcp5gxnLsm2M
         Qcu0oyeuWCyL8tGCLDJtNZb0xwgMLWv089s+oPzw8rHzYnVibF9abDidlXWX2yPBpkUD
         +naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251425; x=1778856225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xB7Os2MChM3TR6KXilRQ9GrrVvrhO9KwN/leWcO7waQ=;
        b=iURBWlcKczyx27XgWhjSqIPN55vKijCCHRrBDYjhqh4dDPgcwEcuihhEXXu2qDeCMp
         hKyFth5fi7Eb4nMw8O/OrIhE6eWQHVz9Sf9ln8uz0+Pzj5y7AWhq+ntQ+sVkbyerIVz1
         94U551Kxu7S/4p7Cj6UTePnJSXF+s6mhPpN/8kIXCdgLmX9vIAqLKoVaBbU1li9WKHvk
         AuMMNGY1EEuT5VVr8rhDkIJxwDwcYZEVU5GKqIR86/7aTwwWctOeiHWUW4tIZfVTCQdH
         6y6NfWzUqtuUe+uofKEUu0BUCfOr0RWaF4KH2DWqv/2Yq9JKGIDekmhyWe8vu+rZ69fR
         g59g==
X-Gm-Message-State: AOJu0YwSnrCnaQ1NBQbNJZdHstZlx7sKk+jFjQHbu5qmxX2lzhAikwyN
	ZORp352So6bMLBNiJ02Wi9MxVuHCtjj7j10l1sbeEPobkx4KbBI7bo4+awVkJA==
X-Gm-Gg: AeBDieuUnjT0pjJB/ronluEqj1QRYZzCl4ksI7wsGInjMob7I5IgQjwxj73zdfUzfX7
	QWx0Ek0/3jKQ2h4WKOBxP3y+xyGA/9mVadY69jlyTQsOu3vTYD8msOGVaJStWTv4NRNsDWfgmpM
	oEOah/Ebe2xGw/5BEEK0TH6egaSyvpggNPm50R+1gu1cyGLuY0FsZM8J+wgI9CJFZXhS0WXOPHh
	Bs0tiEhnpWshB96OIZRq+pgHQfq5ct47nv6rywxUmAU9wzrAaKNsTkzgry07cLmhMhbfhWmotDL
	Hfl2n3LMCgRqL0PiQQ3gyNM57m3raEXQsxv1cQnxykuh57N2uqtnM0Ryh/C+HPekzaQQFr0dGv5
	D1E5KDQNXxnXZESjP6ibkaWSGDAJLDAwOzm+mAUhfAA2OzYBoiHJCIwji+dLlTfjrZRIgmv3L4f
	/wIA5aluQMDkDReHP3dehHKAo/6TwVQhVgASe4xHrrPDZS+7xrwRoWnjvwqwErY9CX6Ek0Sd6wW
	nKn5Y42z4/yReI=
X-Received: by 2002:a17:906:f59e:b0:bc6:5f97:8f90 with SMTP id a640c23a62f3a-bcaa9f60b9amr189903266b.3.1778251425147;
        Fri, 08 May 2026 07:43:45 -0700 (PDT)
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
Subject: [PATCH v2 05/26] xen/riscv: introduce guest riscv,isa string
Date: Fri,  8 May 2026 16:43:07 +0200
Message-ID: <b2d4f3f7f049837a25bc00bfb1d3da8b984a8b5a.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778251426-80D7F161-4FE5235E/10/73395122804
X-purgate-type: spam
X-purgate-size: 6692
X-Rspamd-Queue-Id: 943E74F7F7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,xenproject.org:url];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

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
 xen/arch/riscv/cpufeature.c             | 59 ++++++++++++++++++++++++-
 xen/arch/riscv/domain.c                 |  3 ++
 xen/arch/riscv/include/asm/cpufeature.h |  5 +++
 xen/arch/riscv/include/asm/domain.h     |  4 ++
 4 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 92235fdfd5ab..618592e6096a 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -14,6 +14,7 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/sections.h>
 
 #include <asm/cpufeature.h>
@@ -120,7 +121,7 @@ static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
  * and strncmp() is used in match_isa_ext() to compare extension names instead
  * of strncasecmp().
  */
-const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
+const struct riscv_isa_ext_data riscv_isa_ext[] = {
     RISCV_ISA_EXT_DATA(i),
     RISCV_ISA_EXT_DATA(m),
     RISCV_ISA_EXT_DATA(a),
@@ -128,6 +129,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
     RISCV_ISA_EXT_DATA(d),
     RISCV_ISA_EXT_DATA(q),
     RISCV_ISA_EXT_DATA(c),
+    RISCV_ISA_EXT_DATA(v),
     RISCV_ISA_EXT_DATA(h),
     RISCV_ISA_EXT_DATA(zicntr),
     RISCV_ISA_EXT_DATA(zicsr),
@@ -160,6 +162,12 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
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
@@ -480,6 +488,53 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
     return test_bit(id, isa_bitmap);
 }
 
+int init_guest_isa(struct domain *d)
+{
+    char *buf = d->arch.guest_isa_str;
+    size_t len = sizeof(d->arch.guest_isa_str);
+
+    bitmap_andnot(d->arch.guest_isa, riscv_isa, guest_unsupp,
+                  RISCV_ISA_EXT_MAX);
+
+#if defined(CONFIG_RISCV_32)
+    if ( snprintf(buf, len, "rv32") >= len )
+        return -ENOBUFS;
+#elif defined(CONFIG_RISCV_64)
+    if ( snprintf(buf, len, "rv64") >= len )
+        return -ENOBUFS;
+#else
+#   error "Unsupported RISC-V bitness"
+#endif
+
+    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
+    {
+        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
+
+        if ( !riscv_isa_extension_available(d->arch.guest_isa, ext->id) )
+            continue;
+
+        if ( ext->id >= RISCV_ISA_EXT_BASE && strlcat(buf, "_", len) >= len )
+            return -ENOBUFS;
+
+        if ( strlcat(buf, ext->name, len) >= len )
+            return -ENOBUFS;
+    }
+
+    return 0;
+}
+
+static void __init init_guest_unsupp(void)
+{
+    set_bit(RISCV_ISA_EXT_f, guest_unsupp);
+    set_bit(RISCV_ISA_EXT_d, guest_unsupp);
+    set_bit(RISCV_ISA_EXT_q, guest_unsupp);
+    set_bit(RISCV_ISA_EXT_v, guest_unsupp);
+    set_bit(RISCV_ISA_EXT_h, guest_unsupp);
+    set_bit(RISCV_ISA_EXT_sstc, guest_unsupp);
+    set_bit(RISCV_ISA_EXT_svade, guest_unsupp);
+    set_bit(RISCV_ISA_EXT_svpbmt, guest_unsupp);
+}
+
 void __init riscv_fill_hwcap(void)
 {
     unsigned int i;
@@ -527,4 +582,6 @@ void __init riscv_fill_hwcap(void)
     if ( !all_extns_available )
         panic("Look why the extensions above are needed in "
               "https://xenbits.xenproject.org/docs/unstable/misc/riscv/booting.txt\n");
+
+    init_guest_unsupp();
 }
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 669dd27d79a3..041aed176f32 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -303,6 +303,9 @@ int arch_domain_create(struct domain *d,
     if ( is_idle_domain(d) )
         return 0;
 
+    if ( (rc = init_guest_isa(d)) != 0 )
+        goto fail;
+
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 0c48d57a03bb..42d13d9dbdbe 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -17,6 +17,8 @@
  */
 #define RISCV_ISA_EXT_BASE  26
 
+#define RISCV_GUEST_ISA_STR_MAX 256
+
 enum riscv_isa_ext_id {
     RISCV_ISA_EXT_a,
     RISCV_ISA_EXT_c,
@@ -44,7 +46,10 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_MAX
 };
 
+struct domain;
+
 void riscv_fill_hwcap(void);
+int init_guest_isa(struct domain *d);
 
 bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
                                    enum riscv_isa_ext_id id);
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 6044ce0feee0..664b0b9f9129 100644
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
+    DECLARE_BITMAP(guest_isa, RISCV_ISA_EXT_MAX);
+    char guest_isa_str[RISCV_GUEST_ISA_STR_MAX];
 };
 
 #include <xen/sched.h>
-- 
2.54.0


