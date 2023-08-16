Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D53877DEC2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584485.915307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoq-0002wk-Dy; Wed, 16 Aug 2023 10:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584485.915307; Wed, 16 Aug 2023 10:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoq-0002tG-89; Wed, 16 Aug 2023 10:32:04 +0000
Received: by outflank-mailman (input) for mailman id 584485;
 Wed, 16 Aug 2023 10:32:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdh-0003R9-6r
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:33 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8833f6bc-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:32 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9aa1d3029so98868091fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:32 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:31 -0700 (PDT)
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
X-Inumbo-ID: 8833f6bc-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181232; x=1692786032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=to9zcOK1uQRDwQjF/M/tIQG/U0cMxLKxzsy4fRBRfDU=;
        b=E/SkYn6JS5y2h9erhRN7GuzfaZPZvlSz7O+us2U9ZQWrFmFClCyA/ZEzFB9KtTV+gc
         xIL+8KDj6VgkUQdMUQ+6j6lAQvbMDjPzhSwjaw50nipfQeNvEtQ20pvk+8VzXVgve/Qf
         cvb4ifB9PcMX8jZgzLkLCttfLoTfOsYKcM8GpHOhpA0+Y4pALs+il7LnzDa73UNjgxJT
         0p5VG5kuoAezg3laJhfAEIxgSKJKTHHn5VupFvMuhf7Q2LVtXog4kuJ/27uZmh5G9o1n
         NDsViSQBUYEga8TA2/2EkWbQOKbMtCDh2Ldkd5J1PRgvP7+xxosesNf8pb+I5xDDWzO4
         4znQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181232; x=1692786032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=to9zcOK1uQRDwQjF/M/tIQG/U0cMxLKxzsy4fRBRfDU=;
        b=YIAovolP0W9+UF36KQxuxMEGdKtP+KLDaoOLz8OOMY75eEum+pq00rGLokINv3MXOa
         /o0aKGwJBlVP3KpflZCSayZ9noaqN+7I8UCWwsmBU4Cgfw0XIY8Oh7fsbYdAOTspDvNJ
         C7dS1yF6yg0j+4amRXUggy2aZUXlq7x/iw6EEHSijkrqDj1CwdecHME/tN7FASKJqAh6
         CknlcEAAcomt7gqsLs5jzDqZJElkCVW0xWMEgcMPQjSGdsvHl3qvcGCoW3RSL8Vo+fCa
         2xzE206haB1cRyggo9lAlrbfICwIXoCfsy5W/4NVLQ6TWZRXGV3LaEMm4u54F4EFxsUv
         VH5A==
X-Gm-Message-State: AOJu0YwngIAstI6koJGOcyVY+CxmGkDUDeZBDJy035WRftyGtrATkbnQ
	duvBXmo5VJQ5F9I5EVxwjO4WL9DOEM4Y147Y
X-Google-Smtp-Source: AGHT+IH7otoSQb845MxNmPIX62JECiy3MDCFipeqXO7rEA45lKn8GY8u8k+tLCi0JXR8QAaQ3TuZOg==
X-Received: by 2002:a2e:9591:0:b0:2b9:cb50:c1f9 with SMTP id w17-20020a2e9591000000b002b9cb50c1f9mr1120790ljh.32.1692181231727;
        Wed, 16 Aug 2023 03:20:31 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 21/56] xxen/riscv: introduce asm/xenoprof.h
Date: Wed, 16 Aug 2023 13:19:32 +0300
Message-ID: <cd76cd159c9b983451269aa70210671ec2bb104b.1692166745.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692166745.git.oleksii.kurochko@gmail.com>
References: <cover.1692166745.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/xenoprof.h | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/xenoprof.h

diff --git a/xen/arch/riscv/include/asm/xenoprof.h b/xen/arch/riscv/include/asm/xenoprof.h
new file mode 100644
index 0000000000..e3fc625932
--- /dev/null
+++ b/xen/arch/riscv/include/asm/xenoprof.h
@@ -0,0 +1,4 @@
+#ifndef __ASM_RISCV_XENOPROF_H__
+#define __ASM_RISCV_XENOPROF_H__
+
+#endif /* __ASM_RISCV_XENOPROF_H__ */
\ No newline at end of file
-- 
2.41.0


