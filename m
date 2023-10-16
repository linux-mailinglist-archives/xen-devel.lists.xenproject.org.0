Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAED67CA026
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 09:12:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617260.959727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsHlX-0002Pf-CQ; Mon, 16 Oct 2023 07:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617260.959727; Mon, 16 Oct 2023 07:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsHlX-0002Mt-8m; Mon, 16 Oct 2023 07:11:51 +0000
Received: by outflank-mailman (input) for mailman id 617260;
 Mon, 16 Oct 2023 07:11:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hqiJ=F6=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qsHlV-000281-08
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 07:11:49 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41c6bd0a-6bf3-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 09:11:43 +0200 (CEST)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-578e33b6fb7so2409141a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Oct 2023 00:11:42 -0700 (PDT)
Received: from localhost ([122.172.80.14]) by smtp.gmail.com with ESMTPSA id
 lb18-20020a17090b4a5200b002636dfcc6f5sm4069757pjb.3.2023.10.16.00.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 00:11:40 -0700 (PDT)
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
X-Inumbo-ID: 41c6bd0a-6bf3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697440301; x=1698045101; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d9BgW3N7fBm3L3q4onC3IgvyssbSs3COoJlmjYvy67c=;
        b=jConirPWhXO5zfbTdR4kGgqwO/C966C7xHwTqDS22mpuoO3uHML9yio38tL2VVHy/N
         d70gGsOcVIUmBTK5NW9hUoeErLAKwuGCQnojLtMmZy1JxhBaIhwno646Jt2qxI5lgbIg
         ZSWCMzfSZ6KEWbzfsdEraal5oY4r7J6OmC5lC4tme7k8AzTzWamp0pkO3ZHcSPIZ+u21
         dKQ20AIhjb1W6f/v6oDtM3/Ie+97r32ussLE1qkTFU3WBBz8VPGGI84fZlSlo42XYaG3
         Bf2giFVKyyR1kxDC+pTCqIqH9jaApa/kG7zJ7yYHmqfH9toOhrD/2SzwoyhIW3p7u9NM
         oldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697440301; x=1698045101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9BgW3N7fBm3L3q4onC3IgvyssbSs3COoJlmjYvy67c=;
        b=ipk3P36ZGROWXKIUd0TMEf5UYBQDQ8jcfLDAFyA9r5UsgUmGKpMMk3zCgW+wgfx6Iz
         +wl04xGu0seIKGn8F++2r7PC+mQbI3GsGu1TOBby2NyeFsGRc7mnLpPF23e7PP6p0Mys
         74oNzQ0JkbvCu1QfqjoJzUeB7VMU1IA6w19wfpd3h3A6rrzhMizFuv81ZbjxbVW2tBRn
         Ikl0UbO0UrBLHqwlZUE4zOGEfe/DJ5WDP86C3whzeJj/V+0FOEsD40xzcL/ty8aBYLhU
         76Da4iVCrVEUP3zoYB7oSv1JM4SniSY11euS2W7H0ZkpGzx66s9VmFfoiHxXtuFTuBRn
         auSQ==
X-Gm-Message-State: AOJu0YwOGNlfy4MAYT+iLDB7gSxldBbgZu9/0j52gcNfJZQ9dnFFkadg
	kf9SPzX5/E3M5ZZpKdne1wotvA==
X-Google-Smtp-Source: AGHT+IEIs6XIz4BcgrL6UjHqZ7eccrdQBeHu6/iJs/nkUOuVV60OXfEgZzK/h9q3JanneEdJ0Z+E/A==
X-Received: by 2002:a05:6a20:244f:b0:152:be08:b013 with SMTP id t15-20020a056a20244f00b00152be08b013mr34042875pzc.42.1697440301401;
        Mon, 16 Oct 2023 00:11:41 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH V4 0/4] xen: privcmd: Add ioeventfd and fix irqfd support
Date: Mon, 16 Oct 2023 12:41:23 +0530
Message-Id: <cover.1697439990.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Now that irqfd support (backend to guest interrupt) is already merged, this
series solves the other part of the problem, i.e. ioeventfd (guest to
backend interrupt).

More details inside the commits.

Arnd reported few issues with the ioctl macro usage and argument's layout, fixed
them for irqfd too, which was added recently.

--
Viresh

V3->V4:
- Use __u64 for indirect pointers in an ioctl command's arguments.
- Use u64_to_user_ptr() in kernel driver to access the same.
- Use _IOW() macro instead of the internal one: _IOC().

V2->V3:
- Remove explicit barriers and depend on spin lock instead to take care of it.
- Move check for empty ioeventfds list to privcmd_ioeventfd_deassign(), which
  could earlier call ioreq_free() even when the list wasn't empty and so we
  returned without printing a warning in v1 earlier. V2 implemented it
  incorrectly.

V1->V2:
- Increment irq_info refcnt only for valid info.
- Use u64 type for addr.
- Add comments for use of barriers.
- Use spin lock instead of mutex as we need to use them in irq handler.
- Add a warning when kioreq is getting freed and ioeventfds list isn't empty.
- Use struct_size().
- Validate number of vcpus as well.

Viresh Kumar (4):
  xen: Make struct privcmd_irqfd's layout architecture independent
  xen: irqfd: Use _IOW instead of the internal _IOC() macro
  xen: evtchn: Allow shared registration of IRQ handers
  xen: privcmd: Add support for ioeventfd

 drivers/xen/Kconfig               |   8 +-
 drivers/xen/events/events_base.c  |   3 +-
 drivers/xen/evtchn.c              |   2 +-
 drivers/xen/privcmd.c             | 407 +++++++++++++++++++++++++++++-
 include/uapi/xen/privcmd.h        |  22 +-
 include/xen/interface/hvm/ioreq.h |  51 ++++
 6 files changed, 482 insertions(+), 11 deletions(-)
 create mode 100644 include/xen/interface/hvm/ioreq.h

-- 
2.31.1.272.g89b43f80a514


