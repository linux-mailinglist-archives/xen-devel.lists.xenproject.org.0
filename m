Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923D896F788
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 16:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791902.1201925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smaN1-0003rj-Lt; Fri, 06 Sep 2024 14:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791902.1201925; Fri, 06 Sep 2024 14:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smaN1-0003pu-Iw; Fri, 06 Sep 2024 14:55:31 +0000
Received: by outflank-mailman (input) for mailman id 791902;
 Fri, 06 Sep 2024 14:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+R7=QE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smaN0-0003po-NQ
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 14:55:30 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0eff860b-6c60-11ef-a0b4-8be0dac302b0;
 Fri, 06 Sep 2024 16:55:29 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c263118780so2385566a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 07:55:29 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a7af8e46dsm193979266b.16.2024.09.06.07.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 07:55:27 -0700 (PDT)
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
X-Inumbo-ID: 0eff860b-6c60-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725634529; x=1726239329; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QugQ4zyTZaBAPAdw2xidCShgxbUJwjvFvIJ9JyW3mjE=;
        b=fLhlf3kAEVbeyBW7wvz4sc/tzqhEq+oKEWMnnXAKeKjo2ApvMsSQ8jEDF8aY3vFQIK
         w5pL73nlsOmGbSzCH/j+a3L4+nMI3iFSWVMiZTgkdr+Coo823D9fC5LbRaZNO4sZLRWq
         27XScL1RFELs/mbZcrqrmTIjY6q8G0cr/lg3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725634529; x=1726239329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QugQ4zyTZaBAPAdw2xidCShgxbUJwjvFvIJ9JyW3mjE=;
        b=lEXefZUhY5Vlf/BLm0Sjp5H5VGuA6cQG1g3VWC229SNZi4pv84IQvnNJH80zCA+/hi
         MrqpfZwdbuFypAQIQuhYxArTNb2ehpuW7UC11YyDOmlWjhPAZSuID5ZM1ksmBch8tzq6
         /zj5AGvHg3GjIl4VqygWHjMYQsDiM2GWaMrsCPIWBvmsZwcK6G56IFTVv0wwzI5ACBh3
         Z2zAO8RVUUvOBCwpMeFaDZjMV2+XpIVzsjkhVwvm8bCUEEWrGYPFy3CYLbRWWNpHjsdF
         ADzFDoBzCmNUJAnjq9RJCcJlVJnRTOuJHlyWuZqsF7JaVHx3ZxldUMOOtCXaMMiVT7NY
         EbEQ==
X-Gm-Message-State: AOJu0YzHVZuDrnsrcwjGARngumfW3dveUKY4Rylf7UXCtbszvZDUfdMG
	MmjV74Dk+g3CET9qSa3B+dS+ENyng9DNuJqN/eGHpPkCHd2R/M5/220xTYqWQtDE8f0Ll5/rH+W
	m
X-Google-Smtp-Source: AGHT+IFsXHMwZTbJ1BLpBxLnAVRseY5uwoD+3e0B09g06q/sbd7kCu/6f41YgBLo/TzqzSIl9Fl7ww==
X-Received: by 2002:a17:907:3f0a:b0:a86:7c6e:2bb9 with SMTP id a640c23a62f3a-a8a885bff84mr246713566b.2.1725634527688;
        Fri, 06 Sep 2024 07:55:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Rob Hoes <Rob.Hoes@citrix.com>,
	Andrii Sultanov <andrii.sultanov@cloud.com>
Subject: [PATCH] tools/ocaml: Rationalise .gitignore
Date: Fri,  6 Sep 2024 15:55:24 +0100
Message-Id: <20240906145524.186148-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The root .gitignore is quite stale from recent (and less recent) removals, but
also fails to work for the forthcoming dynamic plugin work.

Strip all Ocaml content out of the root .gitignore, and provide a more local
.gitignore's with up-to-date patterns.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
CC: Andrii Sultanov <andrii.sultanov@cloud.com>

I'm on the fence as to whether put paths.ml in the general ignore, but that
would be making an assumption about future code
---
 .gitignore                       | 28 ----------------------------
 tools/ocaml/.gitignore           |  5 +++++
 tools/ocaml/libs/xc/.gitignore   |  1 +
 tools/ocaml/libs/xs/.gitignore   |  1 +
 tools/ocaml/xenstored/.gitignore |  3 +++
 5 files changed, 10 insertions(+), 28 deletions(-)
 create mode 100644 tools/ocaml/.gitignore
 create mode 100644 tools/ocaml/libs/xc/.gitignore
 create mode 100644 tools/ocaml/libs/xs/.gitignore
 create mode 100644 tools/ocaml/xenstored/.gitignore

diff --git a/.gitignore b/.gitignore
index d8b57e32f888..d88be80b28d6 100644
--- a/.gitignore
+++ b/.gitignore
@@ -92,7 +92,6 @@ stubdom/mini-os-*
 stubdom/mk-headers-*
 stubdom/newlib-1.*
 stubdom/newlib-x86*
-stubdom/ocaml-*
 stubdom/pciutils-*
 stubdom/pkg-config/*
 stubdom/polarssl-*
@@ -339,33 +338,6 @@ tools/misc/xen-hvmcrash
 tools/misc/xen-lowmemd
 tools/vchan/vchan-node[12]
 tools/vchan/vchan-socket-proxy
-tools/ocaml/*/.ocamldep.make
-tools/ocaml/*/*.cm[ixao]
-tools/ocaml/*/*.cmxa
-tools/ocaml/*/*.annot
-tools/ocaml/*/*/.ocamldep.make
-tools/ocaml/*/*/*.cm[ixao]
-tools/ocaml/*/*/*.cmxa
-tools/ocaml/*/*/*.annot
-tools/ocaml/*/*/META
-tools/ocaml/libs/xl/_libxl_types.inc
-tools/ocaml/libs/xl/_libxl_types.ml.in
-tools/ocaml/libs/xl/_libxl_types.mli.in
-tools/ocaml/libs/xl/xenlight.ml
-tools/ocaml/libs/xl/xenlight.mli
-tools/ocaml/libs/xentoollog/_xtl_levels.*
-tools/ocaml/libs/xentoollog/xentoollog.ml
-tools/ocaml/libs/xentoollog/xentoollog.mli
-tools/ocaml/libs/xs/paths.ml
-tools/ocaml/libs/xc/xenctrl_abi_check.h
-tools/ocaml/xenstored/oxenstored
-tools/ocaml/xenstored/oxenstored.conf
-tools/ocaml/xenstored/paths.ml
-tools/ocaml/test/xtl
-tools/ocaml/test/send_debug_keys
-tools/ocaml/test/list_domains
-tools/ocaml/test/dmesg
-tools/ocaml/test/raise_exception
 tools/debugger/kdd/kdd
 tools/firmware/etherboot/ipxe.tar.gz
 tools/firmware/etherboot/ipxe/
diff --git a/tools/ocaml/.gitignore b/tools/ocaml/.gitignore
new file mode 100644
index 000000000000..3687c2af4f26
--- /dev/null
+++ b/tools/ocaml/.gitignore
@@ -0,0 +1,5 @@
+/**/META
+/**/.ocamldep.make
+/**/*.annot
+/**/*.cm[ixao]
+/**/*.cmx[as]
diff --git a/tools/ocaml/libs/xc/.gitignore b/tools/ocaml/libs/xc/.gitignore
new file mode 100644
index 000000000000..1b26ad32b6c3
--- /dev/null
+++ b/tools/ocaml/libs/xc/.gitignore
@@ -0,0 +1 @@
+/xenctrl_abi_check.h
diff --git a/tools/ocaml/libs/xs/.gitignore b/tools/ocaml/libs/xs/.gitignore
new file mode 100644
index 000000000000..4d556ef38cac
--- /dev/null
+++ b/tools/ocaml/libs/xs/.gitignore
@@ -0,0 +1 @@
+/paths.ml
diff --git a/tools/ocaml/xenstored/.gitignore b/tools/ocaml/xenstored/.gitignore
new file mode 100644
index 000000000000..2b432de4fc91
--- /dev/null
+++ b/tools/ocaml/xenstored/.gitignore
@@ -0,0 +1,3 @@
+/oxenstored
+/oxenstored.conf
+/paths.ml
-- 
2.39.2


