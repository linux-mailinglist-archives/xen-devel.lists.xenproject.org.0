Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2E468DC04
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:47:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491194.760268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFY-0006SK-2p; Tue, 07 Feb 2023 14:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491194.760268; Tue, 07 Feb 2023 14:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFX-0006LK-S0; Tue, 07 Feb 2023 14:47:11 +0000
Received: by outflank-mailman (input) for mailman id 491194;
 Tue, 07 Feb 2023 14:47:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPPFV-00043Z-VI
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:47:09 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c5cba88-a6f6-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 15:47:09 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id bk16so13778586wrb.11
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 06:47:09 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm5269743wrw.117.2023.02.07.06.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:47:08 -0800 (PST)
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
X-Inumbo-ID: 4c5cba88-a6f6-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04wjIppSfpPVzws51Ad11YsV3qJmgS4kPG4tQJfLNf4=;
        b=XMoJV8dR5z5URnSW1pHXG2651WmE6/cAqmSUSIR74AEw1drpof1nTXEMFr+X0CVnQC
         ruyHe1M2Hjp0xQXl5lTu3BdqAKgn8u7w+YFTAQipFc9Mf1fjGn8aU3TLFEc2DTYHWOTh
         /x0YDoKGi0e9bUNbkEPsUnXG3OZ305OEaRMssmoJSpYnqTjrjfZ5hGu8UJkr+MUR/bKH
         ZrulfUzrqOHr+1yG+dLWGeDrm8U5AFXl8kM7dD3VDA/GHNrJjorsD183IR+m/iPqPQWE
         IB6BL56WOY0ATYXIJF/NODYlUdL2M8ljUeWWNMEtsiriC5u2zm0901GoAJufvqsm1B0M
         39lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04wjIppSfpPVzws51Ad11YsV3qJmgS4kPG4tQJfLNf4=;
        b=VfkJt/uc6YfZvvCtOH5714g8KSy/kFTkGD+FvkUT5Q8Ymlpw8eaMY8uNhNvCBCorMe
         C/Xnv9jNfGEzBD3FbJRm+JECzkRSSowgoC67ZtXUx6Y4e4ffKbx4A81J3E5/kPYOK5M3
         kyUMN5PUsgJk3gIE6/BL/kPBBpE0OgwaFUcz8iLUdUOUlXM9yYTzpIEQ0G1MKjJ/Mtt9
         fMhtw9ue7K8tsGkehjJH5lx/nqikY/NTeBj85C3rQhgowUw/ecAkTIXGT60sKh/VHGO5
         WLH2k/qiI8hOgUwkslqZpYwcngPgDDksljo0FygQ+z2kfD3cVQE0spu+oje8/sJp+Fl4
         oi2w==
X-Gm-Message-State: AO0yUKXHYBnYYpvmIKqnfch662noJEulKbes7A2TvyivQijRkPSOptmn
	LuBCkLlvFrtVaspxaUAXG8tZ0poan1s=
X-Google-Smtp-Source: AK7set/prRVjtdCwcu9cls5uhEUisXXJMLQcxLikFdoRBcez7hQhMakYkkCy/B2mJ/m3CNweMzJqQA==
X-Received: by 2002:adf:db88:0:b0:2bf:ec8b:3a5 with SMTP id u8-20020adfdb88000000b002bfec8b03a5mr3517884wri.46.1675781228864;
        Tue, 07 Feb 2023 06:47:08 -0800 (PST)
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
Subject: [PATCH v3 10/14] xen/riscv: mask all interrupts
Date: Tue,  7 Feb 2023 16:46:45 +0200
Message-Id: <9fb09c8b7fd5c0caf1e577788e173ee6ecceac79.1675779308.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675779308.git.oleksii.kurochko@gmail.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V3:
 - Nothing changed
---
Changes in V2:
 - Add Reviewed-by to the commit message
---
 xen/arch/riscv/riscv64/head.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index d444dd8aad..ffd95f9f89 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,6 +1,11 @@
+#include <asm/riscv_encoding.h>
+
         .section .text.header, "ax", %progbits
 
 ENTRY(start)
+        /* Mask all interrupts */
+        csrw    CSR_SIE, zero
+
         la      sp, cpu0_boot_stack
         li      t0, STACK_SIZE
         add     sp, sp, t0
-- 
2.39.0


