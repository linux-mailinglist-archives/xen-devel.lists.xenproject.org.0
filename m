Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB89861104
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 13:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684818.1064975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUK5-0007V0-4e; Fri, 23 Feb 2024 12:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684818.1064975; Fri, 23 Feb 2024 12:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUK5-0007Rs-1H; Fri, 23 Feb 2024 12:06:37 +0000
Received: by outflank-mailman (input) for mailman id 684818;
 Fri, 23 Feb 2024 12:06:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lysb=KA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rdUK3-0006di-36
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 12:06:35 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc67deed-d243-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 13:06:33 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d2505352e6so7990361fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 04:06:33 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 d4-20020a056214184400b0068f97928376sm4150972qvy.17.2024.02.23.04.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 04:06:31 -0800 (PST)
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
X-Inumbo-ID: fc67deed-d243-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708689992; x=1709294792; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ja3agDhYaU4Xo2ppsREM/G2NT1u2hAe6akh+/GuxDM=;
        b=Dx95aEgYlAbBARDUcKB6d7uEqiRX2L8I2wOMelk01Ajl/Y/LJKoy6vcPZ6nqI++VDm
         B0YmeGJPTiBfvTa/ig71JzN0vixWxgbt5ylY5bK/veZ85S8h+AfgK8RFuPwj6h2Hars/
         2v684NRfXATlbIsNk36tz0bWFitnKnc11fT1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689992; x=1709294792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ja3agDhYaU4Xo2ppsREM/G2NT1u2hAe6akh+/GuxDM=;
        b=tmD8EYunH32SQuQOnr+DYy5Bv9NDB/2VDmmCCR3W6myXCBbrOL42VzV8sF/vBITBNm
         CDPyl8UQq/VwUMrhht7xRDHqWgam5BDpOelYFv5wVUmpCRYQlRWEtY+gf9cVrnJu9lWL
         YkzVZBDKVs9Mn2+/pKiXL9ao9U0IBI41wpV5fTx94UAbcHkXOCRR2ymiu9gWL5CTCpPl
         0JuTuIdWnTcWubDOdJWzB/Bbm6OGrB+mnOfyVC6D/+QJzvK4DsF6YcZS4K+KWUUupG1R
         6SJGUwKTcwtdHgfrdXKKiErz3A68mHFxh35SFZpiwA7XPEQZQPiQ8yz/WxibptTgbADu
         UbdQ==
X-Gm-Message-State: AOJu0YyxM6poQZ0slfM5QpXnZH/nX8S5pKeWyBJA1o97aP504BqMOdTv
	BSHwpcjsW7U4z3LuByAvPoXFcR0BZda064q2y3Q+YHqmd/vOONk+eB8s+MCF+/5Ffp4gGPiFbjX
	Q
X-Google-Smtp-Source: AGHT+IF0k4Kr9lbT9FetBX+abq3S57WnQWAFi/UWuRO0TO+qnTkBGj9QAvYwkgJaW9/nk/eZloIAOQ==
X-Received: by 2002:ac2:4ece:0:b0:512:e051:ac2c with SMTP id p14-20020ac24ece000000b00512e051ac2cmr1167099lfr.3.1708689992373;
        Fri, 23 Feb 2024 04:06:32 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] x86/spec: fix BRANCH_HARDEN option to only be set when build-enabled
Date: Fri, 23 Feb 2024 13:06:15 +0100
Message-ID: <20240223120616.73503-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223120616.73503-1-roger.pau@citrix.com>
References: <20240223120616.73503-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic to handle the BRANCH_HARDEN option will report it as enabled
even when build-time disabled. Fix this by only allowing the option to be set
when support for it is built into Xen.

Fixes: 2d6f36daa086 ('x86/nospec: Introduce CONFIG_SPECULATIVE_HARDEN_BRANCH')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use no_config_param().
---
 xen/arch/x86/spec_ctrl.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 421fe3f640df..4ce8a7a0b8ef 100644
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
@@ -268,7 +269,14 @@ static int __init cf_check parse_spec_ctrl(const char *s)
         else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
             opt_l1d_flush = val;
         else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
+        {
+#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
             opt_branch_harden = val;
+#else
+            no_config_param("SPECULATIVE_HARDEN_BRANCH", "spec-ctrl", s, ss);
+            rc = -EINVAL;
+#endif
+        }
         else if ( (val = parse_boolean("srb-lock", s, ss)) >= 0 )
             opt_srb_lock = val;
         else if ( (val = parse_boolean("unpriv-mmio", s, ss)) >= 0 )
-- 
2.43.0


