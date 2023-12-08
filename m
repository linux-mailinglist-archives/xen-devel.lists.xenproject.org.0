Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CD180A80E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 17:02:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650716.1016473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdJD-0002Og-P4; Fri, 08 Dec 2023 16:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650716.1016473; Fri, 08 Dec 2023 16:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdJD-0002Le-Lx; Fri, 08 Dec 2023 16:02:35 +0000
Received: by outflank-mailman (input) for mailman id 650716;
 Fri, 08 Dec 2023 16:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsQu=HT=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rBdJC-0002KL-3g
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 16:02:34 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 326d5810-95e3-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 17:02:33 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c07ed92fdso23554555e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 08:02:33 -0800 (PST)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a5d69c3000000b00333320cf08bsm2300535wrw.102.2023.12.08.08.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 08:02:31 -0800 (PST)
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
X-Inumbo-ID: 326d5810-95e3-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702051352; x=1702656152; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8jUqU0bmKI0qcZGuspvx5ymNI9NbJaI4Epk9AOYOeR0=;
        b=cHgMXWrUW04Z8wooL8vgvU1Kc2ZM1hTSuHw+RNwDBzIZvv7ywKuFFpzi3eyD5ydt46
         ICTPs3tM6IV4yEUK17MQerofMd1hpj6HVqJXLPy6EKu2cnC9EmT6pWfANDJfj51plvz0
         pJ/U62Lf6Lb4bk15xaTl5b8yyWDhnO7yTKKg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702051352; x=1702656152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jUqU0bmKI0qcZGuspvx5ymNI9NbJaI4Epk9AOYOeR0=;
        b=rSU37cCj/9qAqUVftxshU9bur7Xta3KxHRAykjCilNTnyVYIpVmE9z+yuVDzUxgFZ6
         g5sn1eqvcCOPYLa2LSauw183Nflvb//27O57M3HY9qQ5UXnfhTmzJwL62mDcOOhSwI4l
         vg1WrfblDShCl9O3qmmz3B6iNf5iOxy2YRw88g8YnIQ0dgRl8tuMxOoHYsHWf16gNNNn
         n5fVL+4BfjDJB/CC9JUkNA+cbXIbSHaefoWfWlwWwWd7O3yMM6zspsJ8UEB4N5cGgzYY
         5UO7vm/Sh0Cs2exQDWq6hBLfVoLesQtDv1KK6T7d4QvyFOKcmRbSujo11T2Hc5NzmA/o
         9Mdg==
X-Gm-Message-State: AOJu0Yx0UTEfhk7LAsXypr3SbM1y+FiF5WdH6y8o/iH6yIOWUk891Gxs
	AX+K+xcx0HUh8DqxsoJ2MYdY4eaXte5gaVrwTtQ=
X-Google-Smtp-Source: AGHT+IFD9B5hxpePmM/ioNpTGABhgoA/5pqWlP5WyBPQOeQfKTEEYVavfthwNSNiY5aRZYg6hzuZsg==
X-Received: by 2002:a05:600c:3187:b0:40c:2b01:e09e with SMTP id s7-20020a05600c318700b0040c2b01e09emr115216wmp.47.1702051351601;
        Fri, 08 Dec 2023 08:02:31 -0800 (PST)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [OSSTEST PATCH 0/3] Set CONFIG_X86_GENERIC=y for i386 kernel build
Date: Fri,  8 Dec 2023 16:02:23 +0000
Message-Id: <20231208160226.14739-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_X86_GENERIC=y and fixes around arch specific config values.

Thanks,

Anthony PERARD (3):
  create_build_jobs: Set reset pvops_kconfig_overrides
  create_build_jobs: Enable X86_GENERIC for i386 kernel pvops jobs.
  ts-kernel-build: Remove use of $XEN_TARGET_ARCH

 mfi-common      | 12 ++++++++----
 ts-kernel-build | 13 -------------
 2 files changed, 8 insertions(+), 17 deletions(-)

-- 
Anthony PERARD


