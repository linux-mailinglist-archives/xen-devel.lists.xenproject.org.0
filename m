Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0FBB26BD7
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 18:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081980.1441975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umaR5-0001bV-Sf; Thu, 14 Aug 2025 16:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081980.1441975; Thu, 14 Aug 2025 16:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umaR5-0001Y1-LF; Thu, 14 Aug 2025 16:04:15 +0000
Received: by outflank-mailman (input) for mailman id 1081980;
 Thu, 14 Aug 2025 16:04:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Upc=22=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1umaR3-0001FY-LH
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 16:04:13 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 515d4357-7928-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 18:04:12 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a1b001f55so5404695e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 09:04:12 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45a1c6fa00bsm26313545e9.19.2025.08.14.09.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 09:04:10 -0700 (PDT)
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
X-Inumbo-ID: 515d4357-7928-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755187451; x=1755792251; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBj5NRvP8XG/dMSSpUAh9hQU/qoLTjxS6PC2X80rtxs=;
        b=bmBSX/sE+9SEZvaH7CmeS9iuJvunCvQd0SPNUpgQ1Qx6n14vWpeJK2B0PAip3tARfQ
         8DharXDrpBbQ2wtQzFORnQ2l4Uhd0qKpkIcpcbzFX0K3nJrnaQYhy8yY/tBdVsFmABcK
         9Tay1OKiSVdPOsSlnklfA7cVMB8yLb8iDQzEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187451; x=1755792251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBj5NRvP8XG/dMSSpUAh9hQU/qoLTjxS6PC2X80rtxs=;
        b=WT3pwIHfXKvWgBOSvZit9CVu6NsmFcJew+k06/PFfnM1tDkZ/nnIEy1ZlrQQer8YRF
         RME/k79zNbQKdf2yJtBJYMj0vpvTIyj5N7jcWfXnLDbyptD/zU4Fc4PcAugD5JSCkOSn
         13gCdiX6UouIyntwmBZ2Sj/H7CBspxeedVRsDq9SHHdYerTFUixx62+c3OHWXERbg0Bz
         Q5mbmNLVKQPgQe2HM13pVIIq7NG72XJB5vepLrNgTBTw9KuYwUpDOq4yDr0+qfjdRDyL
         +TQbT7KwwbnlHAJavASlV3V24rCceEzvgSlh3dGAThtETeOm4sl0bupnvtKGTgfo2mBE
         CDIw==
X-Gm-Message-State: AOJu0YwY74H7VPAYpL5RCF0ajc0tnR0nGmnRoZSV04aNwEEiqP3ih0R4
	WcIiDf06eeEeess0KBMtMoJGxXW3uUQjbhHRYXUmftjLdoeZQQqBOae/c0+f/D3cfR30rtROg02
	nLtOc
X-Gm-Gg: ASbGncvaxzrRDuhnwli3JR9uWQTMxmzVIuavdP6RlPFLkAkXE13d35yL6n0s31ExTGS
	Ul+CjKSMXPu+8ORUMeBgX4lx+ydAlFE2OgcafVlFnf8zJ45M0mLVtAvmHhXuzPtD+MBzpuVn47Q
	o1pA3+Lr5tSvLikMC8LC3+T1gy1WQz1+rU9o9sK0MIa72Af7FNDmIPOHtYtO9Z/Nyr8gANN466n
	76d2PVKoL/5hgx8d8sEMTPVofXQwR8RJ2FJln4uDHmoty6XfLWhU8J2a1xSasDNOh51Ms1CYGcq
	bS+AFyNt7OSxktgUPDqz8a2uzWBArGGtOplxGlSgj/rRTsAqFqubAOzyA4wYovscLfpLNs9Swrw
	Oh9AxazHWkqCNagnffrK84pKOSQkNxNwMcWy6mcnj0P3fYNotfRe3IruLnLbuebzlTA==
X-Google-Smtp-Source: AGHT+IH2hvKY7uV7i/yxnMKmS32Xi9zhMKkCRqCwn5ROjY05Dm67HZQHtqs4EAJOZ4JIHnvBuiwEgA==
X-Received: by 2002:a05:600c:3b1a:b0:458:c059:7db1 with SMTP id 5b1f17b1804b1-45a1b668ac4mr39262205e9.30.1755187450635;
        Thu, 14 Aug 2025 09:04:10 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: stewart.hildebrand@amd.com,
	Jiqian.Chen@amd.com,
	jbeulich@suse.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 4/5] vpci/msix: move MSI-X hole punching as a result of memory decoding enable
Date: Thu, 14 Aug 2025 18:03:57 +0200
Message-ID: <20250814160358.95543-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814160358.95543-1-roger.pau@citrix.com>
References: <20250814160358.95543-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Deferring the p2m unpopulate of the MSI-X table region to after the BAR are
mapped in the p2m is not needed.  The aim of vpci_make_msix_hole() is to
cope with the BAR containing the MSI-X table being positioned over a
reserved e820 region, by making sure the MSI-X table region is
unpopulated on the p2m. Note that reserved e820 regions are identity mapped
in the hardware domain p2m by default.

Doing it before or after the BAR p2m changes are done is irrelevant, hence
do it ahead of the p2m changes, as that's simpler.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/vpci/header.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 1a501a0ba47e..255c6d54b406 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -133,19 +133,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
     bool map = cmd & PCI_COMMAND_MEMORY;
     unsigned int i;
 
-    /*
-     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
-     * can be trapped (and emulated) by Xen when the memory decoding bit is
-     * enabled.
-     *
-     * FIXME: punching holes after the p2m has been set up might be racy for
-     * DomU usage, needs to be revisited.
-     */
-#ifdef CONFIG_HAS_PCI_MSI
-    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
-        return;
-#endif
-
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
@@ -547,6 +534,11 @@ static void cf_check cmd_write(
          */
         return;
 
+#ifdef CONFIG_HAS_PCI_MSI
+    /* Unpopulate MSI-X table region, so accesses trap into Xen. */
+    if ( (cmd & PCI_COMMAND_MEMORY) && vpci_make_msix_hole(pdev) )
+        return;
+#endif
     /*
      * FIXME: for domUs we don't want the guest toggling the memory decoding
      * bit.  It should be set in vpci_init_header() and guest attempts to
-- 
2.49.0


