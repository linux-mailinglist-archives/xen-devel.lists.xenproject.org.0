Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028105A756A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 07:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395171.634978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFv7-000875-0S; Wed, 31 Aug 2022 05:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395171.634978; Wed, 31 Aug 2022 05:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTFv6-0007yE-HV; Wed, 31 Aug 2022 05:05:44 +0000
Received: by outflank-mailman (input) for mailman id 395171;
 Tue, 30 Aug 2022 21:49:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uQxP=ZC=flex--surenb.bounces.google.com=37oUOYwYKCVMDFCz8w19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@srs-se1.protection.inumbo.net>)
 id 1oT972-0008CX-I9
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 21:49:36 +0000
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [2607:f8b0:4864:20::1149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a34913ca-28ad-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 23:49:35 +0200 (CEST)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-33e1114437fso189328857b3.19
 for <xen-devel@lists.xenproject.org>; Tue, 30 Aug 2022 14:49:35 -0700 (PDT)
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
X-Inumbo-ID: a34913ca-28ad-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=Ximx3byfJ7rLtdPEIh1Ra0raz9MzgSTr/ga3ge5UvWM=;
        b=hlMw9ssXTclldlCaHPrcXJ+C8bd3xApn5Llhx/6gZpRfRlRJOwhqWghtr5RVB1LK2v
         8FfTzwl4OCrCjFuadtzRuPxbLUjQJudmMLjVKcB1W8L4nbh23VnBIJLeDBpv1hunXsFS
         TNZP/OkUwJBjRdLHnTFXsfbD3FCLleefIIXeH80z2Nq7UmGRffrhNJtzi3K0o37plX80
         MxuLJZry+KmCa87qIRicDj7F3K2/cxyGqrCNJyg48FflYe+16BIsOuCNrNLVMYU6qqtM
         jxbTTAqnCt+yOzPfECe6hBLshpNDmGjFaoiWgb1ccH/WG7XlQYWhlthKRprfEZxNn5xs
         7PgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=Ximx3byfJ7rLtdPEIh1Ra0raz9MzgSTr/ga3ge5UvWM=;
        b=X1agUhLrwf7PukrYRMbQ9/ZGNEYwRufDUTKPovibteWYfHLM4hGfdhQGUUiRSvk/ke
         POWTsraUJI1rxScrfZ/TITQHIlf+7Y0puc8alfQ3CsMEHcC3+++lyzwjamyi6KCsFl/7
         qrpa06BPCd8V7XEc8SRjn5/EKT+j0x/RW9WopsuDpnsctHEPWSGkmcBcyvVCSxAsMuvZ
         L2uSQk3+pl38tJTn2fELpE4DvMI3C/6BRMU5Q+EmblrtlhiOb78YRUKFNHdvEUtBIgpW
         MKapyoZgvjNbT6NTJcHoxM5hGYBcNuo42cPZgGeZwBE7Ou1BxUcBgsBA4gOwvGxqwwrh
         qnNw==
X-Gm-Message-State: ACgBeo2hfMeKISn5BKWM8tGh4TrRjgUBLV7k0pGQ1rG7VxkUUNF4kb5F
	EJ5Gp2VN3DdzMAx43tlvEfFxva5zzNU=
X-Google-Smtp-Source: AA6agR7neVKTaIOQpaQTJJtMxLoXgZYEqvCUk9V+fUBv2iEO9EJWDyjyjmM2UWOPn+DCBvrBJ11meMcGOpo=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:a005:55b3:6c26:b3e4])
 (user=surenb job=sendgmr) by 2002:a0d:d98c:0:b0:33d:c482:9714 with SMTP id
 b134-20020a0dd98c000000b0033dc4829714mr15776751ywe.415.1661896174717; Tue, 30
 Aug 2022 14:49:34 -0700 (PDT)
Date: Tue, 30 Aug 2022 14:48:53 -0700
In-Reply-To: <20220830214919.53220-1-surenb@google.com>
Mime-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830214919.53220-5-surenb@google.com>
Subject: [RFC PATCH 04/30] scripts/kallysms: Always include __start and __stop symbols
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

These symbols are used to denote section boundaries: by always including
them we can unify loading sections from modules with loading built-in
sections, which leads to some significant cleanup.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 scripts/kallsyms.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index f18e6dfc68c5..3d51639a595d 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -263,6 +263,11 @@ static int symbol_in_range(const struct sym_entry *s,
 	return 0;
 }
 
+static bool string_starts_with(const char *s, const char *prefix)
+{
+	return strncmp(s, prefix, strlen(prefix)) == 0;
+}
+
 static int symbol_valid(const struct sym_entry *s)
 {
 	const char *name = sym_name(s);
@@ -270,6 +275,14 @@ static int symbol_valid(const struct sym_entry *s)
 	/* if --all-symbols is not specified, then symbols outside the text
 	 * and inittext sections are discarded */
 	if (!all_symbols) {
+		/*
+		 * Symbols starting with __start and __stop are used to denote
+		 * section boundaries, and should always be included:
+		 */
+		if (string_starts_with(name, "__start_") ||
+		    string_starts_with(name, "__stop_"))
+			return 1;
+
 		if (symbol_in_range(s, text_ranges,
 				    ARRAY_SIZE(text_ranges)) == 0)
 			return 0;
-- 
2.37.2.672.g94769d06f0-goog


