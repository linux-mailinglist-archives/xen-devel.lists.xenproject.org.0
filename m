Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D9B8C2CB9
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 00:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720093.1123089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5YuO-00089J-08; Fri, 10 May 2024 22:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720093.1123089; Fri, 10 May 2024 22:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5YuN-00087D-T9; Fri, 10 May 2024 22:40:07 +0000
Received: by outflank-mailman (input) for mailman id 720093;
 Fri, 10 May 2024 22:40:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4i6G=MN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s5YuM-000872-TH
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 22:40:06 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f19a453-0f1e-11ef-909d-e314d9c70b13;
 Sat, 11 May 2024 00:40:05 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a5a2d0d8644so418110666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 15:40:05 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cf60sm233915866b.14.2024.05.10.15.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 15:40:04 -0700 (PDT)
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
X-Inumbo-ID: 3f19a453-0f1e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715380805; x=1715985605; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oVrYVxNngnuJ5RDy2Fy0Qi7znwDB3526BZ29njRt168=;
        b=cknb/XomjDIKWLt7V/gkk3Xol8QW3mKuKn5GBqV4eqHsBYBcS6NEyvXF5xRSM5PVQg
         80QnHol4raT8Qa4IeDoOFY7fU9d+LIp+FUanrvWIlnhGaxwakyObWtXdyFs9o4yKJuq6
         JawwtWKBl0eOsTThOfmHbl6NehNrY5nW7QxMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715380805; x=1715985605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVrYVxNngnuJ5RDy2Fy0Qi7znwDB3526BZ29njRt168=;
        b=czYL7ob1vdwuPoTrRkypLnSAEwiQsM/ofv9X5Ib96YvYrU8JgCun1Ndv4wqG7ymvDV
         NfR2Vy7QBD08ce2nxv3eUG4hjrHmYWOhZ+62wPo28+VkQf+H3RHSc9Eq/kYL4tQXOcyC
         2OC/hOAeZqKkCECkDnLsnWGSv8DHv5j73HtKgFx8WNiePx6sBYML5c/atnLlIFrUaX/K
         F4XnSXCAAgFf3CQB+/0JEzwISawOigxP14F32qaKGlm+zU1LP4xEWfNxu/tu5kevrtMf
         MnrEPRUBDp9zk2UkvF1hbvZh+rpyWwjxENubXigOcaktt3TmxduYpzXaJ/UIgZo7PHKT
         d4AA==
X-Gm-Message-State: AOJu0YxOuyIf4hBCb7muMmECk8lnjvXPyqTplfZWV0ivEr6EOHUPjsbd
	BxG68fkB6Gh6lzM4tw1ch/K1sRQJubQHBOpbwvos59B0/dsUEEc0i75/JBRSWNBYGH45o6na8A6
	B
X-Google-Smtp-Source: AGHT+IEqKVwst80V0QidpfCtbT9KEbGXMQWPcjZlg/AJ7Y7/GxJ2igY6pXaxqdNYEE6qkBlnqVZQ0w==
X-Received: by 2002:a17:907:d25:b0:a5a:2aed:ca2b with SMTP id a640c23a62f3a-a5a2d5c9fdcmr324910766b.28.1715380804614;
        Fri, 10 May 2024 15:40:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 0/4] x86/xen-cpuid: Use automagically generated names
Date: Fri, 10 May 2024 23:39:58 +0100
Message-Id: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I may have got a bit carried away tweaking Roger's v2.

The major bugfix is getting both alias of common_1d, which matters when using
xen-cpuid on AMD hardware.

Andrew Cooper (1):
  x86/gen-cpuid: Minor cleanup

Roger Pau Monné (3):
  tools/xen-cpuid: Rename decodes[] to leaf_info[]
  tools/xen-cpuid: Use automatically generated feature names
  tools/xen-cpuid: Drop old names

 tools/libs/light/libxl_cpuid.c |   2 +-
 tools/misc/xen-cpuid.c         | 311 +++------------------------------
 xen/arch/x86/cpu-policy.c      |   2 +-
 xen/tools/gen-cpuid.py         |  30 +++-
 4 files changed, 53 insertions(+), 292 deletions(-)


base-commit: b0082b908391b29b7c4dd5e6c389ebd6481926f8
-- 
2.30.2


