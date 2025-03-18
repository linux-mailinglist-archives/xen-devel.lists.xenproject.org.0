Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279ABA67B0D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919605.1324018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuarR-0006IO-En; Tue, 18 Mar 2025 17:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919605.1324018; Tue, 18 Mar 2025 17:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuarR-0006Fg-BS; Tue, 18 Mar 2025 17:36:17 +0000
Received: by outflank-mailman (input) for mailman id 919605;
 Tue, 18 Mar 2025 17:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuarP-0005mN-Hx
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:36:15 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75668cb0-041f-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 18:36:01 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2ff6a98c638so6790540a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 10:36:01 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-737116955f1sm10173156b3a.142.2025.03.18.10.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 10:35:59 -0700 (PDT)
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
X-Inumbo-ID: 75668cb0-041f-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742319360; x=1742924160; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u6p6HS601t4LQD4O2L3P0LFeOS/Dl/nMhibD1dpsuBQ=;
        b=mzn1Lh3dDAj9zUds/werWd3s0iNEaqXA/3ldd6/iqXQqw1V5GG3kZCeB5QR0VFDx/m
         SdQctYIB8Mt+VVXzqjp9Y4krot1sMiFofSdTe2U32YkwZp+KdfAB3AtFmPaCrxE6opKG
         Xfb3QShiJpsh2ZP+5qdPmANP2CLUVToPRriJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742319360; x=1742924160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6p6HS601t4LQD4O2L3P0LFeOS/Dl/nMhibD1dpsuBQ=;
        b=KLwuHcv3TZodyqTWznkH5TQzxw0Oi1R4ZDb9Eqbg4VRGZda8P6alnh5KbRqH14snMr
         rDIVsFgOkqua0RuUMQAcNLPkzCBJS4akdgTdFgbiFUHgQzOyGA/IpJWuql0S3pBJW6Qp
         lTCzJikVghud1FGnRsYBOo9AxAV9xlROTAPBKjblQ6P1RTHWhTlZB6RzRat4EQywioqI
         axWEZ3N6xajJGhicnp7ZbWE1034N9k5djeca+L+CU7FT3kj+il5LZZxoyNmTi1MZ0r6Q
         rIdeEayVwdqRiEo8/ilfsNj5VvQgH0we6SW7EqC1ObF6DXF50kkJOUhBArZZKBHL8kty
         ZMLg==
X-Gm-Message-State: AOJu0Yy/ETpnYbVOQvRAkqXfWBt1UVI5GHooE2FuNymqZKlKb6zgutE+
	tDPnzqeHMH6F1RCPx7A4usum/OzjLuq+JdbqDJWssdglZQTyoyR8wE8Oyx7u91HysGf6teSFm7A
	b
X-Gm-Gg: ASbGncvvN1unXMMctAEKxK8lFxxDII9OqiqoOGGtkIRMJalflGQ986kjArH8hzAkRJU
	ZQzTEZO2wBmsSo4aXuZANlSeqn++/H2794euPSIQvdru2aTNiM34sPGeqMC327+Mql5Cirqi/S+
	dBAHbdHT1W88yjHu2y+9ES1Hw1sdf7t+lrg/CK1R7t8jE0fdp62tid34CsJIYUUNfd1hRa33Afa
	yH3qG4+gEaJBHSZEKBfyTTyWasc26viM/GV0V04e9MWjspLIdU8LwmOfqKdlExlaOdQabPUzmS0
	q35lvhW2pSKhbxl2UinWxPQQK5zXXqOUn80gAQWoEfW8SBQxeA==
X-Google-Smtp-Source: AGHT+IHC9PmMQMmjizDVOpz4VLmnQ88NZipX234zaoT2N/v155VmjHnvFjLCLrzVMDcgwDDwz9czSA==
X-Received: by 2002:a05:6a20:6a1d:b0:1f5:8a69:f41b with SMTP id adf61e73a8af0-1f5c1316662mr21076357637.37.1742319359845;
        Tue, 18 Mar 2025 10:35:59 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 0/7] x86: generate xen.efi image with no write-execute sections
Date: Tue, 18 Mar 2025 18:35:40 +0100
Message-ID: <20250318173547.59475-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The aim of the series is to generate a Xen image with no write and
execute sections, so that the PE binary can be NX_COMPAT.

The main change for achieving this is changing the order in which the
trampoline relocation are applied.  To avoid having write-execute
sections apply the trampoline relocations after having moved the
trampoline to it's final destination.

Thanks, Roger.

Roger Pau Monne (7):
  x86/boot: clarify comment about trampoline_setup usage
  x86/mkelf32: account for offset when detecting note segment placement
  xen: remove -N from the linker command line
  x86/boot: apply trampoline relocations at destination position
  x86/mkreloc: remove warning about relocations to RO section
  x86/efi: do not merge all .init sections
  xen/build: warn about RWX load segments

 xen/Makefile                         |  2 --
 xen/arch/arm/Makefile                |  6 +++---
 xen/arch/ppc/Makefile                |  6 +++---
 xen/arch/riscv/Makefile              |  6 +++---
 xen/arch/x86/Makefile                | 12 ++++++------
 xen/arch/x86/boot/build32.lds.S      |  1 +
 xen/arch/x86/boot/head.S             |  9 +++++----
 xen/arch/x86/boot/mkelf32.c          |  3 ++-
 xen/arch/x86/boot/reloc-trampoline.c | 16 ++++++++--------
 xen/arch/x86/efi/efi-boot.h          | 15 ++++++---------
 xen/arch/x86/efi/mkreloc.c           |  5 -----
 xen/arch/x86/xen.lds.S               |  8 --------
 12 files changed, 37 insertions(+), 52 deletions(-)

-- 
2.48.1


