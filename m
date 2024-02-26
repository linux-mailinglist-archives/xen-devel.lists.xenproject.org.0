Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EA5867ED8
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685692.1066833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewf-0008Lz-1v; Mon, 26 Feb 2024 17:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685692.1066833; Mon, 26 Feb 2024 17:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewe-0008Jd-US; Mon, 26 Feb 2024 17:39:16 +0000
Received: by outflank-mailman (input) for mailman id 685692;
 Mon, 26 Feb 2024 17:39:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewd-0007pd-4Y
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:15 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4ec6ccb-d4cd-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 18:39:14 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d2533089f6so40291731fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:13 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:11 -0800 (PST)
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
X-Inumbo-ID: f4ec6ccb-d4cd-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969152; x=1709573952; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4jxrAoYCKDkhvwUTVgqE4mrg8XDUPc3gTT+Ybsf5Eg=;
        b=mJqi/cqb2UyVSHd15RNjWvsuwdYDnrYAWKOo0aY4N+xQpWP5Zh3CCbCB1/WElNxG+N
         I2ns+KxasUpKZNHpc8QQ883Nxv+Fnx797c+v3Es3XocJCGIcmYJT8l13tX8DKfd1ksuV
         Wh6GZrmpe5Fv0j0muk5eUgJW8fr1QLGMKPaAIgHRzP1UkkRJS02ACdK+BwL/HEmS79AW
         Mhzzd6/lgvyRa8kNE0JVh071eUl5eoXvDWXMf5piRsDDjP4ZqI21QHW0IV+q6plMvHfk
         TfK81RDUO7dYQRvSlNG+yKT16fUFrSQj0ed5Jj13AUjirf+9uTircfePVn/QeJaP1oYt
         YkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969152; x=1709573952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4jxrAoYCKDkhvwUTVgqE4mrg8XDUPc3gTT+Ybsf5Eg=;
        b=IbxaL/j7TOBg68gB34SSum0roc+rZ4w0VIOty534rUX+8umQwZU4L3eGerQRRtJoV8
         fEAQDQIDZMHR+60AHxViywTc1EXkyy7HBbpCEGxj6DMWi6euTvpyDQNNAleEE2xgw6yQ
         M9GMZ98WNEugx6UO932Wv/T8vklYqFUgZhNkrizN4cGkleOmIgdmFCB4fCmHYAAAoi5y
         /vMSwfBazRKn7bGS1lObOXIaJnXexzpIjWd/wiAHtmzLGAJtfQKMTEB4240pjUIDVesp
         giGA8TlrsagVxilzIUC8CREGUPiPWDCHXRPMINo/T0gkvz1PZbxeWhm4H4GHr4ripncS
         Zbfg==
X-Gm-Message-State: AOJu0YwCB7+ZNo3PJPPEhGKe7Zs64WTB6Rfp+ZCj3s20SuiXkKnY3jhG
	hAdUa7ODh3gNSPcAI//ApvAUxaf7Cb2fqapgvfLdBCvstSlhzBtVoZlSrb87
X-Google-Smtp-Source: AGHT+IEibpaHUx8FcU8JFqu57+mlanlhlfIrSKsfNowGL2agu5Ar956bLzTD5O4HwptS0B9wTDOhPA==
X-Received: by 2002:a2e:b0c8:0:b0:2d2:7781:382e with SMTP id g8-20020a2eb0c8000000b002d27781382emr4528564ljl.32.1708969152357;
        Mon, 26 Feb 2024 09:39:12 -0800 (PST)
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
Subject: [PATCH v5 02/23] xen/riscv: use some asm-generic headers
Date: Mon, 26 Feb 2024 18:38:44 +0100
Message-ID: <e0bf8689422066f5fcdf9e063717f6c748ea3af7.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following headers end up the same as asm-generic's version:
* altp2m.h
* device.h
* div64.h
* hardirq.h
* hypercall.h
* iocap.h
* paging.h
* percpu.h
* random.h
* softirq.h
* vm_event.h

RISC-V should utilize the asm-generic's version of the mentioned
headers instead of introducing them in the arch-specific folder.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5:
 - Nothing changed. Only rebase.
 - update the commit message.
 - drop the message above revision log as there is no depenency for this patch
   from other patch series.
---
Changes in V4:
- removed numa.h from asm/include/Makefile because of the patch: [PATCH v2] NUMA: no need for asm/numa.h when !NUMA
- updated the commit message
---
Changes in V3:
 - remove monitor.h from the RISC-V asm/Makefile list.
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - New commit introduced in V2.
---
 xen/arch/riscv/include/asm/Makefile | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/Makefile

diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
new file mode 100644
index 0000000000..ced02e26ed
--- /dev/null
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+generic-y += altp2m.h
+generic-y += device.h
+generic-y += div64.h
+generic-y += hardirq.h
+generic-y += hypercall.h
+generic-y += iocap.h
+generic-y += paging.h
+generic-y += percpu.h
+generic-y += random.h
+generic-y += softirq.h
+generic-y += vm_event.h
-- 
2.43.0


