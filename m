Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKqCA52hnGnqJgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 19:51:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA4D17BD79
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 19:51:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239324.1540759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vub1I-0003Dl-Mw; Mon, 23 Feb 2026 18:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239324.1540759; Mon, 23 Feb 2026 18:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vub1I-0003Aq-J9; Mon, 23 Feb 2026 18:51:00 +0000
Received: by outflank-mailman (input) for mailman id 1239324;
 Mon, 23 Feb 2026 18:50:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpp4=A3=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vub1H-0003Ah-6x
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 18:50:59 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96603993-10e8-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 19:50:56 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-483abed83b6so14918335e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 10:50:56 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31b3e0dsm437506635e9.1.2026.02.23.10.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 10:50:55 -0800 (PST)
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
X-Inumbo-ID: 96603993-10e8-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771872656; x=1772477456; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBMCNSa4a+AReIUFX7/nPT/pd9bL8KLMQ3ahjP9iaXY=;
        b=ZSWr8bf3ri5vbzrfni0Vx4QZ2OJYFW6coBdf8TTM4mgK6robonPpcrLQ01njC9F5bO
         2IhI2DAGxsCvauFPgqAKoKvsNR6x8Ht1XD9D1EwKokAC+2I31Gx92SsuV/+wmm66PA49
         4hxE4/XziekCeK0WKxfYhHIbnDkzk+01NJX3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771872656; x=1772477456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBMCNSa4a+AReIUFX7/nPT/pd9bL8KLMQ3ahjP9iaXY=;
        b=foEL9fatO8ldDQjEVKoFFc7wOCzqMhiumpYXJtymUZ5BUp/k4vXMAngLWmKhQgV7TF
         prfkLwbGL9rERnjNl3Ij2AW5XBhkU2oLY83EVnpF3p80+k3CJZ6qKU7LlQJmdTBm5M8+
         xbY6HxZGnFFLl8jzcwFpAQDjYDPR987/lZShaVPse9FhboaHJQs8gfWjyR6Zyc3LVgg3
         pTj2yrc4h4FxbFnusEYlcTRR68tfzIHZDj9Ua2r2vyyyAGoaFHDoVPtBZIPBNQutJATa
         JZOjJk6bL0KkO0RkI8vfk5Mu2a4lULQKIfizO+r+YxOMbmDAyhJbrEByOGV/17Vtc9zi
         Igpw==
X-Gm-Message-State: AOJu0YzQMldfm0dCwLmn2YrdPFbzrRYAYtzrNJGTlQBQa/7MnJKH6fxL
	ix/rwtfZU9PfgKXuzYJngYQFUQwc7a2A2TTVcDPLOK0eAeLXj7lg6dWahaN9/49rCD+sgVGg99p
	nUL0q7rzg443x
X-Gm-Gg: AZuq6aLyZ/ZtbuJiGBRrwyMQM33aStc8cxGsjGj0dzMeu7xDzsnsM6KdRZXChUXu/Uv
	jlUZ9yBff1WjTeQB4TjQb6njiqYJp66hxZRTilTobiznVrnkfwupqEU7THN3sX8FyTC56OWZyVZ
	VcLQ0A+sZHn2nNr8beZ8WR/hpCHrsC5u6TGOvcBDhb09bYdBfEl2OnUmqEyxisIflceuMgasl65
	ZSvwzlKaq1xKViK/1P+aqAVb+yCNGMJrUewWSEOSXC5OlySAfWjqA4WxAK4cl8nrQ9PCO7y7jnu
	IMrMYBxapvRTECsuQK1njXixuX0P2gErTztyMKyRfKA+jcLHZssLBR6wn8WJmczUe0DKwmbSVm/
	4tDrLf2CKAjOpv8YrcmmNC5/RBILbYjQnyj36AqjbsWKRP8NmDcobDO/f88U+F05DsMRlPXXmCV
	iSPGQTi7+9S1SwPXCWQD3kSesqv81oRieSPfDLgffL9/HCdRWtsFy0IBPHcU9sjYngXhBZgk0=
X-Received: by 2002:a05:600c:46c9:b0:483:a21:774c with SMTP id 5b1f17b1804b1-483a95eab7cmr164231635e9.25.1771872655776;
        Mon, 23 Feb 2026 10:50:55 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/ucode: Support discrete modules being CPIO archives
Date: Mon, 23 Feb 2026 18:50:54 +0000
Message-Id: <20260223185054.3598305-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,keepachangelog.com:url,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6FA4D17BD79
X-Rspamd-Action: no action

Multiple downstream distros have tried passing discrete CPIO archives and
tripped over this not working.  It turns out to be easy to support, so do so.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

v2:
 * Docs update too.
 * Set opt_scan in early_microcode_load() so microcode_init_cache() operates
   properly
---
 CHANGELOG.md                      |  1 +
 docs/misc/xen-command-line.pandoc | 19 ++++++++-----------
 xen/arch/x86/cpu/microcode/core.c | 20 +++++++++++++++++++-
 3 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 18f3d10f20d2..c191e504aba9 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -13,6 +13,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Support for Bus Lock Threshold on AMD Zen5 and later CPUs, used by Xen to
      mitigate (by rate-limiting) the system wide impact of an HVM guest
      misusing atomic instructions.
+   - Support for CPIO microcode in discrete multiboot modules.
 
 ### Removed
  - On x86:
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index c1f2def9f99c..ebdca007d26b 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2764,23 +2764,20 @@ Controls for CPU microcode loading, available when `CONFIG_MICROCODE_LOADING`
 is enabled.
 
 In order to load microcode at boot, Xen needs to find a suitable update
-amongst the modules provided by the bootloader.  Two kinds of microcode update
-are supported:
+amongst the modules provided by the bootloader.  Two formats are supported:
 
  1. Raw microcode containers.  The format of the container is CPU vendor
     specific.
 
- 2. CPIO archive.  This is Linux's preferred mechanism, and involves having
-    the raw containers expressed as files
+ 2. CPIO archive, which involves having the raw containers expressed as files
     (e.g. `kernel/x86/microcode/{GenuineIntel,AuthenticAMD}.bin`) in a CPIO
-    archive, typically prepended to the initrd.
+    archive.  Linux commonly prepends this to the initrd.
 
-The `<integer>` and `scan=<bool>` options are mutually exclusive and select
-between these two options.  Further restrictions exist for booting xen.efi
-(see below).
+The `<integer>` and `scan=<bool>` options are mutually exclusive and work as
+follows.  Further restrictions exist for booting xen.efi (see below).
 
- *  The `<integer>` option nominates a specific multiboot module as a raw
-    container (option 1 above).  Valid options start from 1 (module 0 is
+ *  The `<integer>` option nominates a specific multiboot module as containing
+    microcode in either format.  Valid options start from 1 (module 0 is
     always the dom0 kernel).  A negative number may be used, and will
     back-reference from the end of the module list.  i.e. `ucode=-1` will
     nominate the final multiboot module.
@@ -2794,7 +2791,7 @@ When booting xen.efi natively, the concept of multiboot modules doesn't exist.
 Instead:
 
  *  In the [EFI configuration file](efi.html), `ucode=<filename>` can be used
-    to identify a file as a raw container (option 1 above).  Use of this
+    to identify a file as containing microcode in either format.  Use of this
     mechanism will disable both `<integer>` and `scan=`.
 
  *  If `ucode=<filename>` in the EFI configuration file is not used, it is
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index ea0b35c4991d..9b8d1e09cb98 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -767,6 +767,7 @@ static int __init early_microcode_load(struct boot_info *bi)
     void *data = NULL;
     size_t size;
     const struct microcode_patch *patch;
+    struct cpio_data cd;
     int idx = opt_mod_idx;
     int rc;
 
@@ -783,7 +784,6 @@ static int __init early_microcode_load(struct boot_info *bi)
         for ( idx = 0; idx < bi->nr_modules; ++idx )
         {
             const struct boot_module *bm = &bi->mods[idx];
-            struct cpio_data cd;
 
             /* Search anything unclaimed or likely to be a CPIO archive. */
             if ( bm->kind != BOOTMOD_UNKNOWN && bm->kind != BOOTMOD_RAMDISK )
@@ -851,6 +851,24 @@ static int __init early_microcode_load(struct boot_info *bi)
                    idx, size);
             return -ENODEV;
         }
+
+        /*
+         * If this blob appears to be a CPIO archive, try interpreting it as
+         * one.  Otherwise treat it as a raw vendor blob.
+         */
+        cd = find_cpio_data(ucode_ops.cpio_path, data, size);
+        if ( cd.data )
+        {
+            data = cd.data;
+            size = cd.size;
+
+            /*
+             * (Ab)use opt_scan to inform microcode_init_cache() that
+             * early_mod_idx refers to a CPIO archive.
+             */
+            opt_scan = true;
+        }
+
         goto found;
     }
 

base-commit: 5eb84d6c992cf4e81936872c441b649057947442
-- 
2.39.5


