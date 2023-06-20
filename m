Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D88173728E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551988.861819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyp-0006I5-Tw; Tue, 20 Jun 2023 17:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551988.861819; Tue, 20 Jun 2023 17:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyp-0006Em-QS; Tue, 20 Jun 2023 17:17:23 +0000
Received: by outflank-mailman (input) for mailman id 551988;
 Tue, 20 Jun 2023 17:17:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBeyn-0005iB-Ky
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:17:21 +0000
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [2607:f8b0:4864:20::b2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5074ba68-0f8e-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 19:17:21 +0200 (CEST)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-bd61dd9a346so5007021276.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:17:21 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 f81-20020a25cf54000000b00bcc0f2e4f05sm461938ybg.59.2023.06.20.10.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:17:19 -0700 (PDT)
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
X-Inumbo-ID: 5074ba68-0f8e-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281439; x=1689873439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrsL9N7k7kk6HzmUebq9GcrGzTo0jj1csEdzXuASa80=;
        b=r458G9N//EmRZupWk7DFyj1OcVfX+K2vo0GSHriPM9JysWQHtkfXbvRj2A57h3lOjf
         fyFoq+3f0BVPNnuB1GeEmj/6CcCBiMO/W8RJ/TBs3DSbf4xFu1qKxMJjmkdM3NaRZl4j
         4HXeHSEI/PQxaehhqkYli3zoDMt2BuSwvx5PMO53c/ovICZvLlin/rnODXN8m3GV12ab
         JXNy2GdcDcW895FJ4HzQE/51Ykts4VqZbOr00AoJm2cq5Yrl3WRFZonHLAcU69svswLb
         baaI2MY0TvafazzJkZNgZbxLlWQT8Rj90jRCnnpZmT8VHR9g0X7I8IpMFPmfiNuu6XPI
         HPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281439; x=1689873439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrsL9N7k7kk6HzmUebq9GcrGzTo0jj1csEdzXuASa80=;
        b=Gpa/lRkANV2QKrWNEYqYMEr1ohfsTKUg9Ax2B7NZxqE9Eb8lwHrheY1zVSNsM6lI1+
         HYBPSPWa61CFbY5VG1XVXxY3uBJMss92+um6on1jUT+5MwPwakly/Hq7HxufOkOcUcgv
         zMHE/1xPOuKW28q5DWC+yR4k3uXccTW3P9ItjUuq0Bwk7CvNNAVGu3eFjhj5lxoI/vDZ
         q/oviWRYa+eG7KxIebbO7v40fXt2oPukokVdRokqqOLQFizczETD/EKLEePLqNC/hDTz
         iHiY5HDk0cuY2ThUmu0CxwKHTbYh2DJEP4v36O5SpyoatxQ+jAZO7X4y0x5XlkHggSa1
         iALQ==
X-Gm-Message-State: AC+VfDyALFAw0aOumqhsufb5KjyxmX2VQ9LJd0axds2Dj1RiiW448KH1
	d9NBer+ZAiAvY3Hv2KdEz7yZaUWwQla23g==
X-Google-Smtp-Source: ACHHUZ4hfo79N+MtJ+Ae9j/hgIrf2qXfKtJUxQu6OxiIhiXFuIgZUxkSS/4hU8G5OWESk5KBKcsNbA==
X-Received: by 2002:a25:ae48:0:b0:bcf:ef73:1431 with SMTP id g8-20020a25ae48000000b00bcfef731431mr9113565ybe.26.1687281439615;
        Tue, 20 Jun 2023 10:17:19 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 04/12] hvmloader: add ACPI enabling for Q35
Date: Tue, 20 Jun 2023 13:15:44 -0400
Message-Id: <0aad12501165eaba2a3b987b37779ff7ced6ce82.1687215890.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687215890.git.jupham125@gmail.com>
References: <cover.1687215890.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to turn on ACPI for OS, we need to write a chipset-specific value
to SMI_CMD register (sort of imitation of the APM->ACPI switch on real
systems). Modify acpi_enable_sci() function to support both i440 and Q35
emulation.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 tools/firmware/hvmloader/hvmloader.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index c58841e5b5..ef0e66b214 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -259,8 +259,17 @@ static const struct bios_config *detect_bios(void)
 static void acpi_enable_sci(void)
 {
     uint8_t pm1a_cnt_val;
+    uint8_t acpi_enable_val;
+
+#define SMI_CMD_IOPORT       0xb2
+#define PIIX4_ACPI_ENABLE    0xf1
+#define ICH9_ACPI_ENABLE     0x02
+
+    if (get_pc_machine_type() == MACHINE_TYPE_Q35)
+        acpi_enable_val = ICH9_ACPI_ENABLE;
+    else
+        acpi_enable_val = PIIX4_ACPI_ENABLE;
 
-#define PIIX4_SMI_CMD_IOPORT 0xb2
 #define PIIX4_ACPI_ENABLE    0xf1
 
     /*
@@ -269,7 +278,7 @@ static void acpi_enable_sci(void)
      */
     pm1a_cnt_val = inb(ACPI_PM1A_CNT_BLK_ADDRESS_V1);
     if ( !(pm1a_cnt_val & ACPI_PM1C_SCI_EN) )
-        outb(PIIX4_SMI_CMD_IOPORT, PIIX4_ACPI_ENABLE);
+        outb(SMI_CMD_IOPORT, acpi_enable_val);
 
     pm1a_cnt_val = inb(ACPI_PM1A_CNT_BLK_ADDRESS_V1);
     BUG_ON(!(pm1a_cnt_val & ACPI_PM1C_SCI_EN));
-- 
2.34.1


