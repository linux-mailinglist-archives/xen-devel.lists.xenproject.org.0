Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185498B3339
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 10:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712546.1113284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HEw-0007Vh-H7; Fri, 26 Apr 2024 08:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712546.1113284; Fri, 26 Apr 2024 08:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HEw-0007TE-Du; Fri, 26 Apr 2024 08:47:30 +0000
Received: by outflank-mailman (input) for mailman id 712546;
 Fri, 26 Apr 2024 08:47:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vyS=L7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s0HEu-0007Se-Bs
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 08:47:28 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bded170-03a9-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 10:47:27 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a5883518135so215342966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 01:47:27 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 qu20-20020a170907111400b00a5242ec4573sm10339211ejb.29.2024.04.26.01.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 01:47:25 -0700 (PDT)
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
X-Inumbo-ID: 9bded170-03a9-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714121246; x=1714726046; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/25nhxzEHJfksoETW15xrRM4Bw/CnUu6Ug13d7nLXwo=;
        b=PUIbOxpvwFzwCIb+Ob7P305c/ZpyfMDeGpX/CvoCQeUzgEe3G31SOySTtjJGfC7YG+
         T9eg7YDugF03nizZemef91JtW8eNpu3gRn00AgvoS2JBg5E7ffk+uotr9ndudMZPo4hf
         pZnNOi8lyM5aAWV7vS9Tk7mnwlvF4KikGmZWxcJ6QrIUMdb/Jc65lzNx+EkvWM0xWerT
         Sd91bXQwIhtFUWW/s20xpdf6kYHTVslKqW+5WvRMZy18Kh0maPafeGdi5eGltpQKI8v6
         b/WDx5Y5/pjwtooTMVLAcsgitxAR1NmRneEU5u2/bJq00jyvMpF+EJ5f/HW2sQ2Pj8ey
         2DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714121246; x=1714726046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/25nhxzEHJfksoETW15xrRM4Bw/CnUu6Ug13d7nLXwo=;
        b=M3Uj+DP0Jh8UmsoVOULafKVwXAZxkSi8JEL7pdUjrl6bgwjtgfGB8/oQ8Cbt1n2tVy
         MBAn+2yIOIQlKRpyOVD6sXWf33Yy7tq0sFuzgMkUamH5p+96bVARbx/91vuZMj6KNUIu
         Le4dzc9yVwKWoaN1HuesSdbHuf8ijMgg3zGXrwS9pIZ45XtVvMOpn6tqAWpPeitRH1Ww
         4HK9SaPAudmMWak01fMYcwo/9lJbJIyCq8J+s7/dTI/WHVEmIJzB0FFSxKi0WTs+fGuv
         Y6OpHgY+YDnPMbMXh9oe2DGbZMgJOXXFzkOX8WRZ3icDunNh1Y1FRHNchnBxakLHP1PA
         +hUA==
X-Gm-Message-State: AOJu0YzUnfMdYH1cxseMUcXA45Q02kzJocspbXkh/GVP0vkVFfVgBHw9
	0trZJXJUs9VZ33Wkn/P4nlTZtDbgU0idHJZHnV4q4eM07trM7DEm5lLh0y6kVrg8QUSP/RsGli8
	N
X-Google-Smtp-Source: AGHT+IHN/qEJd3n1Aoi4P/B5xJGpsQ3g5MsDbhRkPMm+C+9KuLx0J9i0lFFv9HW4zrR0eOUGhuvlYQ==
X-Received: by 2002:a17:906:1457:b0:a52:2c0e:2e91 with SMTP id q23-20020a170906145700b00a522c0e2e91mr1389101ejc.17.1714121246168;
        Fri, 26 Apr 2024 01:47:26 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v3 0/5] FF-A notifications
Date: Fri, 26 Apr 2024 10:47:18 +0200
Message-Id: <20240426084723.4149648-1-jens.wiklander@linaro.org>
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
 xen/arch/arm/tee/ffa.c          |  83 +++++--
 xen/arch/arm/tee/ffa_notif.c    | 378 ++++++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_partinfo.c |   9 +-
 xen/arch/arm/tee/ffa_private.h  |  56 ++++-
 xen/arch/arm/tee/ffa_shm.c      |  33 ++-
 xen/include/public/arch-arm.h   |  14 ++
 10 files changed, 551 insertions(+), 55 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_notif.c

-- 
2.34.1


