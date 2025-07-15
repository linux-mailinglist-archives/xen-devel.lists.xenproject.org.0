Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9BB054ED
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043772.1413846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubb4R-0006fR-5u; Tue, 15 Jul 2025 08:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043772.1413846; Tue, 15 Jul 2025 08:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubb4Q-0006Wg-Vr; Tue, 15 Jul 2025 08:31:26 +0000
Received: by outflank-mailman (input) for mailman id 1043772;
 Tue, 15 Jul 2025 08:31:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V4bE=Z4=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubb4P-0005YW-1d
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:31:25 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1748a187-6156-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 10:31:23 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4eed70f24so756724f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 01:31:23 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560f22cd14sm84787075e9.30.2025.07.15.01.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 01:31:22 -0700 (PDT)
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
X-Inumbo-ID: 1748a187-6156-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752568283; x=1753173083; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYagUw7+nV4AIrSjbYjtskD6tyaobfXIr4xaV+yxYuw=;
        b=UQgL+SvrJeR0wpvewHvyxRoYLRLf1UohVol47L4QPt23/JB25kGKrhWped1CqjvnEj
         NshpbgGENelyonjFtJXZNZNHiZjyvXogotEt3NsXIsOUwSVRWOd4SywFkdpzTSR1lvV2
         M+o4NVNF6+s/YA8W5hEaBaFX/BVtlBOVJZd6Xjk3CHS3/lBL9PAEl7kOnFMgl/rcPv2x
         hsIJDHiNL/hVJcKpYwIVETg/47ZVdY87gFlUaOflfnCushpcyVcUM4THlNF7uNq2/tzY
         2B+vJBG6jb/1qJgFFmpYKwH+Zsb0WY6bcPXe4ePquywJdOWDPsqwzXsoPdWLM8f2Cult
         rYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752568283; x=1753173083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYagUw7+nV4AIrSjbYjtskD6tyaobfXIr4xaV+yxYuw=;
        b=CAGe1Z/SS4hdREFR6zJvb1oR5ykvCf6WtE4Q1v5I/Q78II5ogxi5m2KcQKJrl6kGhh
         l0pFxMsvft9fg0M7CGeefoGeAq1aVLLVAiAvYCjxTpYjR8UXBJSn5cOg7PggSWCNbNNu
         NmOzJF/1IJGKQmaIV4YT12LpRTGuK298wwd06k8uQDy5EdV5ponFQlXQPAFIQJNWR077
         yd+uxWAmo0IRAKuIMv+MqtyWtr+HBteve+vCjnvwx03fMBjQ0Fz+7i7bhUSC4eoqFm8z
         tXTHPsJAoisECyWwsFd/6ArR2rQn8YNLgh22RilKlkt3zZ1IlS52XNt2m68NoDyG6X5O
         945w==
X-Gm-Message-State: AOJu0YzqXkH4ErVbhgIQLT0tByWYo5TCvlyJjp/S6vTS9MC4mLwtfCze
	/ztlL+gxNks1Dr/rMO2mJCQI9DxyIIeJdRz5e4dUXhvW8twcCb/+zstAnFbHeA==
X-Gm-Gg: ASbGncunGMlEy4olgQq426oKlkCGW7Rye7hrue+PpYkuX4cNJDhMjRTlDWBEr5ZpqZm
	l5OtYe3tLN3Ocex1sYQs2RMtovm9dv1ZYt7wDrZl13o9WEiaY95iJtRgBA9yLgGpsVTYwGDv77M
	cofbsXA2NtnUcOi5NsDcT5I/hEzE8KjusF6IPgy4hO1iq2hDnKEyiDc0Zl9VnjwO9ufbds3kBJX
	fokb++hlNGz0p6wq4tFdNFg1IqjFq3FdFfy18Z9Ih9IaXCfEEf7n6i5NrNr9+HwMB/1fsDpOIfu
	8MzzJ+HZ37bYZyCxlGCdFusc/qkMM/IKB+863ZFgDqVSrINO0LiGWGgwXs4Nid4gElvw5UZX9y9
	mj+cDhDEmIodm4LejzcygjqvWg3sYyQaANVZd71RXEQws0KQ9I6wJ5pDDjX7Vgyd4GsuOKNEhbB
	ofdQfjiHKCy9818MqqYPn8GA==
X-Google-Smtp-Source: AGHT+IFFoID+G2TNmh2plFf9xbnbaz+gXK1QEu42r2amU2GVns+zxWB7UweKbNCfXyzbaUsczLSOGw==
X-Received: by 2002:a05:600c:198d:b0:456:12a9:e92 with SMTP id 5b1f17b1804b1-4562919403fmr3164815e9.5.1752568282407;
        Tue, 15 Jul 2025 01:31:22 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v9 5/6] xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr == 0
Date: Tue, 15 Jul 2025 08:31:13 +0000
Message-Id: <7bdb1c10d8faee3853e1f2a81fce1c7f20424e88.1752568020.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752568020.git.w1benny@gmail.com>
References: <cover.1752568020.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Since libxl finally sends the altp2m.nr value, we can remove the previously
introduced temporary workaround.

Creating domain with enabled altp2m while setting altp2m.nr == 0 doesn't
make sense and it's probably not what user wants.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 155ea1f79f..872e97999c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -739,8 +739,9 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 
         if ( !config->altp2m.nr )
         {
-            /* Fix the value to the legacy default */
-            config->altp2m.nr = 10;
+            dprintk(XENLOG_INFO,
+                    "altp2m must be requested with altp2m.nr > 0\n");
+            return -EINVAL;
         }
 
         if ( config->altp2m.nr > MAX_NR_ALTP2M )
-- 
2.34.1


