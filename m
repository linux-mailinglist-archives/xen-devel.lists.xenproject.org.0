Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6AB7E7DCC
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630614.983678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPM-0006io-MU; Fri, 10 Nov 2023 16:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630614.983678; Fri, 10 Nov 2023 16:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPM-0006gC-Dp; Fri, 10 Nov 2023 16:31:00 +0000
Received: by outflank-mailman (input) for mailman id 630614;
 Fri, 10 Nov 2023 16:30:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPK-0005Bj-RR
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:30:58 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 868f9c12-7fe6-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:30:57 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9df8d0c2505so460844666b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:30:57 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:30:55 -0800 (PST)
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
X-Inumbo-ID: 868f9c12-7fe6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633856; x=1700238656; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4GiMwFNhic1Of+4qxhqUdq0tdhcqKTYgac+1gBg+Ao=;
        b=Eek3Yp1oYvkOcYZgMXNZRH8e66YaJ8uj1BMwT007pLJPYI+ujVGloCL6Dgns7W3v4V
         d5DcqNkSfe3n2Ny/Hy+ye4gfBKX0fYp6woiAq8BXC/WUYm8P/Fh2GpHjQBQasYrIbF6n
         LkXiM/3rtbT/cXNIIFoLkYN2xajQReyyysu1XLYL/QQoJgPT1evYKSqa++tWFqb57hDR
         YTXdB1xvdhYsDmXHyrD+zYnqY+seFh3myeGNqZdtyN1wfuHL+dqQijaTg/UJOnZ2G1yv
         OVPWVoHBQUtfBtorgCslrtzQmxCy7Msh1UqPCFhSglycaFGBHE7DGebrl9dGKk+8+DAv
         Ijtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633856; x=1700238656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4GiMwFNhic1Of+4qxhqUdq0tdhcqKTYgac+1gBg+Ao=;
        b=DK+UkB6PsFOItd+ZOqnHOybfSRQrI7vEDtD6h7csAA/drIQdwF9yM6kbSn/WvPdgSA
         aPeqbOOnaNzpwQWV/LE5nPFPClWwHAkW++/rvsKJDq5knwyZZawnWulqzmV5Yql7y3kB
         swg5jijuyvv/Cb4dJHSLjiFZwK01Ib+uP62HVWhK3gTa/rwlncmIZud7PbdiRDQiyqsf
         tKgAhoum/dVkjyiwxBW2e+BaLMVyA4e4A78e18t5xuQgBWt2caluCCqaaHLUq76QZzyt
         c53JrF0DTkq56rOULiimqiDBueg/SkiZsD6jP39zc445/dUT94LmjxbqCV+fyGQAPRic
         QRSA==
X-Gm-Message-State: AOJu0Yx506h1Bdr+pSO2lE2WcxJl6xFIJnTlWmZYcUE42B9+kB4sKR+V
	VTVSaDtRT0SL8UahhkUA8LKYuaHvnfI=
X-Google-Smtp-Source: AGHT+IFZ7Fmn5+ODTd0Tw/vIffUZN66H0viRuphmcR4vVXFOcYlGklI4ld7L0oE/FWH20ceYuq01qA==
X-Received: by 2002:a17:906:13d5:b0:9a9:f0e6:904e with SMTP id g21-20020a17090613d500b009a9f0e6904emr2946531ejc.16.1699633856160;
        Fri, 10 Nov 2023 08:30:56 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 05/15] xen/asm-generic: introduce generic header iocap.h
Date: Fri, 10 Nov 2023 18:30:31 +0200
Message-ID: <6ea2fc1c12fa08e7cc6a47735c4fcd49c48ac4d3.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iocap.h is common for Arm, PPC and RISC-V architectures thereby
it was moved to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
The same question as with device.h. Should it be in asm-generic?

Changes in V2:
 - update the commit message
---
 xen/include/asm-generic/iocap.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 xen/include/asm-generic/iocap.h

diff --git a/xen/include/asm-generic/iocap.h b/xen/include/asm-generic/iocap.h
new file mode 100644
index 0000000000..dd7cb45488
--- /dev/null
+++ b/xen/include/asm-generic/iocap.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_IOCAP_H__
+#define __ASM_GENERIC_IOCAP_H__
+
+#define cache_flush_permitted(d)                        \
+    (!rangeset_is_empty((d)->iomem_caps))
+
+#endif /* __ASM_GENERIC_IOCAP_H__ */
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
2.41.0


