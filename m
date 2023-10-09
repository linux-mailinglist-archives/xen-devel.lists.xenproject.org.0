Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7BB7BD9D0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 13:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614315.955318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpoSE-0006Mi-8I; Mon, 09 Oct 2023 11:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614315.955318; Mon, 09 Oct 2023 11:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpoSE-0006Jm-5M; Mon, 09 Oct 2023 11:29:42 +0000
Received: by outflank-mailman (input) for mailman id 614315;
 Mon, 09 Oct 2023 11:29:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkxv=FX=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qpoSC-0006Jg-D7
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 11:29:40 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21641c66-6697-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 13:29:39 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c60f1a2652so32391385ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Oct 2023 04:29:39 -0700 (PDT)
Received: from localhost ([122.172.81.92]) by smtp.gmail.com with ESMTPSA id
 b10-20020a170903228a00b001b03a1a3151sm9357515plh.70.2023.10.09.04.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 04:29:36 -0700 (PDT)
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
X-Inumbo-ID: 21641c66-6697-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696850977; x=1697455777; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Tdfc33f4Wm5FyFF+cSLn1Dj1lOMRUny12yMiSOCHJc=;
        b=RpXGuZZlrzy191g4Ho01OcGYgdeIMTzq98i8eE/QkMPYYd/Tj4db2ZFIOVK5tQF8iL
         NhsdUVmaHnkwhW8UfNxTks++jPYqx2Vf9po0YoqX6GR5dUeVPmaFmcjsHmPvufco/d3r
         b+ycJMbLV9ZYad5kqqyvdoV4tOqXo/0SyZSl8hmoKsc8bxPNZf5xu0aA93um/vRAYPms
         ibo8zKT8IbtWLw9+CkgfX+/OvRR9Wbhm1yWgs0S20Tz6c6RPRhNnFSNl1SUhOIEJIldi
         IS5QXFJtqAs6kItS6sXUnnNk3lj+dgi3lJ9Imo7N8NZmK4HvUUh3FabG9GUqJnYeVhR7
         HK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696850977; x=1697455777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Tdfc33f4Wm5FyFF+cSLn1Dj1lOMRUny12yMiSOCHJc=;
        b=HoK3S7a+1yOWHazG9mES4LLsP3e8eCzJyqNZUWRdWPP6dazrgehoqYgrze1f6GqYB+
         r6ZV0qRbhSBeregHXCb7HT1lgFM2GYqiUm90Pw3dVebCnex+mK/nNvOIMhmFcOwnDbNZ
         g6L9YCX5uGcY6WDu4Fn7zK8G7jKsjMD4SB3iCmqu+e4Py4tOPTLoDykAw07Rv7rejOit
         Ufawe3rBpFJQHETLrZXFhkLc+dqfSsmxMrKNHlt/5XY4t+lduHcFLYxIj9LkiuEMO/B0
         Iqsi4Yqw14HujL0VJAp+IjSNM4S3v+BzAItZi7u6sucOdag3/VLQInMfpoEWNZ3TR+SI
         YFJA==
X-Gm-Message-State: AOJu0YyKIxXMLM16zEpsfJNgAnCGLrMUyp7IHwxJHROBcXAP8O44Brl1
	LMGMcVqTfvRXiZNAE78kLuB4cA==
X-Google-Smtp-Source: AGHT+IH3QKti6SrLc7Vbwklr4lokjNXQqdplcm3TYHJl/kWr314EMtmtgjCJcVE1fLl4T8F1t7doZw==
X-Received: by 2002:a17:902:c70b:b0:1c6:2866:5aeb with SMTP id p11-20020a170902c70b00b001c628665aebmr11765287plp.9.1696850977501;
        Mon, 09 Oct 2023 04:29:37 -0700 (PDT)
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
Subject: [PATCH V3 0/2] xen: privcmd: Add ioeventfd support
Date: Mon,  9 Oct 2023 16:59:23 +0530
Message-Id: <cover.1696850733.git.viresh.kumar@linaro.org>
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

Viresh Kumar (2):
  xen: evtchn: Allow shared registration of IRQ handers
  xen: privcmd: Add support for ioeventfd

 drivers/xen/Kconfig               |   8 +-
 drivers/xen/events/events_base.c  |   3 +-
 drivers/xen/evtchn.c              |   2 +-
 drivers/xen/privcmd.c             | 405 +++++++++++++++++++++++++++++-
 include/uapi/xen/privcmd.h        |  18 ++
 include/xen/interface/hvm/ioreq.h |  51 ++++
 6 files changed, 479 insertions(+), 8 deletions(-)
 create mode 100644 include/xen/interface/hvm/ioreq.h

-- 
2.31.1.272.g89b43f80a514


