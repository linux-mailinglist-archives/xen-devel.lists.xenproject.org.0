Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07910AE2397
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 22:34:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021240.1397255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSiRL-00042I-80; Fri, 20 Jun 2025 20:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021240.1397255; Fri, 20 Jun 2025 20:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSiRL-00040H-5J; Fri, 20 Jun 2025 20:34:23 +0000
Received: by outflank-mailman (input) for mailman id 1021240;
 Fri, 20 Jun 2025 20:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gm1g=ZD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uSiRJ-00040B-V3
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 20:34:21 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1f05186-4e15-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 22:34:21 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-3a375e72473so1073704f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 13:34:21 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535eac8e19sm68534725e9.21.2025.06.20.13.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 13:34:19 -0700 (PDT)
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
X-Inumbo-ID: f1f05186-4e15-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750451660; x=1751056460; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8OwyQKlXUOhtdxWYAXgewhFCfX/X/eqeQc/qXnB0Xo=;
        b=cBkKHAumkfxmNTCoPnY6vcibP3jPBR1NtZl+JYFchDWbpvsg0CdJeA1JByIjXbJIf9
         cgHEyVNnKihHIDxUVu6y4kr6jsS02rdvd+ob9bjuAwWPvp1vnE4YYfDeMOFoMp7z1uVu
         zU/7RXGqBV9WIypIglqCngaSbyEeRVBctmSQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750451660; x=1751056460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8OwyQKlXUOhtdxWYAXgewhFCfX/X/eqeQc/qXnB0Xo=;
        b=RPJwXZRAZbv+qOljUS7my+0PRx/oee4D/2YijSVBbBj7OhrMInutgrZcoIlC5FqMxb
         c5DSeTi+3+y1rcWY5m7sqEvpmMnjDp2TjOZEl4BCoQ8aVx2Fn/HUzzYe6fwVN2cuU70j
         SZtVVpZGO1+Xn6pGr9iE2AX3uVN1tA3aPf/hT9LqfVA9JJMqU4kIpYEXbmHRSGxuEKwM
         pUwiMNHasbInUq/M1R6cg174zOBhfxGAh38aIyDb4cNgASe3YTMI9dZlzWVen/NN2r8d
         kJZrUrbvqe9IQXIOZ6PmJ95f5AGcYO0XhZE7TgbjVbAwcc8RYsmNcY/N4JehuyRurwah
         YJGw==
X-Gm-Message-State: AOJu0YwD/hZj5/2cTkomnN7c5ykwCGdgBWIDG4yaAzjviBU8LSBjG+Vr
	C0SxL2qI4xhXnZShsKWPigx0Ym+56DUo+/cFj1Ifar684uPtcp7w5dKvsF8BC6Tk5qBJ2pJIwvS
	MHfGamwewDQ==
X-Gm-Gg: ASbGnctrkkGS1R7JQsetDV/oh/+PLgwC5LjiYdgEQV7U7g4iiq0YsJ+sPQF5xmCtjno
	YFNgscG/JKbEtMTdYqd5tfqGQlZUbpoddw/JY5jQtNOKv4pmgko3Uj94WyM/xXazLq4d4lju64B
	0Vjs9zSOBQsIra2tnFxrByge2AD0jGuOeoRGB6Cz8sZ5hOllaXPBNBvwTzhZfGAAqXjq4sOFmI9
	ZFThIK/z76MPBgCgogudyXMUikXfkrxIR2l+urtZG1wRKLgovhrDdqqmtVR/Vk1FV4o6EST96od
	ijLl/Jy1dlUauYHitt/ZB50gdolSPdKYaHLVDDUOr3eR2iJNQv8TWU4Yzba2nu+lptjYsCVW4rK
	H58AISkMr5hUhthxoU+xxcdKR3fid3eIdiNU=
X-Google-Smtp-Source: AGHT+IHmtFEy00wmjm4f0JoWOXd805D5FeimdEflY1MZdxYnsOKesAC4ZA9CSuejLCf7Ycra814D5w==
X-Received: by 2002:a05:6000:1a85:b0:3a4:dc80:b932 with SMTP id ffacd0b85a97d-3a6d1193dfbmr3216021f8f.8.1750451660185;
        Fri, 20 Jun 2025 13:34:20 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] docs: Introduce a default .readthedocs.yaml
Date: Fri, 20 Jun 2025 21:34:18 +0100
Message-Id: <20250620203418.42526-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Read The Docs now requires a configuration file, which is awkward when using
RTD to render proposed changes on the list.

Provide the minimal configuration file possible, sacrificing all
reproducibility in order to hopefully not need to touch it moving forwards.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

Notably, I've figured out how to get back to using rtd-theme:

  https://andrewcoop-xen.readthedocs.io/en/docs-secureboot/admin-guide/uefi-secure-boot.html

and without needing a separate docs/requirements.txt file in the tree too.
---
 .readthedocs.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 .readthedocs.yaml

diff --git a/.readthedocs.yaml b/.readthedocs.yaml
new file mode 100644
index 000000000000..d3aff7662ebf
--- /dev/null
+++ b/.readthedocs.yaml
@@ -0,0 +1,18 @@
+# Read the Docs configuration file for Sphinx projects
+# See https://docs.readthedocs.io/en/stable/config-file/v2.html for details
+
+version: 2
+
+build:
+  os: ubuntu-lts-latest
+
+  tools:
+    python: "latest"
+
+  jobs:
+    post_install:
+      # Instead of needing a separate requirements.txt
+      - python -m pip install --upgrade --no-cache-dir sphinx-rtd-theme
+
+sphinx:
+  configuration: docs/conf.py
-- 
2.39.5


