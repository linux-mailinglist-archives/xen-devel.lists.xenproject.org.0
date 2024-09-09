Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121CD9718DF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 14:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794380.1203276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd6k-0000eq-Pt; Mon, 09 Sep 2024 12:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794380.1203276; Mon, 09 Sep 2024 12:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd6k-0000cf-NP; Mon, 09 Sep 2024 12:03:02 +0000
Received: by outflank-mailman (input) for mailman id 794380;
 Mon, 09 Sep 2024 12:03:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/dp=QH=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1snd6j-0000cW-BB
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 12:03:01 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74f1888d-6ea3-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 14:02:59 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d100e9ce0so343792066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 05:02:59 -0700 (PDT)
Received: from EMEAENGAAD87503.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d65742sm331603066b.216.2024.09.09.05.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 05:02:57 -0700 (PDT)
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
X-Inumbo-ID: 74f1888d-6ea3-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725883378; x=1726488178; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BveZBdtX8GQFiv4Y6u5leGrA5NSjoy0XIFu/7d4C7Lc=;
        b=SZZYDs1xPK0hbFZnQ7FQKHGHRBGCzJ7XdqeZ9xGIHhbOULcg1VWL/5WSIDXsybGggu
         Vf68IFmynkV0nUftmAngnDqgj/J5p4qIny5nHXMdhAyn5mI6k8ENzhylE60JPaNziht3
         hHcGC3K+dIyYuAGLdFeMoYwk97TLqK5koSxus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725883378; x=1726488178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BveZBdtX8GQFiv4Y6u5leGrA5NSjoy0XIFu/7d4C7Lc=;
        b=jpcBu4ELzD9YyaDOOQDhMCaVCpiEj/f5VyX9UsY+c5IN1RN0sQO8XrNOfRi7PIYw3j
         F8ZzR6Otx7mCXG4kkRKUeJS+/REK5TIyKw760cvnlfbQYdmE70hCZ85+cF7IMUHYQeyn
         Q+ai2xK3VkViTgqyrKG+CSStetp2pwh8+UrTJIQzvF2zQrAZaFIR+w8oCcyiUzthv++A
         bYncRNxKUdsL67aL5SCznpqbXjVIto8SczUdvtVPTbf24RWrW+kWZt5/rDkvVNcqRE4u
         +XFwyw4L6lFEal4MaCmBow9w32Dszp1kfURngIeez8zl+CpNnbTofU+HNQI/aFhZ8u71
         lcRw==
X-Gm-Message-State: AOJu0YyZUsOA9hsJbNXl+Qv04Msmv4HInbvmBetRVW4exRl5sTOGfPtS
	QMlA0r9Ag5wCzhE/C11ETQW5c5tqy5uCdAn445aTNdE9bylFjpZJdPm9mGikGtjw0TncGUCYtSh
	8
X-Google-Smtp-Source: AGHT+IEP0vwrUz+S7iLIJsg3pw4FwVylsSE+3StucLT6qdFMg3UmikLIxpn8tBqXcYs/fMbVE1HhCg==
X-Received: by 2002:a17:907:9606:b0:a86:9ba1:639e with SMTP id a640c23a62f3a-a8a885fb742mr1116946666b.26.1725883377820;
        Mon, 09 Sep 2024 05:02:57 -0700 (PDT)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 0/3] tools/ocaml: Stabilize domain_getinfo for Oxenstored
Date: Mon,  9 Sep 2024 13:02:39 +0100
Message-Id: <cover.1725881488.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes from V2:

* Drop the upstreamed "Build infrastructure" commit
* Split the last commit into two: Loading the plugin in oxenstored and
switching to it
* Remove configure and paths.m4 defines as suggested.
* Reformat files appropriately
* Rename all instances of 'xenstoredglue', 'xenstored_glue', 'xsglue' to
'xsd_glue' for consistency
* Remove _v1 suffix from all static functions
* Remove leftover #defines left unused by the previous changes
* Fix inconsistent tabs/spaces usage, added blank lines where appropriate.
* Define the 'xsd_glue_failwith' macro as suggested
* Remove first_domain argument in 'domain_getinfolist' function
* Remove unnecessary memory allocation alignment code in
'domain_getinfolist'
* Improve error handling in 'domain_getinfolist' as suggested.
* Add SPDX license headers to new files.

Patch series on Gitlab for ease of review: https://gitlab.com/xen-project/people/asultanov/xen/-/compare/staging...plugin-v3

These changes passed the Gitlab CI:
- Loading the plugin: https://gitlab.com/xen-project/people/asultanov/xen/-/pipelines/1445544074
- Switching to it as well: https://gitlab.com/xen-project/people/asultanov/xen/-/pipelines/1445699231

The patch series has also been tested manually.

Andrii Sultanov (3):
  ocaml/libs: Implement a dynamically-loaded plugin for
    Xenctrl.domain_getinfo
  tools/oxenstored: Load the plugin for Xenctrl.domain_getinfo
  tools/oxenstored: Switch to using the plugin for
    Xenctrl.domain_getinfo

 tools/ocaml/Makefile                          |   1 +
 tools/ocaml/libs/Makefile                     |   2 +-
 tools/ocaml/libs/xsd_glue/META.in             |   4 +
 tools/ocaml/libs/xsd_glue/Makefile            |  46 +++++
 .../xsd_glue/domain_getinfo_plugin_v1/META.in |   5 +
 .../domain_getinfo_plugin_v1/Makefile         |  38 ++++
 .../domain_getinfo_stubs_v1.c                 | 162 ++++++++++++++++++
 .../domain_getinfo_v1.ml                      |  35 ++++
 .../domain_getinfo_v1.mli                     |   1 +
 .../libs/xsd_glue/plugin_interface_v1.ml      |  30 ++++
 .../libs/xsd_glue/plugin_interface_v1.mli     |  38 ++++
 tools/ocaml/xenstored/Makefile                |   5 +-
 tools/ocaml/xenstored/domains.ml              |  79 ++++++---
 tools/ocaml/xenstored/paths.ml.in             |   1 +
 14 files changed, 419 insertions(+), 28 deletions(-)
 create mode 100644 tools/ocaml/libs/xsd_glue/META.in
 create mode 100644 tools/ocaml/libs/xsd_glue/Makefile
 create mode 100644 tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/META.in
 create mode 100644 tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/Makefile
 create mode 100644 tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
 create mode 100644 tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
 create mode 100644 tools/ocaml/libs/xsd_glue/domain_getinfo_plugin_v1/domain_getinfo_v1.mli
 create mode 100644 tools/ocaml/libs/xsd_glue/plugin_interface_v1.ml
 create mode 100644 tools/ocaml/libs/xsd_glue/plugin_interface_v1.mli

-- 
2.39.2


