Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 008AB4CAB9A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 18:28:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282511.481246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPSlH-0005bt-E6; Wed, 02 Mar 2022 17:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282511.481246; Wed, 02 Mar 2022 17:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPSlH-0005ZL-AF; Wed, 02 Mar 2022 17:27:39 +0000
Received: by outflank-mailman (input) for mailman id 282511;
 Wed, 02 Mar 2022 17:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pfyc=TN=gmail.com=this.is.a0lson@srs-se1.protection.inumbo.net>)
 id 1nPSlF-0005ZF-Ve
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 17:27:38 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d50143b-9a4e-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 18:27:37 +0100 (CET)
Received: by mail-qk1-x732.google.com with SMTP id c7so1854202qka.7
 for <xen-devel@lists.xenproject.org>; Wed, 02 Mar 2022 09:27:36 -0800 (PST)
Received: from development (c-73-166-253-254.hsd1.tx.comcast.net.
 [73.166.253.254]) by smtp.gmail.com with ESMTPSA id
 s7-20020a05622a018700b002dfed15c9edsm10771985qtw.74.2022.03.02.09.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 09:27:35 -0800 (PST)
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
X-Inumbo-ID: 0d50143b-9a4e-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=dOu3W6e1lek9NwlGWMLe7xTNjeA/SvvKHqYQ9IVp8XI=;
        b=HM6LFXYfHo8XVEcJFPXRhorVFo29a9DE5gnPfOFbcJI+eo7KG4MUeGOXoxQeK7yUX1
         eb+Y5LcX2CtoqnxlXbkc4s53O/E9ksNse34HEY7qJVKvc0C03YPLg8X603b4d0QXHBFt
         lH+fnWeyVJP7YCHj26Ha+oy7sDhMxDlKXm/i0fRCvMnElrNga1eV+pvK+gKQK2iXsk9A
         87p8MWIfuJmqRaGLMv8rl3LULtsShACZPc/kJ88XHr/He+bS4NbEZx7E/bshI+Uplwju
         l1+v1bd/a0ah4HGAg6irP/aT2tevRlyEG0eszzvalcxeBNFz5TtBm43fOEZlwIhEA8Aj
         MIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=dOu3W6e1lek9NwlGWMLe7xTNjeA/SvvKHqYQ9IVp8XI=;
        b=PEU9k+eQTlYDt2t9l+RRw9mkjK1zO9uF5BYyfBl2LYEWDGS/Tche2nu3u1uQ+gV8oY
         tksNDiSwXJ+9l0bcszCXYsppqMNO09mTPifBf6JVqrKIFicZXj3PpB2s7wZtehOI8c/C
         mtnX/pGGxLgqn4cbLU1pgay3Q5xd6dmGECAqBAs1UBqCX/FtQ3sPMQLPsM0Uhvrl1j3Z
         kH8+Q+7cwymXOlMtRF/eholtct81eWehWyLDHG9QxUftBGeGkI31mvGC/PNqhmlMAHwQ
         csDRm/gkSpR9OL7wtLo0qhEeH8QBL6CZ2Yl/yM74IsOsxPzoo6Ow1cO/0ew5nwiKKDAO
         KJVA==
X-Gm-Message-State: AOAM532ig5KMDOTD+5RkKAox5Truz3Djlgbj9URZsvHST8XldBmwAVWw
	j8dMoe1BwsTZRWwKzr+NRQ4GKl/haN4Mkw==
X-Google-Smtp-Source: ABdhPJwxOg+54g5Insc2YbzwC8vhdiweJDDX7i1NDm4rut/DNJkC+dsUslLc8zBHw7l+Ai9pnBCaag==
X-Received: by 2002:a37:80b:0:b0:508:b7e5:e47e with SMTP id 11-20020a37080b000000b00508b7e5e47emr17061461qki.80.1646242055670;
        Wed, 02 Mar 2022 09:27:35 -0800 (PST)
Message-ID: <7c85d28831f3f30fb61bb359a23f570c34b4d31a.camel@gmail.com>
Subject: PIRQ handling and PVH dom0?
From: Alex Olson <this.is.a0lson@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Date: Wed, 02 Mar 2022 11:27:33 -0600
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

I further attempted to see how far PVH dom0 can get but had a general question regarding what is not yet implemented... 

With an initial version of Roger's recent "vpci/msix: fix PBA access" patches and after refreshing his earlier 2018 patchset "vpci: add support for SR-IOV capability" regarding SR-IOV support for PVH dom0, I was able to get both physical functions and virtual functions of an SR-IOV network card to operate correctly in PVH dom0.

However, it looks like any PCI-passthrough for HVM domUs with PVH dom0 is not yet implemented. I see the "PHYSDEVOP_map_pirq" call fails since the "emulation_flags" for dom0 do not include "XEN_X86_EMU_USE_PIRQ"...

	libxl: error: libxl_pci.c:1461:pci_add_dm_done: Domain 1:xc_physdev_map_pirq irq=17 (error=-1): Function not implemented                                                                                                                                                                                                                                                                                                         
	libxl: error: libxl_pci.c:1781:device_pci_add_done: Domain 1:libxl__device_pci_add failed for PCI device 0:5:0.1 (rc -3)                                                                                                                                                                                                                                                                                                         
	libxl: error: libxl_create.c:1895:domcreate_attach_devices: Domain 1:unable to add pci devices                                              


What is PVH dom0 missing at a conceptual level for PCI passthrough to domUs?  I naively assumed that an HVM domU guest wouldn't care much whether dom0 was PV or PVH in terms of passthrough device IRQ handling...

Thanks

-Alex


