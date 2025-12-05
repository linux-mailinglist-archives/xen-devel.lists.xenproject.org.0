Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8711CA8300
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 16:29:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179222.1502816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRXk7-0005yb-QK; Fri, 05 Dec 2025 15:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179222.1502816; Fri, 05 Dec 2025 15:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRXk7-0005w0-Ni; Fri, 05 Dec 2025 15:29:11 +0000
Received: by outflank-mailman (input) for mailman id 1179222;
 Fri, 05 Dec 2025 15:29:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=niBk=6L=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vRXk6-0005vu-2V
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 15:29:10 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 247c9927-d1ef-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 16:29:09 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42e2e671521so1472463f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 07:29:09 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe8fe8sm9342914f8f.2.2025.12.05.07.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 07:29:07 -0800 (PST)
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
X-Inumbo-ID: 247c9927-d1ef-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764948548; x=1765553348; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m5poUjleRs6edLNo2yJ5LkEsXL+q9XYEcbgn9x0APa4=;
        b=HGn4gYrMB2L696G96GnoENeykE6UTirGbBULFxbqhODUmGXUnLU/9LIH0cMaEZM/j+
         F3lJvEdrkBpsUarlH0krJuHxzb5kkrViZXshXDRjJtxQsCeQYhgQB49SD/Egke//1UTQ
         5TX02q5oAptsbVahxNuGKKPrY07zr4yJFj848=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764948548; x=1765553348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5poUjleRs6edLNo2yJ5LkEsXL+q9XYEcbgn9x0APa4=;
        b=O4KhQxiV6dWtPfo637H/QrqT0AWj13Ffzj6zFWoi9jXVv0Lf0Agy0LqEw24ZyccpOp
         8ZB+dCUzeqxQR2QxTLFMzT4S/YDn2uN23lSpgMSJ2vKmz0ll0izRU+IPnT/QaStTVao7
         Vjr468wra7cLsI0ERZrQfR9CFxxO6V+DjUQhTESSjeV13HxCGAsgAKkTzSzFuvOPgZvf
         6uGlcxYPjMtQlZv9ag3kvoHA5F1IQtltTc3yo4h1YCf7EkkyuJqxEPfI9y0zrYOPLHC5
         3FMAy8toYEEwNHXNfKWR/zcbJuBJUnmW/IVn8XAu3nv9eHa3x2UfIwLtaeWtD9mFze2O
         FUzQ==
X-Gm-Message-State: AOJu0YwKupeOarViQS9wndVOM6y68wThEMAmo3h+JPJSVPt2Q+8Fk0/C
	pf2CATalIaEC0gygfWWalgsMgxTZovi9274ZgqjZfzrisM7WzV75hTi6eG1Cn59D7DxPQ/mCUKR
	OIpbF
X-Gm-Gg: ASbGncsPaIO+hJVvP9XVOIlDv/ouh+BpgsfagLXNSrlZfBDv1ocRDcHRLhwWrj2ix8I
	9VIi0fatR3JZ0cxyuIznqNe4Q3wPk9MQ9JTGhjK6z1xVTKhR/jeybXi/kPBNBFG9B7Vi+mE66Ye
	TxEtgfciVe/Rmv+jcrt2fQKwTFmsNIs8+D6jPsJCIbmvgJbtHczuoeVS+pOhGNj2MMxHUSqR1sQ
	ga/PNLU6FHcYzLhZeMH/dGK4SBP/5hbqOhnUwOHZ9S6cj16YGemufyH2/ZazKPcSgs5LeaYMS3+
	gKJlnKujOXe7pACI9umB5hatdasrUH9YBm0+2tG9+ua0JsTjNNmvq9pDsP7lQkHexZsKO8uHOXB
	BaSSxWV6PIULnq/M0+h9sK3PUo65cWerplGLzXzonXlZZ/unvK5PhOPUxDSQe61BIxKgGT284+5
	9Fz5BmYHNOtix9cMg2A43ARnOj3r+GvDHqOHX1mVoXGlrs9UCI8u+gwIunPLB4Nw==
X-Google-Smtp-Source: AGHT+IGYFNqWp4fbqvpwcHZhcQDgXuY9CfBm1OcejdEUr5UNIL0G6rMdJEJ5fHqBS33TMnS88OFcZQ==
X-Received: by 2002:a05:6000:2912:b0:429:ccd7:9d94 with SMTP id ffacd0b85a97d-42f79862526mr7481872f8f.51.1764948547820;
        Fri, 05 Dec 2025 07:29:07 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/kexec: Replace CALL+UD2 pattern with JMP
Date: Fri,  5 Dec 2025 15:29:05 +0000
Message-Id: <20251205152905.1925700-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linux jumps to the target image rather than calling it.  Switch to using JMP,
and drop the trailing UD2s.

Linux does have a mode, named CONFIG_KEXEC_JUMP, where the target image can be
returned from, but that involves extra metadata and setting up a stack within
the target image which Xen doesn't support at the moment.

No functional change.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/x86_64/kexec_reloc.S | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index 50ba454abd48..b52d31a654e0 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -75,10 +75,8 @@ FUNC(kexec_reloc, PAGE_SIZE)
         testq   $KEXEC_RELOC_FLAG_COMPAT, %r8
         jnz     .L_call_32_bit
 
-.L_call_64_bit:
-        /* Call the image entry point.  This should never return. */
-        callq   *%rbp
-        ud2
+        /* Jump to the image entry point */
+        jmp     *%rbp
 
 .L_call_32_bit:
         /* Setup IDT. */
@@ -170,9 +168,8 @@ FUNC_LOCAL(compatibility_mode)
         xorl    %eax, %eax
         movl    %eax, %cr4
 
-        /* Call the image entry point.  This should never return. */
-        call    *%ebp
-        ud2
+        /* Jump to the image entry point. */
+        jmp     *%ebp
 END(compatibility_mode)
 
         /* Separate code and data into into different cache lines */

base-commit: 351d41e8aecc3f7566a0baa7b4066d06dedd7113
-- 
2.39.5


