Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87FC7BD9CF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 13:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614316.955329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpoSF-0006b7-GT; Mon, 09 Oct 2023 11:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614316.955329; Mon, 09 Oct 2023 11:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpoSF-0006YX-CS; Mon, 09 Oct 2023 11:29:43 +0000
Received: by outflank-mailman (input) for mailman id 614316;
 Mon, 09 Oct 2023 11:29:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkxv=FX=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qpoSE-0006Jg-Nk
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 11:29:42 +0000
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23413e81-6697-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 13:29:42 +0200 (CEST)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-694f3444f94so3593243b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Oct 2023 04:29:42 -0700 (PDT)
Received: from localhost ([122.172.81.92]) by smtp.gmail.com with ESMTPSA id
 a21-20020a62bd15000000b00693498a846esm6129376pff.80.2023.10.09.04.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 04:29:40 -0700 (PDT)
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
X-Inumbo-ID: 23413e81-6697-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696850980; x=1697455780; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VA2GT8eqbiQpihVq6IatV7jxO70qnqwP/ImeaPQmFQY=;
        b=c9oM6zsol6JCwa4xxFuBsBG/UuQZYKKj/y+jp9pD2P7U2m+YT1oqqYbQrioiEKROA4
         FhC1vXcdUEECD76bK/GaMaxUCNFR/i/wY32NzDkMxdHHNpRQBaruase9cgOjVwjD4b4L
         9DlOfOcE4wHviKGTGK71och7M/ZgQ/vwnI0WC7wjssJuDryPO15pcTObmljzUXC9hPgP
         AveV5/QnVKZyj1qYGbknKJk8Lc1SSkEDPcTPG9JrMmXZHS64sUzS571mBEmpx8sBGnxj
         fbfURCqKFU2aYCIYRVXcK6HsmqIi9alIqovYTkAeUyuXl9mh/ZQfwauwx/ZJ9kL/CPTG
         +GAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696850980; x=1697455780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VA2GT8eqbiQpihVq6IatV7jxO70qnqwP/ImeaPQmFQY=;
        b=IB3zrEVBXSAizmza9OPXaXotGdJCod7j1i7WUpCjP+3i8MrX2amX9hInZiZmFBODfc
         H5mTEGXaEvj/7aVyyuSIwogeuTkNtUg01xd1onfCYizdnhUisdBBbiNs9BXy74p7yxMf
         +vENGaVChkQBrhMGIkiLlwAoa5cozKfKX7tFgEqy+1tIRWqiBSFafcNs2oXSN/8cv00z
         cSRnfEqgxXCnsF7RNsVm0pz3X3NI2KJ6y4zQ7DEa1yNn6rY6dW2fyHYfkp8PxBacahIi
         fDqU6vm6Hi+Edzwu/MFpVQIFhfFf+fJq5gt0bFi3IGe/OOnZNiK9rm8IdPaxZAw3x7HW
         6Qhg==
X-Gm-Message-State: AOJu0YzbIm2rVCidbEJ2piXxu3H3ZwC6KP72UYjQusyfqEIF8Gt1f8/q
	U0dwzaXF3kSy9oha4+nriM8sCA==
X-Google-Smtp-Source: AGHT+IGb6yho3N2vKqm69w/2J2A7jX8tPga8/bSYK0Z0iBic3N7lSd2HTvgeG7X2IAqd1oF0NoQoWA==
X-Received: by 2002:a05:6a00:22c9:b0:690:2ecd:a593 with SMTP id f9-20020a056a0022c900b006902ecda593mr19268889pfj.26.1696850980690;
        Mon, 09 Oct 2023 04:29:40 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 1/2] xen: evtchn: Allow shared registration of IRQ handers
Date: Mon,  9 Oct 2023 16:59:24 +0530
Message-Id: <8380c7b1c8cd9edb2e45e9a204650b34df3458a7.1696850733.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1696850733.git.viresh.kumar@linaro.org>
References: <cover.1696850733.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the handling of events is supported either in the kernel or
userspace, but not both.

In order to support fast delivery of interrupts from the guest to the
backend, we need to handle the Queue notify part of Virtio protocol in
kernel and the rest in userspace.

Update the interrupt handler registration flag to IRQF_SHARED for event
channels, which would allow multiple entities to bind their interrupt
handler for the same event channel port.

Also increment the reference count of irq_info when multiple entities
try to bind event channel to irqchip, so the unbinding happens only
after all the users are gone.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/xen/events/events_base.c | 3 ++-
 drivers/xen/evtchn.c             | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index c7715f8bd452..d72fb26cc051 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1238,7 +1238,8 @@ static int bind_evtchn_to_irq_chip(evtchn_port_t evtchn, struct irq_chip *chip,
 		bind_evtchn_to_cpu(evtchn, 0, false);
 	} else {
 		struct irq_info *info = info_for_irq(irq);
-		WARN_ON(info == NULL || info->type != IRQT_EVTCHN);
+		if (!WARN_ON(!info || info->type != IRQT_EVTCHN))
+			info->refcnt++;
 	}
 
 out:
diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
index c99415a70051..43f77915feb5 100644
--- a/drivers/xen/evtchn.c
+++ b/drivers/xen/evtchn.c
@@ -397,7 +397,7 @@ static int evtchn_bind_to_user(struct per_user_data *u, evtchn_port_t port)
 	if (rc < 0)
 		goto err;
 
-	rc = bind_evtchn_to_irqhandler_lateeoi(port, evtchn_interrupt, 0,
+	rc = bind_evtchn_to_irqhandler_lateeoi(port, evtchn_interrupt, IRQF_SHARED,
 					       u->name, evtchn);
 	if (rc < 0)
 		goto err;
-- 
2.31.1.272.g89b43f80a514


