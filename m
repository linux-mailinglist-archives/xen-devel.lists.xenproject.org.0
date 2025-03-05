Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E72DA4F99E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:12:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901870.1309840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknN-0007sU-2u; Wed, 05 Mar 2025 09:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901870.1309840; Wed, 05 Mar 2025 09:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknM-0007qj-Ua; Wed, 05 Mar 2025 09:12:04 +0000
Received: by outflank-mailman (input) for mailman id 901870;
 Wed, 05 Mar 2025 09:12:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknL-0006ew-CY
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:12:03 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e629023a-f9a1-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:12:01 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5493b5bc6e8so7720351e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:12:01 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:12:00 -0800 (PST)
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
X-Inumbo-ID: e629023a-f9a1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165921; x=1741770721; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsEkc5UwQaeOfpAVVoIStpjI7WoGyW7huU1aUhighTY=;
        b=mhLCdYPEKIPEa7IUE65yvIB4MlhGGRKCB50I3aS2H5qXTgqDhn0SE7b/FTqOx85+uM
         R2Kc1G2mgKHKPTWh3NdthK41d3tzqIR+1Gjs/2JPV0Za61Sc/NXSdmPa+Ku0kpTJ8erZ
         lLwPAkw8sl7z8VJd6TdO/002Hki5dsHkIIeyuLLugjCHnGkzbj8aaIoxEQXEMNSaIiaE
         /FES9PRKP5R3eoVHPRtPHNLvXJBhoJS7Ivq8KSXeDtUGckyPP7GLEDB78ctPTfFHFbpC
         c2k2ZfrW+9x0uIva5taQG+dgS7tWTJhUgDhfHtCyhdnv6uPBIt4gBG9GuGAFFqsy1oVT
         s2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165921; x=1741770721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsEkc5UwQaeOfpAVVoIStpjI7WoGyW7huU1aUhighTY=;
        b=MEqYez3sOQRzZnPW3dIaTIuJwyYHo/UCDcn806qumlff+zdjeuAEwkpbV8G/xiHJpA
         2LVlIxWEVaoEN0k6B6WhUCczflBog04Vn/uR1l1FhiBVKtN5ACxMWrYTeqTvDMke5TpJ
         4JKI8jhk9CAqumpdxdPj0AIJ9TR/BERgWYbWVzgDt03epRsSpPzoed0vLYaGYrMiD18s
         BciyvB8/Tw2vCc/fgW16rt9TcHktqCEX6f/98frl15pe945hRhMNeZnWaQW3REUnXGIb
         lDSJuxueP3vlFy5zcmOE/JLUfForHadxFgjgtYLZie9L3U/yq7+hqarvQZAXkohh4zmY
         jzpA==
X-Gm-Message-State: AOJu0YzzsuM4nAqj2TrjFXGKS56A9hsZSFaLmgTIKpggNWvQ2RmnQ/OB
	dtMw2I0zpEoFCeNQ9WTjj+WfkLJVg3ib+QSfM3ByGBhQ1FeawfLNzqQnAqWe
X-Gm-Gg: ASbGncttQ7WYR4Ez0fqjyy9YyyJc6i+JJJdwiRFiv3YCCYZMvu6q+M5R51tRC1hVaxn
	Jz7nK/4eEU+FY0HdqfaZ9prmGDVExGsaFwlf6iDmQ9siqeNCrarRYaMlUPhN9L2ApU2va6QZtG9
	iZm6YMoqbpq/KDUTinh4oDneKqRVV0Ml3upMUiS7vaBMjrC8XHKHaolq0xzFgx17Dv5JuKLhgDx
	p+VEUxxYGa1y5htGYEU+4FvyJwxCtxIKX2M/969+k3MuRZ0WWfUyTZS/09X/0ACOEIVFgcbyTEG
	JWGdkrnJaok1ziNUg5JgIVLQojU7TI3YaoYwcPLlmqEg2NyUgw==
X-Google-Smtp-Source: AGHT+IG3M+jnZ7dDUzYucmBB1qdaR5sNzVG4SVPMlLekJ0Z4w6Owt27xZGew4IedbsbYDvHnxaVsNQ==
X-Received: by 2002:a05:6512:2308:b0:545:bf4:4bd4 with SMTP id 2adb3069b0e04-5497d332250mr783696e87.7.1741165920491;
        Wed, 05 Mar 2025 01:12:00 -0800 (PST)
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
Subject: [PATCH 05/16] xen/percpu: don't initialize percpu on resume
Date: Wed,  5 Mar 2025 11:11:13 +0200
Message-ID: <e44b56f18fe5e1c7f1d6cd9d33ba84cf0e26b440.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
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
These changes were introduced in V2 inside
"xen: don't free percpu areas during suspend" patch.
---
 xen/common/percpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/percpu.c b/xen/common/percpu.c
index e4e8b7bcab..83dca7edd6 100644
--- a/xen/common/percpu.c
+++ b/xen/common/percpu.c
@@ -74,7 +74,8 @@ static int cf_check cpu_percpu_callback(
     switch ( action )
     {
     case CPU_UP_PREPARE:
-        rc = init_percpu_area(cpu);
+        if ( system_state != SYS_STATE_resume )
+            rc = init_percpu_area(cpu);
         break;
 
     case CPU_UP_CANCELED:
-- 
2.43.0


