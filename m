Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E0283B376
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 22:00:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671238.1044501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSkLf-0007Hp-Eq; Wed, 24 Jan 2024 20:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671238.1044501; Wed, 24 Jan 2024 20:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSkLf-0007F9-BW; Wed, 24 Jan 2024 20:59:51 +0000
Received: by outflank-mailman (input) for mailman id 671238;
 Wed, 24 Jan 2024 20:59:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRLw=JC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rSkLe-0006yg-KC
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 20:59:50 +0000
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [2607:f8b0:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 826c774d-bafb-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 21:59:49 +0100 (CET)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3619e804f3aso22487495ab.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 12:59:48 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac80603000000b004260b65b4f7sm4643391qth.97.2024.01.24.12.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 12:59:45 -0800 (PST)
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
X-Inumbo-ID: 826c774d-bafb-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706129987; x=1706734787; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUrmZO37v19vw6177GV1p1vq04J3q1Ohle6m53SQw+Q=;
        b=E3sApGUTKeAwNnndLJa9mIUuFmiRVnRbeZGOHA41K9Xj5masF2IwYFjejAzF2LPVdV
         jD/Yj1ecWSAh/9iVY8vCnjwwVIBBu4x8A9PCYo42qwEDl6OPJAYKDUlhZQBb9rID70UM
         NofQzt9ZU/6XiuXDCO4OPHs6QbFF6M8I5P5mCD9o3pCdERxHTj7IH3p1fvJUHa9VjKtB
         OCmVXQivnBKUYz+0S8puLaqyy/wiZxxj46Mtrkjp2SV0W5C56zmkwKaDWTV34m9CtftD
         Re41uRj1dLqqJivAYLnPzGtaQryrwlhKIfySeg48VSGU6jiBwQvP45P2GWYJ1+NA/ezc
         T8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706129987; x=1706734787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUrmZO37v19vw6177GV1p1vq04J3q1Ohle6m53SQw+Q=;
        b=OHHdET7ENNTFCUJZdW2c8zJ1MNbUdI6ltmjcVNGcu29pe8rlgbIl5Y01AZ2JmFOeY3
         I6uUv1HAE3ej7CpO3E+rSQIEDCkGQaz8Dp4ikE3A9PztorjWRTFtW77YJqmK3qkm/kkk
         z1M964gTeUqrMSnn5uep54k9eYyBwF9tJss7ryqECK+nzzNMitTpD+5I6g2xHzUTzev8
         CKxJlWf4tlsx5yNahvthQxVfjvUDNylOvB7NzjErec2onVweo4+PlCBffDDiOZN/RJ/G
         QAQAur+QksGeCTXN3xXDDsq35VR1vFW81TaangOd0fezoJU4JrDfXi1j4mFXmsiYBKdx
         xT8g==
X-Gm-Message-State: AOJu0YytOBfgKp83od6q0OmSCJ4JWhXvxcD1aBUz4+PKEYlPHLOY11Zi
	j4tFcS6pi+mSY11lZJeuUSIOCBas/M029GLkSTjaDRlWl8P7AupztFB81Qmq
X-Google-Smtp-Source: AGHT+IEHzyqRfHJmmh4174x8bgg177aZWQxWxvguQ+KgBd8RXILpqaRpZRkTTLapoQS2Fec8QSnzPQ==
X-Received: by 2002:a05:6e02:1210:b0:361:a0ba:ad09 with SMTP id a16-20020a056e02121000b00361a0baad09mr40784ilq.12.1706129986876;
        Wed, 24 Jan 2024 12:59:46 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 1/2] pmstat: Limit hypercalls under HWP
Date: Wed, 24 Jan 2024 15:59:21 -0500
Message-ID: <20240124205922.67266-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124205922.67266-1-jandryuk@gmail.com>
References: <20240124205922.67266-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When HWP is active, the cpufreq P-state information is not updated.  In
that case, return -EOPNOTSUPP instead of bogus, incomplete info.

Similarly, set_cpufreq_para() is not applicable when HWP is active.
Many of the options already checked the governor and were inaccessible,
but SCALING_MIN/MAX_FREQ was still accessible (though it would do
nothing).  Add an ealier HWP check to handle all cases.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Use -EOPNOTSUPP in both places

 xen/drivers/acpi/pmstat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 85097d463c..86588ddd42 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -66,6 +66,8 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
             return -ENODEV;
         if ( !cpufreq_driver.init )
             return -ENODEV;
+        if ( hwp_active() )
+            return -EOPNOTSUPP;
         if ( !pmpt || !(pmpt->perf.init & XEN_PX_INIT) )
             return -EINVAL;
         break;
@@ -329,6 +331,9 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -EINVAL;
 
+    if ( hwp_active() )
+        return -EOPNOTSUPP;
+
     switch(op->u.set_para.ctrl_type)
     {
     case SCALING_MAX_FREQ:
-- 
2.43.0


