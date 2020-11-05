Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BE22A8688
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 19:57:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20049.45637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakRN-0006ed-MB; Thu, 05 Nov 2020 18:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20049.45637; Thu, 05 Nov 2020 18:56:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakRN-0006eE-Ix; Thu, 05 Nov 2020 18:56:57 +0000
Received: by outflank-mailman (input) for mailman id 20049;
 Thu, 05 Nov 2020 18:56:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kakRM-0006e9-R2
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:56:56 +0000
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03f5b427-568c-49fc-a385-3ec145cd49a3;
 Thu, 05 Nov 2020 18:56:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w1so3008867wrm.4
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 10:56:55 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id n14sm3451536wrt.8.2020.11.05.10.56.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2020 10:56:53 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kakRM-0006e9-R2
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:56:56 +0000
X-Inumbo-ID: 03f5b427-568c-49fc-a385-3ec145cd49a3
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 03f5b427-568c-49fc-a385-3ec145cd49a3;
	Thu, 05 Nov 2020 18:56:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w1so3008867wrm.4
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 10:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfScFRyc+sSjBIArHw1y0ULwQ0XgOh8QIfTfRbg6KTQ=;
        b=aQ86Z3gCyi9d7H6PiZXHmAxYcTzwQit7blu5nXVyFZkyPZCu7lni92eRg1zWDIUlAm
         U6ZjtFQy2fhzV1wk97ur+WxBA57x0vdYRFiZ9mTg5SzoU+lAK1eiC6IGrDnvjd7XjxQP
         gEfJD6/jJwlkdrZTVE2tes5k8yR8mighXhnQJJydpo75f8YKs9G5kwRrXXfbZKXyeJQC
         jzGFM6I4ZOh8RfZNdxi5MD3fqjf00njBQD16nHGrCNutH0tFl/AglpixV0XT5JQsCsfm
         qvrICzrkS48/wR7HuF7ztX1DjzZxdzSJGgTzActg81ilzJMKU7qznEVy+tCh2Riukzc6
         2+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfScFRyc+sSjBIArHw1y0ULwQ0XgOh8QIfTfRbg6KTQ=;
        b=QcFr6dOK00GMf3F/yX+pCvcjc2GF2RnZpG4H/Z4XKxbK0i2Ix71B69GN66POenJX/d
         SOrZFIqnalESspArn+kA/LwUqwE8DXNHJdMNQFZk+TUh1o5zVNtcp98GEfonURiyvI5B
         Uw8eSyi3y4MYx2FcBtyYrk8UtnAaQ3Cq958PLxVrK8tmrGmj1YDqQuKjhrjRudmvATVg
         rcVxBKF1PGyw8BCtGgwwqfOsHKPxntha3KPLXyOWh6IIBFIyM5jNLpcz5Lek7KsTVjbK
         cUvCxXByDcN6K69JEuFR3Pcu92ZLtdrt0tnMDnPcE15wfrWHIYJ4zzuuc3whqG5S54dU
         a4Zw==
X-Gm-Message-State: AOAM532y6/+a+7s+0Ajm8w0cOP0NGEE0F/Jb5IteydE9IMgTiXAt3cgB
	uid7K7UBJLopYTU8JRc0WxuIlAd8HHg=
X-Google-Smtp-Source: ABdhPJyq3eVqOAyUJxBTKS5sW8I8V0MbjGQRL7nSksSQBVrHpSjp8wo70Pt5cGi3EcSiv0DBChpPWQ==
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr4427411wrt.23.1604602614536;
        Thu, 05 Nov 2020 10:56:54 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id n14sm3451536wrt.8.2020.11.05.10.56.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 10:56:53 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH 0/6] Port Linux LL/SC and LSE atomics to Xen
Date: Thu,  5 Nov 2020 18:55:57 +0000
Message-Id: <20201105185603.24149-1-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[this is my personal account, opinions expressed are entirely my own]

Hi,

I'm starting this new series thread to discuss how Linux's LL/SC and LSE
atomics helpers may best be ported to Xen, as per the discussion at [1].


Arguments in favour of doing this
=================================

    - Lets SMMUv3 driver switch to using <asm/atomic.h> rather than
      maintaining its own implementation of the helpers.

    - Provides mitigation against XSA-295 [2], which affects both arm32
      and arm64, across all versions of Xen, and may allow a domU to
      maliciously or erroneously DoS the hypervisor.

    - All Armv8-A core implementations since ~2017 implement LSE so
      there is an argument to be made we are long overdue support in
      Xen. This is compounded by LSE atomics being more performant than
      LL/SC atomics in most real-world applications, especially at high
      core counts.

    - We may be able to get improved performance when using LL/SC too
      as Linux provides helpers with relaxed ordering requirements which
      are currently not available in Xen, though for this we would need
      to go back through existing code to see where the more relaxed
      versions can be safely used.

    - Anything else?


Arguments against doing this
============================

    - Limited testing infrastructure in place to ensure use of new
      atomics helpers does not introduce new bugs and regressions. This
      is a particularly strong argument given how difficult it can be to
      identify and debug malfunctioning atomics. The old adage applies,
      "If it ain't broke, don't fix it."

    - Anything else?


Disclaimers
===========

    - This is a very rough first-pass effort intended to spur the
      discussions along.

    - Only build-tested on arm64 and arm32, *not* run-tested. I did also
      build for x86_64 just to make I didn't inadvertently break that.

    - This version only tackles atomics and cmpxchg; I've not yet had a
      chance to look at locks so those are still using LL/SC.


Series contents
===============

    - Patch #1 allows for detecting architectural features advertised
      in ID registers other than ID_AA64PFR{0,1}_EL1 and ID_PFR{0,1}.

    - Patch #2 uses the new infrastructure above to detect the presence
      of Armv8.1-LSE atomic instructions, as advertised by ID register
      ID_AA64ISAR0_EL1.

    - Patch #3 introduces the ARM64_HAS_LSE_ATOMICS hwcap, as well as
      the new Kconfig CONFIG_ARM64_LSE_ATOMICS, which enables runtime
      detection and setting of this hwcap.

    - Patch #4 pulls in the Linux LL/SC and LSE atomics helpers for
      arm64, using the new ARM64_HAS_LSE_ATOMICS hwcap to patch itself
      at runtime to use LSE where available and otherwise falling back
      on LL/SC.

        !! NB: Patch #4 breaks arm32 builds until Patch #5 ports
           Linux's 32-bit LL/SC helpers. I split the patches up
           to make them easier to review and discuss.

    - Patch #5 pulls in the Linux LL/SC atomics helpers for arm32.

    - Finally, Patch #6 removes Xen's dependency on gcc's built-in
      __sync_fetch_and_add() helper, instead using the ported Linux
      atomic_fetch_add() helper.


Any comments, guidance, and discussion on how to improve this first-pass
approach to get LSE atomics support merged into Xen would be greatly
appreciated.

Thanks!
Ash.

[1] https://lore.kernel.org/xen-devel/13baac40-8b10-0def-4e44-0d8f655fcaf1@xen.org/
[2] https://xenbits.xen.org/xsa/advisory-295.txt

Ash Wilding (6):
  xen/arm: Support detection of CPU features in other ID registers
  xen/arm: Add detection of Armv8.1-LSE atomic instructions
  xen/arm: Add ARM64_HAS_LSE_ATOMICS hwcap
  xen/arm64: Port Linux LL/SC and LSE atomics helpers to Xen
  xen/arm32: Port Linux LL/SC atomics helpers to Xen
  xen/arm: Remove dependency on gcc builtin __sync_fetch_and_add()

 xen/arch/arm/Kconfig                     |  11 +
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/lse.c                       |  13 +
 xen/arch/arm/setup.c                     |  13 +-
 xen/include/asm-arm/arm32/atomic.h       | 261 +++++++-----
 xen/include/asm-arm/arm32/cmpxchg.h      | 403 +++++++++++-------
 xen/include/asm-arm/arm32/system.h       |   2 +-
 xen/include/asm-arm/arm64/atomic.h       | 242 +++++------
 xen/include/asm-arm/arm64/atomic_ll_sc.h | 236 +++++++++++
 xen/include/asm-arm/arm64/atomic_lse.h   | 251 +++++++++++
 xen/include/asm-arm/arm64/cmpxchg.h      | 505 ++++++++++++++++-------
 xen/include/asm-arm/arm64/lse.h          |  53 +++
 xen/include/asm-arm/arm64/system.h       |   2 +-
 xen/include/asm-arm/atomic.h             |  15 +-
 xen/include/asm-arm/cpufeature.h         |  57 +--
 xen/include/asm-arm/system.h             |  10 +-
 xen/include/xen/compiler.h               |   3 +
 17 files changed, 1506 insertions(+), 572 deletions(-)
 create mode 100644 xen/arch/arm/lse.c
 create mode 100644 xen/include/asm-arm/arm64/atomic_ll_sc.h
 create mode 100644 xen/include/asm-arm/arm64/atomic_lse.h
 create mode 100644 xen/include/asm-arm/arm64/lse.h

-- 
2.24.3 (Apple Git-128)


