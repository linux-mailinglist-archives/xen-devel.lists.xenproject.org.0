Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNyCKf4Bq2m4ZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:34:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05B225018
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:34:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247984.1546416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7h-0005ud-Qo; Fri, 06 Mar 2026 16:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247984.1546416; Fri, 06 Mar 2026 16:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7h-0005pU-8n; Fri, 06 Mar 2026 16:33:57 +0000
Received: by outflank-mailman (input) for mailman id 1247984;
 Fri, 06 Mar 2026 16:33:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vyY7d-00030j-SR
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:33:53 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4341cdb7-197a-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 17:33:53 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-439cd6b0aedso1877979f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 08:33:53 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm4406550f8f.39.2026.03.06.08.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:52 -0800 (PST)
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
X-Inumbo-ID: 4341cdb7-197a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814832; x=1773419632; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHQw0iiSnYlgicKjMQWpmEGJyBczoqjDPyy2AZz+9Fw=;
        b=EzvjXlOBt+82hkUl0YrMvdyEsVAFxquwuHIV9uIUyb45VKS3Fg5VQvyeMLOuvbwTBy
         TfIrTGh0KEaTjmwi8kbQX6XoFA63NxhpX4cqrMLRMN3XtcqttyS3hNxCc5sXFJI5kiM8
         2mMXAaMbOU4o4sQ71IjTqg159DSl9zRl1UCey9FwCW64JeJGPJipSPeCnC+ZSJcZ2YH2
         5YcKyTtuwrbhhVwwhuW5iL95gkk1cFOcNSnrfy7/Cmvtm1jS029I8CB3+BcvkipyME7P
         L5Wc6BQU00uo58LLRve4n68cvDFwKYGxNPTriRjhoG0H/B8sjnhR6J8vvdmsFxteksFi
         UZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814832; x=1773419632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CHQw0iiSnYlgicKjMQWpmEGJyBczoqjDPyy2AZz+9Fw=;
        b=u1j9Uihsmz0p8AHQdm7qXCU+gYQu/DU7lp6TkUPKiF4mYtFVFvXsu3qGI8QBvlz/uj
         2ZId7qGQSyjTSkfJEQ+RkSiPlEIkj/bSlzxBJuQYoGaPdJLoAX1fDHu5o28/o0TSECFG
         s79zGaUo9LPQKJ5qpKmWcnY6opiqDGZrzUus5ZiP3ZPRhXmwkuDsqntiuh1ov4qrUpJ1
         6XyEJeBpzi5AQcVxkNh0Cgs0P0OoASqWKSaHI5GJ2oRyYGWmN1ywvYn0RxsINVt78oJf
         fqWGw2yMnqLN0nQHqTbmiaXpde4pWxUT98Mbsy5UUcvxmFzZTbg2jpmmVm6TzM7LSoBS
         qP4A==
X-Gm-Message-State: AOJu0YytURpBvscRr4KgKDBjv5UpP18gLDpYpNeqUHTp95Ys3ClBbM5w
	AmpAlGTXkdUlVW7F8rylpZfa6JsZaTAazDsx/HiNbXIrrUKZbcU9WAv4bO1E6w==
X-Gm-Gg: ATEYQzzDw/7qK0VVfYHQn/qwUn0Cwajn0tGtLat78vTbZdGs/yIIiZUvBYS67TKU4sS
	Fl46bi8plknDQPTA+841Hf0kmr7T4LYT9RC1LW2vOSJRj33Z2QD+wpiChWrUmci7nSP/Jf/O88L
	fmWC7fmuHI+Je4dDESVD+CanhJHz8zRutggOoC1DRNxtiFPimGeWtleIlJTFSAEUCvyh/quLzNr
	woOTVcn40ZAK9WlwdJvZQmMzMObwzSIYPt5VQsGhIVxAmRpeF+GWU9GO2BeoXeBcMnh09+JQodj
	tZHRCxM0F9lsYeXHln+N+lm8ujn0uN7+boZukI7WmLxX5k9oSc3UDRc8i5Z0EeFf002hVEZvGgc
	FBwkn1na9rRi//XOPBcSuaGETiuH+HAz+dIGNCIDro8rat1zbCXv+B9sKhzYljaPE0gp2qwQsws
	uY4arNPM8WFXx7gwBVc7L7GoyTYb5zI+Wm6IMV6f2zJbUq5eIK8BpwkBi/YGZsDqVymg==
X-Received: by 2002:a05:6000:144a:b0:439:bc31:a04d with SMTP id ffacd0b85a97d-439da8941femr4925276f8f.41.1772814832338;
        Fri, 06 Mar 2026 08:33:52 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 12/14] xen/riscv: init tasklet subsystem
Date: Fri,  6 Mar 2026 17:33:29 +0100
Message-ID: <0475cb50e04a48aedd730f2f0ab57381cc26d6ed.1772814110.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772814110.git.oleksii.kurochko@gmail.com>
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9F05B225018
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

As the tasklet subsystem is now initialized, it is necessary to implement
sync_local_execstate(), since it is invoked when something calls
tasklet_softirq_action(), which is registered in tasklet_subsys_init().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6-v7:
 - Nothing changed. Only rebase.
---
Changes in v5:
 - It was something wrong with prev. rebase. So fix that and move
   removing of sync_local_execstate() and sync_vcpu_execstate() to the
   next patch.
---
Changes in v4:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Update the commit message.
 - Move implementation of sync_vcpu_execstate() to separate commit
   as it doesn't connect to tasklet subsystem.
---
 xen/arch/riscv/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index bca6ca09eddd..cae49bb29626 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -12,6 +12,7 @@
 #include <xen/serial.h>
 #include <xen/shutdown.h>
 #include <xen/smp.h>
+#include <xen/tasklet.h>
 #include <xen/timer.h>
 #include <xen/vmap.h>
 #include <xen/xvmalloc.h>
@@ -133,6 +134,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
         panic("Booting using ACPI isn't supported\n");
     }
 
+    tasklet_subsys_init();
+
     init_IRQ();
 
     riscv_fill_hwcap();
-- 
2.53.0


