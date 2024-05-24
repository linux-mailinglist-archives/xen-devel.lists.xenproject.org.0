Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB068CEAA2
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 22:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729750.1135050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8q-0008UZ-K3; Fri, 24 May 2024 20:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729750.1135050; Fri, 24 May 2024 20:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8q-0008Q7-9v; Fri, 24 May 2024 20:03:52 +0000
Received: by outflank-mailman (input) for mailman id 729750;
 Fri, 24 May 2024 20:03:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGXh=M3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sAb8p-00076x-4k
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 20:03:51 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd08fe0b-1a08-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 22:03:50 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f465so1148359a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 13:03:50 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9377d8sm173553066b.55.2024.05.24.13.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:03:49 -0700 (PDT)
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
X-Inumbo-ID: bd08fe0b-1a08-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716581030; x=1717185830; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4dvCcdXKh6qx9C0SJSN8op2mWkgo8zuNPTidlZTBXU=;
        b=reUBOJmf1e5428vJskaJS1GtdgRJ7z02uxzxYV1OCXvzkopMKeVvnOrkE2L8n8tYc9
         oETtHEk8gD2P40lb1QmZ2WagdYLSyeUdMAt5IRPPV+vh25DWgk4drijRtLL3akvCrV3u
         9ZIOXjH0Gxbw/IZ1wLuRB2WD627VaEKDw3GCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581030; x=1717185830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4dvCcdXKh6qx9C0SJSN8op2mWkgo8zuNPTidlZTBXU=;
        b=wl7Etr7+vgdJBonoBoFVHQ9z2M7DpAdlBR+LwdVNw/oUYiu0nwC9EYnDNdQbdcfSNZ
         daFn7zlZCWW/QdDzLxyqsae/WF5ztLadihc8/DBIpI+6XX7BrWxFM8CIBgJQK1o2oIWC
         wBEBPuT59WjR3uOylwwXhzv8BZBY2lRFRMmmW+vm2YylJmhlB8OZ6NgpdgZaD/H5hv7K
         Ixvenn+VkAP9vWZ/9VcaqegWWOTKQvc8Gp98Ro/I3FbKjJ2l+NvMLQYnTBP3LbC59d4v
         3c1+uE6Px/mJ+M4fokGXuSxfhv5K6MWafvaJ+ePEa+q/QPdGaSmMeu9Ixjqt5ga2KYT4
         bxFw==
X-Gm-Message-State: AOJu0YxWRaUfSwAckQh2KVkGucuzwqprVsa5tM2MZ0ii0pDtpRFyJohT
	fBKL5k4bNBGIw28S+2/Rjmv1SBrUTyGJ4kVvmFq1If+FTqYw40zuqiFv3VOtKCg7FKQKnsS3pAX
	5F+k=
X-Google-Smtp-Source: AGHT+IGpbR8qQpWJhSYJH93pbLDUKTmP1Mf1+5HUrKKu6ErvFgLI74jMTr42QIaJ6HBcUl8sMDuvhw==
X-Received: by 2002:a17:906:c0e:b0:a62:49ba:8242 with SMTP id a640c23a62f3a-a62651118admr194060366b.77.1716581029839;
        Fri, 24 May 2024 13:03:49 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v2 07/13] x86/bitops: Improve arch_ffs() in the general case
Date: Fri, 24 May 2024 21:03:32 +0100
Message-Id: <20240524200338.1232391-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The asm in arch_ffs() is safe but inefficient.

CMOV would be an improvement over a conditional branch, but for 64bit CPUs
both Intel and AMD have provided enough details about the behaviour for a zero
input.  It is safe to pre-load the destination register with -1 and drop the
conditional logic.

However, it is common to find ffs() in a context where the optimiser knows
that x in nonzero even if it the value isn't known precisely, and in that case
it's safe to drop the preload of -1 too.

There are only a handful of uses of ffs() in the x86 build, and all of them
improve as a result of this:

  add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-31 (-31)
  Function                                     old     new   delta
  mask_write                                   114     107      -7
  xmem_pool_alloc                             1063    1039     -24

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

v2:
 * New.
 * Use __builtin_constant_p(x > 0) to optimise better.
---
 xen/arch/x86/include/asm/bitops.h | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 122767fc0d10..1d7aea6065ef 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -432,12 +432,28 @@ static inline int ffsl(unsigned long x)
 
 static always_inline unsigned int arch_ffs(unsigned int x)
 {
-    int r;
+    unsigned int r;
+
+    if ( __builtin_constant_p(x > 0) && x > 0 )
+    {
+        /* Safe, when the compiler knows that x is nonzero. */
+        asm ( "bsf %[val], %[res]"
+              : [res] "=r" (r)
+              : [val] "rm" (x) );
+    }
+    else
+    {
+        /*
+         * The AMD manual states that BSF won't modify the destination
+         * register if x=0.  The Intel manual states that the result is
+         * undefined, but the architects have said that the register is
+         * written back with it's old value (zero extended as normal).
+         */
+        asm ( "bsf %[val], %[res]"
+              : [res] "=r" (r)
+              : [val] "rm" (x), "[res]" (-1) );
+    }
 
-    asm ( "bsf %1,%0\n\t"
-          "jnz 1f\n\t"
-          "mov $-1,%0\n"
-          "1:" : "=r" (r) : "rm" (x));
     return r + 1;
 }
 #define arch_ffs arch_ffs
-- 
2.30.2


