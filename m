Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E37B8B5C38
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:01:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714129.1115194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SUu-0007Qz-9J; Mon, 29 Apr 2024 15:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714129.1115194; Mon, 29 Apr 2024 15:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SUu-0007O7-4B; Mon, 29 Apr 2024 15:00:52 +0000
Received: by outflank-mailman (input) for mailman id 714129;
 Mon, 29 Apr 2024 15:00:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXAa=MC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1SUs-0006Ve-Mh
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:00:50 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 435b60d9-0639-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 17:00:49 +0200 (CEST)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-6a0b68733f5so17121996d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:00:49 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 mg22-20020a056214561600b006a0cd4c2d9bsm1081568qvb.28.2024.04.29.08.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:00:46 -0700 (PDT)
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
X-Inumbo-ID: 435b60d9-0639-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714402847; x=1715007647; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQz1eJLG5RTUbfOfXgpL5NrHKeTAiJtLKKFiPXfVznk=;
        b=WB/hh2C8gS8Z/CsJQadz2EmKNa0AWHuIp4F4l2ReRO0KshtHSkwq8yWCGPXJQMyKZu
         QkTnoCd3BpxcqzcAWfUjCP9/UsAw6eZtBEbL8stee84kl1PhU0QLqydtw4l6vkKDigxz
         f065T72fguBaQG3LXRZIZFTi9n+UP+UTF8sa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714402847; x=1715007647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQz1eJLG5RTUbfOfXgpL5NrHKeTAiJtLKKFiPXfVznk=;
        b=jpMWCzd+5zncRVuHC4cMPhhTEH2r6fNX6hhOS7yC588xGAbeZwrS5hjngMK5QLxC6V
         a8SgLTQz7KeTgFVhaL58HzbldSCrljzxhBAHhgucBxXCxhYa2Tkgw2JsORsylgJqrmP0
         WSAqKLo9xF156qlS9wTrdFarL33lWXYo4+rr5Xg+ipGACYM6AiVDIVLvUDpGyEFe1VHB
         /yMxpsKmysxd54iftMG12QoDeN4jgLUyH+P0TnyAB3Jk/F1aXgFxhobEjdAO1EoP9z/+
         EsmXEJ3opA80lcQhHrr36/DAor4r3iFpO1X8x9hlubviLeaKZHHw+fic9AbxaBEdwQG/
         PRBg==
X-Gm-Message-State: AOJu0Yz6Ko6cz8BeWqmTNWvnAhTKvu11HNLS/qRYP4P7o7E1bomiuKEL
	1xbbkvnUKmrpolgQs1a95vogojI3YrX8MQWcIFhN7fs5OIAE7buMgdj0gMzElqJdBM2kISwU5ma
	r
X-Google-Smtp-Source: AGHT+IEXBtTgAfpV3p39ATbcVjeU7BTkltXUUJMbnqzj2OpTZpuakYk2/N+6I2Nt2geVhKOHwwNukA==
X-Received: by 2002:a05:6214:250a:b0:6a0:c9eb:25db with SMTP id gf10-20020a056214250a00b006a0c9eb25dbmr4996306qvb.8.1714402846918;
        Mon, 29 Apr 2024 08:00:46 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 5/9] create-diff-object: move kpatch_include_symbol()
Date: Mon, 29 Apr 2024 16:56:50 +0200
Message-ID: <20240429145654.71669-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429145654.71669-1-roger.pau@citrix.com>
References: <20240429145654.71669-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

So it can be used by kpatch_process_special_sections() in further changes.

Non functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 create-diff-object.c | 74 ++++++++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/create-diff-object.c b/create-diff-object.c
index 6a751bf3b789..7674d972e301 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1198,6 +1198,43 @@ void kpatch_update_ex_table_addend(struct kpatch_elf *kelf,
 	}
 }
 
+#define inc_printf(fmt, ...) \
+	log_debug("%*s" fmt, recurselevel, "", ##__VA_ARGS__);
+
+static void kpatch_include_symbol(struct symbol *sym, int recurselevel)
+{
+	struct rela *rela;
+	struct section *sec;
+
+	inc_printf("start include_symbol(%s)\n", sym->name);
+	sym->include = 1;
+	inc_printf("symbol %s is included\n", sym->name);
+	/*
+	 * Check if sym is a non-local symbol (sym->sec is NULL) or
+	 * if an unchanged local symbol.  This a base case for the
+	 * inclusion recursion.
+	 */
+	if (!sym->sec || sym->sec->include ||
+	    (sym->type != STT_SECTION && sym->status == SAME))
+		goto out;
+	sec = sym->sec;
+	sec->include = 1;
+	inc_printf("section %s is included\n", sec->name);
+	if (sec->secsym && sec->secsym != sym) {
+		sec->secsym->include = 1;
+		inc_printf("section symbol %s is included\n", sec->secsym->name);
+	}
+	if (!sec->rela)
+		goto out;
+	sec->rela->include = 1;
+	inc_printf("section %s is included\n", sec->rela->name);
+	list_for_each_entry(rela, &sec->rela->relas, list)
+		kpatch_include_symbol(rela->sym, recurselevel+1);
+out:
+	inc_printf("end include_symbol(%s)\n", sym->name);
+	return;
+}
+
 static void kpatch_regenerate_special_section(struct kpatch_elf *kelf,
 				              struct special_section *special,
 				              struct section *sec)
@@ -1455,43 +1492,6 @@ static void kpatch_include_standard_string_elements(struct kpatch_elf *kelf)
 	}
 }
 
-#define inc_printf(fmt, ...) \
-	log_debug("%*s" fmt, recurselevel, "", ##__VA_ARGS__);
-
-static void kpatch_include_symbol(struct symbol *sym, int recurselevel)
-{
-	struct rela *rela;
-	struct section *sec;
-
-	inc_printf("start include_symbol(%s)\n", sym->name);
-	sym->include = 1;
-	inc_printf("symbol %s is included\n", sym->name);
-	/*
-	 * Check if sym is a non-local symbol (sym->sec is NULL) or
-	 * if an unchanged local symbol.  This a base case for the
-	 * inclusion recursion.
-	 */
-	if (!sym->sec || sym->sec->include ||
-	    (sym->type != STT_SECTION && sym->status == SAME))
-		goto out;
-	sec = sym->sec;
-	sec->include = 1;
-	inc_printf("section %s is included\n", sec->name);
-	if (sec->secsym && sec->secsym != sym) {
-		sec->secsym->include = 1;
-		inc_printf("section symbol %s is included\n", sec->secsym->name);
-	}
-	if (!sec->rela)
-		goto out;
-	sec->rela->include = 1;
-	inc_printf("section %s is included\n", sec->rela->name);
-	list_for_each_entry(rela, &sec->rela->relas, list)
-		kpatch_include_symbol(rela->sym, recurselevel+1);
-out:
-	inc_printf("end include_symbol(%s)\n", sym->name);
-	return;
-}
-
 static int kpatch_include_changed_functions(struct kpatch_elf *kelf)
 {
 	struct symbol *sym;
-- 
2.44.0


