Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E61C91F8948
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jun 2020 16:37:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkTlB-0004Yp-5L; Sun, 14 Jun 2020 14:37:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UtKD=73=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jkTl9-0004YZ-Na
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2020 14:37:19 +0000
X-Inumbo-ID: 8c810dbc-ae4c-11ea-8496-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c810dbc-ae4c-11ea-8496-bc764e2007e4;
 Sun, 14 Jun 2020 14:37:19 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id l27so14724301ejc.1
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2020 07:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CedW14TZMrLJXwa4+9NGmni6qCAFSImofjSKJjmOefU=;
 b=gJQq1FDmHMLUhXCfeJ9EaXnakb1HIsoBaM/XtOYTk8lagU6V50luI9Wlhl+uu6KBl5
 hLyw6rIprV2KPFLzGrBSvCLCQam1asQ4oLOwQ0zqUyvvljqKksTKa+sNJ7zQIUZUsDs2
 PEP66Fsn+ntqXgnDt1w15ZTuXAfIKZMDElfj7qVtpfnVbFcJqrtrmaJ0g9DSRZSVU741
 5LMBc8sWzWcmf0YeVG4RiZCJjGv8g8JWNYlFFSmAjDFe4B7i6PZ9Nq3izmOaEX0hLNPP
 lfVsoorjpSkQJPx7JNDdBpL3xXj+wOu/BmFR3wBmu79rwaxsrU7IcQrw2BT2SrGUt1nV
 4xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CedW14TZMrLJXwa4+9NGmni6qCAFSImofjSKJjmOefU=;
 b=G8woINkKRJIqncihWB27G19N7EpQt7YJ+U6/nn40jU/WYlO6x0S50ORbWOpJrxCmDg
 d2nFvBfXhbd7F227bRvmCH3EahugKiYlfQGMGr5OPmEaA+tPAPNAZvoYsc359DaDKHbB
 CuyfwOhz1ActdWk8YP/CPeVepvgFViU1RA6iZXp23SUL9mzRuitarhOSw8EedLOJpf/p
 dZZxWm9hmFDwLhJyeJcY4MYCShxCvTlv1cBoAoRueegmp2PcP/qWS+hAQq7XnlWA6Oqd
 MCwbZk/Vl70xGlazqnOXF8Mvfc1sfKi+uPcaSt+h6E8Pe+snxblHCDBBp0AJoBaHUDJL
 q0sA==
X-Gm-Message-State: AOAM533c+mBS91BihmBj+KjdlcpCVZocDFe3yvPSPRvyw6VjS2vcS90Q
 4629SCoR8bktpU6ngIaNKL1VC7xHwW7ZhA==
X-Google-Smtp-Source: ABdhPJz0eyvA2OIgEU9X+Hg7Ah43Y42zZY+0qhsOZ53d3nnb1vpl798Adk67xG2sumjh0f9KqhCRgA==
X-Received: by 2002:a17:906:d933:: with SMTP id
 rn19mr22297701ejb.158.1592145437986; 
 Sun, 14 Jun 2020 07:37:17 -0700 (PDT)
Received: from localhost.localdomain (public-gprs354212.centertel.pl.
 [37.47.14.229])
 by smtp.gmail.com with ESMTPSA id l18sm6753823eds.46.2020.06.14.07.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 07:37:17 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 1/1] x86/acpi: Use FADT flags to determine the PMTMR width
Date: Sun, 14 Jun 2020 14:36:28 +0000
Message-Id: <dba39869b788f7f9d937fac48f0476a0443925f0.1592142369.git.gorbak25@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1592142369.git.gorbak25@gmail.com>
References: <cover.1592142369.git.gorbak25@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: artur@puzio.waw.pl, Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 j.nowak26@student.uw.edu.pl,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On some computers the bit width of the PM Timer as reported
by ACPI is 32 bits when in fact the FADT flags report correctly
that the timer is 24 bits wide. On affected machines such as the
ASUS FX504GM and never gaming laptops this results in the inability
to resume the machine from suspend. Without this patch suspend is
broken on affected machines and even if a machine manages to resume
correctly then the kernel time and xen timers are trashed.

Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
Tested-by: Grzegorz Uriasz <gorbak25@gmail.com>
---
 xen/arch/x86/acpi/boot.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index bcba52e232..2ad3eb4abc 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -480,7 +480,10 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
 		if (fadt->xpm_timer_block.space_id ==
 		    ACPI_ADR_SPACE_SYSTEM_IO) {
 			pmtmr_ioport = fadt->xpm_timer_block.address;
-			pmtmr_width = fadt->xpm_timer_block.bit_width;
+			if (fadt->flags & ACPI_FADT_32BIT_TIMER)
+				pmtmr_width = 32;
+			else
+				pmtmr_width = 24;
 		}
 	}
 	/*
-- 
2.27.0


