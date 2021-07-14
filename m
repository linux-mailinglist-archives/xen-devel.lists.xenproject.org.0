Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A82A3C9241
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 22:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156212.288261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3le9-0000OU-Pu; Wed, 14 Jul 2021 20:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156212.288261; Wed, 14 Jul 2021 20:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3le9-0000Kv-M0; Wed, 14 Jul 2021 20:38:21 +0000
Received: by outflank-mailman (input) for mailman id 156212;
 Wed, 14 Jul 2021 20:38:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxbS=MG=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1m3le7-0000KG-Pc
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 20:38:19 +0000
Received: from mail-pf1-x431.google.com (unknown [2607:f8b0:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a66d8a53-11d2-43d1-a186-ab0271001d25;
 Wed, 14 Jul 2021 20:38:19 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id o201so3101865pfd.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jul 2021 13:38:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id b17sm1785084pfm.54.2021.07.14.13.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 13:38:17 -0700 (PDT)
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
X-Inumbo-ID: a66d8a53-11d2-43d1-a186-ab0271001d25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PVjxJO7r4tEQ5KrqJV2fLuS45xkhLqACA4SCEsFghwg=;
        b=LOzr0TSGpoY/uDxpvLTKhA2FZnlCEorEMej+Oifny9CBnjufEhEYllm4eg+dfxST8x
         YM/2ZHAEkYxfSCkAlcGW1AsVxX0tnYzLaFGvS4r8BZCr9iBdNFZlbCMnTs797vu6Kvek
         rG3ThorDLN1LaQvMIRxw/xBV2rRQNmEWsFE/1Y9A+7CbLrjzvc2Rjmmt0jmScjyoDRQp
         B8pVoJ+y0h81ncvpkr5eLx2SdVGn1dHdgjZVh1GUtwLHSKXJMncET/NM2xvg+r+UrZfa
         8FM41IFcwsJEUlXcbo0TiSclE+ySJS0QSMBoCpHg+GY/u3QrhE8Pg5pR4otSJECPJuy4
         YMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=PVjxJO7r4tEQ5KrqJV2fLuS45xkhLqACA4SCEsFghwg=;
        b=YCmNE/QE6crt7u+Z32YgyOyJYsVZBSvkSmXuk/DA9FoFYK+03Shyysi2C8g7d01cUE
         MWBmxCbkDWj3GtzlR1vJStNSyfe8FUAoTrRbVtXOpfSBDOnvaiS/bhnarSns8m1S1+6r
         dhAGZ8VLRBXUgV+0wN4GoAkuGdCCaAQfLeQwi6jzWUOiLIwYQfEu9Lam4WoXOA4IP0g+
         VMiZlTPd0lURoH9qKxfDykLlhPp9uk2BzEjA2XACeODRXGhmfpxMjroGjfe8cIC06nKi
         dE5cc5NsfwRKwPCJPX1UKKr93xK1iqwuLYyyNBsbp8zJ7axi7h7V9+9c2LWuOMUszlg9
         sElQ==
X-Gm-Message-State: AOAM533PMwRgEwAkU8ap/fBuoH9nut7/4prM/QkAKgSywiLlhh1Iiw2c
	MtZ6hnXSGxoroJipU0vlsOsAs//Zz9XDyqDA
X-Google-Smtp-Source: ABdhPJwrIpd7894157L04ZpBVIBPvvAbUKvKVDl93xih+9WvPToauUvvW8+k0RdKIk0ByMnQGyf7kA==
X-Received: by 2002:a62:1697:0:b029:326:7ec1:a9e9 with SMTP id 145-20020a6216970000b02903267ec1a9e9mr116882pfw.14.1626295098137;
        Wed, 14 Jul 2021 13:38:18 -0700 (PDT)
Sender: Bobby Eshleman <bobbyeshleman@gmail.com>
From: Bobby Eshleman <bobby.eshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobby.eshleman@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 1/4] arm/traps: remove debugger_trap_fatal() calls
Date: Wed, 14 Jul 2021 13:37:44 -0700
Message-Id: <2de1e8493e08722b5444d1293c5af299c76bf891.1626286772.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1626286772.git.bobby.eshleman@gmail.com>
References: <cover.1626286772.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM doesn't actually use debugger_trap_* anything, and is stubbed out.

Simply remove the calls. This also renders TRAP_invalid_op unused in
any common code, so remove that definition too.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
 xen/arch/arm/traps.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 4ccb6e7d18..dd09d2a4a9 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1266,10 +1266,6 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
 
     case BUGFRAME_bug:
         printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
-
-        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
-            return 0;
-
         show_execution_state(regs);
         panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
 
@@ -1281,8 +1277,6 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
 
         printk("Assertion '%s' failed at %s%s:%d\n",
                predicate, prefix, filename, lineno);
-        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
-            return 0;
         show_execution_state(regs);
         panic("Assertion '%s' failed at %s%s:%d\n",
               predicate, prefix, filename, lineno);
-- 
2.30.0


