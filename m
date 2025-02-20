Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25F9A3DA86
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 13:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893847.1302693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl65x-0000hL-0F; Thu, 20 Feb 2025 12:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893847.1302693; Thu, 20 Feb 2025 12:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl65w-0000er-Ta; Thu, 20 Feb 2025 12:56:00 +0000
Received: by outflank-mailman (input) for mailman id 893847;
 Thu, 20 Feb 2025 12:55:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v60a=VL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tl65u-0000el-UG
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 12:55:58 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06bd3700-ef8a-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 13:55:57 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so8564345e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 04:55:57 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4399558f8d1sm74123475e9.19.2025.02.20.04.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 04:55:55 -0800 (PST)
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
X-Inumbo-ID: 06bd3700-ef8a-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740056156; x=1740660956; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AckGbBYLmOxg4yPCSLGq/5KBwDRmNUqUFFf1ZILHN7g=;
        b=Pp+YincUmHBJDwYv2J/uCFFgQTt5bB795E8aOfni2JKcpJ2roFaR+9daR+Mn0aAaQK
         2jf5h80rakHUFBz5pqdGYC0e+kdZHV3lmYGUGze7ZNBWnMsVpRac5RIv7NtjQj7mhfid
         RmviddtLhokWLnMNj4U65r1ZbpGzIcIaXWotk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056156; x=1740660956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AckGbBYLmOxg4yPCSLGq/5KBwDRmNUqUFFf1ZILHN7g=;
        b=R2IkTuXk5tkAgdlDVLG8Q4GHLugHN3+0IraxtxKqQtyNyFdjhCCIEfbrsbyOSdCJwe
         QHfNacPsrrjDlKb9aZPzhPsstoOhvqmPSL9/xzjk1cywCX/tDGeRf882prB87CXMnaet
         SgGY4BS1DlbSo1SeTL7/c0w8wCMxig0qL9tWWgCHev6ARH6IFFa6ZkdCclaRcrE51vDp
         UuV/ym3Te1oExZmCzVCeUtprUsOj0THKPcp041smKpDtaiyLUnHy6mxWtdBg+uI75Hfy
         NwdgalCKvi+onX9MscgSMycihckNGyXqVegZowTTzI+LMc0iwNg0auj+MvnZhoqcM6p0
         bbyQ==
X-Gm-Message-State: AOJu0YyT66vgNNWFfN3zL5wdYGY5ZynotuxqK7aG94YTF44uOYSwKKkv
	dEslZqFdEN3jstRYZUujXipNmV97b0Bt6NaGQkzWoTfwOpLaCtGhSdkJpdl8/rBLa0MeLSwzO0x
	t
X-Gm-Gg: ASbGncvCLICWGKOJh+4Fe6Q5+gOjMiN893TutInSrEeZyO3wCTyVP6+zJjtd6iycSZy
	ScNQUQaVb9ItPxa4mLfDzESNhirtDeGvneH3JTSsuGq1M5u0HHJW4O2xXenXhFMGcBlcZJUgOxi
	cp6xrgWIv1LJlbJHbJ7g6kOMzo4kg0aRyLichCX2WLoykoFQTkGiN1wJYZ4/YsArHL9UHS9NCx7
	QOmWawLJXUYYUHpRJe/26qROZQs1SGCPqZ1msI1dt2xCCgTuUnquVmXXSMxCiHIqNHTa0/HmVDT
	2kwUUExd67YXpXQoUqH7tYhjKz7p/7ivrr1cNUeF9Zc2avuHB1OThMQ5jbzzg07UG7erD4g=
X-Google-Smtp-Source: AGHT+IEz0ipjZao0p5sI/DD+FcHHEQcgfsuzqL0IpUb/xCkjB9TGLDeMe6FMukgvPx+axBYxy6EjTQ==
X-Received: by 2002:a05:600c:a386:b0:439:84ba:5760 with SMTP id 5b1f17b1804b1-43984ba58ecmr171868435e9.5.1740056156291;
        Thu, 20 Feb 2025 04:55:56 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH for-4.20] CI: Mark MISRA Rule 11.2 as clean
Date: Thu, 20 Feb 2025 12:53:54 +0000
Message-Id: <20250220125354.869062-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

For 4.20.  I want to include the fix and this patch ahead of RC5 to avoid
backporting.
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 491625e84c27..66698b4bfffb 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -58,6 +58,7 @@ MC3A2.R9.2||
 MC3A2.R9.3||
 MC3A2.R9.4||
 MC3A2.R10.2||
+MC3A2.R11.2||
 MC3A2.R11.6||
 MC3A2.R11.7||
 MC3A2.R11.9||

base-commit: c989ff614f6bad48b3bd4b32694f711b31c7b2d6
-- 
2.39.5


