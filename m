Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C068AC5AD
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 09:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709713.1108689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryoEt-0006VK-KY; Mon, 22 Apr 2024 07:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709713.1108689; Mon, 22 Apr 2024 07:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryoEt-0006Sh-HE; Mon, 22 Apr 2024 07:37:23 +0000
Received: by outflank-mailman (input) for mailman id 709713;
 Mon, 22 Apr 2024 07:37:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALvU=L3=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ryoEs-0006Sb-AB
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 07:37:22 +0000
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [2607:f8b0:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 263fb170-007b-11ef-8b06-e9908f64f69c;
 Mon, 22 Apr 2024 09:37:20 +0200 (CEST)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5ce6b5e3c4eso2227198a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 00:37:20 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 x37-20020a056a000be500b006edcceffcb0sm7221726pfu.161.2024.04.22.00.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 00:37:17 -0700 (PDT)
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
X-Inumbo-ID: 263fb170-007b-11ef-8b06-e9908f64f69c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713771438; x=1714376238; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AHko8xm993dsl3n+OZtqOwdwQNhe1crxMdvB1ksUl5w=;
        b=l6yNIvuEgxLSArHoI2t8a+mISAJr7Pm9MiDa9ES/WbLQiErYPp0QgUCDQpveFGAYnZ
         qBtvzw8ElTWH4lZTwWE2ZdYAXBPEHaRgwGsYrht1ldhQ6gg+kSS6J79hn538+ylhpqK9
         L6k24BFiUQ1BNaBfrO1VI+Z39tbROqZKANMX/7QpH8W9dBYtNMhKeqftyixPm1PvJaAV
         9HJItJ1H6nOQnIuGUIMnwPEluf/jGQLv4yQo9xUzg2M63wBtvR4PS4NJDDNWe98/r7N4
         Ng1JsNWxM6T9OpFVkxp2McKpDmDo1HuSK32hjL/7JXH9hT05DqcseaOibawvsX+VDv4+
         S4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713771438; x=1714376238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AHko8xm993dsl3n+OZtqOwdwQNhe1crxMdvB1ksUl5w=;
        b=HpxGlAONAmkyn/K/xC8nzEpf6egKDZGH+llKcLZpiU4HFonOrHH1yrqB3ZMOZ0wugL
         W7GtIYVdRVu7PYwCVZx+UKbgV9nKIzYmB0tCOgVFtLSveQoY68sP50dZjN30Zps6TmGC
         4PmtsIk80JhNp638y0UF2v2qq8DcnK/IpLGFZLxR6wGJJ+YBB/rYssphaPkDqpQ3pSn7
         l8By3b1I414XZN1vdDYLrVzu87Jr6JZdEvywJtYUojx2bVCMG8SUpWSqXgwvt3qfEnmp
         aZaLOazxN/TvYY2DKQCcQx9+EWO+dLY4kNHUN+MUpINIMuGoDZ8oiuHBpFMARJXO+7u6
         Adsw==
X-Gm-Message-State: AOJu0Yyf2VYiFpPO+HeR18Ta6BTowa+47+jUmMuI6HsCgCHMOAJk9VrZ
	NPsbA91NRtU7C0scdjW91mDOB5htxpPrI0tYmj1iCfu4ZEZhy8zWNMRMHv1Weu581z6fDckEt4B
	F
X-Google-Smtp-Source: AGHT+IFBmZRazD0/mE0UROobbVkZ2EiTAEz0/o01f5RCsrEtPAOzCnkdtt9NjZdmaBU9QkkOkJcr0Q==
X-Received: by 2002:a05:6a20:3d94:b0:1a3:52ef:cc84 with SMTP id s20-20020a056a203d9400b001a352efcc84mr9439968pzi.60.1713771438353;
        Mon, 22 Apr 2024 00:37:18 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v2 0/5] FF-A notifications
Date: Mon, 22 Apr 2024 09:37:03 +0200
Message-Id: <20240422073708.3663529-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch set adds support for FF-A notifications. We only support
global notifications, per vCPU notifications remain unsupported.

The first three patches are further cleanup and can be merged before the
rest if desired.

A physical SGI is used to make Xen aware of pending FF-A notifications. The
physical SGI is selected by the SPMC in the secure world. Since it must not
already be used by Xen the SPMC is in practice forced to donate one of the
secure SGIs, but that's normally not a problem. The SGI handling in Xen is
updated to support registration of handlers for SGIs that aren't statically
assigned, that is, SGI IDs above GIC_SGI_MAX.

Thanks,
Jens

v1->v2:
- "xen/arm: ffa: support notification" and
  "xen/arm: allow dynamically assigned SGI handlers" updated as requestsed,
  details in each patch.
- Added Bertrands R-B for "xen/arm: ffa: refactor ffa_handle_call()",
  "xen/arm: ffa: use ACCESS_ONCE()", and
  "xen/arm: ffa: simplify ffa_handle_mem_share()"

Jens Wiklander (5):
  xen/arm: ffa: refactor ffa_handle_call()
  xen/arm: ffa: use ACCESS_ONCE()
  xen/arm: ffa: simplify ffa_handle_mem_share()
  xen/arm: allow dynamically assigned SGI handlers
  xen/arm: ffa: support notification

 xen/arch/arm/gic.c              |   5 +-
 xen/arch/arm/irq.c              |   7 +-
 xen/arch/arm/tee/Makefile       |   1 +
 xen/arch/arm/tee/ffa.c          |  83 +++++---
 xen/arch/arm/tee/ffa_notif.c    | 331 ++++++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_partinfo.c |   9 +-
 xen/arch/arm/tee/ffa_private.h  |  68 ++++++-
 xen/arch/arm/tee/ffa_shm.c      |  33 ++--
 8 files changed, 488 insertions(+), 49 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_notif.c

-- 
2.34.1


