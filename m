Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F194B8C38
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 16:16:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274219.469637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKM2m-0001Gv-MA; Wed, 16 Feb 2022 15:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274219.469637; Wed, 16 Feb 2022 15:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKM2m-0001FL-Hf; Wed, 16 Feb 2022 15:16:36 +0000
Received: by outflank-mailman (input) for mailman id 274219;
 Wed, 16 Feb 2022 15:16:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=miT7=S7=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nKM2l-0000ia-8g
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 15:16:35 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d7fc221-8f3b-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 16:16:34 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id c15so3779180ljf.11
 for <xen-devel@lists.xenproject.org>; Wed, 16 Feb 2022 07:16:34 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id bt2sm3082357lfb.93.2022.02.16.07.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 07:16:32 -0800 (PST)
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
X-Inumbo-ID: 6d7fc221-8f3b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+ORkUu56CU6HGY8oCapGyNoSUW812hUexJ6w29f/gaw=;
        b=cPsCuLNUCp/mAbeiTz7Ea9oexvjfKLEeXyM4EJ7w+M8wZJ7cW/CghjXa3J+Yqii44b
         yMuNZJpfCHjBeHzIVhtk5jph/ON+iuyGZnBG1bD/R28SRTGWoZeGceNfJZEyqvgQmvj4
         i7El2Mzpbn2z0yYz0KAXXbZ9jLBXYc3QgiuiOiVWIVZmPUL3WkCIEoWStTcO6DZ+rW6k
         U1TxrV/fjn1BoCkWZwiVd5MG2mO5lhAE1ssX1H8UsbKHz80ibLFZjn1EComdHg+fgHHj
         0Uxle6Y5n2etoFwX7Q1a+KY/C9enzTR55NXbXFprFqX7ekC4Yn1zU6eq9jkmXYBQzwrt
         FBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ORkUu56CU6HGY8oCapGyNoSUW812hUexJ6w29f/gaw=;
        b=laTvvgKMWeVlwCLCJOVqxVpG+EMRQtAoj4J8zLYcT7E2z1vwxwP7zXOeRlPKMePfu3
         /aflLHrdPUJbaKN3bZ54Hl/RbN490sfIEvgplNS46fTX7h+CdNx8yxJgPaJKEhEYfASU
         y1zOOm464Ku1MjhILiMe5lxSLsWIRzLSZodxk6+dgNdTaodSTXVRGj7i4Qkohdz+Iv34
         gH9EkgwPzLVCV7LIbdGg2e9n0B+h3hsbpCE89ekld8FbzuUXuPR92GtuWXk9w6XQBWiC
         StLftaV5yYmrWl7PA1nPRlkXSLP/BdbRttoAP7MT0uzO5PCbmcW/Hv61souK99Ga9P0V
         4jmw==
X-Gm-Message-State: AOAM531nqEp/xXh4zjnUkFrEAJkUtb54EXUC5MCiyqfg+Nvn1JKfnZbv
	PVUwmULszm7QHOKGnEc3SIdOzQ7D2q8=
X-Google-Smtp-Source: ABdhPJxDYrdyScCegh3iYn/DlxcOxXd/KOxJ/b5f2U0ecvwx/kfDsZpJ6qUQoFHk6MIe+Kfo1c4e5Q==
X-Received: by 2002:a2e:b891:0:b0:23a:ee88:844b with SMTP id r17-20020a2eb891000000b0023aee88844bmr2456330ljp.402.1645024593157;
        Wed, 16 Feb 2022 07:16:33 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 2/4] vpci: restrict unhandled read/write operations for guests
Date: Wed, 16 Feb 2022 17:16:26 +0200
Message-Id: <20220216151628.1610777-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216151628.1610777-1-andr2000@gmail.com>
References: <20220216151628.1610777-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

A guest would be able to read and write those registers which are not
emulated and have no respective vPCI handlers, so it will be possible
for it to access the hardware directly.
In order to prevent a guest from reads and writes from/to the unhandled
registers make sure only hardware domain can access the hardware directly
and restrict guests from doing so.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v6:
- do not use is_hwdom parameter for vpci_{read|write}_hw and use
  current->domain internally
- update commit message
New in v6
---
 xen/drivers/vpci/vpci.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index fb0947179b79..f564572a51cb 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -213,6 +213,10 @@ static uint32_t vpci_read_hw(pci_sbdf_t sbdf, unsigned int reg,
 {
     uint32_t data;
 
+    /* Guest domains are not allowed to read real hardware. */
+    if ( !is_hardware_domain(current->domain) )
+        return ~(uint32_t)0;
+
     switch ( size )
     {
     case 4:
@@ -253,9 +257,13 @@ static uint32_t vpci_read_hw(pci_sbdf_t sbdf, unsigned int reg,
     return data;
 }
 
-static void vpci_write_hw(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
-                          uint32_t data)
+static void vpci_write_hw(pci_sbdf_t sbdf, unsigned int reg,
+                          unsigned int size, uint32_t data)
 {
+    /* Guest domains are not allowed to write real hardware. */
+    if ( !is_hardware_domain(current->domain) )
+        return;
+
     switch ( size )
     {
     case 4:
-- 
2.25.1


