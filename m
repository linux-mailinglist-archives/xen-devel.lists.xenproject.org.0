Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC5644F97
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 00:28:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455694.713236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2hLg-0003vM-Oj; Tue, 06 Dec 2022 23:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455694.713236; Tue, 06 Dec 2022 23:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2hLg-0003sR-LL; Tue, 06 Dec 2022 23:27:40 +0000
Received: by outflank-mailman (input) for mailman id 455694;
 Tue, 06 Dec 2022 23:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2hLf-0003sL-EF
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 23:27:39 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90cec592-75bd-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 00:27:37 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C8CC83200A59;
 Tue,  6 Dec 2022 18:27:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Dec 2022 18:27:34 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Dec 2022 18:27:32 -0500 (EST)
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
X-Inumbo-ID: 90cec592-75bd-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm1; t=1670369253; x=
	1670455653; bh=h4rpXV54xviy9PXu8HIU+FM+wV4xFpwC7kRcpMZ3ATI=; b=e
	1TktEsBBtzKOn9XhnR54+2Hh5zZuNFBa38/m+y+eoe20G7wWxC13+flzdmC5T3/O
	WBJm6AmUTGJmDyVY4Z4s71DdYnLS6F2APB1Yu7K6tXmfSBKSeCcnscupnoCz66Ez
	+iROF2hGiIXlik9ynRpR77hLNgiA13nDpqX04sFOIZLHqCe5SnnJvo0VyLYWVH5n
	L829zpNAF+LyqPaLGQPcRs7ViltDmrgLxmq2giGaP7RJF58b7p8GmNEd3jYMWAp+
	D6Dk/RPdFKJks++GGxBB1d0Qvqmmp1DQfrbtM7Xp2xf5j6nEaIn4T954k2b6+xIQ
	A4lLbtu1bJAY0+3IcHLnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1670369253; x=1670455653; bh=h4rpXV54xviy9PXu8HIU+FM+wV4xFpwC7kR
	cpMZ3ATI=; b=sGbPFA1C8KvHzsrj2xoEaJsCnC04mqop+hlBMdMM9agNZ3auKtH
	zgLHdFHNeRJeTP9pHiRfVSgsEbxpoZOPGq+U/v9HqPkCzeEPjnSejVreISECLQS/
	H4NTqR6Uo/DmxptE/cQgKE7UkeaspIOQqQwQYcG6U+G52UZ+1+NXwf6A6O8jWf5c
	vddxjidg5MHeGzgGNwXfdkAAyE5egYTZFS/RUZL8ow3l+OxXDty2myXYmny7b0vM
	dzezzyfWcZcYvCVI8pOKQQkX+7SxXcZsosZ30oneQ948usxtsOXFbbsOc8Jpz45j
	8RkGm2BZbwOc5eR/k1wh9gkVtzE4lSMCtMw==
X-ME-Sender: <xms:5M-PY_vJTKa27xb7ZTezUv89531qA4OSE_EVLffB48CRLMcB0UYb2w>
    <xme:5M-PYweeg_HTXMYZa6CdX13JSOiS8rOiqfWzWFT3Zh5sqaXCtmapYVwVW9lMiQag8
    jWDv3mXE6Mj1HQ>
X-ME-Received: <xmr:5M-PYyzr2MzPggmev1JlHa71DR3VLIy4HbiEj_8-kng84mg30tfLockFJGD-fUyOH349dOtYpPaj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcuofgr
    rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmqeenucggtffrrghtthgvrhhnpeehgeeuhffftdetvdegvdelhfeffeehgeel
    ueekveeuudfhtdejteefjefgfeehieenucffohhmrghinhepgigvnhhprhhojhgvtghtrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    uggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:5c-PY-MVGVW_YdddzR330m_q7iSEF-Uk9yWkc8NFOSJ7q7SFaPPNoA>
    <xmx:5c-PY_8H4Aj83FTDZdppL3gwFAm_HlvMgFsShcSKXWv_WshbJ3NYAw>
    <xmx:5c-PY-UdjRDBn2YWu6BqrebO_S_042yEYNzlAWJA9p00x8N5SRKAyg>
    <xmx:5c-PYyZ7gzqSAuW6bfMLnxwNV2qoDQP-szIG-orSj1mu20aRfwQnlw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Ard Biesheuval <ardb@kernel.org>,
	Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2] Use EfiACPIReclaimMemory for ESRT
Date: Tue,  6 Dec 2022 18:27:17 -0500
Message-Id: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A previous patch tried to get Linux to use the ESRT under Xen if it is
in memory of type EfiRuntimeServicesData.  However, this turns out to be
a bad idea.  Ard Biesheuvel pointed out that EfiRuntimeServices* memory
winds up fragmenting both the EFI page tables and the direct map, and
that EfiACPIReclaimMemory is a much better choice for this purpose.

Link: https://lists.xenproject.org/archives/html/xen-devel/2022-09/msg01365.html
Fixes: dc7da0874ba4 ("EFI: preserve the System Resource Table for dom0")
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Should this be included in 4.17?  It is a bug fix for a feature new to
4.17, so I suspect yes, but it is ultimately up to Henry Wang.

 xen/common/efi/boot.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index db0340c8e2628314226c618dda11ede4c62fdf3b..b3de1011ee58a67a82a94da050eb1343f4e37faa 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -601,11 +601,14 @@ static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
     if ( physical_start > esrt || esrt - physical_start >= len )
         return 0;
     /*
-     * The specification requires EfiBootServicesData, but accept
-     * EfiRuntimeServicesData, which is a more logical choice.
+     * The specification requires EfiBootServicesData, but also accept
+     * EfiRuntimeServicesData (for compatibility with buggy firmware)
+     * and EfiACPIReclaimMemory (which will contain the tables after
+     * successful kexec).
      */
     if ( (desc->Type != EfiRuntimeServicesData) &&
-         (desc->Type != EfiBootServicesData) )
+         (desc->Type != EfiBootServicesData) &&
+         (desc->Type != EfiACPIReclaimMemory) )
         return 0;
     available_len = len - (esrt - physical_start);
     if ( available_len <= offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries) )
@@ -1144,18 +1147,19 @@ static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
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

