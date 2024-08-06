Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32D4948DE2
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 13:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772826.1183266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbIZ7-0006Va-0T; Tue, 06 Aug 2024 11:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772826.1183266; Tue, 06 Aug 2024 11:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbIZ6-0006T5-U5; Tue, 06 Aug 2024 11:41:20 +0000
Received: by outflank-mailman (input) for mailman id 772826;
 Tue, 06 Aug 2024 11:41:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPS5=PF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sbIZ5-0006Sz-Cc
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 11:41:19 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb89295f-53e8-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 13:41:18 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52f01ec08d6so612320e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 04:41:18 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba07891sm1466093e87.22.2024.08.06.04.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 04:41:16 -0700 (PDT)
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
X-Inumbo-ID: cb89295f-53e8-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722944477; x=1723549277; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q5upltfC9xlBQsVci2xz+gISSqYTLts91WnziLkDiE0=;
        b=hxgjNWA9tKSSQZy2Hd9ivWVtqTii3qL23zOgeFnDXN3w2ZNiyPiuKjt2XoJHzQ4irh
         ZyKgU3bJl+8MDF9zC3n4InpyL9yMv7BnDO+u48PDZvXMyPSJKnEWSUYeP7LD2TQ2pzqF
         cd9+jfTUiMfwV7IR96Oi7SdIO23CFE/4KlIxFihTAwDOU0hJVfZYO2wMpsZESWHM6+sQ
         S1UBt4fynHmaslqKjav0tVrTUbeHwW+1/qPxtpiX2PhgdwbDDKhWhi0Os85So9RBu7Cr
         wptkhQpB02QnzIZiXzcb5HZZojdJVEcazRAw6esm0GFd13sgj841ts44S1Xz7uF0uxTm
         XsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944477; x=1723549277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5upltfC9xlBQsVci2xz+gISSqYTLts91WnziLkDiE0=;
        b=Z7qHvihjkZNtkurt22sH3lSDCELRpKkO0lbP6XV+9qhBZdh5jXkj438EnMr2X0nZiV
         YCWoHyB/Q2OZt/ByOlZtloaNQ002tkdWOfVI7hVeswVMgukSUo5RSSzvVzMLGoZY6KLg
         LWNUsCGzmSMlnh4MxBg5Yt7iNcTeOWEgWIsEHnDnDG9NjIamFoAths1sWeXk4/nl6QG1
         q7k40aCi0QmdKIyMe5Y2cwxspmSU0NuzMYGVdDQINMf1SeQ3uxVeXOIXiFj8mJZU0bdK
         n+aBCzIiOYeGH7C/NJDpWzHkVezXIsOuNJqW/obmo8x1jisnkTd6kLQNt6xSNI+LmaOw
         vFdw==
X-Gm-Message-State: AOJu0Yz4VFJdEh5fUd+ljp6ofrcFkK4MJIjDXEG7QQ4yssNMBS6JO04H
	+H9qL+Pi1zaz1zuMoGxokvWUD/PG+sKgBQWh5VEnHQbSmSsk0ejrjDD3/g==
X-Google-Smtp-Source: AGHT+IF34GC2zjw3ILcydfrdcGbCtCq8kocU7Q66JTBHp7tgOAPJsD0Sc17utXxnKcdm3NHCC5ohrw==
X-Received: by 2002:a05:6512:3d04:b0:52e:9b15:1c60 with SMTP id 2adb3069b0e04-530bb3a5035mr11155570e87.48.1722944477156;
        Tue, 06 Aug 2024 04:41:17 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 0/2] Common device tree stuff
Date: Tue,  6 Aug 2024 13:41:12 +0200
Message-ID: <cover.1722941799.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current patch series introduces the common device tree functions
between several architectures: Arm, PPC, RISC-V.

Originally these patches were a part of Shawn's patch series [1].
At that moment it was v4 version of this patches.

After RISC-V started to need this changes these patches have been
rebased on top of the current staging with addional updates after
rebase.
For some time, these patches from v5 to v7 version were the part of
the patch series [2] but not to block almost ready patches for merging
it was decided to move them to separate patch series.

CI tests results:
 https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1402476423

[1]
https://lore.kernel.org/xen-devel/cover.1712893887.git.sanastasio@raptorengineering.com/

[2]
https://lore.kernel.org/xen-devel/cover.1721834549.git.oleksii.kurochko@gmail.com/
---
Changes in v2:
 - add Acked-by: Julien Grall <julien@xen.org> for Patch 2
 - rename xen/common/device_tree.c to xen/common/device-tree.c
 - update MAINTAINERS file: drop xen/common/device_tree.c from it.
 - make diff smaller using git's options:
      --diff-algorithm=minimal --find-renames
---

Shawn Anastasio (2):
  xen/device-tree: Move Arm's setup.c bootinfo functions to common
  xen/common: Move Arm's bootfdt.c to common

 MAINTAINERS                                   |   3 +-
 xen/arch/arm/Makefile                         |   1 -
 xen/arch/arm/include/asm/setup.h              | 198 +-------
 xen/arch/arm/include/asm/static-shmem.h       |   9 -
 xen/arch/arm/setup.c                          | 432 -----------------
 xen/common/Makefile                           |   2 +-
 xen/common/device-tree/Makefile               |   3 +
 .../arm => common/device-tree}/bootfdt.c      |  24 +-
 xen/common/device-tree/bootinfo.c             | 459 ++++++++++++++++++
 .../device-tree.c}                            |   0
 xen/include/xen/bootfdt.h                     | 209 ++++++++
 11 files changed, 694 insertions(+), 646 deletions(-)
 create mode 100644 xen/common/device-tree/Makefile
 rename xen/{arch/arm => common/device-tree}/bootfdt.c (98%)
 create mode 100644 xen/common/device-tree/bootinfo.c
 rename xen/common/{device_tree.c => device-tree/device-tree.c} (100%)
 create mode 100644 xen/include/xen/bootfdt.h

-- 
2.45.2


