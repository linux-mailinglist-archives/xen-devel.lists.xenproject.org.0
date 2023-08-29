Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB90278C43F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 14:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592179.924820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxqm-0007sn-NH; Tue, 29 Aug 2023 12:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592179.924820; Tue, 29 Aug 2023 12:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxqm-0007r7-Jy; Tue, 29 Aug 2023 12:29:40 +0000
Received: by outflank-mailman (input) for mailman id 592179;
 Tue, 29 Aug 2023 12:29:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o+c=EO=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qaxql-0007qv-0K
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 12:29:39 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7542eee-4667-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 14:29:37 +0200 (CEST)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bc83a96067so26004615ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Aug 2023 05:29:37 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 jk17-20020a170903331100b001b890b3bbb1sm9283856plb.211.2023.08.29.05.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 05:29:35 -0700 (PDT)
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
X-Inumbo-ID: b7542eee-4667-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693312176; x=1693916976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKbwyfCALitLKoKlIDCh6sF2GuUR8Sqy+xkbEnTQwwU=;
        b=KdcpUBq2OTq/PnFjVlXJbCYFO77GkGucPveUjH0DVqOFDw+fgGsVKqxZUi0v2bU0WV
         VSAu9VOiNaH2BR+mQpfy2kJm+q+OofIt2DC2Ou6uQV1aAnCCsnd42N7LzpmuXbETP5t2
         f3ljXFEnBkrKBalr4UeQnrguDfRp5h2AjXOYnqCxbZ8+waeLvDjTJaDIsCYnZ9VSPtLC
         9KWwGdn4tO3sBxIQ3swZm1vmCNRuJGAjWl3vXzGu4eSkc+dPs8Z/HlyNQLfVW8orp3DJ
         wjYHQhTq+9ZDm4tEmJXoTgBfpMwKKVQiaw8Qb2ycAeMDZ/jEy6Pc6DWmW8+II4D3kxXF
         IteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693312176; x=1693916976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKbwyfCALitLKoKlIDCh6sF2GuUR8Sqy+xkbEnTQwwU=;
        b=fqKXFLKNk6PSBjKrfmwvdJt9lR59GbDMY1V80en2jX52UmKw0MoYd1zrzuvsTDpZGC
         aglXNMY8U9+iLipFfhJzVMmWl9lMjnDpfoUYVT0qRTmzBoVf2qc1pVa5LlOO7KPY6zPj
         lDJPt0rYqhBnfx/l/+0qUd3oVextGAzPlhcgDik/dADFdr37SHSYIpABFrKsspIe8OQ1
         G8FZ5bSOQaGjjcHKyLxv/MnEreyvFsWg6uYMbbl0ES/pduSn4+MdCCw2x1xjMTLEEhDX
         RuO78UU/2c7rzeIb5N81RSD0oFv/UE8jtgxOckzeHpxwiirpvuvD20Mgt1SlTKitOgqK
         m8IA==
X-Gm-Message-State: AOJu0Ywsi8CDoe1FaVxKf2i2asEuQ2ixyfETofibtVhpMpk4HxP96Ek4
	/B0eMHE14CvRGpkk6v/+tsDC0w==
X-Google-Smtp-Source: AGHT+IFdALvVH/LLFMq7HiI4jOkzdLWO6KSMfUWcATxGspR40vgDCT+XEqCh2JK3OtEhDSe9mzbx2g==
X-Received: by 2002:a17:902:efd3:b0:1bd:f7d7:3bcd with SMTP id ja19-20020a170902efd300b001bdf7d73bcdmr20457818plb.50.1693312176301;
        Tue, 29 Aug 2023 05:29:36 -0700 (PDT)
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
Subject: [PATCH 1/2] xen: evtchn: Allow shared registration of IRQ handers
Date: Tue, 29 Aug 2023 17:59:04 +0530
Message-Id: <fc6d47de76a8b77d0a1b4bc8204694c079715f2e.1693311370.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1693311370.git.viresh.kumar@linaro.org>
References: <cover.1693311370.git.viresh.kumar@linaro.org>
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
 drivers/xen/events/events_base.c | 1 +
 drivers/xen/evtchn.c             | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index c7715f8bd452..0182680dab3a 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1239,6 +1239,7 @@ static int bind_evtchn_to_irq_chip(evtchn_port_t evtchn, struct irq_chip *chip,
 	} else {
 		struct irq_info *info = info_for_irq(irq);
 		WARN_ON(info == NULL || info->type != IRQT_EVTCHN);
+		info->refcnt++;
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


