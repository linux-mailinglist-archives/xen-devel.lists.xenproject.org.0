Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97C33F6F6D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 08:23:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171786.313474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mImIz-0007Te-3r; Wed, 25 Aug 2021 06:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171786.313474; Wed, 25 Aug 2021 06:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mImIz-0007QZ-01; Wed, 25 Aug 2021 06:22:33 +0000
Received: by outflank-mailman (input) for mailman id 171786;
 Wed, 25 Aug 2021 06:22:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yhNK=NQ=gmail.com=cgel.zte@srs-us1.protection.inumbo.net>)
 id 1mImIx-0007QT-DF
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 06:22:31 +0000
Received: from mail-qk1-x72c.google.com (unknown [2607:f8b0:4864:20::72c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24d099ed-94c9-43b7-9347-24b4ace46ac8;
 Wed, 25 Aug 2021 06:22:30 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id e14so25955165qkg.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Aug 2021 23:22:30 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id s204sm12320061qke.109.2021.08.24.23.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 23:22:30 -0700 (PDT)
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
X-Inumbo-ID: 24d099ed-94c9-43b7-9347-24b4ace46ac8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=izl1y+WlTmO5QOWs7e/KaDQxMK8mxtFtlYdxklpsPvo=;
        b=aj9dQlbVIy1l2igc9/Dx/Jr1171aaG5ecch0A7PrWTkRJG1Vbq/pIECncWQiwlZnkw
         UJ1OjMyNB+F+IkqQ4VA4K7cPEqZ+KGDDMwd4fFCCtWMKJwOBuMmAUYSiE6jdyQyLduh+
         C5bAYELEMAwwDfffmGEWGrHKKAB4Z/cpVmzZnuQ7RvSIgrCiu+daRDx+mXGQTAaQVi6D
         mIoor09h6qFFHcpP52aqDyMaaX+/otNEcDi5oVCVZ3jtEpGpHKHMWQpT1o5cdEY8C4wp
         9gTTlYqkww+Z1uPZzUh0kqBwlfZWEMdvOk0MWqrLMkKLRkVkQZIhZ//a/nI5IAemVjui
         gVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=izl1y+WlTmO5QOWs7e/KaDQxMK8mxtFtlYdxklpsPvo=;
        b=ZKXjk/qhnH2qxGrYjQfRZD/ekgVV5qg0M8eRGfKgHopfv/kaMJAR0N7Ymf6+k5wU7R
         +o6O54g7Du8hebvFppb2n7L7qln73crLt9zVSrXjMUY5eZpU0WOZGYHtbmJngl9WC3qM
         XckRGDMxt0IgvBP5JJt5UcLlcwz3QPYHIkEkZNDt01HfWGdptdrhWYRRRpIs9cAbwvev
         JKCJXgxjIVw3mdqFbtgCrKP147z6L6hbktkj3Q9LG7fU9O4P+sY0dAHbvWcqe9U2IZhT
         zk/MZZkoCVQHrVVltNvykoJReHmmaoHjPgimjUbZ+LbnTqYD5mGFKKr3kQ0jW8GUb62D
         vT/w==
X-Gm-Message-State: AOAM5312OtZcpnjAIvcNd7gOodiRBOfeksEfusvJnOSm8ftZxUKTlflv
	oNJuCBo6+KOTDGtlnVPgtd0=
X-Google-Smtp-Source: ABdhPJz1LgGGzugmNR0aeLcfgcWj1FHNGUyFGNVbR9VpGZjQATq3ZO7MRmIkOyfCei1aznQI6pyR1A==
X-Received: by 2002:a05:620a:95e:: with SMTP id w30mr28822303qkw.157.1629872550317;
        Tue, 24 Aug 2021 23:22:30 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <deng.changcheng@zte.com.cn>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Wei Liu <wei.liu@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Jing Yangyang <jing.yangyang@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] drivers/xen/events/events_base.c: fix bugon.cocci warnings
Date: Tue, 24 Aug 2021 23:22:22 -0700
Message-Id: <20210825062222.69936-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jing Yangyang <jing.yangyang@zte.com.cn>

Use BUG_ON instead of a if condition followed by BUG.

Generated by: scripts/coccinelle/misc/bugon.cocci

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
---
 drivers/xen/events/events_base.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index a78704a..dd44019 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -818,8 +818,7 @@ static void xen_evtchn_close(evtchn_port_t port)
 	struct evtchn_close close;
 
 	close.port = port;
-	if (HYPERVISOR_event_channel_op(EVTCHNOP_close, &close) != 0)
-		BUG();
+	BUG_ON(HYPERVISOR_event_channel_op(EVTCHNOP_close, &close) != 0);
 }
 
 /* Not called for lateeoi events. */
@@ -1270,9 +1269,8 @@ static int bind_ipi_to_irq(unsigned int ipi, unsigned int cpu)
 					      handle_percpu_irq, "ipi");
 
 		bind_ipi.vcpu = xen_vcpu_nr(cpu);
-		if (HYPERVISOR_event_channel_op(EVTCHNOP_bind_ipi,
-						&bind_ipi) != 0)
-			BUG();
+		BUG_ON(HYPERVISOR_event_channel_op(EVTCHNOP_bind_ipi,
+						&bind_ipi) != 0);
 		evtchn = bind_ipi.port;
 
 		ret = xen_irq_info_ipi_setup(cpu, irq, evtchn, ipi);
@@ -1983,9 +1981,8 @@ static void restore_cpu_virqs(unsigned int cpu)
 		/* Get a new binding from Xen. */
 		bind_virq.virq = virq;
 		bind_virq.vcpu = xen_vcpu_nr(cpu);
-		if (HYPERVISOR_event_channel_op(EVTCHNOP_bind_virq,
-						&bind_virq) != 0)
-			BUG();
+		BUG_ON(HYPERVISOR_event_channel_op(EVTCHNOP_bind_virq,
+						&bind_virq) != 0);
 		evtchn = bind_virq.port;
 
 		/* Record the new mapping. */
@@ -2009,9 +2006,8 @@ static void restore_cpu_ipis(unsigned int cpu)
 
 		/* Get a new binding from Xen. */
 		bind_ipi.vcpu = xen_vcpu_nr(cpu);
-		if (HYPERVISOR_event_channel_op(EVTCHNOP_bind_ipi,
-						&bind_ipi) != 0)
-			BUG();
+		BUG_ON(HYPERVISOR_event_channel_op(EVTCHNOP_bind_ipi,
+						&bind_ipi) != 0);
 		evtchn = bind_ipi.port;
 
 		/* Record the new mapping. */
@@ -2063,8 +2059,7 @@ void xen_poll_irq_timeout(int irq, u64 timeout)
 		poll.timeout = timeout;
 		set_xen_guest_handle(poll.ports, &evtchn);
 
-		if (HYPERVISOR_sched_op(SCHEDOP_poll, &poll) != 0)
-			BUG();
+		BUG_ON(HYPERVISOR_sched_op(SCHEDOP_poll, &poll) != 0);
 	}
 }
 EXPORT_SYMBOL(xen_poll_irq_timeout);
-- 
1.8.3.1



