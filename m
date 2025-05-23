Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F111AC1E8D
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 10:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995381.1377848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uINff-0003fZ-Ce; Fri, 23 May 2025 08:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995381.1377848; Fri, 23 May 2025 08:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uINff-0003dg-7e; Fri, 23 May 2025 08:22:27 +0000
Received: by outflank-mailman (input) for mailman id 995381;
 Fri, 23 May 2025 08:22:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GSxL=YH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uINfe-0003CJ-78
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 08:22:26 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0eda90b5-37af-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 10:22:25 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-442ea341570so62115555e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 01:22:25 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a35ca8896dsm25534645f8f.73.2025.05.23.01.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 01:22:24 -0700 (PDT)
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
X-Inumbo-ID: 0eda90b5-37af-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747988545; x=1748593345; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fraFe1zTdvy9EaNNK6KT5rkWZR7WnEeg3OgF6ED/J8A=;
        b=tAlPw8zE58fW71aIXqxN9JWSUeKDQs5p92lgHf2NjeRY8myT519JDlujT8uxYLy1Mu
         G/uevgehutcJLYVdM0g6vXZnIwEwOBeFTPtZuOmyqaIagIbErUxWfMJAxaF9BsweS+sP
         uSmxmqgthSLpcL5+Ktn4fpJo2IboLCVYQ88Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747988545; x=1748593345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fraFe1zTdvy9EaNNK6KT5rkWZR7WnEeg3OgF6ED/J8A=;
        b=A/u1jPmN8EiTP8PonTBnFj0AEldB52u7DLPciCvhFLoockALwq2Ozb7/I5LNZ1M1Lo
         lmlOz+uVXywj7v8U+aiXfhibb+51q8bld2s/37LthAYwHEm4POhXztyyteyf1Yq50FFV
         TP7NUYFd/qF5FmBu61IAxW1idcLOQh+97M3dzy23t+AQiZDeP0N6/afZSe3BEuGwz257
         buQqgYF8SSKzP+yiVXtmqPc3F8YdWeYhdmYWsezx0JUMRzbzw3hGzkt1dcLZ0d3LrF61
         tX/5r9H+MibekP0vdvl1JkAQ+NFBjY6gP/d8IkAORmMMt7qqAFR/TKSnCDtZSwv+voAi
         T9dQ==
X-Gm-Message-State: AOJu0Yw3pjXjHMrEyRqTau5EWoYlI9ADJGNkX8nTKg1pDNMFokPZIY/r
	71ekxD/X4+Ug0ZiP9PaW1WPVJghvjzjFexUx5t8VvDmj4VARa3RewHOY5Ea/lPJG7epRSOJzBgl
	d26Oj
X-Gm-Gg: ASbGnctkBDB1YUKKdYJmUVQ4NuBY6MaChxgGH3Az4uCHrBb2rhk3jQitI/9/J5/hceV
	VQ1x8Xb5wybAikKIez/iQvs7TpAm7VGbLbmcp5qIbmIUDeRpOwTW3PD7HtQS/BLaVQ9N6I/ru91
	vogypB7qX9ZjJQ05ewYHv6n3r6OM+MMNR2tLOxHjYvu/8hxEmz/IJmXRSLg+JeBCayZt5FsLtJt
	Gim61bF9UGL51zprWU2R3qrrz5ni/QYvrsXV4veTcZ6WO5okUalZLwzz+dhpd9Kh1QpqRQPR0xd
	sCJVwjxsIYGURvaBjZin89MXCHg3Im3+Wou80luo4gLeKCtN5Kgg516hTNlHFyJycSgdc+7InU0
	FCEbBRsSJt5a3G1TWx40=
X-Google-Smtp-Source: AGHT+IH8WDpyb6K81BVOvpUEla557CAOvPbAlfr6x81iASyAMoDVtSY94hnMYALKX46FZeaLB0zJcA==
X-Received: by 2002:a05:6000:2501:b0:3a3:6d1e:a517 with SMTP id ffacd0b85a97d-3a36d1ea854mr18226804f8f.31.1747988544941;
        Fri, 23 May 2025 01:22:24 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 3/3] x86/boot: attempt to print trace and panic on AP bring up stall
Date: Fri, 23 May 2025 10:21:35 +0200
Message-ID: <20250523082135.18088-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523082135.18088-1-roger.pau@citrix.com>
References: <20250523082135.18088-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the current AP bring up code, Xen can get stuck indefinitely if an AP
freezes during boot after the 'callin' step.  Introduce a 5s timeout while
waiting for APs to finish startup.

On failure of an AP to complete startup, send an NMI to trigger the
printing of a stack backtrace on the stuck AP and panic on the BSP.

This patch was done while investigating the issue caused by Intel erratum
ICX143.  It wasn't helpful in that case, but it's still and improvement
when debugging AP bring up related issues.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v2:
 - Adjust panic message to match the similar ones printed for AP start
   failures.

Changes since v1:
 - Use 5s timeout.
 - Print APICID.
 - Split NMI dispatch code movement to a pre-patch.
 - Reorder timeout check condition.
---
 xen/arch/x86/smpboot.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index b5dcc77bd574..ac7bfca8b5c8 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1372,6 +1372,7 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t pxm)
 int __cpu_up(unsigned int cpu)
 {
     int apicid, ret;
+    s_time_t start;
 
     if ( (apicid = x86_cpu_to_apicid[cpu]) == BAD_APICID )
         return -ENODEV;
@@ -1390,10 +1391,18 @@ int __cpu_up(unsigned int cpu)
     time_latch_stamps();
 
     set_cpu_state(CPU_STATE_ONLINE);
+    start = NOW();
     while ( !cpu_online(cpu) )
     {
         cpu_relax();
         process_pending_softirqs();
+        if ( (NOW() - start) > SECONDS(5) )
+        {
+            /* AP is stuck, send NMI and panic. */
+            show_execution_state_nmi(cpumask_of(cpu), true);
+            panic("APIC ID %#x (CPU%u) stuck while starting up\n",
+                  apicid, cpu);
+        }
     }
 
     return 0;
-- 
2.49.0


