Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0653DA274BB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 15:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881635.1291807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfKBp-0001Me-1Y; Tue, 04 Feb 2025 14:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881635.1291807; Tue, 04 Feb 2025 14:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfKBo-0001KW-Tc; Tue, 04 Feb 2025 14:46:12 +0000
Received: by outflank-mailman (input) for mailman id 881635;
 Tue, 04 Feb 2025 14:46:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXrc=U3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tfKBn-0000sX-C0
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 14:46:11 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4c1fc4e-e306-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 15:46:08 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ab6ed8a5a04so940503066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 06:46:08 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47d0f1csm936741566b.70.2025.02.04.06.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 06:46:07 -0800 (PST)
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
X-Inumbo-ID: c4c1fc4e-e306-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738680367; x=1739285167; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i36engQi26IlYqntVoHcuNQbYwqqv+ezxFFDrC+oeZE=;
        b=XQo3vzS5NUOWxJB32sVQVPd2ojs9ZXK7t8RPgInfZ1F/X0HMbuwAsfYFp8GNtenVdZ
         JtTGxJ4xRBpZFgfz4De21kKqyRpoZdWK3Ju3gRNNyw0/S+dpnmfNXslBkSbhArY2Hv3l
         LyV9JHpQSGrTc9hKbWmsg5uJnQiLFMhxUrZNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680367; x=1739285167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i36engQi26IlYqntVoHcuNQbYwqqv+ezxFFDrC+oeZE=;
        b=iYiCOuLXLsslACLgohiW/iC3tGmfOIc0QY8Hr5iyEbJYklCqZe4hPoH9Qrx03bghRD
         huemH4ElCyppNwXjwrvj1F98RAVqrrnKu/2sob97i8weJFrTLheYJIBBnH1gZTF73Zza
         gSpPYrWdE8Zfuo63REv68a3F5gG6sDq6XkDQZtxMrYtdXCerZtO6aB8VuqgTS5aWSHWo
         NHV5htxm4Riuv+kae7tT9CVP9AyFw180tBTWE0ldZ90I0WeINpmDuUmUo5VPPrMuGqGy
         SHwMP9rhJ3BkPNhT74XXznPx+78v5BdmdEI69430xTBKzHX5wytNLNUgsGTE1HfSb4+h
         Kp5Q==
X-Gm-Message-State: AOJu0YxHUR0jv9/O+kJrpyIC/9pYA1OWeab3r/SPGF4ecIogI3CPDBov
	NOmZ3WRGYgzT73vLtuJ6cWsxF1uu1nrV1k/+caCxMD7yuLXjHzDUINKxOrGhJFOnVD+0Ok88Ebz
	inwo=
X-Gm-Gg: ASbGnct/J7vWLLXEQ7NgMlUljt6q42HNUsEdvJjYlJuL4OD04AADfFjeL6/89jQ/IjW
	ISsgYrdoWKuyBH2aZEyiQ638Kuo/TJQ4CTmLxcA4kWRyDEGEu0gk9I2fciJdhqtsc1/giOkiSwQ
	k59mAnmDDxtupV85Vkvm27gCEma9DPJkR2/inu7M2Pc4u/T+YXBEhe2qlAEWcy9mLTOwKuqdOo0
	Ut7MMWRM4g5JENHcZr1PiRkpVSf658V32IxXh3+N5/tC8P4QrxHrmBFiLIGE9Ar3Zeqrt8N6zqS
	xkKiwQYzfryyp9mXoaUsB1s+/22JF3HXql1hJ+h8Qq3AC0sCBjVqtLZE21sl6Q==
X-Google-Smtp-Source: AGHT+IGzswSJlUIIsN+U+g3iwzXL1oUoM3aqYpEzHnQLIhtighAICJm+BB0l7QXbDMd7uBUDvXAflQ==
X-Received: by 2002:a17:907:94c5:b0:ab3:3b81:876f with SMTP id a640c23a62f3a-ab6cfc8719cmr2963369866b.4.1738680367496;
        Tue, 04 Feb 2025 06:46:07 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 1/2] tools/hvmloader: Retrieve APIC IDs from the APs themselves
Date: Tue,  4 Feb 2025 14:45:41 +0000
Message-ID: <20250204144542.7399-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204144542.7399-1-alejandro.vallejo@cloud.com>
References: <20250204144542.7399-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it so the APs expose their own APIC IDs in a lookup table (LUT). We
can use that LUT to populate the MADT, decoupling the algorithm that
relates CPU IDs and APIC IDs from hvmloader.

Modified the printf to also print the APIC ID of each CPU, as well as
fixing a (benign) wrong specifier being used for the vcpu id.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v1->v2:
  * Removed "(x2)" from the comment of cpu_to_apicid.
  * Added "APIC ID" to the printed string on AP boot up.

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
index 1b940cefd071..341fd6e0b61a 100644
--- a/tools/firmware/hvmloader/smp.c
+++ b/tools/firmware/hvmloader/smp.c
@@ -31,9 +31,38 @@
 
 static int ap_callin;
 
+/** True if x2apic support is exposed to the guest. */
+static bool has_x2apic;
+
+/**
+ * Lookup table of APIC IDs.
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
+    printf(" - CPU%u APIC ID %u ... ", cpu, apicid);
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


