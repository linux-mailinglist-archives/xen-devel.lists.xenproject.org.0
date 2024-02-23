Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E86AE860E61
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 10:43:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684717.1064765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdS53-0000NI-7q; Fri, 23 Feb 2024 09:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684717.1064765; Fri, 23 Feb 2024 09:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdS53-0000Kx-4a; Fri, 23 Feb 2024 09:42:57 +0000
Received: by outflank-mailman (input) for mailman id 684717;
 Fri, 23 Feb 2024 09:42:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lysb=KA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rdS51-0000Kr-V2
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 09:42:55 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaba9a08-d22f-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 10:42:54 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3394b892691so364032f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 01:42:54 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 pv18-20020ad45492000000b0068f2ea5c678sm4670047qvb.118.2024.02.23.01.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 01:42:52 -0800 (PST)
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
X-Inumbo-ID: eaba9a08-d22f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708681373; x=1709286173; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BXPA50Xn8D6xZzjKg4dTG6GJFYvuP5BIsnkJUOBPMQE=;
        b=SVbxGN4+u2D+A3dXaM//KrjrtHc9X6VBypTB5w6w1d2SNvFiz1iOwZnHM6IVUaxkNs
         ihlzONy02Wd1aG0LOGyICowETVxYTB7fVwHWGclOkRkI2rNheZoJSVHSEcCZsz6fkoQ1
         Tks+GjKRFqC36E64NyngkgUFWkUkZt3JrvQWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708681373; x=1709286173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXPA50Xn8D6xZzjKg4dTG6GJFYvuP5BIsnkJUOBPMQE=;
        b=FSTKVslM3AVzMmKDvKuYbNBQav3XB/20EdNBLlnkeF/5ebE7zzKOCstKky7VHlnIIC
         6RHE4B0YG8esqzOiB7kkbaGOZ+UPtCLzV76xCY+Stn0HTRoYT2ffYaTO80XBYp5rLYQr
         wOrcaueUzwar/hfM14aou2wTeZr9wRDuCB232fPrpnOHnEogvPo153XXUEwCc4Wtms2F
         mJ1mCrB59Stxk/V9C24keybGozYaSkHRJz+lZ+CsX79tOny83TeowB99lxGMADQzNG3/
         RWwNtnQxvLdvf1i1YBL7bw67YgKwcRvHOBsrrC/84KvM6/Clft0j+97p4bUoJM96Euiz
         b6cA==
X-Gm-Message-State: AOJu0Yz3uDtc04XO8czVvqt6XUIeOTO3HXVQA/YcDJ0epZ9Ehhjj/Moz
	pPwyWYH4YPWt/5xBpjwj+BLNcl1l22PBpPD7K29uOA8CDFP6IOdkO1MotPGtZq9lZdKk8kZtwnn
	2
X-Google-Smtp-Source: AGHT+IG4tu8jAfWiGsF9LamOkjO6IxRmmwB883d58ervno1AesmGmmyXLGVU5LTzlzMWDzh+ntWzxw==
X-Received: by 2002:adf:cf04:0:b0:33d:90c2:c7f4 with SMTP id o4-20020adfcf04000000b0033d90c2c7f4mr3584212wrj.14.1708681373223;
        Fri, 23 Feb 2024 01:42:53 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/spec: fix BRANCH_HARDEN option to only be set when build-enabled
Date: Fri, 23 Feb 2024 10:42:15 +0100
Message-ID: <20240223094215.71889-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic to handle the BRANCH_HARDEN option will report it as enabled
even when build-time disabled. Fix this by only allowing the option to be set
when support for it is built into Xen.

Fixes: 2d6f36daa086 ('x86/nospec: Introduce CONFIG_SPECULATIVE_HARDEN_BRANCH')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/spec_ctrl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 421fe3f640df..e634c6b559b4 100644
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
@@ -267,7 +268,8 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_eager_fpu = val;
         else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
             opt_l1d_flush = val;
-        else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
+        else if ( IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH) &&
+                  (val = parse_boolean("branch-harden", s, ss)) >= 0 )
             opt_branch_harden = val;
         else if ( (val = parse_boolean("srb-lock", s, ss)) >= 0 )
             opt_srb_lock = val;
-- 
2.43.0


