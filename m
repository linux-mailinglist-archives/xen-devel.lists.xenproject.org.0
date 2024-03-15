Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3978787CD14
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 13:14:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693836.1082444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl6RE-0006ci-Ln; Fri, 15 Mar 2024 12:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693836.1082444; Fri, 15 Mar 2024 12:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl6RE-0006bB-Ia; Fri, 15 Mar 2024 12:13:28 +0000
Received: by outflank-mailman (input) for mailman id 693836;
 Fri, 15 Mar 2024 12:13:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9knB=KV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rl6RC-0006b5-Jt
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 12:13:26 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ca13c1c-e2c5-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 13:13:25 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-563bb51c36eso2578732a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 05:13:25 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h25-20020a17090634d900b00a454438091fsm1654875ejb.70.2024.03.15.05.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 05:13:23 -0700 (PDT)
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
X-Inumbo-ID: 6ca13c1c-e2c5-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710504804; x=1711109604; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1aZV9TonYmvhh8ERncfMGScFuRJUFVx1UlX7BWrmAn8=;
        b=UF5xkQIRE/agyCK2r8XokBpT8s6hMhCWMXzof6f8F4R6BEo1fcGr6GvliSKkz751Tx
         94rcOrcyMxTHC8303ROe/vEMqro+84tOWUZxMTXh5mZS7CEMae7ohHjCnd/Jp65Hj9PR
         56xiAQAFFmBAE9mFt4QJ2SSSYzCtfmI4/qxgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710504804; x=1711109604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aZV9TonYmvhh8ERncfMGScFuRJUFVx1UlX7BWrmAn8=;
        b=EB6hQfPW4t2cRNYQuklgV6SeGfLPwxirftDpYSzhUYBez51YLs4WDnogz3+egsB90D
         3+T70Qu9MdGmmXj91UpmYVW3eDPQsAp+kyI9TfFG6/2urLK2KPtpQYAHjmc2SWmkGTTj
         ADHzj2hBmZwzs+Qp/bLd6fk+kV61oQuOb15BFNw3LaOV8ohmggDRC9QYYbv2g/g+xpWT
         CvJsF9Ee+6qYbB25ldNcAVy5HlYA/LUnR/WMt7jN0IZuDtRdFk2qbOjgGZL+4wCYeVN1
         EJyxKyy+W6yyTpv1kXzl/gkNLoyvBqPoR2xGgbBeK96fLZqswGbfkH9fNlipEmC1zSIk
         mfeA==
X-Gm-Message-State: AOJu0YyDhkGXcDk7WTrV+piNBWmWhppmezmRA8WbxV4IucTH3+or9Y+V
	Th94y+f5iSRSr1KpAw5VM44swkVNuWbgUyOFCbeEN5U+t0IDa1aQbDIOZH6uNKIP49Bd6iD8ddN
	V
X-Google-Smtp-Source: AGHT+IGZKvTM/4eMMxsMM0rZZNSgULV/RpS+/Uc3ymt/V9eHGvVfVNPI2oxyPTMeUcUEzS5kLckolQ==
X-Received: by 2002:a17:907:987c:b0:a44:4c8e:f167 with SMTP id ko28-20020a170907987c00b00a444c8ef167mr2898559ejc.69.1710504804093;
        Fri, 15 Mar 2024 05:13:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/vpci: Improve code generation in mask_write()
Date: Fri, 15 Mar 2024 12:13:22 +0000
Message-Id: <20240315121322.3300387-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The use of __clear_bit() forces dmask to be spilled to the stack, and
interferes with the compiler heuristcs for some upcoming improvements to the
ffs() code generation.

First, shrink dmask to just the active vectors by making out the upper bits.
This replaces the "i < msi->vectors" part of the loop condition.

Next, use a simple while() loop with "clear bottom bit" expressed in plane C,
which affords the optimiser a far better understanding of what the loop is
doing.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>

Noticed when looking at the ffs() code gen improvements.

Any suggestion on how to test this?  test_vcpi doesn't seem to check anything
here.  I think I've got the boundary conditions for msi->vectors right, but
I'd be lying if I said I was certain...

bloat-o-meter reports:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-28 (-28)
  Function                                     old     new   delta
  mask_write                                   142     114     -28

which is a consequence of the compiler having a much better idea of what's
going on in the loop.  There's more to come with the ffs() improvements too.
---
 xen/drivers/vpci/msi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index d3aa5df08941..30adcf7df05d 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -169,13 +169,15 @@ static void cf_check mask_write(
 
     if ( msi->enabled )
     {
-        unsigned int i;
+        /* Skip changes to vectors which aren't enabled. */
+        dmask &= (~0U >> (32 - msi->vectors));
 
-        for ( i = ffs(dmask) - 1; dmask && i < msi->vectors;
-              i = ffs(dmask) - 1 )
+        while ( dmask )
         {
+            unsigned int i = ffs(dmask) - 1;
+
             vpci_msi_arch_mask(msi, pdev, i, (val >> i) & 1);
-            __clear_bit(i, &dmask);
+            dmask &= (dmask - 1);
         }
     }
 

base-commit: d638e304f13a5ef7d125de5ace5f7828a7b25bac
-- 
2.30.2


