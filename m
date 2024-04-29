Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0BE8B5C3B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714136.1115234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SV4-0000QI-Iq; Mon, 29 Apr 2024 15:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714136.1115234; Mon, 29 Apr 2024 15:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SV4-0000MQ-FC; Mon, 29 Apr 2024 15:01:02 +0000
Received: by outflank-mailman (input) for mailman id 714136;
 Mon, 29 Apr 2024 15:01:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXAa=MC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1SV2-00061u-O3
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:01:00 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 499c070b-0639-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:00:59 +0200 (CEST)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-69b6c2e9ed9so21091906d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:00:59 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 t10-20020a0cef0a000000b006a040cdd805sm392396qvr.92.2024.04.29.08.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:00:57 -0700 (PDT)
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
X-Inumbo-ID: 499c070b-0639-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714402858; x=1715007658; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABIMao/S3hzX29QxYYcWMCOhcIr5YSs4nbEkZAC6ppk=;
        b=ESvZdTEfYhOldho+Qeoi7BKH6MkOsqdG9R6iwAdt81dt6fE15zkk4wkga7Tuk3ZmlH
         H7j42bXg5Knvabwlscjiv9tMoeysK7pTWXQf0dAps1m6DyMpKur4zJ6BNtOV8yJESadF
         i1jdgMUX0oh+XFr5Q64pAfxNV5/9Ycn8LQk9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714402858; x=1715007658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABIMao/S3hzX29QxYYcWMCOhcIr5YSs4nbEkZAC6ppk=;
        b=Q1oh/ouC/3WalvjBgDA1ar602mkQQrQaUuUz9pYgU1OXpJ9L8vzqfOgyoLntFTmnNu
         5K6wbbkhVikh1fztaQ/kf5XhBU9OglrDYo/g4Jv2CgLNCXtQSjvMSv6amgh/RplZq7M7
         UIIMVxo7yfqOUfkqBZ3TiQzf/5ZWde8yBFTSS9mqlrZAkbaTsPO/q0zwrYX2nxu/U5o7
         8maAVd7hesYzLxpuf0+W9kJh79CPi0hJPC3vtnVP7CxrOgXuPue1S+Q6q/U/T/8d022z
         /2tgc8qlkBa8+BcfSoNNS9FQsxlyEF1VbuT9VR2dthxC5N+j1r6+W2bPoPPVgnEzpH7d
         BcPA==
X-Gm-Message-State: AOJu0Yxjmg4mR7tzyL2jTcWc6bhFjE5QC30JMGENDVVuQYs5K6Yfph15
	1jEggLOL8IqJQypoPBWa2VSGEAAdMnIluMpLUQa4mHbm8xM58kDD9cOwrX1sDmr6TfGqrF4pKNZ
	w
X-Google-Smtp-Source: AGHT+IGxPcDT9IwGTWGDL4oYzCXrDmSIbNhuvzGMF891BclHIsi0n3Dih5B5TyYh4tZ1b0v0ecwWcg==
X-Received: by 2002:a05:6214:130d:b0:6a0:5528:9594 with SMTP id pn13-20020a056214130d00b006a055289594mr11828763qvb.64.1714402858002;
        Mon, 29 Apr 2024 08:00:58 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 9/9] create-diff-object: account for special section changes
Date: Mon, 29 Apr 2024 16:56:54 +0200
Message-ID: <20240429145654.71669-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429145654.71669-1-roger.pau@citrix.com>
References: <20240429145654.71669-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When deciding whether there's content to generate a payload also take into
account whether special sections have changed.  Initially account for changes
to alternative related section to cause the generation of a livepatch.

Note that accounting for hook sections is already done by
kpatch_include_hook_elements() when deciding whether there's changed content in
the object file.  .bugframe sections are also not accounted for since any
section in a bugframe section will be accompanied by a change in the function
the bugframe references (the placement of the BUG_INSTR will change in the
caller function).

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 create-diff-object.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/create-diff-object.c b/create-diff-object.c
index 8bfb6bf92a1b..957631097b8a 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1663,6 +1663,28 @@ static int kpatch_include_hook_elements(struct kpatch_elf *kelf)
 	return num_new_functions;
 }
 
+static unsigned int include_special_sections(const struct kpatch_elf *kelf)
+{
+	const struct section *sec;
+	unsigned int nr = 0;
+
+	/*
+	 * Only account for changes in alternatives and exception table related
+	 * sections.  Hooks are already taken care of separately, and changes
+	 * in bug_frame sections always go along with changes in the caller
+	 * functions.
+	 */
+	list_for_each_entry(sec, &kelf->sections, list)
+		if (sec->status != SAME &&
+		    (!strcmp(sec->name, ".altinstructions") ||
+		     !strcmp(sec->name, ".altinstr_replacement") ||
+		     !strcmp(sec->name, ".ex_table") ||
+		     !strcmp(sec->name, ".fixup")))
+			nr++;
+
+	return nr;
+}
+
 static int kpatch_include_new_globals(struct kpatch_elf *kelf)
 {
 	struct symbol *sym;
@@ -2469,6 +2491,8 @@ int main(int argc, char *argv[])
 	kpatch_include_debug_sections(kelf_patched);
 	log_debug("Include hook elements\n");
 	num_changed += kpatch_include_hook_elements(kelf_patched);
+	log_debug("Include special sections\n");
+	num_changed += include_special_sections(kelf_patched);
 	log_debug("num_changed = %d\n", num_changed);
 	log_debug("Include new globals\n");
 	new_globals_exist = kpatch_include_new_globals(kelf_patched);
-- 
2.44.0


