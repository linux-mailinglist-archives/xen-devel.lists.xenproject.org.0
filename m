Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0BFA599EF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 16:25:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906661.1314072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trf0r-0005Xx-HW; Mon, 10 Mar 2025 15:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906661.1314072; Mon, 10 Mar 2025 15:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trf0r-0005VL-Dy; Mon, 10 Mar 2025 15:25:53 +0000
Received: by outflank-mailman (input) for mailman id 906661;
 Mon, 10 Mar 2025 15:25:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVaD=V5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1trf0p-00055B-RR
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 15:25:51 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f32d9110-fdc3-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 16:25:51 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac2963dc379so169174466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 08:25:51 -0700 (PDT)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2a65c7f7esm147674966b.117.2025.03.10.08.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 08:25:50 -0700 (PDT)
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
X-Inumbo-ID: f32d9110-fdc3-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741620350; x=1742225150; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ECj5KBJOzWkUhWTB7OBmw/GJyhyE2uyUhy/7AFkvkQ=;
        b=HRS8pQHO+bD84zRcWnobYd47MP1pRTWE6RfSXA6vxDF/Z5pNvyGLvHZUyCiK1iJk19
         o/K2Nvzm6F05xGrWcoxRtJ3D578Gbge8kNh6YVKTTlA1XD2U+Bdauabl135FyyqI8OLe
         z6DB04rgVBCLs7xjqhzYGX2AKyDO23rlnC4Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741620350; x=1742225150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ECj5KBJOzWkUhWTB7OBmw/GJyhyE2uyUhy/7AFkvkQ=;
        b=keMpnHu6AvHIe4pkSqOXpVekxbTI7mdAGc0o2ruI5lGL0g3fuyuX0bmporqmmdJDAP
         00va7rZgRR57WKSs7omyxyEhXSn9Pe48uPuwa2vnNAOpEmvHmcUSt3zSzsoc8wwOLPbL
         dj6ZK541OHvRt+ltZFnzWiqrx4gebP+D8vck7ne8dbkSlTBxSu2MbzvVX64r15BfNmr3
         kpLbheFYfvHNAdHjlN4LlIi5uuUVG8/aPK3le/RJD8qPseCzyVkb2HZEQayB6P9joi2K
         vb4eLwVBGHTRs1Oac4k6GPAt2zsTBaJ5vHk72hhZGyfj3/9n0vUwfPXHSe1Umj2X6uCy
         rXzw==
X-Gm-Message-State: AOJu0YxXuBQr0jIvOr6r9OVN/s3H9t5ArYr/9BPESRiwXjAKp5POuKnj
	R1CAfZorWH/1OLEUedKihF4bCuTn5iM+ruvFntoa4JsQEl+f3EsGQtLrS0wcc+v1SYMF1AvpsNI
	pOWQ=
X-Gm-Gg: ASbGncvYxZ6zO6Y59tvDeW4DDFbBOOENw13DJN9Lq+Syxiftios4Daxlb/ML7GOc+mt
	lKUM4GjDD5+cj7d63j7+/W55Dbuh8qXQ9WotbI41y2V8T/rLj2t63i8L6ti6gOpessLbFTxS3iB
	DinMV9C1Vk3xWEjxqs2NiFRBRbi8hHxhmKGXFFpd/xtB3ZQ10lJTgeuZXY/p+PlNQurd2/VL2Tb
	GGdrO8QV/LBWofRHm2k63B9UN70MoshB64Qy6YeVAezLJIGLfCSOtlx1gaYxLZ0Sw0mw8kl1K2K
	6kGoUIV13T1OZFbqBASdQmwTfFPu3de8yDOqtgt1E37SwEyEiJO3CfzQjGGJFq2FVmg=
X-Google-Smtp-Source: AGHT+IHX24V4+oPGtLkU+XSmymuu523TxytSnviC3JXJHb3y8YjqKF7iY9bjrnT6GqlDgQrPwI4q2A==
X-Received: by 2002:a05:6402:5106:b0:5e5:2d5c:4f32 with SMTP id 4fb4d7f45d1cf-5e5e24bb560mr34243804a12.28.1741620350494;
        Mon, 10 Mar 2025 08:25:50 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools: Mark ACPI SDTs as NVS in the PVH build path
Date: Mon, 10 Mar 2025 15:25:23 +0000
Message-ID: <20250310152523.81181-1-alejandro.vallejo@cloud.com>
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
I really, really, really dislike this idea of accessing the MADT from
AML. In time I'll try to implement something to stop doing it, but for
the time being I find it preferable to align libxl to hvmloader rather
than trying to restrict what's reclaimable and what isn't.
---
 tools/firmware/hvmloader/e820.c | 4 ++++
 tools/libs/light/libxl_x86.c    | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

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
index a3164a3077fe..265da8072a59 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -742,7 +742,7 @@ static int domain_construct_memmap(libxl__gc *gc,
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


