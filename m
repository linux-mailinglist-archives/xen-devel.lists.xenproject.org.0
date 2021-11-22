Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C64F458B6F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 10:28:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228708.395816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp5cl-0002AR-4u; Mon, 22 Nov 2021 09:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228708.395816; Mon, 22 Nov 2021 09:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp5cl-00028O-1P; Mon, 22 Nov 2021 09:28:31 +0000
Received: by outflank-mailman (input) for mailman id 228708;
 Mon, 22 Nov 2021 09:28:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UJ+P=QJ=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mp5cj-0001sQ-Li
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 09:28:29 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d1eba2f-4b76-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 10:28:28 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id f18so77828877lfv.6
 for <xen-devel@lists.xenproject.org>; Mon, 22 Nov 2021 01:28:28 -0800 (PST)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f14sm1040024lfv.180.2021.11.22.01.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 01:28:27 -0800 (PST)
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
X-Inumbo-ID: 8d1eba2f-4b76-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PxEeon2P6LCD+Co00Mq24LYfnu7Q7XWANBpcKw0CI/c=;
        b=XfgtjN+KuNzkPXLaAjPHsZmKN97TNq6Pt6ks3wDi4EokKJBglb2eXyXaX4MdyHgvo9
         ZL73iuFh7292TF9rOwxKuWyxYmko8brqSEzgKlrOqPhAD1Nimiz0Qms1QjV0Xg09R/NI
         ateystA8Dfy6uh+ueEoZKpj4oxg2c/BbjC9bHSOt84YVSQXMZ23FDEN3YMmhU7iHOqGH
         Yi10jSFpFkzb+PObzcttE4OAZwfznNu/JBivjGwYtlihIHwHovftVht9ua0PYlFvCLOB
         rT/FREl8pcnm2ajx22YJYMfKVh9hkp7PmVepc4fBJxg8GmtQNdQ8CZXhd2azBDBYYqwS
         4HRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PxEeon2P6LCD+Co00Mq24LYfnu7Q7XWANBpcKw0CI/c=;
        b=Sgatlg2yAbUAufaKFoTCM8mkKSh5eE0VWctYmI4KHFCf7mIaCkD5UIX76FTN+DKd4J
         LsomHnsO0BipR1a2gJJBQqPK7zo7Z7rUsTrrhLxv7ddpLvuVWbVn0pu6ddniMtDsV7DA
         c1Buw5X1GivLy2vwbWjsx7htrn/p7HZEQi18eblDsbTGrHGsZb2LmT/C/ylgBcIeu7JZ
         Rl8Aljne2vGhXvXQYuFr/YM16Duc4PHmr/1VsqXaqTKzyPoyz7gafBppz4875VzVRgLQ
         8ic+WTcMaN+ooUCEf3gg8dbiDrC/dzHxZGbS6yMMD0RCbxIZ1NEGdRFJwozMQfSXSigf
         jOlg==
X-Gm-Message-State: AOAM530z/ByI8ZDxKj8o/Bg6fsO8TmTYD67qnrqQGbGo50dqBOI2DeTj
	QXy96qGbdWFE0Kk5vwVxSqVVUljF/QDqkQ==
X-Google-Smtp-Source: ABdhPJz84tBoAiwcAGKoRzgvOF9p8soczNM8fHTTMkXcAjZ/si9Lw1Ayth2JBrt03HMPbUgz9QtDew==
X-Received: by 2002:a05:6512:3195:: with SMTP id i21mr55844167lfe.50.1637573307971;
        Mon, 22 Nov 2021 01:28:27 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	jbeulich@suse.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 2/2] vpci: use named rangeset for BARs
Date: Mon, 22 Nov 2021 11:28:25 +0200
Message-Id: <20211122092825.2502306-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122092825.2502306-1-andr2000@gmail.com>
References: <20211122092825.2502306-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Use a named range set instead of an anonymous one, but do not print it
while dumping range sets for a domain.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/vpci/header.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 40ff79c33f8f..82a3e50d6053 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -206,12 +206,16 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
 static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 {
     struct vpci_header *header = &pdev->vpci->header;
-    struct rangeset *mem = rangeset_new(NULL, NULL, 0);
+    struct rangeset *mem;
+    char str[32];
     struct pci_dev *tmp, *dev = NULL;
     const struct vpci_msix *msix = pdev->vpci->msix;
     unsigned int i;
     int rc;
 
+    snprintf(str, sizeof(str), "%pp", &pdev->sbdf);
+    mem = rangeset_new(NULL, str, RANGESETF_no_print);
+
     if ( !mem )
         return -ENOMEM;
 
-- 
2.25.1


