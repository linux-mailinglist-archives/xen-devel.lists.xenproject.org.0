Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C297A8B9FBD
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 19:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716036.1118073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aU3-00017x-PO; Thu, 02 May 2024 17:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716036.1118073; Thu, 02 May 2024 17:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aU3-00015S-Kq; Thu, 02 May 2024 17:44:39 +0000
Received: by outflank-mailman (input) for mailman id 716036;
 Thu, 02 May 2024 17:44:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2aU2-0000pj-7s
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 17:44:38 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a25438ad-08ab-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 19:44:32 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51bae805c56so9519587e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 10:44:32 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 i5-20020ac25b45000000b00516d2c05b3dsm242346lfp.299.2024.05.02.10.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 10:44:30 -0700 (PDT)
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
X-Inumbo-ID: a25438ad-08ab-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714671872; x=1715276672; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T5K1agmVtivL+Ttpsak7xYzIV14z+3VHjCsOZLq68vU=;
        b=SPM5S2WIHqqcFoSkNwVLyS3s9Q+9nh+mKe/OuLXZfQimd+P7C1Q1GlDJnfIXe0reI1
         5F27FnFIgtS1O85omlrlUoa9DyOOEPOYDsthrO/YB8l151x9JOhIo8J+gl0IymJ40t00
         WxLj2H1WtcqyagbK3qmw8F5WZGhtlASo432DgemlBgf7w8H/rt64iV9ORhAfz5InbTU1
         PRAHz1lLuUneqMnxkulYnnultCJeHtvWIkfnv+O/X7nVKDNdeu29U1pzpu32sFwkOmbE
         kRfRaqqkeiGO22ANXDTGgQjiJhhCd9w9aZkzq7wbCukZXuqpU9IG+rol/STyTdNkf3kZ
         hhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714671872; x=1715276672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5K1agmVtivL+Ttpsak7xYzIV14z+3VHjCsOZLq68vU=;
        b=PPeB6nAvMVeSnw+rhFF5sCzyVDH5JVkucqIo1KzGKkbvjGpr+sO9fv3hwHSUzhi9iP
         iPYD9coa1mky5PE3W/KSuBu2GPX2qahD3GkYfKeCHYeEzP7B4DVJ9rzEzyoyuF1aFaBY
         87WksSrA/rEdDt0CtJDdjVuniLj1dMfFfggZgJLVHmPWzJ++XAO9pf2JIPCVZguonIo9
         9QDA8ayMtAcrGfRnhQg2oSvtE4+G7wBJLBGlD6hpOb4jhIIt3YMl06s8y5hF4N67njcc
         3XUVpilJBDZNjTax+JZjlD4EtlFnEjF0+4ckZkFWq+hW7td1Rm/txXhbeQ/U+D3G+/W2
         3tFg==
X-Gm-Message-State: AOJu0Yw9Mgx1KZgVaTZoAa/fpNQomeE5ciyfbPu5qOFUurlkS3FHdtMQ
	wdOm+V+0FEFQr9hYJdL6ietoDV9kX4gasszSj4NorZ5ZXgD08FWKSj/Jl0eS
X-Google-Smtp-Source: AGHT+IG2csGx9nxFG6gd+bfnXUUc3DkUJ2k/PLxHYh7cOXYh/SxizHlPKdD32MD5m9MV5cdVHehcWQ==
X-Received: by 2002:ac2:555a:0:b0:51e:f31b:1b45 with SMTP id l26-20020ac2555a000000b0051ef31b1b45mr320973lfk.50.1714671871317;
        Thu, 02 May 2024 10:44:31 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v3 0/9] xen/arm: arm64: Annotate code symbols
Date: Wed,  1 May 2024 05:54:39 +0200
Message-Id: <20240501035448.964625-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

On the way towards Xen safety certification we're evaluating the use
of tools to collect code-coverage/profiling information from execution
traces. Some tools rely on ELF symbols for code being declared with
type FUNC and having a symbol size.

We currently annotate some symbols but not all. Also, there seems to be
different ways to do the annotation.

This series now converts all the .S files under xen/arm/arm64 to use
the macros from xen/linkage.h and also adds missing code symbol
annotations when appropriate.

Best regards,
Edgar

ChangeLog:

v2 -> v3:
* Convert and add annotations for all of xen/arm/arm64.
* Fix brain freeze in commit message for entry.S.

v1 -> v2:
* Drop RFC.
* Squash into a single patch to avoid confusion.



Edgar E. Iglesias (9):
  xen/arm64: entry: Add missing code symbol annotations
  xen/arm64: smc: Add missing code symbol annotations
  xen/arm64: sve: Add missing code symbol annotations
  xen/arm64: head: Add missing code symbol annotations
  xen/arm64: debug: Add missing code symbol annotations
  xen/arm64: bpi: Add missing code symbol annotations
  xen/arm64: mmu/head: Add missing code symbol annotations
  xen/arm64: cache: Use the generic xen/linkage.h macros
  xen/arm64: lib: Use the generic xen/linkage.h macros

 xen/arch/arm/arm64/bpi.S         | 20 +++++----
 xen/arch/arm/arm64/cache.S       |  4 +-
 xen/arch/arm/arm64/debug.S       |  6 ++-
 xen/arch/arm/arm64/entry.S       | 72 +++++++++++++++++++++-----------
 xen/arch/arm/arm64/head.S        | 50 +++++++++++-----------
 xen/arch/arm/arm64/lib/memchr.S  |  4 +-
 xen/arch/arm/arm64/lib/memcmp.S  |  4 +-
 xen/arch/arm/arm64/lib/memcpy.S  |  4 +-
 xen/arch/arm/arm64/lib/memmove.S |  4 +-
 xen/arch/arm/arm64/lib/memset.S  |  4 +-
 xen/arch/arm/arm64/lib/strchr.S  |  4 +-
 xen/arch/arm/arm64/lib/strcmp.S  |  4 +-
 xen/arch/arm/arm64/lib/strlen.S  |  4 +-
 xen/arch/arm/arm64/lib/strncmp.S |  4 +-
 xen/arch/arm/arm64/lib/strnlen.S |  4 +-
 xen/arch/arm/arm64/lib/strrchr.S |  4 +-
 xen/arch/arm/arm64/mmu/head.S    | 28 ++++++-------
 xen/arch/arm/arm64/smc.S         |  6 ++-
 xen/arch/arm/arm64/sve-asm.S     |  9 ++--
 19 files changed, 138 insertions(+), 101 deletions(-)

-- 
2.40.1


