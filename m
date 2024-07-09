Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D02C92BED4
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 17:52:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756378.1164980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRD8o-00037P-P0; Tue, 09 Jul 2024 15:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756378.1164980; Tue, 09 Jul 2024 15:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRD8o-00032h-KI; Tue, 09 Jul 2024 15:52:30 +0000
Received: by outflank-mailman (input) for mailman id 756378;
 Tue, 09 Jul 2024 15:52:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XjVV=OJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sRD8n-0002zY-Pl
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 15:52:29 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dda84f2-3e0b-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 17:52:27 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6cb130027aso310365166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 08:52:27 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bd459e1esm1181254a12.73.2024.07.09.08.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 08:52:25 -0700 (PDT)
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
X-Inumbo-ID: 3dda84f2-3e0b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720540346; x=1721145146; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hfXIKlBAIIEGNCKp4OL6eVQawLRy4h5R8+jzNTQKH/o=;
        b=TR3FmbKz+gOljHlxXj6Ch2uu8vgWCzXZ8NsoWhAvfN85qKefCQSt7x8VyLV0AN7g1m
         gikYylMsRKnAO1wEN3xjMeQTctbq7K1f/pWaFu+kQvIqcCBJCnrlVyFOVjWfmlAY+Kxu
         BPgREgKeMBd2JI2WDRVVr1nvbN26+7OtsQ7/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720540346; x=1721145146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfXIKlBAIIEGNCKp4OL6eVQawLRy4h5R8+jzNTQKH/o=;
        b=RjTyG84yRk9IGjlZ/KNbkAwXxiUAQYueYmURGLxSoY9Dw5PIKjIuwABR3Eh0uIWsMr
         N1D0IVQAGWJupKsIL2fULEfiTD1ToKTAw/BKw5/K6a1QAM+vzsWFGpQPsepQkmh9YqUd
         RD1hgz1jvUlhpm0RFvYWn/YXjYX5s2w4MuVBAsgW3N8NGMkgV0Ywi1BSvlYlMXX9OIaa
         qCZK/+kIZpWDKxYqiAuUQPzFbXlI73G8vsI/GZP2Xce/fCQRQvuhBu46rDv3xe6thAmX
         74ReEuJYn+wa9UNzr/NzShNNgP8gavA22R2bwwCR13kIQEY2T/YFg2f20Qsqo5vGkEz+
         9xXw==
X-Gm-Message-State: AOJu0Ywe3CHqOXWHx9oMm89i++0NKpgWDn253/8BbQ7uZUNY1Y1aDD3V
	w3/jq6HEk6d484GX5S8RVaG6DzckdJQSpZ95CZp1zTPrMqcfGzIZADUYLJFT9syB5OAKIcbj0Aq
	5
X-Google-Smtp-Source: AGHT+IH7IcfMfIh0rgVJTwqBA2XBA5pZLb/yVa5713sderlwmEmbj2I8VO9R1Sh3abyqdhUEDLR+Ow==
X-Received: by 2002:aa7:ce1a:0:b0:57c:5f77:1136 with SMTP id 4fb4d7f45d1cf-594bb7745f7mr2322324a12.24.1720540346410;
        Tue, 09 Jul 2024 08:52:26 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.20 0/4] x86: FPU handling cleanup
Date: Tue,  9 Jul 2024 16:52:19 +0100
Message-Id: <cover.1720538832.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Alejandro Vallejo (4):
  x86/xstate: Use compression check helper in xstate_all()
  x86/fpu: Create a typedef for the x87/SSE area inside "struct
    xsave_struct"
  x86/fpu: Combine fpu_ctxt and xsave_area in arch_vcpu
  x86/fpu: Split fpu_setup_fpu() in two

 xen/arch/x86/domain.c             |  7 ++-
 xen/arch/x86/domctl.c             |  3 +-
 xen/arch/x86/hvm/emulate.c        |  5 +-
 xen/arch/x86/hvm/hvm.c            | 22 +++++---
 xen/arch/x86/i387.c               | 93 ++++++++-----------------------
 xen/arch/x86/include/asm/domain.h |  7 +--
 xen/arch/x86/include/asm/i387.h   | 27 +++++++--
 xen/arch/x86/include/asm/xstate.h | 17 +++---
 xen/arch/x86/x86_emulate/blk.c    |  3 +-
 xen/arch/x86/xstate.c             | 15 +++--
 10 files changed, 90 insertions(+), 109 deletions(-)

-- 
2.34.1


