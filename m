Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4DBC09F7D
	for <lists+xen-devel@lfdr.de>; Sat, 25 Oct 2025 22:10:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1151233.1481908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCkZq-0003Bm-8d; Sat, 25 Oct 2025 20:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151233.1481908; Sat, 25 Oct 2025 20:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCkZq-000398-5Q; Sat, 25 Oct 2025 20:09:26 +0000
Received: by outflank-mailman (input) for mailman id 1151233;
 Sat, 25 Oct 2025 20:09:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aHFQ=5C=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vCkZn-000392-Th
 for xen-devel@lists.xenproject.org; Sat, 25 Oct 2025 20:09:23 +0000
Received: from mail-yx1-xb12d.google.com (mail-yx1-xb12d.google.com
 [2607:f8b0:4864:20::b12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e08c03b-b1de-11f0-980a-7dc792cee155;
 Sat, 25 Oct 2025 22:09:21 +0200 (CEST)
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-63e35e48a27so3289725d50.0
 for <xen-devel@lists.xenproject.org>; Sat, 25 Oct 2025 13:09:21 -0700 (PDT)
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
X-Inumbo-ID: 7e08c03b-b1de-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761422960; x=1762027760; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rsTuzccq5BBMJUG6ObPUHlp6hFKmAerwIxImdU/w9aw=;
        b=JFhwc9XhAyHMZNHxpgxwVHjpqyOAChaUDZoN9IJ33bxB9RaPToLW1LOnuAnUckaBHP
         TVF24FznVo6m+p+kd1GBQe8pfAnJoeY1SgEL700324wXOkVPX9b9JECfZLQGNybNviPV
         ySIa4WMhmATjNSWYdmN3a1F9CqD9lDqUQBE634xg5pdq/sHMBrk7BLrdnzXfIy5GWhQX
         q57sazno/CC6uGQaKAlrr+qfQ5berUsPuBDnu4mRBqrlzBCz42De6PURtzeriRGCGbVf
         HQyRcxuiFpmK/U1r8SDGIh6Su3D1YUzY4O9Rfkl3AVbaApyCnlwg9qNe4as8qdvJlDKA
         aZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761422960; x=1762027760;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rsTuzccq5BBMJUG6ObPUHlp6hFKmAerwIxImdU/w9aw=;
        b=DLLNH6Wqvj2EDF2cKW4X6+yQkTtfGnc9A4pqAKFqi7mp183BZwUgvQRRgiulyMMO4U
         RVAUkn5r62Pg7QCGI9/Ldgy0SRAtbXxzOVlNG5E/LOAroBVyTBdyppF4821+XG3wixjO
         xz3922QnDcz5wjjsvsQKYJBV0G31bVsRpEo0uA4FQqjWTXfHSbgBzOQsveQHZND7lf+l
         7jXQvIFRHUYXHKAI/YgZaGmT6anVa7gRDgmjlqjlWuojnUajPKQUdmqZhcrMGcyZsDNl
         plY+QcoAC3XOgC7dtjx5/FfyjllEyUd4pZx/ovyDITzcg+JDR54aE8SxwJCyeOFrubjz
         6NYw==
X-Gm-Message-State: AOJu0YyZSeUs0vurC4Z1yx4GY6tZMpnYtsi3DOCbV4X54pOowEmgM184
	g6yhP/1c+GiVU/1BaQS4XlKZXIX2txwD1pQbUSblIVWBXnsFKvFkksnQcBgETRpb6xA+8uT0/88
	8RiERjhHWYnyCJ+Z6ixScVP1QPjuhJOTICiSr
X-Gm-Gg: ASbGncsElyV4nKTAp1KQRMWyoB2mGYS9JkV1LRL7aEaY2TuJg+cvqojjASk+gtUYNjr
	zMcqo9ZDU9r3Y5sroHA1C/fM/TqqUu+NLIJXjewH+2QgRru8jUpfhNzZMmazfaEoZYmVwyjKskQ
	RsurZjxNtJdqCP5nuJn6CSj+/3Vjt0fK7kEo3WD9Y2hSJzlgdf2RMhHOHv9r7QjRHLs1NsSi09o
	Mq7SFIj9bXLosgzFPJywhjfzsr7MglfOFI/hMZswspIfS8MyEMZtx6g9WWK
X-Google-Smtp-Source: AGHT+IEPJLFh+9PuUvoA8kwP4K0mNmrcllMgyWgkTlwYzLHdppceX0an36fMdS+ugtCHXaIzXatBiKv9QQXVUNEod5A=
X-Received: by 2002:a05:690e:1593:10b0:63b:5b6e:2967 with SMTP id
 956f58d0204a3-63e16109f8bmr22981869d50.5.1761422959632; Sat, 25 Oct 2025
 13:09:19 -0700 (PDT)
MIME-Version: 1.0
From: Frediano Ziglio <freddy77@gmail.com>
Date: Sat, 25 Oct 2025 21:09:08 +0100
X-Gm-Features: AS18NWB3-kwS9AMxjFSzJTXWkcnR_V9pU7FD_O0PGt461J0JMJRcwyEwkP3BK9I
Message-ID: <CAHt6W4e1XOoqO-W0O1mEU4UCr_ik=J9bRGQQPeNL3YLQSyV7_w@mail.gmail.com>
Subject: [PATCH v2] xen/pci: prevent infinite loop for faulty SR-IOV cards
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"

If a SR-IOV card presents an I/O space inside a BAR the
code will continue to loop on the same card.
This is due to the missing increment of the cycle variable.

Fixes: a1a6d59862f4 ("pci: split code to size BARs from pci_add_device")
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- add Fixes comment
---
 xen/drivers/passthrough/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 3edcfa8a04..52c22fa50c 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -746,6 +746,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
                     printk(XENLOG_WARNING
                            "SR-IOV device %pp with vf BAR%u in IO space\n",
                            &pdev->sbdf, i);
+                    ++i;
                     continue;
                 }
                 ret = pci_size_mem_bar(pdev->sbdf, idx, NULL,
-- 
2.43.0

