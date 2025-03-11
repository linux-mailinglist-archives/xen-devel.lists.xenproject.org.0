Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6332CA5BC48
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:29:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907516.1314744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvvY-000772-I6; Tue, 11 Mar 2025 09:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907516.1314744; Tue, 11 Mar 2025 09:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvvY-00074Y-FG; Tue, 11 Mar 2025 09:29:32 +0000
Received: by outflank-mailman (input) for mailman id 907516;
 Tue, 11 Mar 2025 09:29:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QaIb=V6=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1trvvX-00074S-34
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:29:31 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54b688ab-fe5b-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 10:29:29 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so1929535f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 02:29:29 -0700 (PDT)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cea8076fcsm107537875e9.15.2025.03.11.02.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 02:29:27 -0700 (PDT)
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
X-Inumbo-ID: 54b688ab-fe5b-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741685368; x=1742290168; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o6kGi2KNZEpB+B2Uj0wCA+EPjTkzkrFJQGj+GGsjFuk=;
        b=km9UVRcepixVlFDF6mjSqsbhm+oYkKZ7MVrrhTPAIqA8rhvh1JNbqJvHp/Q4PGlx6w
         mt8ugLhozMKrZz4b15foUK26CIlTGk8ptmfANA71sFlmBLciZ5/OwqissY6vQdVjOfg6
         UO+sP7bw6nXXN2gMUOV/wXTe7HtlAwIAGDAgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741685368; x=1742290168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6kGi2KNZEpB+B2Uj0wCA+EPjTkzkrFJQGj+GGsjFuk=;
        b=ZJFCsmo2AsEeX+QitOfKsOPGGm+bNXTQnW2HsQIDp/baDI4ztrwRASoX1CU/1C2iI3
         XRv8gLWkesWYZUmqQs6h8jTjDzQlmtBOB3F3b9CeCX6hpa6/Gp4g22n70ec6WjC8Rz/0
         jVjuu3/dm1c1Jy97K5GG+xrpsrp5xO9IAcmvjGVj3pKONWl0H/xE7Qh3wXcUE1/J7ETd
         kLwcmlcJiEqM5awIuiBHplkDKcaCFKiexWv8idWx94l5alhJa+sqjN3VyRRV8Jdi/3AZ
         ELsDRhbouEfH1+kyJtGKNJLHsx1EBF6QDg2c/RITvEN1XQzRPQtfFcdtu57dSZBdPV5f
         Vefw==
X-Gm-Message-State: AOJu0YyIgR/96jnwaKiPAUxudprnZwz2aN6RTA61Pqb/yugXyWw0R1QO
	5M6w1AqWjOXnc+U9FhYCupNTzkvRnLlCix4aBt1kUjjQo6O29P0FXI/9CS4Z2+OcqCcBejYb7/L
	7Dc4=
X-Gm-Gg: ASbGnctLUZyjKP/5Mro/JWVp7DPQkmkYgHsGdTcAcdtRc84Hd05EYOOAptKrYVTqYtV
	dJRaqwCvOZ0CXzF2KcOWB5jxJM1iqQQjb5ttDSflM4scsPdl7tz4P7NSS3Z42njJiBdJ0kcaiRR
	wP2obnaN1iPyGjf6PZG87/NKhd8bXfR2b7SgcA7d5Qx+udn4hJ6jvih0YzJ9A/VO4+QsbYZ2fzP
	vmXkro9V43sPSHA9jKcTo+PZJo37LnKGr/VRSpzVXxjVY1KebO5OwB+q0doO94BZAB0EIgX4H58
	XS67/gh8C6ngKETJH3eASSmkfpC2sl7XCjRj+ybwakxTbyVrLSQRQs8sq/fHqDZVA1I=
X-Google-Smtp-Source: AGHT+IFYxYSccKCSk4YC94i7jWhMBuG0WLPAFlsfCF4aQTGaX6MA8VsJdtYcb/4H3Pq7pMFxD8N4Dg==
X-Received: by 2002:a5d:6482:0:b0:385:fc70:7f6 with SMTP id ffacd0b85a97d-39132d2affemr11135374f8f.7.1741685368123;
        Tue, 11 Mar 2025 02:29:28 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] tools: Mark ACPI SDTs as NVS in the PVH build path
Date: Tue, 11 Mar 2025 09:29:05 +0000
Message-ID: <20250311092905.991-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit cefeffc7e583 marked ACPI tables as NVS in the hvmloader path
because SeaBIOS may otherwise just mark it as RAM. There is, however,
yet another reason to do it even in the PVH path. Xen's incarnation of
AML relies on having access to some ACPI tables (e.g: _STA of Processor
objects relies on reading the processor online bit in its MADT entry)

This is problematic if the OS tries to reclaim ACPI memory for page
tables as it's needed for runtime and can't be reclaimed after the OSPM
is up and running.

Fixes: de6d188a519f("hvmloader: flip "ACPI data" to "ACPI NVS" type for ACPI table region)"
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v1->v2:
  * Copy explanatory comment in hvmloader/e820.c to its libxl_x86.c counterpart

---
 tools/firmware/hvmloader/e820.c |  4 ++++
 tools/libs/light/libxl_x86.c    | 17 ++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/tools/firmware/hvmloader/e820.c b/tools/firmware/hvmloader/e820.c
index c490a0bc790c..86d39544e887 100644
--- a/tools/firmware/hvmloader/e820.c
+++ b/tools/firmware/hvmloader/e820.c
@@ -210,6 +210,10 @@ int build_e820_table(struct e820entry *e820,
      * space reuse by an ACPI unaware / buggy bootloader, option ROM, etc.
      * before an ACPI OS takes control. This is possible due to the fact that
      * ACPI NVS memory is explicitly described as non-reclaimable in ACPI spec.
+     *
+     * Furthermore, Xen relies on accessing ACPI tables from within the AML
+     * code exposed to guests. So Xen's ACPI tables are not, in general,
+     * reclaimable.
      */
 
     if ( acpi_enabled )
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index a3164a3077fe..2ba96d12e595 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -737,12 +737,27 @@ static int domain_construct_memmap(libxl__gc *gc,
         nr++;
     }
 
+    /*
+     * Mark populated reserved memory that contains ACPI tables as ACPI NVS.
+     * That should help the guest to treat it correctly later: e.g. pass to
+     * the next kernel on kexec.
+     *
+     * Using NVS type instead of a regular one helps to prevent potential
+     * space reuse by an ACPI unaware / buggy bootloader, option ROM, etc.
+     * before an ACPI OS takes control. This is possible due to the fact that
+     * ACPI NVS memory is explicitly described as non-reclaimable in ACPI spec.
+     *
+     * Furthermore, Xen relies on accessing ACPI tables from within the AML
+     * code exposed to guests. So Xen's ACPI tables are not, in general,
+     * reclaimable.
+     */
+
     for (i = 0; i < MAX_ACPI_MODULES; i++) {
         if (dom->acpi_modules[i].length) {
             e820[nr].addr = dom->acpi_modules[i].guest_addr_out & ~(page_size - 1);
             e820[nr].size = dom->acpi_modules[i].length +
                 (dom->acpi_modules[i].guest_addr_out & (page_size - 1));
-            e820[nr].type = E820_ACPI;
+            e820[nr].type = E820_NVS;
             nr++;
         }
     }
-- 
2.48.1


