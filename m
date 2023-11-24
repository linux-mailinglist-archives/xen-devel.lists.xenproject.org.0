Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF0C7F716B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640370.998446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSx-00081D-J4; Fri, 24 Nov 2023 10:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640370.998446; Fri, 24 Nov 2023 10:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSx-0007xN-E2; Fri, 24 Nov 2023 10:31:19 +0000
Received: by outflank-mailman (input) for mailman id 640370;
 Fri, 24 Nov 2023 10:31:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TSv-0006hx-0G
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:17 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98742273-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:15 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a0029289b1bso245212366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:15 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:14 -0800 (PST)
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
X-Inumbo-ID: 98742273-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821874; x=1701426674; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Lx0hMMCNqeH/OzTGMdTqOhOkAZcvL6csJ3mh/hZCkY=;
        b=bKoZHEwAI9ZgfuDOucs2uf2/Il4jRv16pqkp3+WEBsh6LHbit3arBetN3ZX25FFfLp
         BV/t02jV/iyHAxrtZbJvlbCSrGdcsEPvAB2ZUq8/sbjFV4F3TOTcE+Hqd4fwqjNwsX00
         QR5IGg+m8txSOpo63vVfWV89nOsspRgU8rnDJ1UK5AlCw+opHu98PgajKGNr3u80olkp
         kIG8NI82hpebRlpGYFEb43/aKZ1dDd9n8jSoAQiRSVRK84tegqvLOy0Hwslvtry/scuj
         f0cMjhO2mpBo2liu2xxP2hrvDvVqJT7I4qvD+ekkAWF9I05tPWK77MBX1UcsKhvNdxVL
         wZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821874; x=1701426674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Lx0hMMCNqeH/OzTGMdTqOhOkAZcvL6csJ3mh/hZCkY=;
        b=tHkA5ltzybEbJ9ycvOwZ10f80v2cz3aDIfxj6ADs50uPfpcimKK48mUuvsH9Bpn92A
         k/df+imGWaR2mQzwOdkQOY99V/9hS0XHmk2+IH2UzZYGsy7s1b4MXVP/jnYA4q/4dMUN
         ABcvHftDfLon0PXXWh2vptC+ICSuoaew3bxullQ8D7UJZyRzoVX8MSAHE9dcvJI53kWc
         /66RvV88Ty43Uml8s6Y9bi9B+BMf3JsqfFtBAhjI0oBzN/at4CQtwrzf3mu9cMhAuBqH
         FA80c6/ErxQqQH1yHuzYTqRzpvWY9JXSvxY4OXR8Xuvdyz11IGBxSc/f5Q0iJNc6wtv5
         PnIw==
X-Gm-Message-State: AOJu0Yy1bwvt4yc/PEqQTSQtqxsKXZTcH5OZa9jdG4MkRa5tl4GyVcom
	ml5DceSl/LIdBMCKojL9RGHptWmgxuounA==
X-Google-Smtp-Source: AGHT+IGyNhQbLYbMxeMUFS3S1mxFC2Z7Epqy+ZmWtl3ykPr1DzfXKb3M/5GNJzQgNuzq2AWM2FV7Vw==
X-Received: by 2002:a17:906:375b:b0:9c7:5667:5649 with SMTP id e27-20020a170906375b00b009c756675649mr1623343ejc.73.1700821874541;
        Fri, 24 Nov 2023 02:31:14 -0800 (PST)
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
Subject: [PATCH v2 05/39] xen/riscv: introduce spinlock.h
Date: Fri, 24 Nov 2023 12:30:25 +0200
Message-ID: <342e330232db63454ca368aa7b5bd100c944b1e8.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - update definition of arch_lock_signal() to not violate cod style.
 - update definition of arch_lock_signal_wmb() to use WMB aspect.
---
 xen/arch/riscv/include/asm/spinlock.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/spinlock.h

diff --git a/xen/arch/riscv/include/asm/spinlock.h b/xen/arch/riscv/include/asm/spinlock.h
new file mode 100644
index 0000000000..bf45a7f005
--- /dev/null
+++ b/xen/arch/riscv/include/asm/spinlock.h
@@ -0,0 +1,15 @@
+#ifndef __ASM_RISCV_SPINLOCK_H
+#define __ASM_RISCV_SPINLOCK_H
+
+#define arch_lock_acquire_barrier() smp_mb()
+#define arch_lock_release_barrier() smp_mb()
+
+#define arch_lock_relax() cpu_relax()
+#define arch_lock_signal() ((void)0)
+#define arch_lock_signal_wmb()      \
+({                                  \
+    smp_wmb();                      \
+    arch_lock_signal();             \
+})
+
+#endif /* __ASM_RISCV_SPINLOCK_H */
-- 
2.42.0


