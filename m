Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E317287A78A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 13:28:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692402.1079492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkNik-0005gy-HN; Wed, 13 Mar 2024 12:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692402.1079492; Wed, 13 Mar 2024 12:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkNik-0005eG-Eg; Wed, 13 Mar 2024 12:28:34 +0000
Received: by outflank-mailman (input) for mailman id 692402;
 Wed, 13 Mar 2024 12:28:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5AcA=KT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rkNii-0005e0-WB
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 12:28:32 +0000
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [2607:f8b0:4864:20::92f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33b6ac3f-e135-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 13:28:31 +0100 (CET)
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-7dc3a92c4b8so226409241.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 05:28:32 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 ne7-20020a056214424700b00690dbc390dcsm2283874qvb.89.2024.03.13.05.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 05:28:30 -0700 (PDT)
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
X-Inumbo-ID: 33b6ac3f-e135-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710332910; x=1710937710; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/gG4e04OlvTPcRsxemRlv/QFnImY3oZ7Z0GxspCzBQ=;
        b=A7gdLSso5xAH3KuOhcnIpho9ibounN9Ex1OKU07/NTofKZ+w/uHgx5OiWTIMtyoqJM
         LrfwUkoqomiscqF1OJaCf36D+VSa0JY07LOk1vNpydhpqB8PfvqB7SAgIhS97+AxwEU6
         W2qd2cpr3BI3cjGGRF+enD56qrb8mN+XZm0f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710332910; x=1710937710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/gG4e04OlvTPcRsxemRlv/QFnImY3oZ7Z0GxspCzBQ=;
        b=FoPEVw66IuCOhS/fSx9oxnBIDFPKd6ykY427YifwvIRRPH3B1CRqMJpKel6limobkr
         uGC2BeuHHB8hQQ36VqcUQrUXP99wV48LUtY7Zgdmxvo95Ulzsnf5hh1xXVZmbK4CnKeZ
         FYA//Kyw6fCi9B1HTjiJl5x+mshHwSvkXynpoI6iZRexANzWEXVFbfUvMAW704WDeSLH
         rRgxsZaGf+e5hLJrd4SvYp5ZHUVVA/WTQpZP6CpKoniZWqkN6myxSt/3gYmi53RHnr2R
         cLvXkN6jdvGrCoUZ1BwSEMgavkUTYpQrcGz3sYGuOHyfMtG/bGaZ4bDXkZRZcMaQZdEm
         TIAQ==
X-Gm-Message-State: AOJu0Yz1i388ac383EgN7PrungB58j5hQ2Cizjp7XI9BDuCTYQ/xyIgy
	uQMKfmSpqsPNQNZBcENOHbzwNdeU8tkGdDzfXw4SZJ6b7XjERgO18LKBVjnQDzRNbDaCX8ilKKb
	0
X-Google-Smtp-Source: AGHT+IEVZ9jkA8cU8kiKfUtF/Gmqt5BEut+6B6N+5C5V/HiOCOmTvf2aM7XtgkHVehpP3uSBg3dFPA==
X-Received: by 2002:a05:6102:32ca:b0:473:44f2:caae with SMTP id o10-20020a05610232ca00b0047344f2caaemr8385482vss.21.1710332910659;
        Wed, 13 Mar 2024 05:28:30 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH v2 0/3] AMD Nested Virt Preparation
Date: Wed, 13 Mar 2024 12:24:51 +0000
Message-Id: <20240313122454.965566-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series lays the groundwork for revamp of the AMD nested virt
functionality.  The first two patches are clean-ups or reorganizations
of existing code.  The final patch is the first major step towards making
the feature supportable: allowing Xen to refuse nested virt support if certain
hardware features are not present.

George Dunlap (3):
  x86: Move SVM features exposed to guest into hvm_max_cpu_policy
  nestedsvm: Disable TscRateMSR
  svm/nestedsvm: Introduce nested capabilities bit

 docs/designs/nested-svm-cpu-features.md      | 111 +++++++++++++++++++
 xen/arch/x86/cpu-policy.c                    |  29 ++---
 xen/arch/x86/domain.c                        |   6 +
 xen/arch/x86/hvm/nestedhvm.c                 |  10 ++
 xen/arch/x86/hvm/svm/nestedsvm.c             |  16 ++-
 xen/arch/x86/hvm/svm/svm.c                   |  57 ----------
 xen/arch/x86/hvm/vmx/vvmx.c                  |   8 ++
 xen/arch/x86/include/asm/hvm/hvm.h           |  16 ++-
 xen/arch/x86/include/asm/hvm/nestedhvm.h     |   4 +
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h |   5 -
 10 files changed, 184 insertions(+), 78 deletions(-)
 create mode 100644 docs/designs/nested-svm-cpu-features.md

-- 
2.25.1


