Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FF7950773
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 16:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776347.1186461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdsP9-0006ok-KC; Tue, 13 Aug 2024 14:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776347.1186461; Tue, 13 Aug 2024 14:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdsP9-0006nF-GJ; Tue, 13 Aug 2024 14:21:43 +0000
Received: by outflank-mailman (input) for mailman id 776347;
 Tue, 13 Aug 2024 14:21:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOoy=PM=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sdsP7-0006mt-QO
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 14:21:41 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aed7fec-597f-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 16:21:39 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5b3fff87e6bso6344047a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 07:21:39 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414e3basm73540966b.164.2024.08.13.07.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 07:21:38 -0700 (PDT)
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
X-Inumbo-ID: 5aed7fec-597f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723558898; x=1724163698; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FB17vxpkPLnVIAPOyxuWHy0rTxGUCVJLIDc0oScZHuo=;
        b=M/zR7TOUFswYVCIyZvxg5ZNa+eg1CaalRmVZQypSt0IVDldryQqfOcHG6bKezBfy9M
         JGWcLnnS7UlEzw0wKeo7d/UGGbXj8eGAY/jkaao9fL1jAFc1mXhQO4sN2MWIjx7FYY3T
         UcVj7Y3V95/Z5L96/h6k7uNXcYrfTcAlEGSag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723558898; x=1724163698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FB17vxpkPLnVIAPOyxuWHy0rTxGUCVJLIDc0oScZHuo=;
        b=te8jtFndnRQ+SGurB1qVu4WX45GP5/AWUKIf6xD5ixelYlzQvlLU33Rx5l/tbr6bHl
         qCcX2i/s1wIsD8y+KC6Tn5r0ou4slQTuWmhA1aObC6ztPuUhwXly7B1uc++GXwk0Nbwb
         0p+6ljPufxBfhxITsHOMMVvsFG7+lJEG9D+eFlNYdgLwzMVGPsjhWO+ORMQYJ3ay9RKe
         Bggw5PEddHVmVs00B34lupOjbaqzEAWNjx5ei+rYU2GdmLvn0zJ/PxW9QKruIhL32ya+
         /h+8gZivmVBxhzd/UDNNUXa8lW+T41H69qBMEYuLEgbtjBxw5dgtp5gYg5qrdXSVAQBS
         TPXw==
X-Gm-Message-State: AOJu0Yzmi5UNAgJgD9cw5umPLx3aOs6/3ULyfszllQIoslZ6P5JDm6b5
	i11ZGJ2uTGAvtl+XQJBVYjmgMiqzSj76RkTKXNdS2THxj5wQSffjqmxHxxgcLz3ODwKhD8+ld9y
	z
X-Google-Smtp-Source: AGHT+IGqJ+NrqhBTZmysQlfdhvjxmlxHPJepVaoEO6LRnmWyQwqe2UZx5qIh+3w0Ja6Ru04AWNxHDg==
X-Received: by 2002:a17:907:efd5:b0:a7a:929f:c0cf with SMTP id a640c23a62f3a-a80ed1efeedmr286956366b.21.1723558898504;
        Tue, 13 Aug 2024 07:21:38 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 0/2] x86: FPU handling cleanup
Date: Tue, 13 Aug 2024 15:21:17 +0100
Message-ID: <20240813142119.29012-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: https://lore.kernel.org/xen-devel/20240808134150.29927-1-alejandro.vallejo@cloud.com/T/#t
v2 -> v3: Cosmetic changes and wiped big comment about missing data in the
          migration stream. Details in each patch.

v1: https://lore.kernel.org/xen-devel/cover.1720538832.git.alejandro.vallejo@cloud.com/T/#t
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

Alejandro Vallejo (2):
  x86/fpu: Combine fpu_ctxt and xsave_area in arch_vcpu
  x86/fpu: Split fpu_setup_fpu() in three

 xen/arch/x86/domain.c             |   7 +-
 xen/arch/x86/domctl.c             |   6 +-
 xen/arch/x86/hvm/emulate.c        |   4 +-
 xen/arch/x86/hvm/hvm.c            |  18 +++---
 xen/arch/x86/i387.c               | 103 ++++++++++--------------------
 xen/arch/x86/include/asm/domain.h |   8 +--
 xen/arch/x86/include/asm/i387.h   |  28 ++++++--
 xen/arch/x86/include/asm/xstate.h |   1 +
 xen/arch/x86/x86_emulate/blk.c    |   3 +-
 xen/arch/x86/xstate.c             |  13 +++-
 10 files changed, 95 insertions(+), 96 deletions(-)

-- 
2.45.2


