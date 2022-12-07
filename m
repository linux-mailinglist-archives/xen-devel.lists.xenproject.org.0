Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B5D646435
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 23:42:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456692.714477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p337M-0006Oz-DC; Wed, 07 Dec 2022 22:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456692.714477; Wed, 07 Dec 2022 22:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p337M-0006MS-AV; Wed, 07 Dec 2022 22:42:20 +0000
Received: by outflank-mailman (input) for mailman id 456692;
 Wed, 07 Dec 2022 22:42:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sV5z=4F=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p337L-0006MM-KD
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 22:42:19 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67509cf3-7680-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 23:42:18 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C502F5C00EB;
 Wed,  7 Dec 2022 17:42:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Dec 2022 17:42:17 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 17:42:17 -0500 (EST)
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
X-Inumbo-ID: 67509cf3-7680-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm1; t=1670452937; x=
	1670539337; bh=JXJ/aYg9pvsjAhKHgg6ks0+NTz6WwePXt39oZO6w6UM=; b=i
	YOXY4iTREWynd/X806trb16t98GsspiUvOasaJxAq6n+6FhaCf8mI8RQVWriRceH
	76OZwcDISQcJFhqXMITxbYrwguvOR9A0UKXrN6BqUBa8JgjcOG1cF96ObwZinRCc
	7rLE9uazHn3gx9z3LjoWEb3TZkcyUQzCTBvY9NU8kErywc3rBfw1lHjPqzUt778Y
	4cWJT3huXJGAWbekOLBkYh/ws0NC2ittCw28rfSBM1ECfMTLKicQdIdmH+Fymj4b
	j0UlR99uRuibR2zDLzP3EQpQikOQWBM1h1If0TS5EexgtI/jkEKWWFFwRYynZ+88
	nkl8RlmkycZiqlJZ8qPNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1670452937; x=1670539337; bh=JXJ/aYg9pvsjAhKHgg6ks0+NTz6WwePXt39
	oZO6w6UM=; b=I60NmaJ/xKR5hPA8XdllIUrSEMDori5gBNWDkOTQAYlGt4XD+dt
	QVYfAtIDd+cyM6qsgACT0vq070MTkVGhAIvSBFJwIzvD/n/RJ4Uyi78fB32Z9dga
	q3hVEFVe4iomsr9JuvuvP9zl0/MPa9AWA0edxOEPRMAQeiyYqiW+baokIPQncyni
	gW49VMUoKiPo5n/2NVsomhjymgKopZ75icgZYADhX1S4ogEP+IJU/N36gS/T2Z43
	h1kNV1fG/roEDUXMLNrDXoyFq0FwKE6uDX1CtZdsQcLLi3vZqLF+K5dhp/9JlpuD
	lElmGdncePEa4O4H/GKXFag7A1NqC7FXJcw==
X-ME-Sender: <xms:yRaRYz7FLb6ugTxEuevYVsDPxg4qYXpwKSFlDRG0e8VfdPmW4fLRow>
    <xme:yRaRY47L0Pl6wNZDSNQbOGCNdyiDA-Pb_9k5009C1sraKZwB9DgMgvEwwdpUNA4xW
    RAuvnwnsqmEG9w>
X-ME-Received: <xmr:yRaRY6eXELeC_vY1DWp1aWxj4Pns-BuVqY0M_wa5y1Eov7Rhl0qgbgyfnSr81NMxXPIzeyrrl1gU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcuofgr
    rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmqeenucggtffrrghtthgvrhhnpeehgeeuhffftdetvdegvdelhfeffeehgeel
    ueekveeuudfhtdejteefjefgfeehieenucffohhmrghinhepgigvnhhprhhojhgvtghtrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    uggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:yRaRY0IIKL-tJ3UumReSY_bIf04OQZakHCviQjC-7Rng5iC5WGPUsw>
    <xmx:yRaRY3KUknD93T_kmihHZ4c0SIg4BI7boYCisssbLUHVjEkv8eALkA>
    <xmx:yRaRY9w8xtU_WHZsx5YeZyk88lVznze03J1MS8ka-8DBwSvqWu9llw>
    <xmx:yRaRY_3hzgMylRjc8jSd_pHbGsMntoCKhs36H1SnBHwDpeHz6DCVUw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Ard Biesheuval <ardb@kernel.org>,
	Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
Date: Wed,  7 Dec 2022 17:42:12 -0500
Message-Id: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A previous patch tried to get Linux to use the ESRT under Xen if it is
in memory of type EfiRuntimeServicesData.  However, EfiRuntimeServices*
memory needs to be included in the EFI page tables, so it is best to
minimize the amount of memory of this type.  Since EFI runtime services
do not need access to the ESRT, EfiACPIReclaimMemory is a better choice.

Link: https://lists.xenproject.org/archives/html/xen-devel/2022-09/msg01365.html
Fixes: dc7da0874ba4 ("EFI: preserve the System Resource Table for dom0")
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
Should this be included in 4.17?  It is a bug fix for a feature new to
4.17, so I suspect yes, but it is ultimately up to Henry Wang.  The code
is identical to v2, but I have improved the commit message.

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

