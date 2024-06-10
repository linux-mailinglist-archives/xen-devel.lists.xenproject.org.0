Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D39902785
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 19:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737470.1143815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXr-0001BJ-DT; Mon, 10 Jun 2024 17:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737470.1143815; Mon, 10 Jun 2024 17:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXr-00015o-8a; Mon, 10 Jun 2024 17:10:59 +0000
Received: by outflank-mailman (input) for mailman id 737470;
 Mon, 10 Jun 2024 17:10:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7qHj=NM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGiXp-0000kq-6O
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 17:10:57 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65226e0f-274c-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 19:10:54 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe63947so138279a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 10:10:54 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c76740d6asm3233169a12.7.2024.06.10.10.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 10:10:52 -0700 (PDT)
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
X-Inumbo-ID: 65226e0f-274c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718039453; x=1718644253; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80YAum1ZZZhvvQ1bWVYLzziFeIFlw7BUBUnbDQYTJMk=;
        b=HGp4SOf4JnSLYepaSCeu/iTPxfLweoXcjZEpeT6oTXB6xhD3C6R8NdvDqb73b0wiP7
         gcr4F9jYg44zUBb984uzvhfMHX/73EBpK6NuOX5ONfh1Si/SFOAg7k805GqICdkeOGfe
         3gzxYxr1su5/d61c1wQBUPaJq95hxkKBMnQuTbtmjNUN4If0C3u48BkqpPw7NqRVzBxW
         v3ZrpQcmjKZFLqkX2OLQUTC762XD3/IB1lzcosC5/8uspd/TibQS32TmazUirQUL/O25
         Hs5TC4rr9COJbl5I0e7Wu5MKuS1ELsuED9AvfXKP94nyXE0Z4iRUF1ej5JVUaMi7TXav
         BQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718039453; x=1718644253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80YAum1ZZZhvvQ1bWVYLzziFeIFlw7BUBUnbDQYTJMk=;
        b=JcEpOWWYKN1Q5IOn0CyXImVg5B8pWuVLOxHdTkG7/w1VBYRb68IHy1YbjVOKNd5Cj1
         HLXSBYLz/SvqK7MfNLmrz3eZxWSrwNYw4TGBOPwc7iVqIKmsiY1+sqliw1qVDO/VCRFg
         sdZ30b/plF7uNBRNNak2SltrsPWxcVYzpCviE+QSp8u2FJxq9nNnt1KgOeI2+SQEiIQv
         yTa9Tn3k1wJY2dMQ1JU0WBNu0Apo8tUjOggh5FopnDc8eVL/jesCsZBlU7sr00Av7Ptc
         UQk9d8xfcd1HwjQfeVZyCkQI4fXGD8+maYmCR9VAhszC965hTokHOjjcxKcatZVpKdG2
         BluQ==
X-Gm-Message-State: AOJu0YzTK1w1V0qoY4jPFIqnmxtHEBac9/yshSoc2MhLBFM5ix1mXHy/
	3h1vqz+8JqiRwLSVERj0Z4wM3pzJKU16m/mQNKTYFYFkhkv0db9PlarXjA==
X-Google-Smtp-Source: AGHT+IFnmsdMByN59njo3QQ2aK0e8qFDGU1LXZbxrUVf9TYA/BBM9e1Ujr8rdvOIFpkVwJl+bKHrzA==
X-Received: by 2002:a50:d4d8:0:b0:579:e6d1:d38b with SMTP id 4fb4d7f45d1cf-57c50886a45mr5532742a12.2.1718039452961;
        Mon, 10 Jun 2024 10:10:52 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH for-4.19? v6 1/9] tools/ocaml: Fix mixed tabs/spaces
Date: Mon, 10 Jun 2024 17:10:39 +0000
Message-Id: <5e006de3b3e49419737d1280e15f5528193986f5.1718038855.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718038855.git.w1benny@gmail.com>
References: <cover.1718038855.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

No functional change.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index c6da9bb091..e86c455802 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -138,12 +138,12 @@ static void domain_handle_of_uuid_string(xen_domain_handle_t h,
  * integers in the Ocaml ABI for more idiomatic handling.
  */
 static value c_bitmap_to_ocaml_list
-             /* ! */
-             /*
+	     /* ! */
+	     /*
 	      * All calls to this function must be in a form suitable
 	      * for xenctrl_abi_check.  The parsing there is ad-hoc.
 	      */
-             (unsigned int bitmap)
+	         (unsigned int bitmap)
 {
 	CAMLparam0();
 	CAMLlocal2(list, tmp);
@@ -180,8 +180,8 @@ static value c_bitmap_to_ocaml_list
 }

 static unsigned int ocaml_list_to_c_bitmap(value l)
-             /* ! */
-             /*
+	     /* ! */
+	     /*
 	      * All calls to this function must be in a form suitable
 	      * for xenctrl_abi_check.  The parsing there is ad-hoc.
 	      */
@@ -259,7 +259,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 		/* Quick & dirty check for ABI changes. */
 		BUILD_BUG_ON(sizeof(cfg) != 68);

-        /* Mnemonics for the named fields inside xen_x86_arch_domainconfig */
+		/* Mnemonics for the named fields inside xen_x86_arch_domainconfig */
 #define VAL_EMUL_FLAGS          Field(arch_domconfig, 0)
 #define VAL_MISC_FLAGS          Field(arch_domconfig, 1)

@@ -351,7 +351,7 @@ static value dom_op(value xch_val, value domid,
 	caml_enter_blocking_section();
 	result = fn(xch, c_domid);
 	caml_leave_blocking_section();
-        if (result)
+	if (result)
 		failwith_xc(xch);
 	CAMLreturn(Val_unit);
 }
@@ -383,7 +383,7 @@ CAMLprim value stub_xc_domain_resume_fast(value xch_val, value domid)
 	caml_enter_blocking_section();
 	result = xc_domain_resume(xch, c_domid, 1);
 	caml_leave_blocking_section();
-        if (result)
+	if (result)
 		failwith_xc(xch);
 	CAMLreturn(Val_unit);
 }
@@ -426,7 +426,7 @@ static value alloc_domaininfo(xc_domaininfo_t * info)
 	Store_field(result, 13, Val_int(info->max_vcpu_id));
 	Store_field(result, 14, caml_copy_int32(info->ssidref));

-        tmp = caml_alloc_small(16, 0);
+	tmp = caml_alloc_small(16, 0);
 	for (i = 0; i < 16; i++) {
 		Field(tmp, i) = Val_int(info->handle[i]);
 	}
--
2.34.1


