Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD632525A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 16:26:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89810.169519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIWU-0006JB-Bd; Thu, 25 Feb 2021 15:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89810.169519; Thu, 25 Feb 2021 15:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIWU-0006Io-8M; Thu, 25 Feb 2021 15:25:50 +0000
Received: by outflank-mailman (input) for mailman id 89810;
 Thu, 25 Feb 2021 15:25:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJgK=H3=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lFIWT-0006Ig-2r
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 15:25:49 +0000
Received: from mail-ot1-x32f.google.com (unknown [2607:f8b0:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id caa3e51a-578f-4676-bf40-d41890cff51d;
 Thu, 25 Feb 2021 15:25:48 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id x9so1645930otp.8
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 07:25:48 -0800 (PST)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id l4sm1047292ooq.33.2021.02.25.07.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 07:25:47 -0800 (PST)
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
X-Inumbo-ID: caa3e51a-578f-4676-bf40-d41890cff51d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cPpdtH7EP/GfkHJoh7H3eTxLsigt9nHP/GO1BtnF+lU=;
        b=Bf14hds7oDs36GvTBWn1wKIYqICk/QqpQeafNMq02oyCb+vENIT+aDszRqm2+bJM01
         AaqCki956flemlJ9yYXFhdufzPXO/1v4Y0uoXdxS6JMC12miRUlohVcEho6BAGl4CLaq
         S3QzCRHgC51c80Cwd89HDijn697vyZQQaj9wokSqULOKtlTlKlt/4OIZ8D3vJc6fzYBL
         309hLkvXyBe7jAEWJ20rT1r8R6/3HxdaP6ZJD+XkWH1eDyR7fTDuMXsJaFKItrowe1lX
         ETNa9e0qsokgB6XHoZvn9qSP6sDDCEqenLg5mHtZUQaBPqlERnGJkKXL0U9bWYV9RZjC
         b0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cPpdtH7EP/GfkHJoh7H3eTxLsigt9nHP/GO1BtnF+lU=;
        b=dOpBL/kmAZaM4yQTPjy9Nx3ZJNZgx8pJh+B5iKVEamtpx9hiVHvGmaUSrElEsnrkEz
         95OmxJmGx9V2mISzOD/ybrfzKDXIvjqD/Wynf1rHve7ula81LpOyOdClFFnT0kJefgH4
         6nyj18Y7bxSZi1GKRJImIyVXzC9098UMjQKk0lVRTXnX3TjisCcFQIgVEmSoqGpvJgtR
         p3ghq8eCHILNUwr8FKg8AYkgrIRk2WOWLGk0QIitfGY44T3yNXp+74kItUwMVgWn53pG
         t03wZhUy3zIUqDw0yFBm9NnjQQWpXz3kG6JgQTucmiaxjtt5Q/dKWFeHs/UEa5uhbRRg
         RK0Q==
X-Gm-Message-State: AOAM532B8E7X/1cnb+TLdlojCXM/cVa+YtISbAp27fRTapZyoFzKAU7Q
	1Uu4Iu98gPTxJBCpGxwILRACukMeZZzp5ct3
X-Google-Smtp-Source: ABdhPJwaZdTJwT2bM4vTgLqMPQUw8O93laRFsy/02o5DbENHrFqspQnaON7fOYWmvSKW7l3RV/E+xA==
X-Received: by 2002:a05:6830:22f6:: with SMTP id t22mr2637474otc.10.1614266747625;
        Thu, 25 Feb 2021 07:25:47 -0800 (PST)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-next 1/6] xen/char: Default HAS_NS16550 to y only for X86 and ARM
Date: Thu, 25 Feb 2021 08:24:00 -0700
Message-Id: <def4f2a0dc13d486bcfd86601152885acd880dd0.1614265718.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1614265718.git.connojdavis@gmail.com>
References: <cover.1614265718.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defaulting to yes only for X86 and ARM reduces the requirements
for a minimal build when porting new architectures.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 xen/drivers/char/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index b572305657..b15b0c8d6a 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -1,6 +1,6 @@
 config HAS_NS16550
 	bool "NS16550 UART driver" if ARM
-	default y
+	default y if (ARM || X86)
 	help
 	  This selects the 16550-series UART support. For most systems, say Y.
 
-- 
2.27.0


