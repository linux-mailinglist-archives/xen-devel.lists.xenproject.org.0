Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B13977DEB3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584425.915163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnk-0002gW-2y; Wed, 16 Aug 2023 10:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584425.915163; Wed, 16 Aug 2023 10:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnj-0002a3-PF; Wed, 16 Aug 2023 10:30:55 +0000
Received: by outflank-mailman (input) for mailman id 584425;
 Wed, 16 Aug 2023 10:30:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDeI-0003RA-3f
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:21:10 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9670406e-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:56 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3198d2745feso785374f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:56 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:55 -0700 (PDT)
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
X-Inumbo-ID: 9670406e-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181256; x=1692786056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Th+HXmOUTihkm6COBZKzRk12S72/2zGUHfBHrZen34=;
        b=O7Q3e8g1zj0SNztlb963hJ4I9gdbh1yRquiQIJG9cmB+IS1LSfXwvh5nr3WBNEd04q
         ldOhEBo07tTyE053Cozzd7f2A3FE8QYhD890L4r9Pbbc0F5E2Y1C5W837s8B/ES9n7fn
         gKTxQsDghbV5PxgOd1j1kaloje+7Hjkf7XT5KZmCFuOS0+rmvqXLcSyT85kyugbpGmTj
         7Z8k9xSkC4lJLuN5Ck3Ivb6HqqgHmH22u77+Rw3cFkNri01HSOQQBPU+uRGqHeMt4T1E
         g9kW09cui+WAH3yi4lz76GIlOmfjCMS/IbW5NfcZDR/xWZZ2jaM0zvju8v5wzFz9TOTA
         uScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181256; x=1692786056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Th+HXmOUTihkm6COBZKzRk12S72/2zGUHfBHrZen34=;
        b=KKmy9SxOZhCFX/V9ortHqoxfIXJnlUCdNColkKXqu1TY++p+ZFORPD8Ax2vdGaf5Tv
         TmvS6g0XT4WWTQ4kC5j1Hfqt+kbmLr89h8ImnYDPe03A0+WyP7vWV3ToXSPb6iqdpWRZ
         5qqhh0cMwX53t2fmq74/HgnpBuN8+0cw99ahnlZvNPGOrwNS7vW3HNmmznNNM+dBtukv
         R8eFU1tXL3WTC/cgnnquxCbVOZuhYCCzFRmEdIqn4RkS5jZehKMYrf1E2dpCpCZjtzUy
         cxD+zJ4LU/p8ptq1WvY3AESD518IcjYMvqUdkuR1nZW5WSKcNrYG2kED51Hj+QIJC9TQ
         7ddw==
X-Gm-Message-State: AOJu0Yw4W08OqPQy5IcKnU7UWKfegE8iX+g/2RkZufBJs5felv58XLGs
	aUs4rkC/77Fc0LgRnHUFmGuR02grK8amryOy
X-Google-Smtp-Source: AGHT+IGU23Oide7DSqToldRQIVmPVCxgXi8QZJLwiuAyYb5Y9TlduUogHkb6QnmNVeT0YndnqO1UFg==
X-Received: by 2002:a05:6000:128c:b0:319:72f8:7249 with SMTP id f12-20020a056000128c00b0031972f87249mr1172802wrx.66.1692181256009;
        Wed, 16 Aug 2023 03:20:56 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 50/57] xen/riscv: add minimal stuff to asm/smp.h to build full Xen
Date: Wed, 16 Aug 2023 13:20:03 +0300
Message-ID: <5df4e523937312bd6240acf0be9ad29273545fc6.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/smp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index cc8dd18254..a7b4f94ce4 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -17,4 +17,7 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
  */
 #define park_offline_cpus false
 
+/* TODO: need to be implemeted */
+#define smp_processor_id() (0)
+
 #endif
\ No newline at end of file
-- 
2.41.0


