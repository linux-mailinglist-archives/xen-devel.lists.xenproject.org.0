Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD17A3C56A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 17:49:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893246.1302187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tknFk-0000or-DH; Wed, 19 Feb 2025 16:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893246.1302187; Wed, 19 Feb 2025 16:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tknFk-0000j9-92; Wed, 19 Feb 2025 16:48:52 +0000
Received: by outflank-mailman (input) for mailman id 893246;
 Wed, 19 Feb 2025 16:48:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQLC=VK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tknFi-0000PL-VL
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 16:48:50 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6256876d-eee1-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 17:48:45 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-abbd96bef64so3208266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 08:48:45 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbdcac38ccsm133806766b.29.2025.02.19.08.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 08:48:44 -0800 (PST)
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
X-Inumbo-ID: 6256876d-eee1-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739983725; x=1740588525; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iMgAB7uCVvP4TAbCLv96tJibBLT2WEV/pyHC/Z0f5eY=;
        b=GngSDCg+J8bNuMAwEvZ2i4uChGYgwXm+0sjgDFPl75ZUTEcMWPcDccwhiKkwkYC08M
         7t8U7bJ2DJpRv93/OyXdEuPIvK7L2ojAR0tOn5OHi/UQzMX6BV9IsBnpIEMs5gNWV3Sx
         OThcPXBJj3pdXrMHDeYBWrqh6Pm4aJaBydVSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739983725; x=1740588525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMgAB7uCVvP4TAbCLv96tJibBLT2WEV/pyHC/Z0f5eY=;
        b=rMdXECfu3f8sdADiBch16efb7wAc6tudqWES7oZIx5fDB7ZyOFcvpr5NxzPCIMklJZ
         ndJAWhdmTTEtpLlDIGqJQq6kX8H7GTSaSnMN+B6xYcWrR0OgiRSoIeuurI7S0XchHF+q
         yUUy01J/g3S9ZPbEnB7aSvIjplSzDSKfvUJSZB7EXLTZ9rXGj1B2LjYpMphUgReWOlzK
         P9JydueDWQC/Hfz74QHcRgUglk+frTYn+uwZOdNRZ122NgO2OkaJOOUfN03yAp2ltCa1
         lSIWWkXGkolDZhqFhp1ZUwW4xLAoMqGLjtfAMWPfx9IygU3soteD6VQsH7Op9nAULqul
         piGQ==
X-Gm-Message-State: AOJu0YxUqCxEbkPuEILXhzFIXPLcvxtzC1ucJIf3btv7Y0Z62A+nPPng
	4NisO3ugsHtIVAAp8a66roDTM/SkyDmZgwEBhY0ggZeGV/BPEQUadcpV198dF4wxazQFiXC1fKl
	F
X-Gm-Gg: ASbGnctuI0DVYzrzCh9ifZmvPff3aPVnJZhX3MZJ/M4kim2t/1dDGa/2QmxxJBdeWD+
	NLkQjuAkBexr33TGS5QMTalUbIVzvVprtEow+c0nOtr6z9rh/7P4RKMs45K69auksx9l38PXXmG
	M4CyHFBFLTUoiuCBE3FfbaTyVJHG1USpHNabAQltoCVnr/W/zjiRBIM2gpVlMgji1Yd19K8MNle
	bqx0xhDeIenpJf+ciIXoukTvO56BKCFreYteGU/vnreWv5GlnRq15G7uZFvzrkPKENbrxSgIemt
	oXnDuTyB0mmT4rpKffC5gUCJwQ==
X-Google-Smtp-Source: AGHT+IENa+fJsxp6fy8OIvt0B4rzANmKLw50X7eyh7tOIAz7Zql0bmL2zrFEq8XrRZk6SqRu5v6XGQ==
X-Received: by 2002:a17:906:6a03:b0:ab7:b41d:bdb5 with SMTP id a640c23a62f3a-abb7115d691mr2005861066b.45.1739983724942;
        Wed, 19 Feb 2025 08:48:44 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 0/3] x86/dom0: be less restrictive with the Interrupt Address Range
Date: Wed, 19 Feb 2025 17:48:37 +0100
Message-ID: <20250219164840.94803-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

First two patches are preparatory changes to reduce the changes required
in patch 3.  I would have wanted those to go in 4.20 to fix the issues
on Lenovo Thinkpads, but it's too late now.

Thanks, Roger.

Roger Pau Monne (3):
  x86/dom0: correctly set the maximum ->iomem_caps bound for PVH
  x86/iommu: account for IOMEM caps when populating dom0 IOMMU
    page-tables
  x86/dom0: be less restrictive with the Interrupt Address Range

 xen/arch/x86/dom0_build.c           | 24 ++++++++---
 xen/arch/x86/hvm/dom0_build.c       | 14 +++---
 xen/arch/x86/hvm/io.c               |  6 +--
 xen/arch/x86/include/asm/hvm/io.h   |  4 +-
 xen/drivers/passthrough/x86/iommu.c | 67 ++++++++++++-----------------
 5 files changed, 57 insertions(+), 58 deletions(-)

-- 
2.46.0


