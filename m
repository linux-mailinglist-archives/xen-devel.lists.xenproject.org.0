Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09C4A14149
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 18:53:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873685.1284733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU39-0000bI-NS; Thu, 16 Jan 2025 17:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873685.1284733; Thu, 16 Jan 2025 17:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU39-0000XG-JZ; Thu, 16 Jan 2025 17:52:59 +0000
Received: by outflank-mailman (input) for mailman id 873685;
 Thu, 16 Jan 2025 17:52:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV9y=UI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYU37-0007CP-Uj
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 17:52:57 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b812c9cb-d432-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 18:52:57 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d9f06f8cf2so2369387a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 09:52:57 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73684c70sm242918a12.47.2025.01.16.09.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 09:52:56 -0800 (PST)
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
X-Inumbo-ID: b812c9cb-d432-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737049976; x=1737654776; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdKNm+zFNAAty/krwKMMryYSZX6eNIKljOU3/XkBfjk=;
        b=TrP4+fX4xWedESq+GgjV0EGPvvFyXVfxL6/8PBb6isMet6d4NFl814iulAIbSB/MHQ
         wtpjeKTq5IhOZuOeQ+/LYdudWBnaHq8YtMEKqXB9FrXgFRZEp426thxRD67/MwDRsrkj
         iuoju2xlwQADRgljQduiHBjcudljLHgvW+5kI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049976; x=1737654776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdKNm+zFNAAty/krwKMMryYSZX6eNIKljOU3/XkBfjk=;
        b=CPYiibXyvu7qHt21RClF5XL7WROHoRVZc1OPlxH6TMUBX4ovzvTkzqSbhFij6q+vT6
         Fm02yWsVNqoRwqxguGzJdyxfSXOx4jeua69a7Az6lJtimiXOTrNKRbx0wKVED1uyhhnk
         FiFY35sujMcGA1+qdE/NBEoA7B0/+nMwmalIo3sp+gjB4dEMg1T9Bsfxu+NOYgC6ATtB
         IGzRQET1Kbkemw4quKwvKObumNCWNUZ5IXfWedXE6uxS2nfc2G/c85FtiZt3k8OcQrl2
         QH/pnSKGN/bi2Hf5+zKmTgewRrC1EmEEjfTcMBbsASzEyJ40uHFFV1hd4GUWWlyic6jb
         M7sg==
X-Gm-Message-State: AOJu0YxjYyt0yXiXO0l7VcVU/YrqUMxFtmiwC2quyYrvTUzfvH4pOOQ9
	BoFBHl03nNjsodiLksLbr0FU19XYr853A+o2BA+IS0CxCpT6g7U4kLoui/71NfL3T9nhpsVkKca
	e
X-Gm-Gg: ASbGncv+KmEl5hjOHRbBG9YV1gBJq86mjknt7MWvK+otbtPpNrhUxwOdC8V5g5LoY2P
	6tRlUOMlgN1+qXTgTL7WYvPBlJXr+ENJlHn1JRW/PxMeM8Gz0q8IAS5J/k02ETO04UYXXMYOoUn
	58k6zVkVcs6vYF+leiS5cIciRkaN8hqyL/lrPiiqRAbIRkk53umNYRH07+D6gk1XnSmrJjeLMKo
	CZ09vkA+TbF7CZ/42t2BV6Lw8EdFx/t9ONu9Ncb4iFTY+6N8PBK398JOzaYxA==
X-Google-Smtp-Source: AGHT+IE5XnhgEzjPcuMfl//ipOH+hpNHepD0cjDK0+Mb4WVVe19cwgfC5+H5ddmcqSBBK+MRP1f+hA==
X-Received: by 2002:a05:6402:3217:b0:5cf:bcaf:98ec with SMTP id 4fb4d7f45d1cf-5d972e48686mr30530902a12.26.1737049976608;
        Thu, 16 Jan 2025 09:52:56 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Artem Savkov <asavkov@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 7/7] create-build-diff: support for .cold functions with no id suffix
Date: Thu, 16 Jan 2025 18:52:14 +0100
Message-ID: <20250116175214.83742-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250116175214.83742-1-roger.pau@citrix.com>
References: <20250116175214.83742-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Artem Savkov <asavkov@redhat.com>

create-build-diff expects .cold functions to be suffixed by an id, which
is not always the case. Drop the trailing '.' when searching for cold
functions.

Fixes: #1160

Signed-off-by: Artem Savkov <asavkov@redhat.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 common.c             | 2 +-
 create-diff-object.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/common.c b/common.c
index b46fcf5cb6ca..67b9fcdb0ada 100644
--- a/common.c
+++ b/common.c
@@ -127,7 +127,7 @@ static int is_bundleable(struct symbol *sym)
 	if (sym->type == STT_FUNC &&
 	    !strncmp(sym->sec->name, ".text.unlikely.",15) &&
 	    (!strcmp(sym->sec->name + 15, sym->name) ||
-			 (strstr(sym->name, ".cold.") &&
+			 (strstr(sym->name, ".cold") &&
 			  !strncmp(sym->sec->name + 15, sym->name, strlen(sym->sec->name) - 15))))
 		return 1;
 
diff --git a/create-diff-object.c b/create-diff-object.c
index 6060a73555ed..19590fc0fce1 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -347,7 +347,7 @@ static void kpatch_detect_child_functions(struct kpatch_elf *kelf)
 	list_for_each_entry(sym, &kelf->symbols, list) {
 		char *coldstr;
 
-		coldstr = strstr(sym->name, ".cold.");
+		coldstr = strstr(sym->name, ".cold");
 		if (coldstr != NULL) {
 			char *pname;
 
-- 
2.46.0


