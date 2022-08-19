Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05059A6A6
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 21:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390436.627865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7uv-0004lz-QV; Fri, 19 Aug 2022 19:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390436.627865; Fri, 19 Aug 2022 19:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7uv-0004ja-LO; Fri, 19 Aug 2022 19:44:29 +0000
Received: by outflank-mailman (input) for mailman id 390436;
 Fri, 19 Aug 2022 19:44:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yp9C=YX=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oP7uu-0004jK-8c
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 19:44:28 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 558633b9-1ff7-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 21:44:27 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id w3so6858614edc.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Aug 2022 12:44:27 -0700 (PDT)
Received: from uni.. (adsl-47.176.58.181.tellas.gr. [176.58.181.47])
 by smtp.googlemail.com with ESMTPSA id
 r17-20020a1709061bb100b00731745a7e62sm2695059ejg.28.2022.08.19.12.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 12:44:25 -0700 (PDT)
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
X-Inumbo-ID: 558633b9-1ff7-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gpTcdGFtIggM/ndfLTOOJqJh1Gq2EXeW+frcQK8u79M=;
        b=dtaR3prsgnjJDmkr7VI0C4cWEqVDMSufqNJmumXQDW6cYpg1+ydZms5U+Ro51MXB5t
         jo6f7iofh9BCu5a7fDaW18oVUAFeYaLiHsDf+JxnBCHVS1+W+1W20RKbHHqhYhQ1S4tP
         ndKBkqHMhdvVqgQW1r/YrADrAsmB4eSkpNuRagkM0FYdUcJyWYt2opGdRNe1icyRm7KC
         2sdcaC5feSQKirxeJ0PX6ZvwGikfmSpYX+hopRPwwUalqNGxKrdOHI3SrJSem3hNnW7e
         TPTgl2OiiF7AOIGnQc5HCjCJ40jlluGlk2JspR/nzkwDtkl3HutsPjKVdB4q4aePzw8D
         OGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gpTcdGFtIggM/ndfLTOOJqJh1Gq2EXeW+frcQK8u79M=;
        b=JifNCpKhn4P3yCNzugmMKrSidCGAe2Dz4HpMh7yfdyA+dxe8F5Kb/iG7yCbExgb8uS
         r0MQW2YuVip0AjZ+QY/3GWbMAueBOJn/RSvdtMQGBMjshGKJDC8BgpeprHal0R1GHtv+
         6ge6oi3c5ay83Ch+b4aTADcV4fXUxYFuAbQNqiYg7fP3HMYwK5ug2jpV9wvDMmEXCt2n
         umjIOQ6ppoODX/1iMYiNsPbpjFPlP8b5qH4Nf0ADnmkKHPYUopjAvKmVoByQ/aryeZlY
         SHt4MQbo0buN4LYLZwCS4NQRRFC6vIRGG/QsiELTlGS9XdhTfyO7xuwtJ3gf9pkfDL5D
         S3Ag==
X-Gm-Message-State: ACgBeo24GGTGYwuLhgtOVevWtovBIuI1dlAyFFQrlumlOg/yJ7O6ev7+
	/shj3fnoYTkmOmIK9YlrEe7FpvygD0A=
X-Google-Smtp-Source: AA6agR74rrbOHONcU0veZ6EMafv63MPWQH4nz6HQlpQSSKjLWTEQwOqaIF7pExtS3v5N87nnzPRrNg==
X-Received: by 2002:a05:6402:2753:b0:43a:d6f2:9839 with SMTP id z19-20020a056402275300b0043ad6f29839mr7013799edd.73.1660938266474;
        Fri, 19 Aug 2022 12:44:26 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/7] xen/arm: gic_v3_its: Fix MISRA C 2012 Rule 20.7 violations
Date: Fri, 19 Aug 2022 22:43:53 +0300
Message-Id: <20220819194359.1196539-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819194359.1196539-1-burzalodowa@gmail.com>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In macros GITS_TYPER_DEVICE_ID_BITS(), GITS_TYPER_EVENT_ID_BITS() and
GITS_BASER_ENTRY_SIZE(), add parentheses around the macro parameter to
prevent against unintended expansions.
Realign subsequent lines, if any.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/include/asm/gic_v3_its.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index 94e5cb99c5..168617097f 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -46,13 +46,13 @@
 #define GITS_TYPER_PTA                  BIT(19, UL)
 #define GITS_TYPER_DEVIDS_SHIFT         13
 #define GITS_TYPER_DEVIDS_MASK          (0x1fUL << GITS_TYPER_DEVIDS_SHIFT)
-#define GITS_TYPER_DEVICE_ID_BITS(r)    (((r & GITS_TYPER_DEVIDS_MASK) >> \
-                                               GITS_TYPER_DEVIDS_SHIFT) + 1)
+#define GITS_TYPER_DEVICE_ID_BITS(r)    ((((r) & GITS_TYPER_DEVIDS_MASK) >> \
+                                                 GITS_TYPER_DEVIDS_SHIFT) + 1)
 
 #define GITS_TYPER_IDBITS_SHIFT         8
 #define GITS_TYPER_IDBITS_MASK          (0x1fUL << GITS_TYPER_IDBITS_SHIFT)
-#define GITS_TYPER_EVENT_ID_BITS(r)     (((r & GITS_TYPER_IDBITS_MASK) >> \
-                                               GITS_TYPER_IDBITS_SHIFT) + 1)
+#define GITS_TYPER_EVENT_ID_BITS(r)     ((((r) & GITS_TYPER_IDBITS_MASK) >> \
+                                                 GITS_TYPER_IDBITS_SHIFT) + 1)
 
 #define GITS_TYPER_ITT_SIZE_SHIFT       4
 #define GITS_TYPER_ITT_SIZE_MASK        (0xfUL << GITS_TYPER_ITT_SIZE_SHIFT)
@@ -75,7 +75,7 @@
 #define GITS_BASER_TYPE_RESERVED7       7UL
 #define GITS_BASER_ENTRY_SIZE_SHIFT     48
 #define GITS_BASER_ENTRY_SIZE(reg)                                       \
-                        (((reg >> GITS_BASER_ENTRY_SIZE_SHIFT) & 0x1f) + 1)
+                        ((((reg) >> GITS_BASER_ENTRY_SIZE_SHIFT) & 0x1f) + 1)
 #define GITS_BASER_SHAREABILITY_SHIFT   10
 #define GITS_BASER_PAGE_SIZE_SHIFT      8
 #define GITS_BASER_SIZE_MASK            0xff
-- 
2.34.1


