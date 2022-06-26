Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DD455B204
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jun 2022 15:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356098.584116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5RrI-0003Fj-3y; Sun, 26 Jun 2022 12:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356098.584116; Sun, 26 Jun 2022 12:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5RrI-0003D5-0Z; Sun, 26 Jun 2022 12:59:24 +0000
Received: by outflank-mailman (input) for mailman id 356098;
 Sun, 26 Jun 2022 12:59:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wW8K=XB=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1o5RrG-0003Cz-P6
 for xen-devel@lists.xenproject.org; Sun, 26 Jun 2022 12:59:23 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cab17e66-f54f-11ec-b725-ed86ccbb4733;
 Sun, 26 Jun 2022 14:59:20 +0200 (CEST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-LIumsrBEPoSHYxQ-gQzt9Q-1; Sun, 26 Jun 2022 08:59:17 -0400
Received: by mail-ed1-f72.google.com with SMTP id
 h4-20020a056402280400b00435abcf8f2dso5267399ede.3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jun 2022 05:59:17 -0700 (PDT)
Received: from redhat.com ([2.54.171.2]) by smtp.gmail.com with ESMTPSA id
 p24-20020a170906615800b00709343c0017sm3831548ejl.98.2022.06.26.05.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 05:59:15 -0700 (PDT)
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
X-Inumbo-ID: cab17e66-f54f-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656248359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EWKAhxlYGU/zXw6dAaoTgwOVq0KRBRGkFCQdwQ8ZYEI=;
	b=dGagiqUTsheALfqqEJQJZUQg9Y84U31IsYHFPUSxbkOTf9pM+Usqz59c38fuY0OXegSnoF
	qIuFzAxIw+xlYwXp5ypBNtzT9ykFVdW4k8ZAqMfV5Gc4Wi93qITXZgPei0hhW4OSwRVffp
	0Puzx09wssmxCXf7DI4Oo5TIwzia8iQ=
X-MC-Unique: LIumsrBEPoSHYxQ-gQzt9Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EWKAhxlYGU/zXw6dAaoTgwOVq0KRBRGkFCQdwQ8ZYEI=;
        b=ms+LTXtzszx3BKtHcZ6v7SAXquIQXLpRaOSOaWyx4aOom3dqUJ3NPoLakFDVdX/ALV
         Tx4xYTbx24cNfCXRDNohXz7BMHicZ6pTAFugqKKYd/nGRFZ5Zvzwr3Wuh8pU11YWaFFa
         kKcpxPGx6wM7ehZB3/UnvLzUS3hmpHhEUnaCos+tPXgGwwW1xposZBZM5lIjgCOislwX
         P4uVXRDp0YMZMeNOtPygFkHWnwcshxoojKlckZ7zJ63i4nukIM+yK0DQJBEHRPbhCW0F
         nsHNX+Z8xcE948USU32TDjrkEkxvLXOgwGYmSBJIMLD4dvSyE9pJPfY6YRA3i0EHInab
         vaKw==
X-Gm-Message-State: AJIora9+Y3nMYlUu5Vx9QfVSlHf64d8UDYLpNjT9T6TJyD26uc1HFQ/Q
	BNYCz1K7fc23Pt2kx39Iz6UebRMwygym63wzve1QQ5vSEVIgT1V8iMH5H49SbWb0JqRso5q5lHw
	llEZ0WQhH0mP4/m3HrUKYBkHsvO8=
X-Received: by 2002:a50:fc15:0:b0:435:7897:e8ab with SMTP id i21-20020a50fc15000000b004357897e8abmr10723578edr.17.1656248356417;
        Sun, 26 Jun 2022 05:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vWZ8v0/l6cE/oBqSOcuPEcSCQehWDW5ulN3bcCd4MSEDOnZY2sq6sSedgWnQ4Hs6d/v0G4yw==
X-Received: by 2002:a50:fc15:0:b0:435:7897:e8ab with SMTP id i21-20020a50fc15000000b004357897e8abmr10723556edr.17.1656248356202;
        Sun, 26 Jun 2022 05:59:16 -0700 (PDT)
Date: Sun, 26 Jun 2022 08:59:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 2/2] hw/i386/xen/xen-hvm: Inline
 xen_piix_pci_write_config_client() and remove it
Message-ID: <20220626085903-mutt-send-email-mst@kernel.org>
References: <20220626094656.15673-1-shentey@gmail.com>
 <20220626094656.15673-3-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220626094656.15673-3-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 26, 2022 at 11:46:56AM +0200, Bernhard Beschow wrote:
> xen_piix_pci_write_config_client() is implemented in the xen sub tree and
> uses PIIX constants internally, thus creating a direct dependency on
> PIIX. Now that xen_set_pci_link_route() is stubbable, the logic of
> xen_piix_pci_write_config_client() can be moved to PIIX which resolves
> the dependency.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Fine by me

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/i386/xen/xen-hvm.c | 18 ------------------
>  hw/isa/piix3.c        | 15 ++++++++++++++-
>  include/hw/xen/xen.h  |  1 -
>  stubs/xen-hw-stub.c   |  4 ----
>  4 files changed, 14 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 204fda7949..e4293d6d66 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -15,7 +15,6 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
>  #include "hw/i386/pc.h"
> -#include "hw/southbridge/piix.h"
>  #include "hw/irq.h"
>  #include "hw/hw.h"
>  #include "hw/i386/apic-msidef.h"
> @@ -149,23 +148,6 @@ void xen_piix3_set_irq(void *opaque, int irq_num, int level)
>                             irq_num & 3, level);
>  }
>  
> -void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
> -{
> -    int i;
> -
> -    /* Scan for updates to PCI link routes (0x60-0x63). */
> -    for (i = 0; i < len; i++) {
> -        uint8_t v = (val >> (8 * i)) & 0xff;
> -        if (v & 0x80) {
> -            v = 0;
> -        }
> -        v &= 0xf;
> -        if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
> -            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
> -        }
> -    }
> -}
> -
>  int xen_set_pci_link_route(uint8_t link, uint8_t irq)
>  {
>      return xendevicemodel_set_pci_link_route(xen_dmod, xen_domid, link, irq);
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index 6388558f92..48f9ab1096 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -138,7 +138,20 @@ static void piix3_write_config(PCIDevice *dev,
>  static void piix3_write_config_xen(PCIDevice *dev,
>                                     uint32_t address, uint32_t val, int len)
>  {
> -    xen_piix_pci_write_config_client(address, val, len);
> +    int i;
> +
> +    /* Scan for updates to PCI link routes (0x60-0x63). */
> +    for (i = 0; i < len; i++) {
> +        uint8_t v = (val >> (8 * i)) & 0xff;
> +        if (v & 0x80) {
> +            v = 0;
> +        }
> +        v &= 0xf;
> +        if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
> +            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
> +        }
> +    }
> +
>      piix3_write_config(dev, address, val, len);
>  }
>  
> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> index 13bffaef53..afdf9c436a 100644
> --- a/include/hw/xen/xen.h
> +++ b/include/hw/xen/xen.h
> @@ -23,7 +23,6 @@ extern bool xen_domid_restrict;
>  int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
>  int xen_set_pci_link_route(uint8_t link, uint8_t irq);
>  void xen_piix3_set_irq(void *opaque, int irq_num, int level);
> -void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len);
>  void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
>  int xen_is_pirq_msi(uint32_t msi_data);
>  
> diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
> index 743967623f..34a22f2ad7 100644
> --- a/stubs/xen-hw-stub.c
> +++ b/stubs/xen-hw-stub.c
> @@ -19,10 +19,6 @@ void xen_piix3_set_irq(void *opaque, int irq_num, int level)
>  {
>  }
>  
> -void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
> -{
> -}
> -
>  int xen_set_pci_link_route(uint8_t link, uint8_t irq)
>  {
>      return -1;
> -- 
> 2.36.1


