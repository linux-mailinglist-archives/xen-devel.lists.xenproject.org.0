Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNTjEhEmommG0QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD2A1BEF4B
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243232.1543264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw75O-0007V2-3g; Fri, 27 Feb 2026 23:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243232.1543264; Fri, 27 Feb 2026 23:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw75O-0007Qw-0W; Fri, 27 Feb 2026 23:17:30 +0000
Received: by outflank-mailman (input) for mailman id 1243232;
 Fri, 27 Feb 2026 23:17:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vw74t-0001Do-21
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 23:16:59 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68457e39-1432-11f1-9ccf-f158ae23cfc8;
 Sat, 28 Feb 2026 00:16:55 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4398f8e2837so2228203f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 15:16:55 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8e8sm9680306f8f.10.2026.02.27.15.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:16:52 -0800 (PST)
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
X-Inumbo-ID: 68457e39-1432-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772234215; x=1772839015; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15zWx1qA8rFF4HWlAuchK/hb06gvUooknaZohCqKUPM=;
        b=gA5HPosuZY0sgr9RKW7vL/IlCwdrJsKS0i2R5ajdi7HQaaTgB5jVqb1PYgC5P1Rq+T
         ZAHEHOXzouLrhKkjPhAdWcDJ5CLk8u1QXGKuJJEnGn1f/GAFVdLcd3brameTli/IJ6rW
         C/oyhcPeLzHWSkrbP+8YcnNuVOm8mYuqg1+mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234215; x=1772839015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=15zWx1qA8rFF4HWlAuchK/hb06gvUooknaZohCqKUPM=;
        b=gPkz2llYAEJtMs8F3OCQtis6W9CC767+rD0yoxQ1ciLcoYObdsFpCGMx+1IqpEx0O0
         Luk84Alkoau1rBBxRk0YtRU44JIIm4Nnfj2EyA3U/RAUeRLDKHqU9zjPHYI0jJYslveO
         uw5pWhuDFY0tAf53q0zrQQKiyWIuxR0MOo+DwVgDHCXn6cxiOYIEE9mXeKm4TyUgHxLJ
         X8WWdxSOW6BWUA23OYsrUqk/JERcHXK/QBGCMqig2yRhfZvK608g8/1DLhhohRMHxc3j
         d6Hy2fVf33nnCxtH7Y4ysIxIqDUCs5jugz79L+Bf7+JM0c7Y1Nei3JsSAYpxo4azm61s
         B8VQ==
X-Gm-Message-State: AOJu0YzM3uzxaAEnSyJR1Of4Im9hzqd2bkMpaY1UeKe8oT4OSiLyw1DX
	hCRsH1a2roj5b/jVGFvHOyWmJxL9Y8JLwHfXyACVlFkWK8vKLFC6VUTNtZ/wNO/Y9CNx0H3bPoO
	e6XYr
X-Gm-Gg: ATEYQzw+p6xljYYIBunjpviBiMAkoh8JYTGzNyTZ+2hqDn5gIcHEgz9i2cl/bb+gelQ
	grbgK+KI0s6hJ9CaPEJAlVD7x8bXHtCbX3kOHaiyDVEBBHhW2Pfnw4/9pJDzpvAWPISSM0S3s9U
	R73vvDhrRXtAVPs9H2pDWKC49nbmbKT2fZQ7FgNXh6JxmthFU/AdJLS73U2aNcwaUprhUGZqSqi
	paycop1BDkNc+FBEQwo35Z6pXQdUDsmxgs0skAvV5Rf2nJCHOArHM7ARlGo9eKVGnEou8981lXW
	fBAHHEvQSN2rYS427Sn2xVxIa+P3/9GbiTIc3Jbtmj/Y+d5252cmHXvNohuYuY4wO6KZFZ/TG3E
	yDJqNxfcQlb8fjwDJG4yxDKaxYIHRWwshD5pbAHHzsqRJrdcI4ItKFUw3Ea48xJYWRyVG2osKtw
	PjuiRrLqELhDO3ytfSy6IjaKdXM6aDsfhJaK0IdyVmbQEh4igasXYtp/HxmQQmFoRN6rtQezU=
X-Received: by 2002:a05:6000:603:b0:432:a9db:f9a2 with SMTP id ffacd0b85a97d-4399de2b52amr8236751f8f.41.1772234214125;
        Fri, 27 Feb 2026 15:16:54 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 14/14] x86/traps: Use fatal_trap() for #UD and #GP
Date: Fri, 27 Feb 2026 23:16:36 +0000
Message-Id: <20260227231636.3955109-15-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email,suse.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EFD2A1BEF4B
X-Rspamd-Action: no action

This renders the diagnostics in a more uniform way.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v4:
 * New

PF and CP are more complicated and not converted yet.
---
 xen/arch/x86/traps.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e2c35a046e6b..c04ab484ad27 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1375,8 +1375,7 @@ void asmlinkage do_invalid_op(struct cpu_user_regs *regs)
     if ( likely(extable_fixup(regs, true)) )
         return;
 
-    show_execution_state(regs);
-    panic("FATAL TRAP: vector = %d (invalid opcode)\n", X86_EXC_UD);
+    fatal_trap(regs, false);
 }
 
 void asmlinkage do_int3(struct cpu_user_regs *regs)
@@ -1475,8 +1474,7 @@ void do_general_protection(struct cpu_user_regs *regs)
         return;
 
  hardware_gp:
-    show_execution_state(regs);
-    panic("GENERAL PROTECTION FAULT\n[error_code=%04x]\n", regs->error_code);
+    fatal_trap(regs, false);
 }
 
 #ifdef CONFIG_PV
-- 
2.39.5


