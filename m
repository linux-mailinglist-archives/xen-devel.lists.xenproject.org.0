Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49119C2649
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 21:12:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832902.1248209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VKu-0002s6-Ew; Fri, 08 Nov 2024 20:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832902.1248209; Fri, 08 Nov 2024 20:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VKu-0002pX-BQ; Fri, 08 Nov 2024 20:12:04 +0000
Received: by outflank-mailman (input) for mailman id 832902;
 Fri, 08 Nov 2024 20:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9VKs-0002pM-NS
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 20:12:02 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4bd377a-9e0d-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 21:11:58 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c9c28c1e63so3102964a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 12:11:57 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5d7e6sm2334739a12.14.2024.11.08.12.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:11:51 -0800 (PST)
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
X-Inumbo-ID: b4bd377a-9e0d-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzYiLCJoZWxvIjoibWFpbC1lZDEteDUzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI0YmQzNzdhLTllMGQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDk2NzE4LjAyNDIyNSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731096714; x=1731701514; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9F0p0naKEdjA8PbAMPXImgeAUFCdUbbfn6MicbM+T3I=;
        b=DA5/O/+PHaEN36dIRmyl9AkokjmQ8mjlGnPnZTVDNzu0c9tHPo7DktW8YsGsqNhsr+
         U7Qeu+vCyMFk6qnVlRyw0R+Tvwsk3WgoDgH5qQvyZ16nhPCAETPUa7ne4ttabn6PUieA
         6PRdww/IfGyJMdqaaOMcDaPUKuPzFpNIhJWxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096714; x=1731701514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9F0p0naKEdjA8PbAMPXImgeAUFCdUbbfn6MicbM+T3I=;
        b=pA4rwxgHYCJJZ5mEYxr13/BodkBMd18p/knpK38DNIyb4cNzOHRQlAeaUvJ/nEbGlL
         kB/jW9RTfy3ZKO5VfD01WtF2T7wWCLWjGFDlI35lkqKsINjyKQbKXSUgJxOJZOpvrECm
         4fiqrQP40Qsr2uA9kFheMpRA5sRbYjSqjlltf5KE6G0EZhMWhBbbUIGr1nPTRZVdWrfc
         yLAPNKPy/WXUnjwhetcFQ3zkhX3ido+YZM4cOxhR/8DEWxDcl9Q0Md8USR0dnnVutBhj
         jNf+ats9TOzP79lsJ1hRW9F9dnsKiwMw5tz62WwSzeJhgu2ep2mCBYtavTSAVgrAP3XA
         t5sQ==
X-Gm-Message-State: AOJu0Yztwx5cHGQydI0MpELgZg7Nl9J+enAokxicWMHWTpoyONVNIrHf
	lyshg9Su3IIEstmuyFviqk3BwG4q3vKBmrqv450BezPY0z1DhdbElLyKxpJwW9cvF6RqiMhBt08
	1
X-Google-Smtp-Source: AGHT+IEdzDyeihdzCj3aKezy0q0OZAZqJFrhos4n8zlZY/g5Pf2OfszD2IBIqGNSZU6ZRY9nnwrXRQ==
X-Received: by 2002:a50:d5c7:0:b0:5cf:f82:edfd with SMTP id 4fb4d7f45d1cf-5cf0f82eebdmr3015585a12.3.1731096714387;
        Fri, 08 Nov 2024 12:11:54 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/4] Untangle mach-default/
Date: Fri,  8 Nov 2024 20:11:43 +0000
Message-Id: <20241108201147.812036-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are only a few trivial header files left here.  Shuffle or drop them, so
we can remove another compiler include path.

Andrew Cooper (4):
  x86: Move mach-default/irq_vectors.h to asm/irq-vectors.h
  x86: Move mach-default/io_ports.h to asm/io-ports.h
  x86: Drop mach-default/bios_ebda.h
  x86: Drop mach_mpspec.h

 xen/arch/x86/apic.c                               |  5 +++--
 xen/arch/x86/arch.mk                              |  1 -
 xen/arch/x86/cpu/vpmu.c                           |  4 +++-
 xen/arch/x86/dom0_build.c                         |  2 +-
 xen/arch/x86/hvm/intercept.c                      |  1 -
 xen/arch/x86/i8259.c                              |  4 ++--
 .../asm/{mach-default/io_ports.h => io-ports.h}   |  0
 .../{mach-default/irq_vectors.h => irq-vectors.h} |  0
 xen/arch/x86/include/asm/mach-default/bios_ebda.h | 15 ---------------
 .../x86/include/asm/mach-default/mach_mpspec.h    | 10 ----------
 xen/arch/x86/include/asm/mpspec.h                 |  4 +++-
 xen/arch/x86/io_apic.c                            |  4 ++--
 xen/arch/x86/irq.c                                |  2 +-
 xen/arch/x86/mpparse.c                            |  9 +++++++--
 xen/arch/x86/msi.c                                |  3 +--
 xen/arch/x86/pv/hypercall.c                       |  3 ++-
 xen/arch/x86/pv/traps.c                           |  2 +-
 xen/arch/x86/smp.c                                |  2 +-
 xen/arch/x86/smpboot.c                            |  2 +-
 xen/arch/x86/time.c                               |  2 +-
 xen/arch/x86/traps.c                              |  2 +-
 xen/arch/x86/x86_64/compat/entry.S                |  2 +-
 xen/arch/x86/x86_64/entry.S                       |  2 +-
 23 files changed, 32 insertions(+), 49 deletions(-)
 rename xen/arch/x86/include/asm/{mach-default/io_ports.h => io-ports.h} (100%)
 rename xen/arch/x86/include/asm/{mach-default/irq_vectors.h => irq-vectors.h} (100%)
 delete mode 100644 xen/arch/x86/include/asm/mach-default/bios_ebda.h
 delete mode 100644 xen/arch/x86/include/asm/mach-default/mach_mpspec.h

-- 
2.39.5


