Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C672D6757EE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:00:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481852.747023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssB-0006TT-F0; Fri, 20 Jan 2023 15:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481852.747023; Fri, 20 Jan 2023 15:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssB-0006Qa-9d; Fri, 20 Jan 2023 15:00:07 +0000
Received: by outflank-mailman (input) for mailman id 481852;
 Fri, 20 Jan 2023 15:00:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIssA-0006Kg-Kp
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:00:06 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f2c6d41-98d3-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 16:00:04 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id q5so446762wrv.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:00:04 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm25349811wrf.95.2023.01.20.07.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:00:03 -0800 (PST)
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
X-Inumbo-ID: 1f2c6d41-98d3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdJWy2GyyPMWYYMwJzkpPQcfarYfLa10k8GzdHzPycE=;
        b=Er9zoaiiNyWIWfHDMD470bbi4Zz3tdV8DN05fsuan8dbyx78bKtmVTTo4bU1Cg1awG
         T7fZydsXNEkQ3kJ0nldnW1FVrCtWmqDD2Q2NU/oUvbcOhzjckPaRi2CAU4MtPas4vWgj
         NxRYyzD2LUmZThsbQbKK/DEWrcrAOAWJi15HL7edUeHNcnA8lvzB9AInzaowADJ0G87h
         KUL8vodHoOoksVXC3/ZxopmY2SgKL5RJ+tnjrEMBh5IzLrCB6E06ymL4IJsn7+UMXgvX
         ySw3uPCNJpxOoVwfPjeHcvzUOUlXLer9Z/eVGLlxjusFklGaOR7HHR7AMBNJtG9lMfmt
         kAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdJWy2GyyPMWYYMwJzkpPQcfarYfLa10k8GzdHzPycE=;
        b=4f1BAzpK5cWYr72FIVLYkUCwjulp76EPev7GntLIPzjmkcFFoV6AJg2oUPxOhWc3LU
         iTXoeWTJiLeJ7YHthTGasuFPZ2IsMbEq0Merh90hvbDglJ+p2nJF6TpZavZyxJVsfGSA
         xRffv1IksIsAVyURnXxSK3z2RA3Ey+7E50NcaHNPU9y//c2i/xp1F3p0MPR6yHd8wG4M
         8T0JfHRaQ6WeB8UgM0UTNtKnE8f7G980CbUdaoKKcn70v1UxoEK1bf3FhED3jCV2RUnP
         nFYcryMWeLW9yd36lux3D/hN8f4ZyubHqDgRGoV0MJ+E5vkkd8CiezmRIf7M/kZRgmrC
         7Urg==
X-Gm-Message-State: AFqh2ko/g7h7E+8UckCPETjUNrKDSdyDHZCzt03nWX3p5HrGlJ73uXb1
	LEjpUFZyrhwA0Z5BnINPv/2kmuM13rlcjg==
X-Google-Smtp-Source: AMrXdXshJNbFI2XKD0qvr5w1+/CBeJPMSxuJJi9X/3yY5cbivt3jq88eV9wQsfvXjtkP2JvcExQyyg==
X-Received: by 2002:a5d:688a:0:b0:2be:51a2:c6e2 with SMTP id h10-20020a5d688a000000b002be51a2c6e2mr3573756wru.39.1674226803908;
        Fri, 20 Jan 2023 07:00:03 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 01/14] xen/riscv: add _zicsr to CFLAGS
Date: Fri, 20 Jan 2023 16:59:41 +0200
Message-Id: <3617dc882193166580ae7e5d122447e924cab524.1674226563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674226563.git.oleksii.kurochko@gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Work with some registers requires csr command which is part of
Zicsr.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/arch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 012dc677c3..95b41d9f3e 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -10,7 +10,7 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 # into the upper half _or_ the lower half of the address space.
 # -mcmodel=medlow would force Xen into the lower half.
 
-CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
+CFLAGS += -march=$(riscv-march-y)_zicsr -mstrict-align -mcmodel=medany
 
 # TODO: Drop override when more of the build is working
 override ALL_OBJS-y = arch/$(TARGET_ARCH)/built_in.o
-- 
2.39.0


