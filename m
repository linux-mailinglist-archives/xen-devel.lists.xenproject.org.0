Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A52826D94
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 13:15:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663455.1033398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMoWd-0000tG-Ec; Mon, 08 Jan 2024 12:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663455.1033398; Mon, 08 Jan 2024 12:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMoWd-0000rg-Bj; Mon, 08 Jan 2024 12:14:39 +0000
Received: by outflank-mailman (input) for mailman id 663455;
 Mon, 08 Jan 2024 12:14:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CI6F=IS=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rMoWb-0000qG-Sr
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 12:14:37 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cb5b3ab-ae1f-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 13:14:35 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e45504006so6102925e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 04:14:35 -0800 (PST)
Received: from [192.168.1.102] ([176.176.175.62])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d558b000000b003367bb8898dsm7625577wrv.66.2024.01.08.04.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 04:14:34 -0800 (PST)
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
X-Inumbo-ID: 7cb5b3ab-ae1f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704716075; x=1705320875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pTv62+lrN+LJDOyyZzZUKji6+pubYOy60kmzZvHd3z4=;
        b=ANR00PqgDJPDzHgpMG4FAsrtOLBO3hhNw/BABOQF8rsNkOiyP6V0tFbAA+KeTJTzou
         DqjYszddw2gI3/x87yP56IbbmO/XLgoD4y4FWY9ep65nOkmXPr+W0Yd7RQH/N89cLxnV
         8xu+guGcM97JXf4WQ8iv/rS8JKF0mhupQb4yeVGbyiRFL1IlRwDDYaWAVQGhu1TaMjdX
         dAVtRHJtQHVYul9ZE/U6IKuJmJdAXf/1Cyp6b/wIinUeZKkR4H4qRh/5Z1XNKfcSPYdR
         lGrDp/enqWUuo5FdRZCixa7UbxQcocZ0LF41CTUYc1WUrTtSYWkJIRLwjhD8a1B9PzBL
         leyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704716075; x=1705320875;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pTv62+lrN+LJDOyyZzZUKji6+pubYOy60kmzZvHd3z4=;
        b=ss5vdBVFvl03ISyFsm/GSfdPCVvdyvjs9CIpbLzkVdjZJYCS6QtkWMfyu2VgFAadVw
         pJKiQ13lGXWw7QPx6upqQIOzpJay+jFF7m6KOD/ftsnDE4SqkYTwXL6cYD4AdwSnWynd
         1eMYpJ5WuSkw+q1GKnJwQYPPFKFx6ohs6qBWKgEnZOIdUL3E17AiR4HzEO4GSYZOw1xt
         i95m/Cv1YtnY4yXpOkXeKYLhNVneOxFmky8qNDHmA66HQ2YIrbvOosZGbaWNzxdJej6B
         ufi3gUuvam8GKbUFCbboWUev0+qq0ClH52zBIM8FkzvJtTNDWE/GGu/vrQo7M+viblDi
         Lc5Q==
X-Gm-Message-State: AOJu0YzXGTSRcnc5pQ+WEvIo7/Xy18sGTvhb+LGw5JYE2BxE05KKFAkr
	G6hzRVOXbTSqOM1Uy72/mSalAjyU8cDwfg==
X-Google-Smtp-Source: AGHT+IGxCyPZI3LhIKghuQNTCsPq8RlSvMV1g4746yYM5AkZRdonIiznbdeKS14OHtcSSqqKiec3+g==
X-Received: by 2002:a7b:c8c3:0:b0:40d:8a57:796e with SMTP id f3-20020a7bc8c3000000b0040d8a57796emr1691872wml.154.1704716075055;
        Mon, 08 Jan 2024 04:14:35 -0800 (PST)
Message-ID: <d818e085-40e8-4916-b72d-1c105bea5e9a@linaro.org>
Date: Mon, 8 Jan 2024 13:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/i386/pc_piix: Make piix_intx_routing_notifier_xen()
 more device independent
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Chuck Zmudzinski <brchuckz@aol.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20240107231623.5282-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240107231623.5282-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/1/24 00:16, Bernhard Beschow wrote:
> This is a follow-up on commit 89965db43cce "hw/isa/piix3: Avoid Xen-specific
> variant of piix3_write_config()" which introduced
> piix_intx_routing_notifier_xen(). This function is implemented in board code but
> accesses the PCI configuration space of the PIIX ISA function to determine the
> PCI interrupt routes. Avoid this by reusing pci_device_route_intx_to_irq() which
> makes piix_intx_routing_notifier_xen() more device-agnostic.
> 
> One remaining improvement would be making piix_intx_routing_notifier_xen()
> agnostic towards the number of PCI interrupt routes and move it to xen-hvm.
> This might be useful for possible Q35 Xen efforts but remains a future exercise
> for now.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 042c13cdbc..abfcfe4d2b 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -92,13 +92,10 @@ static void piix_intx_routing_notifier_xen(PCIDevice *dev)
>   {
>       int i;
>   
> -    /* Scan for updates to PCI link routes (0x60-0x63). */
> +    /* Scan for updates to PCI link routes. */
>       for (i = 0; i < PIIX_NUM_PIRQS; i++) {
> -        uint8_t v = dev->config_read(dev, PIIX_PIRQCA + i, 1);
> -        if (v & 0x80) {
> -            v = 0;
> -        }
> -        v &= 0xf;
> +        const PCIINTxRoute route = pci_device_route_intx_to_irq(dev, i);

This indeed dispatch to piix_route_intx_pin_to_irq().

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        const uint8_t v = route.mode == PCI_INTX_ENABLED ? route.irq : 0;
>           xen_set_pci_link_route(i, v);
>       }
>   }


