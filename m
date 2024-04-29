Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF8C8B5D26
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714185.1115265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sk2-0006aI-Cj; Mon, 29 Apr 2024 15:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714185.1115265; Mon, 29 Apr 2024 15:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sk2-0006Yh-9c; Mon, 29 Apr 2024 15:16:30 +0000
Received: by outflank-mailman (input) for mailman id 714185;
 Mon, 29 Apr 2024 15:16:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZQG=MC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1Sk1-0006Yb-59
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:16:29 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73671c86-063b-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:16:28 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-516d4d80d00so5811883e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:16:28 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ah2-20020a1709069ac200b00a4e393b6349sm13898875ejc.5.2024.04.29.08.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:16:26 -0700 (PDT)
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
X-Inumbo-ID: 73671c86-063b-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714403787; x=1715008587; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ARwKD8NnQuoF1+xb6uNuvZwD8zOCHWahqmHkc59mx5M=;
        b=Zwx4+arhHs3l7N2HKM08ybLCg+2Q4zbNZO5x8gu4A94Wa/gESW3CnPJhq02ebg31jK
         qMiD+XtS2ilB9ni1bO+Rqxl97Vj/W+PxO0iR1N9/4ycMMLYw9Kn1bARMvCJODcNMYejd
         Ce+94cedbO0Qbkdiou32cFMxf+gTdC9jMidn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403787; x=1715008587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARwKD8NnQuoF1+xb6uNuvZwD8zOCHWahqmHkc59mx5M=;
        b=BcDNNhk1VLZr1v7+n7FxuI35COVkdFPl4bqaico1Glt4QgzJLQNVWEalPBoUOpEP2y
         CdqDJVxRrzyR5F9as0V9a52NMFXHz1bJEjsVMC5417GnBhMbHpZj2KxSEo6dsLhGXLNa
         V4j8kg8T/6Gq7VVlteAXUSjnRyxcIfvKAu0dr7Eh+f90MbFYY5E3FXMoQSF+r0laweJ/
         FhzGabwe+vee9sCXpRkwbIE8QartfCdrlesKQHGy9y8b5i/Ht28kswlcHS8mI5lIiPR5
         MELu5EApUWPScb96kzh5+Jx/xVCuONNhWRAovXffR5jlgOVbL9AxTZe3XrCUYbmVQUb/
         pU8w==
X-Gm-Message-State: AOJu0YzbNKnxuzZHtdd7swI0InqQSF9m5cvYNrDeVrNWjjlkPgvIRUy8
	36XxX6w8Hsjj3poAqeQO1mfghyaCuY+QnmuwuC0jSIe57G4BwJ4nnVl2fSxqhbiO8eNClkV+Ufr
	1
X-Google-Smtp-Source: AGHT+IEvYEtaBMx7bCM5l4trc8XOAFmTPKX77fx9dRw1sG88R7jpLDOmioDheLZPpRc7wBQ8GLFtEQ==
X-Received: by 2002:a05:6512:1328:b0:51c:8b45:c9fb with SMTP id x40-20020a056512132800b0051c8b45c9fbmr8032701lfu.69.1714403787098;
        Mon, 29 Apr 2024 08:16:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrei Semenov <andrei.semenov@vates.fr>,
	Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: [PATCH 0/5] x86: AMD CPUID handling improvements
Date: Mon, 29 Apr 2024 16:16:20 +0100
Message-Id: <20240429151625.977884-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is (half) the series I've promised various people, to untangle some AMD
CPUID handling.  It moves the SVM feature leaf into the standard
x86_capabilities[] infrastructure.

On a random Milan system, with this in place, xen-cpuid reports:

Dynamic sets:
Raw                             178bfbff:7eda320b:2fd3fbff:75c237ff:0000000f:219c95a9:0040069c:00006799:91bef75f:00000000:00000000:0000204d:00000000:00000000:00000000:00000000:00000000:00000000:119b9cff:0101fd3f
  [18] CPUID 0x8000000a.edx     npt v-lbr svm-lock nrips v-tsc-rate vmcb-cleanbits flush-by-asid decode-assist pause-filter <11> pause-thresh v-loadsave v-gif <17> npt-sss v-spec-ctrl <23> <24> <28>
  [19] CPUID 0x8000001f.eax     sme sev <2> sev-es sev-snp <5> <8> <10> <11> <12> <13> <14> <15> <16> <24>

Host                            178bf3ff:76da320b:2fd3fbff:644037ff:0000000f:219c95a9:0040068c:00000780:319ed205:00000000:00000000:18000045:00000000:00000000:00000000:00000000:00000000:00000000:001994ff:00000000
  [18] CPUID 0x8000000a.edx     npt v-lbr svm-lock nrips v-tsc-rate vmcb-cleanbits flush-by-asid decode-assist pause-filter pause-thresh v-loadsave v-gif npt-sss v-spec-ctrl
  [19] CPUID 0x8000001f.eax

HVM Max                         178bfbff:f6fa3203:2e500800:440001f7:0000000f:219c05a9:0040060c:00000100:331ed005:00000000:00000000:18000045:00000000:00000000:00000000:00000000:00000000:00000000:000004ab:00000000
  [18] CPUID 0x8000000a.edx     npt v-lbr nrips vmcb-cleanbits decode-assist pause-filter
  [19] CPUID 0x8000001f.eax


Unforunately, I haven't managed to do the second half to make the host_policy
usable earlier on boot.  Untanling __setup_xen() is proving stuborn due to
(ab)uses of the MB1 module list.

Andrew Cooper (5):
  x86/cpu-policy: Infrastructure for the AMD SVM and SEV leaves
  x86/cpu-policy: Add SVM features already used by Xen
  x86/spec-ctrl: Remove open-coded check of SVM_FEATURE_SPEC_CTRL
  x86/svm: Switch SVM features over normal cpu_has_*
  x86/cpu-policy: Introduce some SEV features

 tools/libs/light/libxl_cpuid.c              |  2 +
 tools/misc/xen-cpuid.c                      | 24 ++++++++++
 xen/arch/x86/cpu-policy.c                   | 17 +++----
 xen/arch/x86/cpu/common.c                   |  4 ++
 xen/arch/x86/hvm/svm/asid.c                 |  5 +--
 xen/arch/x86/hvm/svm/emulate.c              |  3 +-
 xen/arch/x86/hvm/svm/intr.c                 |  1 -
 xen/arch/x86/hvm/svm/nestedsvm.c            | 14 +++---
 xen/arch/x86/hvm/svm/svm.c                  | 50 +++++----------------
 xen/arch/x86/hvm/svm/vmcb.c                 |  1 -
 xen/arch/x86/include/asm/cpufeature.h       | 16 +++++++
 xen/arch/x86/include/asm/hvm/svm/svm.h      | 36 ---------------
 xen/arch/x86/spec_ctrl.c                    |  7 +--
 xen/include/public/arch-x86/cpufeatureset.h | 22 +++++++++
 xen/include/xen/lib/x86/cpu-policy.h        | 24 +++++++++-
 xen/lib/x86/cpuid.c                         |  4 ++
 xen/tools/gen-cpuid.py                      |  7 +++
 17 files changed, 128 insertions(+), 109 deletions(-)

--
2.30.2

