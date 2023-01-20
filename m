Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B430B6757ED
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:00:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481862.747114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssM-0000O3-MH; Fri, 20 Jan 2023 15:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481862.747114; Fri, 20 Jan 2023 15:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssL-00007D-NG; Fri, 20 Jan 2023 15:00:17 +0000
Received: by outflank-mailman (input) for mailman id 481862;
 Fri, 20 Jan 2023 15:00:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIssJ-0006SQ-9R
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:00:15 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2477e016-98d3-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 16:00:13 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id d2so5080529wrp.8
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:00:13 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm25349811wrf.95.2023.01.20.07.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:00:12 -0800 (PST)
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
X-Inumbo-ID: 2477e016-98d3-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fe0eCk7Y2xW3r2WIytl0p5j+qQaI829KhiJfOtG83A0=;
        b=jIUmaA3XUraRJJAH8KPW+MjheJZlQAEZXAlkV0Ekv6KkzdeBGH6ASGvkvjUuZR3iRk
         jFH42EV6W1820nMwJzNCphjSLDJSORRv2AdRNgZ5Gz5ElEVhihzFpFR0uwJ5F9mwHb/j
         9Jw7/wVoX8dDHcgKIsl2GLJei9hOUAXCoVSIjwy526yJZgkuenlbbgIcXuj2uNiRWlLf
         u1Je+p+2pvDKaeOIMQepTEKid/NT7ocuqFG/IkZ4ol9MhynxB6h7CNvMrirj6MEIH/Cr
         AXrBP3ia/L2S4UEXWHrikcecXqQpBht4EEI6g59oNvuwpT2fnad0XfZNBWTJyHeAdYfl
         +qmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fe0eCk7Y2xW3r2WIytl0p5j+qQaI829KhiJfOtG83A0=;
        b=6bwNmsKrHgjf2bVGDuDggUrKu8VtRR/ryn9Jg1ZjLcHIO7jGypCrlDByUDeeVjOiba
         ibNtakYza21jH+T/UFXNWeXpPDRYmnPlC1L4lI3DfFs+Qv8MWpJvC0Uq597z8VA0YqOP
         YPNdEUMFnXsk5Q6So2l58+LCgSJKf7WZJATrPPJSr25Apc5kJXVyoS09evMtlfB/7Zfs
         J6vQfGaITPhEvmu9cA/GmhuBYvpqVVqDhvMv7UEiuUVeSxCHy7Fr5ddz1dRm2dAi5P2R
         9dXARTbR25TWKszGlnYyVS8S6+9xF9/B17z4VfS3bh2bA0fGb2IneL9QzDULKl+fmWoa
         Va1A==
X-Gm-Message-State: AFqh2koP8136qBBwKP1pgrnwNAkM0NuutpRH/LFjzGrt444m2n0+4lKa
	XPZi+B9ciNoCYW286xwYINRq+tLamRLvVg==
X-Google-Smtp-Source: AMrXdXt4JWVsRr18Xw60hT1COAZWenDPxPHrl7+0Iefg1VDxeFvBkM2RgM3zdh5s71wY+nqBE3s5Rg==
X-Received: by 2002:adf:e310:0:b0:2bd:d8f1:2edf with SMTP id b16-20020adfe310000000b002bdd8f12edfmr13237260wrj.49.1674226812961;
        Fri, 20 Jan 2023 07:00:12 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 10/14] xen/riscv: mask all interrupts
Date: Fri, 20 Jan 2023 16:59:50 +0200
Message-Id: <0153a210de96733880fb3f6fddd902862cc2eaca.1674226563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674226563.git.oleksii.kurochko@gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


