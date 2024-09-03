Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC4C969C41
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 13:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788995.1198518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slRy1-0007iO-0m; Tue, 03 Sep 2024 11:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788995.1198518; Tue, 03 Sep 2024 11:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slRy0-0007gA-SM; Tue, 03 Sep 2024 11:45:00 +0000
Received: by outflank-mailman (input) for mailman id 788995;
 Tue, 03 Sep 2024 11:44:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rbyx=QB=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1slRxy-0007fy-NF
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 11:44:58 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1209068-69e9-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 13:44:56 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a868d7f92feso569930666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 04:44:56 -0700 (PDT)
Received: from EMEAENGAAD87503.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feacd7sm673794266b.34.2024.09.03.04.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:44:55 -0700 (PDT)
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
X-Inumbo-ID: f1209068-69e9-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725363896; x=1725968696; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3uiJkcMs0v8wpWaoqcKTed5O8Q8sKp8VnkIXoXgnayk=;
        b=RfajgOxF4CMOWFEZEgMlV/qOJnnFab/QwszuzGNheF0s+NUuO6qyTPBoXqsn96MM30
         sXwuhliDS5H7IkSk281uY/92tUEtdIUcanLW6/2bUT9MPgdbK0jt5seJXE5vhxwaZr1l
         Vq0aZTU7jECcCvSfcxtaP5oPs+teOIig3Wi6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725363896; x=1725968696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uiJkcMs0v8wpWaoqcKTed5O8Q8sKp8VnkIXoXgnayk=;
        b=Rde9kFFQt57wTtjXsoh5Tpdw6Vt03H7sMvJ0Hco6vA1BriuehGSZNW1SRzuQwLSnV0
         CZCfZjqdomEVe/BH6aResDUh6DAQiGUKZFXM9SKQbPQD0Ljrcu6GvpAPIy9Rbam1CHI2
         4Xjkquau1h8Imf8XAKYQktkFk210Vin/SCkl4+30LTDHSRBqCKVP2w++AwdK39y5aECE
         R2Wgxt05n69xqrST0o11lZJH0HHgHtKtH99cOCT/z8tGxciehbu/NXX47M1pI+xVNUWK
         em8o9aNo1UZNR09CymY+73IkXF3WHn4NmV//obfSTAvJUTa4xqEh2EGyAJzSKHjjJwMf
         lVQQ==
X-Gm-Message-State: AOJu0YwwE2TvDDSxrpSiuphkZYuerAy5PDOA828A1AYR4b8cHHrDsGSa
	krNm7Ji9K/WEGebe0nPZe/Gvx3xI+R4pkMtIsV5jnywcdNNwM6LyKmLCb6648kEu1p64s/p08gX
	noRI=
X-Google-Smtp-Source: AGHT+IF8PIllBj14RxEhvC6PvyfkKhxGJd242/qnMK0iBSYRnf70m1dvOckzVU6OTY4eN93Y721NBw==
X-Received: by 2002:a17:907:869f:b0:a86:851e:3a2b with SMTP id a640c23a62f3a-a897f8bc9b9mr1439959966b.29.1725363895642;
        Tue, 03 Sep 2024 04:44:55 -0700 (PDT)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] tools/ocaml: Stabilize domain_getinfo for Oxenstored
Date: Tue,  3 Sep 2024 12:44:41 +0100
Message-Id: <cover.1725363427.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a V2 of the "Stabilize Oxenstored's interface with" patch
series, see V1's cover letter for the motivation of these changes.

Two patches from V1 ("tools/ocaml: Fix OCaml libs rules" and
"Remove '-cc $(CC)' from OCAMLOPTFLAGS") were commited upstream, so
they've been dropped from here.

V2 addresses the following review comments and suggestions:

* Split the plugin implementation commit into two - build
  infrastructure-related and implementation itself.
* Package xenstored_glue interface, since it's needed for an
  out-of-tree oxenstored to build. Additionally package xenstored_glue_dev
  with .ml and .mli files.
* Clean up unnecessary #define, #include, and fix function parameter
  types as suggested.
* Improve error handling in xsglue_failwith_xc, additionally version
  xsg.error to avoid potential future conflicts.
* Drop the GC lock around xc_domain_getinfo_single, and move Int_val
  outside of the blocking_section.
* Use existing logging facilities in oxenstored
* Plugin now uses logging function provided by the plugin interface
  (ignoring input by default)
* domain_getinfolist gets all 32k domains at once instead of listing them
  in chunks, storing information into an array. OCaml interface was simplified
  appropriately. (Cxenstored does not do this at the moment - as far as I
  understand, it also uses the single-domain version of the function).

I've decided against introducing an enum for the shutdown code, as it adds
additional complexity (and potential reasons for creating a new plugin version)
without any benefit - oxenstored does not care about its value at the moment.

Patch series on Gitlab for ease of review:
https://gitlab.com/xen-project/people/asultanov/xen/-/compare/staging...plugin-v3

V2 passed the Gitlab CI: https://gitlab.com/xen-project/people/asultanov/xen/-/pipelines/1437391764
It was also tested on some hosts.

Andrii Sultanov (3):
  tools/ocaml: Build infrastructure for OCaml dynamic libraries
  ocaml/libs: Implement a dynamically-loaded plugin for
    Xenctrl.domain_getinfo
  tools/oxenstored: Use the plugin for Xenctrl.domain_getinfo

 Config.mk                                     |   2 +-
 configure                                     |   7 +
 m4/paths.m4                                   |   4 +
 tools/configure                               |   7 +
 tools/ocaml/Makefile                          |   1 +
 tools/ocaml/Makefile.rules                    |  17 +-
 tools/ocaml/libs/Makefile                     |   2 +-
 tools/ocaml/libs/xenstoredglue/META.in        |   4 +
 tools/ocaml/libs/xenstoredglue/Makefile       |  46 +++++
 .../domain_getinfo_plugin_v1/META.in          |   5 +
 .../domain_getinfo_plugin_v1/Makefile         |  38 ++++
 .../domain_getinfo_stubs_v1.c                 | 172 ++++++++++++++++++
 .../domain_getinfo_v1.ml                      |  36 ++++
 .../domain_getinfo_v1.mli                     |   0
 .../libs/xenstoredglue/plugin_interface_v1.ml |  28 +++
 .../xenstoredglue/plugin_interface_v1.mli     |  36 ++++
 tools/ocaml/xenstored/Makefile                |   5 +-
 tools/ocaml/xenstored/domains.ml              |  63 +++++--
 tools/ocaml/xenstored/paths.ml.in             |   1 +
 19 files changed, 451 insertions(+), 23 deletions(-)
 create mode 100644 tools/ocaml/libs/xenstoredglue/META.in
 create mode 100644 tools/ocaml/libs/xenstoredglue/Makefile
 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/META.in
 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/Makefile
 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_stubs_v1.c
 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.ml
 create mode 100644 tools/ocaml/libs/xenstoredglue/domain_getinfo_plugin_v1/domain_getinfo_v1.mli
 create mode 100644 tools/ocaml/libs/xenstoredglue/plugin_interface_v1.ml
 create mode 100644 tools/ocaml/libs/xenstoredglue/plugin_interface_v1.mli

-- 
2.39.2


