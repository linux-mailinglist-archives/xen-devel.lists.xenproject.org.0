Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E2AAC0F32
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 17:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994167.1377212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7PE-0003w2-LX; Thu, 22 May 2025 15:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994167.1377212; Thu, 22 May 2025 15:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7PE-0003rz-Hf; Thu, 22 May 2025 15:00:24 +0000
Received: by outflank-mailman (input) for mailman id 994167;
 Thu, 22 May 2025 15:00:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckVG=YG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uI7PC-0003kR-H3
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 15:00:22 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ba248ee-371d-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 17:00:21 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5f3f04b5dbcso12271962a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 08:00:21 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ac32a7fsm10550119a12.56.2025.05.22.08.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 08:00:20 -0700 (PDT)
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
X-Inumbo-ID: 7ba248ee-371d-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747926021; x=1748530821; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljRP4y1r3tEpwonUwcR95PojX/tUgMS8XUn01iePeGU=;
        b=qFzqVxcz/TBe1GR0f3imECCEGXt8ucop/9QAXy1s60al7tItVAoL8eXEBwrhXr4SGZ
         i1QzKF661PYgswjsyEzI2vv2RBPO57qGlXtnSs+RhuQy1tDqyavAPv0uWbg3BrGhzBmN
         f5jvKbr1DWcFFzjEH/umAiBtPqjnhjm+uWdak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926021; x=1748530821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljRP4y1r3tEpwonUwcR95PojX/tUgMS8XUn01iePeGU=;
        b=GKaGDYVktCkEf8jdvHXTg7629u2pNDIUaaRBxBFJoMllo2zVyJz8qwmRUkR+BWBk57
         1fLGDdS7VYruKDTDJNTdbOoRLsFw9CgG8QEqWVV4jqNPkd8mrGv/9kUjs7E7VWSVvWeO
         oPkISRULr6iFJkFKb0+gdGq2grOqxPRRf4xHcla+gNIANexmNGBM2d/ygYayKzPcA3Rf
         eHCITLMTuDbb+PBfGbvM3dG3q6+g85hG81dRPluaWKn5XLYIicUkmIykRGSyiLrf/sCF
         5V6c9tEJhyJgZHxXRuOH+Ioi7wfdvrQI8jTAkjbfbFW7n8MHZrjKiQik+qqQ0LPcrvFb
         QvgQ==
X-Gm-Message-State: AOJu0YwTpESXE5v72dT7f0Pa/ogufRk3H9/0B9I4sTWUfXWjsiDn/rg7
	vL/FWZRgArjkp1dXQRLCQbJAx86vzlX+mZBKo5IuzIWMY/dshTQTsa4HUVkUdQmBZFSASDs11hT
	8jCHa
X-Gm-Gg: ASbGncs6T/wECEm+yFtc/w7lb0kMZ2lYugVcx+4PeitvIkWv4UZHLLYzMgo5cFoVb+N
	jJzLfrHvTn0Syx18RWs7miX8O2WuhEj+umFmmUpb00A3Yfp8+pCHFlQlFLvtey50xsZtHe3t37A
	zPBiyWkKDZGm9tvz+QmlWFS/DkuVsQQVbye9OlmulcPWteXkSO1IF+QE2wbphqn2IE6FNRQyLAX
	HCD0dSbKXMFUwouiwSNoh+eibIBOxWVaUpvbdFLaptfEdDQqwKDEvI453Jeejdydo0NEb4VtGy+
	/xu5F83T62qVXYNu8gVjnFXOJkuH9HjY7AoW9b+XSu56gU8WO7XWkwuqPG+kZn9vNubbxUJYCwp
	Z4USqRsS35D6vwko/npp3ovU7
X-Google-Smtp-Source: AGHT+IEmxj6rPzsElnxUfYxYT7ERgKr+r2Hy5iHlkty1zrydVqmvddsQiDbNWydC/aVOLZzOLCtaxQ==
X-Received: by 2002:a05:6402:358f:b0:602:2d06:6b19 with SMTP id 4fb4d7f45d1cf-6022d066f47mr6642878a12.1.1747926020894;
        Thu, 22 May 2025 08:00:20 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86/alternatives: Factor out access to ideal_nops[]
Date: Thu, 22 May 2025 16:00:13 +0100
Message-Id: <20250522150015.555492-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522150015.555492-1-andrew.cooper3@citrix.com>
References: <20250522150015.555492-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... in order to rework the calculation.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index ecc56964bd9c..cc2d0c89aca3 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -86,6 +86,11 @@ static bool init_or_livepatch_read_mostly toolchain_nops_are_ideal;
 # define toolchain_nops_are_ideal false
 #endif
 
+static const unsigned char *get_ideal_nops(unsigned int noplen)
+{
+    return ideal_nops[noplen];
+}
+
 static void __init arch_init_ideal_nops(void)
 {
     switch ( boot_cpu_data.x86_vendor )
@@ -116,7 +121,7 @@ static void __init arch_init_ideal_nops(void)
     }
 
 #ifdef HAVE_AS_NOPS_DIRECTIVE
-    if ( memcmp(ideal_nops[ASM_NOP_MAX], toolchain_nops, ASM_NOP_MAX) == 0 )
+    if ( memcmp(get_ideal_nops(ASM_NOP_MAX), toolchain_nops, ASM_NOP_MAX) == 0 )
         toolchain_nops_are_ideal = true;
 #endif
 }
@@ -127,9 +132,11 @@ void init_or_livepatch add_nops(void *insns, unsigned int len)
     while ( len > 0 )
     {
         unsigned int noplen = len;
+
         if ( noplen > ASM_NOP_MAX )
             noplen = ASM_NOP_MAX;
-        memcpy(insns, ideal_nops[noplen], noplen);
+
+        memcpy(insns, get_ideal_nops(noplen), noplen);
         insns += noplen;
         len -= noplen;
     }
-- 
2.39.5


