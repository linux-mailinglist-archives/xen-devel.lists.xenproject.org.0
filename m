Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C14984D54F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 23:05:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677898.1054810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXq2L-0004TZ-HA; Wed, 07 Feb 2024 22:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677898.1054810; Wed, 07 Feb 2024 22:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXq2L-0004QO-EL; Wed, 07 Feb 2024 22:04:57 +0000
Received: by outflank-mailman (input) for mailman id 677898;
 Wed, 07 Feb 2024 22:04:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ti/e=JQ=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rXq2J-0004QI-4j
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 22:04:55 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec1ced47-c604-11ee-8a4a-1f161083a0e0;
 Wed, 07 Feb 2024 23:04:54 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40fe79f1aaaso10356545e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 14:04:54 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 bi26-20020a05600c3d9a00b004102da467bcsm537972wmb.25.2024.02.07.14.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 14:04:52 -0800 (PST)
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
X-Inumbo-ID: ec1ced47-c604-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707343493; x=1707948293; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cjxg1rDFUbClUNBZj/Vc2i7YGFGmg/zn3O672UciEs0=;
        b=lpY7uVpzG/3a1wCxa+pvsnl7DJ6M+xuSa1PLLqq7zZrfwvKXos3odyxFa5RdAnmD+x
         QI2BynoQmJ7GqY+ry4ReJ0bcPihZZBIILG8vngapQAxItOPUXiNYwaWrq22Oy/glmILv
         51WF1xOODIY5hEDxXyD1BVubsZZLMT3VsWfYcfM5TvdcixjS9qyTDa/ZmaMCr+RwzuZH
         qwe8cZN1mcL4WNPb4znfY7qdxoodo35egywbwZnu7y0fD577lCoj5n2uL9IVmXonHyOI
         TY2Njt4JMYR5yocOvATNNbII+ZLCFc5ZMvGnnGf/zW5VeN+vFmahHnRHBCZiFBRJY+z0
         FHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707343493; x=1707948293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cjxg1rDFUbClUNBZj/Vc2i7YGFGmg/zn3O672UciEs0=;
        b=rmyetecoeFez/98opYs/E/quSVW51eKn7oMrV/IlnrcuK/rXC1fGGq3dPMVPKV2npo
         ici+gzENi/fKbvBVHrpNKBHMBzsVg80IyJacaxACtCCq1UimTR8Q+8ZD2jrwJDPnuGo1
         O+n8CA2kww1aRNPSpJdWvtBAKB+KllpkiCXPquBSqPAf5hU+iGrAjhudKQe18isBY3Vw
         X5Ytwxp01OSNV7/Y1tlT7A4W77Aqzyi/fEVomLXuBifQV29DK+qIon/VdgcdbTOaxF5u
         VyKlJ2fT8fZo2rKrwZ13bUWmgnhOvuwr3JVtBtAmmmu8JYZiCeUSPYYFaKQfTbGrM0CC
         4RKA==
X-Gm-Message-State: AOJu0YxTPawo5X/ndgHn0HnOpF1ek59tMHbSrLRQgLAdCCR206dWc+tL
	KkbTgdfY4o1HnT3iCkfm4wV0zPBn3aF0vYs9dpyQkaK8ziIfzFn3UGJ7dyOalr0=
X-Google-Smtp-Source: AGHT+IFP1WynVWTCZZauCNnn5yhzuHh7fzV2sktmgRQfxQMtndmYttuV0WDhxBNI6CxlgtagHSFr4w==
X-Received: by 2002:a05:600c:4fce:b0:40e:fc20:b574 with SMTP id o14-20020a05600c4fce00b0040efc20b574mr5429310wmq.10.1707343492923;
        Wed, 07 Feb 2024 14:04:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFAe1nA3JmnYhDxl9Rw9q/5Igdc7GJEAifVjyeDCBAzvLWinq4bftp74tC47yFQDA68pUdDsKgIHLK8gmxPZhF24zhDJ6oyFyBKbFEDeqsU/sCxmwgYPQ8Ofi9XS/vJPzx1BitjY56hZ6wHeSdvwieloEKJzc3u0uUmSlL/VlT/c/AH8mqXV9iZJnSdkgirW0XMe1Leeo=
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	=?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/ocaml: Add missing vmtrace_buf_kb field
Date: Wed,  7 Feb 2024 22:04:12 +0000
Message-Id: <9b9909c9e93cb540b3488c784935acc2bc9e071e.1707343396.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Add the missing `vmtrace_buf_kb` field to the OCaml bindings to match the
vm.cfg configuration, correcting an oversight from its initial introduction.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/ocaml/libs/xc/xenctrl.ml      |  1 +
 tools/ocaml/libs/xc/xenctrl.mli     |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c | 13 +++++++++++--
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index d6c6eb73db..55923857ec 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -85,6 +85,7 @@ type domctl_create_config =
     max_grant_frames: int;
     max_maptrack_frames: int;
     max_grant_version: int;
+    vmtrace_buf_kb: int32;
     cpupool_id: int32;
     arch: arch_domainconfig;
   }
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 3bfc16edba..9b4b45db3a 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -77,6 +77,7 @@ type domctl_create_config = {
   max_grant_frames: int;
   max_maptrack_frames: int;
   max_grant_version: int;
+  vmtrace_buf_kb: int32;
   cpupool_id: int32;
   arch: arch_domainconfig;
 }
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 3703f48c74..2b6d3c09df 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -210,10 +210,17 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 #define VAL_MAX_GRANT_FRAMES    Field(config, 6)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
 #define VAL_MAX_GRANT_VERSION   Field(config, 8)
-#define VAL_CPUPOOL_ID          Field(config, 9)
-#define VAL_ARCH                Field(config, 10)
+#define VAL_VMTRACE_BUF_KB      Field(config, 9)
+#define VAL_CPUPOOL_ID          Field(config, 10)
+#define VAL_ARCH                Field(config, 11)
 
 	uint32_t domid = Int_val(wanted_domid);
+	uint64_t vmtrace_size = Int32_val(VAL_VMTRACE_BUF_KB);
+
+	vmtrace_size = ROUNDUP(vmtrace_size << 10, XC_PAGE_SHIFT);
+	if ( vmtrace_size != (uint32_t)vmtrace_size )
+		caml_invalid_argument("vmtrace_buf_kb");
+
 	int result;
 	struct xen_domctl_createdomain cfg = {
 		.ssidref = Int32_val(VAL_SSIDREF),
@@ -223,6 +230,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
 		.grant_opts =
 		    XEN_DOMCTL_GRANT_version(Int_val(VAL_MAX_GRANT_VERSION)),
+		.vmtrace_size = vmtrace_size,
 		.cpupool_id = Int32_val(VAL_CPUPOOL_ID),
 	};
 
@@ -279,6 +287,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 
 #undef VAL_ARCH
 #undef VAL_CPUPOOL_ID
+#undef VAL_VMTRACE_BUF_KB
 #undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
 #undef VAL_MAX_GRANT_FRAMES
-- 
2.34.1


