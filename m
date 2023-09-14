Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727ED7A0829
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602365.938981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmU-0005ct-Pa; Thu, 14 Sep 2023 14:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602365.938981; Thu, 14 Sep 2023 14:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmU-0005ND-0O; Thu, 14 Sep 2023 14:57:22 +0000
Received: by outflank-mailman (input) for mailman id 602365;
 Thu, 14 Sep 2023 14:57:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmQ-0002WX-VW
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:18 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff5cdae0-530e-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:17 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bfc5218dd8so16470321fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:17 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:16 -0700 (PDT)
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
X-Inumbo-ID: ff5cdae0-530e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703437; x=1695308237; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQXCYyquIEbi5XMgs2FhYiRFtbU5KRI1/LCQxCDh67Q=;
        b=c6dpwrM7HcJtX2Tgx9IzVBF2EeMxhEokyUYLG8HU6iLTNdstzXuL1m+lPPD703b61b
         31we2cK11jwiXmLUn5AYVP+OPaY5H1LwA3dZ4+jK1rCl/xaXhyIkHsjO7+PfgbqOAT0Z
         v2OYWs+XvNap3L7S5KuxeF33a3Ku5R+dzC6727SaKEGRxRJMuq4uro8N2TRUt8t3I5Ed
         lH67Hla4a+2Pl+sMga2VSxcXVbRHSjDpe9+ebuwJeSRJnT+c9RNhK8ueFqWa0tS0V8az
         I9ReuFUOQkTt5yhTknfoJM1ijODPEcPBnDQg5QsFhuOtcEnKI6u6mqDi0Km6fjPX9xpq
         hEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703437; x=1695308237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQXCYyquIEbi5XMgs2FhYiRFtbU5KRI1/LCQxCDh67Q=;
        b=ak3lJZo92HFxbbl8jPXv2SOsl0Ffrff3kN3A1sERtXyqtqseFtrJqNwhgYuwQdEZsZ
         LVZl9VrLx+2GfRz0DUZCPvcAtsW539KbGa+N0H08pDrdbrKwTp+sF+/fYH29rXtL9Shd
         DTMl0WF0ed4S+yT8dngpe3hm3CrJKYzsm2IX8Q/qktPefuEK2NIhPVChNp7MHfORfxK1
         FqMmCSq0lttTpnTDmogfxkZjW1hYq7nWB3/3QUrfTzkyIaAbkibcIQPCm9/vUjSut3Nn
         VPqYCnrgKKDrmMu+EuNrcGNGnNoIhBEZRFYYVgSaoJrSQXvBoz4on0J/974B4vDz9+ih
         IqUw==
X-Gm-Message-State: AOJu0YxdtWgBV9G6lYnfICPtVvJMpIkcdl084/Z3rhFEWZEFU4031EdU
	iz5XofMfWL39b/16z1W3XbHN3TZPlqY=
X-Google-Smtp-Source: AGHT+IFQioJ4htBJRPvdxXzGxc7Zbktlv5OamzW6uDU+X74JSGDM6VmNEadDUHdUhWWT8dBmUtsF1w==
X-Received: by 2002:a2e:9141:0:b0:2bc:d38e:b500 with SMTP id q1-20020a2e9141000000b002bcd38eb500mr5761309ljg.42.1694703436782;
        Thu, 14 Sep 2023 07:57:16 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 12/29] xen/asm-generic: introduce stub header pci.h
Date: Thu, 14 Sep 2023 17:56:33 +0300
Message-ID: <597a482c70fef196e245a5d898ea6314a0c479ca.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/pci.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 xen/include/asm-generic/pci.h

diff --git a/xen/include/asm-generic/pci.h b/xen/include/asm-generic/pci.h
new file mode 100644
index 0000000000..b577ee105f
--- /dev/null
+++ b/xen/include/asm-generic/pci.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_PCI_H__
+#define __ASM_GENERIC_PCI_H__
+
+struct arch_pci_dev {
+};
+
+#endif /* __ASM_GENERIC_PCI_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: BSD
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
+
-- 
2.41.0


