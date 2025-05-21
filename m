Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BD3ABFBBC
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:56:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992347.1376102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHmjk-0007GD-Bh; Wed, 21 May 2025 16:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992347.1376102; Wed, 21 May 2025 16:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHmjk-0007EZ-95; Wed, 21 May 2025 16:56:12 +0000
Received: by outflank-mailman (input) for mailman id 992347;
 Wed, 21 May 2025 16:56:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Cb8=YF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uHmjj-0007EC-Eh
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:56:11 +0000
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [2607:f8b0:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d29f359-3664-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 18:56:08 +0200 (CEST)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b26f01c638fso5239767a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:56:08 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-30f36366219sm3894848a91.6.2025.05.21.09.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:56:05 -0700 (PDT)
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
X-Inumbo-ID: 7d29f359-3664-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747846566; x=1748451366; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eliR2nkb7Vuh2naOk8wjTkjUYBIZCqckOsAyoeIiAw8=;
        b=MY7nZ2oNdtu04gMfZBm0BzUKOUrZSh/GPOUMjkRvW3bVOEniUi2eOuATmUOUGCyAzm
         wI/GFrV9qw9UznbXqTX5+DATmcDDQk5QqhXEHZo9eDUlWrFUXJ9qiKAUQy2p1JOc0FiD
         51g5fbY/lhx49rlWOgrMlW5OqdIsIgPTYA9lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846566; x=1748451366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eliR2nkb7Vuh2naOk8wjTkjUYBIZCqckOsAyoeIiAw8=;
        b=bUNbLmCqg4hrdvT7as23oetC10KHipaYBg8anv244FGzcDHeTmaSTDh19P8hGvV688
         tytGB7c41jVeq7nQWqvKXuLv61V7SpvNMA2cR1iJDlkWQAcUDYCN6MDPSOhDdbp+nwZ6
         2XdxpKraH8YRrGyr0kL3xJusF2oX1ZhD7fMqa2spj70PeVPxzlMyv4igUSbNjco57abu
         mRmg/uev/UvQlhdkablbFUQ5wRpjL1JsWNflnjJMgIkoNY0OO2UTf7xzFMHEJBqEZEbz
         aHa1VRlry3Pgi7b8QPU/ojb1NHOIha4JiYq97OI51/eUhJMmSCqEkYgdhJxxIHIh16FA
         ChyQ==
X-Gm-Message-State: AOJu0YzbFY/hAyF/7G/sa0Rg4kK0BOY2bPRHh+05XcBEeE7TENP9EI0N
	3l3rMgyI4MpC57IOZzOCZKe0QzeAZsdbaYgG6osLgn8JZOEvFRiS/9/p7nf+rpRfPV3+H4OWuWa
	wJME0
X-Gm-Gg: ASbGncvIoh5WxvgbPmmn74QyxdOoTT7sCxvM64c2rvSE0pA+QH2XY/8/Z1yvaJGysV5
	18JcrAv0jl6rQyBLUBz/eQuj1ByLidnoDXajFejhRQYvwrX77OPsLFSIDuTZVD59Us7/eryiZnN
	sD83F4hbXn9EQ5zEs2zcvatrmOyQ9PMoCSR+hW5NHn3mCwPXuPA02NkyimTgS1hjdejs/uLPAjw
	Vi6sxfRSBo6aFv9tYA9aznQIVXgkNIOAfH6QJZFj2sXyx1+kuTZVviZZ86nWnQKCHfdBkdgPcZZ
	vS/eLFt63+uyDEP7NCPQWShbSietLMnjKejp0HHo03PEdq5ODcqqIBIBDIg5grdriNKdlVmgIff
	ssIcNRtgU/AJEo7xkWMQ=
X-Google-Smtp-Source: AGHT+IFnGhvdQp5Ng/qylonF/Sy2e22aJEsWRYp/IMAGZQyEg8GU55IGfE+OVTEm0VSX6MfKlGY2bw==
X-Received: by 2002:a17:90b:2f0d:b0:2fe:6942:3710 with SMTP id 98e67ed59e1d1-30e7d4eea1bmr30531398a91.3.1747846566167;
        Wed, 21 May 2025 09:56:06 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] x86/boot: provide better diagnostics in AP boot failure
Date: Wed, 21 May 2025 18:55:02 +0200
Message-ID: <20250521165504.89885-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Both patches attempt to improve AP boot failure diagnosis by improving
the printed failure messages (patch 1) and detecting AP getting stuck
during bringup (patch 2).  They should be non-functional changes for
systems working correctly.

Thanks, Roger.

Roger Pau Monne (2):
  x86/boot: print CPU number in bring up failure
  x86/boot: attempt to print trace and panic on AP bring up stall

 xen/arch/x86/include/asm/processor.h |  1 +
 xen/arch/x86/smpboot.c               | 12 ++++-
 xen/arch/x86/traps.c                 | 66 +++++++++++++++++-----------
 3 files changed, 51 insertions(+), 28 deletions(-)

-- 
2.49.0


