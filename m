Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F024F87EDA3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:36:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694890.1084108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFxw-0005L9-9W; Mon, 18 Mar 2024 16:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694890.1084108; Mon, 18 Mar 2024 16:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFxw-0005JZ-42; Mon, 18 Mar 2024 16:36:00 +0000
Received: by outflank-mailman (input) for mailman id 694890;
 Mon, 18 Mar 2024 16:35:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmFxu-0005JN-Pz
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:35:58 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 987eb1b1-e545-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:35:57 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a46c35dfb5aso140877966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:35:57 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j22-20020a170906051600b00a441a7a75b5sm4988894eja.209.2024.03.18.09.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:35:55 -0700 (PDT)
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
X-Inumbo-ID: 987eb1b1-e545-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710779756; x=1711384556; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zEC7r2jF8BEfoecBkIf0j/7FO0i8OB8TShnkhkJo6Z8=;
        b=OL+X+IGgYBuay1hXgdfHalxmHCBn4LE8pDIqsvIURAUYCorIp/H9VGcLtWZpph+kXW
         IeoGjsEvBYXlcaQkIA+ULB69FEcN2FEoMbCxMF2QCptOBmYoJiRaNQBVD6RSLCyNaPCv
         Hm7ohJ4g8SaPcVTByhb0OuBZ891kn6FGPWCaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710779756; x=1711384556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEC7r2jF8BEfoecBkIf0j/7FO0i8OB8TShnkhkJo6Z8=;
        b=B0x2uCdGMqncU/o0sYj5PNLyhLTLEGeWop3xzLs5lIzb77krtknQDlETZWIdRnC+97
         va9wAwGPM90ZfR6ayREa4aemgAk7Qj3q2Fo5B70bf9ojt1PfnhRenmGWF5H1ySZ/ke9I
         eSW0bEJsxWRX0D4Lb214gNbBHGF9RWILJquhmj4lpOrDmlRiwgMXk61Fu0LCqrMrE9i6
         VZNItU080T62JeiDaGSTMnZhuTaUngf8US3mxyK/Uz8nl1hAy3T/JOdIuLMK3z9jn/77
         KYcaMpL32QNOXBEsy65f6Hw2MWVflbeUL+f7d6jhxGOlr8/jYdhTDR6MBK2fXWp8hIHJ
         9lyQ==
X-Gm-Message-State: AOJu0YzSRGurz4kk7NBfRB9kYNa98T5vDt8QoUsZF35wLf7f+pgQfCkk
	gA8r3Lx42xOn+IdR0x3yvF+HwxFNmkUJ/x4/yNiqWduUiQJlpiCIssGQjCEhk9OU+4v6aLlFdDT
	B
X-Google-Smtp-Source: AGHT+IFwbiIi1rM/HknDpp84YFhD/NI3g6a796y6wylzweGrU90oJEWIkrxuBx30VRm1X8aipP4yUw==
X-Received: by 2002:a17:907:60ca:b0:a44:5477:bb46 with SMTP id hv10-20020a17090760ca00b00a445477bb46mr10862867ejc.61.1710779755745;
        Mon, 18 Mar 2024 09:35:55 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH 0/7] xen/trace: Treewide API cleanup
Date: Mon, 18 Mar 2024 16:35:45 +0000
Message-Id: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rework the trace API to unify it (remove the HVM specific obfuscation), and
remove MISRA violations.

v3:
 * Delete TRACE_PARAM64()

Andrew Cooper (7):
  xen/trace: Introduce new API
  xen/credit2: Clean up trace handling
  xen/rt: Clean up trace handling
  xen/sched: Clean up trace handling
  xen: Switch to new TRACE() API
  xen/trace: Update final {__,}trace_var() users to the new API
  xen/trace: Drop old trace API

 xen/arch/x86/acpi/cpu_idle.c           |  12 +-
 xen/arch/x86/compat.c                  |   4 +-
 xen/arch/x86/cpu/mwait-idle.c          |   6 +-
 xen/arch/x86/emul-i8254.c              |  14 +-
 xen/arch/x86/hvm/emulate.c             |  11 +-
 xen/arch/x86/hvm/hpet.c                |   7 +-
 xen/arch/x86/hvm/hvm.c                 |  20 +-
 xen/arch/x86/hvm/io.c                  |   1 -
 xen/arch/x86/hvm/rtc.c                 |  12 +-
 xen/arch/x86/hvm/svm/intr.c            |   7 +-
 xen/arch/x86/hvm/svm/svm.c             |  43 ++--
 xen/arch/x86/hvm/vlapic.c              |  52 +++--
 xen/arch/x86/hvm/vmx/intr.c            |   7 +-
 xen/arch/x86/hvm/vmx/vmx.c             |  57 +++--
 xen/arch/x86/hvm/vpic.c                |  13 +-
 xen/arch/x86/include/asm/hvm/trace.h   | 114 ----------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |   1 -
 xen/arch/x86/irq.c                     |  16 +-
 xen/arch/x86/mm/p2m-pod.c              |   8 +-
 xen/arch/x86/mm/p2m-pt.c               |   2 +-
 xen/arch/x86/mm/shadow/common.c        |   6 +-
 xen/arch/x86/mm/shadow/multi.c         |  10 +-
 xen/arch/x86/pv/trace.c                |  21 +-
 xen/arch/x86/traps.c                   |   2 +-
 xen/common/domain.c                    |   4 +-
 xen/common/grant_table.c               |   6 +-
 xen/common/memory.c                    |   2 +-
 xen/common/sched/core.c                |  56 +++--
 xen/common/sched/credit.c              |  70 +++---
 xen/common/sched/credit2.c             | 301 ++++++++++++-------------
 xen/common/sched/null.c                |  63 +++---
 xen/common/sched/rt.c                  |  99 ++++----
 xen/common/trace.c                     |   9 +-
 xen/drivers/cpufreq/utility.c          |   2 +-
 xen/include/xen/trace.h                |  67 ++----
 35 files changed, 493 insertions(+), 632 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/hvm/trace.h


base-commit: 62018f08708a5ff6ef8fc8ff2aaaac46e5a60430
-- 
2.30.2


