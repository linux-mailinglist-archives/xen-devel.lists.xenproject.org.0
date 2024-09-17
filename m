Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17D497B780
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 07:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800126.1210063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqnUv-0000lo-Ob; Wed, 18 Sep 2024 05:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800126.1210063; Wed, 18 Sep 2024 05:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqnUv-0000jm-Lv; Wed, 18 Sep 2024 05:45:05 +0000
Received: by outflank-mailman (input) for mailman id 800126;
 Tue, 17 Sep 2024 23:37:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RS1=QP=gmail.com=minhuadotchen@srs-se1.protection.inumbo.net>)
 id 1sqhl5-0003OX-Ql
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 23:37:23 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c876a6a6-754d-11ef-99a2-01e77a169b0f;
 Wed, 18 Sep 2024 01:37:21 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2054e22ce3fso67093075ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Sep 2024 16:37:21 -0700 (PDT)
Received: from localhost.localdomain (111-240-85-119.dynamic-ip.hinet.net.
 [111.240.85.119]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-207946029c7sm54703325ad.113.2024.09.17.16.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 16:37:19 -0700 (PDT)
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
X-Inumbo-ID: c876a6a6-754d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726616240; x=1727221040; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+4V/8APfhFDjK0TbP6vOe2EfVKeMMbKBRPhEv2aIfeI=;
        b=BqJ2tYJOMU3p+2t/I7zQKZiqrKoZovBWsRhit2PUk1Cc9e2ta/Hf1QuV5AE4FUpz+V
         UxIoEyRsI56FVSzok2BtAGYC6ySpBVy/MJRUFCG/FWBzipERSETTfF0kVrqdgdqFgwGa
         Cs7+hFrxejZpjgWk3liULdl6nqS4gX+XUOaQtKS+/zFzbaFp9/FZyQC442+NPu7gUetp
         H7qZOq+VIQ9N9J+4NfZcS0grer5/uuDXPqsTcAxO4l+/5MlZo4QLl3bJXzott8DNpzt2
         X8kMuJAOY6wzzRKO3Bz0mWCsBJETnasRcQVbTYkfCeLPivr9CDdanvm21gpnogrTAEMc
         heeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726616240; x=1727221040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4V/8APfhFDjK0TbP6vOe2EfVKeMMbKBRPhEv2aIfeI=;
        b=CtbS3uDIRRfKOP9jk9BcAeKcC4gG5azwwLbBUvRbE0q/wctKxbzLsCp3NvbII6cQnw
         eeClkHtI8OhHLTH8MTMXzlOIRv2mB0EhGaXDIGYs0BhOPRDpKaoaqq5On3/6mqyp8USg
         0QRPUY5+428kOWfO0OqkRFNm9oVc+p199ARgdvWYcuNSgnxZHN0GAUu0lC5Nom7+ckD4
         7gvPlNwezxErtaU1c5X9OFMaab/xD51SJ6Voz8sk71BGrrqUADQTf41Q3YN6/94OjQSc
         6LErLF3P86PeL+7xk31sOYIpxxg+Fg6RvOzp7I3GJzNCDMqfcEsiLYKQergtGZtvYUkN
         0G3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXK3Cg/tVcfEs18pFeS3uOr04WmqNrNKUXBB3bWQgwmY2bPDaVm5x94/JR8JwTmlkJE/h/A33bMBHw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxepqHyeaSt1vc2g8vuW0OA9uYQ1xAU4sNj+OodCFmbwytF1gZw
	RBg5Q7utgYvY2Bj+73bcVr3urE33nY6S9e/Mf1lVjpke9eD55PGz
X-Google-Smtp-Source: AGHT+IHG+QKuoEXpiLZOezS6Ou+QNM1i+bhg/FChfpH3EGXD6kQ0RtkpjirogCLkckbdMU4O2+xsCQ==
X-Received: by 2002:a17:903:1112:b0:205:4531:54d with SMTP id d9443c01a7336-2076e37af96mr318957255ad.30.1726616240064;
        Tue, 17 Sep 2024 16:37:20 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen/pciback: fix cast to restricted pci_ers_result_t and pci_power_t
Date: Wed, 18 Sep 2024 07:36:50 +0800
Message-ID: <20240917233653.61630-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fix the following sparse warning by applying
__force cast to pci_ers_result_t and pci_power_t.

drivers/xen/xen-pciback/pci_stub.c:760:16: sparse: warning: cast to restricted pci_ers_result_t
drivers/xen/xen-pciback/conf_space_capability.c:125:22: sparse: warning: cast to restricted pci_power_t

No functional changes intended.

Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 drivers/xen/xen-pciback/conf_space_capability.c | 2 +-
 drivers/xen/xen-pciback/pci_stub.c              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/xen-pciback/conf_space_capability.c b/drivers/xen/xen-pciback/conf_space_capability.c
index 1948a9700c8f..cf568e899ee2 100644
--- a/drivers/xen/xen-pciback/conf_space_capability.c
+++ b/drivers/xen/xen-pciback/conf_space_capability.c
@@ -122,7 +122,7 @@ static int pm_ctrl_write(struct pci_dev *dev, int offset, u16 new_value,
 	if (err)
 		goto out;
 
-	new_state = (pci_power_t)(new_value & PCI_PM_CTRL_STATE_MASK);
+	new_state = (__force pci_power_t)(new_value & PCI_PM_CTRL_STATE_MASK);
 
 	new_value &= PM_OK_BITS;
 	if ((old_value & PM_OK_BITS) != new_value) {
diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index 4faebbb84999..368738312696 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -757,7 +757,7 @@ static pci_ers_result_t common_process(struct pcistub_device *psdev,
 	}
 	clear_bit(_PCIB_op_pending, (unsigned long *)&pdev->flags);
 
-	res = (pci_ers_result_t)aer_op->err;
+	res = (__force pci_ers_result_t)aer_op->err;
 	return res;
 }
 
-- 
2.43.0


