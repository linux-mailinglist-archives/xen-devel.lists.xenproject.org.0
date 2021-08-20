Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E9F3F2B96
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 13:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169467.309588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH36R-0007Lt-My; Fri, 20 Aug 2021 11:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169467.309588; Fri, 20 Aug 2021 11:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH36R-0007IX-Jq; Fri, 20 Aug 2021 11:54:27 +0000
Received: by outflank-mailman (input) for mailman id 169467;
 Fri, 20 Aug 2021 11:54:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1tc=NL=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mH36Q-0007Ha-5t
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 11:54:26 +0000
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 904fd6b3-48ed-4393-854f-5a487dceaf27;
 Fri, 20 Aug 2021 11:54:25 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id q21so16866304ljj.6
 for <xen-devel@lists.xenproject.org>; Fri, 20 Aug 2021 04:54:25 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id z13sm532779ljj.43.2021.08.20.04.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 04:54:23 -0700 (PDT)
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
X-Inumbo-ID: 904fd6b3-48ed-4393-854f-5a487dceaf27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g6dP90LhiVMec/QpqzfPTZ0GUWlCB10odQ+8whyOwLY=;
        b=qV/ZJ2oTQQixmUh1PSEBUPRhMLKkQhetJ8DgGDnFuDcvwPflW61yV1KkOAMjWyfzsj
         iiZ6CpwGtwCb36f725h1vI1in/ttIif7W6vCOWk6weHDT2bS4F1dW0EtAwg1C4CwHLyn
         B6kIgowk2oIZSkcK6re7CKDUXe3EXcNAAFObUc+soiEAQg67CVV/1OAvHaA7V5u8uG2h
         IjveTMlPjx0BTXmEsCY0g1WGj7rVRGTHJkHXxF52DqEMg3kyXZy+vrIswoZBCT3l4g77
         v8bLSNL75jaD7Wi1g26/VxQ0pXe/CSNqpImshSzQmG5kRgKWuqnZCU4MPZs8Uc1tP0HS
         Ejww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g6dP90LhiVMec/QpqzfPTZ0GUWlCB10odQ+8whyOwLY=;
        b=oNIsMRb1qvIafXRhCnnC26aeRTGUgutK4tMy1nv9tKOOyfYy5wD6f+yHCcFD5g7Qwl
         RmnCSmN38/wI4goyeKwpvJ9miTyTptZ0oHxj4iZZe1joMORPCkWQOKZJTLM4TsmHe2OT
         2lFu0YHtIkcjRRqa0mjPbIGoqHLta0JjrRQKa+lMHvbxIRpDqFHMa4BBGaGYKhQhVl2P
         c6RuP10o6H2rIFhOWWHLr83cerSIJYExw5fI6MRAcQLC6KG3i/5Ri1A2vzwFFy+Tr7R9
         rB7pIOKl4Ck6VSKj+P7wGNKHOPXUnEcLdtpVH8NHX6aKrAf8OuIQmkHWY7QQrW8OyrJo
         PtBA==
X-Gm-Message-State: AOAM5326j3YEbixAdOmCYCysQcVQS2SYtq/RJ6vV9u6G8LmY21DDFQsV
	NaHS6VsjCYeblZOGjsnegKU=
X-Google-Smtp-Source: ABdhPJwtAtZCFblSYr+UzaxuqpNe/hdK1iEXM4gqWh2MrNqkBBpxSM1HJN5T18d/NbKFhfqNCWznig==
X-Received: by 2002:a05:651c:30d:: with SMTP id a13mr14917993ljp.393.1629460464383;
        Fri, 20 Aug 2021 04:54:24 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	julien@xen.org,
	sstabellini@kernel.org,
	wl@xen.org,
	xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH] ns16550: Properly gate Exar PCIe UART cards support
Date: Fri, 20 Aug 2021 14:54:22 +0300
Message-Id: <20210820115422.2185145-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

This fixes Arm build which doesn't have ns16550 PCI support.

ns16550.c:313:5: error: implicit declaration of function 'enable_exar_enhanced_bits' [-Werror=implicit-function-declaration]
  313 |     enable_exar_enhanced_bits(uart);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 5ffd37db2ff6 ("ns16550: add Exar PCIe UART cards support")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/char/ns16550.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index b777c8711ee0..e2c24082c368 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -308,7 +308,7 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     /* Handle the DesignWare 8250 'busy-detect' quirk. */
     handle_dw_usr_busy_quirk(uart);
 
-#ifdef CONFIG_HAS_PCI
+#ifdef NS16550_PCI
     /* Enable Exar "Enhanced function bits" */
     enable_exar_enhanced_bits(uart);
 #endif
-- 
2.25.1


