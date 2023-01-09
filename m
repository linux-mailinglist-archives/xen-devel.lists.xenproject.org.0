Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D3D662A63
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 16:47:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473747.734498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMc-0001gU-4u; Mon, 09 Jan 2023 15:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473747.734498; Mon, 09 Jan 2023 15:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMc-0001eL-18; Mon, 09 Jan 2023 15:47:06 +0000
Received: by outflank-mailman (input) for mailman id 473747;
 Mon, 09 Jan 2023 15:47:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEuMa-0001Ok-VG
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 15:47:04 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc623eab-9034-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 16:47:03 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id jo4so21168042ejb.7
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 07:47:03 -0800 (PST)
Received: from 2a02.2378.102e.bce5.ip.kyivstar.net
 ([2a02:2378:102e:bce5:dfc0:9312:b994:6b21])
 by smtp.gmail.com with ESMTPSA id
 22-20020a170906311600b0082535e2da13sm3851561ejx.6.2023.01.09.07.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 07:47:02 -0800 (PST)
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
X-Inumbo-ID: dc623eab-9034-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxR8yQrVeJYFYtv18lIm8lC/4hVNKMWmQGoHK/HMNYg=;
        b=MbfkYVQ21dyKLh0n1Yq8pvnM6WE4dqWitMH1Q14NyKLDFl9bDMfQKTQDnwjA2JmXDc
         99p/3TMEdJ5o+TUivAORi3ew2+4FRY0D3NvOGwi1nUkMa402TjOowdFxlZgaqRnjz0dX
         AmASVl2pEpkya66dzeJ9Beua3rAIbKil93GWaoMsluzUMhkCjkehqXp4rrC1Q04RPciy
         kqweKCTzoRzNadmxtEK8rgOpoChkJssmd4GV6M8siXBJ1cgM9k+Fr6+mMkKhmNprBYs2
         9gy9fGkhqDMI35pcyw+Vx0KgzW3RddIg4yk7WbQk8ESfVbUalfBMvQC7SQNCuTZmqHlG
         Yxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxR8yQrVeJYFYtv18lIm8lC/4hVNKMWmQGoHK/HMNYg=;
        b=JQnDK2sNoOv3d/OgIMwxQusymbKmCIUuI6df0MyKTXBz4lyI6/WMYoyNcjF1oKV4/M
         0kGGX5uviMHNIuJVJRtyOq7Xpv2CdnTYat7b615AV3ScyaR3vi1X+cgADWAKjvSTr+7q
         CV3mHzb7sn+Ro2OQKWA39Jkqz8m+HZIlayBeAjPj8UquNWbpQG15Trt1LALDlIuYQcIy
         clFoiScw06gv3pJnCAkWl6lXZSrdjhS6fJoROZfNzbu4jbq93JvX4I30QbTuuVj005Tw
         Tm9IyvsgP9vi6cbfg7vzZNgCzVdz5Y1cqI/u2m2nW9HC4Qb1cxdiVDDo9ZQza2o4HzJX
         +u1A==
X-Gm-Message-State: AFqh2koVgebcjP8fihLk/snYU2SvDj74AT5TTnWhYRdPDtvYmBeY4Poy
	uJRBo6AQsbWt5nY7/6rTGvS977EELL8c5A==
X-Google-Smtp-Source: AMrXdXvkuJjLqc1ipzuRLKNWMvua3yBg6XMcbn6YVmn6JREdqV4ci4d6f62zaxqkCK+t4sEfWHylHQ==
X-Received: by 2002:a17:907:a0cc:b0:78d:f455:b5fa with SMTP id hw12-20020a170907a0cc00b0078df455b5famr55538052ejc.58.1673279222751;
        Mon, 09 Jan 2023 07:47:02 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 1/8] xen/riscv: introduce dummy asm/init.h
Date: Mon,  9 Jan 2023 17:46:48 +0200
Message-Id: <b1585373e39a7cbe023f485aa5a04b093e25ec80.1673278109.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673278109.git.oleksii.kurochko@gmail.com>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following patches require <xen/init.h> which includes
<asm/init.h>

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
    - Add explanation comment to the comment message
---
 xen/arch/riscv/include/asm/init.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/init.h

diff --git a/xen/arch/riscv/include/asm/init.h b/xen/arch/riscv/include/asm/init.h
new file mode 100644
index 0000000000..237ec25e4e
--- /dev/null
+++ b/xen/arch/riscv/include/asm/init.h
@@ -0,0 +1,12 @@
+#ifndef _XEN_ASM_INIT_H
+#define _XEN_ASM_INIT_H
+
+#endif /* _XEN_ASM_INIT_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.38.1


