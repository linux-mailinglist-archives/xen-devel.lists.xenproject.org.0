Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73711392E16
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 14:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133147.248253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFFA-0008L8-2V; Thu, 27 May 2021 12:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133147.248253; Thu, 27 May 2021 12:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFF9-0008IO-VI; Thu, 27 May 2021 12:36:07 +0000
Received: by outflank-mailman (input) for mailman id 133147;
 Thu, 27 May 2021 12:36:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmFF8-0008Bu-BM
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 12:36:06 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e29f1ad8-fc4f-433a-905e-58fd79203c5f;
 Thu, 27 May 2021 12:35:55 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 94EED218DD;
 Thu, 27 May 2021 12:35:54 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 7A26411A98;
 Thu, 27 May 2021 12:35:54 +0000 (UTC)
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
X-Inumbo-ID: e29f1ad8-fc4f-433a-905e-58fd79203c5f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622118954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JCk3FBjjK8M9z1jIUmNcbjwmgv39UQ+Tt+/agq7sJXk=;
	b=CwLdHgXTlzL4WPEEbXsEsixG1mmn4UZqKLjoaWkaBGf3DSCk/P8CmLo224FZA/2vi9m6ls
	TKO+TG4q4vYjIJZnsZCCWvsU3GZ7KKCwlyQCQChSb+INw2xvUcfU4+wCVyxrun6EvuRpIE
	QZ9vBsNlwEcQYdXTTEgfI0aQHwokkME=
Subject: [PATCH v2 11/12] video/vesa: drop "vesa-remap" command line option
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Message-ID: <bc1411cc-f920-a002-d64d-84ce1ebd080e@suse.com>
Date: Thu, 27 May 2021 14:35:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

If we get mode dimensions wrong, having the remapping size controllable
via command line option isn't going to help much. Drop the option.

While adjusting this also
- add __initdata to the variable,
- use ROUNDUP() instead of open-coding it.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,7 +9,7 @@ The format is based on [Keep a Changelog
 ### Removed / support downgraded
  - XENSTORED_ROOTDIR environment variable from configuartion files and
    initscripts, due to being unused.
- - dropped support for the (x86-only) "vesa-mtrr" command line option
+ - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap" command line options
 
 ## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
 
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2366,9 +2366,6 @@ PCPUs when using the credit1 scheduler.
 of a VCPU between CPUs, and reduces the implicit overheads such as
 cache-warming. 1ms (1000) has been measured as a good value.
 
-### vesa-map
-> `= <integer>`
-
 ### vesa-ram
 > `= <integer>`
 
--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -26,8 +26,7 @@ static bool_t vga_compat;
 static unsigned int vram_total;
 integer_param("vesa-ram", vram_total);
 
-static unsigned int vram_remap;
-integer_param("vesa-map", vram_remap);
+static unsigned int __initdata vram_remap;
 
 static int font_height;
 static int __init parse_font_height(const char *s)
@@ -79,12 +78,8 @@ void __init vesa_early_init(void)
      *                 use for vesafb.  With modern cards it is no
      *                 option to simply use vram_total as that
      *                 wastes plenty of kernel address space. */
-    vram_remap = (vram_remap ?
-                  (vram_remap << 20) :
-                  ((vram_vmode + (1 << L2_PAGETABLE_SHIFT) - 1) &
-                   ~((1 << L2_PAGETABLE_SHIFT) - 1)));
-    vram_remap = max_t(unsigned int, vram_remap, vram_vmode);
-    vram_remap = min_t(unsigned int, vram_remap, vram_total);
+    vram_remap = ROUNDUP(vram_vmode, 1 << L2_PAGETABLE_SHIFT);
+    vram_remap = min(vram_remap, vram_total);
 }
 
 void __init vesa_init(void)


