Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52654674207
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 20:04:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481276.746057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIaDB-0002dX-8x; Thu, 19 Jan 2023 19:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481276.746057; Thu, 19 Jan 2023 19:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIaDB-0002bV-2F; Thu, 19 Jan 2023 19:04:33 +0000
Received: by outflank-mailman (input) for mailman id 481276;
 Thu, 19 Jan 2023 19:04:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tmj6=5Q=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pIaD9-0002YR-Qf
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 19:04:31 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1943d3c7-982c-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 20:04:29 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A24985C0127;
 Thu, 19 Jan 2023 14:04:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 19 Jan 2023 14:04:28 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 14:04:27 -0500 (EST)
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
X-Inumbo-ID: 1943d3c7-982c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1674155068; x=1674241468; bh=iAve/Gqvno
	UrklJx76JsPi9tOXPhkOndFsIm/wBRVc0=; b=B9VLgkfAr/7249QjOT39QtxfRv
	APPspvfWvL6fuDe6zW3+pifMYFXwfEI+IGcd6gUisGfx3fFR6zwpKDMaFcGsDYjd
	E313x+xuAnRGczFIKTKMOChtctBXqmc7KzKo3eKA+re/WmlYCYEzxZMxfdJMugF7
	L6E5Oue7bH6z436+4IafefMY9ZYIdXrm0a0pjGxxf0FPEakxFQctWRIES4eWxWu2
	Yf1bT/5jTCGixgfl+wcrkXCnFrY+jh+29T2rd3PMNmGcXJAPEtDpj/vYpx7p38Kx
	Av4Co/J/ZoABgjw6cChO5T5eVpQcHljE6yFPj5cg52HtU5FY7DpLpMkBhwug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674155068; x=
	1674241468; bh=iAve/GqvnoUrklJx76JsPi9tOXPhkOndFsIm/wBRVc0=; b=Z
	udXHlylSgOZXsETO57hjNC/qoXFauOzCK1dNKjA2XSqYPrBllsHZT6ntMGWz2V8u
	BelrZMZiHOMJQ0s3hJEJLbFbg+ykRhWquY4QvBAisG5ELnH/6GAlzN7+u2BVTbjR
	FbQLjKCRdbVKbpASVWSl/TuT2wrbynC0GVo/e2T6+3ochP6KfXKvdw834ANEN9Xq
	wCuAdFe0k7K1XJVZSm6u9yL9wmGhdEj6s7F4PIkR3tc3qMjyZFxzQckvE2JnmyCM
	P7CYrNEsfzLupOPL+ruGD75A8cP8an4BLDTbCfW7i70MXTQ03Q7sxs/OCKAcrkPE
	yMSHDZ9+TMNlllnRUou0g==
X-ME-Sender: <xms:PJTJY_zuzXYRodxycES-1yHCoQVY_E-n56Ft67-UXy6yk7-4piKsaA>
    <xme:PJTJY3RFq7qLgmAgHECoOEaGwjpJBfDw_SbU9rNm24aRQ6dZ69wOZYuKP_xdQZkaE
    rrL9IpbHdjQruQ>
X-ME-Received: <xmr:PJTJY5Uio_FtDb9GTvtKgmylTuWFjOJiaCwVVMgFuKmUM1usPVb3MqzeMdVuYzlbrwsLhRLqk_uT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddutddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepffgv
    mhhiucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepledukeelleejkeevkeefgefh
    ffegvdeigeelieegjefffeeiveeivdejgeevteeinecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhn
    ghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:PJTJY5gDx88SFiFrhr4xC9pF-OoySYrpDeD9-o3p2ucJHNZP1FjgrA>
    <xmx:PJTJYxDcWqEH881XZ1H_C2JAhcqVC1tNqsaXSkFyN3L019FCxApJ1A>
    <xmx:PJTJYyKvDJWKAQEoQYNWHJOx-6BqdbdWtwsDzUG8FiRHYpwbEaJ8bQ>
    <xmx:PJTJYz0LxTt6btYPWmix9P1j-8Yckpu9atABFe-bV4wfbMe21L12wA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 4/5] efi: Actually enable the ESRT under Xen
Date: Thu, 19 Jan 2023 14:03:59 -0500
Message-Id: <26938d59bb398bea7e8f43d03a9c75189fa3b4cc.1669264419.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <b18879e0329c785d35f2aa2164413bb56419c684.1674153153.git.demi@invisiblethingslab.com>
References: <b18879e0329c785d35f2aa2164413bb56419c684.1674153153.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ESRT can be parsed if EFI_PARAVIRT is enabled, even if EFI_MEMMAP is
not.  Also allow the ESRT to be in reclaimable memory, as that is where
future Xen versions will put it.

Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 drivers/firmware/efi/esrt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/esrt.c b/drivers/firmware/efi/esrt.c
index fb9fb70e1004132eff50c712c6fca05f7aeb1d57..87729c365be1a804bb84e0b1ab874042848327b4 100644
--- a/drivers/firmware/efi/esrt.c
+++ b/drivers/firmware/efi/esrt.c
@@ -247,7 +247,7 @@ void __init efi_esrt_init(void)
 	int rc;
 	phys_addr_t end;
 
-	if (!efi_enabled(EFI_MEMMAP))
+	if (!efi_enabled(EFI_MEMMAP) && !efi_enabled(EFI_PARAVIRT))
 		return;
 
 	pr_debug("esrt-init: loading.\n");
@@ -258,7 +258,9 @@ void __init efi_esrt_init(void)
 	if (rc < 0 ||
 	    (!(md.attribute & EFI_MEMORY_RUNTIME) &&
 	     md.type != EFI_BOOT_SERVICES_DATA &&
-	     md.type != EFI_RUNTIME_SERVICES_DATA)) {
+	     md.type != EFI_RUNTIME_SERVICES_DATA &&
+	     md.type != EFI_ACPI_RECLAIM_MEMORY &&
+	     md.type != EFI_ACPI_MEMORY_NVS)) {
 		pr_warn("ESRT header is not in the memory map.\n");
 		return;
 	}
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

