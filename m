Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 738B328B4D2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 14:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5925.15390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRxCe-0002eP-5W; Mon, 12 Oct 2020 12:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5925.15390; Mon, 12 Oct 2020 12:45:24 +0000
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
	id 1kRxCe-0002dq-1s; Mon, 12 Oct 2020 12:45:24 +0000
Received: by outflank-mailman (input) for mailman id 5925;
 Mon, 12 Oct 2020 12:45:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Icg=DT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kRxCc-0002cA-QF
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:45:22 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 47b22cc0-726e-4604-916d-836074c798f4;
 Mon, 12 Oct 2020 12:45:18 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-ZTed8B7mMT2VgJR1qKIMtQ-1; Mon, 12 Oct 2020 08:45:16 -0400
Received: by mail-wr1-f69.google.com with SMTP id r8so1941961wrp.5
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 05:45:16 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id f6sm11016383wru.50.2020.10.12.05.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:14 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3Icg=DT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kRxCc-0002cA-QF
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:45:22 +0000
X-Inumbo-ID: 47b22cc0-726e-4604-916d-836074c798f4
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 47b22cc0-726e-4604-916d-836074c798f4;
	Mon, 12 Oct 2020 12:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602506718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bwG8iSHLZW0tTYCnl2ic6/t6qmfYl8jGlMpgEnOotCs=;
	b=LoZqtaFZ14PMiVG5YwWZDLriI0xjyU7gGSiWQDnxzOKLHb3cwadDmXh61qzcP0A40ySUE2
	MdBHKQ2YyjyqH2/HvUpEO+g/Lj8MJVewGgFov7OAbbgBhTP9E7hVojhpHOr9/MiNsDaQfr
	5mQmXpW3qfQOevb7Xa+m/mWEKiM/jJg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-ZTed8B7mMT2VgJR1qKIMtQ-1; Mon, 12 Oct 2020 08:45:16 -0400
X-MC-Unique: ZTed8B7mMT2VgJR1qKIMtQ-1
Received: by mail-wr1-f69.google.com with SMTP id r8so1941961wrp.5
        for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 05:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bwG8iSHLZW0tTYCnl2ic6/t6qmfYl8jGlMpgEnOotCs=;
        b=PEGS2VG6nLVSQGMPuYGKhrprPynHlFS9z2eO3q7PdJhSCQ2Buud0LMRy/R7lEFasOY
         mboqhm5t2SboNEjnwmcu2eiN8fygnEDXoQB0U0yX0AwdEi/J7ovI4ANov3gcSMsTI3oS
         lhEBla/YNRydoMF6R5QB55oJPuFFFW2V1/eidXxRGSqsRZJFtL+hgb4exIeHkTbLlpE3
         3/dhY6ZFeZzu9CrhaHmomO76lz5yiBG72NLEg0ALr9NXtEyL703uRELeyz6tqcz5lTuN
         A1CyqLDQkPeBWDqpUQ8uWIO0wJImQ5hmQQCHQxsH0+P/V2HWw9fsRITsboQ66j8pIcDm
         0SyA==
X-Gm-Message-State: AOAM532qndwIchDvDaxB/ZBwbTM20TLzhmh79FFxoBluYBG68dXdaAof
	5Dy7aexgAHo7qdEv34JZzVH1OuY9Af0kIe/0Tb7lljW0JDyxyE/42Re4fZ8dJIyOZlWu8GkaAr9
	7iOzXDwoMnkDtVmuI+/hISbf/5N0=
X-Received: by 2002:adf:dd46:: with SMTP id u6mr29753240wrm.295.1602506715238;
        Mon, 12 Oct 2020 05:45:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyueR4JjpNH2sLzfTjSqD0R65Ts5ka4vohHBW3dn4ShgyH1BUlk0MTIhNUHnqavD80ySjglhw==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr29753217wrm.295.1602506715091;
        Mon, 12 Oct 2020 05:45:15 -0700 (PDT)
Received: from localhost.localdomain (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
        by smtp.gmail.com with ESMTPSA id f6sm11016383wru.50.2020.10.12.05.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:45:14 -0700 (PDT)
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
Subject: [PATCH 1/5] hw/pci-host/bonito: Make PCI_ADDR() macro more readable
Date: Mon, 12 Oct 2020 14:45:02 +0200
Message-Id: <20201012124506.3406909-2-philmd@redhat.com>
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

The PCI_ADDR() macro use generic PCI fields shifted by 8-bit.
Rewrite it extracting the shift operation one layer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index a99eced0657..abb3ee86769 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -196,8 +196,8 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 #define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
 
 #define PCI_ADDR(busno , devno , funno , regno)  \
-    ((((busno) << 16) & 0xff0000) + (((devno) << 11) & 0xf800) + \
-    (((funno) << 8) & 0x700) + (regno))
+    ((((busno) << 8) & 0xff00) + (((devno) << 3) & 0xf8) + \
+    (((funno) & 0x7) << 8) + (regno))
 
 typedef struct BonitoState BonitoState;
 
-- 
2.26.2


