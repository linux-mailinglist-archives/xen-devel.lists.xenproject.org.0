Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AAD5A7572
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 07:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395203.635136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFvV-0005OX-S1; Wed, 31 Aug 2022 05:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395203.635136; Wed, 31 Aug 2022 05:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFvT-0004ko-W0; Wed, 31 Aug 2022 05:06:07 +0000
Received: by outflank-mailman (input) for mailman id 395203;
 Tue, 30 Aug 2022 21:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nf95=ZC=flex--surenb.bounces.google.com=3E4YOYwYKCXgoqnajXckkcha.Ykitaj-Zarahheopo.tajlnkfaYp.knc@srs-se1.protection.inumbo.net>)
 id 1oT97d-0008CX-Kz
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 21:50:13 +0000
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [2607:f8b0:4864:20::b4a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b94d2801-28ad-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 23:50:12 +0200 (CEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 n16-20020a258d10000000b0068df1e297c0so720250ybl.15
 for <xen-devel@lists.xenproject.org>; Tue, 30 Aug 2022 14:50:12 -0700 (PDT)
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
X-Inumbo-ID: b94d2801-28ad-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=ofrC1PqNoYIKnyKYWjHD7inVuacSGBJJLHypr0RookE=;
        b=VGRf/84iZ1p67fJnvZ/X1xcCS67elVIPk9IGJJ+bUuWMMIF3sRy7RxzaFdrO+WG7dH
         d/TlbooTEmNgUOWOqFkIyFyAhgj636EU+aMGf3bhfUhI9LPGF0x0v39+rp3COSYRpICF
         emKVXtjPhIhzNDYojpJwNosafP0nhIDkwMZkM1SszHz/jzoceNfVxm+3TZcljgHgvL8y
         TVQxs/Koc6RZpeES3hIup/YjX0wdMTaa96AxFv1wg+iYYTwvZ7GGZBg+tBO+knqi5Juw
         fEBz0idUpafaOWyAi5+6IN+BrsO4tEn9FOM/qV9RCHSE0DEDO6hWPkFyyM8anxAPc5xB
         lw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=ofrC1PqNoYIKnyKYWjHD7inVuacSGBJJLHypr0RookE=;
        b=3nqD3l/VKGnRoIr/se4bPlfIRehZgSb3zLZ4OguYhz+pTji04LfPR8vB6p7yjwyr5j
         263l5m1mFzD67pzYjTXrxJtaEUkQmOlGbFaEExN61MmZok0Sikcwjj26A8oi3m0G/4fe
         Z9oQ0PxSG/CtsYjBNWMEwF2wvEVdcLjSoXPBDprefikUvEaH9um15ORzNI7zTsbV4jRa
         qMzztppYZkLHSLAnwji7kfuoMZ3RIhc5e3GKR8irBmlV5LMLT4IvTfvNECHgQXeR/ytO
         nmQEgtXtzGwHMTxAyOaveIKT6uztlv2Mf/RgiUWBrL5Z9WV+iq5fqaJOBAvDCvM5ArOe
         I6Tw==
X-Gm-Message-State: ACgBeo20f7yNmBaLUG7ipkClo48TeXDXkwaGPYn5DrEsRkr43wXfit+m
	Vu0F91CgRM+5CQPthGhuPNgIyxK4ckQ=
X-Google-Smtp-Source: AA6agR5S9pMWRwrdqx3FNbA74RB4ArEfkNsuNbxmIMNnFeUvwj+w6zosapneZCdX4VxzXX80wAu2gx5OQhs=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:a005:55b3:6c26:b3e4])
 (user=surenb job=sendgmr) by 2002:a0d:cd43:0:b0:329:febf:8c25 with SMTP id
 p64-20020a0dcd43000000b00329febf8c25mr15393402ywd.90.1661896211649; Tue, 30
 Aug 2022 14:50:11 -0700 (PDT)
Date: Tue, 30 Aug 2022 14:49:07 -0700
In-Reply-To: <20220830214919.53220-1-surenb@google.com>
Mime-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830214919.53220-19-surenb@google.com>
Subject: [RFC PATCH 18/30] codetag: add codetag query helper functions
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com, 
	ldufour@linux.ibm.com, peterx@redhat.com, david@redhat.com, axboe@kernel.dk, 
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	changbin.du@intel.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, arnd@arndb.de, jbaron@akamai.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	surenb@google.com, kernel-team@android.com, linux-mm@kvack.org, 
	iommu@lists.linux.dev, kasan-dev@googlegroups.com, io-uring@vger.kernel.org, 
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Kent Overstreet <kent.overstreet@linux.dev>

Provide codetag_query_parse() to parse codetag queries and
codetag_matches_query() to check if the query affects a given codetag.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 include/linux/codetag.h |  27 ++++++++
 lib/codetag.c           | 135 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 162 insertions(+)

diff --git a/include/linux/codetag.h b/include/linux/codetag.h
index 386733e89b31..0c605417ebbe 100644
--- a/include/linux/codetag.h
+++ b/include/linux/codetag.h
@@ -80,4 +80,31 @@ static inline void codetag_load_module(struct module *mod) {}
 static inline void codetag_unload_module(struct module *mod) {}
 #endif
 
+/* Codetag query parsing */
+
+struct codetag_query {
+	const char	*filename;
+	const char	*module;
+	const char	*function;
+	const char	*class;
+	unsigned int	first_line, last_line;
+	unsigned int	first_index, last_index;
+	unsigned int	cur_index;
+
+	bool		match_line:1;
+	bool		match_index:1;
+
+	unsigned int	set_enabled:1;
+	unsigned int	enabled:2;
+
+	unsigned int	set_frequency:1;
+	unsigned int	frequency;
+};
+
+char *codetag_query_parse(struct codetag_query *q, char *buf);
+bool codetag_matches_query(struct codetag_query *q,
+			   const struct codetag *ct,
+			   const struct codetag_module *mod,
+			   const char *class);
+
 #endif /* _LINUX_CODETAG_H */
diff --git a/lib/codetag.c b/lib/codetag.c
index f0a3174f9b71..288ccfd5cbd0 100644
--- a/lib/codetag.c
+++ b/lib/codetag.c
@@ -246,3 +246,138 @@ void codetag_unload_module(struct module *mod)
 	}
 	mutex_unlock(&codetag_lock);
 }
+
+/* Codetag query parsing */
+
+#define CODETAG_QUERY_TOKENS()	\
+	x(func)			\
+	x(file)			\
+	x(line)			\
+	x(module)		\
+	x(class)		\
+	x(index)
+
+enum tokens {
+#define x(name)		TOK_##name,
+	CODETAG_QUERY_TOKENS()
+#undef x
+};
+
+static const char * const token_strs[] = {
+#define x(name)		#name,
+	CODETAG_QUERY_TOKENS()
+#undef x
+	NULL
+};
+
+static int parse_range(char *str, unsigned int *first, unsigned int *last)
+{
+	char *first_str = str;
+	char *last_str = strchr(first_str, '-');
+
+	if (last_str)
+		*last_str++ = '\0';
+
+	if (kstrtouint(first_str, 10, first))
+		return -EINVAL;
+
+	if (!last_str)
+		*last = *first;
+	else if (kstrtouint(last_str, 10, last))
+		return -EINVAL;
+
+	return 0;
+}
+
+char *codetag_query_parse(struct codetag_query *q, char *buf)
+{
+	while (1) {
+		char *p = buf;
+		char *str1 = strsep_no_empty(&p, " \t\r\n");
+		char *str2 = strsep_no_empty(&p, " \t\r\n");
+		int ret, token;
+
+		if (!str1 || !str2)
+			break;
+
+		token = match_string(token_strs, ARRAY_SIZE(token_strs), str1);
+		if (token < 0)
+			break;
+
+		switch (token) {
+		case TOK_func:
+			q->function = str2;
+			break;
+		case TOK_file:
+			q->filename = str2;
+			break;
+		case TOK_line:
+			ret = parse_range(str2, &q->first_line, &q->last_line);
+			if (ret)
+				return ERR_PTR(ret);
+			q->match_line = true;
+			break;
+		case TOK_module:
+			q->module = str2;
+			break;
+		case TOK_class:
+			q->class = str2;
+			break;
+		case TOK_index:
+			ret = parse_range(str2, &q->first_index, &q->last_index);
+			if (ret)
+				return ERR_PTR(ret);
+			q->match_index = true;
+			break;
+		}
+
+		buf = p;
+	}
+
+	return buf;
+}
+
+bool codetag_matches_query(struct codetag_query *q,
+			   const struct codetag *ct,
+			   const struct codetag_module *mod,
+			   const char *class)
+{
+	size_t classlen = q->class ? strlen(q->class) : 0;
+
+	if (q->module &&
+	    (!mod->mod ||
+	     strcmp(q->module, ct->modname)))
+		return false;
+
+	if (q->filename &&
+	    strcmp(q->filename, ct->filename) &&
+	    strcmp(q->filename, kbasename(ct->filename)))
+		return false;
+
+	if (q->function &&
+	    strcmp(q->function, ct->function))
+		return false;
+
+	/* match against the line number range */
+	if (q->match_line &&
+	    (ct->lineno < q->first_line ||
+	     ct->lineno > q->last_line))
+		return false;
+
+	/* match against the class */
+	if (classlen &&
+	    (strncmp(q->class, class, classlen) ||
+	     (class[classlen] && class[classlen] != ':')))
+		return false;
+
+	/* match against the fault index */
+	if (q->match_index &&
+	    (q->cur_index < q->first_index ||
+	     q->cur_index > q->last_index)) {
+		q->cur_index++;
+		return false;
+	}
+
+	q->cur_index++;
+	return true;
+}
-- 
2.37.2.672.g94769d06f0-goog


