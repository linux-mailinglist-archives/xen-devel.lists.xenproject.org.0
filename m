Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC31A8B14D4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 22:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711650.1111776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzjRX-0004J4-0T; Wed, 24 Apr 2024 20:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711650.1111776; Wed, 24 Apr 2024 20:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzjRW-0004H3-TT; Wed, 24 Apr 2024 20:42:14 +0000
Received: by outflank-mailman (input) for mailman id 711650;
 Wed, 24 Apr 2024 20:42:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q5fc=L5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rzjRW-0004Gx-05
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 20:42:14 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ff18baa-027b-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 22:42:11 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-51ae2e37a87so315187e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 13:42:11 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 cd9-20020a170906b34900b00a5264576138sm8740067ejb.35.2024.04.24.13.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 13:42:09 -0700 (PDT)
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
X-Inumbo-ID: 1ff18baa-027b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713991330; x=1714596130; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=geFxrE/DVFSAD/xwwDS4D3R/c09jE38s/B61NjKI6hc=;
        b=S6lNnQT6N21ldAqo9F1mgvKlYkRkuunQuvGDy4lBKd6BHIH5LMilU3XK+08lGyBgyI
         lvKkqRNtq4CVUt3RVhLIJDjLwlRHwBspEa8hwx7cijb+gpI1Bjp0U1zxCg/d+JxRlXAf
         TMlKHw9TfcQsf+9e3h8FsGHUFbcE7A2kAH2HZNfDnx8K8ZYVsl4Plg19QlSCXuEb7AGh
         EGIXTbZSeVzdJNm6M/vHkjQ8iE4lLOTi7081dERnH6tLnbD66p/L2srf9/KbfVVazhkB
         LMkgyVTmQCGaHD4UZaiXj33jxB7NdRv4BJ6ZFUg+gu+DeU9pVF5pfH3vF8nbsIJxJQEC
         nOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713991330; x=1714596130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geFxrE/DVFSAD/xwwDS4D3R/c09jE38s/B61NjKI6hc=;
        b=caxOJ6ja/cerdqb+bnXp2+VlXk5gACMOcYe+jGBV1pI1APL29S4kn2TybJMuTO236x
         5PH567rrMM8Dyb79Twynt6s2iqywEiweJRpv7N3ruTf7z90LQeCHOJDtADtY5ggmRSiK
         zUPz/Cvs0MPLRs2R0avbe/QqJOJCKcjdD5Elm4nOkJVo5IpE7IxbToJSYlA3IqtDsOGS
         9xTZGQLa7ddgDS0gBqcmlnWGzYgZgGAfBOSFh7DMAtfrGUkHjR44JuLRDJZcurJOFha/
         YZOOAQkA4/KNAzTJk9tcbExyBq+NLU12rZeaQA5qRyO3Uh6PDVpfEZz4sf2bGM97iYrh
         wUhg==
X-Gm-Message-State: AOJu0YwiwlPvNkqyfKX3HFC3InONTQr9cEhyx5UMrqgnbCGSnrKNKr96
	q7nV0ThlbeqBzFRhXkgBAMWFv9EWeLiR231DF6K3Xs4vy6eg+pLurtXoc7S2
X-Google-Smtp-Source: AGHT+IHHTCTULf8InWUNarmFYSoVI8tAxf3RnjoXLLw6h/xuEcnD2L7+Wa5oXUrx7ZebFU+JRHMuBg==
X-Received: by 2002:a05:6512:3995:b0:51a:c3a6:9209 with SMTP id j21-20020a056512399500b0051ac3a69209mr3002411lfu.68.1713991330119;
        Wed, 24 Apr 2024 13:42:10 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH 0/7] x86: Make MAX_ALTP2M configurable
Date: Wed, 24 Apr 2024 20:41:58 +0000
Message-Id: <cover.1713990376.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This series introduces the ability to configure the maximum number of altp2m
tables during domain creation. Previously, the limits were hardcoded to a
maximum of 10. This change allows for greater flexibility in environments that
require more or fewer altp2m views.

Adjustments include:
- "Prepare" commits with style changes.
- Adding a new `max_altp2m` parameter to xl.
- Adding a new `max_altp2m` parameter to the OCaml bindings.
- Adding a new `max_altp2m` parameter to the xl.cfg manual.
- Introducing `max_altp2m` into `xen_domctl_createdomain`, which, after sanity
  checks, is stored in newly introduced `max_altp2m` field of `struct domain` -
  leaving room for other architectures to implement the altp2m feature.
- Replacing MAX_ALTP2M macro occurrences with `domain->max_altp2m`.
- Finally, adjusting the initial allocation of pages in `hap_enable` from 256
  to 1024 pages to accommodate potentially larger `max_altp2m` values (i.e.,
  maximum of 512).

This enhancement is particularly relevant for users leveraging Xen's features
for virtual machine introspection.

Petr Beneš (7):
  x86/p2m: Add braces for better code clarity
  x86/hap: Refactor boolean field assignments
  tools/xl: Add max_altp2m parameter
  tools/ocaml: Add max_altp2m parameter
  docs/man: Add max_altp2m parameter to the xl.cfg manual
  x86: Make the maximum number of altp2m views configurable
  x86/hap: Increase the number of initial mempool_size to 1024 pages

 docs/man/xl.cfg.5.pod.in                      | 14 +++++
 tools/golang/xenlight/helpers.gen.go          |  2 +
 tools/golang/xenlight/types.gen.go            |  1 +
 tools/include/libxl.h                         |  8 +++
 tools/libs/light/libxl_create.c               |  9 ++++
 tools/libs/light/libxl_types.idl              |  1 +
 tools/ocaml/libs/xc/xenctrl.ml                |  1 +
 tools/ocaml/libs/xc/xenctrl.mli               |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c           | 17 +++---
 .../paging-mempool/test-paging-mempool.c      |  2 +-
 tools/xl/xl_parse.c                           |  4 ++
 xen/arch/x86/domain.c                         |  6 +++
 xen/arch/x86/hvm/hvm.c                        |  8 ++-
 xen/arch/x86/hvm/vmx/vmx.c                    |  2 +-
 xen/arch/x86/include/asm/domain.h             |  7 ++-
 xen/arch/x86/include/asm/p2m.h                |  4 +-
 xen/arch/x86/mm/altp2m.c                      | 27 +++++++++-
 xen/arch/x86/mm/hap/hap.c                     | 12 ++---
 xen/arch/x86/mm/mem_access.c                  | 14 ++---
 xen/arch/x86/mm/mem_sharing.c                 |  2 +-
 xen/arch/x86/mm/p2m-ept.c                     |  6 +--
 xen/arch/x86/mm/p2m.c                         | 54 ++++++++++---------
 xen/common/domain.c                           |  7 +++
 xen/include/public/domctl.h                   |  1 +
 xen/include/xen/sched.h                       |  2 +
 25 files changed, 152 insertions(+), 60 deletions(-)

-- 
2.34.1


