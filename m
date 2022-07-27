Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C19A582977
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 17:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376257.608904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGipN-0006Te-UC; Wed, 27 Jul 2022 15:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376257.608904; Wed, 27 Jul 2022 15:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGipN-0006Pl-Pc; Wed, 27 Jul 2022 15:20:01 +0000
Received: by outflank-mailman (input) for mailman id 376257;
 Wed, 27 Jul 2022 15:20:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTNG=YA=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGipM-0006Pf-4M
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 15:20:00 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93f5f035-0dbf-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 17:19:59 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id s9so2588023edd.8
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 08:19:59 -0700 (PDT)
Received: from uni.router.wind (adsl-141.176.58.226.tellas.gr.
 [176.58.226.141]) by smtp.googlemail.com with ESMTPSA id
 kw26-20020a170907771a00b0072124df085bsm7771342ejc.15.2022.07.27.08.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:19:57 -0700 (PDT)
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
X-Inumbo-ID: 93f5f035-0dbf-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ENJiX+GT8DTpmIxLHxpEmpNV9lAnwpSdJhPDIIPKRss=;
        b=VGCHeLtRJfQVpQjXeM/lEPXU9cQL8TF5C/21G+FUzJof82rPNpCP67V9/638rstCg0
         fD+Xlim9jAjbPrCrZIQOqXa7vOl0vAJs0YnPXt6PAYHv0RqTElhW4SO2BQtAHtWHeKep
         8K/SJyOK2z1dy4IMpbLkaes7oB5XTt+2ssEaRlmkWFAMf5gzriTR/Fiv2RgbgtP8UWcr
         rjBnTpasuFicQ4AIPk0DTFvmYoe1hERBRGquN8sBi7ocZYsnloFO71VLgWCgbeyFkFgZ
         phdZwzlHO3IidrerXuKSNzJKEsvfl6h3sw4Hr1lE0NC1B4EAzH8FQ0TjN91252xwMyBG
         8Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ENJiX+GT8DTpmIxLHxpEmpNV9lAnwpSdJhPDIIPKRss=;
        b=V3ZXIajUDTj6NgIwSEdLrleYG1Y47YMXaM4B39XpT/8DtEKpDFXKwvR5iteAqglvqU
         hAX9zt/D/MT6E0cxGRyYv6q0+xxVJxfCMseAVAR6abXmG+HRP9gCr8XOAHSpt8MJLmhW
         1DgyDNKD0eGGTSf3ibBg9utWPfzSpmnwsb5fmZPGG0vO2tGAxTRtVML0m/XXL0gh8/pL
         KozzX0Dtzru87IbIl79ApTRnM1RGsW8wpYD9eLStbt1WOiqo9DopWV7sCasYe5jzZNfH
         l1MWkmcvFWWdHesdKR0wheMA0pW6EBo8eMANWU1dimcGhItTDgaPeJpdQQcPmDw5uc/Z
         n/2g==
X-Gm-Message-State: AJIora+SL+XTYa9mYbn+xfQAzC4wx+dX92dIFJuGRNFqwGq0RiQgJF4p
	GBwoS2BPi1RXM+CNML1BtUG+4rFh59A=
X-Google-Smtp-Source: AGRyM1sWglpGzkh2mvtL+5h0Xpqx9GMqjfDBVKa8M0SsivwWU1s0CIbxcdyl+FSRfnPfYF+YodGFNA==
X-Received: by 2002:a05:6402:1d48:b0:43c:13fc:d01 with SMTP id dz8-20020a0564021d4800b0043c13fc0d01mr13790272edb.207.1658935198256;
        Wed, 27 Jul 2022 08:19:58 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] xen/xsm: dummy.h: Fix MISRA C 2012 Directive 4.10 violation
Date: Wed, 27 Jul 2022 18:19:53 +0300
Message-Id: <20220727151953.1125331-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protect header file from being included more than once by adding ifndef guard.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/include/xsm/dummy.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 77f27e7163..8671af1ba4 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -15,6 +15,9 @@
  *  value of action.
  */
 
+#ifndef __XEN_XSM_DUMMY_H__
+#define __XEN_XSM_DUMMY_H__
+
 #include <xen/sched.h>
 #include <xsm/xsm.h>
 #include <public/hvm/params.h>
@@ -843,3 +846,5 @@ static XSM_INLINE int cf_check xsm_domain_resource_map(
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
+
+#endif /* __XEN_XSM_DUMMY_H__ */
-- 
2.34.1


