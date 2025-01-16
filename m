Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C7A1414A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 18:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873679.1284682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU33-0007gZ-U4; Thu, 16 Jan 2025 17:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873679.1284682; Thu, 16 Jan 2025 17:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYU33-0007f0-R4; Thu, 16 Jan 2025 17:52:53 +0000
Received: by outflank-mailman (input) for mailman id 873679;
 Thu, 16 Jan 2025 17:52:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV9y=UI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYU31-0007CP-Ky
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 17:52:51 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3bf4873-d432-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 18:52:50 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso271479166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 09:52:50 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384c57034sm27787866b.34.2025.01.16.09.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 09:52:48 -0800 (PST)
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
X-Inumbo-ID: b3bf4873-d432-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737049969; x=1737654769; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuFvwoczQ0Dt1tA24xhRPUnmiSMeJ5zfD1PkZdC+rZ4=;
        b=TCfaB8BNMNubLNnPXbD6bMbfmJI/c3o/xtaHojwA3oSy3bNnaO1qwi/Z/rIyF+9Juu
         ycwe9rTGtRxJM6raqjYo9P2OHA3n93PAfpvKNvHdEX5EEIh9ohaM6LhsRB5t1ArKjFTj
         X9OMXDdgTineOjogMRw5wYwfOuKnIMJsfMI8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049969; x=1737654769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuFvwoczQ0Dt1tA24xhRPUnmiSMeJ5zfD1PkZdC+rZ4=;
        b=wWcWF7QEHDwtLGNnqbPakYIp7nORGssd64HmW4nxKaZHZeYgaDN6or9CYUkGe83yEj
         zU2hbz5Uj0P+YWGYnqSjaCEqESimjFklZpVdsR3ektXOmptBksZNCggHU2krt/mJa91v
         lubdJboXjjCsUevEOmWowoGsJ5lFuBu2C0a1WRRdWN3aZsiL5lr/7XQn5JcXBYadTzGY
         cnnvjl6L/R/mZLXi+Rzqi2Gec6tVB6VrdprwwDgxpMhPfpR7vO9VjcxLAtgOjspnY/nO
         HRQyw26VQ8kl+bCSjUYNrxW66QG7slOVnZOQtZVy0xpABaUDa8B1EGqdo/iG7ygUJuGW
         LfCQ==
X-Gm-Message-State: AOJu0YxiDsnklJLQlaoHGXaNk3nMLi+jsuEFcEUvZ8iNut/GztWfk5r0
	jmSmhyFMgeB/Tf5ZSDlSSe2HEw/o/a3OAL7q59nAVmRmqehSHT9baOq//5phOTNhGbSn+NUTBA+
	6
X-Gm-Gg: ASbGncudV+qYdLiy2TE0olpWQ0kKNWnhZtJlWumlaDDfHfIV+jtEooEnkJl+x53o8yP
	jA5OWKu/9UUTYbJDpeJfYOiA/dDlbY91zt8gBBEeySxKUU6Krno+kfoqM8Bx5AHx8YdZlP4K6Ad
	jsZfLt9hdWaJzInxSEwnbsaqsldaKuaprtI5NYWIA9+fM1Q6vEIT7dKAhnLMoSSh2iHkVilCnD8
	mAkREnqhQX+MHEhQ84XBC575ZAeQ4mCu4rhFVqF5PDp5nqVmLbeQfi6nv2Dpw==
X-Google-Smtp-Source: AGHT+IHQ78fj4w35Y9kLgaBu47AToy7EGUILnKAan473qANN6ZzI//+m6f88rVqsRBAIby1r3BuuSQ==
X-Received: by 2002:a17:907:7f0a:b0:aab:da48:493e with SMTP id a640c23a62f3a-ab2ab559c29mr3048679366b.21.1737049969348;
        Thu, 16 Jan 2025 09:52:49 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Artem Savkov <asavkov@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/7] create-diff-object: add symbol relations
Date: Thu, 16 Jan 2025 18:52:09 +0100
Message-ID: <20250116175214.83742-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250116175214.83742-1-roger.pau@citrix.com>
References: <20250116175214.83742-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Artem Savkov <asavkov@redhat.com>

Add a function that would detect parent/child symbol relations. So far
it only supports .cold.* symbols as children.

Signed-off-by: Artem Savkov <asavkov@redhat.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 common.h             |  2 ++
 create-diff-object.c | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/common.h b/common.h
index 5ff9ef6ca8e9..7f3a82ffdb29 100644
--- a/common.h
+++ b/common.h
@@ -85,6 +85,8 @@ struct section {
 struct symbol {
 	struct list_head list;
 	struct symbol *twin;
+	struct symbol *parent;
+	struct symbol *child;
 	struct section *sec;
 	GElf_Sym sym;
 	char *name;
diff --git a/create-diff-object.c b/create-diff-object.c
index fed360a9aa68..b041d94d9723 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -327,6 +327,38 @@ static void kpatch_rename_mangled_functions(struct kpatch_elf *base,
 	}
 }
 
+/*
+ * During optimization gcc may move unlikely execution branches into *.cold
+ * subfunctions. kpatch_detect_child_functions detects such subfunctions and
+ * crossreferences them with their parent functions through parent/child
+ * pointers.
+ */
+static void kpatch_detect_child_functions(struct kpatch_elf *kelf)
+{
+	struct symbol *sym;
+
+	list_for_each_entry(sym, &kelf->symbols, list) {
+		char *coldstr;
+
+		coldstr = strstr(sym->name, ".cold.");
+		if (coldstr != NULL) {
+			char *pname;
+
+			pname = strndup(sym->name, coldstr - sym->name);
+			if (!pname)
+				ERROR("strndup");
+
+			sym->parent = find_symbol_by_name(&kelf->symbols, pname);
+			free(pname);
+
+			if (!sym->parent)
+				ERROR("failed to find parent function for %s", sym->name);
+
+			sym->parent->child = sym;
+		}
+	}
+}
+
 /*
  * This function detects whether the given symbol is a "special" static local
  * variable (for lack of a better term).
@@ -2329,6 +2361,9 @@ int main(int argc, char *argv[])
 	log_debug("Open patched\n");
 	kelf_patched = kpatch_elf_open(arguments.args[1]);
 
+	kpatch_detect_child_functions(kelf_base);
+	kpatch_detect_child_functions(kelf_patched);
+
 	log_debug("Compare elf headers\n");
 	kpatch_compare_elf_headers(kelf_base->elf, kelf_patched->elf);
 	log_debug("Check program headers of base\n");
-- 
2.46.0


