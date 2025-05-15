Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5E7AB903F
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 21:56:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985920.1371690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFegO-00046g-8M; Thu, 15 May 2025 19:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985920.1371690; Thu, 15 May 2025 19:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFegO-00043b-59; Thu, 15 May 2025 19:55:56 +0000
Received: by outflank-mailman (input) for mailman id 985920;
 Thu, 15 May 2025 19:55:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=us+D=X7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFegN-00043V-1E
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 19:55:55 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b7e9830-31c6-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 21:55:53 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-442ea341570so9087865e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 12:55:53 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ebd6fe86sm78320035e9.0.2025.05.15.12.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 12:55:51 -0700 (PDT)
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
X-Inumbo-ID: 9b7e9830-31c6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747338952; x=1747943752; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ulHZr/ATKsZOEJSJ1e98CTHaG9QuXdMXhbSEfB/e34=;
        b=r3ArmG3FcDJOtUj0R5YxrDgHf0mL/2E+p3CA63PnsaKEsJpdtG1IEIlQ7S00yJRAWb
         IWhdN2DmBAH5qicKg5sm7p7nHyURedvmvNyAee4t4yleXi91GgX1wmK8QRNWa+UkyNfv
         +uR1ODKUktZjZvLgT/OVWyU4NojTyP9d5f/go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747338952; x=1747943752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ulHZr/ATKsZOEJSJ1e98CTHaG9QuXdMXhbSEfB/e34=;
        b=Noo6oyt2v5SvUSNq4ho7buAtH4MOuUvOZGaR3yOUz429CTyHu0MnOvhBrBLppwguH4
         vKSv8rqAkNhRdRjKs+w+7vnxjAkljA3i2wbdLQlHX23dvaMswhwr20vJKvvsXz1cbWDC
         mDNKYJHB1p56O4ep5xshu+qvmRGsgw8QkMLC11Gkh3iHVSz/xaPj72jwZiJiaWLvvIHB
         srEogJKGo9HlNhlCgw+1bIpNVobhtof+PQG4Q7HK8yuEBQLlXKw/ALz9/a7sVJDoRsnp
         Dn+ks0Z+Yyhi1xGFWUzo1oEIij7PzGm1ZNJJ+MWbwIXlSwX4xSYR/sBxuYIA4YxsMquL
         VQMA==
X-Gm-Message-State: AOJu0Yypina3g2EQviuPZN6JEIun2+td7KmBfDUb24mmWbWGG1rzUYPZ
	d2HGSf6Ooxjx8aAYasmCsjfZ2mjUuUoZHjr3NWj9iT3373M9C8hMNEHZxzr8Brf3GSr4I8FSRw+
	7yeoW
X-Gm-Gg: ASbGncvbkA0xCGGYtA+KtjVmCujBMYglY86F7q1DlHIk9VzgbGxG8ASjN2uR2uRoD4B
	bZHdlzpaoUeZumilpcmM0VXs7RfgR11nf5ShZERhFggiLkJM7paN8K5xQiSBK3REQzeN+Q75SXl
	GzIhRKJIFJOkhjuefoO3rYfggo6l5cvqHi1wUq23PMCfoNu7sEXlCIXwQEL7l1bpMAIhKMVXaS0
	KaMyeHTqct+8UR6kMiBQA8PkHnLAr9/X2o/D0jvrr8ZD4B0pbO84RvF92R8tvS57AcdDjNwKdoC
	Qi7WXYerHAXbrS6ru3J5CEXtNHGqDvwkuGCYzbuHZ7sfn6/U9efQmrOgC3vYKRXECzhBWLhpELw
	fI9KlU6lgTYZOXJCfmde0Wzx7
X-Google-Smtp-Source: AGHT+IHdf39d959XKmbL7CjNE1gJ1OdQXf+rjE6/pSKfp4P3O/AFL65LvPL4XGBqlwWvumCC99ohHQ==
X-Received: by 2002:a05:600c:1f15:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-442fd6276b6mr8269825e9.14.1747338952324;
        Thu, 15 May 2025 12:55:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 0/3] xen: Use asm inline
Date: Thu, 15 May 2025 20:55:46 +0100
Message-Id: <20250515195549.3703017-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since v1, split into multiple patches.  Extend to BUG_FRAME and EXTABLE too.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1819941756

Andrew Cooper (3):
  xen: Introduce asm inline and use it for BUG_FRAME
  x86: Use asm_inline for ALTERNATIVE() and EXTABLE
  ARM: Use asm_inline for ALTERNATIVE()

 xen/Kconfig                                 |  4 ++
 xen/arch/arm/include/asm/alternative.h      |  4 +-
 xen/arch/arm/include/asm/arm64/flushtlb.h   |  4 +-
 xen/arch/arm/include/asm/arm64/io.h         | 43 ++++++++++-------
 xen/arch/arm/include/asm/bug.h              |  6 ++-
 xen/arch/arm/include/asm/cpuerrata.h        |  8 ++--
 xen/arch/arm/include/asm/cpufeature.h       |  8 ++--
 xen/arch/arm/include/asm/page.h             | 12 +++--
 xen/arch/arm/include/asm/processor.h        |  7 +--
 xen/arch/arm/include/asm/sysregs.h          | 10 ++--
 xen/arch/arm/mmu/p2m.c                      |  3 +-
 xen/arch/x86/cpu/amd.c                      | 52 +++++++++++----------
 xen/arch/x86/domain.c                       | 21 +++++----
 xen/arch/x86/extable.c                      | 21 +++++----
 xen/arch/x86/hvm/vmx/vmcs.c                 | 15 +++---
 xen/arch/x86/i387.c                         |  4 +-
 xen/arch/x86/include/asm/alternative-call.h |  3 +-
 xen/arch/x86/include/asm/alternative.h      | 36 ++++++++------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h      | 15 +++---
 xen/arch/x86/include/asm/uaccess.h          |  4 +-
 xen/arch/x86/pv/misc-hypercalls.c           | 19 ++++----
 xen/arch/x86/traps.c                        | 48 ++++++++++---------
 xen/arch/x86/usercopy.c                     |  6 +--
 xen/include/xen/bug.h                       | 11 +++--
 xen/include/xen/compiler.h                  | 15 ++++++
 25 files changed, 219 insertions(+), 160 deletions(-)


-- 
2.39.5


