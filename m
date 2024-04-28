Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5711D8B4CE8
	for <lists+xen-devel@lfdr.de>; Sun, 28 Apr 2024 18:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713702.1114587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17ll-0006Fn-AH; Sun, 28 Apr 2024 16:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713702.1114587; Sun, 28 Apr 2024 16:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17ll-0006DL-73; Sun, 28 Apr 2024 16:52:53 +0000
Received: by outflank-mailman (input) for mailman id 713702;
 Sun, 28 Apr 2024 16:52:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a4SJ=MB=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s17lj-0006D5-Qs
 for xen-devel@lists.xenproject.org; Sun, 28 Apr 2024 16:52:51 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf10db85-057f-11ef-b4bb-af5377834399;
 Sun, 28 Apr 2024 18:52:49 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-34c90082dd7so1292237f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 28 Apr 2024 09:52:49 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000188c00b00347eb354b30sm27850921wri.84.2024.04.28.09.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Apr 2024 09:52:48 -0700 (PDT)
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
X-Inumbo-ID: bf10db85-057f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714323169; x=1714927969; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYwJB0yrm+W+I8r+YVdNlWkFaWEs2QHJMIircPe7ELI=;
        b=UG3kkV0NY/JMcbJlrk1ZaLI6dZlM8K02yAK3Cn2XypwJ5WHqcKqFwgmdSjYa2eee09
         5cyukfrRZf+e5wpKZLaMsOqdTGUJk4M9NoWLRb/PggryE2Ti3GcwjNFhWPuaKNmc/LNx
         py4WVY2/hhHiW/e+Uo13yYYAezdqVI7GpMDVrHsqbFzl0bTQ86+uKt4sKKMNlmHUZYZT
         Xyiv0HRqcODiwqT7PDb549/37b3fObOPd4MmcTaaXE/r5MgjcGgHY0c6uj6xDcQfUPWa
         w8+MoNXbfNaWpQVltxbjtx9PCH6AzJN//6BqaS16Vf0cARYQb+jjXTjMwSXr0hZ/4Tfp
         GKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714323169; x=1714927969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYwJB0yrm+W+I8r+YVdNlWkFaWEs2QHJMIircPe7ELI=;
        b=FWwoMYyDpozYt+uEQk4dHMmjsev2MLn0O2hZr6OxGOEzBZwyUzrSD5rjxqlk4Wr9B0
         jTIxXhfLuOjMj7udIcGk1uLfg/HP03vYlcoWziy8WI9qnE2lKi1XY8tN3RDlN/idmdbi
         374G8+oyaCVKNvsv/toBD0baVyt3XMH9E9jq37hNrBWg9DlLbHftZnPxNf8Z3NKdFVpj
         ex0KRRd3XaFslVzEDkZVtA4tPUK+jTHp/tGiMQjjsNUXdJiCQ1HzYFzQx9ijL2WwUVZ7
         U5QzsHoeZPBQmm+RKyxG526RA8W7b3sQJv4Klv7Mjlv1/uEZ5c1NiLvw8/tst8YgJiCe
         OQSw==
X-Gm-Message-State: AOJu0YxBO3NAQ2stWuCa4ZahCgiNIRQhhBpdQpsYWPObcfzQ8Rlx0CJ5
	xFMZT8z9GT9NiLS1stl8GT4nX8Qfo53WsvdOmfd1afRp1jadqH3Uh6j4p0MW
X-Google-Smtp-Source: AGHT+IHhtb0ygyL8xaH1mejUAmdcBo10zqBpIowJUkbUpi67rSu4Uio8sH6jzBSA1//QwmcQn7hTxg==
X-Received: by 2002:a5d:54c6:0:b0:346:ad3d:e4bd with SMTP id x6-20020a5d54c6000000b00346ad3de4bdmr4861290wrv.17.1714323168742;
        Sun, 28 Apr 2024 09:52:48 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v2 0/7] x86: Make MAX_ALTP2M configurable
Date: Sun, 28 Apr 2024 16:52:35 +0000
Message-Id: <cover.1714322424.git.w1benny@gmail.com>
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
- Adding a new `max_altp2m` field into the `xen_domctl_createdomain`, which,
  after sanity checks, is stored in newly introduced `max_altp2m` field of
  `struct domain` - leaving room for other architectures to implement the
  altp2m feature.
- Replacing MAX_ALTP2M macro occurrences with `domain->max_altp2m`.
- Finally, adjusting the initial allocation of pages in `hap_enable` from 256
  to 1024 pages to accommodate potentially larger `max_altp2m` values (i.e.,
  maximum of 512).

This enhancement is particularly relevant for users leveraging Xen's features
for virtual machine introspection.

Petr Beneš (7):
  x86/p2m: Add braces for better code clarity
  tools/xl: Add max_altp2m parameter
  docs/man: Add max_altp2m parameter to the xl.cfg manual
  x86: Make the maximum number of altp2m views configurable
  tools/libxl: Activate the max_altp2m feature
  tools/ocaml: Add max_altp2m parameter
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
 xen/arch/x86/mm/hap/hap.c                     |  8 +--
 xen/arch/x86/mm/mem_access.c                  | 14 ++---
 xen/arch/x86/mm/mem_sharing.c                 |  2 +-
 xen/arch/x86/mm/p2m-ept.c                     |  6 +--
 xen/arch/x86/mm/p2m.c                         | 54 ++++++++++---------
 xen/common/domain.c                           |  7 +++
 xen/include/public/domctl.h                   |  3 +-
 xen/include/xen/sched.h                       |  2 +
 25 files changed, 151 insertions(+), 59 deletions(-)

--
2.34.1


