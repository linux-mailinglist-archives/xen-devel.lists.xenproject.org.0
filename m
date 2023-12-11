Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 878C680CF98
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 16:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652318.1018096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCiIF-0005cC-2V; Mon, 11 Dec 2023 15:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652318.1018096; Mon, 11 Dec 2023 15:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCiIE-0005aX-W0; Mon, 11 Dec 2023 15:34:02 +0000
Received: by outflank-mailman (input) for mailman id 652318;
 Mon, 11 Dec 2023 15:34:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojZ6=HW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rCiID-0005aP-Bm
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 15:34:01 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4b89cfc-983a-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 16:34:00 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c3984f0cdso29137015e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 07:34:00 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b0040b3e26872dsm15680589wms.8.2023.12.11.07.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 07:33:59 -0800 (PST)
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
X-Inumbo-ID: b4b89cfc-983a-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702308840; x=1702913640; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+rCAEtkjC3HUaAf6Tu6nFfjQarIcejRK8RObA6IV88Y=;
        b=meEZaTBqm8OYiEv5iUpM2NDs1Gi6EostKjp/yCgTVftH90UuH+HdVktNEhNbmGm91T
         Umk/1l5yCHE3H2BUbga7HMHuUm9SpUJVY6b/s78pJnyiQ3zfshyaMdgF5/jiTzMS+leH
         1BFCar0NT6QTshKk2PILfRxi2O0BCkvBbd6hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702308840; x=1702913640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rCAEtkjC3HUaAf6Tu6nFfjQarIcejRK8RObA6IV88Y=;
        b=qJBx/0iUSqXTqoFJzrmi+oA6IFDlgodsByFNGG7iemF04aZN5MJ4BXzDziN2i3CNsp
         633BpWBQS8h6xS0CieWmluLlAIHvnwwDPYRS7OVlaRJoXfdbPkswrfOsRXNKCKXN+Ydp
         eWnnQb/BwiMsVWJMkUsaCyN6eMi27VY7ajUDV0yZmtRztLpPrs4i0zW7hIX+XuYOsoH+
         /39j4ZmJdj9n4GWtlavgG/DDpvv+7WD4OUb40uHFnjIgROtC41JUhSG99zJH3ayfABmj
         C49I9STi9AUT2F4AnrQpeONnIsVILSWO4RYRCIfB9Ldm08zVP8fICBf+1md3/6KRRsaO
         3OHA==
X-Gm-Message-State: AOJu0Ywt0sT3CE+gD1SbDfPjboaXVuEDghSCE49P1yz+MKpNCmqpDknU
	JFGrM5jxOZh0xJH5aSG3QKEwYQ==
X-Google-Smtp-Source: AGHT+IFAQs+DMCXrumDmAH9uw/y1g0aNk95EuxaFkJFlLVu4MJZejlRuz1WTaTu1aRicZzj4fSW8PQ==
X-Received: by 2002:a7b:cb89:0:b0:409:19a0:d247 with SMTP id m9-20020a7bcb89000000b0040919a0d247mr2276592wmi.18.1702308839878;
        Mon, 11 Dec 2023 07:33:59 -0800 (PST)
Date: Mon, 11 Dec 2023 16:33:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org,
	xen-devel@lists.xenproject.org,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Alex Deucher <Alexander.Deucher@amd.com>,
	Huang Rui <Ray.Huang@amd.com>,
	Honglei Huang <Honglei1.Huang@amd.com>,
	Julia Zhang <Julia.Zhang@amd.com>
Subject: Re: [RFC QEMU PATCH v3 1/1] xen: Use gsi instead of irq for mapping
 pirq
Message-ID: <ZXcr5v43dsJAx8aK@macbook>
References: <20231210165240.1551450-1-Jiqian.Chen@amd.com>
 <20231210165240.1551450-2-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231210165240.1551450-2-Jiqian.Chen@amd.com>

On Mon, Dec 11, 2023 at 12:52:40AM +0800, Jiqian Chen wrote:
> In PVH dom0, it uses the linux local interrupt mechanism,
> when it allocs irq for a gsi, it is dynamic, and follow
> the principle of applying first, distributing first. And
> the irq number is alloced from small to large, but the
> applying gsi number is not, may gsi 38 comes before gsi
> 28, that causes the irq number is not equal with the gsi
> number. And when passthrough a device, qemu wants to use
> gsi to map pirq, xen_pt_realize->xc_physdev_map_pirq, but
> the gsi number is got from file
> /sys/bus/pci/devices/<sbdf>/irq in current code, so it
> will fail when mapping.
> 
> Use real gsi number read from gsi sysfs.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  hw/xen/xen-host-pci-device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
> index 8c6e9a1716..e270ac2631 100644
> --- a/hw/xen/xen-host-pci-device.c
> +++ b/hw/xen/xen-host-pci-device.c
> @@ -364,7 +364,7 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
>      }
>      d->device_id = v;
>  
> -    xen_host_pci_get_dec_value(d, "irq", &v, errp);
> +    xen_host_pci_get_dec_value(d, "gsi", &v, errp);

Don't you need to fallthrough to use the irq number on failure?
Otherwise passthrough won't work on older Linux versions that don't
expose the gsi node.

Thanks, Roger.

