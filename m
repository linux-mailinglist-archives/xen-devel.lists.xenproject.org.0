Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558BEAC4493
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 22:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997799.1378617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJeom-0001js-Od; Mon, 26 May 2025 20:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997799.1378617; Mon, 26 May 2025 20:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJeom-0001h4-LS; Mon, 26 May 2025 20:53:08 +0000
Received: by outflank-mailman (input) for mailman id 997799;
 Mon, 26 May 2025 20:53:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkau=YK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJeom-0001gy-2C
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 20:53:08 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6be53ef9-3a73-11f0-b893-0df219b8e170;
 Mon, 26 May 2025 22:53:05 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-442ea341570so18939665e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 13:53:05 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f18251basm243682185e9.4.2025.05.26.13.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 13:53:04 -0700 (PDT)
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
X-Inumbo-ID: 6be53ef9-3a73-11f0-b893-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748292785; x=1748897585; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qb25bEXVG3p9CU9Sg8KmV/sBuke8+/L1M/Zbvd+67i8=;
        b=aeIEDEZM9nnq7weJdN+06u4w3NXYTGKHJQuQJiMWS3Kn+OPyT1UFoWFjEycmUgO2BV
         Kb6De4PD7nZi4ZUQpS0wCXrqc1LlDGNgLvncFzXGhBAcjA/zjwfwI2SfNFfHBFYnnuPB
         3Y4pGTZiPT4fmVK+gHLZaKehVHR/txpQfqjHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748292785; x=1748897585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qb25bEXVG3p9CU9Sg8KmV/sBuke8+/L1M/Zbvd+67i8=;
        b=ZiX85G8Qw6nrwMjZ2MAXKY3yOHa3sgl8TiGlBO4AOSE5vwVmmBY8cVMNFOC3RWP0dG
         Q4IJE2Wbs7dxUi9SdN04g6UYedhQte2WVKR0CYa6ggCqWmizSKuqtvAD1B0OaNFgyP6d
         VsRbOsUPXSa+yhxPGwtNf3HDxIJppnqykvo7V/LCXs6h0BU3DA0pVNT141ZEIGW1yWIb
         w+cXRkjv/HjBNP+fqB8iHOr7xiFmgDzowQQq3oSnucj35w1EGaTnjRAM50RTnnsKDsVZ
         6OA9CdA5mAt6G1R3al68NgKMC1Ilki6WyTfKbXKJG4pCOn11nkNmc6f4X/FUzD3SZtf8
         NGRQ==
X-Gm-Message-State: AOJu0YySUTj2WX04EQ5wmKsdEXZ04sUWeMqO+FARsyPgM/gUlSvUGwKi
	oNcwmZCWHN8XHbNW5f61FaB0h8d/BV0mzuNgtfgGGYFRqr/a64QxjtAMGY8qkSXpaS8p7b5yQ1G
	WP4RZ
X-Gm-Gg: ASbGncu63YGWcf6eL5eqeU0Oltmsdybogo4PbDESEaV7fOt4sgY+GVolYGHrvZDx1aI
	+tOqA3ON5CwlGttifh3aPndXnm6f4z2+odIiq+TTrmwUoHXLALibX00c267p60UE2yfWpG3lXQU
	Df8D2Hf104uunEfQqemmAauKTessDtq+xYvrkg03vYtLXBs9fcGca03GTgRBSTGbA0torMZM2Hp
	Vy3J8nnm4mFNQBHYOykaxf3joRu6m2qyVnjY7p+fIWHNDyiZ5Dry6zfA7c5dHGJftcqMxiLOggA
	q6QheaSYAsr45/hQ9A5gNjQxjzomPjJDd+w9feErmEj/kIzbZetmz30wjVMpJlL2Vg0dMqeGsMc
	gk5KjkKmklx4SRIGDenHRua1y
X-Google-Smtp-Source: AGHT+IFhtiPVFvy2L+RuChqZ8Sza3/nbyDe0zbfKlBB5ArCPhO1/1PN5F+kb5kRipzYLeRLpiawOqA==
X-Received: by 2002:a05:600c:1e1c:b0:441:d438:4ea5 with SMTP id 5b1f17b1804b1-44c9493e6b1mr78478795e9.20.1748292784695;
        Mon, 26 May 2025 13:53:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Manuel Bouyer <bouyer@antioche.eu.org>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/pv: Fix breakpoint reporting
Date: Mon, 26 May 2025 21:53:02 +0100
Message-Id: <20250526205302.997387-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <aDSr8u-7w_Rbf4el@mail.soc.lip6.fr>
References: <aDSr8u-7w_Rbf4el@mail.soc.lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

x86_merge_dr6() is not a no-op when 0 is passed in; it will discard the
previously latched breakpoint bits.

The combination of do_debug()'s manual call to x86_merge_dr6() for external
debuggers, and pv_inject_DB() calling pv_inject_event(), results in two
x86_merge_dr6() calls.

Feed the same pending_dbg in the second time.  This makes pv_inject_event()'s
update of dr6 effectively a no-op, retaining the correct breakpoint bits.

Fixes: db39fa4b27ea ("x86/pv: Fix merging of new status bits into %dr6")
Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Manuel Bouyer <bouyer@antioche.eu.org>

Now to figure out why my testing didn't spot this...
---
 xen/arch/x86/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 22f20629327d..e7b4693415cd 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1823,7 +1823,7 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
         return;
     }
 
-    pv_inject_DB(0 /* N/A, already merged */);
+    pv_inject_DB(dr6 ^ X86_DR6_DEFAULT);
 }
 
 void asmlinkage do_entry_CP(struct cpu_user_regs *regs)

base-commit: 6cfe3ae346fc84fbd4380fc45c70780935da590a
-- 
2.39.5


