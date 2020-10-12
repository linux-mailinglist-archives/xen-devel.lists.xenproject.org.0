Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C40F28B4D4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 14:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5929.15438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRxCy-0002yj-D6; Mon, 12 Oct 2020 12:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5929.15438; Mon, 12 Oct 2020 12:45:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRxCy-0002yF-9n; Mon, 12 Oct 2020 12:45:44 +0000
Received: by outflank-mailman (input) for mailman id 5929;
 Mon, 12 Oct 2020 12:45:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Icg=DT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kRxCw-0002x4-Mb
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:45:42 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a2a73f4a-121b-4786-8d31-62151f37af06;
 Mon, 12 Oct 2020 12:45:42 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-8aCFu4Q9NpWinpC_cbR2fQ-1; Mon, 12 Oct 2020 08:45:38 -0400
Received: by mail-wr1-f70.google.com with SMTP id t17so9288654wrm.13
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 05:45:38 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id s185sm22765462wmf.3.2020.10.12.05.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:36 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3Icg=DT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kRxCw-0002x4-Mb
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:45:42 +0000
X-Inumbo-ID: a2a73f4a-121b-4786-8d31-62151f37af06
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id a2a73f4a-121b-4786-8d31-62151f37af06;
	Mon, 12 Oct 2020 12:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602506741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9wGxJZcsEOLAGSmgs7p8pt5WGBHmly5siKydoVe/oZE=;
	b=GyWb5H/fZm06bwgGygqA8wvOijWLElMPBbR3NwJ7MLmx63LYrinMLPua+m/FnGVnPL29jF
	37CsQ6wuDBa2UT6F3b4hRP8EfWmenc9qT/SKwiv4+WcEPkHAPt5lNUE4zsJryZAhMFQDj1
	U4E54cSQn7bYPDr/7M59NoPKFMPkbOo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-8aCFu4Q9NpWinpC_cbR2fQ-1; Mon, 12 Oct 2020 08:45:38 -0400
X-MC-Unique: 8aCFu4Q9NpWinpC_cbR2fQ-1
Received: by mail-wr1-f70.google.com with SMTP id t17so9288654wrm.13
        for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 05:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9wGxJZcsEOLAGSmgs7p8pt5WGBHmly5siKydoVe/oZE=;
        b=mB+0nT7k7KUi7qtdGb1Kr1uSuYSyIn8zdocxrTLwMLprOrMhNZAUrTPdPREHM27/jL
         9Luv3by5FgdcWqdDGj1hhCubsjoZ8cIk2TbOPXBdi7ob8FF0lFnHaEYJkq9W3/rYMHMq
         N64/wGOBMWMrApkfUGbtbUPFj/jjheDyQWOYbfV0P+W2S9bqa6afDkyXj1CHMZgEUQMu
         xyZx55bKG5OSusFonVeNGTgtxEx98DV+li9fJnrrFCnwRcTmngRXApLjopkffoAWCoj+
         aEibFrEIdW2ufFaou1opuch50Y5PR3nYSj2YpKms3Q8HsbXpHjyyYxN7XvlqZMruVDGK
         lcaQ==
X-Gm-Message-State: AOAM531eQdYhKKNi5MgeQYX6y70az+WIi40PzftcFxSFH9KO0mnkWokQ
	qIG6Q2pz+/WO8zUY2ObnYUIcNcZpSHvKy5V11/OLnyaSq2nyrJMc9wftYGFh76IRFINg+HI0L4i
	/EfTPc/bTEIBHutf1DDsqb3ShwVQ=
X-Received: by 2002:adf:dccc:: with SMTP id x12mr30544384wrm.241.1602506737182;
        Mon, 12 Oct 2020 05:45:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGju9pLDMIkjylp5prt4ukBOzX2jmiDpK+NGjR15EPrzwXN0JDbAFCeWH5hcu15IBYdHhmBg==
X-Received: by 2002:adf:dccc:: with SMTP id x12mr30544349wrm.241.1602506736967;
        Mon, 12 Oct 2020 05:45:36 -0700 (PDT)
Received: from localhost.localdomain (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
        by smtp.gmail.com with ESMTPSA id s185sm22765462wmf.3.2020.10.12.05.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:45:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org,
	qemu-trivial@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	Richard Henderson <rth@twiddle.net>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 5/5] hw: Use the PCI_DEVFN() macro from 'hw/pci/pci.h'
Date: Mon, 12 Oct 2020 14:45:06 +0200
Message-Id: <20201012124506.3406909-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012124506.3406909-1-philmd@redhat.com>
References: <20201012124506.3406909-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We already have a generic PCI_DEVFN() macro in "hw/pci/pci.h"
to pack the PCI slot/function identifiers, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/virt.c          | 3 ++-
 hw/pci-host/uninorth.c | 6 ++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e465a988d68..f601ef0798c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1144,7 +1144,8 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
                      full_irq_map, sizeof(full_irq_map));
 
     qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupt-map-mask",
-                           0x1800, 0, 0, /* devfn (PCI_SLOT(3)) */
+                           cpu_to_be16(PCI_DEVFN(3, 0)), /* Slot 3 */
+                           0, 0,
                            0x7           /* PCI irq */);
 }
 
diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index c21de0ab805..f73d452bdce 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -70,10 +70,8 @@ static uint32_t unin_get_config_reg(uint32_t reg, uint32_t addr)
         /* ... and then convert them to x86 format */
         /* config pointer */
         retval = (reg & (0xff - 7)) | (addr & 7);
-        /* slot */
-        retval |= slot << 11;
-        /* fn */
-        retval |= func << 8;
+        /* slot, fn */
+        retval |= PCI_DEVFN(slot, func) << 8;
     }
 
     trace_unin_get_config_reg(reg, addr, retval);
-- 
2.26.2


