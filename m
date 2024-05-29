Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8B58D2E15
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:26:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731495.1137019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDhH-0003TJ-CX; Wed, 29 May 2024 07:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731495.1137019; Wed, 29 May 2024 07:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDhH-0003Qm-9v; Wed, 29 May 2024 07:26:07 +0000
Received: by outflank-mailman (input) for mailman id 731495;
 Wed, 29 May 2024 07:26:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+wO=NA=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sCDhG-0003Qb-NB
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:26:06 +0000
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [2a00:1450:4864:20::143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4688c57-1d8c-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 09:26:03 +0200 (CEST)
Received: by mail-lf1-x143.google.com with SMTP id
 2adb3069b0e04-52b59f77670so93489e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:26:03 -0700 (PDT)
Received: from localhost.localdomain ([2001:2043:5e37:9d00:b09:3200:dd72:cfc8])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296ee4a58fsm1182353e87.67.2024.05.29.00.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 00:26:01 -0700 (PDT)
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
X-Inumbo-ID: b4688c57-1d8c-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716967562; x=1717572362; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKvf3N3QBgrkKCjztY5Opirx663UEubBXrA8grWK3w4=;
        b=H5pjecPHkJJncxtn44SfS3b8pu2XVQUaJTMQdLm+PaWgqTFPmFzdDZPslVOLczuF0o
         nPRxjQO90Zy+CvEEfb6PEiuvHlbMR+BIuejD8mr1IjZuy0/drIjtyozMcrBEAaJ28s4/
         Z34nfvRH1ne8Z+vGjr0UdGzxmUt/0g/0AXjRlLSXaeZS1823byI5mdI4SiH8rvz8ztMI
         jqcsuZPMvHleRe8mz3P5z8wGXkNhl41HqtIw8ks/fChDiDhaN63AxxWr3uc5a99F7saj
         V0nODXY9b8VCQDoffClyp35+73zzYOsKvDSWccUPKOD/wHSWHW5WBDVuBRVyaXbBloP4
         qthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716967562; x=1717572362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKvf3N3QBgrkKCjztY5Opirx663UEubBXrA8grWK3w4=;
        b=r2ImCGG9j5cx2gNKFSqCXEU0SWMKQSmdf8cY+oE+R75zmnax0peaQmNzAzgwm7UQCv
         gzciTEq7bs2qY+JqMSZ3/AnOrE5QxQFFZ6LTCVw93+wDNVVyW1a33C13bRXeEIfMHyDL
         wHhxCGt6CN+PvKCKMInuCzeaVCtSJEh70WsYGC+NEyVRgizlhwJxYAiu5Kxfi6LR8QWa
         jpbIyyJUAX2brGXttB7fc6+NksEbetGIzBAXstCjgO0etBy/ghV4DpeK45U01cqqJ7Hr
         m+SwNGi9iMXC9KW0w6N10psTku5zhHizm2R7CJfdhmyWoC8GivynTdUOZ6DOVwxpkTAo
         /DCg==
X-Gm-Message-State: AOJu0Yw8IQxfRItkqhlx0GS9M1vsSdMZCvi3c5tX41XgAmfbeQc/RFFe
	WLicoq7lFbTVduU0pZ7or76LrZAA4Xzc3SWyqLVBFG1yGY5EjviT7D1ZS9Eofp99QxbWosUII2W
	2An/ueQ==
X-Google-Smtp-Source: AGHT+IFKGaop/h2JULMJhTxHRPmMIMatDi4tGed43Uqer6JxWZ74iEewDYiJAxCXeinh3W4WsR/1Dg==
X-Received: by 2002:a05:6512:33d6:b0:51f:4c53:8e4b with SMTP id 2adb3069b0e04-52965c3109emr16550651e87.38.1716967561738;
        Wed, 29 May 2024 00:26:01 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v5 0/7] FF-A notifications
Date: Wed, 29 May 2024 09:25:52 +0200
Message-Id: <20240529072559.2486986-1-jens.wiklander@linaro.org>
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

The patch "xen/arm: add and call init_tee_interrupt()" provides a hook for
register the needed per-cpu interrupt handler in "xen/arm: ffa: support
notification".

The patch "xen/arm: add and call tee_free_domain_ctx()" provides a hook for
later freeing of the TEE context. This hook is used in "xen/arm: ffa:
support notification" and avoids the problem with TEE context being freed
while we need to access it when handling a Schedule Receiver interrupt. It
was suggested as an alternative in [1] that the TEE context could be freed
from complete_domain_destroy().

[1] https://lore.kernel.org/all/CAHUa44H4YpoxYT7e6WNH5XJFpitZQjqP9Ng4SmTy4eWhyN+F+w@mail.gmail.com/

Thanks,
Jens

v4->v5:
- Added two new patches "xen/arm: add and call init_tee_interrupt()" and
  "xen/arm: add and call tee_free_domain_ctx()"
- Updated "xen/arm: ffa: support notification", details in the patch

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

Jens Wiklander (7):
  xen/arm: ffa: refactor ffa_handle_call()
  xen/arm: ffa: use ACCESS_ONCE()
  xen/arm: ffa: simplify ffa_handle_mem_share()
  xen/arm: allow dynamically assigned SGI handlers
  xen/arm: add and call init_tee_interrupt()
  xen/arm: add and call tee_free_domain_ctx()
  xen/arm: ffa: support notification

 xen/arch/arm/domain.c              |   1 +
 xen/arch/arm/gic.c                 |  12 +-
 xen/arch/arm/include/asm/gic.h     |   2 +-
 xen/arch/arm/include/asm/tee/tee.h |  14 +
 xen/arch/arm/irq.c                 |  18 +-
 xen/arch/arm/smpboot.c             |   2 +
 xen/arch/arm/tee/Makefile          |   1 +
 xen/arch/arm/tee/ffa.c             | 100 +++++--
 xen/arch/arm/tee/ffa_notif.c       | 409 +++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_partinfo.c    |   9 +-
 xen/arch/arm/tee/ffa_private.h     |  56 +++-
 xen/arch/arm/tee/ffa_shm.c         |  33 +--
 xen/arch/arm/tee/tee.c             |  14 +-
 xen/include/public/arch-arm.h      |  14 +
 14 files changed, 622 insertions(+), 63 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_notif.c

-- 
2.34.1


