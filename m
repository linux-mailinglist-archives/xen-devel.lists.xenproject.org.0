Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077DD7F719C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:38:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640416.998626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TZa-0003em-VN; Fri, 24 Nov 2023 10:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640416.998626; Fri, 24 Nov 2023 10:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TZa-0003cS-Sc; Fri, 24 Nov 2023 10:38:10 +0000
Received: by outflank-mailman (input) for mailman id 640416;
 Fri, 24 Nov 2023 10:38:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTR-0006hx-CM
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6517e54-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:38 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9ffef4b2741so235410666b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:38 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:37 -0800 (PST)
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
X-Inumbo-ID: a6517e54-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821898; x=1701426698; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7x5U2KUqj/wwacaHUIO6EZiGTDMnx/DyKSx5kiQoao=;
        b=KXq1A9X07EsVSRGyKWsholK+oz5K9Te3adVbYmkG4tyYTdS0djeS3fVcL2h8ZIgDgA
         0jDoXXXroJflu2NntKLAUS1w/9DzMSZeB9CZ/nVdWdqyhoUwM/zzFkx8JHP0ohKbyMCf
         boNfee2DZORZQ7Te2o5eg9qGuHydmdwIZLGzT0/aDl4J5HlIBx35HdcWM1/t5FRUcnHu
         3z1cURjwspNjpd9YCBS01pZhzUIC9DtGxtwCwh/H5ILrROXoG6FA4xJ+VImW2EPScTlk
         LL9wZtL2/aB/F1pTBLFucOl11pxd7rWWHmCSPH3tC7VX1c8X62dPYTM7+f4VZAr7zzu+
         /wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821898; x=1701426698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7x5U2KUqj/wwacaHUIO6EZiGTDMnx/DyKSx5kiQoao=;
        b=Ne5F6B/Gae2Z9wzk3538q6hsUr9d1PHvmXOkjFeSPXY9h37WBNXdt/vw7Euao98yGP
         MUue8ZaxGewLl/RjxwKaLNuLk5VGviHF6TK/Yvmbu1ATGF+eMFMD3lsVnLgKI00yVHeD
         GdpCCLLYxMzLd23RB2jsscYiuLP/9VawFSszSf6Vf7/Nslfs1fk3RzI/GxbS6IycPS7/
         BsCB4+5LRLMMBZHR6GB96j3PDfggMOPVPxfdkJAmURG7H7Hf3d4nAd130wZdYKssfSkv
         rLY9InDnqKIVAMfviKCx4G7aW559ec0M62tvgeZb5BjtPkLL5V2GZJlRISD0lLWyvnUS
         2tZQ==
X-Gm-Message-State: AOJu0YyH7h+p1RjA9EIqWUffzQRheikQburnaUTIHcGE3REOl+nqKr1I
	QSh0tXorqH73uwxwEC071yqNO7lM87/cZw==
X-Google-Smtp-Source: AGHT+IEC5u4CN9HmR9yMjsISc6BZUZQAJ/WClAAYWX6bDqZnDRHhoDt/HOyaCtFv3iax3UG3lX+Mew==
X-Received: by 2002:a17:906:2209:b0:a01:9d8b:db17 with SMTP id s9-20020a170906220900b00a019d8bdb17mr1812719ejs.15.1700821897855;
        Fri, 24 Nov 2023 02:31:37 -0800 (PST)
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
Subject: [PATCH v2 27/39] xen/riscv: introduce asm/time.h
Date: Fri, 24 Nov 2023 12:30:47 +0200
Message-ID: <ab09f88d1c43478938811511c54c9d425f4080d6.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 -  change xen/lib.h to xen/bug.h
 - remove inclusion of <asm/processor.h> as it's not needed.
---
 xen/arch/riscv/include/asm/time.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/time.h

diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
new file mode 100644
index 0000000000..3ce848deac
--- /dev/null
+++ b/xen/arch/riscv/include/asm/time.h
@@ -0,0 +1,19 @@
+#ifndef __ASM_RISCV_TIME_H__
+#define __ASM_RISCV_TIME_H__
+
+#include <xen/bug.h>
+#include <asm/csr.h>
+
+struct vcpu;
+
+/* TODO: implement */
+static inline void force_update_vcpu_system_time(struct vcpu *v) { BUG(); }
+
+typedef unsigned long cycles_t;
+
+static inline cycles_t get_cycles(void)
+{
+	return csr_read(CSR_TIME);
+}
+
+#endif /* __ASM_RISCV_TIME_H__ */
\ No newline at end of file
-- 
2.42.0


