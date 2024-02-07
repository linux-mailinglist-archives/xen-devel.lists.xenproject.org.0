Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A7284D1EB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 20:03:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677878.1054780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXnBu-0000wP-9Z; Wed, 07 Feb 2024 19:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677878.1054780; Wed, 07 Feb 2024 19:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXnBu-0000tX-6C; Wed, 07 Feb 2024 19:02:38 +0000
Received: by outflank-mailman (input) for mailman id 677878;
 Wed, 07 Feb 2024 19:02:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oL7s=JQ=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1rXnBs-0000tR-Tg
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 19:02:37 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 743332e9-c5eb-11ee-8a4a-1f161083a0e0;
 Wed, 07 Feb 2024 20:02:35 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4101565d20bso7849855e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 11:02:35 -0800 (PST)
Received: from localhost.localdomain (82-64-138-184.subs.proxad.net.
 [82.64.138.184]) by smtp.googlemail.com with ESMTPSA id
 h13-20020a05600c314d00b0040fdc7f4fcdsm6226198wmo.4.2024.02.07.11.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 11:02:34 -0800 (PST)
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
X-Inumbo-ID: 743332e9-c5eb-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20230601.gappssmtp.com; s=20230601; t=1707332555; x=1707937355; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mdaTCdI8ySFmu0E5W0G1WTxxRBPa6Pci0/ksty6Vs5I=;
        b=kgZaPz0LHeePYMcHpUHMZtV83hlGrWjIhf797dI/kS1knPZzBWehfCoeXkRDNQFGnc
         Ae8r7BgGyDlJ7RgDWtkJdWktd1zzRaOhFjFtK67Z8OpnIC4BW/ZaK0hJQVcWl8lioq2o
         pzTj4IhTH8jAjkELsUIDgivZYwxkRLhVQxJbnS5EazQ2op9Of+S/5mlYp7WrpQMmvOOA
         jA8ywzWEal11Qk47vqS4R5zw2Q3GxQvTFPR4eAjFUn6g0pAj7YiZTjHzj+/bGxUscAno
         sihy/P2pN6NGPaHm2XQa1JVMLFrD7LducrAUeHcEynu/oqxeWx397zHzqICoRM4wK5Sv
         KlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707332555; x=1707937355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdaTCdI8ySFmu0E5W0G1WTxxRBPa6Pci0/ksty6Vs5I=;
        b=YD1NIO0ha9PXvLjWTIZTedLGNSuru8bIb/Nmg5LpdJ3eOIOH5PzeL72XafTlMRrksp
         t6esxSUKHX1HtzLX5Lnr8ddxYnWvHklxgWX3W6lCjs3RBSw+xOhpLLAqGTA4XmzQ6++9
         OCZAJ2UP8GJvQuxN+9lcBXcy4OItF50WNk7EKjDczcbGbWZHLSzExb/2O2xi41SY7NGR
         FGryN0KmwHDHol2H3mgMwZLgHRfUTatnZ7/LbmqqD4clZtATpIwQH6TLbRS9BIKbhBJV
         hcz71t4ASQ9vETTrePSHyJnu2C03w5YCf0++wZY02Go4jC/u63MiM6ahnXa3F3oyTl2+
         CrPw==
X-Gm-Message-State: AOJu0YwlZuxFR/d6sTnwf2E2YMGOm2XVXg372fijweCLACXp+2XhZ/Tr
	7OaqLTNLus/o6w1rQUrNa8ppYtetpD0hfSlT4dCUaZWgzihCaDQSBlAehf/vTdZUMegxElLahlz
	rvWI=
X-Google-Smtp-Source: AGHT+IF7eD5p5sY0u42jubYJxmZ6uK7J9JFWJ+gQzZsPSpO0aJ8KqByWvwfkeqnif513snA43+OGzg==
X-Received: by 2002:a05:600c:310d:b0:40f:d162:944c with SMTP id g13-20020a05600c310d00b0040fd162944cmr5581668wmo.31.1707332554662;
        Wed, 07 Feb 2024 11:02:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6E0vfHCynkqxv+VCQGiERZIf7DKowp3PzAkd48ZDkn2wJvD8KNrswi5/SQL8DP3zScyGd80phSmCCjA+4f1EzbQbSC7MfTeF7OZAcObGPsDi87udr
From: =?UTF-8?q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Cyril=20R=C3=A9bert?= <slack@rabbit.lu>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3] tools/xentop: add option to display dom0 first
Date: Wed,  7 Feb 2024 20:02:00 +0100
Message-Id: <92ef4d230e05970e1d685b03125fce44adc55010.1707331801.git.slack@rabbit.lu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Cyril Rébert <slack@rabbit.lu>

Add a command line option to xentop to be able to display dom0 first, on top of the list.
This is unconditional, so sorting domains with the S option will also ignore dom0.

Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>
---
Changes in v3:
(none, just reformatting patch correctly ... hopefully ?!)
---
Changes in v2:
- bug fix
- add documentation
---
 docs/man/xentop.1.pod |  6 +++++-
 tools/xentop/xentop.c | 30 +++++++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 4 deletions(-)

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
index 545bd5e96d..0a2fab7f15 100644
--- a/tools/xentop/xentop.c
+++ b/tools/xentop/xentop.c
@@ -211,6 +211,7 @@ int show_networks = 0;
 int show_vbds = 0;
 int repeat_header = 0;
 int show_full_name = 0;
+int dom0_first = 0;
 #define PROMPT_VAL_LEN 80
 const char *prompt = NULL;
 char prompt_val[PROMPT_VAL_LEN];
@@ -240,6 +241,7 @@ static void usage(const char *program)
 	       "-b, --batch	     output in batch mode, no user input accepted\n"
 	       "-i, --iterations     number of iterations before exiting\n"
 	       "-f, --full-name      output the full domain name (not truncated)\n"
+	       "-z, --dom0-first     display dom0 first (ignore sorting)\n"
 	       "\n" XENTOP_BUGSTO,
 	       program);
 	return;
@@ -1163,6 +1165,8 @@ static void top(void)
 {
 	xenstat_domain **domains;
 	unsigned int i, num_domains = 0;
+	int dom0_index = -1;
+	int sort_start = 0, sort_count = 0;
 
 	/* Now get the node information */
 	if (prev_node != NULL)
@@ -1183,11 +1187,27 @@ static void top(void)
 	if(domains == NULL)
 		fail("Failed to allocate memory\n");
 
-	for (i=0; i < num_domains; i++)
+	for (i=0; i < num_domains; i++) {
 		domains[i] = xenstat_node_domain_by_index(cur_node, i);
+		if ( strcmp(xenstat_domain_name(domains[i]), "Domain-0") == 0 )
+			dom0_index = i;
+	}
+
+	/* Handle dom0 position, not for dom0-less */
+	if ( dom0_first == 1 && dom0_index != -1 ){
+		/* if dom0 is not first in domains, swap it there */
+		if ( dom0_index != 0 ){
+			xenstat_domain *tmp;
+			tmp = domains[0];
+			domains[0] = domains[dom0_index];
+			domains[dom0_index] = tmp;
+		}
+		sort_start = 1;
+		sort_count = 1;
+	}
 
 	/* Sort */
-	qsort(domains, num_domains, sizeof(xenstat_domain *),
+	qsort((domains+sort_start), (num_domains-sort_count), sizeof(xenstat_domain *),
 	      (int(*)(const void *, const void *))compare_domains);
 
 	if(first_domain_index >= num_domains)
@@ -1242,9 +1262,10 @@ int main(int argc, char **argv)
 		{ "batch",	   no_argument,	      NULL, 'b' },
 		{ "iterations",	   required_argument, NULL, 'i' },
 		{ "full-name",     no_argument,       NULL, 'f' },
+		{ "dom0-first",    no_argument,       NULL, 'z' },
 		{ 0, 0, 0, 0 },
 	};
-	const char *sopts = "hVnxrvd:bi:f";
+	const char *sopts = "hVnxrvd:bi:fz";
 
 	if (atexit(cleanup) != 0)
 		fail("Failed to install cleanup handler.\n");
@@ -1286,6 +1307,9 @@ int main(int argc, char **argv)
 		case 'f':
 			show_full_name = 1;
 			break;
+		case 'z':
+			dom0_first = 1;
+			break;
 		}
 	}
 
-- 
2.39.2


