Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822FEAF986C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 18:34:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033538.1406867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXjMg-0005Gy-38; Fri, 04 Jul 2025 16:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033538.1406867; Fri, 04 Jul 2025 16:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXjMg-0005FB-0P; Fri, 04 Jul 2025 16:34:18 +0000
Received: by outflank-mailman (input) for mailman id 1033538;
 Fri, 04 Jul 2025 16:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FCR=ZR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXjMe-0005Ex-M0
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 16:34:16 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8371210-58f4-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 18:34:15 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-450ccda1a6eso8188655e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 09:34:13 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9989fcesm59199345e9.16.2025.07.04.09.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:34:12 -0700 (PDT)
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
X-Inumbo-ID: b8371210-58f4-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751646853; x=1752251653; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MKn4LuS2kPwNNLgfUqQnQ+x+awYkEgL1Ur7Px4yZhLA=;
        b=NAfyKPmE9r1f6/rxcdtAIEcNN6T0j6fitI0kcMHdfhaIeT1dkhXe/3O3TsZpO1C4O0
         CvwImo6exG3GCQdTDE9diDR6zLRhv/eMkNuYnk0Ph9GYVKdAHl/QjcYqkcqR5Mo28z4O
         CuzQx+qY4JNvcAMl84aS4sNERrhGwxB0Y8NoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646853; x=1752251653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MKn4LuS2kPwNNLgfUqQnQ+x+awYkEgL1Ur7Px4yZhLA=;
        b=LNASorWahJpxFaSjFxMLrLAlB3iJp5Kyd9ib5HiaoNI2ZBMklkOFt1N9UxOlsgVtgg
         61Jzfy7TNhEFRlr/90cc6lNAgh0MrsSlpXbzzWpv2oxmLdWEfUzK9l3ROKRA6ANZeNTK
         Yls7riyo+a6WmW3g3srATstEVzdxhwM32ed3T3VrkUoI4tt7YxeRuIn2D1En5BE3d3jC
         stYkfnH/2ycWBNStE9ECBolo6GxAlFzgOPsLl4OcdUWbX4+68PIszl8ptdoynUy6fPxE
         AxRhZbLoqS7dp4THTUMesFeIz9mqlnaOjDFgTLfKByepfY//ILwkbOxVCdTN37B0ZPGP
         JesA==
X-Gm-Message-State: AOJu0YwCRGIr7ZbZpC89QAe+lOtGWRc7f0MJZMrPpiS+icSchLveaJa7
	TIJkkJGQzdM0iEh3TSDymVK71pQCY438/HarHz2u1LfKtcc9r3ZgyPUBzGAPs0FoyzjzqhlMP1W
	OCBZ5DEXCVIgh
X-Gm-Gg: ASbGnctFcJZvZDgbz/SAd1Vy4jnwldlTrq5Z6xmwKiAAFKMpxmeqqLp6y9J2aAgoeKh
	qEvQv3FaBWv3jeXIplRsdauOa5Nh1zNLfmN8dqkEVNsBJwYf/5UtjPjKv7Zj8OafDdGK24No90W
	OLvFOXIKwn5JGX/c7uWe+U2Oe51Opc7rYPW+8I/t+6d8+W0BclIdly01jfIn+02GiBB7UxmSXJW
	IVpSHieaOOR1lIdAp2Ytyj8J840SK3LnivipeQLkfF+UFajbVKc/8Duz5ondv5vwfPLKs2sOXq0
	Z3sqpUlM774zD7BLF3KgFIkPyd0duMrVp6b0N8poIst2jQ0NLTq+iD8BMozoSrEWZJZQYC3QbcU
	8SXlw5ApYwREzRn38lxQfaFPd0pZlNMnLNg6+S2Q5ReaS8g==
X-Google-Smtp-Source: AGHT+IFgsafkHAdIs+5jSqv4wwmC+jxNfM2MFIA/sYRuCsfVtC9+bQZH7bmVO5Jet5pfhJq2EM9MnQ==
X-Received: by 2002:a05:600c:8b30:b0:453:8bc7:5e53 with SMTP id 5b1f17b1804b1-454b2ffe13fmr39858155e9.0.1751646852734;
        Fri, 04 Jul 2025 09:34:12 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/6] x86/idle: Multiple MWAIT fixes
Date: Fri,  4 Jul 2025 17:34:04 +0100
Message-Id: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The two main bugs were identified in Linux first, and I've modelled Xen's fix
similarly.

Patches 1-4 want committing together.  They do bisect and operate correctly,
but the range takes out an optimisation in order to reimplement it correctly.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1905583317

Andrew Cooper (6):
  x86/idle: Remove broken MWAIT implementation
  x86/idle: Drop incorrect smp_mb() in mwait_idle_with_hints()
  x86/idle: Convert force_mwait_ipi_wakeup to X86_BUG_MONITOR
  xen/softirq: Rework arch_skip_send_event_check() into arch_set_softirq()
  x86/idle: Implement a new MWAIT IPI-elision algorithm
  x86/idle: Fix buggy "x86/mwait-idle: enable interrupts before C1 on Xeons"

 xen/arch/x86/acpi/cpu_idle.c           | 92 +++++++++++---------------
 xen/arch/x86/cpu/intel.c               |  2 +-
 xen/arch/x86/cpu/mwait-idle.c          |  8 +--
 xen/arch/x86/hpet.c                    |  2 -
 xen/arch/x86/include/asm/cpufeatures.h |  1 +
 xen/arch/x86/include/asm/hardirq.h     | 21 ++++--
 xen/arch/x86/include/asm/mwait.h       |  3 -
 xen/arch/x86/include/asm/softirq.h     | 48 +++++++++++++-
 xen/common/softirq.c                   |  8 +--
 xen/include/xen/cpuidle.h              |  2 -
 xen/include/xen/irq_cpustat.h          |  1 -
 xen/include/xen/softirq.h              | 16 +++++
 12 files changed, 124 insertions(+), 80 deletions(-)

-- 
2.39.5


