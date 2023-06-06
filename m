Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D75724D92
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 21:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544187.849793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm6-0003R9-5Y; Tue, 06 Jun 2023 19:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544187.849793; Tue, 06 Jun 2023 19:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm6-0003OZ-0o; Tue, 06 Jun 2023 19:55:26 +0000
Received: by outflank-mailman (input) for mailman id 544187;
 Tue, 06 Jun 2023 19:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymfh=B2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q6cm4-0002er-1t
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 19:55:24 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 120e5a7a-04a4-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 21:55:22 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f611ac39c5so6324491e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jun 2023 12:55:22 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j29-20020ac2551d000000b004f1383d57ecsm1563284lfk.202.2023.06.06.12.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 12:55:20 -0700 (PDT)
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
X-Inumbo-ID: 120e5a7a-04a4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686081321; x=1688673321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5ZlKuhoRDHAHEke7zy4B0qROcvwjfCq2K3tRqo2H9M=;
        b=YZ6C4Se0SQL9HgctTBmHpY8KVbIgMujcltWIX4TOTMQExmGRAxe1gkS6ctvFACrp3O
         AL/vpiYPZcMu+OdCzIKaoAUXI+BKSSF5zRoLw35yDnqhzBeXnkUvhdKjg023fXttztMZ
         1mspfAnNg7hVGwiOa3nQxHrWyD7PnSsTYgvZeYrgLtzVcxsT1KzjCVAQLSR1BWqQczkO
         G/jc18/nY7Gf4JsB5+AUC3R9iacO+/JXdDFxt49CC2HPcelBMEzpdmY94hNLIMO9DWGF
         HKVPsBqNdPmEyzonh2LvAJJMvUXOGj/eqiMi3HyU0+bA0nMVC68zc1E5OH/Ue7ApHnWT
         ZbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686081321; x=1688673321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5ZlKuhoRDHAHEke7zy4B0qROcvwjfCq2K3tRqo2H9M=;
        b=RmEsusTUYTf5jhWEX4iKaEtwSONodE/3mn0RznQjCzxzfGPlgFraX/n+HKTzCvKFSz
         FRiForrmp0snxeBlKCa6aMm71TOgr8vdNYxUjvWey7ax5GN/YAOSipjtH/lVNbGgASV1
         w3JsuwS2cRDlEGTg7fxMd99I4ZtJwf2Ass5GtxgQPmbHD+XPraOM4MWNEqBNawBcUdMy
         oew0NerKslBhi68aXA02BPKvKSxGGgefC0QrQwwxc5xqtvSlmOFmSzSA5esEnlxIpocf
         FErshvyeiKgdTAs6z2ymCKyEOtt+LvXx1CiMp5QFU9tFotY/Wq7SWHsp+sOt8HOnLFRL
         qvsg==
X-Gm-Message-State: AC+VfDySJBJ8Y6cu63vRRHPbQsJpOSbsBHa5SESWc6jnF5wSHneN32C3
	7utpq9VrT3VvybLQ+kJAwoHBjInq7GA=
X-Google-Smtp-Source: ACHHUZ6L0qbELbOxHqUXbl6i3ZhhXr/xDqThMRfeDj1DFSSjpLayi8x1Z0w/qzO67vt1VLNDqC6QuA==
X-Received: by 2002:ac2:46c6:0:b0:4f6:3000:4d5a with SMTP id p6-20020ac246c6000000b004f630004d5amr1524831lfo.38.1686081321296;
        Tue, 06 Jun 2023 12:55:21 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 3/8] xen/riscv: introduce reset_stack() function
Date: Tue,  6 Jun 2023 22:55:11 +0300
Message-Id: <c01a0c54edcf5ca46a7b2069740d7a81eb6f2330.1686080337.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686080337.git.oleksii.kurochko@gmail.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/riscv64/head.S | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 8887f0cbd4..6fb7dd80fd 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -27,8 +27,14 @@ ENTRY(start)
         add     t3, t3, __SIZEOF_POINTER__
         bltu    t3, t4, .L_clear_bss
 
+        jal     reset_stack
+
+        tail    start_xen
+
+ENTRY(reset_stack)
         la      sp, cpu0_boot_stack
         li      t0, STACK_SIZE
         add     sp, sp, t0
 
-        tail    start_xen
+        ret
+
-- 
2.40.1


