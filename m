Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAo9I31SsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB1225563A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250576.1548083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00jG-0006Xj-QT; Tue, 10 Mar 2026 17:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250576.1548083; Tue, 10 Mar 2026 17:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00jG-0006U3-M5; Tue, 10 Mar 2026 17:18:46 +0000
Received: by outflank-mailman (input) for mailman id 1250576;
 Tue, 10 Mar 2026 17:18:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aS-0001QA-Ay
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:40 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebbdf6ba-1ca3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 18:09:38 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so37126245e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:38 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:37 -0700 (PDT)
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
X-Inumbo-ID: ebbdf6ba-1ca3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162578; x=1773767378; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkvH963wjORCKzFpDWqD/iOnBC1tRJKt38ThB/X1OSI=;
        b=SVYSgIUc/gt7kFBpsZdXFWHzact7MeXwXv9F+mnUUvkrkyJn8Bevh6HQaqfAcdkkKY
         kWUAb32UPTu82HMqDjZiQjqEwuJ1gyZn74VT/o241iGVU0fIxk+MCUbc0fOpahgpVMKi
         VtxZNbLDrvIQHaZayF//MVmv4vqyYXpT/kMj82eWendYM7NFe7DObRZITAUGL8WxVSJ2
         DgzBxGa0jJq4ANvobdX1j76oRRbypFtwaxG7v9jLAmO+P0LojMMcf3ipdB5cPNYTzzyq
         uKfhkwAKP4RdEaP4w5Zhib97P3ix0CQ0oxbJectwOTqjuf6PFp/fh63VJWJQjK8YwOSN
         LC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162578; x=1773767378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JkvH963wjORCKzFpDWqD/iOnBC1tRJKt38ThB/X1OSI=;
        b=m3k/ah1Dh+10kdcDGiWxVl6AA8YlBewNfWxTqwWkafb2mDoGhVnJq2j9AuDFhbhbbN
         FhRw++uq9HjnkQ0cseyVWhWeUSYz9YGGu89XMHzFZJ7/D7bm8Nm5YybbBeqxqkEc6ZgA
         r4oVsGD560o495hARYe4px9RQVPcutrI4yL0CahwfHPxT/wr7zwAS7f61iISNjzYR9m0
         4I9RG9/+IcgQ/pQNrmVxhC55xkEWOn5MCTuvk/nUa7y39z+LXLtg1ilbw9t72GSA9v/k
         xj8xG+DC6gr00ToVFNRUorWqHU+YE0BSkEIebiCZDZ4yxCWAeEecYDSeAPp62nFkIRK7
         Ef9Q==
X-Gm-Message-State: AOJu0YzEWHPqTfMg9UzjeDeyo87yfXFzgFZ0+PqTOzqzHR0Cxc8zGbpc
	wOiVBwNOBmoF3yyBU1t3gE2M1UPBEOpUkxBFHGFJUqrpTjuM+MWrbNb2TGXEWd7K
X-Gm-Gg: ATEYQzz3wryNyedq9lx0CWPXKrQzuCbcav/dTo8XevhuxMzQOJi/SDJ3Zp9x9qeZ6IR
	Tvupmp9QpIwyVeCZtqwacqsYpZrYYRSCoReEJvcMmiMoXSpNRn0ZnS71momqRiBGhQH6eZNF+3p
	TNCXY+Q1agrzjgGTI1fvjirnzrc/HEq88JDw+vLL+qKbWP21pkQ8R0CM3gbMLtlzn7Boe0FyU2K
	8zFn5zm0vTcXLC2Y9sadSfJ0ZOV+/UYrI+F8l1IdCC5m4BTOPsVp9qgbnzoNo/X+AeNDitaprWo
	Pvf3uQd8lxyrcEv3ZEIGv/qXz8K0YWGClwCIl9iQ834lt06wiTlxpETa2ILK4k7lBt+VOheYuus
	mEqBmLApVPIv+8trUK2wSShFv7oYpME282Hhzdk+Ki4vJ/D9svKWHaP7cLCrYryK+rGtohF4IHH
	BS/tA21Ejd4R1g/IzA7QiQyNZ2pP6BfWTuzl7vrFU+Eqpa1claQ7AtQBUDtFw5ZFumeVj+kA==
X-Received: by 2002:a05:600c:1d0b:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-48541369c0cmr82135465e9.22.1773162577766;
        Tue, 10 Mar 2026 10:09:37 -0700 (PDT)
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
Subject: [PATCH v1 24/27] xen/riscv: init rcu
Date: Tue, 10 Mar 2026 18:08:57 +0100
Message-ID: <c55191b5c4ec8f42bc73bfb2d680945b439c6db6.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7BB1225563A
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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 24bad0c606a5..3e337bf611fb 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -9,6 +9,7 @@
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/mm.h>
+#include <xen/rcupdate.h>
 #include <xen/sched.h>
 #include <xen/serial.h>
 #include <xen/shutdown.h>
@@ -154,6 +155,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     timer_init();
 
+    rcu_init();
+
     local_irq_enable();
 
     console_init_postirq();
-- 
2.53.0


