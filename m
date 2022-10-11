Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AD95FAB49
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 05:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419422.664197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oi69q-0004hC-PC; Tue, 11 Oct 2022 03:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419422.664197; Tue, 11 Oct 2022 03:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oi69q-0004e2-MV; Tue, 11 Oct 2022 03:42:18 +0000
Received: by outflank-mailman (input) for mailman id 419422;
 Tue, 11 Oct 2022 03:42:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xsRG=2M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oi69o-0004dw-61
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 03:42:16 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0cda750-4916-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 05:42:13 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EFE665C0151;
 Mon, 10 Oct 2022 23:42:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 10 Oct 2022 23:42:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 23:42:11 -0400 (EDT)
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
X-Inumbo-ID: b0cda750-4916-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1665459731; x=1665546131; bh=PNRzeYBxnqmwQZTl997sPEK/gSvhfY9baZ4
	KGgodxYk=; b=NUsRfSiQHRdJpvyEuXFl0W3rLydfl68+aLCgmUKBS/KGQCZMfKU
	c/oajzF/woMQzNTW5jjMdsQ/bgnBiR4rl90TOeLb5x6/31h+YeCRjmHonNRmGVtR
	miM+AEKPxjPRLI26+V9tOfIeN/tqIczQttgtucP/ipb6OhPF8wC07IpDO2vWbXfJ
	hOgv13YkOTCvMzaesN/adJS+W4qSpucfcPKXIDQt/QBCu7uR/teCRvHYPhRLi54I
	mH4gEOAscAAmJzfaAkap6QkuloOtTkxbbWnFgz5V5vMZNyo9rgEA68N51hgsY1wm
	FHr2dYPszgnzAC/R6YLFTVuZtcnK0N+HUsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1665459731; x=1665546131; bh=PNRzeYBxnqmwQ
	ZTl997sPEK/gSvhfY9baZ4KGgodxYk=; b=fxu690SRE8UDM/+dQ9J4CwvlydXFg
	g4S0qhCXW2FKOJfsUaAl/b+W5gK9KdVZGPcYZEd2xe10fjSw6rCG9/8c+NbapH7G
	1XSkQQLe8zSw+6TN1vnkKy96R2sOcCpfygofWCOzvkcXXb5jiJyc7tAU283PjNH+
	y9fISvzvSBTDaguVwMH/QfKRFTipfPvuy2CQRTImpYKFZBlR6wEDlt3xyVO/MikO
	r9eFzRssDE65zTkrQbONYzAHLXzlzoUzBWKYcrTQj7alyOI2RITHSUGlrOB/0pfm
	ZrJ2WFgssnqA/lq/DJ1uZX97232dldU+UFwoNk+Nk2pEMvWr7w0ZU1EWQ==
X-ME-Sender: <xms:E-ZEY4YFNpKsmm5rXdvgOXVSxAVTt62gWD3RMYgYa9Xw0vIpzezyQg>
    <xme:E-ZEYzbadF1SHzg8tnZF0OWihgn4ZufYOXpSHvxEpD8VF6AaY09nY4vUg2zqUyquc
    9EqTgwIUoioh0I>
X-ME-Received: <xmr:E-ZEYy_F9btHzcM5GLgEDSDNs9_EVSD4A8zkzbjHlhUbIWDD-G9h6gMGwX52StUEd-VXdSzaDQ2K>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejhedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfeltddtgedvtdefvdelteehtdeh
    teeugfdtjeehleffkedvjeevkeejkeekgfenucffohhmrghinhepgigvnhhprhhojhgvtg
    htrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:E-ZEYyqbBKUy2NQ4LHNNtCEy4YRqR4TL6M00xyh5OeC7O8zMX91jHg>
    <xmx:E-ZEYzqRWRlpFwX8GtDZ3nq7CGOIpZCRtcz4OJhV2wtZQ3YO2dUltA>
    <xmx:E-ZEYwSO-_EyvTHtwSHGC3QD4NuVaJp12Pjtbfb9PYYQwhojItw80Q>
    <xmx:E-ZEY8AhYMCbDrPyAD2mjjn8mJXNGNvkS_t922JXde5zH23rjVHM1g>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Ard Biesheuval <ardb@kernel.org>
Subject: [PATCH v2] Use EfiACPIReclaimMemory for ESRT
Date: Mon, 10 Oct 2022 23:42:03 -0400
Message-Id: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A previous patch tried to get Linux to use the ESRT under Xen if it is
in memory of type EfiRuntimeServicesData.  However, this turns out to be
a bad idea.  Ard Biesheuvel pointed out that EfiRuntimeServices* memory
winds up fragmenting both the EFI page tables and the direct map, and
that EfiACPIReclaimMemory is a much better choice for this purpose.

Link: https://lists.xenproject.org/archives/html/xen-devel/2022-09/msg01365.html
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Changes since v1:

- Add link to Ard Biesheuvel’s post on xen-devel
- Expand comment to mention buggy firmware that place the ESRT in
  EfiBootServicesData.

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


