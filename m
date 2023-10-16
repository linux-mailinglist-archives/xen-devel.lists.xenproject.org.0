Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC7B7CA027
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 09:12:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617262.959748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsHlZ-0002tx-Sx; Mon, 16 Oct 2023 07:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617262.959748; Mon, 16 Oct 2023 07:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsHlZ-0002ry-ON; Mon, 16 Oct 2023 07:11:53 +0000
Received: by outflank-mailman (input) for mailman id 617262;
 Mon, 16 Oct 2023 07:11:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hqiJ=F6=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qsHlY-00027t-Tp
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 07:11:52 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47739e03-6bf3-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 09:11:52 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6b3c2607d9bso1835830b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Oct 2023 00:11:52 -0700 (PDT)
Received: from localhost ([122.172.80.14]) by smtp.gmail.com with ESMTPSA id
 k9-20020aa79729000000b006bd6a0a4678sm2187567pfg.80.2023.10.16.00.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 00:11:50 -0700 (PDT)
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
X-Inumbo-ID: 47739e03-6bf3-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697440311; x=1698045111; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VA2GT8eqbiQpihVq6IatV7jxO70qnqwP/ImeaPQmFQY=;
        b=Jxyvg7d8pOCxdWGYaY2UT9yMIh3HCCtv3E/iagI6nEM6mMsPCvEhk4dvfYKFX4ENWe
         WW0oT+NRmaTwhfJXPrJ435D2rGXofhsXnfc+RxofKkWJLXtFRtk9Lj0aIxt0x8TohG3U
         J8bCjtqJHLilVs7nUb7FvGH/VlgJPQMBp8a1wSjLGA3Kp/oogjtujaWmYuEoZAGNilGi
         HEeHqb1oUVfoDO0Yvl+yHIQgJnuY/BvejycV70AGWABInUe8Do7Vmb0QsjLMsQWha991
         dk00zljpcMW3bPkMqRsB0JW2HsZMVN9adlcnUk4FQ+pIgyhNmBsYZaAn33yB4fVFpPWJ
         KDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697440311; x=1698045111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VA2GT8eqbiQpihVq6IatV7jxO70qnqwP/ImeaPQmFQY=;
        b=Vth7J5nyeP1bBAKXs958Hv6TYf0gx4xPmXOEcPBZCMjM1JgI3aMf/1EejXgY1G3ytW
         nVhr6vQUt3QitS+X114dQS4Thu8ps6CX/kNJe/BSML9l9Lqa8QPlvgKCMPghfIaTwpzw
         XqU3HJgHA4X8946h13jG6ygKFZREvamwj2zCNUMWxgMr1PNiRBcoEoQUe03B/oJeFZWI
         0D6WPAq1rFjf+le07vNfQzsOg1nOEaIycSxZHyGOXOSbroMEUxL5o6eIbPuSNzbvdMaF
         LmSBWssBLWZkgH9JZMZdap2fdPJyORRI/iv9FeuitWLwts1sROPWmg5MmVp+oX/8/1wu
         Nt7A==
X-Gm-Message-State: AOJu0Yz0uA3Rg28LMqZ3FeKWbhxad4LMbt2TiCs+o7g1ojKn5AxxjtaN
	AaY5ao0FF2P2fBIzYuPH6n+f1w==
X-Google-Smtp-Source: AGHT+IG/g2mNU9z+9wRsIf1tsYOLUhccvghdEO7aXTxMy+dng7C4gaQ2AOy/3vVl1wB0/a7ioozUXg==
X-Received: by 2002:a05:6a00:23ce:b0:68e:3f0b:5e6f with SMTP id g14-20020a056a0023ce00b0068e3f0b5e6fmr35005262pfc.24.1697440311003;
        Mon, 16 Oct 2023 00:11:51 -0700 (PDT)
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
	Arnd Bergmann <arnd@kernel.org>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 3/4] xen: evtchn: Allow shared registration of IRQ handers
Date: Mon, 16 Oct 2023 12:41:26 +0530
Message-Id: <99b1edfd3147c6b5d22a5139dab5861e767dc34a.1697439990.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1697439990.git.viresh.kumar@linaro.org>
References: <cover.1697439990.git.viresh.kumar@linaro.org>
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


