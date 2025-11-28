Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D66C93192
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 21:20:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175120.1500023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP4wV-0003V5-FW; Fri, 28 Nov 2025 20:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175120.1500023; Fri, 28 Nov 2025 20:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP4wV-0003SM-Ca; Fri, 28 Nov 2025 20:19:47 +0000
Received: by outflank-mailman (input) for mailman id 1175120;
 Fri, 28 Nov 2025 20:19:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vP4wT-0003SE-Vt
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 20:19:46 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 933f3976-cc97-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 21:19:43 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47755de027eso14549235e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 12:19:43 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479052ec685sm98201245e9.6.2025.11.28.12.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 12:19:40 -0800 (PST)
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
X-Inumbo-ID: 933f3976-cc97-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764361182; x=1764965982; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eF0IQHvCbUG95tfvSynD4m5eKTVMpMt3/k5vERrA/3U=;
        b=qoo37qZ5susNbMGKw4PW4SHj2AWu1pvfWQRf4e6h7RCZofwcCASF4jKcU/36TVg616
         TVi2GDwyoeEaVK9h1x/KrOP5/GhRkteeXVrBiRej9apOtUsCPFsz9j7zkzyyeOOCzr5g
         9n6JuTbpXNf8jasL3NSwGhxxxxfltXA70k0ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361182; x=1764965982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eF0IQHvCbUG95tfvSynD4m5eKTVMpMt3/k5vERrA/3U=;
        b=lbF5+p6BB5DrYsyvs4aihrwoKKPRoRQtcSjiiLjsq3AyUvS5rkL9B3l8/TikZCnjcA
         oksxdFzzwSoWpQRU4e+KYHZzzLcdpOLrJGgM/zRU0hzDNHn+XUI2S4I7GJ1Gw+yiVjfG
         /KQF1KmnGnihxywtIv4vfia7+43qihRnnwYPD2W/KOGdOBG3DdSeUxSMvJiuavSusOyD
         WHyiG6G+JRjsEt1ihc8wF3MKt8mNEo5zedpwx998Oz/lG58f10gcyxCaiXXiDtiW0jnj
         iRnwv42BsXdLMwOBnkmvkizgZqyfLIdUlL2MgejP8jgHyLrc0WOhRoXJh31TIN2KPxt0
         Xz1g==
X-Gm-Message-State: AOJu0YzrYiyN7YF2cDktEBM46DXuEPKX1JpFaaRWzxhm4iVrILc75E0p
	qinnIShAkf3IkL4qwCNYvKoLWls+ulxkYJBEXHAzKl05T9t7ZndhIXGqVxztKvHByv6rvzFka+4
	+z5xe
X-Gm-Gg: ASbGncsARCJt9iA9IvvFLcOm0fdjsyFz9hNRsBzLEw45iQBD3LmdqrsQPEYvlkygs6V
	S21PDQlfxW+WkSDsV7h3QIMm7/8ePQUB7WpKkLjoO/r9brIAc+UtSJJVFywckrQxFgMwSsB5xfi
	qH3NCisshOrjqiSQ1alg58DkQOJ7JRSEV14FkKONGhBi7rUff0Hjiq7LlmMPqt6R9d5gZNMXhNA
	SvQimYtK8dX9oxFYkgxYIRuyO7GPPSYVbp4FrXPD53iwTrpkrgeRGwXx2JVhyjo7VfyvfyetRDD
	GMy3lFIt0oZMDriR1N01fqNqbMCbkb5d9iFvafSdlbNVj1njg0tOvHehf1PQf0DpBGLN7RokaLd
	NF9Sdxrya/ZFDgESnd7+ngfJqIBTesXJyqF4iu8rj2Rhtrx0uvoNfMdyAhJfLVJREY6dNjtcx4o
	hoXs1wqiZDpR1clt0yQr2MHUyh8WfWfoZudzcIlUDS8CyFTswUS9KZtIQYfCc2mUKY6lNmNf7z
X-Google-Smtp-Source: AGHT+IF3xMWvq4UNJBI9e9ke37QtqMMGOOWL2q4zFqXXh9H5PbkTt58lKSkSdnlOqxb45P3ZuTjp+g==
X-Received: by 2002:a05:600c:1c87:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-47904acef12mr190158515e9.3.1764361182397;
        Fri, 28 Nov 2025 12:19:42 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] x86/svm: Make various details private
Date: Fri, 28 Nov 2025 20:19:34 +0000
Message-Id: <20251128201937.1294742-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Lots of this does not need to be included into all translation units.

Andrew Cooper (3):
  x86/svm: Make vmcb_struct private to svm/
  x86/svm: Drop svmdebug.c
  x86/svm: Drop svmdebug.h

 xen/arch/x86/hvm/svm/Makefile               |   1 -
 xen/arch/x86/hvm/svm/asid.c                 |   1 +
 xen/arch/x86/hvm/svm/emulate.c              |   1 +
 xen/arch/x86/hvm/svm/intr.c                 |   1 +
 xen/arch/x86/hvm/svm/nestedsvm.c            |   2 +-
 xen/arch/x86/hvm/svm/svm.c                  |   2 +-
 xen/arch/x86/hvm/svm/svm.h                  |  17 +
 xen/arch/x86/hvm/svm/svmdebug.c             | 179 ------
 xen/arch/x86/hvm/svm/vmcb.c                 | 163 ++++-
 xen/arch/x86/hvm/svm/vmcb.h                 | 620 +++++++++++++++++++
 xen/arch/x86/include/asm/hvm/svm/svmdebug.h |  19 -
 xen/arch/x86/include/asm/hvm/svm/vmcb.h     | 621 --------------------
 12 files changed, 804 insertions(+), 823 deletions(-)
 delete mode 100644 xen/arch/x86/hvm/svm/svmdebug.c
 create mode 100644 xen/arch/x86/hvm/svm/vmcb.h
 delete mode 100644 xen/arch/x86/include/asm/hvm/svm/svmdebug.h


base-commit: 486c7f79c0032cbd210af8f3f1d204f8eabfdbde
-- 
2.39.5


