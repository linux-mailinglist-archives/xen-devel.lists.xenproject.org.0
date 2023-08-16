Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 719A477DE74
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584331.914993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdd-0006RX-U1; Wed, 16 Aug 2023 10:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584331.914993; Wed, 16 Aug 2023 10:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdd-0006Em-E8; Wed, 16 Aug 2023 10:20:29 +0000
Received: by outflank-mailman (input) for mailman id 584331;
 Wed, 16 Aug 2023 10:20:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDda-0003R9-7p
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:26 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83fb8b42-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:25 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31792ac0fefso5393308f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:25 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:24 -0700 (PDT)
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
X-Inumbo-ID: 83fb8b42-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181225; x=1692786025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UtKgw2oGdpERvWUwkUZbK+iTn/OYQeQkSAVodhVdCY=;
        b=nYdPgK9vK1HgvizhwbQRbi+KOrKETYss93lQ6xz7ogSWYCQJz0cpvezPlaaH2opXrT
         cNMHj6f4T+gm+/w2DGAkKgye65lG8y+DGOr4zlHIQrUI9FP3ypJSPfx5niHdmEPuLvOp
         xxgkLPJbiYNxRQGm6dHQhEbAL3haTIgL0FjuWyx4Yazw0oENIl5uTT7FyXhuAKqJGvFH
         AR4NFrBOEzVR9z0S4l7JnCxph7F/0hfaO4RbwIEsfic7JDEYE01W4HJimOLO+rv4gQko
         b1vC/2UPlraBG/CNaPZkn6T0gYBIPNVeEPiu9hvR94JE8m6C2bQk7zKzop5KNWPTNwex
         t37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181225; x=1692786025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UtKgw2oGdpERvWUwkUZbK+iTn/OYQeQkSAVodhVdCY=;
        b=X9c/OKvvyVWHNRumH5+7vMySYcRRzqtmqq7XK7aKT9UJrKdpw7rwj/GZQ6eg+41v9P
         D71F3x0CORMdzO9cGlJCbXexILY8TK/JtyJyedRQ9U8Rq8wXgbd9Rp439Vzql6ZGRlwg
         CrwkXufGM/h8EtItdYcpZEkaSu6GD3TjuqS/Clh9rUZrfcG4neko3NPx+0sQQaJRqbas
         aLSGGNvB54PyPW6GxnP0604PJG5bmxpv87WvVB4jjpwvk5HiHXth/DBd2cZxIwAMzddR
         +5EJush8dmpgkGdx7fvgInhgApDrBnZEZEAI3mzUZvELJTaCMMMHeGfcN59X+Rwg6CCY
         79JA==
X-Gm-Message-State: AOJu0YzSudc6K9xRTv6hiC7PmpRHcpdq028UWFJ6zWOIJ5idov6XS62K
	xdtiMJjI7AnpUVKca4s/Lk081dvPie0VYu77
X-Google-Smtp-Source: AGHT+IEL5QiktAOOhA8WQBarakEqazzrDcc9Z4mEOkyPLGEz6MXl7YbUD8sgqxOeKiKhWp61wuKRPg==
X-Received: by 2002:a05:6000:90e:b0:316:f25c:d0c0 with SMTP id cw14-20020a056000090e00b00316f25cd0c0mr1129118wrb.16.1692181224963;
        Wed, 16 Aug 2023 03:20:24 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 13/57] xen/riscv: introduce asm/iocap.h
Date: Wed, 16 Aug 2023 13:19:23 +0300
Message-ID: <6387a36bb349e88b5ee9da4271c87ec1a9889e65.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/iocap.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/iocap.h

diff --git a/xen/arch/riscv/include/asm/iocap.h b/xen/arch/riscv/include/asm/iocap.h
new file mode 100644
index 0000000000..c3147b1aed
--- /dev/null
+++ b/xen/arch/riscv/include/asm/iocap.h
@@ -0,0 +1,16 @@
+#ifndef __ASM_RISCV_IOCAP_H__
+#define __ASM_RISCV_IOCAP_H__
+
+#define cache_flush_permitted(d)                        \
+    (!rangeset_is_empty((d)->iomem_caps))
+
+#endif
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


