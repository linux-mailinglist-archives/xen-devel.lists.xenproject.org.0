Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAA981CBEE
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659408.1029006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDL-0007Xv-QV; Fri, 22 Dec 2023 15:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659408.1029006; Fri, 22 Dec 2023 15:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDL-0007OL-L6; Fri, 22 Dec 2023 15:13:27 +0000
Received: by outflank-mailman (input) for mailman id 659408;
 Fri, 22 Dec 2023 15:13:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDK-0007Ie-IC
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:26 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7206e26-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:25 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50e70583191so93566e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:25 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:23 -0800 (PST)
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
X-Inumbo-ID: a7206e26-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258004; x=1703862804; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyAi66B5lJY94tJWtmKWdmtOpI6CB1uTFL6t5fi0m/g=;
        b=Rons/20rjHGfl/fPOMzvE0aHDMwx2GxooaFf18i49f/3t3n7RHJ+c41NAWa/QMmJds
         itHEYXYzSilRuXGZDM8ZI4azLWsi300MCdINmtlgWCNJ06qHe6m6MHeJA1Him/kqK5zW
         Y3NeZIe85yIahpigB30uNlFpMv2SjO0UObjdT1mmXv9Bzrgi287SxI8nYJAhV7uc+qkI
         JdAjqwkuGHC7fHHmVynvwrjLDGPQIPoW6PqNcP0nY6Tmg2VIlx8nAMdmDKeWmdYTQlOZ
         FPvtYsywu8XvehBJWoZidpRSANdFrcnRscglzDqTLmY+FkOIu+vfju8K38vw+VWzO7pV
         6pBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258004; x=1703862804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyAi66B5lJY94tJWtmKWdmtOpI6CB1uTFL6t5fi0m/g=;
        b=W2YVLsflFnC/AI5hizB34o99Qf9dwSvzi5FyMXxlX8iYQcAl0Ks0VJmhkIJZiVZdNZ
         KUFWNmQJPblbT9uB/Ev2BIpgP8aKeUyOQBzrIC8cPIq5kH1cZPTn9PFYL7uH86SHhLdD
         tDa2lC9olJTBXyiefy1rpixNTsx01WBAlG8PCMoJNU2U5s+8NbFSi1T6fQw13UDvjGkI
         DVE8lkKNFU1pn0juKbPPNMbpmeuwTz5+lke+UXNR35i7AH+7gNU9Mn+Y02Y+1qeg0x+g
         25rJWKP4ocNXISEXKwDtaAH1azLEn4Y4SCzYKK9jsj8ZHAhm+z8i04vNLEimpJPWu1Lq
         bxUA==
X-Gm-Message-State: AOJu0YxfdLwlTlrERDrSVsgZUhx99etqKz56lKei9NFoidIgr4lb56Bj
	KXUi7YJoFuWG9iLDb/y5cip3Jt45Txg=
X-Google-Smtp-Source: AGHT+IEs+7oMk9zQ5GgSxjUfE24HdOn2Y1G6Urt5uFHmiLl/OsPtyoUC9y51SQjsL9FLWz+ePFoRPw==
X-Received: by 2002:ac2:4d12:0:b0:50e:3b1:bf45 with SMTP id r18-20020ac24d12000000b0050e03b1bf45mr705673lfi.18.1703258004475;
        Fri, 22 Dec 2023 07:13:24 -0800 (PST)
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
Subject: [PATCH v3 02/34] xen/riscv: use some asm-generic headers
Date: Fri, 22 Dec 2023 17:12:46 +0200
Message-ID: <78a86aa86645c4c23a6294900385264c17a48864.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some headers are the same as asm-generic verions of them
so use them instead of arch-specific headers.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 As [PATCH v6 0/9] Introduce generic headers
 (https://lore.kernel.org/xen-devel/cover.1703072575.git.oleksii.kurochko@gmail.com/)
 is not stable, the list in asm/Makefile can be changed, but the changes will
 be easy.
---
Changes in V3:
 - remove monitor.h from the RISC-V asm/Makefile list.
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - New commit introduced in V2.
---
 xen/arch/riscv/include/asm/Makefile | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/Makefile

diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
new file mode 100644
index 0000000000..adb752b804
--- /dev/null
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+generic-y += altp2m.h
+generic-y += device.h
+generic-y += div64.h
+generic-y += hardirq.h
+generic-y += hypercall.h
+generic-y += iocap.h
+generic-y += numa.h
+generic-y += paging.h
+generic-y += percpu.h
+generic-y += random.h
+generic-y += softirq.h
+generic-y += vm_event.h
-- 
2.43.0


