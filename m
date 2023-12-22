Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AD381CBEA
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659429.1029143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDk-00048k-0W; Fri, 22 Dec 2023 15:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659429.1029143; Fri, 22 Dec 2023 15:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDj-00043a-SB; Fri, 22 Dec 2023 15:13:51 +0000
Received: by outflank-mailman (input) for mailman id 659429;
 Fri, 22 Dec 2023 15:13:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDj-0000EM-02
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:51 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b58da1a9-a0dc-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 16:13:49 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50e67e37661so1184941e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:49 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:48 -0800 (PST)
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
X-Inumbo-ID: b58da1a9-a0dc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258029; x=1703862829; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWwkk+l5mzS2Ajj9aN3c5hR5kvo5QNNQX7kNmAH9sI4=;
        b=IwpcrHrO4MbvNr7H4xhkkzT3JwI09ySeyI5JB0eck1+Fs9QFfoiy7TnJBzBmnzaVtr
         f259wIVgvbYEk5XBwqNsoqExXe1HQdzleJ3Z6Z9SW9JnLzDBTNI7YoV3/epNMFt7IBFB
         FTi4OXiFGiu1+03khqOjR0eTryd73kYOB2ow97OPWqvClfGGq7aNGzdhBtpzze+QL1rd
         Oy2PzEeohwZstGEj4vSIlzy9RLLnfEJeP2s6CtBI2QFS4mlukZ4dtU0MF+46wL9jGjO6
         hwP/amQdiOoxcLDvJaBtqnKQTOzFJP2l0sc+pN3E6XF1WV2PU/025IaCAMr9UNuJUkv+
         IHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258029; x=1703862829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWwkk+l5mzS2Ajj9aN3c5hR5kvo5QNNQX7kNmAH9sI4=;
        b=fsRSLDnwAc5Q4Fz9V2teGJfTnZ5zPBoOJJuYDCrgDbQ17UtyS/ZX3fbR1zKj4QiFBC
         oKFLYuWLaalULEPuZ8cAAJbXmbtgMwz0mRnpSpY7kt1T2giuwrZ02sABP7lJbNHTQmxc
         Aua6k0umqxXjXr4TVkJvP3V5Dqk/Kx+1/VXizJAOAItXvKTygCjUMKyBZaSv3d+SQhtN
         Bh371l1Sqxxj7SN56PIuu39PcKrV5192XuNHGiKD5Yzx3/nnROewh5kVnSsTMaO5Szlv
         ZY4wB3DgrwWvzsaeh7lcy/knUcY027HxrMp+QxZ05S7meG3j3QveH/YP5o7K8FbBJv1S
         TM0g==
X-Gm-Message-State: AOJu0Yy8FFttjG7Xriq/y7Ywq23vAQVpltbx6pQ7QjzGx3+sWxDC+7Yu
	Q6cUUYQ10CWMj3q6boC5qnwazKlTQ+0=
X-Google-Smtp-Source: AGHT+IFdcyll+q9mn67kayTVvaW/q+8atY73YlGwgPnjqTrlpeG5g0NRR5j4/49y198Tu75srv+yUg==
X-Received: by 2002:ac2:5e33:0:b0:50e:6b48:5407 with SMTP id o19-20020ac25e33000000b0050e6b485407mr500089lfg.82.1703258028542;
        Fri, 22 Dec 2023 07:13:48 -0800 (PST)
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
Subject: [PATCH v3 23/34] xen/riscv: introduce time.h
Date: Fri, 22 Dec 2023 17:13:07 +0200
Message-ID: <999bc036ac92124e51b42896647c4d249cd7b8b7.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
 - add SPDX
 - Add new line
---
Changes in V2:
 -  change xen/lib.h to xen/bug.h
 - remove inclusion of <asm/processor.h> as it's not needed.
---
 xen/arch/riscv/include/asm/time.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/time.h

diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
new file mode 100644
index 0000000000..1f22af3bce
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


