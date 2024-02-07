Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C2F84CE21
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 16:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677775.1054612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjwh-0003YY-Qb; Wed, 07 Feb 2024 15:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677775.1054612; Wed, 07 Feb 2024 15:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjwh-0003Us-LQ; Wed, 07 Feb 2024 15:34:43 +0000
Received: by outflank-mailman (input) for mailman id 677775;
 Wed, 07 Feb 2024 15:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvxy=JQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rXjwg-0003S2-Dr
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 15:34:42 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67b2935c-c5ce-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 16:34:39 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4100826df08so6601905e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 07:34:39 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b0040fff3382casm3133205wmq.46.2024.02.07.07.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 07:34:37 -0800 (PST)
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
X-Inumbo-ID: 67b2935c-c5ce-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707320078; x=1707924878; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=detjo7ZTC8akO4hEW6pkOY6GaqUpDczVv6k7EJU30NU=;
        b=fknb1yHW5U4Wy3O8vPJbYyHwXdgvV7A03JF8A8Xocy/0/NT/ic1zeXuou4yfSVncdj
         /6IbyqSXntwKlWMCMPgxDCCChTCi+yv66NzU3ysyvexSCAPqLNKu0e7WWj3ySJ49jkf0
         3JEoCtxMhWrpPm02JefchJFOvoG42EEzVVoFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707320078; x=1707924878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=detjo7ZTC8akO4hEW6pkOY6GaqUpDczVv6k7EJU30NU=;
        b=OpolSybWOozv/WlsDS7R2uHsBJiKsxWky43RtMhmsAqhyxizNIff6nQQkXjvTr7jBC
         /uFswGdRkyMPDOr8AlXYKT0YgASUq6S59ubinLAvYm/9kq0tZ4d+qHF/lcGLGMmMPeZa
         +9mMAaOoMaWY3VwMXM9mcr4adIHXpqPSVQQvOGmscGi2PSpV9sI+hviSvkvBztOvDuVn
         Q1UShU0+l34D2J/FmO89qBTKyeG1ePc2A1pwS7WYNo0R5V8oKMnHk+LHMODAeUkxizin
         3wMVkV/3Frv/WnBBRFdaQl/vo9txNs8Rw0vM4+R8UwGtu47j+JUcLeup64JFwNaLSlOt
         CR1Q==
X-Gm-Message-State: AOJu0YxHaDmIHkWExKr83YqSkGhK1yOzN4s8DOK2d3m495PKt+YcvaI8
	Ka9APwgiBrxNQAR/7tnJIeReAukCbPicBJJG47dFBFdA7AJYhiRVnT21gtEzzHsG1BB/KHhErw0
	4
X-Google-Smtp-Source: AGHT+IFVxC1HURX8b6Oyh/DOXByDQtdMY0M/niJq82QLF8VQbD9LMQbnN9Wp+hyo5CyRtZyvTBgaYA==
X-Received: by 2002:a05:600c:4f55:b0:40f:e60f:438e with SMTP id m21-20020a05600c4f5500b0040fe60f438emr4281209wmq.8.1707320078204;
        Wed, 07 Feb 2024 07:34:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZ+qDkw8kp5fzF1nAmb9isBPfRk8QVpvEfPGT4TvTbMB6PBD5sKwRfskL73dx5q9TmRydqvOCgJtQXZK3S91xzIQ4/HirkO1gmpB/PINcLM5Zq8hwjPe6gqZsnH+D1YgaGRLupYC2Say6I+ZOob6R6qPKs12aoqKXVmEc2PLiOAK4jdPZc9LxfvKfFxg==
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 0/2] iommu/x86: unify RMRR/IVMD range checks
Date: Wed,  7 Feb 2024 16:34:15 +0100
Message-ID: <20240207153417.89975-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following patches unify the check for the RMRR/IVMD ranges in a
common function, using the IVMD as the basis.

Thanks, Roger.

Roger Pau Monne (2):
  iommu/x86: introduce a generic IVMD/RMRR range validity helper
  iommu/vt-d: switch to common RMRR checker

 xen/arch/x86/include/asm/iommu.h         |  3 ++
 xen/drivers/passthrough/amd/iommu_acpi.c | 38 ++------------------
 xen/drivers/passthrough/vtd/dmar.c       | 14 ++------
 xen/drivers/passthrough/x86/iommu.c      | 46 ++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 46 deletions(-)

-- 
2.43.0


