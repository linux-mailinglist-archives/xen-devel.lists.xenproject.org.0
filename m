Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA85A6F8843
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 19:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530594.826302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzgE-0006ba-Md; Fri, 05 May 2023 17:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530594.826302; Fri, 05 May 2023 17:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzgE-0006Yt-G9; Fri, 05 May 2023 17:57:18 +0000
Received: by outflank-mailman (input) for mailman id 530594;
 Fri, 05 May 2023 17:57:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1gM=A2=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1puzgC-0006Yg-Gj
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 17:57:16 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44447875-eb6e-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 19:57:15 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso14987995e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 May 2023 10:57:14 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b12-20020adfe30c000000b00306423904d6sm3053844wrj.45.2023.05.05.10.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 10:57:12 -0700 (PDT)
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
X-Inumbo-ID: 44447875-eb6e-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683309433; x=1685901433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q1h9+sOy91h+3M0AKDC27QolVTLW8C6xg301Hs3wQXQ=;
        b=NUt+BCXAFaIMCWuvrEKzAzsu+FJJ0FZB1k8sG8goSYxw5RnMZSuDvCbxdo8aMCjwB8
         FXzaSVlQQ5g81Ek0bfrH1Zf00cyXAi4RN++m14nbcMCFbdFQVc9A7W6/N9mQpNL8k4/Z
         EMw7vlgtIJrqy/I/QMDdx9a3MMIYdd7repEjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683309433; x=1685901433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1h9+sOy91h+3M0AKDC27QolVTLW8C6xg301Hs3wQXQ=;
        b=XFz9bxiDSE7pmes0mQN0QP4Hg/p5POeY5dmGGnL133UK2s2mnaPM8cOElMtEnccco2
         1ESgywIjgjk6NQg/b35zZvxS079OnNEnlMTRg0J+BvHXHH28+zwnj4MImTn3ySwB0TmH
         tgRn3UIA5AryLktgjYK781K4rmwEi1exwLgUxNaogvPgkPAsaiAO/A+soNTf3vL9c7pF
         JbeXaCJQAJRmuUHPZUK3JcPVAhJA2jT94nxBkQckpFHlhZTkRZr3s2ARbwNNBqUkXX8x
         b9bvYFyn/gbm7qlTq8wckjj1OvmTJuJJd2f09EnlP3EDVdi4Wtj0KdmcIhB1TP7UF7K4
         wZCg==
X-Gm-Message-State: AC+VfDzovUQnLXlFiYoymaJfiV5wnyvi2UAMrTHiwwaYjbhNa0Jeaf0r
	wc57xCDFWm1ZLQo2vM0Ll2gpD9wz/I9jJHGP13g=
X-Google-Smtp-Source: ACHHUZ7G8+HYT3oqu2wvuuAHP58jwcanfBtV62hU5W0nwG7NX2mhAIPVxD5VmNHQXpKHIg0M18Bqug==
X-Received: by 2002:a7b:c44c:0:b0:3ed:f5b5:37fc with SMTP id l12-20020a7bc44c000000b003edf5b537fcmr1589134wmi.1.1683309432993;
        Fri, 05 May 2023 10:57:12 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] Add CpuidUserDis support
Date: Fri,  5 May 2023 18:57:02 +0100
Message-Id: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nowadays AMD supports trapping the CPUID instruction from ring3 to ring0,
(CpuidUserDis) akin to Intel's "CPUID faulting". There is a difference in
that the toggle bit is in a different MSR and the support bit is in CPUID
itself rather than yet another MSR. This patch enables AMD hosts to use it
when supported in order to provide correct CPUID contents to PV guests. Also
allows HVM guests to use CpuidUserDis via emulated "CPUID faulting".

Patch 1 merely adds definitions to various places in CPUID and MSR

Patch 2 adds support for CpuidUserDis, hooking it in the probing path and
the context switching path.

Patch 3 enables HVM guests to use CpuidUserDis as if it was CPUID faulting,
saving an avoidable roundtrip through the hypervisor at fault handling.

Alejandro Vallejo (3):
  x86: Add AMD's CpuidUserDis bit definitions
  x86: Add support for CpuidUserDis
  x86: Use CpuidUserDis if an AMD HVM guest toggles CPUID faulting

 tools/libs/light/libxl_cpuid.c              |  1 +
 tools/misc/xen-cpuid.c                      |  2 +
 xen/arch/x86/cpu/amd.c                      | 29 +++++++++++-
 xen/arch/x86/cpu/common.c                   | 51 +++++++++++----------
 xen/arch/x86/cpu/intel.c                    | 11 ++++-
 xen/arch/x86/include/asm/amd.h              |  1 +
 xen/arch/x86/include/asm/msr-index.h        |  1 +
 xen/arch/x86/msr.c                          |  9 +++-
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 9 files changed, 79 insertions(+), 27 deletions(-)

-- 
2.34.1


