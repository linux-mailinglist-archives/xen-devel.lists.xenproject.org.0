Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB4467E79D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:00:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485593.752963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGi-00029w-A0; Fri, 27 Jan 2023 13:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485593.752963; Fri, 27 Jan 2023 13:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGi-000251-5h; Fri, 27 Jan 2023 13:59:52 +0000
Received: by outflank-mailman (input) for mailman id 485593;
 Fri, 27 Jan 2023 13:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPGg-0000nM-6C
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:59:50 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcedcaa3-9e4a-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 14:59:49 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id t18so5079831wro.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 05:59:49 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm3971131wrj.103.2023.01.27.05.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:59:47 -0800 (PST)
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
X-Inumbo-ID: dcedcaa3-9e4a-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pRfpzK/BxGYd1R016SGWTULXiHCDLqhF4uHP1wp+tw=;
        b=ayMkROxaLs9ZATgMw1CBplX17OMRHxhJ1brLsK0riscFz5Ll6K3gowSE4q/z9jx4qE
         8pplVrtzVOGqd6XofmIuXU0ZK1Yet0NDJdbOYXiaA6O00ZUHbh95E5iuDcx+NNTcvabI
         P24zxXAr/OTT1/Gfz5nKIxhusBpBbNEbV8fLo1666EAS1f/OFVdxahPSjvb1wgZUlh5k
         i3dcHL/r0p5s6xKM2UXbARdsMx1MXWBJ4oQ41uWztwA+R+coxbAjXqPvkq1lj4b3jrlR
         WRkOl53na/Hy7iZhUv0JAgICTaTuNQdFVPRs9d7174K8xjClE2BtmJEckNzYSmeX4PMH
         sTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pRfpzK/BxGYd1R016SGWTULXiHCDLqhF4uHP1wp+tw=;
        b=FiTRNeeBsbsUrmQ6hkB8BJwzzUXCBgcFJj+UZveXaaqRz06vhDJzJ6gZKnUmJZ53pR
         sUXDb9cwSx3mg+bQuBM/0RxOsgLMhCXTHhb47VMPPH01JhozjugxpVYzWBnkjlmvGXHR
         aKITQ99UaUDjGzjNSL09+G2Ch5KnNXq9Xri50UW6013vEmJ2zhOPV2KbbaPZzo/K3fAr
         DfxhVIbuCxEaXYtcKakRofikowWXTB3LCjQn5jQ/IG3CWO2gMo6HhS9380UmItJRx+w/
         FzGxZwlvKxUMvpcgqrAoA7z49LWXwoDBxGkWrv429IYi9wd8wOyLPNp1jmqGaH2f4gFl
         GTyQ==
X-Gm-Message-State: AO0yUKX1mdkLap+RwVLb0hDTAkihWoVRX5C318braBColF9hoOnZG+Fl
	mtzhoxcj5NcVgurkTuNMVTbs6Dlc2sA=
X-Google-Smtp-Source: AK7set9ngm/GcKE0N6yO6aMweyaQ/2209Uv/+ejskFBDLDkxvBlzhYxxHlh8VApbkaz6oxfCpP8Eyg==
X-Received: by 2002:a5d:58d0:0:b0:2bf:b26a:3404 with SMTP id o16-20020a5d58d0000000b002bfb26a3404mr10774311wrf.12.1674827988360;
        Fri, 27 Jan 2023 05:59:48 -0800 (PST)
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
Subject: [PATCH v2 05/14] xen/riscv: introduce empty <asm/string.h>
Date: Fri, 27 Jan 2023 15:59:10 +0200
Message-Id: <19c64efc3c05f64de97cdc4a96919ee28844440b.1674818705.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674818705.git.oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To include <xen/lib.h> <asm/string.h> is required

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
  - <asm/string.h> is a new empty header which is required to include
    <xen/lib.h>
---
 xen/arch/riscv/include/asm/string.h | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/string.h

diff --git a/xen/arch/riscv/include/asm/string.h b/xen/arch/riscv/include/asm/string.h
new file mode 100644
index 0000000000..a26ba8f5c6
--- /dev/null
+++ b/xen/arch/riscv/include/asm/string.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_RISCV_STRING_H
+#define _ASM_RISCV_STRING_H
+
+#endif /* _ASM_RISCV_STRING_H */
-- 
2.39.0


