Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D17A967A0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 13:35:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962518.1353721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Buj-0005jw-LG; Tue, 22 Apr 2025 11:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962518.1353721; Tue, 22 Apr 2025 11:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Buj-0005hd-IT; Tue, 22 Apr 2025 11:35:45 +0000
Received: by outflank-mailman (input) for mailman id 962518;
 Tue, 22 Apr 2025 11:35:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r0M=XI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7Bui-0005aF-E9
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 11:35:44 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5df8193-1f6d-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 13:35:31 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39ee682e0ddso2886628f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 04:35:42 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4930f1sm15114100f8f.61.2025.04.22.04.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 04:35:41 -0700 (PDT)
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
X-Inumbo-ID: e5df8193-1f6d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745321742; x=1745926542; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EtM6oH1/QwQPXrgXxwGaMB3JlKPEHpk52MOvd8U/gPA=;
        b=iIMsF7z284pDc8wZOuGphnjk4DqRDcJA0sDFFH2oCONDcwiJ6BhYWh6jFT8f1Jfszo
         vTfX3o6eZnPAHXhF9+ozp5oHNTtF5pZUUhblRUdioZvhI8XiL/BO7YVNNMZX3gEByzbn
         aBCKUmuqKddGMu+rKM0BGpgCz8SQ5TLzpU6gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321742; x=1745926542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtM6oH1/QwQPXrgXxwGaMB3JlKPEHpk52MOvd8U/gPA=;
        b=cJNx+i4Kuis7d5rYNgsijOqVRDo48m7N7Gk59DeC6qSx6ohbCtXRM4LG1Xzhr63tzo
         OEOOrQJDRM8MHB9d72i63qScSHRuRkmjdZWrjQ/TAnL0mLV7uKG38TqWD5Pb1dCzKH9c
         shvppRcbrgWzhCxaxobCgT6Ap0caqoevEx4sioe1aSdsQnjXGhH54xZTDWmeNIIgiMEw
         q6iLgKslvWixl3Fvxcq1OsXeaUNu/zg8cvDueA7iVJfbVB4/KnRYyz7Sp0+r7KQpJa9X
         7ONE1Jzl3zconJeQIEylUNWg3omohQ0X3mgumM+Uzyc1ILlQiXh3ixcHUUnBUjNbsMhV
         09Yg==
X-Gm-Message-State: AOJu0Yy5wrhDuCkI1n7h0oCnvZH8sMQhWn1+L1jLqp7NLi5y8survEJT
	qogzIWbSTYq884/A0s8MTmVh+Bp2XisPslrMgV6bSw80iTdRGNs4vBoXI1SvTHhypA5zh4a4hJZ
	qpaqHCw==
X-Gm-Gg: ASbGncvxUd0liLTNSDsHG5YhJZASQvFaagAV4EJero881ze3hKLJ6ih6xZebsreV3uu
	7J7J0paG7q2a5a/PhwAXq+UuawOtSyKuy6RArGdexsmOewiF5FdBOHLQ20cMUCLv4wi5Pon2rSd
	/FUcHbBdA2ms4UmgPDO++tBrCQamxTMJWiEo+dREWW7+jdV7hbuZhIEa2+HYnXxC+jwxYmquUuK
	Focyw3dg2M8ldKvdyjoIsjeJ5Tv92PtzvGsA5cGQh6Y+xSgv9kflcaQzc3MZiZgPjgS/JmrI7dG
	3ejop4klupiECcYoabHLuSgfOHu2L6lSnwsJ46pMInfpBSSnMYyJN1AVcflwZt3SE+WANmHw
X-Google-Smtp-Source: AGHT+IHIqgerNAVVkSIWBev0RIWZ0Rkw1SpnZGyp+ydMHrwrGKoOX9y2Om1S4Tstqr9nBzS0+l7fiA==
X-Received: by 2002:a05:6000:2913:b0:390:e853:85bd with SMTP id ffacd0b85a97d-39efbaf2b8fmr11384729f8f.48.1745321742175;
        Tue, 22 Apr 2025 04:35:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen: Drop CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
Date: Tue, 22 Apr 2025 12:35:37 +0100
Message-Id: <20250422113537.1286981-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All supported toolchains now have it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/Kconfig                | 4 ----
 xen/include/xen/compiler.h | 2 --
 2 files changed, 6 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 72fdb8376087..ae1c401a981e 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -29,10 +29,6 @@ config LD_IS_GNU
 config LD_IS_LLVM
 	def_bool $(success,$(LD) --version | head -n 1 | grep -q "^LLD")
 
-# -fvisibility=hidden reduces -fpic cost, if it's available
-config CC_HAS_VISIBILITY_ATTRIBUTE
-	def_bool $(cc-option,-fvisibility=hidden)
-
 # Use -f{function,data}-sections compiler parameters
 config CC_SPLIT_SECTIONS
 	bool
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 38b8fa3d386d..c68fab189154 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -17,10 +17,8 @@
 
 #endif /* Compiler checks. */
 
-#ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
 /* Results in more efficient PIC code (no indirections through GOT or PLT). */
 #pragma GCC visibility push(hidden)
-#endif
 
 #define barrier()     __asm__ __volatile__("": : :"memory")
 
-- 
2.39.5


