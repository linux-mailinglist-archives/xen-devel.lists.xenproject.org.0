Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431B86247C8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 18:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442031.696085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otAuJ-0003EC-27; Thu, 10 Nov 2022 17:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442031.696085; Thu, 10 Nov 2022 17:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otAuI-00038X-UV; Thu, 10 Nov 2022 17:00:02 +0000
Received: by outflank-mailman (input) for mailman id 442031;
 Thu, 10 Nov 2022 17:00:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqAE=3K=gmail.com=d.vrabel.98@srs-se1.protection.inumbo.net>)
 id 1otAuH-0002uk-Au
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 17:00:01 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cbb9d02-6119-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 18:00:00 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so1587687wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Nov 2022 09:00:00 -0800 (PST)
Received: from pear.davidvrabel.org.uk (pear.davidvrabel.org.uk.
 [82.70.146.41]) by smtp.googlemail.com with ESMTPSA id
 j5-20020a05600c1c0500b003cfbbd54178sm9403666wms.2.2022.11.10.08.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 08:59:59 -0800 (PST)
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
X-Inumbo-ID: 1cbb9d02-6119-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT451c2UjX6nYO0HqV5+AhJZLhiaFB3XbFUJQqv3uCY=;
        b=CULL7YC3PMCsFzcTYGiZxMBXj6yB7FCvh+dUXW6kjrLQStq+pPz28vAty3KSawfQcD
         Au1t6o+Ie3GEoRXBo2+DRT0f+j/RIsu2YyKYG+hWBH4aVCCFe/OaOeTHhsyPyTozzXGG
         0S+GVk7SomYkoOdo2fEAaW8hGiLvnSMi+DLmuhptKn1ecNB4b2DTknM1XqFuT2Qgrp13
         Pgj5t70odUKK7UzUX7MVApSHfyXik31o+kf9p2zc1NEH9wLdw7FWgNBSNGOPNx4PWGTc
         pVDMC4/cRDKHNBYBbmvdH7GvgUsSyulOxcEdnoDAFtSfwJWmivUmjGhhdaGhJfC1TRUU
         Obaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XT451c2UjX6nYO0HqV5+AhJZLhiaFB3XbFUJQqv3uCY=;
        b=MgZZwub8mWWeSI+cvMkTAORrr3f9GbZ0MjoNsV1nu/mDrs3SEDVkUZfesOTII5+YTz
         ugAR71WWg4OpXSSWBc2eQVY9g5o0OZQEBbzCcyl3Uuf8dnRK7QwsetaSHMVF4u6bbFty
         VMC3Sl1i093nelr//cO+KB6huWtwsigKXDt7qsqrI2bWJV59aQztdEsarWaPpDwoQ8TX
         hIlEylPxt7EBDeCohAroIt0RQRyyAS9kkqphhJIid8Gqc431pbdghglqui8jk/lWkM//
         8ZC/9c0YmS3ODC00MKYUI69c9anxsH59XmR3cT5u3Is0zQRXRbspoaPlhNO4gSXfSTqF
         psiA==
X-Gm-Message-State: ACrzQf34s55O7IFlpF3GdU+Q5b3yzGLzrY7oRL6/M1Gpy7pvqDw67wDf
	TauLQuZlpF+EVjtYiMnre3h+v6KNYC41EA==
X-Google-Smtp-Source: AMsMyM7GfvspitH2uSrPLzAx3bEUHQuXm3d3qm+8bJzz0Yle0Sh2GhBYOAU4hJ45yWvKo9t9l+nHLQ==
X-Received: by 2002:a05:600c:1e26:b0:3cf:5238:13fc with SMTP id ay38-20020a05600c1e2600b003cf523813fcmr51763388wmb.151.1668099599882;
        Thu, 10 Nov 2022 08:59:59 -0800 (PST)
Sender: David Vrabel <d.vrabel.98@gmail.com>
From: David Vrabel <dvrabel@cantab.net>
X-Google-Original-From: David Vrabel <dvrabel@amazon.co.uk>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	David Vrabel <dvrabel@amazon.co.uk>
Subject: [PATCH 1/3] x86/msi: consistently handle BAR mapping failures in MSI-X setup
Date: Thu, 10 Nov 2022 16:59:33 +0000
Message-Id: <20221110165935.106376-2-dvrabel@amazon.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110165935.106376-1-dvrabel@amazon.co.uk>
References: <20221110165935.106376-1-dvrabel@amazon.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When setting up an MSI-X vector in msix_capability_init() the error
handling after a BAR mapping failure is different depending on whether
the first page fails or a subsequent page. There's no reason to break
working vectors so consistently use the later error handling
behaviour.

The zap_on_error flag was added as part of XSA-337, beb54596cfda
(x86/MSI-X: restrict reading of table/PBA bases from BARs), but
appears to be unrelated to XSA-337 and is not useful because:

1. table.first and pba.first are not used unless msix->used_vectors > 0.

2. Force disabling MSI-X in this error path is not necessary as the
   per-vector mask is still still set.

Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>

CR: https://code.amazon.com/reviews/CR-79020908
---
 xen/arch/x86/msi.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index d0bf63df1d..8bde6b9be1 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -776,7 +776,7 @@ static int msix_capability_init(struct pci_dev *dev,
     u8 bus = dev->bus;
     u8 slot = PCI_SLOT(dev->devfn);
     u8 func = PCI_FUNC(dev->devfn);
-    bool maskall = msix->host_maskall, zap_on_error = false;
+    bool maskall = msix->host_maskall;
     unsigned int pos = pci_find_cap_offset(seg, bus, slot, func,
                                            PCI_CAP_ID_MSIX);
 
@@ -875,8 +875,6 @@ static int msix_capability_init(struct pci_dev *dev,
                                   BITS_TO_LONGS(msix->nr_entries) - 1);
         WARN_ON(rangeset_overlaps_range(mmio_ro_ranges, msix->pba.first,
                                         msix->pba.last));
-
-        zap_on_error = true;
     }
     else if ( !msix->table.first )
     {
@@ -897,14 +895,6 @@ static int msix_capability_init(struct pci_dev *dev,
 
         if ( idx < 0 )
         {
-            if ( zap_on_error )
-            {
-                msix->table.first = 0;
-                msix->pba.first = 0;
-
-                control &= ~PCI_MSIX_FLAGS_ENABLE;
-            }
-
             pci_conf_write16(dev->sbdf, msix_control_reg(pos), control);
             xfree(entry);
             return idx;
-- 
2.30.2


