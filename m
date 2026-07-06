Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 99PyHbXQS2omawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA19712ECB
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ycbog57H;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355497.1610349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliM-0000Nm-Gy; Mon, 06 Jul 2026 15:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355497.1610349; Mon, 06 Jul 2026 15:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliM-0000Ld-5v; Mon, 06 Jul 2026 15:58:34 +0000
Received: by outflank-mailman (input) for mailman id 1355497;
 Mon, 06 Jul 2026 15:58:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliK-0008TC-5a
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliJ-00AcWu-HN
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:31 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd09b-bab6-0a2a0a5309dd-0a2a450b8a36-10
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:31 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0a7-ac48-0a2a450b0019-d155802ab062-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:31 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-493b1710405so19850345e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:31 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353511; x=1783958311; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMUxY16+EjQiunTHmrdOH7xzPAM+NcHF5gtkkVq7+74=;
        b=Ycbog57HnGLQpKPY0FJBgCPUJkIfFFDS9NQlxihMMiGuqvKj3c8CHzJW9YhQ+ZOhSG
         O7sKQyPzHOlT6FI8vTyZowSpve/NhUK1CcYCDBIes0qhZ4oYutBvTAWAr/iQ5i0Xhkfp
         z7qwHT4DyKNrU3LSAXaNmYud3I6RNEVmSe0QH10XZb+5V1qToGvtdvj2daAtC5VfU26/
         sGlXchqPU9Bpet9md938u/C6xAJRUHljFHd3mXIQBu2l49TF2DDFuj5bVcZwZ/T8xQoe
         tD50KM9FyQHBLaRDEFl+q2saxl/2C/xruhVM/vHy8w9pxAFfLLZ69ojFq2GJjkIrccOM
         jzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353511; x=1783958311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PMUxY16+EjQiunTHmrdOH7xzPAM+NcHF5gtkkVq7+74=;
        b=iM2cd1gLtdrrc0AiGB49xWFGcRMMJoX5tD4eLrabSSnqwrbNpN7uR2seUr/AKXGgNQ
         0vGCPDbt9SQS8i5hyjvRUkf6GUaCAAzjtxfLcz4ryUGeXQQvTQu98YlVHpUW9y9oXC8b
         hzBFc26gKic5NP6QMBNIJg51Rnhncnq/ocbIvaz5O7QR131vMW+Slg672h6gzR/YY3m+
         TYdTpPcQpLEwArCGq2hny+V+Ic7mS2+pTZ3SrDPPsBxjnaueGUTUanEZOdrnA4Y7YA6T
         7zqGXMphqEjAGlRtRTLfef0+aKjG5F4XpFHd6bhKGGRyQ/W1fH3AGKzVTrgvA2oDpf0i
         Eudw==
X-Gm-Message-State: AOJu0YxyKjcDVg8Vedyqf33fjy0puzYvrJnKOnlt/BkR4zKOe00pov58
	knlI3R48As0yZ2FVe+sIEZIGmcWy5Vqsw7/Gn7EiIyEk0Q5VBAc8z+15EAWh9w==
X-Gm-Gg: AfdE7cmpgWKX8h7LPkwvvkbaebVjruvYdJUVhDz0RLMfDDnJOvvI81LnSUnUkxweRTu
	SxDao/9z2YBzUTbUk9E7TtaqvXIiy1sqLA5ZWIZnAN8eAYbhopU1QJxmbiCobiX7mtBbxv7Zca9
	QzxIfyKIVodV1lQ9gg77RAURAYnlCJxq6dedAIGgJqxj5lmIiZ7l8Weh3HXpIsiRJQ/UqhjeAMg
	Dhr6zWKxO+EgAi1apSj4nhLt2t27ix8J+v/UaMQ4U3tDbXfvNlbC3XJ4UEjisv6ZTZW91yF+nbQ
	/GHf4BVqKwGdvx3LWTFCb6mblD/O5HJi3BbZc1Y1fD3KiAjOOOLEiegQG1CBKRiSjQXR/lZjrBD
	6yCncCyUUs9WCqfPlpHI89/TFArV/rU8Zq7nnncqU9He+BeTw7D7gXArUjstKbaPf7Sadgg37T3
	gOST7CLVQEX+9Uk69CoIz+XYKbU5LhW69K91fcYZKSqaKMVROCbwDgqvq0bg==
X-Received: by 2002:a7b:cc81:0:b0:493:cc01:807b with SMTP id 5b1f17b1804b1-493df0a0861mr10499455e9.38.1783353510795;
        Mon, 06 Jul 2026 08:58:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
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
Subject: [PATCH v5 09/26] xen/riscv: introduce guest riscv,isa string
Date: Mon,  6 Jul 2026 17:57:50 +0200
Message-ID: <dc486923b5313c64cf383575d25c58c9af9e5eae.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1783353511-A5523220-BF0D7000/10/73395122804
X-purgate-type: spam
X-purgate-size: 11522
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
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,xenproject.org:url];
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
X-Rspamd-Queue-Id: 0DA19712ECB

Introduce build_guest_isa_str() to generate the riscv,isa string to be
passed to the guest via the Device Tree riscv,isa property.

Introduce the per-domain guest ISA bitmap, populated during domain
creation by calling init_guest_isa().

Introduce struct riscv_isa_ext_entry with a new guest_supported field
to filter out ISA extensions that should not be exposed to guests:

- f/d/q/v: FPU and vector context save/restore are not yet implemented
  for guests.
- Z*inx are not exposed either: they aren't in riscv_isa_ext[], so they
  can never be set in riscv_isa and thus never reach a guest, and no
  current hardware/guest-OS advertises or expects them. Supporting them
  would be cheaper than F/D/Q (FP values stay in integer registers Xen
  already context-switches), but is left as future work.
- h: Nested virtualisation is not supported.
- sstc: Xen owns the supervisor timer; guests must use SBI.
- svade: Xen manages hardware A/D bit updates in stage-2 page tables.
- svpbmt: Page-based memory types are not yet wired up in stage-2 code.

Drop __initconst for riscv_isa_ext[] as it can be used after init stage
by init_guest_isa().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v5:
- Introduce struct riscv_isa_ext_entry with a guest_supported field and
  RISCV_ISA_EXT_ENTRY(name, guest_supp) macro for riscv_isa_ext[],
  replacing the ad-hoc guest_unsupp bitmap and init_guest_unsupp().
  Every entry now carries an explicit true/false decision, enforced at
  compile time.
- init_guest_isa() builds d->arch.isa by iterating riscv_isa_ext[]
  directly instead of using bitmap_andnot() against guest_unsupp.
- init_guest_isa() changed to void as it can no longer fail.
- Drop isa_str from struct arch_domain; the ISA string does not need to
  persist over the domain lifetime. build_guest_isa_str() is made
  non-static and declared in cpufeature.h for use when building the
  guest device tree.
- Updated the fix of underflow in build_guest_isa_str().
- Drop unnecessary empty line in cpufeature.h before enum riscv_isa_ext_id.
---
Changes in v4:
 - Add an explicit overflow guard in build_guest_isa_str(): return
   -ENOSPC when buf is non-NULL and total >= size, to avoid the
   size - total underflow being passed to snprintf().
 - Expand the commit message to explain why Zfinx/Zdinx/Zqinx are not
   added to guest_unsupp (not in riscv_isa_ext[], so never set in
   riscv_isa nor exposed to a guest; left as future work)
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
 xen/arch/riscv/cpufeature.c             | 132 +++++++++++++++++++-----
 xen/arch/riscv/domain.c                 |   2 +
 xen/arch/riscv/include/asm/cpufeature.h |   6 ++
 xen/arch/riscv/include/asm/domain.h     |   3 +
 4 files changed, 119 insertions(+), 24 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 92235fdfd5ab..5002ddc92a22 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -14,6 +14,7 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/sections.h>
 
 #include <asm/cpufeature.h>
@@ -34,6 +35,19 @@ struct riscv_isa_ext_data {
     .name = #ext_name,                          \
 }
 
+struct riscv_isa_ext_entry {
+    unsigned int id;
+    const char *name;
+    bool guest_supported;
+};
+
+#define RISCV_ISA_EXT_ENTRY(ext_name, guest_supp)       \
+{                                                       \
+    .id              = RISCV_ISA_EXT_ ## ext_name,      \
+    .name            = #ext_name,                       \
+    .guest_supported = guest_supp,                      \
+}
+
 /* Host ISA bitmap */
 static __ro_after_init DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);
 
@@ -120,29 +134,30 @@ static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
  * and strncmp() is used in match_isa_ext() to compare extension names instead
  * of strncasecmp().
  */
-const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
-    RISCV_ISA_EXT_DATA(i),
-    RISCV_ISA_EXT_DATA(m),
-    RISCV_ISA_EXT_DATA(a),
-    RISCV_ISA_EXT_DATA(f),
-    RISCV_ISA_EXT_DATA(d),
-    RISCV_ISA_EXT_DATA(q),
-    RISCV_ISA_EXT_DATA(c),
-    RISCV_ISA_EXT_DATA(h),
-    RISCV_ISA_EXT_DATA(zicntr),
-    RISCV_ISA_EXT_DATA(zicsr),
-    RISCV_ISA_EXT_DATA(zifencei),
-    RISCV_ISA_EXT_DATA(zihintpause),
-    RISCV_ISA_EXT_DATA(zihpm),
-    RISCV_ISA_EXT_DATA(zba),
-    RISCV_ISA_EXT_DATA(zbb),
-    RISCV_ISA_EXT_DATA(zbs),
-    RISCV_ISA_EXT_DATA(smaia),
-    RISCV_ISA_EXT_DATA(smstateen),
-    RISCV_ISA_EXT_DATA(ssaia),
-    RISCV_ISA_EXT_DATA(sstc),
-    RISCV_ISA_EXT_DATA(svade),
-    RISCV_ISA_EXT_DATA(svpbmt),
+const struct riscv_isa_ext_entry riscv_isa_ext[] = {
+    RISCV_ISA_EXT_ENTRY(i,            true),
+    RISCV_ISA_EXT_ENTRY(m,            true),
+    RISCV_ISA_EXT_ENTRY(a,            true),
+    RISCV_ISA_EXT_ENTRY(f,            false),
+    RISCV_ISA_EXT_ENTRY(d,            false),
+    RISCV_ISA_EXT_ENTRY(q,            false),
+    RISCV_ISA_EXT_ENTRY(c,            true),
+    RISCV_ISA_EXT_ENTRY(v,            false),
+    RISCV_ISA_EXT_ENTRY(h,            false),
+    RISCV_ISA_EXT_ENTRY(zicntr,       true),
+    RISCV_ISA_EXT_ENTRY(zicsr,        true),
+    RISCV_ISA_EXT_ENTRY(zifencei,     true),
+    RISCV_ISA_EXT_ENTRY(zihintpause,  true),
+    RISCV_ISA_EXT_ENTRY(zihpm,        true),
+    RISCV_ISA_EXT_ENTRY(zba,          true),
+    RISCV_ISA_EXT_ENTRY(zbb,          true),
+    RISCV_ISA_EXT_ENTRY(zbs,          true),
+    RISCV_ISA_EXT_ENTRY(smaia,        true),
+    RISCV_ISA_EXT_ENTRY(smstateen,    true),
+    RISCV_ISA_EXT_ENTRY(ssaia,        true),
+    RISCV_ISA_EXT_ENTRY(sstc,         false),
+    RISCV_ISA_EXT_ENTRY(svade,        false),
+    RISCV_ISA_EXT_ENTRY(svpbmt,       false),
 };
 
 static const struct riscv_isa_ext_data __initconst required_extensions[] = {
@@ -181,7 +196,7 @@ static void __init match_isa_ext(const char *name, const char *name_end,
 
     for ( unsigned int i = 0; i < riscv_isa_ext_count; i++ )
     {
-        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
+        const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];
 
         /*
          * `ext->name` (according to initialization of riscv_isa_ext[]
@@ -480,6 +495,74 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
     return test_bit(id, isa_bitmap);
 }
 
+int build_guest_isa_str(char *buf, size_t size,
+                        const unsigned long *isa_bitmap)
+{
+    char *p = buf;
+    size_t left = size;
+    int total;
+
+#if defined(CONFIG_RISCV_32)
+    total = snprintf(p, left, "rv32");
+#elif defined(CONFIG_RISCV_64)
+    total = snprintf(p, left, "rv64");
+#else
+# error "Unsupported RISC-V bitness"
+#endif
+
+    if ( total < 0 )
+        return total;
+
+    if ( buf )
+    {
+        if ( (size_t)total >= left )
+            return -ENOSPC;
+
+        p += total;
+        left -= total;
+    }
+
+    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
+    {
+        const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];
+        int ret;
+
+        if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
+            continue;
+
+        ret = snprintf(p, left, "%s%s",
+                       ext->id >= RISCV_ISA_EXT_BASE ? "_" : "",
+                       ext->name);
+        if ( ret < 0 )
+            return ret;
+
+        total += ret;
+
+        if ( buf )
+        {
+            if ( (size_t)ret >= left )
+                return -ENOSPC;
+
+            p += ret;
+            left -= ret;
+        }
+    }
+
+    return total;
+}
+
+void init_guest_isa(struct domain *d)
+{
+    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
+    {
+        const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];
+
+        if ( ext->guest_supported &&
+             riscv_isa_extension_available(NULL, ext->id) )
+            __set_bit(ext->id, d->arch.isa);
+    }
+}
+
 void __init riscv_fill_hwcap(void)
 {
     unsigned int i;
@@ -527,4 +610,5 @@ void __init riscv_fill_hwcap(void)
     if ( !all_extns_available )
         panic("Look why the extensions above are needed in "
               "https://xenbits.xenproject.org/docs/unstable/misc/riscv/booting.txt\n");
+
 }
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 2819ff4e7c92..c9933147595e 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -308,6 +308,8 @@ int arch_domain_create(struct domain *d,
     if ( is_idle_domain(d) )
         return 0;
 
+    init_guest_isa(d);
+
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 0c48d57a03bb..e26f5f0b66fb 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -5,6 +5,7 @@
 #ifndef __ASSEMBLER__
 
 #include <xen/stdbool.h>
+#include <xen/types.h>
 
 /*
  * These macros represent the logical IDs of each multi-letter RISC-V ISA
@@ -44,7 +45,12 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_MAX
 };
 
+struct domain;
+
 void riscv_fill_hwcap(void);
+void init_guest_isa(struct domain *d);
+int build_guest_isa_str(char *buf, size_t size,
+                        const unsigned long *isa_bitmap);
 
 bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
                                    enum riscv_isa_ext_id id);
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 6044ce0feee0..235b20f8a6ba 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -7,6 +7,7 @@
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
+#include <asm/cpufeature.h>
 #include <asm/guest-layout.h>
 #include <asm/p2m.h>
 #include <asm/vtimer.h>
@@ -94,6 +95,8 @@ struct arch_domain {
     struct p2m_domain p2m;
 
     struct paging_domain paging;
+
+    DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
 };
 
 #include <xen/sched.h>
-- 
2.54.0


