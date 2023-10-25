Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B03F7D7442
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623188.970776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZo-0000ag-1L; Wed, 25 Oct 2023 19:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623188.970776; Wed, 25 Oct 2023 19:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZn-0000YU-Ut; Wed, 25 Oct 2023 19:29:59 +0000
Received: by outflank-mailman (input) for mailman id 623188;
 Wed, 25 Oct 2023 19:29:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZn-0000YO-3c
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:29:59 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1ddf04c-736c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 21:29:57 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso23292566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:29:57 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:29:56 -0700 (PDT)
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
X-Inumbo-ID: e1ddf04c-736c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262197; x=1698866997; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pDxkD+A5E3zD+dh5+2dNxlmVsOA+sHZME9bukK+va6M=;
        b=YlY0a0WCnnWj7Pe9XeastUjWy8i6U26TFh8inq14vkphFsplnvM9FMuT4bjZ5IiFp5
         4i1UC5VjGVn058FQcgqlNncXYE2DUsL81dUgQnc0/AghC0fGM+irvCie3a3fw4w68BoW
         beFmYfxHVk1ln0WFRPsZ5eIf1MJMBl6GnmLn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262197; x=1698866997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDxkD+A5E3zD+dh5+2dNxlmVsOA+sHZME9bukK+va6M=;
        b=p/VkNslIqkmBWEt2fAs5fnNvQyYVRumAdi0oyjgsBQd5kbusbp98gcyLRCoa9+1J+C
         psrlVZgw+V+eLRHvxaCxliReqQzuufgJ8wnUzLRuFvlwUDhX5pPsBBPCXJL7ctGaISYP
         LmpeN4G1uH4+K1ydnGTzFSi6cdwkoF3fRmsPHvcS6IWuIXo7EeUsxdXzOLxavhtP4yBb
         6F3uuFtHWy7x62t9Ys8hlbbI89N7UGd05k0SInzwn/Je9hmSEWTGgezHET+EUg88lDiT
         wXx/RxUL8yJZm0tTkq8aZ8jzoydDU3Pdx2kcGXrrmMPMLJgi+SZa2LwMhq9xmBGp0sXm
         rBkQ==
X-Gm-Message-State: AOJu0Yw0i57HheiO9LHkzZ/SPCzLsy8Ws1zp8hoRcZHT5KqO+z6l8spf
	qHy04DH5U25z5P2gq6g0DPvDWDpvdmQriaf89xgAkKae
X-Google-Smtp-Source: AGHT+IFvVFtL/e/JLTsCsc9+lm+Go7R+Vy98je34yfz3U8PuPiV5jwKaWKSpYA4ziUjQFwYEV85FIQ==
X-Received: by 2002:a17:907:e8d:b0:9c0:1d65:68d9 with SMTP id ho13-20020a1709070e8d00b009c01d6568d9mr14425677ejc.7.1698262197237;
        Wed, 25 Oct 2023 12:29:57 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [RFC PATCH 00/22] vPMU bugfixes and support for PMUv5
Date: Wed, 25 Oct 2023 20:29:30 +0100
Message-Id: <cover.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These are a set of patches to improve performance monitoring in Xen.
It starts by fixing MSR_PLATFORM_INFO and making MSR_SMI_COUNT available.
Also allows a pinned Dom0 to read any MSR, there is no reason why this shouldn't be allowed, and it prevents having to recompile Xen in order to investigate a problem that is difficult to reproduce (e.g. one such MSR is the SMI counter).

Then it fixes bugs in each architectural PMU version starting from version 1, and introduces support
for new features up to version 5. This was done by reading the Intel SDM for each version and checking whether Xen implements the needed features correctly.

AMD is next with fixes for performance counters that were readable but not exposed in CPUID, and new support for another performance counter.

There is more to be done here (APERF/MPERF, IBS, temperature monitoring, and I haven't even began approaching uncore counters), but those are difficult to do correctly and I've split them out of this series.

The patches were written in 2021, then git segfaulted when rebasing them and they got lost in a branch until now.
I've rebased and compile-tested them on latest Xen master, but I haven't done any further testing on them yet, hence the RFC prefix to mark these as experimental (e.g. I'm not entirely sure whether some changes got lost in the cpuid.c to cpu-policy.c rebase or not).

I'm sending this out as an RFC so it is not lost again, and I'll resend a proper version once the code has been tested more.
The backport tags attempt to indicate which version of Xen is the oldest one that has a bug fixed by the patch, should a backport be desired.
E.g. Xen with vpmu on would claim it supports PMUv3, but doesn't actually implement it correctly, so those patches+AMD CPUID fix could be backported.

Edwin Török (22):
  x86/msr: MSR_PLATFORM_INFO shouldn't claim that turbo is programmable
  x86/msr: implement MSR_SMI_COUNT for Dom0 on Intel
  x86/msr: always allow a pinned Dom0 to read any unknown MSR
  x86/msr-index: add references to vendor manuals
  x86/PMUv1: report correct information in 0xa CPUID
  x86/PMUv1: limit arch PMCs to 4 for non-Dom0
  x86/PMUv1: allow topdown slots arch perf event
  x86/PMUv1: define macro for max number of events
  x86/PMUv1: consistently use 8 perf counters in Dom0
  x86/PMUv2: limit number of fixed perf counters to 3
  x86/PMUv2: freeze support in IA32_DEBUGCTL
  x86/msr-index: define more architectural MSRs
  x86/vpmu: expose PDCM and IA32_PERF_CAPABILITIES when vpmu is enabled
  x86/msr: RO MSR_TURBO_RATIO_LIMIT{,1,2}, MSR_TEMPERATURE_TARGET
  x86/VPMU: use macros for max supported VPMU version
  x86/PMUv4: support LBR_Frz and CTR_Frz
  x86/PMUv4: IA32_PERF_GLOBAL_{STATUS_SET, INUSE} support
  x86/PMUv4: disable intercept for PERF_GLOBAL_STATUS
  x86/PMUv4: bump max PMU version to 4
  x86/PMUv5: limit available fixed PMCs and enable support
  x86/AMD: fix CPUID for PerfCtr{4,5}
  x86/AMD: add IRPerf support

 xen/arch/x86/cpu-policy.c                   | 32 +++++--
 xen/arch/x86/cpu/vpmu_intel.c               | 99 ++++++++++++++-------
 xen/arch/x86/cpuid.c                        | 40 ++++++++-
 xen/arch/x86/hvm/svm/svm.c                  |  4 +
 xen/arch/x86/hvm/vmx/vmx.c                  | 33 +++++--
 xen/arch/x86/include/asm/msr-index.h        | 79 ++++++++++++++--
 xen/arch/x86/include/asm/vpmu.h             | 32 +++++++
 xen/arch/x86/msr.c                          | 22 +++++
 xen/arch/x86/pv/emul-priv-op.c              | 28 +++---
 xen/include/public/arch-x86/cpufeatureset.h |  6 +-
 xen/include/xen/lib/x86/cpu-policy.h        |  5 +-
 11 files changed, 317 insertions(+), 63 deletions(-)

-- 
2.41.0


