Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611D1B2F514
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 12:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088371.1446142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2P8-0000pa-Du; Thu, 21 Aug 2025 10:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088371.1446142; Thu, 21 Aug 2025 10:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2P8-0000nU-BC; Thu, 21 Aug 2025 10:20:22 +0000
Received: by outflank-mailman (input) for mailman id 1088371;
 Thu, 21 Aug 2025 10:20:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+vP=3B=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1up2P6-0000nO-VK
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 10:20:20 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7075ee85-7e78-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 12:20:19 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45a1b05ac1eso4558495e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 03:20:19 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b4dc255f9sm23770565e9.21.2025.08.21.03.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 03:20:18 -0700 (PDT)
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
X-Inumbo-ID: 7075ee85-7e78-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755771619; x=1756376419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aUnZo7Id21mgTIGS1ZFraKZsG6ED1eIjmW/9bEyC7Jo=;
        b=bHmB29eS+4v9Cqm6omtYH6TWiuFijY8ZwOEq9i97BGMLR81TOQ7c7jJqKj5h8dMN1E
         gFGnvHnIMPt3o6GtO/Y35SW0Do3LJFXoQbavj6vA5k6PpoYirzUGtIJVKra2t+n1C0Rv
         19YCN4hS/zWySxxb2sGM9DQWk9kbgFawuilOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755771619; x=1756376419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUnZo7Id21mgTIGS1ZFraKZsG6ED1eIjmW/9bEyC7Jo=;
        b=jZljkkRZdFUnBWDrDAMr2GERF2mBCVo7nA+21GnWSe7FLMz9U51qBnhLTCCDkqZK++
         ZWzkI+I+t4JN3U+GRN079AENJaCxxysm+htcnCmB3t2kaB60TY5qD1abCWpZscNtsKch
         LMhGB6NLXCtF43uzIPpzJTBWVFmAdaL87rFCT3R9M7OR55hDwxGDMc0xz9AO93ZQuvpO
         DwNvqAafxAHCI3RX1AP5BJO8jn3zTJljJQ3cyynYHCyqAmPGnlQP1XuXpjI9q5I5bsm8
         RwZXEkhI7ZGbHECAtoQ+FMBjngp0LSzW3DP4tNpHc/JI9JFMY6dJmsAmtYz88OWZVgw7
         6OqA==
X-Forwarded-Encrypted: i=1; AJvYcCW8LRcS731NtcQRY9YGEps+Bpgkx6+ABVaURjsglfhfWIlo+fUtdLmLOsjiIBtQYynF49JlVB2XQeo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylPpWM80Cxo+s6WxMcjd1rlEHW4xj5m5HAue30UaNjm8emsmnS
	YwN9BiwpgyjXJir8gpo3+M5OplDqhOYkmM1H7Xp8twKn7VVJi3GjDydwKosSJR9We/w=
X-Gm-Gg: ASbGnct5LdkRs0286IWqGz1gtQG/Kw1b+jreAEvX/6sc7RX0Nl4Ak4x2IiGfxdM/m+j
	WTRABNl8iyxFrqyHMflCZ14JYuzOZz89XSqzyhEKaaY9MUmJIXqsGZqIE25y8IIzTF/arEsAU1+
	2f2l057nsjUhnJZP/xRogjW6xMuSHLhV/SRr48cW0OknGT+lH28RHnwglWCeCMzNQ0dIxVfe6zT
	ExtLJgjKQiUjJHhdWHkT+5y9drQUrGSMqp+JH2/hstXQWDJXSwD3DMWiGi9vi3aLbxGRXL1qudu
	M6zLeoGn0+49RozfRk/pIV5Wd5MODt/gquZClmh9NNK9FyD8i43Rkj94fOFqANY0uX68AjJEu3t
	f8nQnAAoTUDTjuTETK2iF7p/kgpSL/yBOtL3JEjKtXIrRONbo13zd1MpzsUiJpRFZR3+m
X-Google-Smtp-Source: AGHT+IGeeWorFvmATh072IOD+0EffvhoFHVvaw1kcaYCax0Fal12LOByxGar6kmz5ShnYUBFkQNmkg==
X-Received: by 2002:a05:600c:1d0e:b0:459:443e:b180 with SMTP id 5b1f17b1804b1-45b4d7cee9amr16906865e9.8.1755771618976;
        Thu, 21 Aug 2025 03:20:18 -0700 (PDT)
Message-ID: <b936284e-bf95-47c5-8ed6-9b8609ddb695@citrix.com>
Date: Thu, 21 Aug 2025 11:20:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] iommu/ipmmu-vmsa: Implement basic PCIE-IPMMU OSID
 support
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1755771103.git.mykyta_poturai@epam.com>
 <b4b99ff1a6009d3c9e70929ce638d19b27c86374.1755771103.git.mykyta_poturai@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b4b99ff1a6009d3c9e70929ce638d19b27c86374.1755771103.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/08/2025 11:15 am, Mykyta Poturai wrote:
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index dac0dd6d46..49f149e222 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -1138,8 +1155,38 @@ static int ipmmu_assign_device(struct domain *d, u8 devfn, struct device *dev,
>      if ( !to_ipmmu(dev) )
>          return -ENODEV;
>  
> -    spin_lock(&xen_domain->lock);
> +#ifdef CONFIG_HAS_PCI
> +    if ( dev_is_pci(dev) )
> +    {
> +        struct pci_dev *pdev = dev_to_pci(dev);
> +        struct domain *old_d = pdev->domain;
> +
> +        /* Ignore calls for phantom functions */
> +        if ( devfn != pdev->devfn )
> +            return 0;
> +
> +        write_lock(&d->pci_lock);
> +        list_move(&pdev->domain_list, &d->pdev_list);
> +        write_unlock(&d->pci_lock);
> +        pdev->domain = d;
> +
> +        /* dom_io is used as a sentinel for quarantined devices */
> +        if ( d == dom_io )
> +        {
> +            int ret;
> +
> +            /*
> +             * Try to de-assign: do not return error if it was already
> +             * de-assigned.
> +             */
> +            ret = ipmmu_deassign_device(old_d, dev);
> +
> +            return ret == -ESRCH ? 0 : ret;
> +        }
> +    }
> +#endif
>  
> +    spin_lock(&xen_domain->lock);

Minor point.  You've removed a newline here, which is why the hunk is
not cleanly ahead of the spin_lock() call.

~Andrew

