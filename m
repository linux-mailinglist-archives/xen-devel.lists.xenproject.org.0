Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 082B38C753A
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:28:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723176.1127791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZHe-0006sN-F4; Thu, 16 May 2024 11:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723176.1127791; Thu, 16 May 2024 11:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZHe-0006qn-8T; Thu, 16 May 2024 11:28:26 +0000
Received: by outflank-mailman (input) for mailman id 723176;
 Thu, 16 May 2024 11:28:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S52g=MT=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s7ZHb-0006b7-K3
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:28:23 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66ba2f71-1377-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 13:28:21 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51f4d2676d1so820681e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:28:21 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574bcede889sm7083043a12.92.2024.05.16.04.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 04:28:20 -0700 (PDT)
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
X-Inumbo-ID: 66ba2f71-1377-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858901; x=1716463701; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mh2JHdIwpJztutV+fZB/VMbWO9UcZet+J0mJ7x6u9uA=;
        b=FyVEIoKBXcu2dXPz1hqTO9NbZnisIsJy/9AN8C+htXaWZsw41x0RRK4GCEnNupEfoo
         86Ix9j9DDraQFEQGFjhgMNwclL6cuwJHISYaEC4GMlash94NtABRD/jDy0t+EvZE0rGU
         kplI+YL5AdDKq7ej84n2nEC6XYx4c8HPyZeFsy7tMBxWOzKykwhpKyibjkFqTdsGdHXm
         RyNHfCmUEbW2MyV/ME+gBXm/345+tlVO3kCaS4Xyf0cMCrvshlILx/37mZa+mIIGlIhM
         sFp250KCGBzmu1ksN2dqmmriaFD34p2wnZKviQeKbYrQ3PBpsGrawFE1LTFnR7nTcBLQ
         PZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858901; x=1716463701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mh2JHdIwpJztutV+fZB/VMbWO9UcZet+J0mJ7x6u9uA=;
        b=lz18qIs33NtS2KH+Upb7FdFNG4Wlrx6sorGQGD97cf6Y49getzeuwwyIYle3AUo05C
         QFsnhw5qoZWi5j6GHRG+KlRILPCZiybxCQxhwkqegsaMnO6JNKHAO6F4BTBTPD259xoQ
         ICU4hxteHvHDfJV+SBgiBx+SsLDMlVdEduuo0/iKp23ZLUoJ+0BLwqj8r9gy8HjSHz1f
         BAP+V1tR+mR8wHERsXCoi8hdJPHDWVIszzUEuMy1PkNcZapwFmq9FxnwCw7GjKx+4kZ4
         3cxZWNtARvgJlj5RaMsXD53gib1F3M7kt0EMGdHbqFWEGjEtgRWsBN2l6RPju08WAeHz
         kKQQ==
X-Gm-Message-State: AOJu0YxmukrCRlz4cqNqmXCpWuL7myle54E7d/2bzUWxL/TKw0n1izFv
	L+6O+9eRCmwWRiHb8pOH7AuFSl+nTGq7qBg/D73vIqvNXQpXjeEnVLdvkzwr
X-Google-Smtp-Source: AGHT+IGe49aSY0cIVxVwUB7medlul4WDBkOrkONa9aIMfGlMW9FWP5EXeNqwNGPt7Mi/hVzWc3AwMA==
X-Received: by 2002:ac2:5a05:0:b0:521:d17b:3948 with SMTP id 2adb3069b0e04-52210275dd7mr11189735e87.60.1715858900731;
        Thu, 16 May 2024 04:28:20 -0700 (PDT)
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
Subject: [PATCH for-4.19? v3 0/6] x86: Make MAX_ALTP2M configurable
Date: Thu, 16 May 2024 11:28:07 +0000
Message-Id: <cover.1715858136.git.w1benny@gmail.com>
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
- Adding a new `altp2m_count` parameter to xl.
- Adding a new `altp2m_count` parameter to the OCaml bindings.
- Adding a new `altp2m_count` parameter to the xl.cfg manual.
- Adding a new `nr_altp2m` field into the `xen_domctl_createdomain`, which,
  after sanity checks, is stored in newly introduced `nr_altp2m` field of
  `struct domain` - leaving room for other architectures to implement the
  altp2m feature.
- Replacing MAX_ALTP2M macro occurrences with `domain->nr_altp2m`.

This enhancement is particularly relevant for users leveraging Xen's features
for virtual machine introspection.

Changes since v2:
- Changed max_altp2m to nr_altp2m.
- Moved arch-dependent check from xen/common/domain.c to xen/arch/x86/domain.c.
- Replaced min(d->nr_altp2m, MAX_EPTP) occurences for just d->nr_altp2m.
- Replaced array_index_nospec(altp2m_idx, ...) for just altp2m_idx.
- Shortened long lines.
- Removed unnecessary comments in altp2m_vcpu_initialise/destroy.
- Moved nr_altp2m field after max_ fields in xen_domctl_createdomain.
- Removed the commit that adjusted the initial allocation of pages from 256
  to 1024. This means that after these patches, technically, the nr_altp2m will
  be capped to (256 - 1 + vcpus + MAX_NESTEDP2M) instead of MAX_EPTP (512).
  Future work will be needed to fix this.

Petr Beneš (6):
  x86/p2m: Add braces for better code clarity
  tools/xl: Add altp2m_count parameter
  docs/man: Add altp2m_count parameter to the xl.cfg manual
  x86: Make the maximum number of altp2m views configurable
  tools/libxl: Activate the altp2m_count feature
  tools/ocaml: Add altp2m_count parameter

 docs/man/xl.cfg.5.pod.in             | 14 +++++
 tools/golang/xenlight/helpers.gen.go |  2 +
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  8 +++
 tools/libs/light/libxl_create.c      | 10 ++++
 tools/libs/light/libxl_types.idl     |  1 +
 tools/ocaml/libs/xc/xenctrl.ml       |  1 +
 tools/ocaml/libs/xc/xenctrl.mli      |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c  | 11 ++--
 tools/xl/xl_parse.c                  |  4 ++
 xen/arch/x86/domain.c                | 12 +++++
 xen/arch/x86/hvm/hvm.c               |  8 ++-
 xen/arch/x86/hvm/vmx/vmx.c           |  2 +-
 xen/arch/x86/include/asm/domain.h    |  7 ++-
 xen/arch/x86/include/asm/p2m.h       |  4 +-
 xen/arch/x86/mm/altp2m.c             | 23 +++++++-
 xen/arch/x86/mm/hap/hap.c            |  6 +--
 xen/arch/x86/mm/mem_access.c         | 23 ++++----
 xen/arch/x86/mm/mem_sharing.c        |  2 +-
 xen/arch/x86/mm/p2m-ept.c            | 10 ++--
 xen/arch/x86/mm/p2m.c                | 80 ++++++++++++++--------------
 xen/common/domain.c                  |  1 +
 xen/include/public/domctl.h          |  5 +-
 xen/include/xen/sched.h              |  2 +
 24 files changed, 161 insertions(+), 77 deletions(-)

--
2.34.1


