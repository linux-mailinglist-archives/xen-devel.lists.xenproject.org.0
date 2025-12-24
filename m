Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD8CDCE99
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192948.1511960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSGz-0003Fk-3v; Wed, 24 Dec 2025 17:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192948.1511960; Wed, 24 Dec 2025 17:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSGz-0003Cg-0n; Wed, 24 Dec 2025 17:03:41 +0000
Received: by outflank-mailman (input) for mailman id 1192948;
 Wed, 24 Dec 2025 17:03:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSGw-0003CV-UR
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:39 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d646a97-e0ea-11f0-b15c-2bf370ae4941;
 Wed, 24 Dec 2025 18:03:38 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b734fcbf1e3so1217307366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:38 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:36 -0800 (PST)
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
X-Inumbo-ID: 7d646a97-e0ea-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595817; x=1767200617; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpMnoBhXlHEbQcv+4CcUZ/GWflidq/CRvs1qhabX/PA=;
        b=G9pcf8rlJ11GmoH/zo4K3aolXbeoCsyXum94q4bVwUbKf0QT5vjesdVZUjjg0isMZE
         TDJsGkKmA4qrG1mxMogeVEN10wJqks8CnSJFhvQzpYh1WFbDZgst2KqDDTBxjF3F9tan
         62VA/L7m3D9mZbaYU2A/6Oe/Wcb1W5tUcuHIjqMmPJu/UrhPDw/jxl5OsUfWIpkDUgft
         RfJ54hdhHbsQ4y1CJ6sRmR0aQKwXdkvWuJDVZDfq931p9T1iabOXLwzskzBIPgGU8gYk
         PlM2acAO3mrJb9cJ+yI79QYDTCgmZuX58QXaoBjciBgW0cDlfgH1A6reYOHZVZEcbXa5
         qZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595817; x=1767200617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wpMnoBhXlHEbQcv+4CcUZ/GWflidq/CRvs1qhabX/PA=;
        b=VB7wog8KxkkodcztIlpg3sMV8M1F+w5GrYANATkHqRNhet4gyGbW58EXQ/9Nx6p0sg
         p8kghPCCn23RFXW6pUoDUJOj97qrl61Q58HhC26gBIw2+yQXdwR6j+vHWYUGqxaJkwze
         5/AICg9h+bOHljtH3CEuxYsoWlFLY5SiiuR3ic27InGpwRPO67ZVzpOZ6oe/pMqqzD48
         DGF8QZMCoI+cv9jCj9vHMWhSaEo2wKQc3FHLyuSIeTsBP3GYTXoD2oB0WWlG5eGuHNvy
         GQ/BphQHzgvb6R4ZEX1/7Qu59gO/7b+0PDbuuC7OIpoOSKoRgbo/EoF0fpghoXW7e2nR
         Vb+A==
X-Gm-Message-State: AOJu0YxCRrr3SXAN9V2Q13yfF8yWbdBDjj60GV9YPNxUzTvWItSxntrX
	Kg2s/jfNnXW5htHrGSs/WkR1h0GEQsoWsHWIvthMTOY/D3iZiLEZ/374nMGEfA==
X-Gm-Gg: AY/fxX5QqjLhE0cyJZ9v5CY4t04PXMwbhHMIx/72QfXAzYQEkHODPr9QIdJZEBdk8kY
	TnrRG3Eu0T/fkydAwf3/UDOoAUJIzjXPq5uqQF75TPgIqu2zud0v683n85kri/jvDA0vrkaYae7
	uX1IVxaGB2xm0sWnx/g2uLddXdEuLfUa5h60kp/RKH4tii+NQ1WwY5RkAppoTcj/bUDXilcR8pq
	Kwbcos58yohcGzbD1DpeuLvMG6tUDFQRUQWOqaEY6dJsSHLX44rWcVbkh48zQ9NDsRTPbk4jfIq
	S2j7HjEJEa7PmRyLVAr+gz62Puprh6Adb4yXCQoAbllUM4Bk8KcaFccXFy0ab7sMCGWVxoOvMC0
	m94GsDQ8XOj+a8pvVnFcdW0tq7RDYykuJwfbKgRzQ818Vgx7xC+HjuuN+A6kf5ckI91MmGGH59c
	hpyeh6dwehc+nxnzpuszA3rqDhSTYyIelt4omicjhRghm1jucicorYHHY=
X-Google-Smtp-Source: AGHT+IFGQXiCGFZ8YkznAaepnlm3r06T108zPJKrH4/O/E2AgvWDQNvAco8SXKUUx+l0Bwryvt9Q1w==
X-Received: by 2002:a17:907:7245:b0:b83:13ee:5875 with SMTP id a640c23a62f3a-b8313ee5957mr212455666b.50.1766595817168;
        Wed, 24 Dec 2025 09:03:37 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 01/15] xen/riscv: introduce struct arch_vcpu
Date: Wed, 24 Dec 2025 18:03:14 +0100
Message-ID: <3b531dff3755da010664111cf7d936ccba7c1f5d.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce structure with VCPU's registers which describes its state.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/domain.h | 58 ++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 316e7c6c8448..639cafdade99 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -22,9 +22,63 @@ struct hvm_domain
 struct arch_vcpu_io {
 };
 
-struct arch_vcpu {
+struct arch_vcpu
+{
     struct vcpu_vmid vmid;
-};
+
+    /* Xen's state: Callee-saved registers and tp, gp, ra */
+    struct
+    {
+        register_t s0;
+        register_t s1;
+        register_t s2;
+        register_t s3;
+        register_t s4;
+        register_t s5;
+        register_t s6;
+        register_t s7;
+        register_t s8;
+        register_t s9;
+        register_t s10;
+        register_t s11;
+
+        register_t sp;
+        register_t gp;
+
+        /* ra is used to jump to guest when creating new vcpu */
+        register_t ra;
+    } xen_saved_context;
+
+    /* CSRs */
+    register_t hstatus;
+    register_t hedeleg;
+    register_t hideleg;
+    register_t hvip;
+    register_t hip;
+    register_t hie;
+    register_t hgeie;
+    register_t henvcfg;
+    register_t hcounteren;
+    register_t htimedelta;
+    register_t htval;
+    register_t htinst;
+    register_t hstateen0;
+#ifdef CONFIG_RISCV_32
+    register_t henvcfgh;
+    register_t htimedeltah;
+#endif
+
+    /* VCSRs */
+    register_t vsstatus;
+    register_t vsip;
+    register_t vsie;
+    register_t vstvec;
+    register_t vsscratch;
+    register_t vscause;
+    register_t vstval;
+    register_t vsatp;
+    register_t vsepc;
+}  __cacheline_aligned;
 
 struct paging_domain {
     spinlock_t lock;
-- 
2.52.0


