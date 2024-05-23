Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDAB8CD11A
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 13:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728367.1133290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6RI-0006uu-AY; Thu, 23 May 2024 11:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728367.1133290; Thu, 23 May 2024 11:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6RI-0006rE-7B; Thu, 23 May 2024 11:16:52 +0000
Received: by outflank-mailman (input) for mailman id 728367;
 Thu, 23 May 2024 11:16:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSi9=M2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sA6RG-0006Hv-CY
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 11:16:50 +0000
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [2607:f8b0:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f22261f1-18f5-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 13:16:48 +0200 (CEST)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3cabac56b38so1546647b6e.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 04:16:48 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f179cebsm142194236d6.3.2024.05.23.04.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 04:16:42 -0700 (PDT)
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
X-Inumbo-ID: f22261f1-18f5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716463006; x=1717067806; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3brSZl6/vV2dpGWkfgvqrJmcT56Fa2D0F6BOtDAqDOI=;
        b=LcahzV4fVqrQv+UWToDs4J/GQMy9S0YbbRRlhQpGlgUV/HhnnTGOMlN1Whrjju8QTW
         IgkiTIFaQpJBaA+1eFackREzUbuC162gDsO2ImJL0GEBGOlDVB/4/ok6oE5mrgJ5FOwh
         aSwq0Ed6u7iS/EFZ6r5dWe2BxDdhoBn6VNLzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716463006; x=1717067806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3brSZl6/vV2dpGWkfgvqrJmcT56Fa2D0F6BOtDAqDOI=;
        b=qYl9f9ft+clGR9+yRS9Sme1azyS731LsXSsTKkP9iTU9bXyq6YO+X5vqveVUH1Za/6
         CqoyrScm6NLdo7sdTvAvkE2d6u36E42EhoX0qq92SC/NC5enAvqcKp6uujnZqFhei/lq
         gq6LWyauE2ZH3kkYyY6iDEOZPyBmwzrQmItu2OYkp4K5RCekfog/oF1bPwBA/b+nQZNa
         iIRefhgLS2ZxoMvacQuSBNymg95WD2mxJJ+ONIFuwo5bWgXy7mPruEXQVKgh9+waC9kV
         LGqQ2kV7xkWgOjc5xzMQxQTiymiMK1jR4HSxmExcnAHDeRFU5ocZc4F68twgVC3F+wVS
         NC2A==
X-Gm-Message-State: AOJu0YxBnyQAmXYJ9z+dk3ozENG/tbBsHZYtNM9rNm8X8CHjz0xQvWuQ
	/5BdvNdiUC205LFaCWxKxUuWhc0BuEU4Cbqobq9PmUXqMbWyDqj36mQtYV+/8s98ASX0uwbI3Vs
	+QSo=
X-Google-Smtp-Source: AGHT+IFpvJcWqnaHvo7hcFKKjX515sNn6S5bC6QmZNxfnQRU35FyPFQYvA+CWP5bK1L4FB1RMRQaEg==
X-Received: by 2002:a54:4715:0:b0:3c9:6e96:88fb with SMTP id 5614622812f47-3cdb0c91a7bmr4613116b6e.4.1716463004868;
        Thu, 23 May 2024 04:16:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/7] x86/boot: Collect the Raw CPU Policy earlier on boot
Date: Thu, 23 May 2024 12:16:23 +0100
Message-Id: <20240523111627.28896-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523111627.28896-1-andrew.cooper3@citrix.com>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a tangle, but it's a small step in the right direction.

xstate_init() is shortly going to want data from the Raw policy.
calculate_raw_cpu_policy() is sufficiently separate from the other policies to
be safe to do.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

This is necessary for the forthcoming xstate_{un,}compressed_size() to perform
boot-time sanity checks on state components which aren't fully enabled yet.  I
decided that doing this was better than extending the xstate_{offsets,sizes}[]
logic that we're intending to retire in due course.

v3:
 * New.
---
 xen/arch/x86/cpu-policy.c | 1 -
 xen/arch/x86/setup.c      | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index b96f4ee55cc4..5b66f002df05 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -845,7 +845,6 @@ static void __init calculate_hvm_def_policy(void)
 
 void __init init_guest_cpu_policies(void)
 {
-    calculate_raw_cpu_policy();
     calculate_host_policy();
 
     if ( IS_ENABLED(CONFIG_PV) )
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b50c9c84af6d..8850e5637a98 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1888,7 +1888,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
-    identify_cpu(&boot_cpu_data);
+    calculate_raw_cpu_policy(); /* Needs microcode.  No other dependenices. */
+
+    identify_cpu(&boot_cpu_data); /* Needs microcode and raw policy. */
 
     set_in_cr4(X86_CR4_OSFXSR | X86_CR4_OSXMMEXCPT);
 
-- 
2.30.2


