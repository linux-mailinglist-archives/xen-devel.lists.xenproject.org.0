Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DD987AD2A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 18:27:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692668.1080001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSNx-0001nR-10; Wed, 13 Mar 2024 17:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692668.1080001; Wed, 13 Mar 2024 17:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSNw-0001lg-Uc; Wed, 13 Mar 2024 17:27:24 +0000
Received: by outflank-mailman (input) for mailman id 692668;
 Wed, 13 Mar 2024 17:27:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9/O=KT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkSNv-0001lR-PM
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 17:27:23 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f234f549-e15e-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 18:27:20 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-513af1a29b1so131831e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 10:27:20 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f15-20020a170906048f00b00a42ee62b634sm5005732eja.106.2024.03.13.10.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 10:27:18 -0700 (PDT)
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
X-Inumbo-ID: f234f549-e15e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710350839; x=1710955639; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pyLwwVFgBnHc3nFQowSZW9Ad/7H+CSvbIhdAvxdTYsw=;
        b=GlHoAD3iso2LNjQ+hcrnJGYqAANPWb3PYb6VQ0UNuMtUzZeOnzsUpHaKdTuFUBvhpx
         b7Y4E8GH9nJwyxHrGZpYfBLu7+GlPmdhjWJth+6q2zXNawSU4IbQjfiLMhGX9wnOXK/8
         C7TqLr3+HeQi/JXZckRr4YaGtqFfcIx3rNqDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710350839; x=1710955639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyLwwVFgBnHc3nFQowSZW9Ad/7H+CSvbIhdAvxdTYsw=;
        b=D3YQaUh9hEKIehNqP92AFbgoeZURrN/WYLWOdiIHof1HerhrfPHabrhFb/zjwvCwm2
         T/Hk0ikJdHwsTnglTcs7AImoLGQ8XwfTiYKnCjPTaO3y0Jac56m4uJ4YD1EE5Bq/uJEl
         9KULkMGeqkuED9hE9apF2cWnW28TpbN/TpWuMxDQKzsNiwEnUVnL+4ycmWknin6UsX5i
         yhDCFuxsvJGzqnrxWqfU1RgKCmzWi1rGUe0l+wWwY3VcGcLoX94Jze+OiExV3K61fvgD
         7WDL5MgYnECU6IiN9bEfjtMPsUOymlE0YCRf48obMRxglZmmJH/WBxEQn9gsraj4fZ0x
         qThg==
X-Gm-Message-State: AOJu0YzTFP2LwZlsM1Tjr+aDk3R7UvdIWEzH5qBcNwx4g1RpOQqJcDWq
	YyKzPZlY36kcqQUBF12W82P/k6s6GhKz9vLTZ5+2YC5kw2tpTjmudjk3LrojbiJMPqBegv03NDn
	H
X-Google-Smtp-Source: AGHT+IEDKPvTYZ7XDnessGq8xmW9ZOY5dodKLoW5fce8u1aLcMsw6ykbZTFo5kj61Z9Xuhn9yVhX6g==
X-Received: by 2002:a05:6512:3baa:b0:513:b102:7d93 with SMTP id g42-20020a0565123baa00b00513b1027d93mr8028462lfv.24.1710350839245;
        Wed, 13 Mar 2024 10:27:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 0/7] xen/bitops: Reduce the mess, starting with ffs()
Date: Wed, 13 Mar 2024 17:27:09 +0000
Message-Id: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bitops.h is a mess.  It has grown organtically over many years, and forces
unreasonable repsonsibilities out into the per-arch stubs.

Start cleaning it up with ffs() and friends.  Across the board, this adds:

 * Functioning bitops without arch-specific asm
 * An option for arches to provide more optimal code generation
 * Compile-time constant folding
 * Testing at both compile time and during init that the basic operations
   behave according to spec.

and the only reason this series isn't a net reduction in code alone is the
because of the testing infrastructure in patch 1.

This form is superior in many ways, including getting RISC-V support for free.

Testing:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1212269924
  https://cirrus-ci.com/build/4939856296542208

Andrew Cooper (7):
  xen/bitops: Cleanup ahead of rearrangements
  xen/bitops: Implement ffs() in common logic
  xen/bitops: Implement ffsl() in common logic
  xen/bitops: Delete generic_ffs{,l}()
  xen/bitops: Implement ffs64() in common logic
  xen: Swap find_first_set_bit() for ffsl() - 1
  xen/bitops: Delete find_first_set_bit()

 xen/arch/arm/include/asm/bitops.h            | 16 +---
 xen/arch/ppc/include/asm/bitops.h            | 11 ---
 xen/arch/x86/guest/xen/xen.c                 |  4 +-
 xen/arch/x86/hvm/dom0_build.c                |  2 +-
 xen/arch/x86/hvm/hpet.c                      |  8 +-
 xen/arch/x86/include/asm/bitops.h            | 53 +++++------
 xen/arch/x86/include/asm/pt-contig-markers.h |  2 +-
 xen/arch/x86/mm.c                            |  2 +-
 xen/arch/x86/mm/p2m-pod.c                    |  4 +-
 xen/common/Makefile                          |  1 +
 xen/common/bitops.c                          | 70 ++++++++++++++
 xen/common/page_alloc.c                      |  2 +-
 xen/common/softirq.c                         |  2 +-
 xen/drivers/passthrough/amd/iommu_map.c      |  2 +-
 xen/drivers/passthrough/iommu.c              |  4 +-
 xen/drivers/passthrough/x86/iommu.c          |  4 +-
 xen/include/xen/bitops.h                     | 97 +++++++++-----------
 xen/include/xen/compiler.h                   |  3 +-
 18 files changed, 160 insertions(+), 127 deletions(-)
 create mode 100644 xen/common/bitops.c


base-commit: 03cf7ca23e0e876075954c558485b267b7d02406
-- 
2.30.2


