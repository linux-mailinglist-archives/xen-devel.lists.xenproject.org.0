Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F4F849E3A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676202.1052227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xo-0000eA-Oo; Mon, 05 Feb 2024 15:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676202.1052227; Mon, 05 Feb 2024 15:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xo-0000ZX-G3; Mon, 05 Feb 2024 15:32:52 +0000
Received: by outflank-mailman (input) for mailman id 676202;
 Mon, 05 Feb 2024 15:32:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xm-0007Hv-Uc
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:50 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d21fed8e-c43b-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:32:50 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-510faac8c57so2310580e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:50 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:48 -0800 (PST)
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
X-Inumbo-ID: d21fed8e-c43b-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147169; x=1707751969; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jujKuKcHk/bGVpGrSTxRhAACNFbzeped1VAo2Fwe7V4=;
        b=JTTcyGWrG/Sm/ASFdQvhndLrJIeda4VYzRZAUjwVo5RbMQHtqSyugPG1rw0kVwb7HM
         6r+PwUshbF/HldBKkGMYQB5dA7fsIfo+5yXhCqQu4Pbt7OiU0J7RkhJyZ8VwOLVUFIee
         XAA47g1Jq3niyjjJAUE+ep5rFHN7DtRSNWZNxeqiVaXNa+q5K7xJYdPImFCEHxjb7TlV
         Lla+2WxMJzBl2vC5R1zxbrEcfLczTzR/jghRUMLJejq8+U6kmXejnlOBETH2BCg98koP
         evel2hWIWZ/EkVF5kOqoSkBmptfhSuYmpmJZ4HTVDqHEY4Ha6rPfh1G5bauCDSgYElWF
         RjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147169; x=1707751969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jujKuKcHk/bGVpGrSTxRhAACNFbzeped1VAo2Fwe7V4=;
        b=sJsFq9foavMfgjx37jd8souItCRpzxi4HxTuoQn9ruQyEXK61Q1uUW8Trj3TsEKYLZ
         DmPKwcQ4iu9bImadfyZi4AMYminhSf4/4z1oIIVnU3Dhhgj+t+XxSHSQaLmSh96xxLO0
         N7QL0ODvDeSrfhbmNAcnMeQ1CX+hkQK4TMDcK+Z2OfdYU/rKv/v9fuG3zkuxi/p8HAHr
         wjF/Ifs6YiP+CieshxkPP6iBVPMRyQGNl1bOlBU8cESBJFfeQR17C/PQ524DUbD3uU8B
         dJXkVOqgwwj5mLiAkJVU8/Zva8VNtaxOcRSgHlA+KHAfXj4ETkHFKP1WBF1aZdEqFU7x
         m5Vg==
X-Gm-Message-State: AOJu0YyDWG6PgeMXyecBjIW5Q589NlY78EMU2xPLAFCNWBA93C3nKoY1
	pQPTicnnKvu4xVIVP6FFSh5Y6VKRZ4BxphzbbgA+W5lOYKs48K5VflDBS9/P
X-Google-Smtp-Source: AGHT+IF5joLMpboqZ7YvXzw1AujwcY43pMBJ4ztKpRXJKsjYJR7EOe8dGcLYV3ZESg0gbGKowODmvQ==
X-Received: by 2002:ac2:5b06:0:b0:511:49e5:f36a with SMTP id v6-20020ac25b06000000b0051149e5f36amr1500843lfn.10.1707147168866;
        Mon, 05 Feb 2024 07:32:48 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXXzy8tRKrdIG0OTSJdxQf+eTm1rFKunQ+zIHvY16CdSqXwClYmzS/0rh8e6Y6f8QaBBmLLiptZb5m9cr5Y7czaEmFFcRYtS/mLSsOspwvli8Nc7aLQg/YfOVEt71HKBQKuKblX9k8oecsHHRY649cdO/NWaoFWDN1kto7N0zUBlfEKcTf3HkAn98hp6URmwdjlsAolTg5sCs2Il9ot55wK+4RhWGl9jgBIvD38qKL0hU4mxXKUFKsh28WFdVKWMGiSRn3C3hfGxZ2+nEpY4fWQe+Q+bUCdfUrXBucLxvQ/b9nQyK5a2wq3jzVYZkZOqvWmuAP/
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
Subject: [PATCH v4 08/30] xen/riscv: introduce setup.h
Date: Mon,  5 Feb 2024 16:32:15 +0100
Message-ID: <9556f01b1c95c8b22dae4cfec7cca9a1040e5395.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
  - Nothing changed. Only rebase
---
Changes in V3:
 - add SPDX
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/setup.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/setup.h

diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
new file mode 100644
index 0000000000..7613a5dbd0
--- /dev/null
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_RISCV_SETUP_H__
+#define __ASM_RISCV_SETUP_H__
+
+#define max_init_domid (0)
+
+#endif /* __ASM_RISCV_SETUP_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


