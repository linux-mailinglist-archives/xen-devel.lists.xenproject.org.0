Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEED76D035
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574972.900632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzo-0006iJ-EG; Wed, 02 Aug 2023 14:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574972.900632; Wed, 02 Aug 2023 14:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzo-0006dO-AV; Wed, 02 Aug 2023 14:38:40 +0000
Received: by outflank-mailman (input) for mailman id 574972;
 Wed, 02 Aug 2023 14:38:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRCzm-0006bO-Pb
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:38:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 444042f5-3142-11ee-b260-6b7b168915f2;
 Wed, 02 Aug 2023 16:38:37 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 4A5D14EE0740;
 Wed,  2 Aug 2023 16:38:36 +0200 (CEST)
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
X-Inumbo-ID: 444042f5-3142-11ee-b260-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 01/11] x86/efi: move variable declaration to address MISRA C:2012 Rule 2.1
Date: Wed,  2 Aug 2023 16:38:07 +0200
Message-Id: <aa72e3371fa4ab4806cd866c569718d766d3142e.1690985045.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690985045.git.nicola.vetrini@bugseng.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable declaration is moved where it's actually used, rather
than being declared in the switch before any clause, thus being
classified as unreachable code.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/efi/efi-boot.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 92f4cfe8bd..b00441b1a2 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -390,8 +390,6 @@ static void __init efi_arch_edd(void)
         {
             switch ( DevicePathType(devp.DevPath) )
             {
-                const u8 *p;
-
             case ACPI_DEVICE_PATH:
                 if ( state != root || boot_edd_info_nr > EDD_INFO_MAX )
                     break;
@@ -463,7 +461,8 @@ static void __init efi_arch_edd(void)
                 params->device_path_info_length =
                     sizeof(struct edd_device_params) -
                     offsetof(struct edd_device_params, key);
-                for ( p = (const u8 *)&params->key; p < &params->checksum; ++p )
+                for ( const u8 *p = (const u8 *)&params->key;
+                      p < &params->checksum; ++p )
                     params->checksum -= *p;
                 break;
             case MEDIA_DEVICE_PATH:
-- 
2.34.1


