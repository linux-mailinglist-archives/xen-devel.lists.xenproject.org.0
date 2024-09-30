Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEE398A824
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807432.1218886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI0i-0002KY-Pv; Mon, 30 Sep 2024 15:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807432.1218886; Mon, 30 Sep 2024 15:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI0i-0002HR-Md; Mon, 30 Sep 2024 15:08:28 +0000
Received: by outflank-mailman (input) for mailman id 807432;
 Mon, 30 Sep 2024 15:08:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svI0h-0002H5-W3
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:08:28 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7c62857-7f3d-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 17:08:26 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53997328633so1352326e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:08:26 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a0432219sm1264423e87.132.2024.09.30.08.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 08:08:25 -0700 (PDT)
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
X-Inumbo-ID: d7c62857-7f3d-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727708906; x=1728313706; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ww2zSwiV903S+y3XQlNYcEpCcqXeJi5DX9LgoKChbRo=;
        b=jwMmdNQKAliwnKNDo8S6fK1my5mQyU/Y2SQQOhJGXL1VOqtoD8PPc4TZHQZxfYekPI
         IUGPbOMIK06T5Dmbe81g5GvAAVDzo3N3Mg4G7DFui83mjBvHccMMSAv8+PJmEEHzxD9n
         8BUh4zb2ZkvnVEwH3hhJ642JcxKqJ3BIUNv0F63wAPHC5mjHmpBf3JcxRvHXnHmrIC05
         BcszGOkNBra11VedxjYCpuApHzoQdxq4Q2Zx9DBs4bl1d6IPiyy65bXaXsAPscVSWvWQ
         rAFOpkwA7y3l3F2Q66FnEDJdsGUItEnoJa7u4A4NT5e/s/vp+D4ImFt3jztV7pnA/kUS
         jo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727708906; x=1728313706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ww2zSwiV903S+y3XQlNYcEpCcqXeJi5DX9LgoKChbRo=;
        b=sTB9uGDYfiMQQlCOqP51kdLuY6BiVLnAQKZKZsUQQrSHtge12JTrcvRuIwOQ/NmxTj
         28SWggmd4vDuvKItEQGKqwMj7zVZpbdtRWvZz700IbWaeA5utD7C0AbD/lbWNlrDDrDN
         pkHDyU4hyXk7BBimQJrguFn8HzL2Q973fyU2INKPb8ANCgI/6VjyzEdYDy5UN4nnhzxF
         3U2NfMe0YCfU7rKALh0W1Y8t9GGWl/skbwJ6n2W88lyhTRlById/AnzsjtMYbPc+TM2O
         VPdP64/6/mPUyaVdHhKh/BgNyLb8yHimdkImtG0m5bVr0FpBO6JcRAu1aVNScVDuWYOQ
         Pyew==
X-Gm-Message-State: AOJu0Yx//33Fg11+NcNygnloV+D7fN1OdTi3ozUo69z05FNd26k+n/Be
	g8N0dE03uvFzzZe2xxVV8sAn/63ZJrmjU5jve2o8s6N1m4nWphBClo/VFw==
X-Google-Smtp-Source: AGHT+IG9qTMkELxwcGaz6ka7QyzyHbKuEgKPdFeNnMYAghjrymomTYNTYoKd7vqRMSLb7Ydysh1nDg==
X-Received: by 2002:a05:6512:620e:b0:539:8d9b:b61c with SMTP id 2adb3069b0e04-5398d9bb6camr4084095e87.51.1727708905255;
        Mon, 30 Sep 2024 08:08:25 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 0/3] Register Xen's load address as a boot module
Date: Mon, 30 Sep 2024 17:08:19 +0200
Message-ID: <cover.1727708665.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series registers Xen's load address as a boot module and
introduce virt_to_maddr(), and drops LINK_TO_LOAD() to use virt_to_maddr()
instead.

This patch series is based on the patch series: "device tree mapping" [1]

[1] https://lore.kernel.org/xen-devel/c1426b095aafcb3492edb679195342c4d0387626.camel@gmail.com/T/#t

Oleksii Kurochko (3):
  xen/riscv: implement virt_to_maddr()
  xen/riscv: switch LINK_TO_LOAD() to virt_to_maddr()
  xen/riscv: register Xen's load address as a boot module

 xen/arch/riscv/include/asm/config.h |  4 ++++
 xen/arch/riscv/include/asm/mm.h     | 15 ++++++++++++++-
 xen/arch/riscv/mm.c                 |  9 ++++-----
 xen/arch/riscv/setup.c              | 10 ++++++++++
 4 files changed, 32 insertions(+), 6 deletions(-)

-- 
2.46.1


