Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E262AAADBB6
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 11:43:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978416.1365211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCbJ1-00064J-SL; Wed, 07 May 2025 09:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978416.1365211; Wed, 07 May 2025 09:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCbJ1-00062f-Pk; Wed, 07 May 2025 09:43:11 +0000
Received: by outflank-mailman (input) for mailman id 978416;
 Wed, 07 May 2025 09:43:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCvR=XX=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1uCbJ0-00062T-EY
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 09:43:10 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aebd44e4-2b27-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 11:43:08 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so37993595e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 02:43:08 -0700 (PDT)
Received: from localhost.localdomain (172.74.6.51.dyn.plus.net. [51.6.74.172])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b16f00sm16051290f8f.84.2025.05.07.02.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 02:43:06 -0700 (PDT)
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
X-Inumbo-ID: aebd44e4-2b27-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746610988; x=1747215788; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mcjy7e7bDp34ojMNL7zLdM48GMDWY9lrNewxJNow70E=;
        b=cmgir/aWK01BlT89N5N6aIGbTLNATWrIxbg0Ru9f/LuaSHtmPOSfqXcs+dT4EyojEg
         bOq1R6r0pZqNJTp2/DWTDDPp8mTcw0ip+6QC6UTPvV1DTMB9bdLG02x0paqRFs7+ZHZw
         NtNfptcv/m6o+RtQjhgLRjc8WsRxOYDjSpZIuaV5wZD6V96wYf/vWfLlIy3zlgZeePwW
         b5WsXzvVXoj7tUN3zkrwxbV2Y2OnOIAsYKKLOSY08QwBTjRnj5NxYwl7eefajW1ZfMju
         sOc11F4orWI433HvL9aAMEeWlECiOBQ8dSHeJhKa45OF1ujUjHrUaKJHT54Ph2ihJ6HN
         A/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746610988; x=1747215788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mcjy7e7bDp34ojMNL7zLdM48GMDWY9lrNewxJNow70E=;
        b=AZyNv28OmtboqnxVL6Wl8S2UF0eb7ePtTvtuPEbT18I2i5936injf9mxvk6eFdT2tS
         gJSmo0ukEQFLRdXDGVMalrvXAQeg+p90MgOgC7L8e1ETOYmOjRi5zB8sDOWIV0aPem4f
         n0UILWeNHWhxvXI+Imur7gM008f4ndd11TzALMUfVu/EjetBe8AI4aRVvOUDCkev1D4r
         3hOpK2NdWAk2euMzQmWnMvRm6avJyeREoVDM6VSBno1vIbJjN5jWF7LFfey/leO67u/R
         kNYmVM2Cot/utvNMFv6n5x09TMu5Y7Q1n30PH2U16jV+z3/Ri80swD4p8Lc7FY4ORjMY
         EsGg==
X-Gm-Message-State: AOJu0YyK1S01G4DrD3I+PX/IzwyCt3Wq+iSkEry8MSAK1qDEnYOuUnT1
	mjCufYcGwoPzNxJ0GqOObKn5gOKCP+uAOKctq/e+f3FQ4Tgzy0w8nkuGPUCZiNA=
X-Gm-Gg: ASbGncuGud8Vj6yzMBFE/RqzIwq7Ve7+0t10/Pek9PIWLNyZB7xcD3IzI/8cefpX9OJ
	7XiDTyG46+4qR1lvoXSUkYZ531bcwAa71+SKE0c6/lxe/XetlvsUCsbxlb5BbeoDc1CDCquNOz4
	O8+8R85l5VP5KGfXj3Vjb3DTPYQhU+FugGB0afCLgqUxqTlMx2z7TDmqq5JpUVgLoyi/yt4iFU6
	pm678V5Y9Q7MxRZqr7FaPdDmsJ7uqkOnn0pSzsf+abnNX6VAu2vVHVNpEOUhccwzqXnBPLac0jE
	XTCBSawptkFJyTYwdYSGxmanfdW9xL2O6CDedSk/bk1T5FwSFctdcUJ/4bFbIw7hSSDjLjd1vXj
	uCDUiAZs=
X-Google-Smtp-Source: AGHT+IFzn5UTKFzX+vZDU43NrBMaQzRcmi1RY7efAUZNXBnx/Ax15A5oUiw4J6MIUqESewW415PoXA==
X-Received: by 2002:a05:600c:6487:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-441d44c2c61mr20890295e9.13.1746610987496;
        Wed, 07 May 2025 02:43:07 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/4] Allows Secure Boot for Kexec
Date: Wed,  7 May 2025 10:42:45 +0100
Message-ID: <20250507094253.10395-1-freddy77@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frediano Ziglio <frediano.ziglio@cloud.com>

Using EFI Secure Boot all kernel level code should be signed and
there should be no way to run unchecked code.
For this reason the Kexec interface needs to be changed in order
to allows signature checking.

The purgatory code is included in Xen itself as passing this code
from userspace it's not secure (see patches 2/4 and 3/4).

Changes since v1:
- update copyright lines;
- better sha2 declarations.

Ross Lagerwall (4):
  xen/lib: Export additional sha256 functions
  kexec: Include purgatory in Xen
  kexec: Implement new EFI load types
  kexec: Support non-page-aligned kexec segments

 xen/arch/arm/Makefile                 |   1 +
 xen/arch/arm/kexec.c                  |  27 +
 xen/arch/x86/Makefile                 |   2 +
 xen/arch/x86/bzimage.c                |  40 +-
 xen/arch/x86/kexec.c                  | 125 +++++
 xen/arch/x86/purgatory/.gitignore     |   3 +
 xen/arch/x86/purgatory/Makefile       |  64 +++
 xen/arch/x86/purgatory/config.h       |  37 ++
 xen/arch/x86/purgatory/entry64.S      | 108 ++++
 xen/arch/x86/purgatory/purgatory.c    |  59 +++
 xen/arch/x86/purgatory/setup-x86_64.S |  63 +++
 xen/arch/x86/purgatory/stack.S        |  21 +
 xen/common/Kconfig                    |   1 +
 xen/common/kexec.c                    |  33 +-
 xen/common/kimage.c                   | 703 ++++++++++++++++++++++++--
 xen/include/public/kexec.h            |  23 +-
 xen/include/xen/kimage.h              |  57 ++-
 xen/include/xen/sha2.h                |  12 +
 xen/include/xen/x86-linux.h           |  62 +++
 xen/lib/sha2-256.c                    |  19 +-
 20 files changed, 1348 insertions(+), 112 deletions(-)
 create mode 100644 xen/arch/arm/kexec.c
 create mode 100644 xen/arch/x86/kexec.c
 create mode 100644 xen/arch/x86/purgatory/.gitignore
 create mode 100644 xen/arch/x86/purgatory/Makefile
 create mode 100644 xen/arch/x86/purgatory/config.h
 create mode 100644 xen/arch/x86/purgatory/entry64.S
 create mode 100644 xen/arch/x86/purgatory/purgatory.c
 create mode 100644 xen/arch/x86/purgatory/setup-x86_64.S
 create mode 100644 xen/arch/x86/purgatory/stack.S
 create mode 100644 xen/include/xen/x86-linux.h

-- 
2.43.0


