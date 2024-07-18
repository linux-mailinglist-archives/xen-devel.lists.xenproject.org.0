Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118E7937057
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 23:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760734.1170639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUZ8N-0003Cz-U0; Thu, 18 Jul 2024 21:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760734.1170639; Thu, 18 Jul 2024 21:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUZ8N-0003BY-Q6; Thu, 18 Jul 2024 21:57:55 +0000
Received: by outflank-mailman (input) for mailman id 760734;
 Thu, 18 Jul 2024 21:57:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEHZ=OS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sUZ8L-0002ha-K9
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 21:57:53 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7796a05-4550-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 23:57:52 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-58e76294858so549280a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 14:57:52 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a33de74e5sm5294266b.147.2024.07.18.14.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 14:57:50 -0700 (PDT)
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
X-Inumbo-ID: c7796a05-4550-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721339870; x=1721944670; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YtfadlNgadb4rLpJNCYrZ98WzF6Dv0YgGRcA5dWreRk=;
        b=m8o0wes+YxTDP+B9v820g3sxYDaSeHgqpj77s1/VR3/GHylwgnmtToKhBmqnzoa9US
         ikU6vFmHR+Z2pzllX6UU809cFmam7SbIWznP36FmL/ZbNnzHSxud3wqfMFXKtMz998/T
         1Dj5Aq0wFl91JNz4oOt/Tnddgvd/jwJsjai+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721339870; x=1721944670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtfadlNgadb4rLpJNCYrZ98WzF6Dv0YgGRcA5dWreRk=;
        b=KbdplpG7VFsdFuCWsVQ/h9ViMv5tsIK/hdf1Q6e1HYAeIouODl4RFuaWHnJC1UDfOs
         dH+CtdHIRWUSPuTMi0ya+hab/X1z4sQcITcgHQNeTQVSiYAi2puLC1QTQdRtroTqh/RW
         YsnzlIXCkANEXPqgUev8w9qBk7xMDawbojriHkLI1QkalUjJom+d9+3OViiF+jK+2sb+
         FuR4IsJegEmvKGhUCfMUfjNzUFLvdGIRxPBzJHAlEdImW44JjWU9FiX1Qs094bMwTfPK
         iBXo9nw2GXSr5qpFDAM0sfZICUCALwnYdBqoqk2TgJkkgl19JpF52ruZyFqy6hIFreCZ
         4O+Q==
X-Gm-Message-State: AOJu0Yyp/xamMfk/VwV9JIDHDQIZW4CFdQuraUFYgdqtCkUMOgUKUBSA
	NHJf9a0YfE0uizYsM4/a1QNxJSVGsI80EFPTw/mTEnOTp/2Zdjf6pkWsJDWzFR0zEJBhEyG8Mal
	W
X-Google-Smtp-Source: AGHT+IEKtx6lwmMuQBR7xMkjIlSqABge3Knhh9a06lDR5jnmvEnYO8PL/QrY9ZitvRBKmlsdPO5pMQ==
X-Received: by 2002:a17:906:55d1:b0:a72:7b17:5d68 with SMTP id a640c23a62f3a-a7a0f0fea4fmr429858766b.3.1721339870499;
        Thu, 18 Jul 2024 14:57:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 0/4] xen/domain: Idle domain creation improvements
Date: Thu, 18 Jul 2024 22:57:40 +0100
Message-Id: <20240718215744.3892072-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

domain_create() has some unnecessary complexity for constructing the idle
domain.  Rearrange x86's needs, to simplify the common logic.

https://cirrus-ci.com/build/5234584097390592
https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1379531597

Andrew Cooper (4):
  xen/domain: Introduce arch_init_idle_domain()
  x86/domain: Implement arch_init_idle_domain()
  xen/domain: Simpliy domain_create() now the idle domain is complete
    earlier
  arch/domain: Clean up the idle domain remnants in arch_domain_create()

 xen/arch/arm/domain.c             |   6 --
 xen/arch/x86/domain.c             |  34 +++-----
 xen/arch/x86/include/asm/domain.h |   3 +
 xen/common/domain.c               | 130 +++++++++++++++---------------
 xen/include/xen/sched.h           |   5 ++
 5 files changed, 82 insertions(+), 96 deletions(-)


base-commit: 57338346f29cea7b183403561bdc5f407163b846
-- 
2.39.2


