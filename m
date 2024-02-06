Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D36D84B920
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 16:17:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676982.1053362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXNBt-0003OO-Ok; Tue, 06 Feb 2024 15:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676982.1053362; Tue, 06 Feb 2024 15:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXNBt-0003Mq-M1; Tue, 06 Feb 2024 15:16:53 +0000
Received: by outflank-mailman (input) for mailman id 676982;
 Tue, 06 Feb 2024 15:16:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8l/=JP=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1rXNBt-0003Mk-5t
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 15:16:53 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c001537d-c502-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 16:16:49 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33b1a51743fso4194516f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 07:16:49 -0800 (PST)
Received: from localhost.localdomain (82-64-138-184.subs.proxad.net.
 [82.64.138.184]) by smtp.googlemail.com with ESMTPSA id
 r13-20020a05600c458d00b0040fe5994d0csm1931007wmo.0.2024.02.06.07.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 07:16:48 -0800 (PST)
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
X-Inumbo-ID: c001537d-c502-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20230601.gappssmtp.com; s=20230601; t=1707232609; x=1707837409; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nt3pBAxgAVXBBQ7nYfBf27vXYcq8ELUyng70/ndviP0=;
        b=MwF4JPWs88huWm+0kdmpSiOyBRXIGLZNQWj7mrhIsbmEJy6iF8vZNaAy1O2tRGKbw8
         rC+hHdyDad/0TuRR7x4GevISidyUAmsXEPR96PelreiOpHqfITFuT1VPvYNq+KZt1yhp
         CafRefUmXKIdT7Y4ozTauDqNzLNeS7NNAGd976OQ3eoH2ayx+6eqZDusu8OoZrXl7e/l
         HIJRCjObeKhR65cx/wQDx3AgxDiIrPsl9SnbH1Tx9Db0O1KookW/ZLSjGSq/CWf07aw+
         B0rW4ZxLDSUayKh7D1wHCGaqgma5m6uoqxQNW7fyZhVKA670JbHkzzogaWxMh6jnZuuV
         0fHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707232609; x=1707837409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nt3pBAxgAVXBBQ7nYfBf27vXYcq8ELUyng70/ndviP0=;
        b=GyGbPn/eExiGPJE6WNTpm03xV67W6jJPKTW1EQazUQByrNcePntXzZ/BSRWqkj8ToR
         ZoEZSSSoX1lc+FSq6BclCC5okNakeXQixRMjP1kTEqr+qIPjlRH3zG4KQOXw1lanR0Io
         riDfRv+Kdcz9TiDIeunXq4sBvOQQunK6eklAnNESoinqhESYA1FAkJD2/PkHt33zBTDA
         tzd8THGdaS6YYnFVmVADU/L37FkMpTPAif73Xl4Bo5wF8LyXXnjAIok10lqAjxQNDSih
         u+S18o9FcC2hfqWubSWWdXXZQLC7/nQ2oitEmf4ZX8muO4DM72HMIYGaTpl5oFT6knZD
         U78g==
X-Gm-Message-State: AOJu0YyWVoaP2xUkuHZsNFkyRtScn+0RlmTXUZKlBfdafMwZxIhcSCOZ
	zuqMl3KPiM3UZThSFEuSluOPQP8AaRBwWoaVWMruI58k8ApWfW/4tMgl5KiXfIjdrMYpCnHIZPY
	gQ1g=
X-Google-Smtp-Source: AGHT+IFNo9k+1iOcZnBCKBwduPLLIMWgCsta3NPB65LSqL99J59FrXholPdx7B1B+lB+TLYX8imb9Q==
X-Received: by 2002:a5d:5f8d:0:b0:33b:28c0:7c98 with SMTP id dr13-20020a5d5f8d000000b0033b28c07c98mr1617011wrb.61.1707232609219;
        Tue, 06 Feb 2024 07:16:49 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXOz4P2x4qja9CRke+qbQ3doz3a6hQjUCoHZIa/ktjRfGa61FIdkP+FfKZLLwT5QzqGC8c9dB8dyLUNVFYytEPdt8mVJt6L7LGEVE1DCOEva7pLf4Sb
From: =?UTF-8?q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2] tools/xentop: add option to display dom0 first
Date: Tue,  6 Feb 2024 16:15:45 +0100
Message-Id: <efdca3e0c02576c624403d273c7168c9303fcc52.1707232545.git.slack@rabbit.lu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a command line option to xentop to be able to display dom0 first, on top of the list.
This is unconditional, so sorting domains with the S option will also ignore dom0.

Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>

---
Changes in v2:
- bug fix
- add documentation
---
 docs/man/xentop.1.pod | 6 +++++-
 tools/xentop/xentop.c | 5 +++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/docs/man/xentop.1.pod b/docs/man/xentop.1.pod
index 126f43d2f3..593a484ce7 100644
--- a/docs/man/xentop.1.pod
+++ b/docs/man/xentop.1.pod
@@ -5,7 +5,7 @@ xentop - displays real-time information about a Xen system and domains
 =head1 SYNOPSIS
 
 B<xentop> [B<-h>] [B<-V>] [B<-d>SECONDS] [B<-n>] [B<-r>] [B<-v>] [B<-f>]
-[B<-b>] [B<-i>ITERATIONS]
+[B<-b>] [B<-i>ITERATIONS] [B<-z>]
 
 =head1 DESCRIPTION
 
@@ -57,6 +57,10 @@ output data in batch mode (to stdout)
 
 maximum number of iterations xentop should produce before ending
 
+=item B<-z>, B<--dom0-first>
+
+display dom0 first, ignoring interactive sorting
+
 =back
 
 =head1 INTERACTIVE COMMANDS
diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
index 9068c53fd2..5462e6a426 100644
--- a/tools/xentop/xentop.c
+++ b/tools/xentop/xentop.c
@@ -211,7 +211,7 @@ int show_networks = 0;
 int show_vbds = 0;
 int repeat_header = 0;
 int show_full_name = 0;
-int dom0_first = -1;
+int dom0_first = 0;
 #define PROMPT_VAL_LEN 80
 const char *prompt = NULL;
 char prompt_val[PROMPT_VAL_LEN];
@@ -1164,8 +1164,9 @@ void do_vbd(xenstat_domain *domain)
 static void top(void)
 {
 	xenstat_domain **domains;
-	unsigned int i, num_domains, sort_start, sort_count = 0;
+	unsigned int i, num_domains = 0;
 	int dom0_index = -1;
+	int sort_start = 0, sort_count = 0;
 
 	/* Now get the node information */
 	if (prev_node != NULL)
-- 
2.39.2


