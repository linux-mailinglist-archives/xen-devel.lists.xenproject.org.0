Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D815259A6AB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 21:44:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390442.627929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7v2-0006Ry-Uh; Fri, 19 Aug 2022 19:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390442.627929; Fri, 19 Aug 2022 19:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7v2-0006MK-QK; Fri, 19 Aug 2022 19:44:36 +0000
Received: by outflank-mailman (input) for mailman id 390442;
 Fri, 19 Aug 2022 19:44:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yp9C=YX=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oP7v0-0004jK-SW
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 19:44:34 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59b74f91-1ff7-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 21:44:34 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id y13so10601466ejp.13
 for <xen-devel@lists.xenproject.org>; Fri, 19 Aug 2022 12:44:34 -0700 (PDT)
Received: from uni.. (adsl-47.176.58.181.tellas.gr. [176.58.181.47])
 by smtp.googlemail.com with ESMTPSA id
 r17-20020a1709061bb100b00731745a7e62sm2695059ejg.28.2022.08.19.12.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 12:44:33 -0700 (PDT)
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
X-Inumbo-ID: 59b74f91-1ff7-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qdHyhH5cSdeW97ssWYPbvEhezNy6ogyo1GiaHowDr9E=;
        b=LIs9vals9lwAXZy6OsKuaNRbCwKABh1zuTArxjplkPXuYCvzC/tCtwb7IjAIHmLl0t
         tx4G11HXMmu8kq1WU+MgdXkT8mgUMWOz8wlgnE8+24025rVDHw2dGkNgxoJH01KKZBzh
         cmJ4q0T2prC9N60yPkCpz+uDECZl1+TxF5SrjNMSzrKzUp+g4AqDPL1O6e6u0fiPQMEn
         1P/TAjktKvX8Uf0SCi3g6Fi7Rx6WPf7zqpnfc1w0/JRTs1lF+cC+HaG+eeWOReJEVAoT
         YUmYKIuJ99SOVXk8isrztxW8Ric2uU2UNJ7EvrAbDmkW6MklJ/p+7EedzoUjVgiBERwb
         v87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qdHyhH5cSdeW97ssWYPbvEhezNy6ogyo1GiaHowDr9E=;
        b=rlegrfq901/5+57MoDl3Djn4//goly5+ExCJW6JtB0t5pL8lWDmBeJsHK+UxrfwJCS
         Owl0+QlGFgUtBwSCeNAusmvmR/ebOAK7tjpaG48AA16OKpI/tNlPo8BmBAMVB1k7pXbK
         90BXWM6mJOPspO8SIvdxgjETycwejypmFtAkaAEqiA3P6ZWtmXYckM7rCM5M35blCerJ
         sxRgwigV8FkfqC9DDmAheluKHF/FlrZ9nCXBheecwPYK2Mgiz/Dj+8bwdLZtPlv++Iij
         dgwQLGwGott1DvniSkcrQpbnoIkb0ykMIpaozXX14GYCDb1FpHeieRnJNdp4QbcgALpq
         OEhg==
X-Gm-Message-State: ACgBeo323dfVJJC7dnBIFbF/eRq85PIevR41mpGJkwIwpW2L/IIJUHR3
	OPEVgax3QEpuRgQ3Ln4XsACI78usCAo=
X-Google-Smtp-Source: AA6agR749ueZHOkVbxZH5onEpwlF2SVUhZeIT1JILZCMYBvqbiXiftJkACWjDXsB13H4QebyslO+8g==
X-Received: by 2002:a17:907:72d3:b0:73a:d85:a0e2 with SMTP id du19-20020a17090772d300b0073a0d85a0e2mr5774788ejc.550.1660938273598;
        Fri, 19 Aug 2022 12:44:33 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 6/7] xen/arm: processor: Fix MISRA C 2012 Rule 20.7 violations
Date: Fri, 19 Aug 2022 22:43:58 +0300
Message-Id: <20220819194359.1196539-7-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819194359.1196539-1-burzalodowa@gmail.com>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In macros MPIDR_LEVEL_SHIFT() and MPIDR_AFFINITY_LEVEL(), add parentheses
around the macro parameters 'level' and 'mpidr', respectively, to prevent
against unintended expansions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/include/asm/processor.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 55f56b33bc..1dd81d7d52 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -127,10 +127,10 @@
 #define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
 
 #define MPIDR_LEVEL_SHIFT(level) \
-         (((1 << level) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
+         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
 
 #define MPIDR_AFFINITY_LEVEL(mpidr, level) \
-         ((mpidr >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
+         (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
 
 #define AFFINITY_MASK(level)    ~((_AC(0x1,UL) << MPIDR_LEVEL_SHIFT(level)) - 1)
 
-- 
2.34.1


