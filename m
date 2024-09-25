Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF49855BF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 10:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803572.1214232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNc3-0005PM-IV; Wed, 25 Sep 2024 08:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803572.1214232; Wed, 25 Sep 2024 08:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNc3-0005Ni-EV; Wed, 25 Sep 2024 08:43:07 +0000
Received: by outflank-mailman (input) for mailman id 803572;
 Wed, 25 Sep 2024 08:43:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stNc2-0005NX-5X
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 08:43:06 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2db3bf1d-7b1a-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 10:43:03 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53567b4c3f4so847188e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 01:43:03 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf48c29fsm1614171a12.6.2024.09.25.01.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 01:43:02 -0700 (PDT)
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
X-Inumbo-ID: 2db3bf1d-7b1a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727253783; x=1727858583; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8wEdggLSje3YgmxFbAyvA0HoZP9F1s6S8AL53pONZcc=;
        b=u/9R2FCCBhgrbuYJ4P+2ui/8k0wb4EBWifwXNJFfudni8KEww+wTD3BuWyvUMfnutI
         xzZEk/GBxkUOt8LyKsuzVeCLWg6GLPtJdiBkbk8xmX5VidYaSa2yCSI/i7kCHBbmoZyQ
         aa0v3sUWAsjDtsFBGt2kYDtvEyeiAfF0w2gQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253783; x=1727858583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wEdggLSje3YgmxFbAyvA0HoZP9F1s6S8AL53pONZcc=;
        b=RyYM2rFb4ODZm5b/xX2pjsl8tFWoxXzlv4k2Sn3ajuY3dfqFQy5c2Na1DBKzdMVs05
         XgC+61ms+2KdYrB4jRwhRTxFQ0xsB+vfvrhDXUu0Lbkh6Dl7rg5GMDEbs8+OJRcsgeUw
         EVxSGUpPqigs11xKIGFfTT85BuGwOhlRAtE0sCqWUJgVhql1FdtClDs3NdZ8MhwV+At2
         ZIpHL/q63Ax3vo6keA5D78uHhYHJpmBHenaHhLSffKcN3JXgbCsqSPJpUb5zpqQaE8YO
         AYLZ92RRL9OBfwImHA70fjZhTpp1WrYvGNdI6SBSE5VmUof0jgslPM/jai3AFkyBJ7a5
         XGHw==
X-Gm-Message-State: AOJu0YyrkFU94zXB3mzVl2TNtIixXfY94L6id1J0hGCQ/mICUtI6vr8N
	eA0CfUZOGuWCyEV/DhjeoqiR10cqeFgwOxEVQyCXqgeUKzDZ77MyqtQyfTgvN/fnbAPSJa9Ia2l
	p
X-Google-Smtp-Source: AGHT+IGCtEc8uj/1i5kFWHW+pTOQykjSTc2SISWj6I7xBPfTowJekvYllPZVmL1UjvEF5P9yWYrISA==
X-Received: by 2002:a05:6512:3408:b0:536:53a9:96d5 with SMTP id 2adb3069b0e04-53877537e55mr919279e87.17.1727253783034;
        Wed, 25 Sep 2024 01:43:03 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/6] xen/livepatch: improvements to loading
Date: Wed, 25 Sep 2024 10:42:33 +0200
Message-ID: <20240925084239.85649-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Series started as a bugfix to do the build-id checks earlier, but has
expanded a bit into alternatives also.

Thanks, Roger.

Roger Pau Monne (6):
  xen/livepatch: remove useless check for duplicated sections
  xen/livepatch: zero pointer to temporary load buffer
  xen/livepatch: simplify and unify logic in prepare_payload()
  xen/livepatch: do Xen build-id check earlier
  x86/alternatives: do not BUG during apply
  x86/alternative: build time check feature is in range

 xen/arch/x86/alternative.c                 |  46 +++--
 xen/arch/x86/include/asm/alternative-asm.h |   3 +
 xen/arch/x86/include/asm/alternative.h     |   6 +-
 xen/common/livepatch.c                     | 194 +++++++++++----------
 xen/include/xen/livepatch_payload.h        |   1 -
 5 files changed, 146 insertions(+), 104 deletions(-)

-- 
2.46.0


