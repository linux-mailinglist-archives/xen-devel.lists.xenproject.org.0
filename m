Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC6999320E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 17:53:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812213.1224944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxq2W-0003g1-8y; Mon, 07 Oct 2024 15:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812213.1224944; Mon, 07 Oct 2024 15:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxq2W-0003e2-6E; Mon, 07 Oct 2024 15:52:52 +0000
Received: by outflank-mailman (input) for mailman id 812213;
 Mon, 07 Oct 2024 15:52:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g5Pn=RD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sxq2U-0003dv-90
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 15:52:50 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33eeded2-84c4-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 17:52:49 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a994ecf79e7so190911166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 08:52:49 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.174.59.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99309aa6afsm386160366b.112.2024.10.07.08.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 08:52:47 -0700 (PDT)
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
X-Inumbo-ID: 33eeded2-84c4-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728316368; x=1728921168; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eaoG66Tciv7HDtCU2mUwzFbWhnHHcMuWC3pU1aag758=;
        b=iqrIsWWYRjyU+EYaO61eaW+GbfVuP49DWBdSUlhqRe1pzcw6iu6ZasSv0QM4vrMFSg
         lItVWNM6cji3qzSMKaiT+Pnw9LZJelUKVOGJ1td7mmMqIY9JnsQ8Pktv9Fydoj194Efd
         D8069Vb8VGlEgWVSsZL9Aw3eJSMo3PFW6WfAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728316368; x=1728921168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaoG66Tciv7HDtCU2mUwzFbWhnHHcMuWC3pU1aag758=;
        b=MI9KP3AmHldAIaLVZ+o9/DCpIvDSrGhThQKtJTA449I12ZVUIiX7mzGIRpLp6AlxDM
         Xf/39TxS8PVcXQkMBjKUgjf9EQkCOJ48HmVUBOMZYns6vLvNp/VQYeSkNXZvElW2uiYJ
         RcAiq4Vz0AHJgPuKqEiFC7Yh2EToKxIPT8wgMHaq0PsoEQjKJFW5sj4brOIqycLaY9Xn
         nEZe9/GMbXzloBqJ9/o0CYFGuuRTlKDsv7HlpyKmT8/9GxJwMMM2AYfZspq002gHLyZl
         bU5MLahhDxmfHrPwO+WUM8JIUtlsbTBg08KG52uWOu9CdAyK+lzyzg+7I7E1wv64aaQt
         cleQ==
X-Gm-Message-State: AOJu0Yw5cSd8H6gY5MgSgP9tAxxXsPW+idVAyBta6BO4x+GIjR/7mWBp
	1c+NfLAjZa68ZbnWadZLDoOi6Ap9qU0XAPkYzyMyeqPdUwEmAc8bb/9SBT/+C2gNzRtyZRn+6Wr
	59qA=
X-Google-Smtp-Source: AGHT+IEdgfriBRNJmiLKeAn2pqQsdv5NNiBIrLm/crufZmoezz0gZbRSmgTR30QOwUyPYLdzF+fKmQ==
X-Received: by 2002:a17:906:da89:b0:a8a:837c:ebd4 with SMTP id a640c23a62f3a-a991bd71c4emr1375494666b.27.1728316368136;
        Mon, 07 Oct 2024 08:52:48 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 0/2] x86: FPU handling cleanup
Date: Mon,  7 Oct 2024 16:52:38 +0100
Message-ID: <20241007155240.17186-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3: https://lore.kernel.org/xen-devel/20240813142119.29012-1-alejandro.vallejo@cloud.com/
v3 -> v4: Removal vcpu_default_fpu() + style changes

v2: https://lore.kernel.org/xen-devel/20240808134150.29927-1-alejandro.vallejo@cloud.com/
v2 -> v3: Cosmetic changes and wiped big comment about missing data in the
          migration stream. Details in each patch.

v1: https://lore.kernel.org/xen-devel/cover.1720538832.git.alejandro.vallejo@cloud.com/
v1 -> v2: v1/patch1 and v1/patch2 are already in staging.

=============================== Original cover letter =========================
I want to eventually reach a position in which the FPU state can be allocated
from the domheap and hidden via the same core mechanism proposed in Elias'
directmap removal series. Doing so is complicated by the presence of 2 aliased
pointers (v->arch.fpu_ctxt and v->arch.xsave_area) and the rather complicated
semantics of vcpu_setup_fpu(). This series tries to simplify the code so moving
to a "map/modify/unmap" model is more tractable.

Patches 1 and 2 are trivial refactors.

Patch 3 unifies FPU state so an XSAVE area is allocated per vCPU regardless of
the host supporting it or not. The rationale is that the memory savings are
negligible and not worth the extra complexity.

Patch 4 is a non-trivial split of the vcpu_setup_fpu() into 2 separate
functions. One to override x87/SSE state, and another to set a reset state.
===============================================================================

Alejandro Vallejo (3):
  x86/fpu: Combine fpu_ctxt and xsave_area in arch_vcpu
  x86/fpu: Rework fpu_setup_fpu() uses to split it in two
  x86/fpu: Remove remaining uses of FCW_DEFAULT

 xen/arch/x86/domain.c             |  7 ++-
 xen/arch/x86/domctl.c             |  6 +-
 xen/arch/x86/hvm/emulate.c        |  4 +-
 xen/arch/x86/hvm/hvm.c            | 18 +++---
 xen/arch/x86/i387.c               | 94 ++++++++-----------------------
 xen/arch/x86/include/asm/domain.h |  6 --
 xen/arch/x86/include/asm/i387.h   | 21 +++++--
 xen/arch/x86/include/asm/xstate.h |  2 +-
 xen/arch/x86/x86_emulate/blk.c    |  2 +-
 xen/arch/x86/xstate.c             | 14 +++--
 xen/common/efi/runtime.c          |  2 +-
 11 files changed, 74 insertions(+), 102 deletions(-)

-- 
2.46.0


