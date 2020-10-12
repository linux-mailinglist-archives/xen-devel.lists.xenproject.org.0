Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B628B4D1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 14:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5927.15415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRxCm-0002m4-Sm; Mon, 12 Oct 2020 12:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5927.15415; Mon, 12 Oct 2020 12:45:32 +0000
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
	id 1kRxCm-0002lN-NQ; Mon, 12 Oct 2020 12:45:32 +0000
Received: by outflank-mailman (input) for mailman id 5927;
 Mon, 12 Oct 2020 12:45:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Icg=DT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kRxCl-0002kr-Us
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:45:31 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e9d0eca7-a567-4ea2-b67c-45a220f9f8aa;
 Mon, 12 Oct 2020 12:45:31 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-8UvaL3I4NoeFMoWYH2yU_A-1; Mon, 12 Oct 2020 08:45:27 -0400
Received: by mail-wr1-f69.google.com with SMTP id q15so428804wrw.8
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 05:45:27 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id d2sm14916896wrq.34.2020.10.12.05.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:25 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3Icg=DT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kRxCl-0002kr-Us
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:45:31 +0000
X-Inumbo-ID: e9d0eca7-a567-4ea2-b67c-45a220f9f8aa
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id e9d0eca7-a567-4ea2-b67c-45a220f9f8aa;
	Mon, 12 Oct 2020 12:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602506731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=afTxi5eJGUK9TCxtbNIddaNUCDX7pFC3c3DvHTcAqpY=;
	b=J9B7H7LrBwwINvhmbA0l+GyBcrAWdBztzvrutX5qL9WpBHgXY5E3f50Ir4hPrPx7EdgzIn
	kR4x/qEi2is+WKZzD/VYzwSh6LAbviPzQByxNB409OF7AU6CG3ut1GZi4KTvieb3f//Fg0
	EhfteZwtpEqiSFfOuc1YT8KEBIDC8Po=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-8UvaL3I4NoeFMoWYH2yU_A-1; Mon, 12 Oct 2020 08:45:27 -0400
X-MC-Unique: 8UvaL3I4NoeFMoWYH2yU_A-1
Received: by mail-wr1-f69.google.com with SMTP id q15so428804wrw.8
        for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 05:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=afTxi5eJGUK9TCxtbNIddaNUCDX7pFC3c3DvHTcAqpY=;
        b=SGEzAkeueYgh1Hdl9rnkhIP18i9616ASlF36+VdljJtVtzRVAUQ3a/RPKQ5Su7hc5a
         +ujUMfIsvgEfW2HDoie/XHyMufSRNfkuFwWljUXgF3By+kbakcgePCW42VhrrpLIXgUN
         qHRy6Urn2i3HTQf9xPnD62CJlKzg6wMGLO82BXSJBlvsYl1Vj0eezxu2iaCp3Bcu8MN+
         sezXXycjRWhAtXx3SHF+BwG4gago6CTIpXz90pelp7CELxjRXvMOWZdyhHU5q+ULUjFN
         prlh7pyoWv5FQo3aA+hvzCyXL4XLTrfA6l+DiW6sT+yRTo1uSChDP6PxfvEM/7epXnDl
         OL8w==
X-Gm-Message-State: AOAM531xFIwIiXpe8mxKCUapgmDLG7TN69MqAvVW3a3P22eTG3XJD6Ny
	FzfJP92lltqux3nVk2OyyNaHvIsYX5DkJorPLtZ/9hNZT2ci9Egn8nREPnk8eHm7e/l3gOu+EWt
	H9wYRfd8fr1mQcN7xSMLJ3EBVBt8=
X-Received: by 2002:adf:df03:: with SMTP id y3mr10299478wrl.70.1602506726315;
        Mon, 12 Oct 2020 05:45:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpp+5kB0ZYqB04uT+WIG2a4k9Wmj2oRtvHubS3HvdSiiZu7CRJnV3hLF0c9e7ixdPrjPJpoQ==
X-Received: by 2002:adf:df03:: with SMTP id y3mr10299453wrl.70.1602506726102;
        Mon, 12 Oct 2020 05:45:26 -0700 (PDT)
Received: from localhost.localdomain (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
        by smtp.gmail.com with ESMTPSA id d2sm14916896wrq.34.2020.10.12.05.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:45:25 -0700 (PDT)
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
Subject: [PATCH 3/5] hw/pci-host/uninorth: Use the PCI_FUNC() macro from 'hw/pci/pci.h'
Date: Mon, 12 Oct 2020 14:45:04 +0200
Message-Id: <20201012124506.3406909-4-philmd@redhat.com>
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

We already have a generic PCI_FUNC() macro in "hw/pci/pci.h" to
extract the PCI function identifier, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/uninorth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index 1ed1072eeb5..c21de0ab805 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -65,7 +65,7 @@ static uint32_t unin_get_config_reg(uint32_t reg, uint32_t addr)
         if (slot == 32) {
             slot = -1; /* XXX: should this be 0? */
         }
-        func = (reg >> 8) & 7;
+        func = PCI_FUNC(reg >> 8);
 
         /* ... and then convert them to x86 format */
         /* config pointer */
-- 
2.26.2


