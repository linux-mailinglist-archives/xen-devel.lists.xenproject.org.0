Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177B6A6A86D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:26:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922161.1326079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGqr-0007vg-9X; Thu, 20 Mar 2025 14:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922161.1326079; Thu, 20 Mar 2025 14:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGqr-0007sa-5i; Thu, 20 Mar 2025 14:26:29 +0000
Received: by outflank-mailman (input) for mailman id 922161;
 Thu, 20 Mar 2025 14:26:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G4gr=WH=linaro.org=linus.walleij@srs-se1.protection.inumbo.net>)
 id 1tvGqp-0007sM-Q5
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:26:27 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e609983-0597-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 15:26:26 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5497590ffbbso991706e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 07:26:26 -0700 (PDT)
Received: from Fecusia.lan (c-92-34-223-1.bbcust.telenor.se. [92.34.223.1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba8a9201sm2216816e87.250.2025.03.20.07.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 07:26:24 -0700 (PDT)
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
X-Inumbo-ID: 4e609983-0597-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742480786; x=1743085586; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvoMtFQu/5mLGfm/YlEYZey6eEGMtp23wegCaBbXJv4=;
        b=lQDOKy5uKb17/Ey1SKQ7kCtGdmLpMMH4Ad87cPy7nubl+zLDdBIr+DEwfGiTZhivUh
         GGWwsld/e6bCbWdKzDZ8DE126Ib/XGrH/3RVNqPJtcMlo+vTYCe/WxvRPryaawCbpJOl
         0moyijVWVNavkkkOBIZQQWz0xmd2MhEmkOvnjXbGNSIOXV419AprZORKvErXiM5CFrUS
         q24dl4s7wkIhwDfXo4s/ZpSLRhKTb7JObW2MiFUvbowzTt9ruw8SwFgE8Ut83b8f9jyT
         f84Oa7wbaWEImWJlOXoq+c+lPbpc1DfiLSbLRoGmCv7iN21JXzc2k5mIjL86fxM3a13F
         YlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742480786; x=1743085586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvoMtFQu/5mLGfm/YlEYZey6eEGMtp23wegCaBbXJv4=;
        b=FIXeeg6RuyTU7jxBi0tGH6nNNXM4+w01MI2/C/8/mz56ChCvvBXQbSVcaNmTv8dRpe
         Vfm4knt9i0qP2yrtHg0znRnCY8q1nklWf7imNkMGjJb+83SXBi7/K90OMahBCYkSVQ9B
         XiJCIKEdCfuWswhgaIavD1i0JdgxI+qbyarLtKl9jDfuzOgWfOq378JRDHCpXq1+ePea
         KEeT7xPShz3MOnXmlI35Y+Gg7/KNsKrqVOnudubDAbIvtaK6IXRKNyZEys9X+o1vcUh9
         h1y6M+0yT/xIOPaAAlx91bQG1Fm9oVS69oGuol3pro+ZjCmh8jCIu15M1wE1LCxAThll
         SlmA==
X-Forwarded-Encrypted: i=1; AJvYcCUVGfhcjGznnE2Cb78d5yNM4aAxQGo0fi9GjAzCubvh3BqQUjP4aclDiaj7A/AQcBjUmwBxJma0wsA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyABPpLbmodd6+oi2JjK30z1TOz7riADEm8yS5eA9MqD9QRWQJj
	k3h6lvZWHjLNhXqN288cCcDoHq3rnvSukKLd1b6xUtki3m0LCDbfOH35jZnOGEw=
X-Gm-Gg: ASbGncv0thZFxhDTFr4CHuUAs37BHtQp73c1EOlon+1cnRI+QrFu741bkBeXsJ5yR2t
	PAw2mEtXXTdVUDBlwQRupAbpDHGuU2QEe2Es/WvzyZvCkSFMF1o2YrHqHZLFVk/REh129K9gDka
	Uwd9xNuOOs/+qReOgX5X29FLTJ5SwPrC2GlY6cfvYb940Li9ApJwd9Ndm6SF6x5WHI5aDID6jXR
	/bYITp+rtV+SgUa2/xiNUxdbO9dm8ExeFK1D4ZXWFWeIR8qJ+luoYh0vFZbx/snwK3oLySt1iO2
	ptTnvfA5T1mV7/H3RQgIlPSXzWxlCFEUJJU+A7Nit38tSISxhfc0KBpTngTijBKN3vYEl6DrYYH
	CfJjI
X-Google-Smtp-Source: AGHT+IGJdiwH3GLesSTdhfruK4DZmmmGPbFFRhIvLmZNGlq+ysSxYFDz9Vi7Dj6qQxxwk7XjYXZifg==
X-Received: by 2002:a05:6512:1153:b0:545:d70:1d0e with SMTP id 2adb3069b0e04-54ad061ba69mr1646599e87.3.1742480785393;
        Thu, 20 Mar 2025 07:26:25 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: catalin.marinas@arm.com,
	will@kernel.org,
	oleg@redhat.com,
	sstabellini@kernel.org,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kees@kernel.org,
	aliceryhl@google.com,
	ojeda@kernel.org,
	samitolvanen@google.com,
	masahiroy@kernel.org,
	rppt@kernel.org,
	xur@google.com,
	paulmck@kernel.org,
	arnd@arndb.de,
	mark.rutland@arm.com,
	puranjay@kernel.org,
	broonie@kernel.org,
	mbenes@suse.cz,
	sudeep.holla@arm.com,
	guohanjun@huawei.com,
	prarit@redhat.com,
	liuwei09@cestc.cn,
	Jonathan.Cameron@huawei.com,
	dwmw@amazon.co.uk,
	kristina.martsenko@arm.com,
	liaochang1@huawei.com,
	ptosi@google.com,
	thiago.bauermann@linaro.org,
	kevin.brodsky@arm.com,
	Dave.Martin@arm.com,
	joey.gouly@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Cc: ruanjinjie@huawei.com,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next v6 1/8] entry: Split generic entry into generic exception and syscall entry
Date: Thu, 20 Mar 2025 15:26:12 +0100
Message-ID: <20250320142612.396250-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213130007.1418890-2-ruanjinjie@huawei.com>
References: <20250213130007.1418890-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Currently CONFIG_GENERIC_ENTRY enables both the generic exception
> entry logic and the generic syscall entry logic, which are otherwise
> loosely coupled.
>
> Introduce separate config options for these so that archtiectures can
> select the two independently. This will make it easier for
> architectures to migrate to generic entry code.
>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

If the generic entry maintainer (hi Thomas) thinks this patch is
OK it would be nice to have it applied because it will also make
the ARM32 transition to generic entry easier as we can work on
exception and syscall entry each in isolation.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

