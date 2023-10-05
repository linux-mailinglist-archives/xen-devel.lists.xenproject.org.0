Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93647B9C7C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 12:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612944.953146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoLXo-0004hu-Na; Thu, 05 Oct 2023 10:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612944.953146; Thu, 05 Oct 2023 10:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoLXo-0004fJ-KM; Thu, 05 Oct 2023 10:25:24 +0000
Received: by outflank-mailman (input) for mailman id 612944;
 Thu, 05 Oct 2023 10:25:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGTv=FT=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qoLXn-0004Gs-Lc
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 10:25:23 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d5fd71f-6369-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 12:25:23 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6907e44665bso684231b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Oct 2023 03:25:23 -0700 (PDT)
Received: from localhost ([122.172.81.92]) by smtp.gmail.com with ESMTPSA id
 g6-20020a62e306000000b0068fe23b8792sm1055988pfh.176.2023.10.05.03.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 03:25:20 -0700 (PDT)
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
X-Inumbo-ID: 7d5fd71f-6369-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696501521; x=1697106321; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VA2GT8eqbiQpihVq6IatV7jxO70qnqwP/ImeaPQmFQY=;
        b=CI+Sf3iBgZgrPDHPCbnhK3JsTUXvLl33YZkCEohu1wMZkawyqfHJGBOeMdb1V1rSt4
         CNzj2CHMUeUkFyj6ZWovn+Cx/szBwjCuvxr7hVc56u3LKnfg5xSdN268k428JelRYWAY
         SRGnz2WCb2nVyVg/VmPn+jq8lTHTjBiaCmp3mgtLGu/PgwE0ALpYnMd2rYSk2MuzpzUc
         KQKhUmd4qeWAKL87Ttz6Gl+FqOU8jQxs4DhJ6git18tYTQWNGxLwwXOKzmmDx9br4h0p
         jLwN9qW8wsNrig+/5YiWjvwotApPs2d9ys7W476G9gY3hHi0wxqy38i/5T1smXv9/LXs
         rbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696501521; x=1697106321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VA2GT8eqbiQpihVq6IatV7jxO70qnqwP/ImeaPQmFQY=;
        b=iWxm85jRANWHsyyQrMicAORKoqUhGY9B0fsI0KA79aGyLWxmM5fmQq/QY4BYY4BJ6U
         xLKcHsDRxAol+pMuw8wPxNjKYPMWA/vgyXz1txZ0OJV+9c0R7GGPfc/AwO+vS3LCdNFO
         hENla8Lw7SJ8D+n0uescJ2LJ05xV9ZnqCsWfbqfRRBzwMiCQUJGBUmEcV+rF1wgkOWLY
         mqZRlAsD+Iv8mOlcphCkyVxdl3fy9Di+Vn799ZdzPYZF1xYODnGrEN4y+YZM95MLMAdu
         8cEH0K9ikx0eCE3Y9AyND/vRRu8l7l0oXnNRhCC79jCvEjVvJFZomoS4oGBujT2aF0FA
         1gvQ==
X-Gm-Message-State: AOJu0YyLJAd8djGgtuxzFFuSAGZIMHcrICvMIpXcJ3RBcSTKzOIiOIfN
	N9bOuk2ynZHQBi2+HSstAycz5Q==
X-Google-Smtp-Source: AGHT+IFVyZfwPYortU/vCd/KtcZf9ROm2DtiD8fm0D3u1191c/tmNd0xEGXS4Lh56+iNRP/lGDs57g==
X-Received: by 2002:a05:6a00:2d8d:b0:68e:236a:93d9 with SMTP id fb13-20020a056a002d8d00b0068e236a93d9mr5460543pfb.17.1696501521543;
        Thu, 05 Oct 2023 03:25:21 -0700 (PDT)
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
Subject: [PATCH V2 1/2] xen: evtchn: Allow shared registration of IRQ handers
Date: Thu,  5 Oct 2023 15:55:11 +0530
Message-Id: <8380c7b1c8cd9edb2e45e9a204650b34df3458a7.1696500578.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1696500578.git.viresh.kumar@linaro.org>
References: <cover.1696500578.git.viresh.kumar@linaro.org>
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


