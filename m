Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C776A951D
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:24:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505761.778695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2aW-0000Cw-PD; Fri, 03 Mar 2023 10:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505761.778695; Fri, 03 Mar 2023 10:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2aW-00008k-LX; Fri, 03 Mar 2023 10:24:32 +0000
Received: by outflank-mailman (input) for mailman id 505761;
 Fri, 03 Mar 2023 10:24:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y5Qx=63=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pY2aU-0008Jc-Sb
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:24:30 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 956307ef-b9ad-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 11:24:30 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id x6so1842866ljq.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 02:24:30 -0800 (PST)
Received: from fedora.. (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 j22-20020a2e3c16000000b00295a36fedadsm239600lja.26.2023.03.03.02.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:24:29 -0800 (PST)
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
X-Inumbo-ID: 956307ef-b9ad-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677839070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hWSEJWaX2x45VFZiclMK6V02iZ6pYreDLKtpiIaFEE=;
        b=DJtBoNyFaPY6Y8DyhtlVv5Wexjw/KD5WP54xvy0rew+0Oxi6sVywT5imDVMCpnloRX
         zoowAylmc66Gb98GPvMCD6Z2Qxe/8XHxjg0EPWm018AEAZUiTlWyZ1eM3yA7f4TFearY
         NN+xDvuwLp4wZ16va9WQL8US2kURVt0Ma+k0ngP/GhnXJB4Ic9n6yQGX15+VtpDgWahP
         IU9sR3X0UdWLPGvmnW4aHao3jZuMgZL8j6MrBwiRv6rE92Bq5/kqb0mgXj/Cui6UGXV5
         Alunl4NBfJoKypEcR/iTmBWutJgveWV7Lzq9Lfhr+lcgzUSGPKClscrLkx8tIRR5GAqD
         /aGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677839070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hWSEJWaX2x45VFZiclMK6V02iZ6pYreDLKtpiIaFEE=;
        b=XWHcNWxVth0sigScG0SbyiyVWfzkbanD1jDDwnyCKRgrUQmElUm0iCnRzYYuQvNUGH
         oCTD4PKGwXd0wO5tO07FQS01FVLiVbiwX80UufwrpaA2xa9P1cxsbp2CeKQnBDXm9yR2
         ofalv+nhvSvEXkjXtbGs5zo0btYnBrAzCzEeUOz/j/U6YLkF5wV8ciqBLU6dTv+Bszij
         2M37qBvo2vrde+HnTGRpWya6eEpJ6QmG6w0iS7aW5nnYIeYZT8Hgbx4XPQLquOTC24I/
         6vEBhEAVGrgQJy1QoJ0NUkIjYB6AJzA6a5KAyJffmGc4d0eSb1hkBNOaN3z8wC39QxWY
         dnsw==
X-Gm-Message-State: AO0yUKX198+ku05Fz79FxfvsY+SWVlNUGMtvObWBnmmQ2+/tqQYeY4z6
	KdN4ovqWMIcNoiSStWgan/Nl6IXecXM=
X-Google-Smtp-Source: AK7set+fSh/GHl42poB+55Nk4PbUJa0DzugZ3Cmcz6LJpvrxYddqCr8zJzQZJ8SFWUCOW9Qp+TgwCw==
X-Received: by 2002:a05:651c:2110:b0:293:38e0:cac8 with SMTP id a16-20020a05651c211000b0029338e0cac8mr588442ljq.16.1677839069820;
        Fri, 03 Mar 2023 02:24:29 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 1/3] xen/riscv: disable fpu
Date: Fri,  3 Mar 2023 12:24:22 +0200
Message-Id: <1fe0c827b9e5c2fef569e25ad7ca377111228d29.1677838213.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677838213.git.oleksii.kurochko@gmail.com>
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable FPU to detect illegal usage of floating point in kernel
space.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/riscv64/head.S | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index ffd95f9f89..52fa41c778 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -6,6 +6,13 @@ ENTRY(start)
         /* Mask all interrupts */
         csrw    CSR_SIE, zero
 
+        /*
+         * Disable FPU to detect illegal usage of
+         * floating point in kernel space
+         */
+        li      t0, SSTATUS_FS
+        csrc    CSR_SSTATUS, t0
+
         la      sp, cpu0_boot_stack
         li      t0, STACK_SIZE
         add     sp, sp, t0
-- 
2.39.0


