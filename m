Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D48E78C440
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 14:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592180.924826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxqm-0007xZ-WE; Tue, 29 Aug 2023 12:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592180.924826; Tue, 29 Aug 2023 12:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxqm-0007sp-Qb; Tue, 29 Aug 2023 12:29:40 +0000
Received: by outflank-mailman (input) for mailman id 592180;
 Tue, 29 Aug 2023 12:29:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o+c=EO=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qaxql-0007r1-JX
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 12:29:39 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b58fa2df-4667-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 14:29:34 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1bf078d5f33so34393925ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Aug 2023 05:29:34 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 c15-20020a170902d48f00b001bdc8a5e96csm9260099plg.169.2023.08.29.05.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 05:29:32 -0700 (PDT)
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
X-Inumbo-ID: b58fa2df-4667-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693312173; x=1693916973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8bCRf85vT2T3nuNmNFbFtWzJQK+a8A+XqepNxDEiGM=;
        b=jxG+CTfSa8OPZYJjnmwWh20KleW6+Uk8SCqmYuNjByhcxVCOnj7HDnqZbvZoelPp4y
         Hxb4EODeqG96zSejKKGi/bAZTOrFEyrk41RIGQ1m3Wg/gKaKjzLA0Zh5ZaZsjzbj8f+n
         Mmk6phkD0KoCpc5IVQLkDnNFstW2Q1uz/oUNyeUW3xRcYOS1svo5KpsElHEsNTcHAKVw
         LvVMJN7PxOWGOFVKwcc9DoS/LYYgospdJhAEYVmyIZdaXRkL6qNkJHiHNu49fQqI5uZS
         Q0G01rneJ9LF6njD1wwrsV+rqW0RTxtkBJq3Go6/cxzknoHDByj4OvArULMTBNz0pZ+o
         o58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693312173; x=1693916973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8bCRf85vT2T3nuNmNFbFtWzJQK+a8A+XqepNxDEiGM=;
        b=bkkUWYgHPQyzoFSIHz36E5tMMcU98UfFpxHKvWaF2ssTCTkjo5JgiPDqKzkxnA5Fsb
         8BC2Vi+bKHiBcgorXNblsjHkeiFxcD0wXQBK+7fgdt1dibvfPYI4ndWRj/FYo1srLDeZ
         X5htPeka3FoLVqKaIfW2OR2s1GPtYGFnS/183OQdy2CFG/ThJf/du4jrUU6yKL8Jrmfa
         vDVjmiFF40Alf80D/r/+8iKQxHL3dp6v12Xn2btJZhtE5b/RJ/Wxt4YdPGX9PA9v5wIV
         ra0rNyFXLbeoEjH5I9u9dCEFVpV746rKdREAa9uuLBbLjhV1HpwYYPlcNvLqw1mbzHm7
         1AVw==
X-Gm-Message-State: AOJu0Yza7KvIDxiMza6PGIAoP6kPY+ntnwSRRoje12aXJWcV5mlF6Bq9
	9AMrYNzV33cKrpKkG0NN+MFylw==
X-Google-Smtp-Source: AGHT+IFj8Mbp9xBFjeOn69lgOEFyDk+KCIk0EkFVH95JvNRVdOnz7az8b9wKq9djZKmXzDrEULiLqQ==
X-Received: by 2002:a17:902:d342:b0:1bf:6ad7:228b with SMTP id l2-20020a170902d34200b001bf6ad7228bmr28303356plk.8.1693312173031;
        Tue, 29 Aug 2023 05:29:33 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/2] xen: privcmd: Add ioeventfd support
Date: Tue, 29 Aug 2023 17:59:03 +0530
Message-Id: <cover.1693311370.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Now that irqfd support (backend to guest interrupt) is already merged, this
series solves the other part of the problem, i.e. ioeventfd (guest to backend
interrupt).

More details inside the commits.

--
Viresh

Viresh Kumar (2):
  xen: evtchn: Allow shared registration of IRQ handers
  xen: privcmd: Add support for ioeventfd

 drivers/xen/Kconfig               |   8 +-
 drivers/xen/events/events_base.c  |   1 +
 drivers/xen/evtchn.c              |   2 +-
 drivers/xen/privcmd.c             | 385 +++++++++++++++++++++++++++++-
 include/uapi/xen/privcmd.h        |  18 ++
 include/xen/interface/hvm/ioreq.h |  51 ++++
 6 files changed, 458 insertions(+), 7 deletions(-)
 create mode 100644 include/xen/interface/hvm/ioreq.h

-- 
2.31.1.272.g89b43f80a514


