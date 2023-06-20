Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CFD73728F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551989.861826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyq-0006LO-Ab; Tue, 20 Jun 2023 17:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551989.861826; Tue, 20 Jun 2023 17:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyq-0006I8-3F; Tue, 20 Jun 2023 17:17:24 +0000
Received: by outflank-mailman (input) for mailman id 551989;
 Tue, 20 Jun 2023 17:17:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBeyp-0005iB-A7
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:17:23 +0000
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [2607:f8b0:4864:20::b34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 516987df-0f8e-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 19:17:22 +0200 (CEST)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-bd6d9d7da35so5098134276.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:17:22 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 f81-20020a25cf54000000b00bcc0f2e4f05sm461938ybg.59.2023.06.20.10.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:17:20 -0700 (PDT)
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
X-Inumbo-ID: 516987df-0f8e-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281441; x=1689873441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YD449Sev2tYSUJnmMC+HzxBJLT1Su39PvBIo4ApXUGY=;
        b=adRdWFSbOakGYazV9dcYXomiWWj7+4rJ6o1sZx3SvR8hyPBj+FsOCRxipT6ZXCv51h
         57kB2SqdQvNHyE+E9TzTG/a7nsz3ll0LHU67ZHKSvSgkOqsR7rAgf1AN4M7UF828ddHL
         QlOw1k32tsp/vY9FOVcuWgx5b+RHgeZ7r3WNSnU+0c3SIWg9W87cXrXjoM9BRLUH1lvk
         ot2GiNtfkbvvPAhDYD64MY57bSWNQMGMFiHZ92iLKRWA0O+QIbdZfKenCbdghHnqLMAB
         U+QjDjVGr7jSAXjutlQTdFe6WfZIxtLiMmb9pWtJs3PxU7sk5AwrTKe1jBZcnrDIz81x
         FQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281441; x=1689873441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YD449Sev2tYSUJnmMC+HzxBJLT1Su39PvBIo4ApXUGY=;
        b=KMs3fTXZlw0/OxoYkCVyC4ze72osOUgLvm18aNR8GWIjrctQtk8rmJRaPjsHU8o7F1
         fji1AoZ4eeS7IWMoEbotHc2JpqbYKp7dfxtGlTNP76DzVe7OFxQYVUHRLszeuGSPRXDL
         39wuQUSL6ezYy0coWJUH0cSNv/iEHAFcDmMwrasXAzQTc/PSpbQDAwHkufipbWVImqbT
         vxzPldyPAOFKgs8g787bbW3N/03CxAbDUVHqztD0o32pG2QTRESVf9oiQzX8IWl/10O2
         rDFukEycWLVDnF36tyODuTbTLLLrlGedAooc0Lo7N6DjNvgC7fF6H4H+d+sS/eusARIe
         lApg==
X-Gm-Message-State: AC+VfDzM06HrDI6gMcCU3iA/EPKjqr/ojmI7+tl/wVefy2v0UKF3NVt0
	cfY8dU7DdC0MAk5/ytPT39H3JSHQR5i3Kg==
X-Google-Smtp-Source: ACHHUZ5RtF84snsglSfujdJdWSxsr7g0T2grHUJCkp1rzv3jieejRbWNytcQ3zIPz/2IHBQfkHq10A==
X-Received: by 2002:a25:b09:0:b0:bfe:8a76:18da with SMTP id 9-20020a250b09000000b00bfe8a7618damr15543ybl.49.1687281441220;
        Tue, 20 Jun 2023 10:17:21 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 05/12] hvmloader: add Q35 DSDT table loading
Date: Tue, 20 Jun 2023 13:15:45 -0400
Message-Id: <6eae751cfad220a62f23bc551b78416c66213f38.1687215890.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687215890.git.jupham125@gmail.com>
References: <cover.1687215890.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows to select Q35 DSDT table in hvmloader_acpi_build_tables(). Function
get_pc_machine_type() is used to select a proper table (i440/q35).

As we are bound to the qemu-xen device model for Q35, no need
to initialize config->dsdt_15cpu/config->dsdt_15cpu_len fields.

Added the seabios/ovmf loading here as well.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 tools/firmware/hvmloader/ovmf.c    |  5 +++++
 tools/firmware/hvmloader/seabios.c |  5 +++++
 tools/firmware/hvmloader/util.c    | 13 +++++++++++--
 tools/firmware/hvmloader/util.h    |  2 ++
 4 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/tools/firmware/hvmloader/ovmf.c b/tools/firmware/hvmloader/ovmf.c
index 23610a0717..2945c8a516 100644
--- a/tools/firmware/hvmloader/ovmf.c
+++ b/tools/firmware/hvmloader/ovmf.c
@@ -125,6 +125,11 @@ static void ovmf_acpi_build_tables(void)
         .dsdt_15cpu_len = 0
     };
 
+    if (get_pc_machine_type() == MACHINE_TYPE_Q35) {
+        config.dsdt_anycpu = dsdt_q35_anycpu_qemu_xen;
+        config.dsdt_anycpu_len = dsdt_q35_anycpu_qemu_xen_len;
+    }
+
     hvmloader_acpi_build_tables(&config, ACPI_PHYSICAL_ADDRESS);
 }
 
diff --git a/tools/firmware/hvmloader/seabios.c b/tools/firmware/hvmloader/seabios.c
index 444d118ddb..72aabea130 100644
--- a/tools/firmware/hvmloader/seabios.c
+++ b/tools/firmware/hvmloader/seabios.c
@@ -96,6 +96,11 @@ static void seabios_acpi_build_tables(void)
         .dsdt_15cpu_len = 0,
     };
 
+    if (get_pc_machine_type() == MACHINE_TYPE_Q35) {
+        config.dsdt_anycpu = dsdt_q35_anycpu_qemu_xen;
+        config.dsdt_anycpu_len = dsdt_q35_anycpu_qemu_xen_len;
+    }
+
     hvmloader_acpi_build_tables(&config, rsdp);
     add_table(rsdp);
 }
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index a8685ee23a..ea416ebe10 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -984,8 +984,17 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
     }
     else if ( !strncmp(s, "qemu_xen", 9) )
     {
-        config->dsdt_anycpu = dsdt_anycpu_qemu_xen;
-        config->dsdt_anycpu_len = dsdt_anycpu_qemu_xen_len;
+        if (get_pc_machine_type() == MACHINE_TYPE_Q35)
+        {
+            config->dsdt_anycpu = dsdt_q35_anycpu_qemu_xen;
+            config->dsdt_anycpu_len = dsdt_q35_anycpu_qemu_xen_len;
+        }
+        else
+        {
+            config->dsdt_anycpu = dsdt_anycpu_qemu_xen;
+            config->dsdt_anycpu_len = dsdt_anycpu_qemu_xen_len;
+        }
+
         config->dsdt_15cpu = NULL;
         config->dsdt_15cpu_len = 0;
     }
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index f6a6cc3421..c6747c336d 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -278,7 +278,9 @@ bool check_overlap(uint64_t start, uint64_t size,
                    uint64_t reserved_start, uint64_t reserved_size);
 
 extern const unsigned char dsdt_anycpu_qemu_xen[], dsdt_anycpu[], dsdt_15cpu[];
+extern const unsigned char dsdt_q35_anycpu_qemu_xen[];
 extern const int dsdt_anycpu_qemu_xen_len, dsdt_anycpu_len, dsdt_15cpu_len;
+extern const int dsdt_q35_anycpu_qemu_xen_len;
 
 unsigned long acpi_pages_allocated(void);
 
-- 
2.34.1


