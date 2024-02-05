Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098CA849E92
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:39:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676273.1052401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX13q-0004A8-Ev; Mon, 05 Feb 2024 15:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676273.1052401; Mon, 05 Feb 2024 15:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX13q-00047G-By; Mon, 05 Feb 2024 15:39:06 +0000
Received: by outflank-mailman (input) for mailman id 676273;
 Mon, 05 Feb 2024 15:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xy-0007I6-Gk
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:33:02 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8531ee9-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:33:00 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-511531f03f6so810453e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:33:00 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:59 -0800 (PST)
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
X-Inumbo-ID: d8531ee9-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147180; x=1707751980; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fh1fXKNPLCGaG/VnLCvzTyh2EW511i6o4O6lrTHgeBw=;
        b=UpuoIWF6MvaSPzfv6soZwe0sbtgkS9Yip/6za+EPpxY88tZSbeutaM1tOOPtXMjo98
         lay7woK7VDAApoAxqlQRLbPhuxlOKZUYbIQmNDiJ5bW6ZbUQJsbkuMv5nUdiFT+NNLbP
         gBU6xqQdIrog9AxJXDiPg0R5s+5bKXuXCDpLqaNuXuEsuuvpC2E8knGfZL/Sio7TzK2J
         Z1l3HccB7SpwDutagRoKVTPiOMSmUOM3eYFJgYwZ/fa7nM9bkErXQ5bTM0dbpYHg6emK
         mi0YTrwp+rqO8LHnxc1mR1w4YamccPHB7xfektTywCzzxn+3lq0+z7t7t4Cbb+qOe1Zx
         +lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147180; x=1707751980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fh1fXKNPLCGaG/VnLCvzTyh2EW511i6o4O6lrTHgeBw=;
        b=N2sBglsHC71O8wKAiP3C7xcd8ruKpH5ThLz5zolJ69Y1nxGannhdVtAUUBM2s5VEJV
         YQNRryrcDdvDXUBLyL/KwxdBZKF7dSTOxb3Acoh/yXabXpX6TRy1DP1l39krYAzImEST
         0JTbAiRni9/20sdQ3yaPHPVZ8oh2ZvmtKMnyMYClnEb0XOPjbKic53VTf1ixuyvok/oS
         RQoq3LpqdgUJmdiJdNXp99ENzEY4ffFO7k1eHlFOfzu8ItdZmESC467HVQlU8q6S7IE3
         44vSJ8p9iHejd7xeZf6DBZ557txgzUeey8NHf9PTlrwGv1z+cbhBUp6Q6BHWWt6RiQSc
         vVGg==
X-Gm-Message-State: AOJu0YxLQZ5cY5V+MvVAvWmA6Ejd463vmbeWWcoH6fVVzgFb9zfLIjCa
	GBLvH5/gyipUOEwEdYjEkbqvFSo07BKkCR6Nd4M+Y+wACBH2mU/tmjU/YGY5
X-Google-Smtp-Source: AGHT+IHUe+H4IHHtzSGa/KZg/3OWOYeEcxwYLKDEgMAfnmSQCcWtVTsDgjs4MKtetv1K08sdHB0AcA==
X-Received: by 2002:a05:6512:3151:b0:511:4ee4:48d1 with SMTP id s17-20020a056512315100b005114ee448d1mr2311431lfi.32.1707147180083;
        Mon, 05 Feb 2024 07:33:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVv0V2Sn1riFTcccMtaw4DrDISuAWzeSjJbFZLS60Bt1zzm5rHHNZZ5719o0GuJ3Zloh8JRFR0HWBsQljxCnJIG4dy4pcTfVNMkTQlozDoJRy+gAQtiuH0Yyu7MVjp1B+qAAk609pFnX4azd5lmdlumMjsLfqM3KFxVu41h95BXd3MpBtNtCWdCiL1Bpv2LylLvLH2rcDmnBclr9a0YkFLuukm6VwYXwke3MkV+2VMm2Q/gTtx+6goiKCCWRmdVMWQ2dnUbDxYKNzFloaLeXv8/PM+fSDzFGJ3wqHLedvq9nwNTljLZyK+OXWtWIvV/2JWgbGzr
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
Subject: [PATCH v4 18/30] xen/riscv: introduce time.h
Date: Mon,  5 Feb 2024 16:32:25 +0100
Message-ID: <f0a4566c185469fa9f5de41b5bbbc7234cfa9912.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - s/BUG()/BUG_ON("unimplemented")
---
Changes in V3:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
 - add SPDX
 - Add new line
---
Changes in V2:
 - change xen/lib.h to xen/bug.h
 - remove inclusion of <asm/processor.h> as it's not needed.
---
 xen/arch/riscv/include/asm/time.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/time.h

diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
new file mode 100644
index 0000000000..2e359fa046
--- /dev/null
+++ b/xen/arch/riscv/include/asm/time.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_TIME_H__
+#define __ASM_RISCV_TIME_H__
+
+#include <xen/bug.h>
+#include <asm/csr.h>
+
+struct vcpu;
+
+/* TODO: implement */
+static inline void force_update_vcpu_system_time(struct vcpu *v) { BUG_ON("unimplemented"); }
+
+typedef unsigned long cycles_t;
+
+static inline cycles_t get_cycles(void)
+{
+	return csr_read(CSR_TIME);
+}
+
+#endif /* __ASM_RISCV_TIME_H__ */
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


