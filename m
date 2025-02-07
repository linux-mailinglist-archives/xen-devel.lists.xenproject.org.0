Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404B1A2C354
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 14:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883667.1293593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgOAh-00081P-O8; Fri, 07 Feb 2025 13:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883667.1293593; Fri, 07 Feb 2025 13:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgOAh-0007zb-LQ; Fri, 07 Feb 2025 13:13:27 +0000
Received: by outflank-mailman (input) for mailman id 883667;
 Fri, 07 Feb 2025 13:13:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4G/=U6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tgOAf-0007zQ-Vq
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 13:13:26 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f7f8351-e555-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 14:13:24 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5dc82e38c10so4560207a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 05:13:24 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab794d96481sm19759666b.154.2025.02.07.05.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 05:13:22 -0800 (PST)
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
X-Inumbo-ID: 4f7f8351-e555-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738934003; x=1739538803; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJ1aRL1tR7L7RfcFqqqPbM27tp8K7KNIk+xpnnAJSCM=;
        b=Mr38gcVrtcOu1U1pRPLYaLIudZd7CDTwTYt4fnhIOrCE7Ls25n/Dv6wR5yhWdUhaKj
         ruQ6fMOqB8dbidoxmTjxLLmJF0GQjX93R2j2b94rJbcosToWVs36sb4z6z5dF3Cm+Y/k
         oH4SZCpmQ9LN7W8cdZLwGiHCY5rN1W/06o5XlnWznxtgsJpSYCLqhKc7tFbhPpgcaZeM
         ReRWE+lYhfcNCFWI1DUOQZe77Vo2Wgj+LKuoi+FHaLn6mEsjPPFO/W4r0MifFULMjvDs
         bsT9TUIZzMG+gQUx1ga187K/YCoUdAmhGE6S32YmwtmVzvN6mb0xXLb964MScdB7jE67
         XXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738934003; x=1739538803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJ1aRL1tR7L7RfcFqqqPbM27tp8K7KNIk+xpnnAJSCM=;
        b=CobG3AAmpjdZdJDk+3L0JaTCZtd2bStALLcnfEBdNf7xSKVtw/2/m8sCR9VosINsib
         fCvC+kVhmTc9G+OTos3kJ0wSDW3Q6tjghwn7jywe+wnQoHYWak4obhndBaXt8zA925gT
         Zt5/M1PKvrx/VvIdpXZA/Yqx13IfpWctaskS/EBlAiErrYD24Ujtc7RPt8M/WwmaAGTd
         Xy+QzlMGm6Fq+VRhAxo0xi6BwD5PaJxRTEhz1hv4h17onYzDfdJUjeo4vBUoKeh79e7Z
         vVqjOOga2pqyyQwFPFsBwWeI525tRkmiqAQqjAsOKcZMouymq5tN4prx2DxXP16iv0uj
         0LZg==
X-Gm-Message-State: AOJu0Ywfw+nKZ4qK7laga6HoP9LCa3/7BtDp9igVQAF6g09KbBsza5On
	diOMybWLhSbY0r2S0/UbcskM1kQSnaPpp4j8/ML+71vjZKMAgHHe0h0fyg==
X-Gm-Gg: ASbGncuYHBKwjgvTsfIPmdZLfK+2t0fwMwZojY0vBZUKXYe53PoRQc91F6sX0GctiCE
	rsvW8SaTgI0FCLIsDrcmk4bklaIsBM5DZVmAausQXiScA7Gp6m0z9CvzPv5Cp+yQCGq42UZWhGk
	YyxWpzQ+y5R423mOVAJdY790JarPlYIrlb0YX0otWDKE1sJUJf6vnWKJ65TJ/kPP+rX7QQew3gN
	7hd+2MEy9MMkacK8ga8IaOQJ1carVdryRY83DX++mciOf5xe4RSmV/WpoHz5UPssUA0lM4jNrQY
	21lYdngwW7nQfWst
X-Google-Smtp-Source: AGHT+IECF7lYykkeCI/4d/Lh89MF3BCVUfqdjNaVx4h05CVDHbES6TyRcM9DEDi1U0HA5FipejNG+Q==
X-Received: by 2002:a17:906:7303:b0:ab7:8520:e953 with SMTP id a640c23a62f3a-ab789c82e91mr287926566b.55.1738934002950;
        Fri, 07 Feb 2025 05:13:22 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for 4.20? v3 0/3] Fixes for vmap_to_mfn() and pt_mapping_level
Date: Fri,  7 Feb 2025 14:13:17 +0100
Message-ID: <cover.1738933678.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce pt_walk(), which does software page table walking to resolve the
following issues:
1. vmap_to_mfn() uses virt_to_maddr(), which is designed to work with VA
   from either the direct map region or Xen's linkage region (XEN_VIRT_START),
   thereby an assertion will occur if it is used with other regions, in
   particular for the VMAP region. The solution is usage of pt_walk() for
   vmap_to_mfn().
2. pt_mapping_level() returns incorrect page table level in the case when
   mfn==INVALID_MFN when, for example, VA was mapped to PA using 4k mapping,
   but during destroying/modification pt_mapping_level() could return incorrect
   page table level as when mfn==INVALID_MFN then only VA is taking into account
   for page table level calculation and so if VA is page table level 1 aligned
   then page_mapping_level() will return level 1 ( instead of level 0 as VA was
   mapped to PA using 4k mapping so there is incostinency here ).
   The solution is to set level=CONFIG_PAGING_TABLE to tell pt_update() algo
   that it should use pt_walk() to find proper page table entry instead of
   using for searching of page table entry based on precalculated by
   pt_mapping_level() `level` and `order` values.

It would be nice  to have these fixes in Xen 4.20 but isn't really critical as
there is no any users for RISC-V port at this moment.

---
Changes in v2-v3:
 - update the commit message.
 - other changes look in specific patch.
---

Oleksii Kurochko (3):
  xen/riscv: implement software page table walking
  xen/riscv: update defintion of vmap_to_mfn()
  xen/riscv: update mfn calculation in pt_mapping_level()

 xen/arch/riscv/include/asm/mm.h   |   2 +-
 xen/arch/riscv/include/asm/page.h |   9 ++
 xen/arch/riscv/pt.c               | 141 +++++++++++++++++++++++-------
 3 files changed, 120 insertions(+), 32 deletions(-)

-- 
2.48.1


