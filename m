Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309E36EA4FC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 09:38:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524474.815445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pplLF-0001f2-HY; Fri, 21 Apr 2023 07:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524474.815445; Fri, 21 Apr 2023 07:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pplLF-0001bi-Dw; Fri, 21 Apr 2023 07:38:01 +0000
Received: by outflank-mailman (input) for mailman id 524474;
 Fri, 21 Apr 2023 07:38:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E/dH=AM=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pplLE-0001bc-07
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 07:38:00 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e76b743-e017-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 09:37:58 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-B9oZYoPBOK6bJ9bUyAxu8A-1; Fri, 21 Apr 2023 03:37:53 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f16ef3bf06so5237725e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Apr 2023 00:37:53 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 y24-20020a7bcd98000000b003ee70225ed2sm4038602wmj.15.2023.04.21.00.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 00:37:51 -0700 (PDT)
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
X-Inumbo-ID: 6e76b743-e017-11ed-b220-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682062675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YAVbavJ95/H15qsA862i/P/RT/8yRxcuw2Hq9F2q0s8=;
	b=DeyEyRyR/Aqpo5j8d5V7BPBki3LPJOFGRZ0pnZO2Sqhvva51QxNuS0+bmbtYf5GJmoiXH8
	G1WxP4Ua++DRwMBIcFYCR3nkhQqc/khp5DKlYd3a4clfXz+XloMEk8Z2FUt6+9FNzm81OZ
	OM3/AfWFTbkL0sKCMbqJE+F72kZxJ0E=
X-MC-Unique: B9oZYoPBOK6bJ9bUyAxu8A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682062672; x=1684654672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAVbavJ95/H15qsA862i/P/RT/8yRxcuw2Hq9F2q0s8=;
        b=lJWSeswTI37J4NyXn3mtQibag5RymQFlChdpLYsJMaQXB3TVnwn1jkVFmPRm45LTPt
         Ucxq2ZAbps6nl2820vSyX7AvrMNO0KAB2aL27x74JqKbG/uNOYQ221EaIMRINO8GN1jC
         fL352eyKaJNx43LVRHMx8bKt4K4/nYY54hh3PoQVRcIAFSwFv0Kkytaw0K0oaPtFuSQW
         unY7n7v4eImI/rvVRYN15M3B6EZT57B2n+UjYPppSNKilUxcsdSB+zzNaQn6mOOfniCZ
         yPNwCQyhEuSmg4HuxgVC2zuWoZzfDO2eA7Ong0nPtWKMl4y5b1C0+l+8fG1usAA77PjH
         qoHg==
X-Gm-Message-State: AAQBX9fEoEV6cGWD/4zsp/1Rhf7mBklVnhUHKr8osnmJSXtC94qkODSP
	4IamVAqpBrNbKM6QDjkyE+mh61AxUvItvzboUL6i16A9qrKxTZW42CXrPOa2n96pmpRdurDblTI
	vwhA7IhcIzlSVBxB2ZRjIMK8BbjA=
X-Received: by 2002:a1c:6a08:0:b0:3f1:7ea7:20e5 with SMTP id f8-20020a1c6a08000000b003f17ea720e5mr1053136wmc.17.1682062672736;
        Fri, 21 Apr 2023 00:37:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350aR+9rlW20eiWFQtSTgUAy6ULPnusZFxVacZlysZGxGS7xYybJEO//EPI+qe4seUXgWAwxoWA==
X-Received: by 2002:a1c:6a08:0:b0:3f1:7ea7:20e5 with SMTP id f8-20020a1c6a08000000b003f17ea720e5mr1053125wmc.17.1682062672470;
        Fri, 21 Apr 2023 00:37:52 -0700 (PDT)
Date: Fri, 21 Apr 2023 03:37:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Chuck Zmudzinski <brchuckz@aol.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/7] hw/pci/pci.c: Don't leak PCIBus::irq_count[] in
 pci_bus_irqs()
Message-ID: <20230421033735-mutt-send-email-mst@kernel.org>
References: <20230403074124.3925-1-shentey@gmail.com>
 <20230403074124.3925-3-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230403074124.3925-3-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 03, 2023 at 09:41:19AM +0200, Bernhard Beschow wrote:
> When calling pci_bus_irqs() multiple times on the same object without calling
> pci_bus_irqs_cleanup() in between PCIBus::irq_count[] is currently leaked.
> Let's fix this because Xen will do just that in a few commits, and because
> calling pci_bus_irqs_cleanup() in between seems fragile and cumbersome.
> 
> Note that pci_bus_irqs_cleanup() now has to NULL irq_count such that
> pci_bus_irqs() doesn't do a double free.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

ok

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


> ---
>  hw/pci/pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index def5000e7b..be1c5d16ec 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -558,6 +558,7 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
>      bus->set_irq = set_irq;
>      bus->irq_opaque = irq_opaque;
>      bus->nirq = nirq;
> +    g_free(bus->irq_count);
>      bus->irq_count = g_malloc0(nirq * sizeof(bus->irq_count[0]));
>  }
>  
> @@ -573,6 +574,7 @@ void pci_bus_irqs_cleanup(PCIBus *bus)
>      bus->irq_opaque = NULL;
>      bus->nirq = 0;
>      g_free(bus->irq_count);
> +    bus->irq_count = NULL;
>  }
>  
>  PCIBus *pci_register_root_bus(DeviceState *parent, const char *name,
> -- 
> 2.40.0


