Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694A8A729D4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 06:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928447.1331153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txfhw-00066E-0p; Thu, 27 Mar 2025 05:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928447.1331153; Thu, 27 Mar 2025 05:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txfhv-00063B-UR; Thu, 27 Mar 2025 05:23:11 +0000
Received: by outflank-mailman (input) for mailman id 928447;
 Thu, 27 Mar 2025 05:23:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFzh=WO=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1txfhv-000635-2e
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 05:23:11 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91d40a9b-0acb-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 06:23:09 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac28e66c0e1so81455066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 22:23:09 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef8d3d43sm1172756766b.51.2025.03.26.22.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 22:23:07 -0700 (PDT)
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
X-Inumbo-ID: 91d40a9b-0acb-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743052988; x=1743657788; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwAke7tV6dXg2uZlaT9u4GOEBl4olyXIENoICpzVrJk=;
        b=FVpCTLbSYMaU6+pgMRcITH7bCGPlr21grp/Gx1vkj/gAYQ4cTOWUleQ01UuNx8xL9H
         +wGWGbYo+qVMSKWJgFggkoz+HsOz5mvREmLhXnEln9urhN8K2TVlrLNfEgKaPz1PEIWs
         WkFfcnFX877nDopqLyn/OeikA0pdA/vBCSjX2EeM8HYzZ1lAwVwYPPX1y6Fvye1XWVdO
         hhZyt6xWC77NJDgWeMLIKIIXzrFe7bYxFRRlaulknXS2cjqRQ6mDU5jMtOX/PMX0HLHQ
         9aKXJzB3nXY8Bg9lAF1CR0wnZj3YmuVZy5TDvJS2DebJdt184WdcSWYy1P9bRD/TYU0H
         wumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743052988; x=1743657788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwAke7tV6dXg2uZlaT9u4GOEBl4olyXIENoICpzVrJk=;
        b=V1lR58XrXAxgx0fmZd/GYvrnb3UGaPJnwq76aFFu0Trgi1i6JM6Wa0FVJ0VU0f/OnN
         z2lywZmfx3wlIH9WZsOCc550ijQ1QybVCUdO4ouBShlSWcYRoY/R3bYsf/cJE8I/Tlvs
         PeTpGwrMIiVa45kZiubQzOc9en9Q/Yi7DzSROizFR46SI0eG6E/E5Kt140q9I8/0AFre
         GQ0ktVW+vduDDFuJisV+4ppv9aBgKupa3F4L3LfJLkmnn8s3TuqBTOW2BYIF6casFmRe
         itFZ0HPHAJOL6HJ9/aQoudByGbnqjynE5OChZ9R4ea+pMM+zQ2Ctd1VbhDzAmUEjwqJm
         Mkrw==
X-Gm-Message-State: AOJu0YwJq7ZEFkTU9hdzRkUcsYXFftu9yTbs64hUqGz1s8QNDPwAvpQk
	tQii0Rqq9nIpvdaUTiWoTKG5fzW0hnwa64Rf7/hTy4MTABMgPr9EAF6+Ug==
X-Gm-Gg: ASbGncvbl+qnBNwYwJwTX1D1p/Q/MdzI6iP9PTMQ/r1iozotet35VB2QQSyfQGOlR0Z
	I3fyZCtdUkWOWLV1OUX4TUUqD1lGICiLprfo0xX84roMee9056HLUB30uRYvdColODXSDlWGijS
	P2ToWUodez4EpnO8LIIXjbSou6L1EZANnnYtjyuD9L4mBnWa3u3JZY1cshZk9vnXPGGDA2rcR2l
	V9INIXOQt01qKtHA0vcIPZgCIhZ2u27q3UNCrdwy/3oMlXqtP4ZcY9btlBNa8qw9+7hRqr3zvAB
	vPzuARd/uVCkzqHntowR9BKN/3AduNqL59GUpptMgAztzLbGVUYWKvk64gSPaEg+fayiOZ8kirc
	N64CeMqXU
X-Google-Smtp-Source: AGHT+IFCmL04LFilT4EuKzSqnHlsJLZNMGPxP8EpredbcCoOrVsqOGiLdlHK7E1mXlapsleMr0f5dQ==
X-Received: by 2002:a17:907:60ce:b0:ac3:eb29:2aed with SMTP id a640c23a62f3a-ac6faea38a8mr180606866b.16.1743052987392;
        Wed, 26 Mar 2025 22:23:07 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH] xen/percpu: don't initialize percpu on resume
Date: Thu, 27 Mar 2025 07:22:41 +0200
Message-ID: <20250327052241.202167-1-xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Invocation of the CPU_UP_PREPARE notification
on ARM64 during resume causes a crash:

(XEN) [  315.807606] Error bringing CPU1 up: -16
(XEN) [  315.811926] Xen BUG at common/cpu.c:258
[...]
(XEN) [  316.142765] Xen call trace:
(XEN) [  316.146048]    [<00000a0000202264>] enable_nonboot_cpus+0x128/0x1ac (PC)
(XEN) [  316.153219]    [<00000a000020225c>] enable_nonboot_cpus+0x120/0x1ac (LR)
(XEN) [  316.160391]    [<00000a0000278180>] suspend.c#system_suspend+0x4c/0x1a0
(XEN) [  316.167476]    [<00000a0000206b70>] domain.c#continue_hypercall_tasklet_handler+0x54/0xd0
(XEN) [  316.176117]    [<00000a0000226538>] tasklet.c#do_tasklet_work+0xb8/0x100
(XEN) [  316.183288]    [<00000a0000226920>] do_tasklet+0x68/0xb0
(XEN) [  316.189077]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x194
(XEN) [  316.195644]    [<00000a0000277638>] shutdown.c#halt_this_cpu+0/0x14
(XEN) [  316.202383]    [<0000000000000008>] 0000000000000008

Freeing per-CPU areas and setting __per_cpu_offset to INVALID_PERCPU_AREA
only occur when !park_offline_cpus and system_state is not SYS_STATE_suspend.
On ARM64, park_offline_cpus is always false, so setting __per_cpu_offset to
INVALID_PERCPU_AREA depends solely on the system state.

If the system is suspended, this area is not freed, and during resume, an error
occurs in init_percpu_area, causing a crash because INVALID_PERCPU_AREA is not
set and park_offline_cpus remains 0:

    if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
        return park_offline_cpus ? 0 : -EBUSY;

It appears that the same crash can occur on x86 if park_offline_cpus is set
to 0 during Xen suspend.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Discussion related to these changes can be found here:
https://marc.info/?l=xen-devel&m=174116563705295&w=2
---
 xen/common/percpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/common/percpu.c b/xen/common/percpu.c
index e4e8b7bcab..607557436d 100644
--- a/xen/common/percpu.c
+++ b/xen/common/percpu.c
@@ -30,7 +30,12 @@ static int init_percpu_area(unsigned int cpu)
     char *p;
 
     if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
-        return park_offline_cpus ? 0 : -EBUSY;
+    {
+        if ( system_state == SYS_STATE_resume )
+            return 0;
+        else
+            return park_offline_cpus ? 0 : -EBUSY;
+    }
 
     if ( (p = alloc_xenheap_pages(PERCPU_ORDER, 0)) == NULL )
         return -ENOMEM;
-- 
2.43.0


