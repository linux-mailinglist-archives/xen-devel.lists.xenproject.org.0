Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1048B9CF0
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 16:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715877.1117844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Xrg-0007wG-OA; Thu, 02 May 2024 14:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715877.1117844; Thu, 02 May 2024 14:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Xrg-0007uk-KL; Thu, 02 May 2024 14:56:52 +0000
Received: by outflank-mailman (input) for mailman id 715877;
 Thu, 02 May 2024 14:56:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZceG=MF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s2Xrf-0007uZ-6r
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 14:56:51 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3490b1b8-0894-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 16:56:50 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-572ba002a6bso952131a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 07:56:50 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 i15-20020a0564020f0f00b005726dceb2easm621919eda.20.2024.05.02.07.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 07:56:48 -0700 (PDT)
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
X-Inumbo-ID: 3490b1b8-0894-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714661809; x=1715266609; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1AqukxMMW4ychAZU18Fl1hEbPBi09j+hpTr9oqZL2s=;
        b=NNnH/ceu2M/Nh51anVDsgYkN9u1y6n/B64frP7ESaJwrxr51gU+DAefo9u+qVyKSSQ
         XDpfrdt99DffdC6Vwe80jClaTNIoo2PLh4Uw2KQNJk3Ve+lV3hBXaQso6H3dEPRKzeg8
         soZJwn/dZzsEbG+XY4bPxCTrn8QT2UMz0S6/2jjqJ0qMyQu6LYx034EcTYrgEOKEIozW
         UYKfVoAklib/sTX1myJ4bRXEJsruYGSuqs5g8jKrBiSV2tI3eLzOgtaqIFGFtoNGaRuU
         VDEFMdDFoDnppNBujnFDugfJWUYjweo8/xrq4Zy8Lx5jGJuCyaQHr3AFLq8vvAl+WWk9
         oWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714661809; x=1715266609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1AqukxMMW4ychAZU18Fl1hEbPBi09j+hpTr9oqZL2s=;
        b=B9LCT8iVn1mxicOkyWX290vnn78DH71shWUamiAqm26Tc+9KbXMtPb7VXXTk9hgLEc
         8bB3SPY5BzxbDCPztJahmSJnabdP4kvmDz0C49ZviKnXyl6t7jOh4FLXREl6+26pqmCu
         11SDDoMTZFbROARvZ/CBVHS8jPAXRjTv2AZe+s89ST9ULXAEM/QkZBh40kvNnrqu/nSC
         dgpt746KKNAwx8PhPK9Lz60tFrWYcBm/ldUvnc/QN4rzv1HJN1Oy98iiCO/0soVjQJ+2
         rnVZz6zf31UmslRsR4NLDWOvwdMu5BiCHqT4aH3iVz0W12xQ312k5Cu+5AwtrIW9VNr7
         1Q4Q==
X-Gm-Message-State: AOJu0Yzj5LcGHET6ne4gJGt0MnOX2k6b/vzAKPgUaSGmioURY2Eemf79
	apQe3Rkp9aWaKq3nXVxgFryFbev52keq9wAJVVBDGAVSutyZgHBjLkAbdaXJgSzMCgviJMEjReV
	X
X-Google-Smtp-Source: AGHT+IEGkYk9wI3zGIWbX2B9WIhp+uE9Mrl+WFz62FiMAOQ4blxFiLDBTE95rpIxVdIv464c3+ILBg==
X-Received: by 2002:a50:c355:0:b0:570:1ddc:5e4f with SMTP id q21-20020a50c355000000b005701ddc5e4fmr3528187edb.8.1714661809293;
        Thu, 02 May 2024 07:56:49 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v4 0/5] FF-A notifications
Date: Thu,  2 May 2024 16:56:40 +0200
Message-Id: <20240502145645.1201613-1-jens.wiklander@linaro.org>
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

Two items stand out in the last patch, "xen/arm: ffa: support notification":
- The interrupt handler must be registered for each online CPU, but this
  will usually happen for the secondary CPUs after FF-A has been initialized
  so we may need to take some further action in the error path
- The interrupt handler need to get hold of the domain struct of a guest as
  indicated by the SPMC. In this patch set we use
  rcu_lock_live_remote_domain_by_id() to get a safe reference to the domain
  struct.

Thanks,
Jens

v3->v4:
- "xen/arm: ffa: support notification" and
  "xen/arm: allow dynamically assigned SGI handlers" updated as requestsed,
  details in each patch.

v2->v3:
- "xen/arm: ffa: support notification" and
  "xen/arm: allow dynamically assigned SGI handlers" updated as requestsed,
  details in each patch.

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

 xen/arch/arm/gic.c              |  12 +-
 xen/arch/arm/include/asm/gic.h  |   2 +-
 xen/arch/arm/irq.c              |  18 +-
 xen/arch/arm/tee/Makefile       |   1 +
 xen/arch/arm/tee/ffa.c          | 108 +++++---
 xen/arch/arm/tee/ffa_notif.c    | 453 ++++++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_partinfo.c |   9 +-
 xen/arch/arm/tee/ffa_private.h  |  60 ++++-
 xen/arch/arm/tee/ffa_shm.c      |  33 +--
 xen/include/public/arch-arm.h   |  14 +
 10 files changed, 647 insertions(+), 63 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_notif.c

-- 
2.34.1


