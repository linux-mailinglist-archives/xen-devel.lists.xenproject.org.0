Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672101CC233
	for <lists+xen-devel@lfdr.de>; Sat,  9 May 2020 16:37:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jXQbI-0007nf-KL; Sat, 09 May 2020 14:37:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b8++=6X=gmail.com=rikard.falkeborn@srs-us1.protection.inumbo.net>)
 id 1jXPq8-0003d0-Ug
 for xen-devel@lists.xenproject.org; Sat, 09 May 2020 13:48:29 +0000
X-Inumbo-ID: c2386058-91fb-11ea-ae69-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2386058-91fb-11ea-ae69-bc764e2007e4;
 Sat, 09 May 2020 13:48:27 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a21so4609892ljb.9
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2020 06:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=97riR7h5mctZpNCGSCsUzKUdKKhONjRhdoAsaVf8nyw=;
 b=aBClKuiBIJWNgNo6gaPKpc6o8Bx2D2tB1J4jkUiu91comKnJCm77qMPje6ENn0inC7
 6q/P3ambDpvAHWkzRBxKtcy79WwPgS5TRjDdfsMoAfXlKRR7hPwn8M78VW2yg+FdwZSo
 7wn9gyzcJN/ewxvhBC9cq/JwxQSeLTAbLCpWJRm6Dw50kqa39v/wjQkqT38YW8Zv2Q3R
 CpvIV4tJEGnGc50ZCCTEfVJ+g8LVtNF4TbzWBsv1P8848fFZsPBp2RSsCuoOomZ42NgY
 7jrHoG6JbxAgk0QiB+kFGs0XNvQB9AgMDbIfNr7PGv34g2nncRK1e5kYDyfGr6Cx/7mj
 3P4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=97riR7h5mctZpNCGSCsUzKUdKKhONjRhdoAsaVf8nyw=;
 b=UNLIL4q4aSfmaye5xv7luQG8mskoHGGUgddCxZSY3vFKfzZ554IKXo/PdsiuXVR5sg
 VJ6L65C960j804iwg4mQuEPX+YxF2pt0JYYivludZfhP9NzsW9Wwee2I99d1tZ4khS9H
 hl6/M4xYHXX5LlqXq0+XSWHsovC/9noZ42ptvpf/1tXPehyzPoRk8PMSrJ4NlYvSheXh
 EyY85sQDG8gOHw/cA44I5tXS+RhIy7peG0UxCLWpRYHjO5eBAfwVSosuZhWtYT2RpnLM
 6yBltdULgjT8qFyqIhV86DspZqK5xhJDonswVBxzfp9aHGU6YoR1aCaczoChSTPWd4mg
 Ismw==
X-Gm-Message-State: AOAM532HSLcV5IpdhsLvGNxQtRV7GKGERuYpN+5TWc3SCoyX8A/03CLx
 ArdeUdRAfpVOQdPMcOO/pT0=
X-Google-Smtp-Source: ABdhPJxpQ/5qZk8wrc4rdW4hRVVzSjbl+JycdDYBicx5ny4EL+DgCn8XoLsyjaFo973ka6XmUYd3Rw==
X-Received: by 2002:a2e:2a82:: with SMTP id q124mr4991852ljq.155.1589032106552; 
 Sat, 09 May 2020 06:48:26 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-22.NA.cust.bahnhof.se.
 [158.174.22.22])
 by smtp.gmail.com with ESMTPSA id a24sm3928093ljk.10.2020.05.09.06.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 06:48:25 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Subject: [PATCH] xen-platform: Constify dev_pm_ops
Date: Sat,  9 May 2020 15:47:55 +0200
Message-Id: <20200509134755.15038-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 09 May 2020 14:37:11 +0000
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dev_pm_ops is never modified, so mark it const to allow the compiler to
put it in read-only memory.

Before:
   text    data     bss     dec     hex filename
   2457    1668     256    4381    111d drivers/xen/platform-pci.o

After:
   text    data     bss     dec     hex filename
   2681    1444     256    4381    111d drivers/xen/platform-pci.o

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/xen/platform-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
index 59e85e408c23..dd911e1ff782 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -168,7 +168,7 @@ static const struct pci_device_id platform_pci_tbl[] = {
 	{0,}
 };
 
-static struct dev_pm_ops platform_pm_ops = {
+static const struct dev_pm_ops platform_pm_ops = {
 	.resume_noirq =   platform_pci_resume,
 };
 
-- 
2.26.2


