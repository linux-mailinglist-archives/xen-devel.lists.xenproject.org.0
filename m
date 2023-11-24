Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AAD7F7175
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640375.998495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TT2-0000y7-0g; Fri, 24 Nov 2023 10:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640375.998495; Fri, 24 Nov 2023 10:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TT1-0000tE-Ps; Fri, 24 Nov 2023 10:31:23 +0000
Received: by outflank-mailman (input) for mailman id 640375;
 Fri, 24 Nov 2023 10:31:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TSz-0006hy-OE
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:21 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bfcfe3f-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:21 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a002562bd8bso338503166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:21 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:19 -0800 (PST)
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
X-Inumbo-ID: 9bfcfe3f-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821880; x=1701426680; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sa8I3OdPtO5taY9HyrT1OugoZqyYFmE8a7/9LzDJGcI=;
        b=MUzPEZUVSLWZBg0/F7fDRGXxPkxlNnwcgNLodu9E216trzjjOFdd2YkJ8FyMNTP8XV
         1HG9rjHXh4dDjmbvp/czTkGrkBOiNZjgGxZFInKgXN2KWRzbuIMumt3T4LptvU+stT9/
         jqteACZAkbLK/Z0ndqb023aEQ5Qm+D+L8xs1vRcm9/iw555Yv4CryOy4sqJY+P7Di0Hv
         DxfWFbaCSL3dfQFFTwsYIABbJ7VkqVs9ZPlFMyw1ccAmBJT1OazZfykxEJNdWF98HVoO
         wLGfxdeDUjfVf4MhpJKBHbvF/q5OYpgWUohjyRzG0GtRQguEyfpakV7P0i74Ip6mZTaP
         Jq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821880; x=1701426680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sa8I3OdPtO5taY9HyrT1OugoZqyYFmE8a7/9LzDJGcI=;
        b=aHTtGRNqsDakGTbqdXIrRH9HNS5zKHmNvY1rAKxB/cmUhUp8pYOxP4LSripg+Ow/ga
         FhByESTYYhWChnuOnjXa+ijOl0xIn4/nrNo5h/5NsB9kxQN58hkW+D87YJbzAuRn+YUo
         9z3UmqocyNwDQFxqrZCrm1pGdjlv5+GjTozVJ0qkgmNxb4bSjfOJZ0vYqnAEGxhIfZLJ
         zBdPDbS2fCIclL6EERb0WDsINcSgwcSrfM+kafZISUePfSqaU3A3GL8O1DCxKqqZjKYy
         Bg2qYp7x+Pf2SHCYrHBdDaRM2v0k1Y0Pe3vk8S1lr/c4Ot/5WhSrSsnQWBtl4PqNQeAM
         iyPQ==
X-Gm-Message-State: AOJu0Yxo36Fa2VJJOT2KGVLgdSWEi+ZGCmXQqW/g77gZ0jFjLId6lPXS
	fzQ+09OZy7mnanW6x4ZwP/O8YA8n0kqrdw==
X-Google-Smtp-Source: AGHT+IEGxFMpLVopw5o8+UWvXFE9B+KbVyLWWZ/PtJ3mmp587qZYU+aXaizaZ+KHGnXV+hXU0MkP3g==
X-Received: by 2002:a17:906:348c:b0:a04:a4fb:10d3 with SMTP id g12-20020a170906348c00b00a04a4fb10d3mr1817011ejb.37.1700821879714;
        Fri, 24 Nov 2023 02:31:19 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 10/39] xen/riscv: introduce asm/iommu.h
Date: Fri, 24 Nov 2023 12:30:30 +0200
Message-ID: <68be3d368bf6ed96b0bb53b51a2fd07696cb338d.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/iommu.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/iommu.h

diff --git a/xen/arch/riscv/include/asm/iommu.h b/xen/arch/riscv/include/asm/iommu.h
new file mode 100644
index 0000000000..648b6fb922
--- /dev/null
+++ b/xen/arch/riscv/include/asm/iommu.h
@@ -0,0 +1,7 @@
+#ifndef __ASM_RISCV_IOMMU_H__
+#define __ASM_RISCV_IOMMU_H__
+
+struct arch_iommu {
+};
+
+#endif /* __ASM_IOMMU_H__ */
-- 
2.42.0


