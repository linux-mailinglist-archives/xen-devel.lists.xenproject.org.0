Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CDA392E13
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 14:35:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133139.248242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFEW-0007j9-P4; Thu, 27 May 2021 12:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133139.248242; Thu, 27 May 2021 12:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFEW-0007gk-LI; Thu, 27 May 2021 12:35:28 +0000
Received: by outflank-mailman (input) for mailman id 133139;
 Thu, 27 May 2021 12:35:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmFEV-0007ge-Bf
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 12:35:27 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 832eeafd-88b1-4951-95ea-f636978a74e7;
 Thu, 27 May 2021 12:35:26 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A29BE218DD;
 Thu, 27 May 2021 12:35:25 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 72E3B11A98;
 Thu, 27 May 2021 12:35:25 +0000 (UTC)
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
X-Inumbo-ID: 832eeafd-88b1-4951-95ea-f636978a74e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622118925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gqg+pjRYzvrnv7dX+llGzQkhdttXtK16oe9Z8AMg9RY=;
	b=taBtAtRvmeS/XJaxTuCZlR6WQZ2Hi+LLSwxGHHoRDfnuZV5ysOnnt3FvDK80R8EO5vgleO
	y0gQ2oIpA3hpmJVITyX4M7jqy0aBgCCbcopTv8QNuNIA5geExhxMysP/zSu/dyFXn59p1V
	3HmNMpi0ABiccNfotuUqqf3Jceedcbo=
Subject: [PATCH v2 10/12] video/vesa: drop "vesa-mtrr" command line option
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Message-ID: <10607087-9216-c5fb-08cd-29090a80e402@suse.com>
Date: Thu, 27 May 2021 14:35:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Now that we use ioremap_wc() for mapping the frame buffer, there's no
need for this option anymore. As noted in the change introducing the
use of ioremap_wc(), mtrr_add() didn't work in certain cases anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -6,9 +6,10 @@ The format is based on [Keep a Changelog
 
 ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
-### Removed
+### Removed / support downgraded
  - XENSTORED_ROOTDIR environment variable from configuartion files and
    initscripts, due to being unused.
+ - dropped support for the (x86-only) "vesa-mtrr" command line option
 
 ## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
 
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2369,9 +2369,6 @@ cache-warming. 1ms (1000) has been measu
 ### vesa-map
 > `= <integer>`
 
-### vesa-mtrr
-> `= <integer>`
-
 ### vesa-ram
 > `= <integer>`
 
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1816,8 +1816,6 @@ void __init noreturn __start_xen(unsigne
 
     local_irq_enable();
 
-    vesa_mtrr_init();
-
     early_msi_init();
 
     iommu_setup();    /* setup iommu if available */
--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -145,38 +145,6 @@ void __init vesa_init(void)
     video_puts = lfb_redraw_puts;
 }
 
-#include <asm/mtrr.h>
-
-static unsigned int vesa_mtrr;
-integer_param("vesa-mtrr", vesa_mtrr);
-
-void __init vesa_mtrr_init(void)
-{
-    static const int mtrr_types[] = {
-        0, MTRR_TYPE_UNCACHABLE, MTRR_TYPE_WRBACK,
-        MTRR_TYPE_WRCOMB, MTRR_TYPE_WRTHROUGH };
-    unsigned int size_total;
-    int rc, type;
-
-    if ( !lfb || (vesa_mtrr == 0) || (vesa_mtrr >= ARRAY_SIZE(mtrr_types)) )
-        return;
-
-    type = mtrr_types[vesa_mtrr];
-    if ( !type )
-        return;
-
-    /* Find the largest power-of-two */
-    size_total = vram_total;
-    while ( size_total & (size_total - 1) )
-        size_total &= size_total - 1;
-
-    /* Try and find a power of two to add */
-    do {
-        rc = mtrr_add(lfb_base(), size_total, type, 1);
-        size_total >>= 1;
-    } while ( (size_total >= PAGE_SIZE) && (rc == -EINVAL) );
-}
-
 static void lfb_flush(void)
 {
     __asm__ __volatile__ ("sfence" : : : "memory");
--- a/xen/include/asm-x86/setup.h
+++ b/xen/include/asm-x86/setup.h
@@ -25,10 +25,8 @@ void init_IRQ(void);
 
 #ifdef CONFIG_VIDEO
 void vesa_init(void);
-void vesa_mtrr_init(void);
 #else
 static inline void vesa_init(void) {};
-static inline void vesa_mtrr_init(void) {};
 #endif
 
 int construct_dom0(


