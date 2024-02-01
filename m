Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A5C845E0A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 18:02:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674565.1049612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaS8-000758-5i; Thu, 01 Feb 2024 17:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674565.1049612; Thu, 01 Feb 2024 17:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaS8-00073E-2E; Thu, 01 Feb 2024 17:02:16 +0000
Received: by outflank-mailman (input) for mailman id 674565;
 Thu, 01 Feb 2024 17:02:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cAD+=JK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rVaS5-0006n8-UR
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 17:02:13 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5210a0e-c123-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 18:02:13 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-558f523c072so1708116a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 09:02:13 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 o11-20020a056402444b00b0055d3d1653b3sm6617362edb.31.2024.02.01.09.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 09:02:12 -0800 (PST)
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
X-Inumbo-ID: a5210a0e-c123-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706806932; x=1707411732; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz8hnYroCYqHv9y7dmqbQbjNnQAdCfNne5v071bTWRE=;
        b=L7qau/I88cftDBnfnPoIVFPpEfVzHfPyGzFntfcQNEdf70FfYlbSUEz8zBckuJVCbk
         gItcX53QfiKGUrpA4qRjiUPddySOzmFtvFypek/Ct8X4xuVdxpy9Ol0PGbKXy3sSTIr2
         dUPXb4WIhm8pegJCw9Wt0qeYl7idr1Te+jj74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706806932; x=1707411732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wz8hnYroCYqHv9y7dmqbQbjNnQAdCfNne5v071bTWRE=;
        b=UTQY1fBtdqB8jiScLoLLt/A1E02nxx5a13pkf+pOhH0YmdV6VDnh/etZR2oID395S3
         FnSPesFlDGQ6sR+fzd4u6puM28wNjGNBNmUQephyVaOCKRJK9ojdFPoSE3KybXEt2wUD
         fiXC89AvVXq8jbw9p/2kirDJ1RE7BrJzwvv9skGmXvhOYMo6R1E+uhakWgDwh1V3vBpO
         V0a3yYvltdN2S6ccGprz9/SnWwAj1N51bzdZUOfLz5rL1GiCwHKoWjXGNQT0+lUcGvkr
         BkOoZ4yrILvW2unRhsrbrlM16jVSdzDPizcbgNuDQYwTt0iabYDoFe3/VpfHQ1/9ZIAn
         zPBg==
X-Gm-Message-State: AOJu0YyuVM0fuvr60th+E4PwoyZT8ZJLDDmb0kraTPs9bapF6lmNKIWj
	K6aJcyPvvK3UHLXcjvlfdxmvTDG9esw4elv69roTyUjwHrw3mK1cIzJ9f3R7buWlFoeBZ6+bAKI
	j
X-Google-Smtp-Source: AGHT+IFr5vIuvATmEU3Lizj2zwmteX8aji47igUJODCkyit0aMkH+H6HN7Dwi3X0Bl5wJUh8C0YAoA==
X-Received: by 2002:aa7:c354:0:b0:55f:6960:4935 with SMTP id j20-20020aa7c354000000b0055f69604935mr4160521edr.25.1706806932627;
        Thu, 01 Feb 2024 09:02:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV9RMEgIwUIj0rcfz0UfGOs/2ICwuB5BCl4gBnTB3w4gK7fy4/e3a0ECQLXSpr0yZXm51FqwEuqN1S4M19xYSTtfARfnLKTBgmnwpnzJMKWBniBKwyJxR1CA9tK0MwZgy8+UkKPB/75QU/ycccohpvFlqUk3kFgjFjMfHMyoUZIXnVdyrP7BXWe8hbtLGkeVcuNQ9/eFSJiD9+aZps=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	oxjo@proton.me,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 0/4] iommu/x86: fixes/improvements for unity range checks
Date: Thu,  1 Feb 2024 18:01:55 +0100
Message-ID: <20240201170159.66330-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Patch 1 is a bugfix for AMD-Vi IVMD range type checks.

Further patches unify the IVMD/RMRR checks into a common function, and
the last patch tightens up the condition to panic when attempting to
boot on a system that has RMRR or IVMD regions over memory that Xen uses
as RAM.

Thanks, Roger.

Roger Pau Monne (4):
  amd-vi: fix IVMD memory type checks
  iommu/x86: introduce a generic IVMD/RMRR range validity helper
  iommu/vt-d: switch to common RMRR checker
  iommu/x86: make unity range checking more strict

 xen/arch/x86/include/asm/iommu.h         |  3 ++
 xen/drivers/passthrough/amd/iommu_acpi.c | 33 ++---------------
 xen/drivers/passthrough/vtd/dmar.c       | 14 ++------
 xen/drivers/passthrough/x86/iommu.c      | 46 ++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 41 deletions(-)

-- 
2.43.0


