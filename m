Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3FCA27871
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 18:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881749.1291924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfMlk-0006IR-0G; Tue, 04 Feb 2025 17:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881749.1291924; Tue, 04 Feb 2025 17:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfMlj-0006FV-Pu; Tue, 04 Feb 2025 17:31:27 +0000
Received: by outflank-mailman (input) for mailman id 881749;
 Tue, 04 Feb 2025 17:31:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXrc=U3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tfMli-00069x-AX
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 17:31:26 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db4225d1-e31d-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 18:31:24 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso67872215e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 09:31:24 -0800 (PST)
Received: from CSGPROD108744.Home (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c102ac9sm16137748f8f.29.2025.02.04.09.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 09:31:23 -0800 (PST)
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
X-Inumbo-ID: db4225d1-e31d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738690283; x=1739295083; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgoSralsaqhirBRapBktqNUa0D2GysAhNdu/v1g4OCo=;
        b=B0thRuFoq8EUqAJbW/VEH720NchbmQe8JpkoXVa1/qHXIh3h39fRTgklmBPaFYAVJj
         1bmwVYVE95zsiEaJGmy+fZQZ0sZ2IsIDbbrQLHFMp69OAB8YhHmSMbgzOVjYhvOF4RtZ
         p2b5DR8lLnOL3yC2Mg9LbTwFX/M687+yZpdIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690283; x=1739295083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgoSralsaqhirBRapBktqNUa0D2GysAhNdu/v1g4OCo=;
        b=AFHAS/882PQoRsjit2xaTXnCw7ACCXmghXl4lX4RHYvgotdE8hYMY6T9dnSzIuUy3u
         sI/MARUzEaO5Svn+TaOs7dm3RsRDlA9edGbmQBO23xcrGbBKWQs7nOY6eDfTl3y4O7ik
         YVdxKGaDdhwUSc+CgKT++kkxiv/tzLJuruUlR3nnOtoQcEtqzUPJJIOzuYO9Q6rCDoT/
         7iLUW7c0myxNtU3WOKUYG12HItIHmfcePadjhfj9noK5XMeBv3qqAEXxXa6Coev87p2d
         dJ8ZLDOHHssFBJW8dxTsIhJTNokniV8YwDD8ni1iv73YKmvUvzraIP/01lU+od/GHxaQ
         9klw==
X-Gm-Message-State: AOJu0YwUW40IwhvonsNk1IbNjmZuI/vPG8KeqYP5xj33ToPcLbxjPpRA
	3RoH051NkN76H3ikM9E9p5h8YrrQqErwkXPr6Ejs2cz7gGdx39uhnSd2VGYhZFAH8dlQVDEFu4v
	AFvk=
X-Gm-Gg: ASbGncv4jHHj2K84iCoOk4Wp/Hhuwvbfv28yeME5CC3pQLzJx5/OzwywiAeK7xQnXQh
	+OL1h18gNS5/0i7ns+3ajMMWvS2ngZO/ym9ukSvD0BGkIvtL9C+oO3AY8xPJ9DU+hxwNtrlXLM8
	gtvIh/A8mL6ac24t8z7aibqC6Yg/yZzfRWzWYwWyyb5VByvH4Q1QBNXO4TAvHgW6aMvRjxpx+fL
	goLnqLxptS4HJ8ejYXe3A1vuYpezS2kIAlXT+XhemY8HM8b0PHoyaWFX5O4GZ60mnKA2y5PlFJP
	LnEzNaMPusMy1aJwAhlgwpp27mAcXmlqgZ6IksVLq8+UFa35fAUGh3F3WQ==
X-Google-Smtp-Source: AGHT+IH6X6R2AxQBlPRb618z7+KrnNLc6cr17S6oqlnZ0rgHuV7dz8ffkuIFABO4r01nmrMVYagVFQ==
X-Received: by 2002:a05:600c:4ecb:b0:434:a815:2b5d with SMTP id 5b1f17b1804b1-438dc40db89mr207051105e9.24.1738690283620;
        Tue, 04 Feb 2025 09:31:23 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 1/2] tools/hvmloader: Retrieve APIC IDs from the APs themselves
Date: Tue,  4 Feb 2025 17:31:19 +0000
Message-ID: <20250204173120.56598-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204173120.56598-1-alejandro.vallejo@cloud.com>
References: <20250204173120.56598-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it so the APs expose their own APIC IDs in a lookup table (LUT). We
can use that LUT to populate the MADT, decoupling the algorithm that
relates CPU IDs and APIC IDs from hvmloader.

Modified the printf to also print the APIC ID of each CPU, as well as
fixing a (benign) wrong specifier being used for the vcpu id.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2->v3:
  * Moved extern from patch2 into patch1 for (transient) MISRA
    compliance.

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
 tools/firmware/hvmloader/config.h |  2 ++
 tools/firmware/hvmloader/smp.c    | 43 ++++++++++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index cd716bf39245..b32bcbf4a1f2 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -48,6 +48,8 @@ extern uint8_t ioapic_version;
 
 #define IOAPIC_ID           0x01
 
+extern uint32_t *cpu_to_apicid;
+
 #define LAPIC_BASE_ADDRESS  0xfee00000
 #define LAPIC_ID(vcpu_id)   ((vcpu_id) * 2)
 
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


