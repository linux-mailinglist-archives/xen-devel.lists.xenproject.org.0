Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4EB8D77B6
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2024 22:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734553.1140640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRS-0007ps-JR; Sun, 02 Jun 2024 20:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734553.1140640; Sun, 02 Jun 2024 20:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRS-0007nA-Ge; Sun, 02 Jun 2024 20:04:34 +0000
Received: by outflank-mailman (input) for mailman id 734553;
 Sun, 02 Jun 2024 20:04:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nKxc=NE=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sDrRR-0007mz-GC
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2024 20:04:33 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 532de246-211b-11ef-90a1-e314d9c70b13;
 Sun, 02 Jun 2024 22:04:32 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-421338c4c3bso15295695e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 02 Jun 2024 13:04:31 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064bb21sm6879280f8f.102.2024.06.02.13.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:04:30 -0700 (PDT)
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
X-Inumbo-ID: 532de246-211b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717358671; x=1717963471; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FD00BnVK+nXxJxFCCyFQGMqQcfaH7dFaqvgbk7uc4I=;
        b=lsH2Pg/ZN9IG/ZAzq/QO7nIw5zRAa9YiXyWiYgiORaaSeKLc1jkHvRv+dyyQpAk7X0
         +lxWQPGHizRwq5e2UCOSV4e7m9kgTmSIZZZSwa8gooQ1HRXU0GUJp6/ieCSnweIsMKxd
         S3DaLPupwsIsgVFkfxMKzEY251K59hLs2AlmnmwOi4zyUDPPbonWvnAlefDCDlG2XuDt
         +sk7c5kY+1l7AKFXm8R2fXJeap9BKIluYys65yZ37FVeZuYZTWcStz9zfhttRxrq+jZ5
         MsdnyZ3uR/AdqXUyir5L3CEZVK7Lgl2OV9JC1g6qHa/BZahTIgBkkEIm8q88AOau1hw1
         r/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717358671; x=1717963471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FD00BnVK+nXxJxFCCyFQGMqQcfaH7dFaqvgbk7uc4I=;
        b=AEi60aHrF5Wjg1WLSBBitqOh+NjFsHu8eGHStzdmObMZq+RBFSHHXTlu1S1R/ewhLz
         5c0QTjnUWWwyFIHW8dicGIzN5zR/hGNgo1W6+0RPyqfh2rjJWo5G1sXeoOOhu7Z3OEV1
         1KzNkLHlhGL+jM+7rCIHD8+jR7momc2jpQtvz5p3c3kdlwv1ZNBdre9uY3yMQiodoUUA
         DttFiR99WSM7tDCJ4VBo4NbxdVshXogEDh0VnwYC3SvAWRgsbuF112PbgnaZi2DiNb1Y
         z6+hgaR9zcJp/P6u6I1RaPAod2CJyNYPU25fRz85zQgrdc7xiys1resB1DwLwv13ZTpj
         hA9g==
X-Gm-Message-State: AOJu0YwP/58BJepgF4vVdOgcZjUkPNFOqM4UFMi0Pfu8YRIkuTMNOreQ
	sDfszuh1MShruGKdpzRw1sq1iZLvisUKRjolY2+F0otnxJFx9uVeIt5yJA==
X-Google-Smtp-Source: AGHT+IGBccqpO9X861mA56aWUoHAjiXNV+TMR8tMrmieqJ7TIp5D3QKv1HvzGKWbPVpznVrJUrkDUA==
X-Received: by 2002:a05:600c:511f:b0:41e:3272:6476 with SMTP id 5b1f17b1804b1-4212e049d8dmr67108965e9.10.1717358670709;
        Sun, 02 Jun 2024 13:04:30 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH for-4.19? v5 01/10] tools/ocaml: Fix mixed tabs/spaces
Date: Sun,  2 Jun 2024 20:04:14 +0000
Message-Id: <7f1eb25ef6fd2ce56a8275211051d6a4a1211a6a.1717356829.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717356829.git.w1benny@gmail.com>
References: <cover.1717356829.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

No functional change.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
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


