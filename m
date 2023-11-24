Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B06037F7176
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640371.998453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSy-00087O-4z; Fri, 24 Nov 2023 10:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640371.998453; Fri, 24 Nov 2023 10:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSx-00081B-PK; Fri, 24 Nov 2023 10:31:19 +0000
Received: by outflank-mailman (input) for mailman id 640371;
 Fri, 24 Nov 2023 10:31:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TSv-0006hy-6o
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:17 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99522883-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:16 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a011e9bf336so244134566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:16 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:15 -0800 (PST)
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
X-Inumbo-ID: 99522883-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821875; x=1701426675; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9Qfqqvtj3aHFLh9KWlN3SC+z0gEd6MLnGuBtY8Y9eY=;
        b=JzgH3/tJlZfhTjQu05LUKZz3VHQ+xI+m4zAUD9eXAwquK7Nh5dZHmRidotGYJ3dwND
         eVaSaID6ZzGZoN0hEwDfK10VUH10OcS414MESKwk0Cq54JSSW0xW2VngFseXhgUtvH+C
         rpnqgpo/ZThwYFwHi6OQO2xL6RIP4Gzhrz3G1woTP+AaqtLpIe/rhN9M3UfgSLSLfz2/
         iYb4d3ojPLgjiUZvgOtg4Ri9Qd4gCs6OroLnYtfkzde7T3eOgOyG/bUE043f60NbG7p2
         lY78OuCOmH/n+MKrtgcBvypqf7rywXj0F7AdYe8jpdIKJdVBDBnLPRuSJ6AfwuwNYmMk
         8Mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821875; x=1701426675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9Qfqqvtj3aHFLh9KWlN3SC+z0gEd6MLnGuBtY8Y9eY=;
        b=hwLsVdqgK2AAH7tvaNbWSpcbzdFKNRc+kwzM06csTZxV7VmAP3TqD1SCAR/lu8mK4y
         eR/HDwSS5NsiJGSpQOmOsLtxvvD+XkJG0JH6l6IwP5Wx7YqAzNbXZP/+mmSUzgUlMPfI
         7NfWTPkRAomSNYVvMYT/vp8EMxd41qYOq4ueLsmnaJpfF/mF5mtqbBMtIbFaAY77rEQR
         KypJP44CGpZu7a3jc6N2uQ5o7eVF6WJWGCpMHbgQESFNLSG2tDDH+fn9JttJxTNE0WjP
         mGdlSySleWWqGI6oXDHaE33CAd+YhoSPEM9iFmnCvDklnDpepVNYY1IOFKr2tEl62Uk3
         Luig==
X-Gm-Message-State: AOJu0YyBxniQZSj/Rdlk/j0S1yNmoMB2+znsvtQkAti4iojiTuPbQ0ny
	pf5ACpgiHrPa26BsqDlHclDvbmoLUka03g==
X-Google-Smtp-Source: AGHT+IGqrUtyiFIgVUUYv9l40qBmcH4R8M7MJGt1o/ugLzaO/hXzIREStbdFMS6dI0Zm+clnLWUpGA==
X-Received: by 2002:a17:906:4710:b0:9fb:1894:a84 with SMTP id y16-20020a170906471000b009fb18940a84mr1482441ejq.39.1700821875354;
        Fri, 24 Nov 2023 02:31:15 -0800 (PST)
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
Subject: [PATCH v2 06/39] xen/riscv: introduce fence.h
Date: Fri, 24 Nov 2023 12:30:26 +0200
Message-ID: <225f7c6eac811dfd6afbb188c869557c5465ecca.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/fence.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/fence.h

diff --git a/xen/arch/riscv/include/asm/fence.h b/xen/arch/riscv/include/asm/fence.h
new file mode 100644
index 0000000000..2b443a3a48
--- /dev/null
+++ b/xen/arch/riscv/include/asm/fence.h
@@ -0,0 +1,12 @@
+#ifndef _ASM_RISCV_FENCE_H
+#define _ASM_RISCV_FENCE_H
+
+#ifdef CONFIG_SMP
+#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
+#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"
+#else
+#define RISCV_ACQUIRE_BARRIER
+#define RISCV_RELEASE_BARRIER
+#endif
+
+#endif	/* _ASM_RISCV_FENCE_H */
-- 
2.42.0


