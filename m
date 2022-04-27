Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB01651146F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314681.532882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJ5-0000Dx-DC; Wed, 27 Apr 2022 09:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314681.532882; Wed, 27 Apr 2022 09:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJ5-0000Ai-9T; Wed, 27 Apr 2022 09:49:59 +0000
Received: by outflank-mailman (input) for mailman id 314681;
 Wed, 27 Apr 2022 09:49:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTRx=VF=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1njeJ3-0008Li-MM
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:49:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 64f5fa1a-c60f-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 11:49:56 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5F7A1480;
 Wed, 27 Apr 2022 02:49:55 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.13.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEFA23F774;
 Wed, 27 Apr 2022 02:49:54 -0700 (PDT)
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
X-Inumbo-ID: 64f5fa1a-c60f-11ec-8fc2-03012f2f19d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 2/8] efi/boot.c: Remove unused-but-set variable
Date: Wed, 27 Apr 2022 11:49:35 +0200
Message-Id: <20220427094941.291554-3-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427094941.291554-1-michal.orzel@arm.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function efi_start defines and sets a variable size but does not
make use of it. Remove this variable.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/common/efi/boot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index ac1b235372..a25e1d29f1 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1226,9 +1226,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
     {
         EFI_FILE_HANDLE dir_handle;
         EFI_HANDLE gop_handle;
-        UINTN depth, cols, rows, size;
+        UINTN depth, cols, rows;
 
-        size = cols = rows = depth = 0;
+        cols = rows = depth = 0;
 
         if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode,
                                &cols, &rows) == EFI_SUCCESS )
-- 
2.25.1


