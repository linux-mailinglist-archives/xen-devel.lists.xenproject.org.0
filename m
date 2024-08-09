Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFFC94D0CA
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 15:05:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774744.1185172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scPIB-0000ih-VZ; Fri, 09 Aug 2024 13:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774744.1185172; Fri, 09 Aug 2024 13:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scPIB-0000gK-T1; Fri, 09 Aug 2024 13:04:27 +0000
Received: by outflank-mailman (input) for mailman id 774744;
 Fri, 09 Aug 2024 13:04:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBfy=PI=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1scPI9-0000fj-Hs
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 13:04:25 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e644dc82-564f-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 15:04:23 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7a94478a4eso506971566b.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 06:04:23 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d437a5sm835020266b.101.2024.08.09.06.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 06:04:22 -0700 (PDT)
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
X-Inumbo-ID: e644dc82-564f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723208663; x=1723813463; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IqFJjaRsLh2UOFChJjBNPbupmjhv4JBVg7GbkBcuHVg=;
        b=RPAiPK5yRVeS8Yvn++GWkh7szcfN16PDKTPj7/srXK82tEqbH+ViVDhEI/w5OxfBtX
         WSTRbPjkebkNXuaqX5JmVwySWKWKeUtUKJgcfFhgd2eEb2eTOIX/oqv0zpYsYGm1RDG2
         qymG9QSFnDmPqUxXw+AtdnL96SFtSfGzC+i0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723208663; x=1723813463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqFJjaRsLh2UOFChJjBNPbupmjhv4JBVg7GbkBcuHVg=;
        b=NUsXZyTL8VU5iyIjP33QCKwL2KyXz8S0kuzFj8tCsZ7FTJ2Zg2FnXGQUiFctVbGMb8
         oG0bjSd8+OEFmxgNK74fWqgFdYjwfdukG+Lug3sAbmJRsUjq8IgoXL1XJ2XCtUClipb8
         9fDnn58XxOytiuRBb9vEvbTH+VZyw4fbBLqP4z74WVyd5DTjHGAaOvAXzI1XyZ7aOYrx
         dtx3UfY1Ztn8joGT3Xn1brlh1ZljVE2gmlyQ3M9cTp0qoeNSuL/wlkYA0pJkyy1eH+df
         r+uTFvjV3hT8ImmYEIoPJENRur+EKOA274NLMRM7VNL8euso3RcEeKjZr6UPt5m1fzhA
         O04g==
X-Gm-Message-State: AOJu0YyXCLMpX+/zPjnFxQxF2AlOI3dhXokHnzRw756FSd9ddrAiT17X
	Qh7btZi01HNQe96kpg4eT5oPr8KaBXT2znHPJKnnrVE8sf6UDMxypWcXeifTUFcd/85k4185Iql
	B
X-Google-Smtp-Source: AGHT+IF3a2+rZm0LdS0N84wcXkZrMpkLEAxaKgpUmxpZyi4RX8szJX/zSNJo8B4xU11eluiNC+6uLA==
X-Received: by 2002:a17:906:f59f:b0:a77:db39:cc04 with SMTP id a640c23a62f3a-a8091ef4436mr453145066b.11.1723208662561;
        Fri, 09 Aug 2024 06:04:22 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH] xen: Remove -Wdeclaration-after-statement
Date: Fri,  9 Aug 2024 14:04:18 +0100
Message-ID: <20240809130418.10431-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This warning only makes sense when developing using a compiler with C99
support on a codebase meant to be built with C89 compilers too, and
that's no longer the case (nor should it be, as it's been 25 years since
C99 came out already).

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Yes, I'm opening this can of worms. I'd like to hear others people's
thoughts on this and whether this is something MISRA has views on. If
there's an ulterior non-obvious reason besides stylistic preference I
think it should be documented somewhere, but I haven't seen such an
explanation.

IMO, the presence of this warning causes several undesirable effects:

  1. Small functions are hampered by the preclusion of check+declare
     patterns that improve readability via concision. e.g: Consider a
     silly example like:

     /* with warning */                     /* without warning */
     void foo(uint8_t *p)                   void foo(uint8_t *p)
     {                                      {
         uint8_t  tmp1;                         if ( !p )
         uint16_t tmp2;                             return;
         uint32_t tmp3;
                                                uint8_t  tmp1 = OFFSET1 + *p;
         if ( !p )                              uint16_t tmp2 = OFFSET2 + *p;
             return;                            uint32_t tmp3 = OFFSET3 + *p;

         tmp1 = OFFSET1 + *p;                   /* Lots of uses of `tmpX` */
         tmp2 = OFFSET2 + *p;               }
         tmp2 = OFFSET2 + *p;

         /* Lots of uses of tmpX */
     }

  2. Promotes scope-creep. On small functions it doesn't matter much,
     but on bigger ones to prevent declaring halfway through the body
     needlessly increases variable scope to the full scope in which they
     are defined rather than the subscope of point-of-declaration to
     end-of-current-scope. In cases in which they can be trivially
     defined at that point, it also means they can be trivially misused
     before they are meant to. i.e: On the example in (1) assume the
     conditional in "with warning" is actually a large switch statement.

  3. It facilitates a disconnect between time-of-declaration and
     time-of-use that lead very easily to "use-before-init" bugs.
     While a modern compiler can alleviate the most egregious cases of
     this, there's cases it simply cannot cover. A conditional
     initialization on anything with external linkage combined with a
     conditional use on something else with external linkage will squash
     the warning of using an uninitialised variable. Things are worse
     where the variable in question is preinitialised to something
     credible (e.g: a pointer to NULL), as then that can be misused
     between its declaration and its original point of intended use.

So... thoughts? yay or nay?
---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index 2e1a925c8417..288b7ac8bb2d 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -394,7 +394,7 @@ CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
 
 CFLAGS += -nostdinc -fno-builtin -fno-common
 CFLAGS += -Werror -Wredundant-decls -Wwrite-strings -Wno-pointer-arith
-CFLAGS += -Wdeclaration-after-statement -Wuninitialized
+CFLAGS += -Wuninitialized
 $(call cc-option-add,CFLAGS,CC,-Wvla)
 $(call cc-option-add,CFLAGS,CC,-Wflex-array-member-not-at-end)
 $(call cc-option-add,CFLAGS,CC,-Winit-self)
-- 
2.45.2


