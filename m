Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6AE9B2B35
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 10:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826293.1240488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Ltz-0005Q8-HU; Mon, 28 Oct 2024 09:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826293.1240488; Mon, 28 Oct 2024 09:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Ltz-0005Mt-C6; Mon, 28 Oct 2024 09:19:07 +0000
Received: by outflank-mailman (input) for mailman id 826293;
 Mon, 28 Oct 2024 09:19:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5Ltx-0005MP-JV
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 09:19:05 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acaf1b40-950d-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 10:19:03 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a2209bd7fso605976966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 02:19:03 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f05deb6sm355961566b.88.2024.10.28.02.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 02:19:01 -0700 (PDT)
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
X-Inumbo-ID: acaf1b40-950d-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730107142; x=1730711942; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9KSFGLZal11ofGu3fM65uYuNV5wIYTJuDFkZKcLfKQ=;
        b=XM0+NXar6rBA0arDtrT8KTkpEwtpQHcVUkPlT568kKKOKqN/QF8iD4Er+kT//ukFxx
         GyeqPzVUHRycFttXOcmLBICDtU6vlzDZhqypzEPTF2r3JWvA7fuxT+k13kT40ABGiD9J
         bGZea7T59TROAMMPlJZmtnYx4MxsP29u1yYiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107142; x=1730711942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9KSFGLZal11ofGu3fM65uYuNV5wIYTJuDFkZKcLfKQ=;
        b=IauPM3ml8a5Ion0TrNOqyEcKAP3Y3YU4QZc3ord0nKdO6bUKi/o/DEUtYKMdJahwM8
         utMDPDyvAtx04xw+TVlUA2s/UrqTdsQ4lDmXT4CV454Uy6hedAk5s7h/wcZk+ChtGPt1
         pEhB3ONrHpsBIIHqOEPbn16P18OB6ns7DF+AxU9mVyU4lngqjsoQ5XrGxKNTlfklXa9Y
         68VWroloDRHDdRdxZlgHsrZBOVEtHBt2ra4ETaJhIhj9u3ByvKfJHxyKNCHbwNeTTRua
         i5OzZOWDPUBWISGYcDpKutmX7TlccsyHnbuL3ToKltufekMJKD9Q2gnTfOZQ26pYN8jE
         lA+A==
X-Gm-Message-State: AOJu0Yz3dTfxlTUxV8Z7KyeXmZH98oOoLyjBjfBieCGXAYTNlqU1oBlL
	U//5udt3w4aV0eCUzyRyJ2UN2sXpUrWBIGX69EtRDwXpPhreQgkR/mN5FbWaVRo7Xx0htKm3dp1
	4
X-Google-Smtp-Source: AGHT+IG9zy3kR2QCI2a9SQ3lK0hKhfpvT8YZ9sZlbGf5NFtH450Fi7j0FWAtyWrs05QEAw7Jj1mcOA==
X-Received: by 2002:a17:906:6a0e:b0:a9a:7f37:2b62 with SMTP id a640c23a62f3a-a9de6167b7emr817332166b.49.1730107142076;
        Mon, 28 Oct 2024 02:19:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 00/10] x86/ucode: Fix module-handling use-aftere-free's
Date: Mon, 28 Oct 2024 09:18:46 +0000
Message-Id: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some of these were known, some not, but they were creating unecessary
complexity in the Hyperlaunch series.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1513996396

Andrew Cooper (10):
  x86/ucode: Turn microcode_init_cache() into a presmp_initcall
  x86/ucode: Delete the microcode_init() initcall
  x86/ucode: Break early_microcode_load() out of early_microcode_init()
  x86/ucode: Fold early_microcode_update_cpu() into it's single caller
  x86/ucode: Fold microcode_grab_module() into its single caller
  x86/ucode: Enforce invariant about module selection
  x86/ucode: Move the CPIO path string into microcode_ops
  x86/ucode: Use bootstrap_unmap() in early_microcode_load()
  x86/ucode: Drop ucode_mod and ucode_blob
  x86/ucode: Fold early_update_cache() into its single caller

 xen/arch/x86/cpu/microcode/amd.c     |   4 +
 xen/arch/x86/cpu/microcode/core.c    | 329 ++++++++++++++-------------
 xen/arch/x86/cpu/microcode/intel.c   |   4 +
 xen/arch/x86/cpu/microcode/private.h |   7 +
 xen/arch/x86/include/asm/microcode.h |   1 -
 xen/arch/x86/setup.c                 |   2 -
 6 files changed, 189 insertions(+), 158 deletions(-)

-- 
2.39.5


