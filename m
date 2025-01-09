Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D777A07C21
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:40:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868814.1280330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVudK-0002cc-IB; Thu, 09 Jan 2025 15:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868814.1280330; Thu, 09 Jan 2025 15:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVudK-0002Yp-DN; Thu, 09 Jan 2025 15:39:42 +0000
Received: by outflank-mailman (input) for mailman id 868814;
 Thu, 09 Jan 2025 15:39:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rr8/=UB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tVudI-0002Hw-MF
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:39:40 +0000
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [2a00:1450:4864:20::541])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efce0532-ce9f-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 16:39:39 +0100 (CET)
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-5d90a5581fcso1640350a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:39:39 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95aede8sm82723366b.136.2025.01.09.07.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 07:39:37 -0800 (PST)
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
X-Inumbo-ID: efce0532-ce9f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736437178; x=1737041978; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3YsgkxCJNhRWuii4lScraZ8R8FAXUDtlUaTp5QBmgQ=;
        b=Wcz/24rrOOSpkctzWZ/Dy66SYzWyAEo3tiv8PiBTv3YNLpkkQ5bFGhrkEdGrjmztu9
         BgekegB6NGD24uVZTIqUVraHmPCeTv9Ci5IFlKC5Y8e6p6LbjXo20zTV7c11tYEeTYEM
         AqOPpwX+3tKP7YROdjI1SAKtFlL6j3d6krVTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437178; x=1737041978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3YsgkxCJNhRWuii4lScraZ8R8FAXUDtlUaTp5QBmgQ=;
        b=qXpeikXQR9tbLA/ERCtrSvfYpS/RC99qQ4tJTShNOa2lIhwITbSY+3NZx2biIdlrSj
         K7+i4JVl/hLnwHrTxPZ7rzDkFcqXSNcigulKk2ImXsmYixBoGFU8OnmovEvLzv1x9cV2
         6iMRTma/38WxN6rlBFnxCIjcz7Srd93eOcMUC8myQvknvax/J5ZAK1abwl88AgknSyQd
         0MbPPfO/E+P4QmAN7pk3YFXboIYlOUt50z67CkN3gxyHNWFEBKgcNQXJbKGBzEFtBg2I
         O7wwJaLcfcuQyLIR5s/oahSNNSt3T5HgyGlCvZe1PVf7Fti1Jb4hM/CUWalgNpZRqllW
         VJ/w==
X-Gm-Message-State: AOJu0YwO12WU86DsVrGJoH7VdhKc0qqM1GJremqPVz2L6tB5YY/o1Pn+
	dRWfPcx+xGXCJebfi4EP9St3ZIgTGNlPF+3JWHDdueJ52+HoKPnR4/UCk7UBqekv8UIhVCqkOI3
	S7sSb8zqL
X-Gm-Gg: ASbGnctlTw/qzQHB6ur+VBpkYwbg/wY039sGa7idJpRXS3o1Ako6aHr8HMxFdQHqIFG
	VwSHlzeGLbIWk6k1Ja00Pz86LIBNUEhVLg/8hwoXLkv5VG8TwJyv+GKPuGuqXXYCmc0eMGVmUZg
	5wcMswbUF/GpGw9SUa/6xs3oPiu3Kk3sk4bM6dibdqnl96mjVxWTq8JAGeNyuebKeZYaQ4/E/Ek
	1P4Ws/RaMn72nVR52noz2GV2X/9gjsW1nKVksmTRE83BIxKpwZh9Fnxq27PYwpn+sCM37zLEIdA
	i4xLgg==
X-Google-Smtp-Source: AGHT+IG1mAN+AzsRq6EbTZFQRTyMfOZ+1JQC8+kevnPyWaOqa1CNW2p3/eY0QMScXAGTHypqSjJARA==
X-Received: by 2002:a17:907:1b86:b0:ab2:b8c3:be3c with SMTP id a640c23a62f3a-ab2b8c3c336mr447300766b.51.1736437178346;
        Thu, 09 Jan 2025 07:39:38 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/2] Update Xen version to 4.20-rc
Date: Thu,  9 Jan 2025 15:39:21 +0000
Message-Id: <20250109153921.43610-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250109153921.43610-1-andrew.cooper3@citrix.com>
References: <20250109153921.43610-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 README       | 16 ++++++++--------
 SUPPORT.md   |  2 +-
 xen/Makefile |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/README b/README
index 72f6b0fcde47..373885523c8e 100644
--- a/README
+++ b/README
@@ -1,11 +1,11 @@
-############################################################
-__  __                                _        _     _
-\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
- \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
- /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
-/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
-
-############################################################
+#####################################################
+__  __            _  _    ____   ___
+\ \/ /___ _ __   | || |  |___ \ / _ \       _ __ ___
+ \  // _ \ '_ \  | || |_   __) | | | |_____| '__/ __|
+ /  \  __/ | | | |__   _| / __/| |_| |_____| | | (__
+/_/\_\___|_| |_|    |_|(_)_____|\___/      |_|  \___|
+
+#####################################################
 
 https://www.xen.org/
 
diff --git a/SUPPORT.md b/SUPPORT.md
index 54c78b722d7a..2bc5bd81ee39 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.20-unstable
+    Xen-Version: 4.20-rc
     Initial-Release: n/a
     Supported-Until: TBD
     Security-Support-Until: Unreleased - not yet security-supported
diff --git a/xen/Makefile b/xen/Makefile
index 2e1a925c8417..1eca2bdb4939 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
 # All other places this is stored (eg. compile.h) should be autogenerated.
 export XEN_VERSION       = 4
 export XEN_SUBVERSION    = 20
-export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
+export XEN_EXTRAVERSION ?= .0-rc$(XEN_VENDORVERSION)
 export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
 -include xen-version
 
-- 
2.39.5


