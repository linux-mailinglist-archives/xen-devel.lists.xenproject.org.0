Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id v09bBaWB12knPAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 12:38:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CC93C9385
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 12:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276970.1562272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAmm2-0002m5-TY; Thu, 09 Apr 2026 10:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276970.1562272; Thu, 09 Apr 2026 10:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAmm2-0002kN-Qt; Thu, 09 Apr 2026 10:38:10 +0000
Received: by outflank-mailman (input) for mailman id 1276970;
 Thu, 09 Apr 2026 10:38:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wAmm1-0002jk-9c
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:38:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAmm0-0057LG-Lp
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:38:08 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69d78180-bab6-0a2a0a5309dd-0a2a4507a80c-48
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 12:38:08 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69d78190-ba2d-0a2a45070019-d155802acc77-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 12:38:08 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso7337415e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 03:38:08 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cf9e8ab4sm51656205e9.4.2026.04.09.03.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 03:38:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1775731088; x=1776335888; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BWtbECe/XUd0HxH1vJMgRw9c9RVMkiBpDggLMjIbDLg=;
        b=VLYyF5UNwtvWDqs5VZanTAvIx3VA/bnkDdNMoU4tfIOnWqxywcyjTfI4aVy10pm/Q7
         GcKJDdx6EI7rjFRKuNbxE6usd6EzFJnaJBbSLJ+frmDZwhOp/rw4xpoXLafygd82CJvu
         wNUnrh7tOMf/b8bfYuokqQWet4DQGxFw7G3lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775731088; x=1776335888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWtbECe/XUd0HxH1vJMgRw9c9RVMkiBpDggLMjIbDLg=;
        b=PrbMOe7RvIUCaXg3qumPKttRWBGU2vMOFV3s+jJ54Z+oI3YSFuPs9oQi1lg7XUQ3lQ
         pLZTxqcwIrwVrQY0L3l2ruby2TjGIiU6DvdLmiA+/JqFLrK8M61rtq/PImPL34SQyYz4
         S5UK0t8+xW2CxxFg0CJzcPI/mLD0m9IpSqnIbXK7vFb2J997fwqATBpr6q2B3HsFG3dD
         WMEpScNW0Mos7v9N1IOmULUHhs83YRyPTRtI6ZbKL+FH+RoWs6IWsw4KFb9xBP35x8/W
         L1y2cq1lpOFlmegkS6va6GkC7bNx8nDDP/uPCdujx3RMv1vyf1rC3T+Kmw7JQHOZpzwA
         zXKA==
X-Gm-Message-State: AOJu0YyozXk/kb3fGQceAX+XNnAKpajKGQhKfo2OLYMciuqwkZSoQPAn
	0CuqwIOqce0KXZ4gUv9wZ4hdPZFneVAomBZQM4dwuuHbDhwByCEvIrSY97HbMF0vDOfqKcMTZek
	TzUZD4evnTw==
X-Gm-Gg: AeBDievV+ZWbhcWdBuEiMdMQuXthuO1oHtSRPnz+YzhV/8dEp+S/VcQKki9Ig9ep+QJ
	snnpskQzBAiuNwAehMswZqHHyx6yYfrTSW9flK7JOi+epGM2MGyQNdbZbm0IMHrUpe9rStmF+sn
	dOZfPY6Mm76dxCcleWzft6GSvwGGdwx7io1fl4MuzgL7Zsn1xd577Iura3czluxV0QsXp8XdZ6y
	lun2dDwWr+ddyMUhp3vV2dxd8tHFyaGW5Ms6fYOihxKHfll9x5WeuoEBZGa54TB6jpT/13dzIVU
	0DLgpLJ2OPJm4ADNGUMd6nmzrPCFtpmnXjCIpmUQvmWJ03phsmhuDrypewFcFtLnaBM0N760Z+K
	TqBZGUjqbl2iTKdTtjVAx07umioFyAZm7byTkDXwpygRWtzITWs2fJN2y8XHb1KRj5eOZGhHGwr
	sTrD1XIPFDHFULAL2AdB5lILZauM71tyQQmZDUNoVcaTqGEjv9D+p50wNjYqOfWgnRKDScTGVZV
	1P8rZFT2pkEZkk=
X-Received: by 2002:a05:600c:548d:b0:485:3423:727d with SMTP id 5b1f17b1804b1-488cd068ce8mr37261955e9.26.1775731087507;
        Thu, 09 Apr 2026 03:38:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] xen/efi: Reduce ifdefary in efi_exit_boot()
Date: Thu,  9 Apr 2026 11:38:05 +0100
Message-Id: <20260409103805.176240-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1775731088-8955341E-7A655351/0/0
X-purgate-type: clean
X-purgate-size: 3596
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 73CC93C9385
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use IS_ENABLED() rather than #ifdef to give the compiler visibility into the
block, which in turn removes the #ifdef from the varaible block.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

Best viewed with git show --ignore-all-space

XenServer has been carrying a patch with a typo in this block for a long time,
going entirely unnoticed.
---
 xen/common/efi/boot.c | 47 +++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 0ddc7bfd1277..7445f88902cd 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1335,9 +1335,7 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
     EFI_STATUS status;
     UINTN info_size = 0, map_key;
     bool retry;
-#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
     unsigned int i;
-#endif
 
     efi_bs->GetMemoryMap(&info_size, NULL, &map_key,
                          &efi_mdesc_size, &mdesc_ver);
@@ -1371,31 +1369,32 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
     if ( EFI_ERROR(status) )
         PrintErrMesg(L"Cannot exit boot services", status);
 
-#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
-    for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
+    if ( IS_ENABLED(CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP) )
     {
-        EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
+        for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
+        {
+            EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
 
-        /*
-         * Runtime services regions are always mapped here.
-         * Attributes may be adjusted in efi_init_memory().
-         */
-        if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
-             desc->Type == EfiRuntimeServicesCode ||
-             desc->Type == EfiRuntimeServicesData )
-            desc->VirtualStart = desc->PhysicalStart;
-        else
-            desc->VirtualStart = INVALID_VIRTUAL_ADDRESS;
-    }
-    status = efi_rs->SetVirtualAddressMap(efi_memmap_size, efi_mdesc_size,
-                                          mdesc_ver, efi_memmap);
-    if ( status != EFI_SUCCESS )
-    {
-        printk(XENLOG_ERR "EFI: SetVirtualAddressMap() failed (%#lx), disabling runtime services\n",
-               status);
-        __clear_bit(EFI_RS, &efi_flags);
+            /*
+             * Runtime services regions are always mapped here.
+             * Attributes may be adjusted in efi_init_memory().
+             */
+            if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
+                 desc->Type == EfiRuntimeServicesCode ||
+                 desc->Type == EfiRuntimeServicesData )
+                desc->VirtualStart = desc->PhysicalStart;
+            else
+                desc->VirtualStart = INVALID_VIRTUAL_ADDRESS;
+        }
+        status = efi_rs->SetVirtualAddressMap(efi_memmap_size, efi_mdesc_size,
+                                              mdesc_ver, efi_memmap);
+        if ( status != EFI_SUCCESS )
+        {
+            printk(XENLOG_ERR "EFI: SetVirtualAddressMap() failed (%#lx), disabling runtime services\n",
+                   status);
+            __clear_bit(EFI_RS, &efi_flags);
+        }
     }
-#endif
 
     /* Adjust pointers into EFI. */
     efi_ct = (const void *)efi_ct + DIRECTMAP_VIRT_START;
-- 
2.39.5


