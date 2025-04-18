Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B89A93886
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 16:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959030.1351538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5mYL-0003a8-7g; Fri, 18 Apr 2025 14:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959030.1351538; Fri, 18 Apr 2025 14:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5mYL-0003UX-2p; Fri, 18 Apr 2025 14:18:49 +0000
Received: by outflank-mailman (input) for mailman id 959030;
 Fri, 18 Apr 2025 14:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TU4N=XE=bounce.vates.tech=bounce-md_30504962.68025f43.v1-11aa9698a46e4605a1aa47936d2968e5@srs-se1.protection.inumbo.net>)
 id 1u5mYJ-00030w-Ld
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 14:18:47 +0000
Received: from mail128-130.atl41.mandrillapp.com
 (mail128-130.atl41.mandrillapp.com [198.2.128.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a3867da-1c60-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 16:18:47 +0200 (CEST)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-130.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4ZfH1b456fzS62GqB
 for <xen-devel@lists.xenproject.org>; Fri, 18 Apr 2025 14:18:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 11aa9698a46e4605a1aa47936d2968e5; Fri, 18 Apr 2025 14:18:43 +0000
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
X-Inumbo-ID: 0a3867da-1c60-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744985923; x=1745255923;
	bh=zUCaxDM5n36EidycTWY29lREVYS1vqxzxsWMLChZfJU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RTEaQttw9/dNnlodj0ugHm+OC6nExkd4qTB1dyfdY1Bi1tJpSv8jvvt8pRR9Y3vNb
	 vGQp8ydE25FN0PXwsrAGXBsR+M+QZEx8ytUWXlcgubuwVwMYnX/jvJamNjnJqLwcQP
	 KMIdxdO277WUbvl3C58x0J4fAdX7IBI8P+t1jAZtVy/YZWkGWYZmgCulhP6xFsbtVi
	 c7+R1mPNAOabI5S5K8/w+QGmcOgbJXE7BXvQdCQblwd6U8w3aPh+B9wzSSkd859Su/
	 SuiLNLfHyty+FUO7ubdulurlruBySjcANBntntRg1ivPWbdj4tcMVWjuOMEUulSmYC
	 QB42fBwgleQUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744985923; x=1745246423; i=teddy.astie@vates.tech;
	bh=zUCaxDM5n36EidycTWY29lREVYS1vqxzxsWMLChZfJU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Xp2hxCz8XqSBmkRZQt7pOBNS/ZSYCTT2clksk1QJPB4Se4vRBxJfGBZH2gNOfXIj0
	 lRN9lD38dFp9pOmZGStMS2JeFTM2lTwxoenZ5Vm6spCKCQG3DZmJlOugjdaFIHe4at
	 BnBeH7GO1lk6kD5aQGpiLaA2u0Y8CWdu0iKgUz6i7oi4XC/M4Asupw+hgKaLpJTGP+
	 oUYCSfcX8/G33O2/pye9RmBUyXo0TSsngZWRlPDR6kjfsl0S5hCHqkatGyj6c3+2DV
	 q+cHezJegQWe+69jxuG60kOlWh39nk1Y37qmmp4hQQPWWDgIng/xWMx/q0E1Q9iac6
	 u88w11HO7AVBw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=204/4]=20libxl:=20Add=20support=20for=20enabling=20physaddr=5Fabi?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744985922839
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>
Message-Id: <762e90acafcbf0b84c670400577501cd0e34bdea.1744981654.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1744981654.git.teddy.astie@vates.tech>
References: <cover.1744981654.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.11aa9698a46e4605a1aa47936d2968e5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250418:md
Date: Fri, 18 Apr 2025 14:18:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 tools/include/libxl.h            | 5 +++++
 tools/libs/light/libxl_create.c  | 4 ++++
 tools/libs/light/libxl_types.idl | 1 +
 tools/xl/xl_parse.c              | 1 +
 4 files changed, 11 insertions(+)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b7ad7735ca..6af9a658c9 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -178,6 +178,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_EVENT_CHANNELS 1
 
+/*
+ * The libxl_domain_build_info has physaddr_abi field.
+ */
+#define LIBXL_HAVE_BUILDINFO_PHYS_ADDR_ABI 1
+
 /*
  * libxl_domain_build_info has the u.hvm.ms_vm_genid field.
  */
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index e03599ea99..43e8c18768 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -466,6 +466,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
 
         libxl_defbool_setdefault(&b_info->apic,                     true);
         libxl_defbool_setdefault(&b_info->nested_hvm,               false);
+        libxl_defbool_setdefault(&b_info->physaddr_abi,             false);
     }
 
     if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
@@ -662,6 +663,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
 
             if ( libxl_defbool_val(b_info->nested_hvm) )
                 create.flags |= XEN_DOMCTL_CDF_nested_virt;
+
+            if (libxl_defbool_val(b_info->physaddr_abi))
+                create.flags |= XEN_DOMCTL_CDF_physaddr_abi;
         }
 
         if (libxl_defbool_val(b_info->vpmu))
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9bb2969931..d02e84471b 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -637,6 +637,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("nested_hvm",       libxl_defbool),
     ("apic",             libxl_defbool),
     ("dm_restrict",      libxl_defbool),
+    ("physaddr_abi",     libxl_defbool),
     ("tee",              libxl_tee_type),
     ("u", KeyedUnion(None, libxl_domain_type, "type",
                 [("hvm", Struct(None, [("firmware",         string),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 089a88935a..bd674684fa 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1803,6 +1803,7 @@ void parse_config_data(const char *config_source,
     }
 
     xlu_cfg_get_defbool(config, "nestedhvm", &b_info->nested_hvm, 0);
+    xlu_cfg_get_defbool(config, "physaddr_abi", &b_info->physaddr_abi, 0);
 
     switch(b_info->type) {
     case LIBXL_DOMAIN_TYPE_HVM:
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


