Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFFA5F144B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 23:02:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414428.658703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeN9H-0007HC-Ii; Fri, 30 Sep 2022 21:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414428.658703; Fri, 30 Sep 2022 21:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeN9H-0007EI-FZ; Fri, 30 Sep 2022 21:02:19 +0000
Received: by outflank-mailman (input) for mailman id 414428;
 Fri, 30 Sep 2022 21:02:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACJS=2B=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oeN9F-0007EC-NQ
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 21:02:17 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2759a43f-4103-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 23:02:15 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B958332009E9;
 Fri, 30 Sep 2022 17:02:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 30 Sep 2022 17:02:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Sep 2022 17:02:09 -0400 (EDT)
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
X-Inumbo-ID: 2759a43f-4103-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm2; t=1664571730; x=
	1664658130; bh=SrvXwx1KQz8zocMSydwkAX7BOT6io7TjAP4ceCsuvq8=; b=G
	cPez/6imDEcCLPKSAwMZ+T0mXC2WbOBpFAP+z614HahyyUV1BKV1Hz+rDp7nHx3o
	htUR83paP3zDWPFC+x3hX4QUMs1oVqKXHOMniWMEwdVCp1rf4DeqXZ/AU5ITnqvz
	0Sazg8evd0o8+aswiB8OfGrHwG1L+xhuvCkmBNE84RYHZod9Ub8XenfaYFg62v2P
	nKyCeTx42qOHf4LG+adBxDciKGofU4z8pSoFpXwoD6FVyHsSGxR/+1G/xlt7aKhT
	m36wefLKFDmiKYAwgIA7r3IoBS2A3r6SI9V6GLk+YuaOWbU/H5/4xDuEKDcxdD7P
	DyQASn74eJGt/7Kw6fbiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1664571730; x=1664658130; bh=SrvXwx1KQz8zocMSydwkAX7BOT6io7TjAP4
	ceCsuvq8=; b=DVuCfkM9aIsEGLGQR6GbcOmIdAowjXoErUnFdLwUYpPjvsnOCOX
	H7WukfPJb0hWaPrNkpwFGtv7P7hPERIzlcYXF5OUHJHPz4VUuAudvGbRVr9curRG
	vBPl2YtyHTnNqIeqymdlaQvtt8UKlZmkS0zVuCDPwYQ3MvpAvloLtX7B32zcIelc
	A0QMlt8+RrzWMnLxgzBLn7GFpEakSnZhHviKwqD/XDn4c6UGaKL7mFe0tjAgaVJc
	zLQ4luemYmLb0T+Qfns66GRAIN2tYGVqaGwHKIxGla1JsQIaiFpZmayJQdUTKS1q
	zS7QSwllnjS9yBkurZP6ea6acMAwYVW0gOA==
X-ME-Sender: <xms:Ulk3Y-DtHX6by9FbbkaA_W4vbXvq-2g925yES09-N3JLeCQ9x0Vcqg>
    <xme:Ulk3Y4ik62gVW-Pg7-bb_5zqrVc9xu1Z53l9VK1IB75IhQLdGDcunG6Cq8BASeDQn
    QKQUeMTsLSF16Y>
X-ME-Received: <xmr:Ulk3YxmW5_YbOmsfdaKNPYTYc63fCT4JdQ_Spf6CVn6gErxL8_g59zzEIFtHJOv9vAgwCps_D4dr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehvddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeegkedvkefgffegkefhieejtdff
    keehhfelheefjeeutefgleeggfdtveeileenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:Ulk3Y8zKZIMpFL3YYtqQjJ_BnoLsqKZWFNCS3UInhiictQJVZ6n4WQ>
    <xmx:Ulk3YzRlcZh_f_wfFdBObil-5BcmYb3gdRR2IbtlFiijGU--e_P9pw>
    <xmx:Ulk3Y3ZrC66f2ntE6vX3reulI6l5iivDSef-qDezXsWoWskqXBpayw>
    <xmx:Ulk3Y6LjxajOEj7wvVs8D1MMwXHgEWpnffprCzrTCdO-OLUVNlGzKg>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] Use EfiACPIReclaimMemory for ESRT
Date: Fri, 30 Sep 2022 17:02:02 -0400
Message-Id: <2561c7fc38d9b4d17cb0205fec49b941894cfcc0.1664570575.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed on xen-devel, using EfiRuntimeServicesData for more than is
absolutely necessary is a bad idea.
---
 xen/common/efi/boot.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index db0340c8e2628314226c618dda11ede4c62fdf3b..dba23439758d1e842d267dcd19448e0f9113b115 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -601,11 +601,13 @@ static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
     if ( physical_start > esrt || esrt - physical_start >= len )
         return 0;
     /*
-     * The specification requires EfiBootServicesData, but accept
-     * EfiRuntimeServicesData, which is a more logical choice.
+     * The specification requires EfiBootServicesData, but also accept
+     * EfiRuntimeServicesData (for compatibility) and EfiACPIReclaimMemory
+     * (which will contain the tables after successful kexec).
      */
     if ( (desc->Type != EfiRuntimeServicesData) &&
-         (desc->Type != EfiBootServicesData) )
+         (desc->Type != EfiBootServicesData) &&
+         (desc->Type != EfiACPIReclaimMemory) )
         return 0;
     available_len = len - (esrt - physical_start);
     if ( available_len <= offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries) )
@@ -1144,18 +1146,19 @@ static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
     for ( i = 0; i < info_size; i += mdesc_size )
     {
         /*
-         * ESRT needs to be moved to memory of type EfiRuntimeServicesData
+         * ESRT needs to be moved to memory of type EfiACPIReclaimMemory
          * so that the memory it is in will not be used for other purposes.
          */
         void *new_esrt = NULL;
-        size_t esrt_size = get_esrt_size(memory_map + i);
+        const EFI_MEMORY_DESCRIPTOR *desc = memory_map + i;
+        size_t esrt_size = get_esrt_size(desc);
 
         if ( !esrt_size )
             continue;
-        if ( ((EFI_MEMORY_DESCRIPTOR *)(memory_map + i))->Type ==
-             EfiRuntimeServicesData )
+        if ( desc->Type == EfiRuntimeServicesData ||
+             desc->Type == EfiACPIReclaimMemory )
             break; /* ESRT already safe from reuse */
-        status = efi_bs->AllocatePool(EfiRuntimeServicesData, esrt_size,
+        status = efi_bs->AllocatePool(EfiACPIReclaimMemory, esrt_size,
                                       &new_esrt);
         if ( status == EFI_SUCCESS && new_esrt )
         {
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

