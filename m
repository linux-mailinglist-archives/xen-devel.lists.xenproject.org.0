Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59BF844685
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 18:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674145.1048910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVEkd-0007tx-PZ; Wed, 31 Jan 2024 17:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674145.1048910; Wed, 31 Jan 2024 17:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVEkd-0007rn-MX; Wed, 31 Jan 2024 17:51:55 +0000
Received: by outflank-mailman (input) for mailman id 674145;
 Wed, 31 Jan 2024 17:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qP3Y=JJ=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1rVEkc-0007rf-9A
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 17:51:54 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ad6abe7-c061-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 18:51:53 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-51117bfd452so4350335e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 09:51:53 -0800 (PST)
Received: from localhost.localdomain (82-64-138-184.subs.proxad.net.
 [82.64.138.184]) by smtp.googlemail.com with ESMTPSA id
 18-20020a05600c025200b0040d4e1393dcsm2202014wmj.20.2024.01.31.09.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 09:51:52 -0800 (PST)
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
X-Inumbo-ID: 6ad6abe7-c061-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20230601.gappssmtp.com; s=20230601; t=1706723513; x=1707328313; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pr+XZeL59/ULvCtUWLkROAH0Yyo92CQbvVTj7VVhUqA=;
        b=Y/ovmtSEeuZrzozgZaqGHLwvWHX20FIkUiUYg7Sj/iSAHclxijOXbEQXSsrbHP5Dvh
         gsu5m6Ias6jWEU+gMrVAcyeEATbm311jUjdiVSnd7i8soQldM/baAGNoAipJKajBnuLd
         6qRpUWoy0+lhgSF9cjeLeU8Hy4qMk1s8F6gpg+dAq9fA/6AG2mUGRTZRgHgaJh1zAknb
         9vbOYyhLGenZbXvewbyzgnOt7FwphSMf3xJ+wjDQWovTpsIcu2ah5xmEKr75vNz4csbQ
         qHEjzkBYungUz2lIh6ch+c9TzI0Fxx40i/0lnt2BbyPlsstA1chZxUZzTy4uUCIUqU09
         OaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706723513; x=1707328313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pr+XZeL59/ULvCtUWLkROAH0Yyo92CQbvVTj7VVhUqA=;
        b=E6cGAe7QbVsRSLr/MEV/QJYISHGWNe4Ud+9VE6ccrnU+grghH8KCZJOQ33s8K614vr
         GnX0tBTLdCkBJ/IlUGdpcAVmAoFYD0YTUWDt3M9oNifxYlsXZRLn/W2r+kajRvSZUkav
         +/N40qXCNqQJ2v2fzq94eV6cu1CbkdSWAd5QW9OFkBlXVJI8uewxK4um9eklQ93i8OpT
         K6txBnV3nUdNIUigeePa7RkKoqhFgPserpyiVT7T5Ksa5BuT+K1+ZTCUKO/E4yDbjFM3
         uNNNXTZvm6wFt97aFyrqbBgRE+tkAZ2pOCsPg4/3qTSzVi9/C+jpz7n/Dui+pm5z/68P
         EYlQ==
X-Gm-Message-State: AOJu0YzXcxBDRa2aNpF4SbvMB++riGuKnkqmoJ40sjjypTlpYK3len2p
	w3D5KNlFmaHvCfGa69vgz4HxfH6Jdz8ZFBMMMCGyH7RbWAiyzeRUeHW9O9vCmLqke835Wp0ZsjP
	P
X-Google-Smtp-Source: AGHT+IFeAqpG/JV+ntc6HGPNu0pS034ko1aPLuX6cqVhzAK0zOC7vgHGR1gw3hZmwBHVEXSS9NDBTQ==
X-Received: by 2002:ac2:5a0c:0:b0:50e:504e:6c34 with SMTP id q12-20020ac25a0c000000b0050e504e6c34mr148354lfn.3.1706723512707;
        Wed, 31 Jan 2024 09:51:52 -0800 (PST)
From: =?UTF-8?q?Cyril=20R=C3=A9bert?= <slack@rabbit.lu>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Cyril=20R=C3=A9bert?= <slack@rabbit.lu>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xentop: add option to display dom0 first
Date: Wed, 31 Jan 2024 18:51:34 +0100
Message-Id: <87846acd5b31991e38561c9765eb97730c79d0f3.1706723494.git.slack@rabbit.lu>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a command line option to xentop to be able to display dom0 first, on top of the list.
This is unconditional, so sorting domains with the S option will also ignore dom0.

Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>
---
 tools/xentop/xentop.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
index 950e8935c4..9068c53fd2 100644
--- a/tools/xentop/xentop.c
+++ b/tools/xentop/xentop.c
@@ -211,6 +211,7 @@ int show_networks = 0;
 int show_vbds = 0;
 int repeat_header = 0;
 int show_full_name = 0;
+int dom0_first = -1;
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
@@ -1162,7 +1164,8 @@ void do_vbd(xenstat_domain *domain)
 static void top(void)
 {
 	xenstat_domain **domains;
-	unsigned int i, num_domains = 0;
+	unsigned int i, num_domains, sort_start, sort_count = 0;
+	int dom0_index = -1;
 
 	/* Now get the node information */
 	if (prev_node != NULL)
@@ -1183,11 +1186,27 @@ static void top(void)
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
@@ -1242,9 +1261,10 @@ int main(int argc, char **argv)
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
@@ -1286,6 +1306,9 @@ int main(int argc, char **argv)
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


