Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 686D93B32A4
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 17:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146886.270439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRNI-0005VH-U0; Thu, 24 Jun 2021 15:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146886.270439; Thu, 24 Jun 2021 15:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRNI-0005TN-Qj; Thu, 24 Jun 2021 15:34:40 +0000
Received: by outflank-mailman (input) for mailman id 146886;
 Thu, 24 Jun 2021 15:34:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6vq+=LS=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lwRNG-0005TH-Vq
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 15:34:39 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9dbc0e12-473e-462c-b95d-23d6b43ba86b;
 Thu, 24 Jun 2021 15:34:38 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a13so7145699wrf.10
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jun 2021 08:34:38 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:e5c2:6da2:5433:99b5?
 ([2a00:23c5:5785:9a01:e5c2:6da2:5433:99b5])
 by smtp.gmail.com with ESMTPSA id p187sm3432664wmp.28.2021.06.24.08.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 08:34:36 -0700 (PDT)
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
X-Inumbo-ID: 9dbc0e12-473e-462c-b95d-23d6b43ba86b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6kXIpn+CEL9LTQWBFHZphYo5c1xea3b9mMMiHyfB8rg=;
        b=DrLci0requssIiZEPFJyXyHXuOC490++yMlCI24o+z90Xk8RfEdgpHX5SJPIVWulUt
         H903Rh8q8zMR0+uHp9qiZ342Zq/25q0TjbXbdB+QMQEZxO/PDsKViHUYLIJkGtoNwqGn
         GwaoaYtVazU6ycPricgI5mcUwwBdpduhz4XHQEB+CU6YkhPgsJcPR0Dy1CveQqpMMMzw
         u9azIkMqbdxrIeIBqbh0ZEBxVo8ZTamPYT8gV0h8cTtkLLyq5TVBCMPq+RsCyCTSTeka
         pjAJnmhqP1F95rIhOyN5iPg7VhFidWaas4kW4hEPtM5IBJIrRxYcc/IrmaadZ6IZJ+Hw
         QPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6kXIpn+CEL9LTQWBFHZphYo5c1xea3b9mMMiHyfB8rg=;
        b=euwf8sShj5q4ZsAdGik4GN1PCuHSGcdZZVPIA7715olpoEIijSyo3NGY5RorIMues5
         /FJ0DGHFARKQgQKd8WgmKKXKmHHR9/N63WHFQNJ3sCaX1auG5LAg/2Ad0J8sZc6t+Qp1
         104DiWiyscWFb/JKNNX8z4UU9SUCxkMkJWMYRS9fMc6qNzGr3onv7SGpDcIVlLNOAwg0
         rSIM9TyDJFPfjz5010KV4IKBbuilTFM6Wi/CCesaA1Ny10aEXxLCrg63iiu9YRbZRk8c
         Sm6onalvldPTD3FkMRFyWcANgBOt0QYzOSR1RIwqgo/knjF0j2aAgrd2irSRZQk43ZHH
         KqWw==
X-Gm-Message-State: AOAM532dm2pbebiSjzY8OyNBPRTSPQYVPHY6TpRo+eHs4KyyJC5X6wRp
	iEXDh/6nqTeKKYvR4Oni9+s=
X-Google-Smtp-Source: ABdhPJxTu8t8wSDUGP6dHGJSpOfjktTfnd3RthCV7lbDROIQbNV/i55bhMxxccJv7bpAweQN9TVFqQ==
X-Received: by 2002:adf:fc8e:: with SMTP id g14mr5090300wrr.411.1624548877232;
        Thu, 24 Jun 2021 08:34:37 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH 9/9] IOMMU/PCI: don't let domain cleanup continue when
 device de-assignment failed
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <1a7b974c-8dee-3422-28fb-4118fe145b4e@suse.com>
Message-ID: <7c5a4244-8f33-0705-f518-0b4e9a0e7cb4@xen.org>
Date: Thu, 24 Jun 2021 16:34:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1a7b974c-8dee-3422-28fb-4118fe145b4e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/06/2021 10:30, Jan Beulich wrote:
> Failure here could in principle mean the device may still be issuing DMA
> requests, which would continue to be translated by the page tables the
> device entry currently points at. With this we cannot allow the
> subsequent cleanup step of freeing the page tables to occur, to prevent
> use-after-free issues. We would need to accept, for the time being, that
> in such a case the remaining domain resources will all be leaked, and
> the domain will continue to exist as a zombie.
> 
> However, with flushes no longer timing out (and with proper timeout
> detection for device I/O TLB flushing yet to be implemented), there's no
> way anymore for failures to occur, except due to bugs elsewhere. Hence
> the change here is merely a "just in case" one.
> 
> In order to continue the loop in spite of an error, we can't use
> pci_get_pdev_by_domain() anymore. I have no idea why it was used here in
> the first place, instead of the cheaper list iteration.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> A first step beyond this could be to have the backing functions of
> deassign_device() allow the caller to tell whether the failure was from
> removing the device from the domain being cleaned up, or from re-setup
> in wherever the device was supposed to get moved to. In the latter case
> we could allow domain cleanup to continue. I wonder whether we could
> simply make those functions return "success" anyway, overriding their
> returning of an error when ->is_dying is set.
> 
> A next step then might be to figure whether there's any "emergency"
> adjustment that could be done instead of the full-fledged (and failed)
> de-assign, to allow at least recovering all the memory from the guest.
> 
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -894,7 +894,7 @@ static int deassign_device(struct domain
>   
>   int pci_release_devices(struct domain *d)
>   {
> -    struct pci_dev *pdev;
> +    struct pci_dev *pdev, *tmp;
>       u8 bus, devfn;
>       int ret;
>   
> @@ -905,15 +905,15 @@ int pci_release_devices(struct domain *d
>           pcidevs_unlock();
>           return ret;
>       }
> -    while ( (pdev = pci_get_pdev_by_domain(d, -1, -1, -1)) )
> +    list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
>       {
>           bus = pdev->bus;
>           devfn = pdev->devfn;
> -        deassign_device(d, pdev->seg, bus, devfn);
> +        ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;
>       }
>       pcidevs_unlock();
>   
> -    return 0;
> +    return ret;
>   }
>   
>   #define PCI_CLASS_BRIDGE_HOST    0x0600
> 


