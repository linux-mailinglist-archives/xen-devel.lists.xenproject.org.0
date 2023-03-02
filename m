Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4586A8376
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 14:24:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504921.777374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXiuA-0008TS-Co; Thu, 02 Mar 2023 13:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504921.777374; Thu, 02 Mar 2023 13:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXiuA-0008Qo-7L; Thu, 02 Mar 2023 13:23:30 +0000
Received: by outflank-mailman (input) for mailman id 504921;
 Thu, 02 Mar 2023 13:23:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rfr=62=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXiu8-0008Qd-V4
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 13:23:29 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 698b6cdc-b8fd-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 14:23:26 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id t14so17578755ljd.5
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 05:23:25 -0800 (PST)
Received: from fedora.. (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 s8-20020a05651c048800b00290679ebac1sm2109551ljc.9.2023.03.02.05.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 05:23:24 -0800 (PST)
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
X-Inumbo-ID: 698b6cdc-b8fd-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677763405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r54OMOhW88QqcfBk7WQqFpi2G04PCGrALjff0dQs4W4=;
        b=CkFoCC6UYBLofYUgLsdXk2M53Tnc30hPp9uSKjziOo0o49mhDqUhpevAVmfR9PRbBb
         Q0KwL20RwFzcnuChF78uvhMW+Ug/2sAS6qwypcBpKlgbZCKAWZEqsmTt90vJ8ck5Axko
         f9AOKkQk+oDSTl0+IyKcTI6RUrI02GFh6LDb9GNZh0lUiU7i/UVg1yGqTBH1xgXiboIC
         ZDXmqtuqKBG3GJ0bykvuGg881NImob1CalHGifb978KHn11VNKurqHaP/geBHAzrw4eW
         UpMIakYhID2CoTDXgqMxuEEKL/BURqynn8tZZ+RkYQ7L0dmvDQvV3YZh7ymJyDgrXxoO
         1hjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677763405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r54OMOhW88QqcfBk7WQqFpi2G04PCGrALjff0dQs4W4=;
        b=QWbBeIqXpLrBmOqrjgOSuopO5AB9SUk/s3mVA4yG2BEEXLbecyt2qPcL/IsUjpQgdM
         d/1uyNC1cDOzO4LgZJV8+uxYRO77mzMDn1rDC2k50oGKYV1z8egLj3m3hdRIh0B+yloT
         agO8Jwv2PMPrn3x0I4UT3PbUxKhmMMMtFHEDQ7eHAOJH+f+p+Y/0fVTBpaC3wKKV2wzk
         sS+/Orn858iKNG1cVevuZFR5jM5TyEzvUg5KomKdo1GSgM/FL5Nll+gbNeb3Zcd9GekP
         YSbLmFR6LcIk3/zHris6muJ3WK45TsfwyvbDyJLoR/Pr415Su9JwvyoRMy356r1PH8nx
         OdcQ==
X-Gm-Message-State: AO0yUKUsO6F1kUt/TMPbj5TjMOpGc3rfuuqUDyMWBtFpYzsdhFdCOMsU
	sWnM2MvPFkpo15YAVhbSNkC8Edx23Xw=
X-Google-Smtp-Source: AK7set8xx+VVqPcSxKQZX0cI/xrBqy9FioTJTaXFF8ais5noatS9ErlTStdhsqBeu/sZcXO14ItHDA==
X-Received: by 2002:a05:651c:b24:b0:295:d633:7401 with SMTP id b36-20020a05651c0b2400b00295d6337401mr2423400ljr.47.1677763404836;
        Thu, 02 Mar 2023 05:23:24 -0800 (PST)
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
Subject: [PATCH v2 0/3] Do basic initialization things
Date: Thu,  2 Mar 2023 15:23:17 +0200
Message-Id: <cover.1677762812.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series groups and updates the following patches:
1. xen/riscv: disable fpu
2. xen/riscv: initialize .bss section
3. xen/riscv: read/save hart_id and dtb_base passed by bootloader

---
Changes since v1:
 * initialization of .bss was moved to head.S
 * read/save/pass of hart_id and  dtb_base passed by a bootloader
   were moved to head.S. Also, it was updated start_xen() arguments
   to recieve hard_id & dtb_base
---

Oleksii Kurochko (3):
  xen/riscv: read/save hart_id and dtb_base passed by bootloader
  xen/riscv: initialize .bss section
  xen/riscv: disable fpu

 xen/arch/riscv/include/asm/asm.h |  4 ++++
 xen/arch/riscv/riscv64/head.S    | 33 ++++++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c           | 11 ++++++++++-
 3 files changed, 47 insertions(+), 1 deletion(-)

-- 
2.39.0


