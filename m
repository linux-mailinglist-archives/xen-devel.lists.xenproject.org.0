Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AD0B26BD5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 18:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081978.1441959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umaR4-0001JW-7z; Thu, 14 Aug 2025 16:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081978.1441959; Thu, 14 Aug 2025 16:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umaR4-0001Gw-4L; Thu, 14 Aug 2025 16:04:14 +0000
Received: by outflank-mailman (input) for mailman id 1081978;
 Thu, 14 Aug 2025 16:04:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Upc=22=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1umaR2-0001FY-Io
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 16:04:12 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 505238ff-7928-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 18:04:10 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b9e418ba08so556601f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 09:04:10 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3ac036sm51020430f8f.15.2025.08.14.09.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 09:04:08 -0700 (PDT)
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
X-Inumbo-ID: 505238ff-7928-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755187449; x=1755792249; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIvTZ7pv/C0sfHkl6ro//lBTy9KaJCip4Yzq1BFnW40=;
        b=QYkOREoGD2BIXPWwmg3BqMgw9Orc+khwwDCiIa4d2fJwD5HOCaurqcABl42+FNYGb+
         MlmAeBt8uQcJGwxD8B2eDr9WIO26kHn8gd7uOqKG1KNrEHO/eXDDHpq+W2YOdTK8TPjZ
         Wn5on3PcJ0s8H+wmiR2+K9Rmg8cEvfmbM5ALY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187449; x=1755792249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIvTZ7pv/C0sfHkl6ro//lBTy9KaJCip4Yzq1BFnW40=;
        b=he8OwmHGWWiAgrxjvJnUDdB7+NSmoCNZCqSf9Et6vHOaY8tq+Boo7lL8DpZtV7Qg3G
         qUosDNSNwP+Ms2ymtpBfetbORcLrdkbe3xw1kqLTHAcSQ4VoUYPePCkXwi1IRBTKViS8
         XrB95r04pqpfqHUfZjDZ0hAZukos/KkBimRvw5YzeLzmCyFN+6meDug+8iH/Uhyw/kQ8
         BL1OfuVkLk4SWaggHIYsEYdCDKflc/ejLKM9CxxT8yJIFTseVOwWhj4kH9IPDgj3JrQ6
         /+lx0VlWgMfmnI33QXbqSxS3UNDCe/PkTxDF58xw1CinDatRL6ZlfWQwdd7hsn/e+xgF
         FIPg==
X-Gm-Message-State: AOJu0Yy5Rm+3Xk8b71SljdaKAJHauUWgkI9riyyGTxATpn4RJGEAzZGq
	2PN7ZX9SK5mPM7CB2owBrebuKa2v0BA/c6MQD5PY10yEpaUrbVKNQ6/9GNDRsMkhcSV0s0Zxauw
	zNTH0
X-Gm-Gg: ASbGncu86q6NfoiCyZAz3jwx4VFygHxbry9VD/nyaN15AjDbu5viSIgvlKbkHL/qbQa
	15a5wkAu/JyRN7mwPn5ca/r9jRgskkCXnzEAUfZC9ZuJWq+AZk5Xjz1M7R3jSU4waFqvXEpuTy2
	WgpBUx4xOamwBMwD7+zRetx9VcDzo0g2+6ScwlxCcJREJdImRwnabj4jWlrz2TUmJ3c6NM6k8ax
	7Q4UVAXsMr2kDYvgRF8DbO2d8WCWAmlaZpFkwTCg0r5dAmna0TfIU1mRSoOkFHD0ZNoHSXrAh1+
	I5jHxLzE/Nnpx14oNAx/BWiieJeepbs1QF2flScMy3PgAH+d9QQThKgeBzNIdavGzbEoFZHSFam
	kv4LKVMXXCyYS8+cbS63uzFyP6Xl55ODNdLaxIkHtqFG1039fGdkxwZSknhuqeOauYg==
X-Google-Smtp-Source: AGHT+IFMWd1gDHrhhDVDn1MANjFzIFBwYOifVOB7VqWG1FjR3VFzCt61QxOnUOTU4XGSLCkGCzdCYg==
X-Received: by 2002:a05:6000:40ce:b0:3b8:f318:dc61 with SMTP id ffacd0b85a97d-3b9edfbc760mr3354469f8f.40.1755187449317;
        Thu, 14 Aug 2025 09:04:09 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: stewart.hildebrand@amd.com,
	Jiqian.Chen@amd.com,
	jbeulich@suse.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 3/5] xen/vpci: simplify handling of memory decoding and ROM enable writes
Date: Thu, 14 Aug 2025 18:03:56 +0200
Message-ID: <20250814160358.95543-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814160358.95543-1-roger.pau@citrix.com>
References: <20250814160358.95543-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Deferring the actual write of the PCI register bit, either the memory
decoding or the ROM enable is not helpful, and adds an unnecessary amount of
complexity to the preemptible handling of BAR related p2m modifications.

In the hardware domain case, whether the PCI register write is done ahead
or after the p2m changes doesn't matter, a hardware domain has plenty of
ways to mess with the PCI register state if it wants to.  Any poking at the
BAR p2m regions ahead of the guest write having completed will be
undefined.

On the other hand, for domUs the memory decoding bit shouldn't really
change as a result of guest actions, and should always be enabled.  Guest
toggling the memory decoding command register should only result in p2m
modifications, but no propagation to the device PCI registers.  Having
memory decoding unconditionally enabled ensures the domU attempting to
perform p2m accesses while the p2m changes are taking place will always
access the BAR contents. This is not the current behavior for domUs, so add
a note that it would preferably done that way.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/vpci/header.c | 42 +++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 1035dcca242d..1a501a0ba47e 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -163,8 +163,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
             if ( pci_check_bar(pdev, _mfn(PFN_DOWN(bar->addr)),
                                _mfn(PFN_DOWN(bar->addr + bar->size - 1))) )
                 bar->enabled = map;
-            header->rom_enabled = map;
-            pci_conf_write32(pdev->sbdf, rom_pos, val);
             return;
         }
 
@@ -174,14 +172,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
                            _mfn(PFN_DOWN(bar->addr + bar->size - 1))) )
             bar->enabled = map;
     }
-
-    if ( !rom_only )
-    {
-        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-        header->bars_mapped = map;
-    }
-    else
-        ASSERT_UNREACHABLE();
 }
 
 bool vpci_process_pending(struct vcpu *v)
@@ -547,16 +537,23 @@ static void cf_check cmd_write(
      * decoding one. Bits that are not allowed for DomU are already
      * handled above and by the rsvdp_mask.
      */
-    if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) )
+    if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) &&
+         modify_bars(pdev, cmd, false) )
         /*
          * Ignore the error. No memory has been added or removed from the p2m
          * (because the actual p2m changes are deferred in defer_map) and the
          * memory decoding bit has not been changed, so leave everything as-is,
          * hoping the guest will realize and try again.
          */
-        modify_bars(pdev, cmd, false);
-    else
-        pci_conf_write16(pdev->sbdf, reg, cmd);
+        return;
+
+    /*
+     * FIXME: for domUs we don't want the guest toggling the memory decoding
+     * bit.  It should be set in vpci_init_header() and guest attempts to
+     * modify it should only lead to guest p2m changes.
+     */
+    header->bars_mapped = cmd & PCI_COMMAND_MEMORY;
+    pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
 static uint32_t cf_check guest_cmd_read(
@@ -712,17 +709,11 @@ static void cf_check rom_write(
         rom->guest_addr = rom->addr;
     }
 
-    if ( !header->bars_mapped || rom->enabled == new_enabled )
-    {
-        /* Just update the ROM BAR field. */
-        header->rom_enabled = new_enabled;
-        pci_conf_write32(pdev->sbdf, reg, val);
-    }
     /*
      * Pass PCI_COMMAND_MEMORY or 0 to signal a map/unmap request, note that
      * this fabricated command is never going to be written to the register.
      */
-    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true) )
+    if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true) )
         /*
          * No memory has been added or removed from the p2m (because the actual
          * p2m changes are deferred in defer_map) and the ROM enable bit has
@@ -733,6 +724,8 @@ static void cf_check rom_write(
          */
         return;
 
+    header->rom_enabled = new_enabled;
+    pci_conf_write32(pdev->sbdf, reg, val);
     if ( !new_enabled )
     {
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
@@ -1057,6 +1050,13 @@ int vpci_init_header(struct pci_dev *pdev)
             goto fail;
     }
 
+    if ( cmd & PCI_COMMAND_MEMORY )
+    {
+        /* Restore command register value. */
+        header->bars_mapped = true;
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+    }
+
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
 
  fail:
-- 
2.49.0


