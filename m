Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15387F720F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:51:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640527.998896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tlu-0000XG-NJ; Fri, 24 Nov 2023 10:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640527.998896; Fri, 24 Nov 2023 10:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tlu-0000TI-JY; Fri, 24 Nov 2023 10:50:54 +0000
Received: by outflank-mailman (input) for mailman id 640527;
 Fri, 24 Nov 2023 10:50:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTV-0006hx-Cz
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:53 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a857fd8c-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:41 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-54af61f2a40so557238a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:41 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:40 -0800 (PST)
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
X-Inumbo-ID: a857fd8c-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821901; x=1701426701; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewmvPOWcxXxVUGRPLKOFAXBqTtU96ll1emuQx9tNHgs=;
        b=bfVZqK9fokeP/pPx6ZkjXIbFwxzdZFmSYAbmqS7NRy31a5UxDzEG2WcpIaM8lSiKUo
         4lEW37+jeXgv7SrRWJp6vGk/6XzxMlMsRGIlfMusaILtnUGbKe9kijDgiQEeOjazHszR
         aK870EAiL1PUXrhpuA149vt0X9RaAglkXtbcNysNTvMAyz6FfQfzXwdNYTfefIDSAShk
         yKQycy6/jrtTgIboh+PuHEOvGhfh7TD3r0VLQFngNW1oVpjW5PY4UINvTF+JqdZupuGg
         mTzMrR6cf487fTQuCzS3NmIDAR9iU977QkzaJJDFnErKqOuTDAFjbNkKiLliYuadMYFH
         Q7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821901; x=1701426701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewmvPOWcxXxVUGRPLKOFAXBqTtU96ll1emuQx9tNHgs=;
        b=a3qSTrUA2/fjMuWZqcxWkFrgWq4GiCmkAAGyaOg6fPFUFvcSDRUYrzxaGmqTCfyc8n
         fqWFntaIO2kQUHV47bdlPl4dGRrd/qNm3nPvvVFAAT9l6M/63om0bDaf0Puue/rfs9DX
         /NP3j4+exya01tQtOtdeh3ILVfc1p3tHZxbXZZQOC21/YJUzFLYkVj6AsgW2pBg81doe
         oawxyPd0ocyWcBOQt6Z20EZNk+Eafd/jUaoIxZW1IVCfOEbIR9QZO6QFG5zV1i5saJ5r
         7CyD/vtIzJls/hyMRr0u+lo4FbJCpdifaKUGGk3jVRf84iLwzzyp56UCYDyWh7w1xRRC
         zG4Q==
X-Gm-Message-State: AOJu0YzjVyotOPdq2TRnQO+UIB/eXA7eAPHEXPP69uNYrQ2vEXpIrIlF
	qmmdrzDqIS8KctbJNOrafjZKOU+mvfyeQg==
X-Google-Smtp-Source: AGHT+IEwu6D6lPHMTWs7SWKMKn6i4rjMA0EnoJMbAbbZBjIMTQE4NAUTFH75Ae7qP7ba4XEn4c63AQ==
X-Received: by 2002:a17:906:b34f:b0:9fe:3b2c:d044 with SMTP id cd15-20020a170906b34f00b009fe3b2cd044mr1555143ejb.44.1700821901182;
        Fri, 24 Nov 2023 02:31:41 -0800 (PST)
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
Subject: [PATCH v2 30/39] xen/riscv: define an address of frame table
Date: Fri, 24 Nov 2023 12:30:50 +0200
Message-ID: <13ad41657814e4fc235772fa0928de1723ae7c3d.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also the patchs adds some helpful macros.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/config.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index f0544c6a20..8d2103b3ce 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -77,12 +77,31 @@
   name:
 #endif
 
+#define VPN_BITS    (9)
+#define OFFSET_BITS (12)
+
 #ifdef CONFIG_RISCV_64
+
+#define SLOTN_ENTRY_BITS        (HYP_PT_ROOT_LEVEL * VPN_BITS + OFFSET_BITS)
+#define SLOTN(slot)             (_AT(vaddr_t,slot) << SLOTN_ENTRY_BITS)
+#define SLOTN_ENTRY_SIZE        SLOTN(1)
+
 #define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 - GB(1)) */
+
+#define FRAMETABLE_VIRT_START   SLOTN(196)
+#define FRAMETABLE_SIZE         GB(3)
+#define FRAMETABLE_NR           (FRAMETABLE_SIZE / sizeof(*frame_table))
+#define FRAMETABLE_VIRT_END     (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
+
+#define VMAP_VIRT_START         SLOTN(194)
+#define VMAP_VIRT_SIZE          GB(1)
+
 #else
 #error "RV32 isn't supported"
 #endif
 
+#define HYPERVISOR_VIRT_START XEN_VIRT_START
+
 #define SMP_CACHE_BYTES (1 << 6)
 
 #define STACK_SIZE PAGE_SIZE
@@ -95,6 +114,8 @@
 #define RV_STAGE1_MODE SATP_MODE_SV32
 #endif
 
+#define HYP_PT_ROOT_LEVEL (CONFIG_PAGING_LEVELS - 1)
+
 #define IDENT_AREA_SIZE 64
 
 #endif /* __RISCV_CONFIG_H__ */
-- 
2.42.0


