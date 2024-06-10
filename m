Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75842901B70
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 08:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736899.1142950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYuf-0001r7-WE; Mon, 10 Jun 2024 06:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736899.1142950; Mon, 10 Jun 2024 06:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYuf-0001on-SC; Mon, 10 Jun 2024 06:53:53 +0000
Received: by outflank-mailman (input) for mailman id 736899;
 Mon, 10 Jun 2024 06:53:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMhB=NM=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sGYue-0001oX-5t
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 06:53:52 +0000
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [2a00:1450:4864:20::641])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fd63ba6-26f6-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 08:53:48 +0200 (CEST)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-a6f177b78dcso95409266b.1
 for <xen-devel@lists.xenproject.org>; Sun, 09 Jun 2024 23:53:47 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1e6795b9sm107981966b.174.2024.06.09.23.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 23:53:46 -0700 (PDT)
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
X-Inumbo-ID: 2fd63ba6-26f6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718002427; x=1718607227; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ydBCMucw8T2ZNRmg/cuXstuBHa/XNErLk9auQP/k8g=;
        b=dHkH9gu+PexT7opiJbEyLr7t2r5W8m1YZMJrAlsdV6iINOJ9+sW+3glTj5HBu0uTRJ
         CdVslleygNUnzYIoxjWP91foO2dj2mXnT9fH/oAttlhT5ZGYULXh0X7yCoDUxlf8Y4J5
         cGZ7/o9eVBjNlt1TL8nZp0w2ijsMiWo29eaUziIcZogDV0ohzuyF5I2erJ7+PwWHQUGg
         CajP477rtPcV5qSg4Si+OrE4YXrmyugbNNhIGOIObFejrnrygZ524LUXFP/ZEt8vQ+3i
         wIp7cnJQ48wdkDPdHhb63RufWwlTXukXIg8ybVcL3eCChHyyqVYzJ2CCeLlXt/SzwkoG
         fV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718002427; x=1718607227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ydBCMucw8T2ZNRmg/cuXstuBHa/XNErLk9auQP/k8g=;
        b=Sbnm9VExG50m2jYwXxd12wZQfOHgFpXofwxqMkSbO6DtTQ2cal9oucfa1zLbt4Kqt7
         +1LZVzZrHBz7ZoHY9XLLLB4HjZ2S79ElzX5SWskfnZvQKLVL5yqe4k+utU8GV9XeOvG/
         erSRzQFOwhFWIqNFrcavemvxhxU5UH10cOcwTRUtlxDcZtyx8MIKmvG2Z0w03hVTpHw4
         oS1dqFaYCUNITELEGxk0fFIeQ63v8KYHwTm6+A56Md9Vo4iz6aLVOuwYA5/FHo1e4qGs
         D6cSTeLiZnmK/fLzlRHqs819bdMimyxHWAkb5MUNDOnh1V3+hwCygc/ggCcqjtgTfj5X
         TkwA==
X-Gm-Message-State: AOJu0Yx8r4aBAEvLxV0NA2XgXVv1Xj3WkQg8xWrmDf9IkaJse++hnJRQ
	o5Wns2P2nsXaC0M9DNH2MJDxQVFNkQXgbft5XTXsXTt7bO/xuccA9/h+dWQHtQx8Z2gdu7YIAhf
	8PpYVKw==
X-Google-Smtp-Source: AGHT+IE83438JhKbRk+s8D/haJ85GMQd9q5RFeQuWrLdFH3yc7ZyFidDJlQegYEqPB1u0RzRrsecew==
X-Received: by 2002:a17:906:f20b:b0:a6f:268a:1fc4 with SMTP id a640c23a62f3a-a6f268a2031mr45606166b.61.1718002426704;
        Sun, 09 Jun 2024 23:53:46 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v6 0/7] FF-A notifications
Date: Mon, 10 Jun 2024 08:53:36 +0200
Message-Id: <20240610065343.2594943-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch set adds support for FF-A notifications. We only support
global notifications, per vCPU notifications remain unsupported.

The first three patches are further cleanup and can be merged before the
rest if desired.

A physical SGI is used to make Xen aware of pending FF-A notifications. The
physical SGI is selected by the SPMC in the secure world. Since it must not
already be used by Xen the SPMC is in practice forced to donate one of the
secure SGIs, but that's normally not a problem. The SGI handling in Xen is
updated to support registration of handlers for SGIs that aren't statically
assigned, that is, SGI IDs above GIC_SGI_MAX.

The patch "xen/arm: add and call init_tee_secondary()" provides a hook for
register the needed per-cpu interrupt handler in "xen/arm: ffa: support
notification".

The patch "xen/arm: add and call tee_free_domain_ctx()" provides a hook for
later freeing of the TEE context. This hook is used in "xen/arm: ffa:
support notification" and avoids the problem with TEE context being freed
while we need to access it when handling a Schedule Receiver interrupt. It
was suggested as an alternative in [1] that the TEE context could be freed
from complete_domain_destroy().

[1] https://lore.kernel.org/all/CAHUa44H4YpoxYT7e6WNH5XJFpitZQjqP9Ng4SmTy4eWhyN+F+w@mail.gmail.com/

Thanks,
Jens

v5->v6:
- Added Betrands R-B for "xen/arm: add and call tee_free_domain_ctx()",
  "xen/arm: add and call init_tee_secondary()"
- Added Juliens A-B for "xen/arm: allow dynamically assigned SGI handlers"
- Updated "xen/arm: ffa: support notification", details in the patch

v4->v5:
- Added two new patches "xen/arm: add and call init_tee_interrupt()" and
  "xen/arm: add and call tee_free_domain_ctx()"
- Updated "xen/arm: ffa: support notification", details in the patch

v3->v4:
- "xen/arm: ffa: support notification" and
  "xen/arm: allow dynamically assigned SGI handlers" updated as requestsed,
  details in each patch.

v2->v3:
- "xen/arm: ffa: support notification" and
  "xen/arm: allow dynamically assigned SGI handlers" updated as requestsed,
  details in each patch.

v1->v2:
- "xen/arm: ffa: support notification" and
  "xen/arm: allow dynamically assigned SGI handlers" updated as requestsed,
  details in each patch.
- Added Bertrands R-B for "xen/arm: ffa: refactor ffa_handle_call()",
  "xen/arm: ffa: use ACCESS_ONCE()", and
  "xen/arm: ffa: simplify ffa_handle_mem_share()"



Jens Wiklander (7):
  xen/arm: ffa: refactor ffa_handle_call()
  xen/arm: ffa: use ACCESS_ONCE()
  xen/arm: ffa: simplify ffa_handle_mem_share()
  xen/arm: allow dynamically assigned SGI handlers
  xen/arm: add and call init_tee_secondary()
  xen/arm: add and call tee_free_domain_ctx()
  xen/arm: ffa: support notification

 xen/arch/arm/domain.c              |   1 +
 xen/arch/arm/gic.c                 |  12 +-
 xen/arch/arm/include/asm/gic.h     |   2 +-
 xen/arch/arm/include/asm/tee/tee.h |  14 +
 xen/arch/arm/irq.c                 |  18 +-
 xen/arch/arm/smpboot.c             |   2 +
 xen/arch/arm/tee/Makefile          |   1 +
 xen/arch/arm/tee/ffa.c             | 105 +++++--
 xen/arch/arm/tee/ffa_notif.c       | 425 +++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_partinfo.c    |   9 +-
 xen/arch/arm/tee/ffa_private.h     |  56 +++-
 xen/arch/arm/tee/ffa_shm.c         |  33 +--
 xen/arch/arm/tee/tee.c             |  14 +-
 xen/include/public/arch-arm.h      |  14 +
 14 files changed, 643 insertions(+), 63 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_notif.c

-- 
2.34.1


