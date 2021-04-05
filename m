Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6763B354501
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 18:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105453.201870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRsB-0005WH-3h; Mon, 05 Apr 2021 16:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105453.201870; Mon, 05 Apr 2021 16:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRsA-0005VW-MC; Mon, 05 Apr 2021 16:14:42 +0000
Received: by outflank-mailman (input) for mailman id 105453;
 Mon, 05 Apr 2021 16:14:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRs7-0005U5-PK
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 16:14:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRs6-0003f0-O5; Mon, 05 Apr 2021 16:14:38 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbY-00053b-0I; Mon, 05 Apr 2021 15:57:32 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=1rVbgSKi2I81qCiY+TmphdtF7pMSqnTa8m6g9BTXjUI=; b=QZuh8HPVEcn1Kzdt/lFtkO/nW
	RtCGPYMVw2cVNrH0epDwZ5Eo55VeWcPPnYZT8x4dAa7KnvS6EKNMGh53IcV1wAp0/Y2tMhN95jMbC
	tD7vY3/eGnfiQp7Tuz+9FF1nTVSjCvFIfTP0BR/89L2N12L2cY/ZBBtCMBXG2pWY291NI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 12/14] tools/top: The string parameter in set_prompt() and set_delay() should be const
Date: Mon,  5 Apr 2021 16:57:11 +0100
Message-Id: <20210405155713.29754-13-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
References: <20210405155713.29754-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Neither string parameter in set_prompt() and set_delay() are meant to
be modified. In particular, new_prompt can point to a literal string.

So mark the two parameters as const and propagate it.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xentop/xentop.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
index ebed070c0fa2..950e8935c4c1 100644
--- a/tools/xentop/xentop.c
+++ b/tools/xentop/xentop.c
@@ -81,8 +81,8 @@ static int current_row(void);
 static int lines(void);
 static void print(const char *, ...) __attribute__((format(printf,1,2)));
 static void attr_addstr(int attr, const char *str);
-static void set_delay(char *value);
-static void set_prompt(char *new_prompt, void (*func)(char *));
+static void set_delay(const char *value);
+static void set_prompt(const char *new_prompt, void (*func)(const char *));
 static int handle_key(int);
 static int compare(unsigned long long, unsigned long long);
 static int compare_domains(xenstat_domain **, xenstat_domain **);
@@ -212,10 +212,10 @@ int show_vbds = 0;
 int repeat_header = 0;
 int show_full_name = 0;
 #define PROMPT_VAL_LEN 80
-char *prompt = NULL;
+const char *prompt = NULL;
 char prompt_val[PROMPT_VAL_LEN];
 int prompt_val_len = 0;
-void (*prompt_complete_func)(char *);
+void (*prompt_complete_func)(const char *);
 
 static WINDOW *cwin;
 
@@ -331,7 +331,7 @@ static void attr_addstr(int attr, const char *str)
 }
 
 /* Handle setting the delay from the user-supplied value in prompt_val */
-static void set_delay(char *value)
+static void set_delay(const char *value)
 {
 	int new_delay;
 	new_delay = atoi(value);
@@ -341,7 +341,7 @@ static void set_delay(char *value)
 
 /* Enable prompting mode with the given prompt string; call the given function
  * when a value is available. */
-static void set_prompt(char *new_prompt, void (*func)(char *))
+static void set_prompt(const char *new_prompt, void (*func)(const char *))
 {
 	prompt = new_prompt;
 	prompt_val[0] = '\0';
-- 
2.17.1


