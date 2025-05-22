Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0C2AC063F
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993101.1376563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0lN-0006ra-PV; Thu, 22 May 2025 07:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993101.1376563; Thu, 22 May 2025 07:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0lN-0006ox-Kx; Thu, 22 May 2025 07:54:49 +0000
Received: by outflank-mailman (input) for mailman id 993101;
 Thu, 22 May 2025 07:54:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI0lL-0006LU-M8
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:54:47 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 061ae988-36e2-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 09:54:44 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a3683d8314so4468953f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:54:44 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a35ca889d9sm22233672f8f.77.2025.05.22.00.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 00:54:43 -0700 (PDT)
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
X-Inumbo-ID: 061ae988-36e2-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747900483; x=1748505283; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNt/a796h8HJ1FyF4HukdZmnJKGKgEPfZABr2Qwwqsc=;
        b=mMkuERbf3ofMtAH2Id4jK/MG79eK0JwlKdSGgqI7XiTu0fbqajjQyNdJOYBmEC/ew5
         5WL5ZyL7q1LacO1SN1ASf+3b2ADEUaroL772sNopGc/ql1+73GYCjcf1BWaQTYVNMpR9
         gq7OL+T1qG3lgay5SzM3V1PQ9qaFOXPTJYolM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747900483; x=1748505283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNt/a796h8HJ1FyF4HukdZmnJKGKgEPfZABr2Qwwqsc=;
        b=cXu2rJvD4u7G+k8/9PN+Apwzvapqi0ZUfQwOKhT5GiXsqxBF1QKJb4CJXROc/v9sGL
         MSRImIRO7umqwMRSFoLkAtuveJTTqg0TdqaPrUj+8H9+5jmZFwszizxvyRjuJHOq/B/u
         MJbNkfSWZQH4B+xOd5jO8ANVPnsJdTvVHPzMMJKVCU6rtLhTAgpHR+f4XCLc01zdRsOQ
         4j80yOkuRjPS6jK5W7HRyGjYHRQGIPKCBbL5LvJbsZOfTmp9FxOAO5gYJZncOL8nYnek
         KHXZOPHtxR6A7t4I0koJfqm8g7sjleZIdZFk0VTQLx0wXtksfcJgB4cVje2IoE+Ab3N6
         81Fw==
X-Gm-Message-State: AOJu0YxgEBxXNpV+NCFOl37I0uXlV0uqdxGh0q7gWbvYfOLKwfkQctQx
	orBaaVhAiGpWnHM2kc3rzKvhmJo36SAV3YWyw5jGl/mZF8yVrEjE+BnYiQOI2If10KZCLitUys/
	QmRQL
X-Gm-Gg: ASbGncvm7q0hwWvI7qdgQ5E3AQXzXgawiWpArDOTpt2ubd3GhJ6m0tlXAoQh6bc0Nha
	QmgVjFx3BvFpUh4n/y4kdMRmrP4alR/lm5ddhWrEI8CQ0qkhJBL4a+sVb+DymyrKN/AHOeHhaJ0
	f/77mYpzFkw+IWXbHEahYjZ56st81yE3cftUVuC7zVhPOYjQdXKaVOGIImuAz7/e2OmBb568l+l
	HJJlXKv5Qxsasz2rGmFOE+9nDs+y9C78V+y+o+M5lA6QmK3JH/wnGy7jisVdXwhxN9gjFcfAEGt
	phGLRxIUTiKye3WxhWELun2CVpT8FzwfyauyTce08/BypzNh/IF3pjuHvJb5EU1Mm17HUeeWZlY
	cz0TOF3g7P7GGK44l0tJGrXy7XAmRAg==
X-Google-Smtp-Source: AGHT+IGw5ZUYXHmwfwWoYLLq3/50OjJvJxw5n7JcSFRYTWRVB29lNAxDM4fup1ovD+xAR/gqZwDlzw==
X-Received: by 2002:a05:6000:c0b:b0:3a3:5c64:c60 with SMTP id ffacd0b85a97d-3a35c84beacmr15062310f8f.59.1747900483409;
        Thu, 22 May 2025 00:54:43 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/4] x86/boot: print CPU and APIC ID in bring up failure
Date: Thu, 22 May 2025 09:54:37 +0200
Message-ID: <20250522075440.99882-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522075440.99882-1-roger.pau@citrix.com>
References: <20250522075440.99882-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Print the CPU and APIC ID that fails to respond to the init sequence, or
that didn't manage to reach the "callin" state.  Expand a bit the printed
error messages.  Otherwise the "Not responding." message is not easy to
understand by users.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Also print APIC ID.
---
 xen/arch/x86/smpboot.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 0189d6c332a4..dbc2f2f1d411 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -618,10 +618,12 @@ static int do_boot_cpu(int apicid, int cpu)
             smp_mb();
             if ( bootsym(trampoline_cpu_started) == 0xA5 )
                 /* trampoline started but...? */
-                printk("Stuck ??\n");
+                printk("CPU%u/APICID%u: Didn't finish startup sequence\n",
+                       cpu, apicid);
             else
                 /* trampoline code not run */
-                printk("Not responding.\n");
+                printk("CPU%u/APICID%u: Not responding to startup\n",
+                       cpu, apicid);
         }
     }
 
-- 
2.49.0


