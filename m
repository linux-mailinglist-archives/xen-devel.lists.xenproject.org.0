Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9467DAAFFDE
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 18:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979516.1366104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD3is-0006fA-PC; Thu, 08 May 2025 16:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979516.1366104; Thu, 08 May 2025 16:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD3is-0006ca-Ln; Thu, 08 May 2025 16:03:46 +0000
Received: by outflank-mailman (input) for mailman id 979516;
 Thu, 08 May 2025 16:03:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5q/z=XY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uD3ir-0006cT-Oi
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 16:03:45 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0206b3fa-2c26-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 18:03:40 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so5732745e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 09:03:40 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd350cebsm41331215e9.17.2025.05.08.09.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 09:03:38 -0700 (PDT)
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
X-Inumbo-ID: 0206b3fa-2c26-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746720220; x=1747325020; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mD1Fttxwc1KIw4cAsVczbb+IYoS9N4VRg6BR85MLJbA=;
        b=DUV2S7ChSofO7NKX9tooClTXrZ9u2GYltOCLGMSQhLCKvgK0RlWOH/UtTv2I91XgIW
         iasOoVXow+6vpHDfPTYNF/yVc+OQvkFjSBRsrfiil8msLTS6wFcQ2M2o72o3skRGmbN4
         4GfwTK+AMsaZ1QMeSfuC6ImmFNj8vFIBZZbng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746720220; x=1747325020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mD1Fttxwc1KIw4cAsVczbb+IYoS9N4VRg6BR85MLJbA=;
        b=LC0zsK5gsIeeHSCs4fmMNCE6lLOcOGBof+qo976yabnuVa+sIu59XuHEg3/Xncq4rQ
         lmj3hSPZd7LlcNHrQBCkqqnkR6R7Dn9O286aDSLK2Rhu0JofW5sAYG0fw9dQo7RHnD6b
         7MKZdYlSs6kmqSwD8uqUo6FATrKfj/Ou7XxKAFH0wTyHVilbcTfjft/hs0g2zqvtA0z7
         pL0axJjn9hppe+OKxjIlO9jzlTW8g7LCg/9/BLEnUrGMuzb8+k3pAHEOb9JBSGiFHnKs
         p+9OQpzwd8EVMeXlKY0QS5zpCastOpt3WF+uiz7Csy/ELnc1/+rhJJ21Mt7JYylE+tDA
         3hxg==
X-Gm-Message-State: AOJu0YyX9rEZU9XpCNYpW7VgBcyo53SLlIqnBZIMOy6Rn7b5x64KcDhA
	CyhAKN+rAGpxsK+tl2ItgT7BIWjCKJVxBX7oOdToQBZj9THLUEj1SgdfqK2sEM/YXXIOgx5GhJU
	x
X-Gm-Gg: ASbGnctdtn2zTIS8YgbC58wO7Yj21nEArVaql78muYBKQ7uiDZTJ9glWhIZpkpYGR1/
	dIWWa1kqv2Kz0qn7MPH6GSQCl/7qma/pft0OuyG176dYaGa7u/R5dArDc4ZdEUKMAFmzHqgUReI
	Zgr3+q5TwJi0kbu1a+HyJByWuhnGRa/oP/NdL9HbrASWcrozK1oxiCwT4Y+6R1im+us9HtK8nPt
	dr4jK+BhJ2XdAZT17yGsigJlH4mpVhZ8lpfKLshIDOEqg4t2ZIyR63wLRo9/41TurQnPCM6sw+s
	BCI2tzA9VogdOQLwaBW2KaMO8BfoyI3rzuJHXAL4pd5/+sPs3vPVpGnUGhmm9Q0lHow4iHMKml+
	b89vuesQTGXF1yw==
X-Google-Smtp-Source: AGHT+IEKgWW3n5ZojGeTjoQzvcvOOc/DDSnpHeGPPoSC171eFZW2twbVhVK6A2XKithxs61cA0mF5w==
X-Received: by 2002:a05:600c:820a:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-441d44bb7f4mr74411555e9.7.1746720219417;
        Thu, 08 May 2025 09:03:39 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/Kconfig: Improve help test for speculative options
Date: Thu,  8 May 2025 17:03:36 +0100
Message-Id: <20250508160336.2232152-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The text for CONFIG_INDIRECT_THUNK isn't really correct, and was already stale
by the time speculative vulnerabilities hit the headlines in 2018.  It is
specifically an out-of-line-ing mechansim, and repoline is one of several
safety sequences used.

Some of this boilerplate has been copied into all other options, and isn't
interesting for the target audience given that they're all in a "Speculative
Hardning" menu.

Reword it to be more concise.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

CONFIG_SPECULATIVE_HARDEN_BRANCH really ought to be named
CONFIG_SPECULATIVE_HARDEN_CONDITIONAL, but this would be a (minor) functional
change.
---
 xen/common/Kconfig | 51 +++++++++-------------------------------------
 1 file changed, 10 insertions(+), 41 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 4bec78c6f267..03ef6d87abc0 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -162,29 +162,21 @@ config STATIC_MEMORY
 menu "Speculative hardening"
 
 config INDIRECT_THUNK
-	bool "Speculative Branch Target Injection Protection"
+	bool "Out-of-line Indirect Call/Jumps"
 	depends on CC_HAS_INDIRECT_THUNK
 	default y
 	help
-	  Contemporary processors may use speculative execution as a
-	  performance optimisation, but this can potentially be abused by an
-	  attacker to leak data via speculative sidechannels.
+	  Compile Xen with out-of-line indirect call and jumps.
 
-	  One source of data leakage is via branch target injection.
-
-	  When enabled, indirect branches are implemented using a new construct
-	  called "retpoline" that prevents speculation.
+	  This allows Xen to mitigate a variety of speculative vulnerabilities
+	  by choosing a hardware-dependent instruction sequence to implement
+	  (e.g. function pointers) safely.  "Retpoline" is one such sequence.
 
 config SPECULATIVE_HARDEN_ARRAY
 	bool "Speculative Array Hardening"
 	default y
 	help
-	  Contemporary processors may use speculative execution as a
-	  performance optimisation, but this can potentially be abused by an
-	  attacker to leak data via speculative sidechannels.
-
-	  One source of data leakage is via speculative out-of-bounds array
-	  accesses.
+	  Compile Xen with extra hardening for some array accesses.
 
 	  When enabled, specific array accesses which have been deemed liable
 	  to be speculatively abused will be hardened to avoid out-of-bounds
@@ -193,19 +185,12 @@ config SPECULATIVE_HARDEN_ARRAY
 	  This is a best-effort mitigation.  There are no guarantees that all
 	  areas of code open to abuse have been hardened.
 
-	  If unsure, say Y.
-
 config SPECULATIVE_HARDEN_BRANCH
 	bool "Speculative Branch Hardening"
 	default y
 	depends on X86
-        help
-	  Contemporary processors may use speculative execution as a
-	  performance optimisation, but this can potentially be abused by an
-	  attacker to leak data via speculative sidechannels.
-
-	  One source of misbehaviour is by executing the wrong basic block
-	  following a conditional jump.
+	help
+	  Compile Xen with extra hardening for some conditional branches.
 
 	  When enabled, specific conditions which have been deemed liable to
 	  be speculatively abused will be hardened to avoid entering the wrong
@@ -216,43 +201,27 @@ config SPECULATIVE_HARDEN_BRANCH
 	  optimisations in the compiler haven't subverted the attempts to
 	  harden.
 
-	  If unsure, say Y.
-
 config SPECULATIVE_HARDEN_GUEST_ACCESS
 	bool "Speculative PV Guest Memory Access Hardening"
 	default y
 	depends on PV
 	help
-	  Contemporary processors may use speculative execution as a
-	  performance optimisation, but this can potentially be abused by an
-	  attacker to leak data via speculative sidechannels.
-
-	  One source of data leakage is via speculative accesses to hypervisor
-	  memory through guest controlled values used to access guest memory.
+	  Compile Xen with extra hardening for PV guest memory access.
 
 	  When enabled, code paths accessing PV guest memory will have guest
 	  controlled addresses massaged such that memory accesses through them
 	  won't touch hypervisor address space.
 
-	  If unsure, say Y.
-
 config SPECULATIVE_HARDEN_LOCK
 	bool "Speculative lock context hardening"
 	default y
 	depends on X86
 	help
-	  Contemporary processors may use speculative execution as a
-	  performance optimisation, but this can potentially be abused by an
-	  attacker to leak data via speculative sidechannels.
-
-	  One source of data leakage is via speculative accesses to lock
-	  critical regions.
+	  Compile Xen with extra hardening for locked regions.
 
 	  This option is disabled by default at run time, and needs to be
 	  enabled on the command line.
 
-	  If unsure, say Y.
-
 endmenu
 
 menu "Other hardening"

base-commit: aea52ce607fe716acc56ad89f07e1513c89018eb
-- 
2.39.5


