Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFAF6B2587
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 14:34:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508263.782770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paGOs-0001LH-HQ; Thu, 09 Mar 2023 13:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508263.782770; Thu, 09 Mar 2023 13:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paGOs-0001Ia-EQ; Thu, 09 Mar 2023 13:33:42 +0000
Received: by outflank-mailman (input) for mailman id 508263;
 Thu, 09 Mar 2023 13:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZdn=7B=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1paGOq-00013B-LN
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 13:33:40 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00b5af64-be7f-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 14:33:40 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so1253469wmq.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Mar 2023 05:33:40 -0800 (PST)
Received: from fedora.. (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 he11-20020a05600c540b00b003df5be8987esm2672209wmb.20.2023.03.09.05.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 05:33:39 -0800 (PST)
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
X-Inumbo-ID: 00b5af64-be7f-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678368819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7hHcHZI8sa8NXq4j1gKzt1RWafzFQLn60muWdU2SCg=;
        b=PWTWUc3idM94EEk0JjS7IZHBg7ysEgyUWUZc9BmBW3gxCTwrKPa1PkdvfozgTWbomp
         JJDIPJJyh7Nt3EToFIGnyndFrKbdoQDfYuntv7Z3tzkgPQ8Z5lfA9CSs9imZqnn9Gyc7
         3ZLA9MjiVj7JArTQSDxWtnqMD4TwuWTjxXBCcEwxiC/LhGBRCN724uHjhkT4yjGIO12k
         2jGLWmtbf/eCUXI1gFxVocJx4IoVBIr/7Zl0ea7FZ/z3ohoRxLCbbKulIgZ5e79p1DYB
         w6GkkweFAeCSOQuyRBTaj4N0oYGQUb82D2kfqh9nV1kQ2VEtBALcPWNs9mQaB9XQ5ueJ
         xLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678368819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7hHcHZI8sa8NXq4j1gKzt1RWafzFQLn60muWdU2SCg=;
        b=aIfXQSGGJNqrGV2UvcFV+4WL49EWs62Iqad7TXIs1n1+K1hA+ScZ4qAZCV+QNZohvp
         qylL5lsdUGfsqboV9f9qGrLW3lYW3Ee0jSSRlwHZQOGQcB2lLviPeNvxDNx0tMbMvSl1
         hMF9wmnIXgENkdGzCWYy9+y5pe1gwzThG57ZZXKogYLhG2js5Ie5kONbMeHf8J9X/N3b
         XqmqXRbWfLh7rT6Dj7wwjef6JCwesB4jYxrBUHDmjQ0ZJUq9mSiyl+9MreC35eFhGOGf
         MaSnAJy++51oLolSAWgaNR7CPajktBbLw09XYtIJsAlYWCfaoQigN/rT1YUKbtCekR7S
         ZODg==
X-Gm-Message-State: AO0yUKU77zimU4qU9LIxWtMIERdRoELkYfOHroqITcV55+cWJDijQ70p
	UzVQ6yR+taEuJkY4sf+yXgsbgr4RB9e2GA==
X-Google-Smtp-Source: AK7set+XCj1W9HIHP9bFEP75JNHnWuQ4xjygYljXslqBnZPoLh05W1VF19fPdMvW+0ZYfr9WN9HYCA==
X-Received: by 2002:a05:600c:1552:b0:3ea:f883:4ce with SMTP id f18-20020a05600c155200b003eaf88304cemr18613070wmg.20.1678368819421;
        Thu, 09 Mar 2023 05:33:39 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 2/5] xen/arm: remove unused defines in <asm/bug.h>
Date: Thu,  9 Mar 2023 15:33:25 +0200
Message-Id: <ff898ad47ab1caae2ddfe3c9d34e7ebca8f40d44.1678368234.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678368234.git.oleksii.kurochko@gmail.com>
References: <cover.1678368234.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following defines BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH,
BUG_LINE_HI_WIDTH aren't used in ARM so could be purged
as unused.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/include/asm/bug.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index f4088d0913..d6c98505bf 100644
--- a/xen/arch/arm/include/asm/bug.h
+++ b/xen/arch/arm/include/asm/bug.h
@@ -9,10 +9,6 @@
 # error "unknown ARM variant"
 #endif
 
-#define BUG_DISP_WIDTH    24
-#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
-#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
-
 struct bug_frame {
     signed int loc_disp;    /* Relative address to the bug address */
     signed int file_disp;   /* Relative address to the filename */
-- 
2.39.2


