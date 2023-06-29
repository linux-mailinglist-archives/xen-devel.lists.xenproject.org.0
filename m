Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE8D742999
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556909.869793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtY1-00016k-AY; Thu, 29 Jun 2023 15:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556909.869793; Thu, 29 Jun 2023 15:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtY1-00014D-6m; Thu, 29 Jun 2023 15:27:05 +0000
Received: by outflank-mailman (input) for mailman id 556909;
 Thu, 29 Jun 2023 15:27:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4caF=CR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qEtY0-0000oy-0d
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:27:04 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63795e92-1691-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 17:26:59 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-98e25fa6f5bso104366166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 08:26:59 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v11-20020a170906564b00b00992c4103cb5sm307727ejr.129.2023.06.29.08.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 08:26:58 -0700 (PDT)
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
X-Inumbo-ID: 63795e92-1691-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688052418; x=1690644418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6KfuSFi0sd3KAdUkh7aqTuNtWs7UyItOcyC31/eBJQ=;
        b=YXk8puFQMQt0SZdpYEw5mpye/r3qGrrkX0euwAguHNOHDnBDGgbHIR64wDSWCyossB
         8AQqz87aCbKJS86uG2WMplMB6bT8SpqnRMBnbm9SXumJ9SJLpcDF6bU7NdJT8DjSMO0h
         egXoSZEOMSNFDuk1u2ao+ZEXIKCTL+5sYeVL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688052418; x=1690644418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6KfuSFi0sd3KAdUkh7aqTuNtWs7UyItOcyC31/eBJQ=;
        b=Vxm8DbKW5XNM7IPiP1Kab04KPd64osQsPoVpH6pM0ylbJ+CwhqnDaNZ8Uguy0N8d9b
         i0EXPfZNhY4fw/qUw/8+i1/OfmxsNDxvcya/y3gdE9sidtyQZl0tD2PkoVqgTKusSj73
         xgCfKAYqYFA9oWLjaVfDEmzgRvr5RzjN1BbpaCfiQBeFaeKfsChTC5zK9J2A+u6Rdz5L
         443BIroQ/0OMsz5bMgGkhihO4moK0y71v3wXSk3J21OYBVGnWiI7Y22IBVD+FRzOVeOH
         EymrZApaD7XH+1Tp63cgzvT2HpNnjd6ZgrBOYVB1jcOkk4KzRW6c/Jsn+q9QOsXXmh/Q
         eoLA==
X-Gm-Message-State: AC+VfDzvWXkGi4lMPYao3frEDHIprQy4LzCLjBE1i3PleKgZe6ph69w3
	G2bkvoojmrm8t6O4uErt4OuxZf68Y8wGqNZ5yBc=
X-Google-Smtp-Source: ACHHUZ6s3CcOimOib4442RrBY2i+e6XzMZuIKN8VvNZ5RJ0UzKLVVBZYtaZJklh8XUbshnwQ/xTxRA==
X-Received: by 2002:a17:907:708:b0:97b:956f:e6b5 with SMTP id xb8-20020a170907070800b0097b956fe6b5mr35221272ejb.23.1688052418353;
        Thu, 29 Jun 2023 08:26:58 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 0/4] Prevent attempting updates known to fail
Date: Thu, 29 Jun 2023 16:26:52 +0100
Message-Id: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under certain conditions a CPU may not be able to perform microcode updates
even if hardware exists to that effect. In particular:

 * If Xen runs under certain hypervisors they won't allow microcode
   updates, and will signal this fact by reporting a microcode revision of
   -1.
 * If the DIS_MCU_LOAD bit is set, which is expected in some baremetal
   clouds where the owner may not trust the tenant, then the CPU is not
   capable of loading new microcode.

This series adds logic so that in both of these cases we don't needlessly
attempt updates that are not going to succeed. Patch summary:

Patch 1 Introduces the logic to print the microcode revision if at all
        possible

Patch 2 Ignores microcode facilities when the current microcode revision is -1

Patch 3 Moves the MSR_ARCH_CAPS read in tsx_init() to early_cpu_init() and
        early_microcode_init()

Patch 4 Adds the logic to detect microcode updates being disabled on Intel.

Alejandro Vallejo (4):
  x86/microcode: Allow reading microcode revision even if it can't be
    updated
  x86/microcode: Ignore microcode loading interface for revision = -1
  x86: Read MSR_ARCH_CAPS immediately after early_microcode_init()
  x86/microcode: Disable microcode update handler if DIS_MCU_UPDATE is
    set

 xen/arch/x86/cpu/common.c             | 23 ++++++++++++------
 xen/arch/x86/cpu/microcode/core.c     | 35 ++++++++++++++++++++++-----
 xen/arch/x86/cpu/microcode/intel.c    | 13 ++++++++++
 xen/arch/x86/cpu/microcode/private.h  |  7 ++++++
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/msr-index.h  |  5 ++++
 xen/arch/x86/setup.c                  |  2 +-
 xen/arch/x86/tsx.c                    | 16 +++---------
 8 files changed, 75 insertions(+), 27 deletions(-)

-- 
2.34.1


