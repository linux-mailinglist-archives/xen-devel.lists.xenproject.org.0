Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8826682D083
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jan 2024 13:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667115.1038147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOzYq-0000j0-Js; Sun, 14 Jan 2024 12:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667115.1038147; Sun, 14 Jan 2024 12:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOzYq-0000gC-Gb; Sun, 14 Jan 2024 12:25:56 +0000
Received: by outflank-mailman (input) for mailman id 667115;
 Sun, 14 Jan 2024 12:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mcEk=IY=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1rOzYp-0000g6-Aq
 for xen-devel@lists.xenproject.org; Sun, 14 Jan 2024 12:25:55 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f153fc9-b2d8-11ee-98f1-6d05b1d4d9a1;
 Sun, 14 Jan 2024 13:25:54 +0100 (CET)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-tce3z_0eOMmRkmou_Mpliw-1; Sun, 14 Jan 2024 07:25:46 -0500
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3368abe10c5so5175702f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jan 2024 04:25:46 -0800 (PST)
Received: from redhat.com ([2.52.131.87]) by smtp.gmail.com with ESMTPSA id
 v16-20020adfa1d0000000b003379d475928sm3925626wrv.18.2024.01.14.04.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 04:25:43 -0800 (PST)
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
X-Inumbo-ID: 0f153fc9-b2d8-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705235152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tAkYy2esf7Pd2G69r02QQxGJJf+2ehPe/4HNxSRnO8Q=;
	b=GuZten3p7IF8CHOvqANyZR5pm7ztQvl6plpYTkyRWjzWz1GXZHbRs2ZZAxLHvmnq8nwDCk
	GZMpnZLwYLgRGMUvmc3I4yD1ST23FRFtGkdYvrV8UOk0Ot33HpX6tAjHj/MumeiviLwipG
	3AbcnR33eSq+COBDrHN5TQvWSIqJ1c0=
X-MC-Unique: tce3z_0eOMmRkmou_Mpliw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705235145; x=1705839945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAkYy2esf7Pd2G69r02QQxGJJf+2ehPe/4HNxSRnO8Q=;
        b=g6Uiuo38qauIKwjvgSJUBQpYX6cYtxKrxY3YLUx6S8fu8npEzKd4+cXN6M56cnw19T
         7tD6m5YUUP8v9COPGkCvYUOBfnEK2fWHW38Tn3CxF6kGek2Bl+Domrr0fuKr4xtGSRj4
         q1qlGE2Nyuc5bYQ9Y4/yUqpu/LjpB3oxxuwcGsOuCrnYDccjaLYL2azZ59J/p9r0uFEt
         qG1l3BVodYCfFFBC1S8IzV8iF814/Jh/6fH+zD3Ou3VlC1gQJs6GFIJOcGtGzIwYV+NJ
         EaT+uqbK4qnwlRjQCu0DwTTzqF+MbOnwilmC5kkBEUauaERxvcXbzZBWMwsPKGcduJO0
         3AMg==
X-Gm-Message-State: AOJu0YzHuYQextH5H6KKxw8l6fmeWhnPlXOMNRLTnRJec6WQFPZ4PUqX
	a9WDbkoNwB6cUXewrfQDVkc7fbvdnU9o3eRivW/BcT11+ppibWXBoU5PeYWvU2b5d4Qxwr8JlO8
	lmRQTz5U/s41lv9G7wD4OLMlFH0D5WnO5D1w=
X-Received: by 2002:a5d:6283:0:b0:337:4fa6:2306 with SMTP id k3-20020a5d6283000000b003374fa62306mr1473321wru.158.1705235145122;
        Sun, 14 Jan 2024 04:25:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcs6wlsSgQGa8meTzrVry5X6WKhXJy+/DmR/kQta9Vn0vh4yGyp1UV+e1xl3ZaOJo+HPKNTQ==
X-Received: by 2002:a5d:6283:0:b0:337:4fa6:2306 with SMTP id k3-20020a5d6283000000b003374fa62306mr1473311wru.158.1705235144683;
        Sun, 14 Jan 2024 04:25:44 -0800 (PST)
Date: Sun, 14 Jan 2024 07:25:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Chuck Zmudzinski <brchuckz@aol.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	David Woodhouse <dwmw2@infradead.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] hw/i386/pc_piix: Make piix_intx_routing_notifier_xen()
 more device independent
Message-ID: <20240114072529-mutt-send-email-mst@kernel.org>
References: <20240107231623.5282-1-shentey@gmail.com>
 <B404ABCE-E6B5-4716-BA60-3CEE74B72701@gmail.com>
MIME-Version: 1.0
In-Reply-To: <B404ABCE-E6B5-4716-BA60-3CEE74B72701@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 14, 2024 at 12:21:59PM +0000, Bernhard Beschow wrote:
> 
> 
> Am 7. Januar 2024 23:16:23 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >This is a follow-up on commit 89965db43cce "hw/isa/piix3: Avoid Xen-specific
> >variant of piix3_write_config()" which introduced
> >piix_intx_routing_notifier_xen(). This function is implemented in board code but
> >accesses the PCI configuration space of the PIIX ISA function to determine the
> >PCI interrupt routes. Avoid this by reusing pci_device_route_intx_to_irq() which
> >makes piix_intx_routing_notifier_xen() more device-agnostic.
> >
> >One remaining improvement would be making piix_intx_routing_notifier_xen()
> >agnostic towards the number of PCI interrupt routes and move it to xen-hvm.
> >This might be useful for possible Q35 Xen efforts but remains a future exercise
> >for now.
> >
> >Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> 
> Hi Michael,
> 
> could you tag this, too? Or do we need another R-b?
> 
> Best regards,
> Bernhard

tagged, too.

> >---
> > hw/i386/pc_piix.c | 9 +++------
> > 1 file changed, 3 insertions(+), 6 deletions(-)
> >
> >diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> >index 042c13cdbc..abfcfe4d2b 100644
> >--- a/hw/i386/pc_piix.c
> >+++ b/hw/i386/pc_piix.c
> >@@ -92,13 +92,10 @@ static void piix_intx_routing_notifier_xen(PCIDevice *dev)
> > {
> >     int i;
> > 
> >-    /* Scan for updates to PCI link routes (0x60-0x63). */
> >+    /* Scan for updates to PCI link routes. */
> >     for (i = 0; i < PIIX_NUM_PIRQS; i++) {
> >-        uint8_t v = dev->config_read(dev, PIIX_PIRQCA + i, 1);
> >-        if (v & 0x80) {
> >-            v = 0;
> >-        }
> >-        v &= 0xf;
> >+        const PCIINTxRoute route = pci_device_route_intx_to_irq(dev, i);
> >+        const uint8_t v = route.mode == PCI_INTX_ENABLED ? route.irq : 0;
> >         xen_set_pci_link_route(i, v);
> >     }
> > }


