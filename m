Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0373E8C907E
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 13:02:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724744.1129894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8Hpe-00061n-HR; Sat, 18 May 2024 11:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724744.1129894; Sat, 18 May 2024 11:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8Hpe-0005z1-EE; Sat, 18 May 2024 11:02:30 +0000
Received: by outflank-mailman (input) for mailman id 724744;
 Sat, 18 May 2024 11:02:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v3Z6=MV=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s8Hpc-0005yr-Ua
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 11:02:28 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d4542e5-1506-11ef-909f-e314d9c70b13;
 Sat, 18 May 2024 13:02:28 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-34d7d04808bso663375f8f.0
 for <xen-devel@lists.xenproject.org>; Sat, 18 May 2024 04:02:27 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8969fbsm23777282f8f.37.2024.05.18.04.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 04:02:26 -0700 (PDT)
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
X-Inumbo-ID: 1d4542e5-1506-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716030147; x=1716634947; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ny2FsrepfKJ2y1XQxnkhlj9O8cTMpSVhjHMJ5QpUVps=;
        b=d/Amrz5IjOCZAGCZS17u7BIIYDTbQUoXuDkMVyP8cIeoyuXG5WHXB7a6Q1urZyLcYs
         fyd4qnYlriVbRWzDVq2TfVvLMf1rPa9YxqLmH3qEV3kF4l0hhDnF3T7f5RAXMIpxSMGn
         g3twKEbh3nlqWgCSuKQ72ADMtryciUwWzynXy6HUKwQkxDFvA1OsgatzGt7o94qnRpjh
         Kmbs1IquR+JzW0g2+5IVp4G5IDrCrDJCv3H5cRqjODGPgXbH6hWvFReSNbdpgaFpk19N
         amdWUDdFJaZM7wl3PrvzkXLibFX9g8c/EkyIf+Yfdjz7Bt1akbo1vfe1urDmspBypUQg
         qAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716030147; x=1716634947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ny2FsrepfKJ2y1XQxnkhlj9O8cTMpSVhjHMJ5QpUVps=;
        b=OITzh5t3/0ziOSKEeBy81naG+1A/vch+A+1/xIOIK7nGPLKP66umfTCjsRDw2G9el1
         heK/SZVEabc4YOuFOBLoVV0vyjYcA0xEXd18I6T5r7Wt2V69Xkvo6btJjAMii3/1hXNe
         EgSB0q0mj3CtORWIKe8TgEFNAVzpieMEaTcKxd8wy8K/ZJW/mNHlTt+4MN/fMOke9quW
         0wlBJwgYjBKDx4CiueyQKTS2exMeCNcxD23rMFlycou6wuyaCWBMi1NXFNkRjub4bkMH
         +hj5wle+A8v3u3egz5/Zcj/bztjtCJI6NEtdmBN0zQDkYOWZ/Q1QW/f6bqo/9IBjhTKh
         c0Wg==
X-Gm-Message-State: AOJu0YyEvLbZNRaKu6/00Fau55dxEmK3DgjEfHKrqLv0QGtdDijMw+vY
	/2xk8NqU86++gRxH2OVKGy1aB5fQHWkMlWKe27YDw6WYi6iq1w2VWW+vqtPS
X-Google-Smtp-Source: AGHT+IHGIpNZMwjM0oinNCY7ljwWVnBRwhz7LmwvNHu6KdFVMr7iO+9BT/4+0cuCFkkcuFfmg/B3Qw==
X-Received: by 2002:adf:f8c4:0:b0:34f:5d07:ebda with SMTP id ffacd0b85a97d-3504a63111fmr25333962f8f.23.1716030146662;
        Sat, 18 May 2024 04:02:26 -0700 (PDT)
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
Subject: [PATCH for-4.19? v4 0/6] x86: Make MAX_ALTP2M configurable
Date: Sat, 18 May 2024 11:02:11 +0000
Message-Id: <cover.1716029860.git.w1benny@gmail.com>
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
  be capped to (256 - 1 - vcpus - MAX_NESTEDP2M) instead of MAX_EPTP (512).
  Future work will be needed to fix this.

Changes since v3:
- Rebased on top of staging (some functions were moved to altp2m.c).
- Re-added the array_index_nospec() where it was removed.

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
 tools/libs/light/libxl_create.c      | 10 +++
 tools/libs/light/libxl_types.idl     |  1 +
 tools/ocaml/libs/xc/xenctrl.ml       |  1 +
 tools/ocaml/libs/xc/xenctrl.mli      |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c  | 11 ++--
 tools/xl/xl_parse.c                  |  4 ++
 xen/arch/x86/domain.c                | 12 ++++
 xen/arch/x86/hvm/hvm.c               |  8 ++-
 xen/arch/x86/hvm/vmx/vmx.c           |  2 +-
 xen/arch/x86/include/asm/domain.h    |  7 +--
 xen/arch/x86/include/asm/p2m.h       |  6 +-
 xen/arch/x86/mm/altp2m.c             | 91 +++++++++++++++++-----------
 xen/arch/x86/mm/hap/hap.c            |  6 +-
 xen/arch/x86/mm/mem_access.c         | 24 ++++----
 xen/arch/x86/mm/mem_sharing.c        |  2 +-
 xen/arch/x86/mm/p2m-ept.c            | 12 ++--
 xen/arch/x86/mm/p2m.c                | 12 ++--
 xen/common/domain.c                  |  1 +
 xen/include/public/domctl.h          |  5 +-
 xen/include/xen/sched.h              |  2 +
 24 files changed, 169 insertions(+), 74 deletions(-)

--
2.34.1


