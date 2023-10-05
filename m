Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4B37B9C7D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 12:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612943.953137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoLXl-0004T2-DN; Thu, 05 Oct 2023 10:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612943.953137; Thu, 05 Oct 2023 10:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoLXl-0004Py-8q; Thu, 05 Oct 2023 10:25:21 +0000
Received: by outflank-mailman (input) for mailman id 612943;
 Thu, 05 Oct 2023 10:25:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGTv=FT=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qoLXk-0004Gs-2S
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 10:25:20 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b39377f-6369-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 12:25:19 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-690f7d73a3aso702158b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Oct 2023 03:25:19 -0700 (PDT)
Received: from localhost ([122.172.81.92]) by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b001c61bde04a7sm1269088plj.276.2023.10.05.03.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 03:25:17 -0700 (PDT)
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
X-Inumbo-ID: 7b39377f-6369-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696501518; x=1697106318; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KWho0skhSMaRa5vCqQiBImFsTWWtuPWOPJgKv2q/8Qk=;
        b=pz7NtXOeyoTP3hDCZCboEBB9YefOnXoAzTfbJnj5jvl29izUmZe/vSzre70PPG0JzX
         an3ISZwuZjkEe4ot/byITdMqL+K5EqfTMzBFrScXs0ibevtpV6Kq5zTsIYRGT8OGPNpU
         ZeQQ7AcHpvD3CMUEscruvpnKcHm3lQ7axxbTdGbYTkOZgzVON/5MWFZgScFUIyRWbW+5
         p+BfhSEr9rtxzOf7393VD+kg7pTJIdK9xvRKkPoOf4NAca7d+5LM2BEPeZDns/F5Gn/p
         DhCVWDF+7hhW6jWzoAm3jSWlq+2O6rfzmFN1T/l1/F/p3V2XWbKzahX6DsNdaFkr1Ain
         beQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696501518; x=1697106318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWho0skhSMaRa5vCqQiBImFsTWWtuPWOPJgKv2q/8Qk=;
        b=TCVCLy1sNtzdWcvT7BCsfnHzkHhLWlj/crcq0Nzg4h2fSTSnyrPTv9eHFAPmdV9wNq
         edvN8Nun6ukgxlYiz5e/wJXnjKmH3DZCl9EviuV3TvpE9Bb82O6M73pdkCR5/kLOhb2Y
         x5EQ9WAfXHKWRlkiSS9HG/bUEe8AnQUPGkrBM+1oUtFi3b2r877K8fB+JLYoeb1c3VDo
         5e8QJIxeSlSfEnDdMW1Mx2I07G2QVPy3rY321Z7HIpX19XhfYZ3b+L/WriYlNAWnf5EA
         pWjwyhA2tUPQ/2AZcL4h7pOGurkIIhv5RttNudAOpmk6IM+9y8/2F6uqcl66eCK+FNCY
         FOTw==
X-Gm-Message-State: AOJu0Yx0aoP9q1kIF4e0KLlH3/VB+PyGfEVIwGGXaaWmjK4gWpgfRVNG
	cbprnuN00AgB0lFbwdburGr6Jg==
X-Google-Smtp-Source: AGHT+IFlvWBBJ3Zh3r7swaT7Jp7XiXCsFpaOJuViBtve0Y9fYaexTcbODWL0r8ZJ90UPDzLaoMipNA==
X-Received: by 2002:a05:6a20:3d1b:b0:12e:4d86:c017 with SMTP id y27-20020a056a203d1b00b0012e4d86c017mr5640315pzi.10.1696501517838;
        Thu, 05 Oct 2023 03:25:17 -0700 (PDT)
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
Subject: [PATCH V2 0/2] xen: privcmd: Add ioeventfd support
Date: Thu,  5 Oct 2023 15:55:10 +0530
Message-Id: <cover.1696500578.git.viresh.kumar@linaro.org>
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
 drivers/xen/privcmd.c             | 398 +++++++++++++++++++++++++++++-
 include/uapi/xen/privcmd.h        |  18 ++
 include/xen/interface/hvm/ioreq.h |  51 ++++
 6 files changed, 472 insertions(+), 8 deletions(-)
 create mode 100644 include/xen/interface/hvm/ioreq.h

-- 
2.31.1.272.g89b43f80a514


