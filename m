Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7295A6BD0B0
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 14:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510591.788516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnYv-0004K1-SF; Thu, 16 Mar 2023 13:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510591.788516; Thu, 16 Mar 2023 13:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnYv-0004IF-PE; Thu, 16 Mar 2023 13:22:33 +0000
Received: by outflank-mailman (input) for mailman id 510591;
 Thu, 16 Mar 2023 13:22:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcnYt-0004I2-Ro
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 13:22:31 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a5d46ea-c3fd-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 14:22:30 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id z21so7622435edb.4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 06:22:30 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 u20-20020a50d514000000b004bd1fe2cc02sm3861728edi.16.2023.03.16.06.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 06:22:29 -0700 (PDT)
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
X-Inumbo-ID: 9a5d46ea-c3fd-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678972950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s8lsLdM3pzh3/KP1/QdkMVnZhBU1+yLBGdICUL84qS4=;
        b=ghvh+bfCnBWPDVsabU3w72nzRK1vSy/o0zRnMkm3Yt4p4jpEh8ok7Azjg6D7vzU4fQ
         hYEKLDe7ktTJFmHwM6uyCxFcy0MKagUr0OcbQfV+Wcl0QTY4kIRkgFY/Q/Va63X0a4Wb
         gk+8vFwiw3pu1grPYvdudq5aUrrCORbCkswn2nd2UaGI04oj43cL2cYhizBBbEYjcOSl
         wbeuGQTIZJvaCfhl4UT3X/LC8ZckHmLGOYuGrzHx8QhzmWN8QfVF6GNIKXlwGTFlwCDZ
         PZ4dDUN6S9LKdNRzQIgAHcNcRfjwOlqCSxpzywbsi0IFG76x2ppLaL8g6LHO3V4P6QRd
         JtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678972950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8lsLdM3pzh3/KP1/QdkMVnZhBU1+yLBGdICUL84qS4=;
        b=R/mpZPXXZ2BHgvPaidM3GxDy8rtFsA5NvwYm7ba7oGRpe4kDn2HK/704dBBI3R2XNh
         46R3VJgI36Ccu0Xl/eWH05LdgJZ6f2wBGEXU/22wdR1D8CZy0XWYponBWq3TyI3fna2v
         grJpTqINk0jkCJ93w2dELY6W+AiXsngV/SqQBAb6tobKDRrPFSKfAdMG3XC+Lsg4cvCV
         1Kgf49xF4ugTcgyEUTXigdd3THfXLpPbvIz7SzW3HTZbG7lupQW58CkWfgFEUNzazaDC
         sU8IKMw1rMfrWsjwQyqMFDaho8GE37fnMzyp12fG9xg6x2pgCMxvCcC9ublc+LbPIgCe
         83kg==
X-Gm-Message-State: AO0yUKW9lXmNVvBjM1zkifT/Gi8/kM8MZ6rmgjIlH8di2sYlI0G63V1I
	xe61NWU+f4SUtZwxIg4dFSdeZK4PE5DHRQ==
X-Google-Smtp-Source: AK7set+IDjLFrmkV22994zwkYv0eudL5Q5BlQ0JD9lGLeMU9uZWLOEf0E99llugKiLcAez+rJpd7Zg==
X-Received: by 2002:aa7:ca58:0:b0:4f9:f07d:a978 with SMTP id j24-20020aa7ca58000000b004f9f07da978mr7226180edt.5.1678972949761;
        Thu, 16 Mar 2023 06:22:29 -0700 (PDT)
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
Subject: [PATCH v2 0/2] deal with GOT stuff for RISC-V
Date: Thu, 16 Mar 2023 15:22:23 +0200
Message-Id: <cover.1678970065.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series introduces things to deal with GOT stuff whichwas faced
during the work on [1].

Initially, the issue was with 'la' pseudo instruction, which transformed to
'aupic/l{w|d} GOT' instead of 'auipc/addi'.
The transformation dependson .option {nopic, pic} directive or compiler flags.

Right now, 'la' transforms to 'auipc/l{w|d}', which in case of cpu0_boot_stack[]
will lead to the usage of _GLOBAL_OFFSET_TABLE_and addresses inside GOT
sections will be relative to linker time addresses.

At least there are two reasons for that:
1. GCC compiler used in RISCV64 container is compiled with
  --enable-default-pie flag.
2. GCC spec file for the RISC-V architecture by default enabled -fpic:
   [user@49295ae49cbe build]$ riscv64-linux-gnu-gcc -dumpspecs | grep -i pic
    --traditional-format %(subtarget_asm_debugging_spec) %{fno-pie|fno- PIE|fno-pic|fno-PIC:;:-fpic} %{march=*} %{mabi=*} %{mno-relax} %{mbig- endian} %{mlittle-endian} %(subtarget_asm_spec)%{misa-spec=*}
  which means that -fpic is enabled if none of the following options are
  present on the command line: fno-pie, -fno-PIE, -fno-pic, -fno-PIC

To resolve that, it was added EMBEDDED_EXTRA_CFLAGS to RISCV's CFLAGS as it was
done for other architecture.

To catch use cases when GOT things will be produced by something was createthe
second patch of the patch series:
[xen/riscv: add explicit check that.got{.plt} is empty] which add .got&.got.plt
sections to xen.lds.S and alsoadds asserts to check that the mentioned sections
are empty otherwise, it will be produced a compilation error with the message
that the sections aren't empty.

[1]:
https://lore.kernel.org/xen-devel/22c46432-e940-914e-53c2-2913607be3e2@suse.com/T/#t

---
Changes in V2:
 * The patch [1] was refactored and lead to the patch [xen/riscv: add
   EMBEDDED_EXTRA_CFLAGS to CFLAGS].
 * In addition to the patch [1] was created another patch [xen/riscv: add explicit
   check that .got{.plt} is empty] to be sure that .got{.plt} sections
   weren't produced.
---
Oleksii Kurochko (2):
  xen/riscv: add EMBEDDED_EXTRA_CFLAGS to CFLAGS
  xen/riscv: add explicit check that .got{.plt} is empty

 xen/arch/riscv/arch.mk   |  2 ++
 xen/arch/riscv/xen.lds.S | 13 +++++++++++++
 2 files changed, 15 insertions(+)

-- 
2.39.2


