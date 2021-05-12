Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E914E37B2F3
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 02:18:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126089.237370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgca9-0001Ph-Q4; Wed, 12 May 2021 00:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126089.237370; Wed, 12 May 2021 00:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgca9-0001NN-MF; Wed, 12 May 2021 00:18:33 +0000
Received: by outflank-mailman (input) for mailman id 126089;
 Wed, 12 May 2021 00:18:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+k7y=KH=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lgca8-0000kd-1H
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 00:18:32 +0000
Received: from mail-il1-x12e.google.com (unknown [2607:f8b0:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae5463af-e05a-42f4-9cba-c489d57f25a0;
 Wed, 12 May 2021 00:18:31 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id h6so18736306ila.7
 for <xen-devel@lists.xenproject.org>; Tue, 11 May 2021 17:18:31 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id v4sm8241490iol.3.2021.05.11.17.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 17:18:29 -0700 (PDT)
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
X-Inumbo-ID: ae5463af-e05a-42f4-9cba-c489d57f25a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZVffP2AoY7DIGJlRpw6y32EVHjpd/fv+1cj2j/7FT4M=;
        b=HKnovley9S67BXN2eY+XSVLSSfFtLlQ2kmN/4O2HSj64YCc9GppYzEoOrRHHfVAP1J
         op9/qFDgSnmNQF7nldySt19Ck/ztvAFJ6asAk7LlNvKUjYpm3cxnJwCx7KhTqMgBAhmR
         1miUzwF4xB96xw+Vz0cMh4OX2JIlMJ+ufYnYZPt0bs/0GIqb4Co9/FvPEZHjq0lL+uyH
         7U3ZRyoftT1gtjpnIhcVjYD3xlF3jJVWxk1LSuTxfQORCUjyi3/7t9WLCssbc2fObi3C
         Ypz+I4182NPMJ9Awk/vb3fDmosz2pjnGIuXCdvirAz8HKUTvzI/iYCdH93CH5EPbwBT9
         nIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZVffP2AoY7DIGJlRpw6y32EVHjpd/fv+1cj2j/7FT4M=;
        b=h727M7gj41KqS4mDMPIwOojFsdp5Z3S2Py8SFUMdE6fx4qDdLRjs8kO8IFVRST9NL3
         Kae8ZaQa4lmbMtcW/craJOekvHF3UphFjEHl9swt55eTt4VDdBZQ17cyzatAw6lqsZaU
         /sSd0vKpJTlf1mSFMhy9NlclFLt9JhTcfue3UsBIkkCIU0YxBMLqH59/2wJLfntqCK5m
         QOOx+UNRbMDjbC01b2hoU6xE5SGWOCIcTIfJI4YukzCoMC0tv41Ouq0j/cBQKkl95y8/
         cdN6CsP77Pj9rDEJVrRyGdkVBtksZipHSNVLaIcCj5lJvCRddTV/uYOPVMLx5yYE3ZMA
         eFtw==
X-Gm-Message-State: AOAM530zvw34vsZtMQRvIwLHEi0e7JQSbGqzW5gtmnDTmniN51GtHNbd
	EWsDC+875qoNeIQgLm4tFM/Oi272b3EVKQ==
X-Google-Smtp-Source: ABdhPJyGiX9C7qlPKoElf5vX50Gg7NyKG09/3UfVmVSHmJj770UiKDP6hzvjmA6DUZd/5xzM6KdSFg==
X-Received: by 2002:a05:6e02:1b06:: with SMTP id i6mr14387567ilv.139.1620778709944;
        Tue, 11 May 2021 17:18:29 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] xen: Export dbgp functions when CONFIG_XEN_DOM0 is enabled
Date: Tue, 11 May 2021 18:18:20 -0600
Message-Id: <291659390aff63df7c071367ad4932bf41e11aef.1620776161.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620776161.git.connojdavis@gmail.com>
References: <cover.1620776161.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export xen_dbgp_reset_prep and xen_dbgp_external_startup
when CONFIG_XEN_DOM0 is defined. This allows use of these symbols
even if CONFIG_EARLY_PRINK_DBGP is defined.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 drivers/xen/dbgp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/dbgp.c b/drivers/xen/dbgp.c
index cfb5de31d860..fef32dd1a5dc 100644
--- a/drivers/xen/dbgp.c
+++ b/drivers/xen/dbgp.c
@@ -44,7 +44,7 @@ int xen_dbgp_external_startup(struct usb_hcd *hcd)
 	return xen_dbgp_op(hcd, PHYSDEVOP_DBGP_RESET_DONE);
 }

-#ifndef CONFIG_EARLY_PRINTK_DBGP
+#if defined(CONFIG_XEN_DOM0) || !defined(CONFIG_EARLY_PRINTK_DBGP)
 #include <linux/export.h>
 EXPORT_SYMBOL_GPL(xen_dbgp_reset_prep);
 EXPORT_SYMBOL_GPL(xen_dbgp_external_startup);
--
2.31.1


