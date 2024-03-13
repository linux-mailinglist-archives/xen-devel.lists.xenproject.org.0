Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750E987A96B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 15:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692455.1079613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkPZB-0003kg-FV; Wed, 13 Mar 2024 14:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692455.1079613; Wed, 13 Mar 2024 14:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkPZB-0003ia-BY; Wed, 13 Mar 2024 14:26:49 +0000
Received: by outflank-mailman (input) for mailman id 692455;
 Wed, 13 Mar 2024 14:26:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9/O=KT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkPZ9-0003iO-UX
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 14:26:47 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8799735-e145-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 15:26:46 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-513cc23b93aso366208e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 07:26:46 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b15-20020a170906194f00b00a4665f829a9sm159681eje.90.2024.03.13.07.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 07:26:43 -0700 (PDT)
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
X-Inumbo-ID: b8799735-e145-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710340004; x=1710944804; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=193rvYSSKodpIAC6i1jd+HzBZDvqj718olv+uomGpNY=;
        b=AvhenZEfHE+Oi1S1ELdscmapf68znRt/ii3fuc+2MsUFvtpX26uU17/VgyBwaXeoOT
         BtxhfzkNMmiDFI1j71QZ06Ndwk1qTHgmAFp16KwZTfBpKReT/NLxzglzvjSPrq4dFYmJ
         Y1rif4rYFqr6xI1mV9PFIMcVSJjUmEEit6VJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710340004; x=1710944804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=193rvYSSKodpIAC6i1jd+HzBZDvqj718olv+uomGpNY=;
        b=SOjn7GfhD+SbjIJ7INxANqAid5FMGpb/+e49yX38f/hDSfaYFuqFcnWOOBB49y1Aoo
         FR1+GX6eQDPxAD2fke1s5KFd6LDewRmkVaxIzTc5twp/KDISwTdCP/4BHomoByH4aqci
         8cQ7VMwpru5pSNXFwyzLGUoB0ikGUlgQMw5tCebqAOmBOL7wjG4JW8gbM4CneEk2bOJJ
         zhkMveDdj/of1eDbd8msazASHHaBqOu7HO7/p/58E3duuoX6eVLvQbzfXISmsEyB42Am
         vNkNhIcGHZyI6JC1Bow2Ti94ysY7ogza3mGMS+PiQMsx8B1g3or4Eok/EL9NuKe6tC5s
         oluQ==
X-Gm-Message-State: AOJu0Yz83gfNZgAXVLyg3ThN0jHPwpwNIRqONKDqUdQb9JTRM0EychNY
	pvebrJXJCVMaIHLLj28GTX98LarHYCHy+VaexbDScz2hhC535SEoCe28j89aTvGIqYcw4l6CDEW
	a
X-Google-Smtp-Source: AGHT+IGg7vsWaY8WgkBUj8WlmBqx1lG/SxD7L2crqPeaJKlne//xXf2sXIYZigHYCkHgPzqLBPB6Rg==
X-Received: by 2002:ac2:57c6:0:b0:513:a39e:ae45 with SMTP id k6-20020ac257c6000000b00513a39eae45mr2363688lfo.62.1710340004500;
        Wed, 13 Mar 2024 07:26:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] x86/entry: Post-XSA-453 cleanup, part 1
Date: Wed, 13 Mar 2024 14:26:39 +0000
Message-Id: <20240313142641.2150302-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The start of making Xen's entry code conform better to the recommendations in
the vendor Optimisation Guides.

Part 1 (this series) swaps RESTORE_ALL for POP_GPRs.  Part 2 is the SAVE_ALL
side of things which is more complicated because of flags handling.

Andrew Cooper (2):
  x86/entry: Introduce POP_GPRS
  x86/entry: Delete RESTORE_ALL

 xen/arch/x86/hvm/svm/entry.S         | 17 +-------
 xen/arch/x86/hvm/vmx/entry.S         | 16 +-------
 xen/arch/x86/include/asm/asm_defns.h | 61 ++++++++--------------------
 xen/arch/x86/x86_64/asm-offsets.c    |  1 +
 xen/arch/x86/x86_64/compat/entry.S   | 18 +++++++-
 xen/arch/x86/x86_64/entry.S          | 12 +++---
 6 files changed, 45 insertions(+), 80 deletions(-)


base-commit: 03cf7ca23e0e876075954c558485b267b7d02406
-- 
2.30.2


