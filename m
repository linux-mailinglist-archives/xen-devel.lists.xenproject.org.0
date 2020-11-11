Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC032AFAD4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:53:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25291.52937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy2j-00065P-LO; Wed, 11 Nov 2020 21:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25291.52937; Wed, 11 Nov 2020 21:52:41 +0000
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
	id 1kcy2j-000650-Hr; Wed, 11 Nov 2020 21:52:41 +0000
Received: by outflank-mailman (input) for mailman id 25291;
 Wed, 11 Nov 2020 21:52:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy2h-00064v-T3
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:52:39 +0000
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ed17be0-ef64-47aa-9111-901f5964348e;
 Wed, 11 Nov 2020 21:52:38 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a3so3668627wmb.5
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:38 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:36 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy2h-00064v-T3
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:52:39 +0000
X-Inumbo-ID: 7ed17be0-ef64-47aa-9111-901f5964348e
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7ed17be0-ef64-47aa-9111-901f5964348e;
	Wed, 11 Nov 2020 21:52:38 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a3so3668627wmb.5
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3MiOpINH1JUMh9U2LTEPR+PiAsExGF06kWdgI0RNB8=;
        b=Yf6WuB6eY5V4AOeOmHhQIsdq9R0KIUEIHf6zV3mR7vdKK8TaaU3KMmOHdqF6n8YK76
         jmrx3ORr7GQGSgrT50nLhStX1Uijf1T+gZGYMAU1dMVhFRn0m6mcxcQSgXBnN05ED6AZ
         xBomaJB5ymu+eE8nHdoaifPeazXd/5MOoHqkH0x7XhDN70YM4MQ1/rLkKT3S5x5qRkYI
         u1NYm2ZRidMAHZWRCIiH9QQfKNef6EZDLsAOfEN5b60jHfY9Nmw48W14nBqxfKzHA6HY
         J1xfqM84mp/gT4+xMByQ8cU7JSm2ahwBpWMG8kLldYzp97Rdb4Hz2clpscqmsYDwAnd0
         vScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3MiOpINH1JUMh9U2LTEPR+PiAsExGF06kWdgI0RNB8=;
        b=XPXCZ+GlFbGUg8xf6asnMTcMmNmnE64OQtFRXEyyLg4uslvOH0i8vlDLCiI0d/rL/r
         1R2139iFcBYY6qA1NZ95vUj5TtM5KwQg0M8ChFKZC8YkkMOsfBwNTPamyNbIAMnHMfqr
         IG1CdMRlovBJptb/0/f3xy5rhdGUl6kpQAK4YU7iq3Irlbqy+n5pG1fVK6iu9RvpTSqV
         Yh3rHeRMdRwBq+qIfUZvJnRWn8R8T8ianSWT8AO8L+bAmZgrT/tmypnArpXB9GUjdemW
         Bw+x89xwXMa8sieItbwFb5YS/QZ684fM2gVUAA09BBEt7n2epZED5Kxuoq7oiRjTywUV
         a4qg==
X-Gm-Message-State: AOAM531liykeDGh+A0HUNLjN2ELeakgQM1L6nwCahHwgGXMtxkXiKBUk
	dfFh3awOrGbN3g6EwAcbDUJmP6SuaPM=
X-Google-Smtp-Source: ABdhPJy7dYCbVtRGUl0azTrQJsb0BfTc7fWZ5x0q979F7T0J1FOIu9/2EBT0HpN7c3xNyilHDfcN4w==
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr6552423wma.154.1605131557181;
        Wed, 11 Nov 2020 13:52:37 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:36 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 00/15] xen/arm: port Linux LL/SC and LSE atomics helpers to Xen.
Date: Wed, 11 Nov 2020 21:51:48 +0000
Message-Id: <20201111215203.80336-1-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>


Hey,

I've found some time to improve this series a bit:


Changes since RFC v1
====================

 - Broken up patches into smaller chunks to aid in readability.

 - As per Julien's feedback I've also introduced intermediary patches
   that first remove Xen's existing headers, then pull in the current
   Linux versions as-is. This means we only need to review the changes
   made while porting to Xen, rather than reviewing the existing Linux
   code.

 - Pull in Linux's <asm-generic/rwonce.h> as <xen/rwonce.h> for
   __READ_ONCE()/__WRITE_ONCE() instead of putting these in Xen's
   <xen/compiler.h>. While doing this, provide justification for
   dropping Linux's <linux/compiler_types.h> and relaxing the
   __READ_ONCE() usage of __unqual_scalar_typeof() to just typeof()
   (see patches #5 and #6).



Keeping the rest of the cover-letter unchanged as it would still be
good to discuss these things:


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

 - The timeout variants of cmpxchg() (used by guest atomics) are still
   using LL/SC regardless of LSE being available, as these helpers are
   not provided by Linux so I just copied over the existing Xen ones.


Any further comments, guidance, and discussion on how to improve this 
approach and get LSE atomics support merged into Xen would be greatly
appreciated.

Thanks!
Ash.

[1] https://lore.kernel.org/xen-devel/13baac40-8b10-0def-4e44-0d8f655fcaf1@xen.org/
[2] https://xenbits.xen.org/xsa/advisory-295.txt

Ash Wilding (15):
  xen/arm: Support detection of CPU features in other ID registers
  xen/arm: Add detection of Armv8.1-LSE atomic instructions
  xen/arm: Add ARM64_HAS_LSE_ATOMICS hwcap
  xen/arm: Delete Xen atomics helpers
  xen/arm: pull in Linux atomics helpers and dependencies
  xen: port Linux <asm-generic/rwonce.h> to Xen
  xen/arm: prepare existing Xen headers for Linux atomics
  xen/arm64: port Linux LL/SC atomics helpers to Xen
  xen/arm64: port Linux LSE atomics helpers to Xen
  xen/arm64: port Linux's arm64 cmpxchg.h to Xen
  xen/arm64: port Linux's arm64 atomic.h to Xen
  xen/arm64: port Linux's arm64 lse.h to Xen
  xen/arm32: port Linux's arm32 atomic.h to Xen
  xen/arm32: port Linux's arm32 cmpxchg.h to Xen
  xen/arm: remove dependency on gcc built-in __sync_fetch_and_add()

 xen/arch/arm/Kconfig                     |  11 +
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/lse.c                       |  13 +
 xen/arch/arm/setup.c                     |  13 +-
 xen/include/asm-arm/arm32/atomic.h       | 253 +++++++-----
 xen/include/asm-arm/arm32/cmpxchg.h      | 388 +++++++++++-------
 xen/include/asm-arm/arm32/system.h       |   2 +-
 xen/include/asm-arm/arm64/atomic.h       | 236 +++++------
 xen/include/asm-arm/arm64/atomic_ll_sc.h | 231 +++++++++++
 xen/include/asm-arm/arm64/atomic_lse.h   | 246 +++++++++++
 xen/include/asm-arm/arm64/cmpxchg.h      | 497 ++++++++++++++++-------
 xen/include/asm-arm/arm64/lse.h          |  48 +++
 xen/include/asm-arm/arm64/system.h       |   2 +-
 xen/include/asm-arm/atomic.h             |  15 +-
 xen/include/asm-arm/cpufeature.h         |  57 +--
 xen/include/asm-arm/system.h             |   9 +-
 xen/include/xen/rwonce.h                 |  21 +
 17 files changed, 1469 insertions(+), 574 deletions(-)
 create mode 100644 xen/arch/arm/lse.c
 create mode 100644 xen/include/asm-arm/arm64/atomic_ll_sc.h
 create mode 100644 xen/include/asm-arm/arm64/atomic_lse.h
 create mode 100644 xen/include/asm-arm/arm64/lse.h
 create mode 100644 xen/include/xen/rwonce.h

-- 
2.24.3 (Apple Git-128)


