Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5BC8672A5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 12:08:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685460.1066226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYqK-00039E-EC; Mon, 26 Feb 2024 11:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685460.1066226; Mon, 26 Feb 2024 11:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYqK-00036c-9t; Mon, 26 Feb 2024 11:08:20 +0000
Received: by outflank-mailman (input) for mailman id 685460;
 Mon, 26 Feb 2024 11:08:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CwqN=KD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1reYqI-00035d-UT
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 11:08:18 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 583520df-d497-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 12:08:18 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5129cdae3c6so3760009e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 03:08:18 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 fu38-20020a05622a5da600b0042e09c6b82dsm2307513qtb.24.2024.02.26.03.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 03:08:17 -0800 (PST)
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
X-Inumbo-ID: 583520df-d497-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708945697; x=1709550497; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaG0bjtk7lVLtBaV15USC2Ji0PDyjB7kZA+T0Bke/cE=;
        b=GjQqKov/KDH+XwcOwCVE/7RKe2qdo3GOuUFaqPVBNajMNRN7nNnkT71ZCH722hGP85
         e5B/sLGa7nGjqtlic5N3wkSNH7ISghBIwWe1vat0IUGDjA0qbAUD9Tntk2tipt6cAyuV
         f8gjviYzs52kHkIYmsVk5FCfjcJEyZyeYqJeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708945697; x=1709550497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaG0bjtk7lVLtBaV15USC2Ji0PDyjB7kZA+T0Bke/cE=;
        b=QOslzMYtuyC95td2cPoltgsqdPkzPUKnwhccYw8Y4uf/pv+jpj0lZMp5Gd/3RIG03H
         Ljta99vfh9lPjQguqW11XI7HuXRFI9F9a3bjkUFyOih6WEvk7x3acAN0BPF7NrvPlhy5
         Obzs4YXUrd6LWXfs5QEKfNHiAxfsSeG3fq/Ra4OqENl1x7VH3ehwCbNY5Vk/aEf2cMMV
         1sY6VJgO9i5q88Dj4RdRbkNH+qGfDYiqkv+w39X5ZGuWvMZ2eYorY29GhGFf5qPw0gBw
         0eTOng33W47YMMSrMLkqSMnI2ngE1haXD547D+45mwW4aztdg3sPQ1c1Fblf+c+xl1E5
         drhg==
X-Gm-Message-State: AOJu0YzuQIOIZIFaEmbIKQ+KDp9kUC+8w5AtXmWNJXbRNqy+/fBlWG8v
	MgHpu0cS2Ef27jsSIbeohPhU6TcnuvPxshMZnCqEyk5K++m4JNMgA9b0P2cFbG0Qm/qc8PRUkeK
	z
X-Google-Smtp-Source: AGHT+IFPk5TtQYJAUBadwwKI9KWtZ6T+v6n4ml3De9qHFqqBKDwnBmu3W5XhiQJ1B4vi/ShY2A3JTQ==
X-Received: by 2002:ac2:4c49:0:b0:512:ec53:5915 with SMTP id o9-20020ac24c49000000b00512ec535915mr4959845lfk.15.1708945697370;
        Mon, 26 Feb 2024 03:08:17 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/4] x86/spec: fix BRANCH_HARDEN option to only be set when build-enabled
Date: Mon, 26 Feb 2024 12:07:46 +0100
Message-ID: <20240226110748.80254-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226110748.80254-1-roger.pau@citrix.com>
References: <20240226110748.80254-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic to handle the BRANCH_HARDEN option will report it as enabled
even when build-time disabled. Fix this by only allowing the option to be set
when support for it is built into Xen.

Fixes: 2d6f36daa086 ('x86/nospec: Introduce CONFIG_SPECULATIVE_HARDEN_BRANCH')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Use IS_ENABLED() in the parser.

Changes since v1:
 - Use no_config_param().
---
 xen/arch/x86/spec_ctrl.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 9f5ed8772533..5fae80774519 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -50,7 +50,8 @@ static int8_t __initdata opt_psfd = -1;
 int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
 int8_t __read_mostly opt_eager_fpu = -1;
 int8_t __read_mostly opt_l1d_flush = -1;
-static bool __initdata opt_branch_harden = true;
+static bool __initdata opt_branch_harden =
+    IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH);
 
 bool __initdata bsp_delay_spec_ctrl;
 uint8_t __read_mostly default_xen_spec_ctrl;
@@ -268,7 +269,16 @@ static int __init cf_check parse_spec_ctrl(const char *s)
         else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
             opt_l1d_flush = val;
         else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
-            opt_branch_harden = val;
+        {
+            if ( IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH) )
+                opt_branch_harden = val;
+            else
+            {
+                no_config_param("SPECULATIVE_HARDEN_BRANCH", "spec-ctrl", s,
+                                ss);
+                rc = -EINVAL;
+            }
+        }
         else if ( (val = parse_boolean("srb-lock", s, ss)) >= 0 )
             opt_srb_lock = val;
         else if ( (val = parse_boolean("unpriv-mmio", s, ss)) >= 0 )
-- 
2.43.0


