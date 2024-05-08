Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF418BFBF1
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 13:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718733.1121215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4fRq-0004Nr-Ms; Wed, 08 May 2024 11:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718733.1121215; Wed, 08 May 2024 11:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4fRq-0004M4-Jp; Wed, 08 May 2024 11:26:58 +0000
Received: by outflank-mailman (input) for mailman id 718733;
 Wed, 08 May 2024 11:26:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0je0=ML=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s4fRp-0004Lt-Fj
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 11:26:57 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e08bd0da-0d2d-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 13:26:56 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so1255071a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 04:26:56 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 fk4-20020a056402398400b005701eaa2023sm7556600edb.72.2024.05.08.04.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 04:26:55 -0700 (PDT)
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
X-Inumbo-ID: e08bd0da-0d2d-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715167616; x=1715772416; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jh48XAjrxMpbuLHFvEvd7ild4VQqTjCd5Npj4n5W6mE=;
        b=vI5+xl4lFu2SNBwb1HDLu+ndm6U6gKHwlwl9V6y+e2KmuRTrp3KV1zBCO/nGZ0KJ/r
         S6oyHvxseaksZSqCFSKU9/hO7ZuCQkAQHFLI4UA5IuRBwltNjG4nfms2jI2XC+3dhv+F
         qUkHJ7Vnc0yfSywKePyRZ3GLi/RUHUD/3sDl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715167616; x=1715772416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jh48XAjrxMpbuLHFvEvd7ild4VQqTjCd5Npj4n5W6mE=;
        b=aEXA1m0IPhE4Z22icEmXULN2QiqnbwHkIt7GIbfL/ZZ3V9Mprq6NDGq9olXYzQfIoU
         I58CJMuygdGWxLrdSHUy9Xyl0utbfRUWMvlSHiO6YFPovU5m8rQWy3kGntYHJx7gRKaR
         6VoqjTU5ghFx10BJeu1BrZiWinflEvjrtIV17bmt3cBeFmJ3kgD/83T4z8eiNSJwD/1R
         8ajBSfTokrjItrmxqmjRGkqRkw/FtrsP3qHz0128hclbYhqs05L0uYA+Tv6zriJQvo4x
         7H3oU825J9jcNLUc7rleRYvMkTAMjWTJc9gopwMScztj4juqcZnwD6i8jjDQ+dImyqMQ
         Ldyg==
X-Gm-Message-State: AOJu0YyC6ks4QFVS4zhQRj8DnggWafJhEBmDT8QNzWZjqWrwSQNPDu2U
	yLDi6l5FY74jh9zHzPsIgJac/bAz7O2PhGn59kfwkS26qIDeVC9+7u3R2SJMYr7as6g6sYDpJbT
	8
X-Google-Smtp-Source: AGHT+IF5qoFu591aP56KZr2TFcCwq4kgSVGLjEnTCEI8eZFDdvm1HBTc4Z/5N+uMDrpERxBl0GCZPQ==
X-Received: by 2002:a50:f681:0:b0:572:1fb7:2a77 with SMTP id 4fb4d7f45d1cf-5731d85cc02mr2099029a12.6.1715167615641;
        Wed, 08 May 2024 04:26:55 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH for-4.19 v2 0/3] xen/x86: support foreign mappings for HVM/PVH
Date: Wed,  8 May 2024 13:23:20 +0200
Message-ID: <20240508112323.38946-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series attempts to solve a shortcoming of HVM/PVH guests
with the lack of support for foreign mappings.  Such lack of support
prevents using PVH based guests as stubdomains for example.

Add support in a way similar to how it's done on Arm, by iterating over
the p2m based on the maximum gfn.

Patch 2 is not strictly needed.  Moving the enablement of altp2m from an
HVM param to a create domctl flag avoids any possible race with the HVM
param changing after it's been evaluated.  Note the param can only be
set by the control domain, and libxl currently sets it at domain
create.  Also altp2m enablement is different from activation, as
activation does happen during runtime of the domain.

Thanks, Roger.

Roger Pau Monne (3):
  xen/x86: account number of foreign mappings in the p2m
  xen/x86: enable altp2m at create domain domctl
  xen/x86: remove foreign mappings from the p2m on teardown

 CHANGELOG.md                      |  1 +
 tools/libs/light/libxl_x86.c      | 43 ++++++++++++-------
 xen/arch/x86/domain.c             | 31 +++++++++++++-
 xen/arch/x86/hvm/hvm.c            | 15 ++++++-
 xen/arch/x86/include/asm/p2m.h    | 32 +++++++++------
 xen/arch/x86/mm/p2m-basic.c       | 17 ++++++++
 xen/arch/x86/mm/p2m.c             | 68 +++++++++++++++++++++++++++++--
 xen/include/public/arch-x86/xen.h | 18 ++++++++
 xen/include/public/hvm/params.h   |  9 +---
 9 files changed, 195 insertions(+), 39 deletions(-)

-- 
2.44.0


