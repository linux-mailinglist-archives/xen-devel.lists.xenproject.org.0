Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B4096E59C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 00:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791410.1201252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smKeK-0000gV-3j; Thu, 05 Sep 2024 22:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791410.1201252; Thu, 05 Sep 2024 22:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smKeJ-0000dF-TI; Thu, 05 Sep 2024 22:08:19 +0000
Received: by outflank-mailman (input) for mailman id 791410;
 Thu, 05 Sep 2024 22:08:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smKeI-0000d4-Mr
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 22:08:18 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a154f2f-6bd3-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 00:08:16 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso185583866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 15:08:16 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d020sm187525166b.127.2024.09.05.15.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 15:08:14 -0700 (PDT)
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
X-Inumbo-ID: 5a154f2f-6bd3-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725574095; x=1726178895; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=otXSVioNKq6rGHgrCWyc/zHRfbwJU6jCuFNJKj5f9rw=;
        b=FU68bp5V1W60BaWdqMuO/eCweEcUfuNW6KiiQSrlQlH75+0F4KAa8g2PBbFIEQ5Spe
         yhKz9x2iP+kVInkc5+mkPetoa+wyOuG7hyAjzh+30l88pIRBb9AH/3tpatjPWrm7+5lO
         qyO5YeIADBiMlklTWA3MJ1/vBR6F9fGh6NFfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725574096; x=1726178896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otXSVioNKq6rGHgrCWyc/zHRfbwJU6jCuFNJKj5f9rw=;
        b=rCk2bn1HjTpTXHIBbULWCwkXOOmECRi+pVidr7EpnG7gIlF4i5KSbyFLHtNMUwmPU2
         1jeUD+kjkZ1iMwLS+gpeTde9teHQdcW7awpn2ud+2yOpEzmGdFh9qzfzPzmdghAgsTxU
         uuz1TX1mAK8wybRBl3VWBMUuU6fu+APxjNVH8p7B66I++36xY9RNvC9l3SadMvYk+Tpu
         VIOvseWkYDtaCYZeqMzBjiWFOq/VdtJlC88wuvyO8jdhdOczLTBg78N0czFwFS3CJLSP
         qwpRbS+e/Cdxr+muJuUx29l8Fnt2aDMTI8JokF60AwCfDQKxXqFr5o41un/F+Yg4GGwj
         wS0Q==
X-Gm-Message-State: AOJu0YwPqX8RFykxfugL8s4HXVjJzEXiXbXWzqHiG+EWyI+CRiQwnv/O
	j/2VWerQtTD1UAj7XmBgO7EAturuSs0Ybbnm/pXun7mzux5oIe4rRxwWaeWL0QNionumICZWHxf
	Q
X-Google-Smtp-Source: AGHT+IFL2ESsvo5L5V0U/6Hhv1zYMm+pOumlblHzWpZQHyRJ2nqe3RkOrtCHBw5kp6PNwQ6MWlJ8kg==
X-Received: by 2002:a17:907:3da4:b0:a8a:8175:231c with SMTP id a640c23a62f3a-a8a8605bc68mr66371766b.18.1725574095122;
        Thu, 05 Sep 2024 15:08:15 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 0/5] xen: Remove legacy __read_mostly/__ro_after_init definitions
Date: Thu,  5 Sep 2024 23:08:01 +0100
Message-Id: <20240905220806.141300-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This continues prior work done for PPC and RISCV.  Patches 1-4 are some header
rearranging for x86, with the convenient side effect of letting ARM fall out
in the wash in patch 5.

I've done a reasonable amount of Gitlab CI work, but I cant claim to have
tried every possible combination.  RANDCONFIG might find some transitive paths
I haven't spotted.

Andrew Cooper (5):
  x86/build: Rework includes in genapic/probe.c
  xen/build: Drop unused includes of xen/cache.h
  x86/build: Swap cache.h includes for xen/sections.h
  x86/cache: Drop legacy __read_mostly/__ro_after_init definitions
  ARM/cache: Drop legacy __read_mostly/__ro_after_init definitions

 xen/arch/arm/include/asm/cache.h     |  3 ---
 xen/arch/x86/acpi/cpu_idle.c         |  3 ++-
 xen/arch/x86/bzimage.c               |  1 -
 xen/arch/x86/cpu-policy.c            |  2 +-
 xen/arch/x86/dmi_scan.c              |  1 -
 xen/arch/x86/genapic/probe.c         | 34 +++++++++++++---------------
 xen/arch/x86/guest/hypervisor.c      |  2 +-
 xen/arch/x86/include/asm/cache.h     |  3 ---
 xen/arch/x86/include/asm/genapic.h   |  2 ++
 xen/arch/x86/include/asm/processor.h |  1 -
 xen/common/decompress.h              |  1 -
 xen/common/efi/runtime.c             |  3 ++-
 xen/include/acpi/platform/aclinux.h  |  1 -
 xen/include/xen/cache.h              |  5 ----
 xen/include/xen/lib.h                |  1 +
 xen/include/xen/rcupdate.h           |  1 -
 16 files changed, 25 insertions(+), 39 deletions(-)

-- 
2.39.2


