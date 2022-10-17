Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71183601573
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 19:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424531.672023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okTyV-0007aD-Hw; Mon, 17 Oct 2022 17:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424531.672023; Mon, 17 Oct 2022 17:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okTyV-0007YI-FI; Mon, 17 Oct 2022 17:32:27 +0000
Received: by outflank-mailman (input) for mailman id 424531;
 Mon, 17 Oct 2022 17:32:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7GYT=2S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1okTyT-0007YC-GC
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 17:32:25 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a977500e-4e41-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 19:32:24 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id q9so26674552ejd.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Oct 2022 10:32:24 -0700 (PDT)
Received: from uni.router.wind (adsl-214.109.242.138.tellas.gr.
 [109.242.138.214]) by smtp.googlemail.com with ESMTPSA id
 cq6-20020a056402220600b00458cc5f802asm7705824edb.73.2022.10.17.10.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 10:32:22 -0700 (PDT)
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
X-Inumbo-ID: a977500e-4e41-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1FhMqU6o+OmI9sNxvKM4/FjFziffLBpWtVI66KBPbI0=;
        b=BJ+rzIblhdV+Z2Ns4ttV2aBanT0/zvkcOb6Ye7/8HmXYpEMBvG4mvI2Gm5fiGEIzE5
         SdBU6ftV4vBg2dZPg3NTSBBiTjcbnUOkLf+jOpiACuGFa5mchNkHizQflou8MMTCjc0D
         7ulCF054GIAPzKxJz1tvpdunhXzMlQzP/d8c8hUzdNbuVLqjJi3AhHkXkJREGRQ+hkz6
         liD7aSyEGzmEcNTgegXoKWSY/d7x2puMwzGseTy4wzupgTDkPOxCLgSwQ0B0QGDR6adU
         soOt2zDyLfzZ0LHpfHi2/yHw3suWZQoc0o5G5zzdRQyO0c2VNi/g2JdQuXlk7JvfLyP9
         BuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FhMqU6o+OmI9sNxvKM4/FjFziffLBpWtVI66KBPbI0=;
        b=HtCmU3FmToFNDo7zWCDnBSTvWSDojyFXFXydhM/g/XnaGY0VoemV0XAzo5aKbxFN2X
         oWH8RRgDQyVyGDn9dcdPOUyfy7FVSnNMdNlkNCLyw63heATb4WspkZEDMRfivIW2jkaA
         +kFoRXKrbnEa3Nvr2OqQq7RvSosQ7q7G2XHKo8HZEAHME+kbdL8ZQmt+U2khM18mpvCB
         CXatfCot+tgen5J+JSFGxS+JwXef7d8mbIOUzZQpLXyOExWtDCVN2tS3Toqp0C+CrLlR
         wYgnDn2GKDMKaDgJsiQPqjABuLqqAYnj3MZWx7PmFz4xbhScbIAfXslG4RDDj7jCrv4V
         8Vlg==
X-Gm-Message-State: ACrzQf3uJvm29PweexUO0T4UhTYUeRYMdnezG/OWfNRhyW0/PN6uVtGJ
	6IkHFCkt5ugIHmB3GNdg35DMw9GaqTE=
X-Google-Smtp-Source: AMsMyM5SlrDYpZHdKXPSkpaHxNfCE/fOi6lJk15YnTAFboEyJMwUXmXynJ/sw/AZ8XaK+JvJ3YdjZA==
X-Received: by 2002:a17:907:969e:b0:782:6b92:6b1f with SMTP id hd30-20020a170907969e00b007826b926b1fmr9205827ejc.140.1666027943555;
        Mon, 17 Oct 2022 10:32:23 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: p2m: fix pa_range_info for 52-bit pa range
Date: Mon, 17 Oct 2022 20:32:09 +0300
Message-Id: <20221017173209.236781-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the pa_range_info for the 52-bit pa range advertizes that the
p2m root table consists of 8 concatenated tables at level 3, which does
not make much sense.
In order to support the 52-bit pa size with 4KB granule, the p2m root
table needs to be configured either as a single table at level -1 or
as 16 concatenated tables at level 0.
Since, currently there is not support for level -1, set the
root_order and sl0 fields of the corresponding pa_range_info according
to the second approach.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/p2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index f17500ddf3..c824d62806 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2251,7 +2251,7 @@ void __init setup_virt_paging(void)
         [3] = { 42,      22/*22*/,  3,          1 },
         [4] = { 44,      20/*20*/,  0,          2 },
         [5] = { 48,      16/*16*/,  0,          2 },
-        [6] = { 52,      12/*12*/,  3,          3 },
+        [6] = { 52,      12/*12*/,  4,          2 },
         [7] = { 0 }  /* Invalid */
     };
 
-- 
2.34.1


