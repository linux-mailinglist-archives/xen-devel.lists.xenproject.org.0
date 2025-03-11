Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE64FA5C029
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 13:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908020.1315188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryO6-0005c8-MQ; Tue, 11 Mar 2025 12:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908020.1315188; Tue, 11 Mar 2025 12:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryO6-0005a7-Jj; Tue, 11 Mar 2025 12:07:10 +0000
Received: by outflank-mailman (input) for mailman id 908020;
 Tue, 11 Mar 2025 12:07:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siat=V6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tryO4-0005a1-T9
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 12:07:08 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57903bae-fe71-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 13:07:03 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-223a7065ff8so4184405ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 05:07:03 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22410aa8b83sm95765925ad.241.2025.03.11.05.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 05:07:00 -0700 (PDT)
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
X-Inumbo-ID: 57903bae-fe71-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741694821; x=1742299621; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4y83HIIB3mMQLsS32XTY2zN9q/797IMVEGVxmTtEcw=;
        b=VVFtbQfErdG5Lnu1XCCrLdxLRCnJeRChAMtXCQ+JY8X4JEGGQfsCT7NbMMb+cuaxAt
         Af55qsTDD/Irn04QNUtWxmYXUHknq0UXBsLuGVH313TxTwAxlHwdRUr+xeh4msLgVSmy
         Jy1xfYevQZQ+JsvEamI3wXCEj3ifZHrRCgoCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741694821; x=1742299621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4y83HIIB3mMQLsS32XTY2zN9q/797IMVEGVxmTtEcw=;
        b=vcEbLtFgLCg60cEuPUtpH4zN5me9xY0+YXG5Xcn0l1SlN2gRV08YVfSajsNcxF3UNM
         XnbU1hZjR3xZxUB2E/loSNpFOjcx4MOw6qlj6nUVqcj0LIgOgduG1Lj/D4TrkVMkSGRJ
         54NpSjVK61F6VP0iFG7oMlRl1N0zcIwCdS1Sw4Tr8fNlRc0CfyZ2OLPsOhnAbsHFZ6zQ
         Z9YcArDSidD45quvI0212oFXpVJyQ9MoULWMSFZR4jVPDwRSJXtouqk1fcDqH5r5RNhh
         0TAkrbWiEKj+KeTe5gXS6sDbBFNVxyXNp3QfMK6HQ+LQ1qWI/dP/5jwztr2ma6zXqBJq
         90pw==
X-Gm-Message-State: AOJu0YwTSg+9f+jURabXxB0iepMA4zWKNQJbbWbNuL6t6Och7DvaAa1p
	dH2k3kSpWXsAJ4EikxrIWgvi9hy1WAJWXDf07l2a4dpW35lmGQwKBnZrPqd4+/KNVD60D29Lrma
	h
X-Gm-Gg: ASbGncspfYetSuvE6LgEPhO03Cl3AE4qvl13ZQxOwSzBWSOX2QFKCHI9x9HGvj3BOQh
	OBzA6DzlQOMtA3y2klyfXWCgx8ja0rqIkFR4x1CTITwpc9DDUhNO/xL+HXHi3Q8Vs+slGXj4P4e
	uAcUl9glK/+g62NKuH3HpSzdmN0yyLhOeuG0Wmet4Zn0yOsJ9402OwXeZ13CGJWPzbD6keq+LeR
	rck2d9VIlQjc+zhvJBGPRMjdf0i9xodPmKaaPxEJQfRC5WwT0ClEFuiJLWTqa8uJ0cEivUqW+BK
	oprWI/acvU/uDx+Z3q+KTI3JUheSoh/BB8GPZMNBchSKqBj4/loedoQ=
X-Google-Smtp-Source: AGHT+IG7kexaPwSjg1r85EBBfAulHDp473EZw8sSzI5+X7MB9NxcylaxuLaol60b2UYOLehD0wMLuA==
X-Received: by 2002:a17:902:f686:b0:224:5a8:ba29 with SMTP id d9443c01a7336-22428ad1f1dmr268339265ad.43.1741694821021;
        Tue, 11 Mar 2025 05:07:01 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v4 0/3] x86/pci: reduce PCI accesses
Date: Tue, 11 Mar 2025 13:06:49 +0100
Message-ID: <20250311120652.61366-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Patches 1 and 2 are new bugfixes in this version.  Patch 3 is still
mostly as v3, just with the extra logic to ensure vmx_pi_update_irte()
correctness.

Thanks, Roger.

Roger Pau Monne (3):
  x86/vmx: fix posted interrupts usage of msi_desc->msg field
  x86/hvm: check return code of hvm_pi_update_irte when binding
  x86/iommu: avoid MSI address and data writes if IRT index hasn't
    changed

 xen/arch/x86/hpet.c                      |  6 +++++-
 xen/arch/x86/hvm/vmx/vmx.c               | 20 +++++++++++++++++++-
 xen/arch/x86/include/asm/msi.h           |  2 +-
 xen/arch/x86/msi.c                       | 11 ++++++-----
 xen/drivers/passthrough/amd/iommu_intr.c |  4 ++--
 xen/drivers/passthrough/vtd/intremap.c   |  4 +++-
 xen/drivers/passthrough/x86/hvm.c        | 10 +++++++++-
 xen/include/xen/iommu.h                  |  6 ++++++
 8 files changed, 51 insertions(+), 12 deletions(-)

-- 
2.48.1


