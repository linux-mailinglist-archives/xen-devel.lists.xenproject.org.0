Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72C8A149B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 14:28:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703892.1099828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rutXm-0005yN-Mv; Thu, 11 Apr 2024 12:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703892.1099828; Thu, 11 Apr 2024 12:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rutXm-0005wf-KH; Thu, 11 Apr 2024 12:28:42 +0000
Received: by outflank-mailman (input) for mailman id 703892;
 Thu, 11 Apr 2024 12:28:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVMu=LQ=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1rutXl-0005wZ-9Y
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 12:28:41 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 068b0330-f7ff-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 14:28:39 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d718ee7344so88866871fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 05:28:39 -0700 (PDT)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c1c8900b00416c1e7c9e7sm2212992wms.2.2024.04.11.05.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 05:28:38 -0700 (PDT)
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
X-Inumbo-ID: 068b0330-f7ff-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712838518; x=1713443318; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DtSlWc4YPgAHctv5Zc3I7c4OsaLOaeAxuTgKwqXnQis=;
        b=IXjPfdg+pvh2drm0fEeSOxdNPcAlKITbDv0S402E9UD+J8nQbR/1bvOV7NZAFrEGFP
         vkLZOxirhsYeiniOhm+HWaTzZM3sZcvRSag5SaMbqWClkHiKbL+XeT2hUGxcNo/X66h3
         MJX3+jUXBD7FTCLqCsNtmFGU+OR0+jt6lxol8XPn1pw6EqHdpfvDlvVJBcVj3uH6mETD
         HMJW4SncJ6RFBYcK3nQyDTYbF5lm+TQzfIrPw54EA0eS4BjOnJNfN/hzxSiZLv6gSbp0
         v0p0Z6/CdMlHwdP4uj9bewLQBesUzWwtPjQbKURZMljBPR4j2egyB83H5lKXtXvhhVhI
         9zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712838518; x=1713443318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtSlWc4YPgAHctv5Zc3I7c4OsaLOaeAxuTgKwqXnQis=;
        b=X38T+027LtdtJKt/lk1v1NqgVjoCxMBye/Ejn/PEUGPuPvEtSUL3XXPb/To7lawfiP
         gVwcnjb68iy/WzaTpFaG+Wdbc+yJHZODslt22zEkihwCEKnd0PZ01vJD7m+PzaGy+KxU
         I8NdC9MJW843qPDEB3uy0e3svREzOH8+ErgovuZ2qnAXug/QInMvjkTOmsm0UYwsWfI/
         VeGPDNvprwOC7+aJuF5cZURmO1bGCrhM00LhDxsdNCFOK5YqLKv/ThZrajGub5MN2EDZ
         KPXoHKljcJcpFu75t3Upt1KO61ZPTLvjO46ftgKgtMuL3lHbc46MLWvIao6T72U25Agz
         KX8w==
X-Gm-Message-State: AOJu0YzbJY+qPlKjIIwhD1mSbEeGrOrsiX4Kfe+nTReGSeuXvbcSoMvr
	LTIiSNOT0Ahm9fib8AkLpFWqbBlCHOjNVEAXN1m26LdmwHB0xJU59joNSYkk4ENcHqJkmfHJT90
	4
X-Google-Smtp-Source: AGHT+IGT4BNptKwvGQZV4Og03HxlDUxJWtzKiynJcsRF4Qp9X8e8moSubPMoYd4lgcnAqxSGM+3wuA==
X-Received: by 2002:a05:651c:11d3:b0:2d8:5b4e:bdd8 with SMTP id z19-20020a05651c11d300b002d85b4ebdd8mr4179032ljo.39.1712838518614;
        Thu, 11 Apr 2024 05:28:38 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v2 0/2] convert LIBXL_DEVICE_MODEL_START_TIMEOUT to env var
Date: Thu, 11 Apr 2024 15:28:18 +0300
Message-ID: <cover.1712837961.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

This patch series proposes converting the compile-time define 
LIBXL_DEVICE_MODEL_START_TIMEOUT value to an optionally overridden by 
environment variable value, just like the current behavior for 
LIBXL_BOOTLOADER_TIMEOUT is.

v1 -> v2 changes:
 - version 1 had no a/ b/ prefixes in patches due to old git version, no 
   other changes 

Manos Pitsidianakis (2):
  libs/light: add device model start timeout env var
  libs/light: expand device model start timeout use

 docs/man/xl.1.pod.in                 | 11 +++++++++++
 tools/libs/light/libxl_9pfs.c        |  2 +-
 tools/libs/light/libxl_device.c      |  2 +-
 tools/libs/light/libxl_dm.c          | 10 +++++-----
 tools/libs/light/libxl_dom_suspend.c |  2 +-
 tools/libs/light/libxl_domain.c      |  5 +++--
 tools/libs/light/libxl_internal.h    |  6 ++++++
 tools/libs/light/libxl_pci.c         | 10 +++++-----
 tools/libs/light/libxl_usb.c         |  8 ++++----
 9 files changed, 37 insertions(+), 19 deletions(-)


base-commit: f48299cad5c3c69fdc2c101517a6dab9c9827ea5
-- 
γαῖα πυρί μιχθήτω


