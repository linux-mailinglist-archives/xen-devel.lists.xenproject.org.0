Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id j3FLIXioEmqJ2QYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 09:27:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BAD5C197C
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 09:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318542.1586731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wR3FG-0007ku-TQ; Sun, 24 May 2026 07:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318542.1586731; Sun, 24 May 2026 07:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wR3FG-0007ie-Qh; Sun, 24 May 2026 07:27:34 +0000
Received: by outflank-mailman (input) for mailman id 1318542;
 Sun, 24 May 2026 07:27:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mst@redhat.com>) id 1wR3FF-0007h7-Mw
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 07:27:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wR3FF-002xZg-3G
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 09:27:33 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mst@redhat.com>)
 id 6a12a864-2eae-0a2a0a5409dd-0a2a4506d08a-2
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 09:27:32 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mst@redhat.com>)
 id 6a12a863-7371-0a2a45060019-aa0a817cd89b-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 09:27:32 +0200
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-CHYLcssYOhqZXz2X8gnbwQ-1; Sun, 24 May 2026 03:27:29 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-49058e91639so3401035e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 00:27:29 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904526c926sm269326035e9.1.2026.05.24.00.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 00:27:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779607651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxhD+oPNzxpDNMc3FLT/7Y70luC3EVY6qa2hhkOcukw=;
	b=efK7z89bPd5hRr/8DvaR/8w3vxgj79hg6c7x0cyJCUkFbrTHxAqlFd+VGKAi8d2x/J23OM
	YxtMA17Oyi/w8ZNjgZEDta1obtc4096BzCkiP/TMrCQUKXeCyP+TFLXlpWCuD2VyaFSKRV
	nX44xr3D9y6cajZu537KCt4j+PzdS2E=
X-MC-Unique: CHYLcssYOhqZXz2X8gnbwQ-1
X-Mimecast-MFC-AGG-ID: CHYLcssYOhqZXz2X8gnbwQ_1779607648
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779607648; x=1780212448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxhD+oPNzxpDNMc3FLT/7Y70luC3EVY6qa2hhkOcukw=;
        b=B/AWjb57TjWV5APg+zqJweP5ecD4Uz45H2C8SBKy4K3bt6XkUYBxyGI2iRPzHUPGC9
         /qe28FLbG4EfH0lI/sJ6fQj9myqMWiM3BcRA9B82d58HUiRTUhrgddIAHERhv1AO+9WY
         AFn26y9bPNA3R5deII9JjiNbRLG80mch6WSUFffy6cSh+uX+nOGTFQVa+4zJR2BToCUi
         lm9imCxr8dX+gUv2Igy2wXHrD3nVPnJWv5PCLZ6VQonyUKPkwagLHKnBYV5twCfhb63k
         UA4+BEl1zRd5C44Fw0Lmp4N0OmH7un0x8B3EIxTVOUIUBVaE0vrfZ21dzVcKjQ3LaPHG
         cq9A==
X-Forwarded-Encrypted: i=1; AFNElJ989hIA4768ttRgj6rP2y43dy16gfZNOGtniIKA2nz5bHPZlpAuSUbSO/fOrz14V20lStanW2AAtxU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuNp7PCE5LHhc4u4ncKlSjDVaM//Lf1QtTWvYOwymSVex7VBIg
	K3J1v97uq7HThbBhKjy/mI6hoA6IQnxWO9CiT6Tgmqt7AHQk1wj7+t44k6rIFN9or8ysnfqNY4L
	BdqiJm1vmGgysTnGDIaKT7N9jLikY4l3w8A5DXlvhZjUqj/BTTxS3usbaOPoQHsPvslxp1tTolK
	O0
X-Gm-Gg: Acq92OHx4NU+9ZhPJfhw1BGNLYtHjofuKL2rpr8Wi8/3CvfLMRM+2225QyZSgeArtf3
	9cOCVU5/zSIILEMaq2g6SmlVvhk487kzVoaROMwxmLvbb/bUETlvS8s0dzY/my1HmqlcrooiWFu
	m02w3S7hx2FeVx+hoUv/eTfSIzJ7QfpcU9fCuMotP4juK/wPH6R0kRij122VJDpY15TwojbrfuO
	IaIi0pTTMapH8dXbRhTF9HAZ/yPKTl46tGNY1viEHfmzed7N5oDPgSQiPvkYn4L9uTfXhTrUmP7
	3WKSjEq7QvBMI9YeIqybZZYqi5RzL/laD46++r/TrkO4b3sHQVfXizUgTln7d7PHj6qr9VTE/RR
	HbfCnULo0P6bpXIK7etLHAuGG8SeVdFICGcintTYZiPs=
X-Received: by 2002:a05:600c:5298:b0:490:778:4fec with SMTP id 5b1f17b1804b1-490428e02d3mr167202395e9.33.1779607648196;
        Sun, 24 May 2026 00:27:28 -0700 (PDT)
X-Received: by 2002:a05:600c:5298:b0:490:778:4fec with SMTP id 5b1f17b1804b1-490428e02d3mr167202145e9.33.1779607647720;
        Sun, 24 May 2026 00:27:27 -0700 (PDT)
Date: Sun, 24 May 2026 03:27:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: qemu-devel@nongnu.org, Alexey Gerasimenko <x1917x@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/4] pc/xen: Xen Q35 support: provide IRQ handling for
 PCI devices
Message-ID: <20260524031521-mutt-send-email-mst@kernel.org>
References: <20260313164649.794591-1-thierry.escande@vates.tech>
 <20260313164649.794591-2-thierry.escande@vates.tech>
MIME-Version: 1.0
In-Reply-To: <20260313164649.794591-2-thierry.escande@vates.tech>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xT19KTREeHPgkfaSsaLPS50vf7X1QDucHw-xPxyB4As_1779607648
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-purgate-ID: tlsNG-16d1c6/1779607652-84F63D75-173A69F9/0/0
X-purgate-type: clean
X-purgate-size: 7862
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FREEMAIL_CC(0.00)[nongnu.org,gmail.com,redhat.com,linaro.org,habkost.net,xenproject.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mst@redhat.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:qemu-devel@nongnu.org,m:x1917x@gmail.com,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:eduardo@habkost.net,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[mst@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: D3BAD5C197C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:47:07PM +0000, Thierry Escande wrote:
> From: Alexey Gerasimenko <x1917x@gmail.com>
> 
> This patch introduces support for ICH9 LPC PCI interrupt routing when
> running under Xen. This intercepts writes to the PIRQA-D routing
> registers and propagates routing changes to the Xen device model via
> xen_set_pci_link_route().
> 
> A major difference between i440 and Q35 is the number of PIRQ inputs and
> PIRQ routers (PCI IRQ links in terms of ACPI) available. i440 has 4 PCI
> interrupt links, while Q35 has 8 (PIRQA...PIRQH). Currently Xen has
> support for only 4 PCI links, so we describe only 4 of 8 PCI links in
> ACPI tables. Also, hvmloader disables PIRQ routing for PIRQE..PIRQH by
> writing 80h into corresponding PIRQ[n]_ROUT registers.
> 
> All this PCI interrupt routing stuff largely concerns legacy mechanism
> from PIC era. It's hardly worth to extend number of PCI links supported
> as we normally deal with APIC mode and/or MSI interrupts.
> 
> The only useful thing to do with PIRQE..PIRQH routing currently is to
> check if guest actually attempts to use it for some reason (despite ACPI
> PCI routing information provided). In this case, a warning is reported.
> 
> This has been tested on Linux guests with noapic and pci=nomsi kernel
> parameters set.
> 
> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  hw/i386/pc_piix.c     |  2 --
>  hw/i386/xen/xen-hvm.c | 38 ++++++++++++++++++++++++++++++++++++++
>  hw/isa/lpc_ich9.c     | 16 +++++++++++++---
>  include/hw/xen/xen.h  |  5 +++++
>  stubs/xen-hw-stub.c   |  4 ++++
>  5 files changed, 60 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 4d71e0d51a..a65e09e46c 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -66,8 +66,6 @@
>  #include "hw/i386/acpi-build.h"
>  #include "target/i386/cpu.h"
>  
> -#define XEN_IOAPIC_NUM_PIRQS 128ULL
> -
>  static GlobalProperty pc_piix_compat_defaults[] = {
>      { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "true" },
>      { TYPE_VFIO_PCI_NOHOTPLUG, "use-legacy-x86-rom", "true" },
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 67d3e836eb..2dba289e09 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -18,6 +18,7 @@
>  #include "hw/core/hw-error.h"
>  #include "hw/i386/pc.h"
>  #include "hw/core/irq.h"
> +#include "hw/southbridge/ich9.h"
>  #include "hw/i386/apic-msidef.h"
>  #include "hw/xen/xen-x86.h"
>  #include "qemu/range.h"
> @@ -87,6 +88,43 @@ int xen_set_pci_link_route(uint8_t link, uint8_t irq)
>      return xendevicemodel_set_pci_link_route(xen_dmod, xen_domid, link, irq);
>  }
>  
> +void xen_ich9_pci_write_config_client(PCIDevice *pci_dev, uint32_t address, uint32_t val, int len)
> +{
> +    static bool pirqe_f_warned = false;
> +    int i;
> +
> +    if (ranges_overlap(address, len, ICH9_LPC_PIRQA_ROUT, 4)) {
> +        /* handle PIRQA..PIRQD routing */
> +        /* Scan for updates to PCI link routes (0x60-0x63). */
> +        for (i = 0; i < len; i++) {
> +            uint8_t v = (val >> (8 * i)) & 0xff;
> +            if (v & 0x80) {
> +                v = 0;
> +            }
> +            v &= 0xf;
> +            if (((address + i) >= ICH9_LPC_PIRQA_ROUT) &&
> +                ((address + i) <= ICH9_LPC_PIRQD_ROUT)) {
> +                xen_set_pci_link_route(address + i - ICH9_LPC_PIRQA_ROUT, v);
> +            }
> +        }
> +    } else if (ranges_overlap(address, len, ICH9_LPC_PIRQE_ROUT, 4)) {
> +        while (len--) {
> +            if (range_covers_byte(ICH9_LPC_PIRQE_ROUT, 4, address) &&
> +                (val & 0x80) == 0) {
> +                /* print warning only once */
> +                if (!pirqe_f_warned) {
> +                    pirqe_f_warned = true;
> +                    warn_report("WARNING: guest domain attempted to use PIRQ%c "
> +                                "routing which is not supported for Xen/Q35 currently\n",
> +                                (char)(address - ICH9_LPC_PIRQE_ROUT + 'E'));
> +                    break;
> +                }
> +            }
> +            address++, val >>= 8;
> +        }
> +    }
> +}
> +
>  int xen_is_pirq_msi(uint32_t msi_data)
>  {
>      /* If vector is 0, the msi is remapped into a pirq, passed as
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 51dc680029..8c627f0734 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -46,8 +46,10 @@
>  #include "hw/acpi/ich9_timer.h"
>  #include "hw/pci/pci_bus.h"
>  #include "hw/core/qdev-properties.h"
> +#include "hw/xen/xen.h"
>  #include "system/runstate.h"
>  #include "system/system.h"
> +#include "system/xen.h"
>  #include "hw/core/cpu.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "qemu/cutils.h"
> @@ -569,6 +571,9 @@ static void ich9_lpc_config_write(PCIDevice *d,
>      ICH9LPCState *lpc = ICH9_LPC_DEVICE(d);
>      uint32_t rcba_old = pci_get_long(d->config + ICH9_LPC_RCBA);
>  
> +    if (xen_enabled()){

Coding style violation.


> +        xen_ich9_pci_write_config_client(d, addr, val, len);
> +    }
>      pci_default_write_config(d, addr, val, len);
>      if (ranges_overlap(addr, len, ICH9_LPC_PMBASE, 4) ||
>          ranges_overlap(addr, len, ICH9_LPC_ACPI_CTRL, 1)) {
> @@ -762,9 +767,14 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
>      irq = object_property_get_uint(OBJECT(&lpc->rtc), "irq", &error_fatal);
>      isa_connect_gpio_out(ISA_DEVICE(&lpc->rtc), 0, irq);
>  
> -    pci_bus_irqs(pci_bus, ich9_lpc_set_irq, d, ICH9_LPC_NB_PIRQS);
> -    pci_bus_map_irqs(pci_bus, ich9_lpc_map_irq);
> -    pci_bus_set_route_irq_fn(pci_bus, ich9_route_intx_pin_to_irq);
> +    if (xen_enabled()) {
> +        pci_bus_irqs(pci_bus, xen_intx_set_irq, d, XEN_IOAPIC_NUM_PIRQS);
> +        pci_bus_map_irqs(pci_bus, xen_pci_slot_get_pirq);
> +    } else {
> +        pci_bus_irqs(pci_bus, ich9_lpc_set_irq, d, ICH9_LPC_NB_PIRQS);
> +        pci_bus_map_irqs(pci_bus, ich9_lpc_map_irq);
> +        pci_bus_set_route_irq_fn(pci_bus, ich9_route_intx_pin_to_irq);
> +    }
>  
>      ich9_lpc_pm_init(lpc);
>  }
> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> index e94c6e5a31..910289b54d 100644
> --- a/include/hw/xen/xen.h
> +++ b/include/hw/xen/xen.h
> @@ -24,6 +24,8 @@
>  #define __XEN_INTERFACE_VERSION__ 0x00040e00
>  #endif
>  
> +#define XEN_IOAPIC_NUM_PIRQS 128ULL
> +
>  /* xen-machine.c */
>  enum xen_mode {
>      XEN_DISABLED = 0, /* xen support disabled (default) */
> @@ -39,6 +41,9 @@ extern bool xen_is_stubdomain;
>  int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
>  int xen_set_pci_link_route(uint8_t link, uint8_t irq);
>  void xen_intx_set_irq(void *opaque, int irq_num, int level);
> +void xen_ich9_pci_write_config_client(PCIDevice *pci_dev,
> +                                      uint32_t address, uint32_t val,
> +                                      int len);
>  void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
>  int xen_is_pirq_msi(uint32_t msi_data);
>  
> diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
> index 6cf0e9a4c1..a74209d01e 100644
> --- a/stubs/xen-hw-stub.c
> +++ b/stubs/xen-hw-stub.c
> @@ -24,6 +24,10 @@ int xen_set_pci_link_route(uint8_t link, uint8_t irq)
>      return -1;
>  }
>  
> +void xen_ich9_pci_write_config_client(PCIDevice *pci_dev, uint32_t address, uint32_t val, int len)
> +{
> +}
> +
>  int xen_is_pirq_msi(uint32_t msi_data)
>  {
>      return 0;
> -- 
> 2.51.0
> 
> 
> 
> --
> Thierry Escande | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech


