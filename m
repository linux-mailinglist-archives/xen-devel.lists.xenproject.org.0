Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74378A20EA8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 17:34:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878658.1288856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoXS-0007Ag-MX; Tue, 28 Jan 2025 16:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878658.1288856; Tue, 28 Jan 2025 16:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoXS-000740-HZ; Tue, 28 Jan 2025 16:34:10 +0000
Received: by outflank-mailman (input) for mailman id 878658;
 Tue, 28 Jan 2025 16:34:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4cq=UU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tcoXR-00070Z-6u
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 16:34:09 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2371477-dd95-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 17:34:08 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso1177535766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 08:34:08 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6973090d0sm534810966b.18.2025.01.28.08.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 08:34:06 -0800 (PST)
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
X-Inumbo-ID: b2371477-dd95-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738082047; x=1738686847; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2wXYm4vj9zHpf4g1hT+h92PgyCXWbc4DWlhdSJr70A=;
        b=X5s30jRmyfQdoWdWUozrK1M0qmMXOTKAnhppKtURGyqvSyzZwA8t7DaeQUHk5OE1LL
         s2ljVLcMoYP8Ju9usGyUb1+tzI6DU+NXsGrRuJiBCGjD3yCCn0xeIJ4B2l4GGmaxaRSb
         8vm4Z8+tDyjZMH4ZuI4Ge7TxQDu4yXY6ZC9zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738082047; x=1738686847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2wXYm4vj9zHpf4g1hT+h92PgyCXWbc4DWlhdSJr70A=;
        b=AAiRs7ioN6fJtnl1g7KqxGuFRXnzwnACU7Yz2x/H/RKPeYifbeobk1oel3yjjvegb4
         a0AuAqlEwGcu5DOiZmpVL25NacaxPgE31Q55HJKjw1iu2rRiwbis9+ehZqGbgRf5LB5x
         uSYE4Dz2zXSeUW1GpxqT/S34yZpN13apC68AgXHfbJzJ2t7G/jlWeIWfYnoB7R0K2wNq
         S+YQDqLML47PNHV4ANHrFkGiSRQLCfPthbCuDXmGz+ySumUBium/0a7bkRBGhT1UenfU
         7ReFDPs/scXVxrTw/IiXLrZAVEf1vB9gM7DSANrEAFY4dnLbp+Fa5FPr7/J+HlvuU0tV
         48Jw==
X-Gm-Message-State: AOJu0Yx56ZlVY4ACB/55IiSI6BCILig0l9FGpn88vfb65u3BeYasTgm4
	DoJT2uCT9kb9WnPH488PJWjU80aqt7IsGwtddgjYWkF2Z8IKO2k7lNheczcogOOzkHJkWJHUWFJ
	6LA4=
X-Gm-Gg: ASbGnctqDrG7/QCg7k9SK9rL8bvn+MoQPwWvoPkSzVqSb2FqylDDZoHZftzQIW67V+k
	hl72fhZloT4+fo8sThWBQP3X5IitKB18O7+jGXuw56yPj1ZJh2iWO3mpFj3ETtQdVsd6Jpyo70I
	eqaoHEmCos6rLHsW0LjT+k8d3eQOysAmyhJHlZM9cIezgZCUP+fOG0l2SFX5ifqDoWZBkYMMWtS
	x5WnVxV2G+Avk9hQMTnIlr0w/QRoBIQ52kONRWECdUWvig/DFQziNJ4fN/R/rk0WfCUd1v90juU
	B40dXOXafFnaYEs0XR5zFLkX7sOENCcy8pTgRG6l
X-Google-Smtp-Source: AGHT+IEwuL9IleBtGqDhzoL9t0Kye8GCON7QSXArcXKY1+gnfx33mdQmIerjEV/aNAHSm8DDJZDfvA==
X-Received: by 2002:a17:907:72c6:b0:ab2:b84b:2dab with SMTP id a640c23a62f3a-ab38b163149mr5052649466b.30.1738082047389;
        Tue, 28 Jan 2025 08:34:07 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 1/3] tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves
Date: Tue, 28 Jan 2025 16:33:40 +0000
Message-ID: <20250128163342.1491-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
References: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it so the APs expose their own APIC IDs in a lookup table (LUT). We
can use that LUT to populate the MADT, decoupling the algorithm that
relates CPU IDs and APIC IDs from hvmloader.

Modified the printf to also print the APIC ID of each CPU, as well as
fixing a (benign) wrong specifier being used for the vcpu id.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Changes from the v7 version of this patch in the longer topology series:
  * s/cpu_to_x2apicid/cpu_to_apicid/
    * Though, as I already stated, I don't think this is a good idea.
  * Dynamically size cpu_to_apicid rather than using HVM_MAX_VCPUS.
  * Got rid of the ap_callin removal. It's not as trivial if we don't
    want to assume cpu0 always has apicid=0. Part of the complaints on
    the previous versions involved the inability to do that.
  * For debugging sanity, I've added the apicid to the CPU boot printf.
      * Later on, toolstack will choose the APIC IDs and it's helpful
        to know the relationship in the logs.
      * While at it, fix the vcpu specifier s/%d/%u/
  * Check for leaf 0xb while probing for x2apic support.
---
 tools/firmware/hvmloader/smp.c | 43 +++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
index 1b940cefd071..c61ed524f947 100644
--- a/tools/firmware/hvmloader/smp.c
+++ b/tools/firmware/hvmloader/smp.c
@@ -31,9 +31,38 @@
 
 static int ap_callin;
 
+/** True if x2apic support is exposed to the guest. */
+static bool has_x2apic;
+
+/**
+ * Lookup table of (x2)APIC IDs.
+ *
+ * Each entry is populated for its respective CPU as they come online. This is
+ * required for generating the MADT with minimal assumptions about ID
+ * relationships.
+ */
+uint32_t *cpu_to_apicid;
+
+static uint32_t read_apic_id(void)
+{
+    uint32_t apic_id;
+
+    if ( has_x2apic )
+        cpuid(0xb, NULL, NULL, NULL, &apic_id);
+    else
+    {
+        cpuid(1, NULL, &apic_id, NULL, NULL);
+        apic_id >>= 24;
+    }
+
+    return apic_id;
+}
+
 static void cpu_setup(unsigned int cpu)
 {
-    printf(" - CPU%d ... ", cpu);
+    uint32_t apicid = cpu_to_apicid[cpu] = read_apic_id();
+
+    printf(" - CPU%u[%u] ... ", cpu, apicid);
     cacheattr_init();
     printf("done.\n");
 
@@ -104,8 +133,20 @@ static void boot_cpu(unsigned int cpu)
 void smp_initialise(void)
 {
     unsigned int i, nr_cpus = hvm_info->nr_vcpus;
+    uint32_t ecx, max_leaf;
+
+    cpuid(0, &max_leaf, NULL, NULL, NULL);
+    if ( max_leaf >= 0xb )
+    {
+        cpuid(1, NULL, NULL, &ecx, NULL);
+        has_x2apic = (ecx >> 21) & 1;
+        if ( has_x2apic )
+            printf("x2APIC supported\n");
+    }
 
     printf("Multiprocessor initialisation:\n");
+    cpu_to_apicid = scratch_alloc(sizeof(*cpu_to_apicid) * nr_cpus,
+                                  sizeof(*cpu_to_apicid));
     cpu_setup(0);
     for ( i = 1; i < nr_cpus; i++ )
         boot_cpu(i);
-- 
2.48.1


