Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263688B5C39
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714130.1115204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SUv-0007hz-HM; Mon, 29 Apr 2024 15:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714130.1115204; Mon, 29 Apr 2024 15:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SUv-0007dd-E8; Mon, 29 Apr 2024 15:00:53 +0000
Received: by outflank-mailman (input) for mailman id 714130;
 Mon, 29 Apr 2024 15:00:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXAa=MC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1SUu-00061u-Ad
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:00:52 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44fcd359-0639-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:00:51 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-790c36dcee9so177920385a.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:00:51 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 k17-20020a0cc791000000b0069b5672bab8sm2931726qvj.134.2024.04.29.08.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:00:48 -0700 (PDT)
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
X-Inumbo-ID: 44fcd359-0639-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714402850; x=1715007650; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xd4lZ7/Bfmvxjs4M6E3w4HW0FfqXGJAqEEwuT6BA+iE=;
        b=rbVFcPHsOSAbgLMMImyT1StCMuT3dmIt2kVVFVVpzUMgkq4+bKr84gB7SM9AOQQOyk
         CFmDA1Q4bw1bR6lPRQ/Tnwz2MxSUHe887FHOwwSwG7/wYZagNENBLHOfWOgPgnb+oMBh
         34KacTHBopA14ENa1l5GBIVQizmPAIVT5NmZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714402850; x=1715007650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xd4lZ7/Bfmvxjs4M6E3w4HW0FfqXGJAqEEwuT6BA+iE=;
        b=JFcgGoRwIieaJQ66zftqCmFbnlxz7CY8LBYsRKdZ6Fz4c1ryd/S69BbgwKJwnKARRl
         SyrWWynBohogeBlF/2agEMyMfS42XfaiZbBebn5Wf0+linxu/MBct8OAhetacp7oLjMi
         8Eh+z2SkYwHN3vi6N3uGZiTZuXfsPAyYyjNrKryU8xtH2GKZTrhRcfYsmvfLTgpx2OP5
         wY7NW+GqBJ9ueIs2PKkbJPJ8o1FiiGQ+vnvW6hXTE5/gM1CvO5Lk0vWvmjSxjuEDk+DC
         osyBf04myMpUa9/xGJcFSqlVKnoAxCg238Hh/g8YiWpfzXCMo6Th76gfeOuCGgTG7nbd
         d72w==
X-Gm-Message-State: AOJu0YzpsiUnvJciHju3oiD65Bsauw2yMvlAFktLH0GXuqIiZ3iFBtBD
	31N+z3NQmx5R0XglKifZpOKBz+3mN9xjhjTykPnl0c5Oz3VtwZvGsD82oC8ptjkCFGUXFC+B9aW
	6
X-Google-Smtp-Source: AGHT+IHOmO2lrGeD523koRfftzGmX4T+JaFhJC/d9cTRx7FnHPaxJ98Q386J+pdqp5gySJa2j/zeVw==
X-Received: by 2002:a05:6214:2625:b0:6a0:ccc4:9c9b with SMTP id gv5-20020a056214262500b006a0ccc49c9bmr4326861qvb.44.1714402850284;
        Mon, 29 Apr 2024 08:00:50 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 6/9] create-diff-object: detect changes in .altinstr_replacement and .fixup sections
Date: Mon, 29 Apr 2024 16:56:51 +0200
Message-ID: <20240429145654.71669-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429145654.71669-1-roger.pau@citrix.com>
References: <20240429145654.71669-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic to detect changes in special sections elements will only
include group elements that reference function symbols that need including
(either because they have changed or are new).

This works fine in order to detect when a special section element needs
including because of the function is points has changed or is newly introduced,
but doesn't detect changes to the replacement code in .altinstr_replacement or
.fixup sections, as the relocations in that case are against STT_SECTION
symbols.

Fix this by also including the special section group if the symbol the
relocations points to is of type section.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 create-diff-object.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/create-diff-object.c b/create-diff-object.c
index 7674d972e301..f4e4da063d0a 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1158,11 +1158,21 @@ static int should_keep_rela_group(struct section *sec, int start, int size)
 	struct rela *rela;
 	int found = 0;
 
-	/* check if any relas in the group reference any changed functions */
+	/*
+	 * Check if any relas in the group reference any changed functions.
+	 *
+	 * Relocations in the .altinstructions and .ex_table special sections
+	 * can also reference changed section symbols, since the replacement
+	 * text in both cases resides on a section that has no function symbols
+	 * (.altinstr_replacement and .fixup respectively).  Account for that
+	 * and also check whether the referenced symbols are section ones in
+	 * order to decide whether the relocation group needs including.
+	 */
 	list_for_each_entry(rela, &sec->relas, list) {
 		if (rela->offset >= start &&
 		    rela->offset < start + size &&
-		    rela->sym->type == STT_FUNC &&
+		    (rela->sym->type == STT_FUNC ||
+		     rela->sym->type == STT_SECTION) &&
 		    rela->sym->sec->include) {
 			found = 1;
 			log_debug("new/changed symbol %s found in special section %s\n",
@@ -1338,6 +1348,21 @@ static void kpatch_regenerate_special_section(struct kpatch_elf *kelf,
 
 				rela->sym->include = 1;
 
+				/*
+				 * Changes that cause only the
+				 * .altinstr_replacement or .fixup sections to
+				 * be modified need the target function of the
+				 * replacement to also be marked as CHANGED,
+				 * otherwise livepatch won't replace the
+				 * function, and the new replacement code won't
+				 * take effect.
+				 */
+				if (rela->sym->type == STT_FUNC &&
+				    rela->sym->status == SAME) {
+					rela->sym->status = CHANGED;
+					kpatch_include_symbol(rela->sym, 0);
+				}
+
 				if (!strcmp(special->name, ".fixup"))
 					kpatch_update_ex_table_addend(kelf, special,
 								      src_offset,
-- 
2.44.0


