Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79D2660107
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:15:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472541.732791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYU-000391-Na; Fri, 06 Jan 2023 13:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472541.732791; Fri, 06 Jan 2023 13:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYU-00034D-Is; Fri, 06 Jan 2023 13:14:42 +0000
Received: by outflank-mailman (input) for mailman id 472541;
 Fri, 06 Jan 2023 13:14:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRQJ=5D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDmYT-0002z5-Dm
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:14:41 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13e4f564-8dc4-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 14:14:40 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id b3so1912398lfv.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jan 2023 05:14:40 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 f14-20020a0565123b0e00b004b7033da2d7sm150221lfv.128.2023.01.06.05.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 05:14:39 -0800 (PST)
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
X-Inumbo-ID: 13e4f564-8dc4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAcYh/VW7eYXXl0R2jdwjlS37Qv+vZcW+kdMkmb+PS4=;
        b=IlrI0mSe81MehUEzGp9/MbqL/Pkl6vTOQkeNdnArj8JWWJejtDMyERVIbGWTZ3BpXm
         cdl2hGleDIcpJ8VKttf+B3DguD+ugtu1V5plc39rePhJu70fhf4HORtDXOluwNgzZFdF
         HPU35Kzhc/c0ITVRDRzHYzb+qkaLBq9q8fpq4gFPV6cVl8Ct3QcAV2Theof2IrBH4SHE
         2KCh5GoBjbLvlq+IxEVb/ykaL0xTbyg+kX6ILflHPNKLfqeC9SXO2/19T6giQkNi91q5
         vctCpEYEioJe8qs2XLEIUQyPX5+UPDs1eNsh6eCsx3C76Yk8+brLRJzm+IWy0S7DSxOW
         np5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAcYh/VW7eYXXl0R2jdwjlS37Qv+vZcW+kdMkmb+PS4=;
        b=qvCxCB94RnvTv9Okv6riYgvGGcH3oOafz3lGhFCDqn7TIozOh5gDr7I40MmpHQKhtV
         UAnk7iFqkr8rGL9mX9w1ob7vVNhHpNIvN0yOFgaIBHfwfog6lbM8F5CodV3K5Wv0DsIF
         7nJ1VBafyahkPpV6LVrUNUWXxTVZkU2UPYHSOvHPoQXnS+HKK15m/Hv1/90YaoNsf0jm
         iVItWbDgsEmIaaO2ThyaTBtCLdm/4owYAnvVj4I4qivKJipY0lBsjshZGMm4GgjRZeOb
         VZ5Yx4ax3qa7uzCUCcoQRYMDS9T7Z3S+O8a/5DS+vVqfXWDreV6mu4aO94LydDgEGYsa
         bO9g==
X-Gm-Message-State: AFqh2kp444fpXxSdwXUmiXCXaUfRtsmD2gOnDXrJIZ6g7fcCTdZCI07u
	4iwpvpQE1zrBNdi14AZbXCVPdakgVcBoSYwp
X-Google-Smtp-Source: AMrXdXuRGgsiwA4HhZEUjvPe3rUe82HuuCxRCrIxhvRyjc68zQIey6oqWemF0IKGffdvUIL0o0nSeQ==
X-Received: by 2002:a05:6512:6ce:b0:4cc:553f:5b68 with SMTP id u14-20020a05651206ce00b004cc553f5b68mr3020397lff.40.1673010879984;
        Fri, 06 Jan 2023 05:14:39 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 1/8] xen/riscv: introduce dummy asm/init.h
Date: Fri,  6 Jan 2023 15:14:22 +0200
Message-Id: <cb2f0751d717774dfe065727c87b8f62f588ca17.1673009740.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673009740.git.oleksii.kurochko@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


